Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F7BD2035
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 10:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060A610E3F4;
	Mon, 13 Oct 2025 08:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ISdZI4wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D885410E3F6;
 Mon, 13 Oct 2025 08:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BsnBMuolTqvsPT7+BMVa0VLvdDvZ2NYKCyNaVaqnmEE=; b=ISdZI4wb3SsORzv+ammLaTX+vl
 zUYeUvJhsFOwcdv4P2xZ8fpEYZksM4f5ubW6Qw40QlCyF5sQiyJqS5BqJsOsaSpkBblixbuzmaWlf
 HpfiL1G5wxcdxqm96iyMh4+Ae8gEQd9uKS/cpi2UIDrOTWARwPyLI64od2DBiZlpy+aUk93HwfDQo
 DoTHCKqiNO1Bvq827AlHV6e6eZsELRabRg4wtBMdIhSmi1xqTmMK/AC81qzRnIeiwXbvVuQiFM8Nc
 J/41Ese4m8M9SfXqEgVK3EE4GDvCnb749Q+b6UxzeigAxh2M20nRfnTJG14u5ak8m4IpFlE2i8+Kt
 IIgDkQsw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v8DpQ-008qJ6-3l; Mon, 13 Oct 2025 10:22:48 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v4 0/5] Improving the worst case TTM large allocation latency
Date: Mon, 13 Oct 2025 09:22:35 +0100
Message-ID: <20251013082240.55263-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Disclaimer:
Please note that as this series includes a patch which touches a good number of
drivers I will only copy everyone in the cover letter and the respective patch.
Assumption is people are subscribed to dri-devel so can look at the whole series
there. I know someone is bound to complain for both the case when everyone is
copied on everything for getting too much email, and also for this other case.
So please be flexible.

Description:

All drivers which use the TTM pool allocator end up requesting large order
allocations when allocating large buffers. Those can be slow due memory pressure
and so add latency to buffer creation. But there is often also a size limit
above which contiguous blocks do not bring any performance benefits. This series
allows drivers to say when it is okay for the TTM to try a bit less hard.

We do this by allowing drivers to specify this cut off point when creating the
TTM device and pools. Allocations above this size will skip direct reclaim so
under memory pressure worst case latency will improve. Background reclaim is
still kicked off and both before and after the memory pressure all the TTM pool
buckets remain to be used as they are today.

This is especially interesting if someone has configured MAX_PAGE_ORDER to
higher than the default. And even with the default, with amdgpu for example,
the last patch in the series makes use of the new feature by telling TTM that
above 2MiB we do not expect performance benefits. Which makes TTM not try direct
reclaim for the top bucket (4MiB).

End result is TTM drivers become a tiny bit nicer mm citizens and users benefit
from better worst case buffer creation latencies. As a side benefit we get rid
of two instances of those often very unreadable mutliple nameless booleans
function signatures.

If this sounds interesting and gets merge the invidual drivers can follow up
with patches configuring their thresholds.

v2:
 * Christian suggested to pass in the new data by changing the function signatures.

v3:
 * Moved ttm pool helpers into new ttm_pool_internal.h. (Christian)

v4:
 * Fixed TTM unit test build.

v1 thread:
https://lore.kernel.org/dri-devel/20250919131127.90932-1-tvrtko.ursulin@igalia.com/

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zack.rusin@broadcom.com>

Tvrtko Ursulin (5):
  drm/ttm: Add getter for some pool properties
  drm/ttm: Replace multiple booleans with flags in pool init
  drm/ttm: Replace multiple booleans with flags in device init
  drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
  drm/amdgpu: Configure max beneficial TTM pool allocation order

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  7 +--
 drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           |  4 +-
 drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++----
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 32 +++++--------
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++-----
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  7 +--
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 24 +++++-----
 drivers/gpu/drm/ttm/ttm_device.c              |  7 ++-
 drivers/gpu/drm/ttm/ttm_pool.c                | 45 +++++++++++--------
 drivers/gpu/drm/ttm/ttm_pool_internal.h       | 24 ++++++++++
 drivers/gpu/drm/ttm/ttm_tt.c                  | 10 +++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
 drivers/gpu/drm/xe/xe_device.c                |  2 +-
 include/drm/ttm/ttm_device.h                  |  2 +-
 include/drm/ttm/ttm_pool.h                    | 13 +++---
 21 files changed, 127 insertions(+), 106 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h

-- 
2.48.0

