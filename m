Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983E698938
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 01:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1010E1C2;
	Thu, 16 Feb 2023 00:23:48 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9BE10E00D;
 Thu, 16 Feb 2023 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676507026; x=1708043026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LcjKVTpoWBOuZ3g30E8RAn5BLgh5Z5qL91JvI7+YNlk=;
 b=ROYBAIhib23KmgDM7nvY/NCAW21yBWtC7rym5HXsoNN5jB64PbK/9/Di
 fP29n1PDI0agvleY12A2tFu/DwX94zkkwJMv+5ZafCz5XcEwAMUhgg5j9
 8ClslynVq8D3aHjEim2sgpbKDXMzFyUJdPtmjXSmclffhpq4qkmqb5iiv
 KTqNvVHUGF2HF3TwkUVLxLhw8iKMLs6rWNBQdwPYSm3B1urHdmxq3D625
 E+d41+c2KagZwUBUsqfvZtgo13BtWTau9siU1MXAQkuEO2sRQ2sr1uyqw
 KunI2byZoAqrJ9Ez/O3BHSbtfn2wazw8BKhyEzqgwXMCPFdk88oCzIcU6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311945702"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="311945702"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 16:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="843928662"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; d="scan'208";a="843928662"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga005.jf.intel.com with ESMTP; 15 Feb 2023 16:23:32 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/2] drm/i915: Don't use BAR mappings for ring buffers with
 LLC
Date: Wed, 15 Feb 2023 16:22:48 -0800
Message-Id: <20230216002248.1851966-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216002248.1851966-1-John.C.Harrison@Intel.com>
References: <20230216002248.1851966-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 stable@vger.kernel.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Direction from hardware is that ring buffers should never be mapped
via the BAR on systems with LLC. There are too many caching pitfalls
due to the way BAR accesses are routed. So it is safest to just not
use it.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Fixes: 9d80841ea4c9 ("drm/i915: Allow ringbuffers to be bound anywhere")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.9+
---
 drivers/gpu/drm/i915/gt/intel_ring.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
index fb1d2595392ed..8675ec8ead353 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring.c
@@ -53,7 +53,7 @@ int intel_ring_pin(struct intel_ring *ring, struct i915_gem_ww_ctx *ww)
 	if (unlikely(ret))
 		goto err_unpin;
 
-	if (i915_vma_is_map_and_fenceable(vma)) {
+	if (i915_vma_is_map_and_fenceable(vma) && !HAS_LLC(vma->vm->i915)) {
 		addr = (void __force *)i915_vma_pin_iomap(vma);
 	} else {
 		int type = i915_coherent_map_type(vma->vm->i915, vma->obj, false);
@@ -98,7 +98,7 @@ void intel_ring_unpin(struct intel_ring *ring)
 		return;
 
 	i915_vma_unset_ggtt_write(vma);
-	if (i915_vma_is_map_and_fenceable(vma))
+	if (i915_vma_is_map_and_fenceable(vma) && !HAS_LLC(vma->vm->i915)) {
 		i915_vma_unpin_iomap(vma);
 	else
 		i915_gem_object_unpin_map(vma->obj);
-- 
2.39.1

