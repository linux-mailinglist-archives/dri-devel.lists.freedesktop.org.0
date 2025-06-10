Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBBAAD3F4A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 18:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1DF10E5B4;
	Tue, 10 Jun 2025 16:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="haZZw926";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE82F10E326;
 Tue, 10 Jun 2025 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DNcYXqzWPd3Ni6JJNBcKHgqmeyxWYGcGr3oexCbuq04=; b=haZZw926B7qxoxoKGnSFW2JZyi
 wK7ThIGHhiOwCia7WuYBAXfIb/+aM0mpn3yv9KsOfF+n+s63cIZbl9T7AOqS2CCG1LcXH5/K5gD78
 OcNEmqxxQuvSDx8BgUQqZ0OvdcGM4PSZJtfjF+yXWm9YGJgb5rBqzEvWn0dDJuyHfhFCT1FxnnANp
 UZQh78hfnLHqOs9+Cv7NIvzdfljvGl2lF8+Tuyy0XVVKFnQWOJaZSZaW7fO7VWwKjheM1wTbP3hpA
 GY4mZgeXf+7tizqbMDfojn1D59YSUnpLyk5YlpPdo6wwNas7DKJ4tn1hkB8eNIr5uT9CA3vcd2PYm
 RsYx7M8g==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uP23V-001t9c-Jm; Tue, 10 Jun 2025 18:42:33 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 0/4] Fixing some dma-fence use-after-free
Date: Tue, 10 Jun 2025 17:42:22 +0100
Message-ID: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

tl;dr;
Xe and probably some other drivers can tear down the internal state referenced
by an exported sync_file fence which then causes a null pointer derefences on
accessing said fence.

IGT that exploits the problem:
https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2

It seems there is a consensus this is a known problem with the dma-fence design,
where internal state shouldn't really be accessed after the fence has been
signaled. However currently the code is mostly unaware of that hence the use-
after-free potential.

To fix it, between the option of adding more reference counting and trying to
"revoke" the fence, suggestion is to focus on the later.

Reference to the recent discussion:
https://lore.kernel.org/dri-devel/20250418164246.72426-1-tvrtko.ursulin@igalia.com/

This series therefore attempts to implement a solution along those lines.

Most of the description what and how can be found in:
 "dma-fence: Add safe access helpers and document the rules"

The series only addreses the runtime use-after-free scenarios,
such as the above explained situation with the xe driver. For now the module
unload problem is deliberately left for later. (Although again, some of the
patches merged earlier do make it safer, and will make future improvements
easier due fewer accesses to fence->ops.)

Final patch in the series is the one which makes xe compliant with the rules
and API proposed earlier in the series. It does so by ensuring there is at least
one RCU grace period between fences being signaled and driver allocated memory
accessible from xe fences getting freed. 

If this approach is acceptable the next steps will be to see if any other
drivers will need similar changes. And also to discuss whether we want to go a
step futher and later move to SRCU, so code would be protected against module
unload as well.

v2:
 * Dropped module unload handling.
 * Proposing real API instead of hacks.

v3:
 * Dropped the dma_fence_is_array|chain ops to flags conversion.
 * Dropped the i915 cleanup patch which is now independent.
 * Squashed dma-fence helpers with internal usage patches.
 * Restored missing hunk in "dma-fence: Use a flag for 64-bit seqnos".
 * Removed the AMDGPU_JOB_GET_TIMELINE_NAME macro.
 * Applied some r-b tags.

v4:
 * Tidied 64-bit seqno flags patch and fixed for amdgpu user queues which landed
   since.
 * Adjusted some dma-fence tracepoints to avoid asserts.
 * Protected tracepoints in dma_fence_wait_timeout() with the safe access
   annotations.
 * Dropped driver/timeline helper usage from amdgpu_trace.h.
 * Dropped signaled fence protection from i915 timeline name vfunc.

v5:
 * Rebased after prep patches merged.
 * Move dma_fence_access_end() earlier in dma_fence_release(). (Christian)

v6:
 * Replaced dma_fence_access_begin/end with rcu_read_(un)lock. (Christian)
 * Added __rcu annotation to dma_fence_driver|timeline_name() helpers. (Christian)
 * Re-ordered patches to accomodate above changes.

Tvrtko Ursulin (4):
  sync_file: Protect access to driver and timeline name
  drm/i915: Protect access to driver and timeline name
  dma-fence: Add safe access helpers and document the rules
  drm/xe: Make dma-fences compliant with the safe access rules

 drivers/dma-buf/dma-fence.c                  | 111 +++++++++++++++++--
 drivers/dma-buf/sync_file.c                  |  24 +++-
 drivers/gpu/drm/i915/gt/intel_gt_requests.c  |  10 +-
 drivers/gpu/drm/i915/i915_request.c          |   7 +-
 drivers/gpu/drm/i915/i915_sw_fence.c         |  10 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c           |   7 +-
 drivers/gpu/drm/xe/xe_hw_fence.c             |   3 +
 include/linux/dma-fence.h                    |  31 ++++--
 include/trace/events/dma_fence.h             |  38 ++++++-
 10 files changed, 209 insertions(+), 34 deletions(-)

-- 
2.48.0

