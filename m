Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6E9FA310
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 01:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B4810E1B1;
	Sun, 22 Dec 2024 00:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="nfqsr+y6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036A410E12B
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 00:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=QUix15QTiaFfsssbab5rS4/shsq0Av6rYxiUE7OZ7WU=; b=nfqsr+y6VUNuN71H
 ehERd7OMf7L3J833iqNbjJjlLk6ycWADrkihWVa+93/gU7Rvvh3uEIzmtZB2h8oV/sahEOx7e/xtf
 FfC+oT6UDG4aKuXH4rOTFkSlm8V0qoupWN3iH+VQaHvjCIMX/nrpLwNTAU6BobGMhlH1DEL5fDGmV
 ov2CWWbsCkSok8lvOz/X8zYjZDrJTTIMK/T3Mw/6BpsfXKWM0WfnKvfR4Ko0TSkqjG7S+7lpv69Lo
 tDyCztryjcql6s+YTEec2ETzUGW0wbybaFmuf8J1ZbTTWIp961ypDhMEQhO/t7xYXPxad7KpunQKv
 5Z5yFedpy3PM1qAp5g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tP9i9-006iX5-0g;
 Sun, 22 Dec 2024 00:20:45 +0000
From: linux@treblig.org
To: zhenyuw@linux.intel.com, zhi.wang.linux@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] drm/i915/gvt: Remove intel_gvt_ggtt_h2g<->index
Date: Sun, 22 Dec 2024 00:20:41 +0000
Message-ID: <20241222002043.173080-2-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222002043.173080-1-linux@treblig.org>
References: <20241222002043.173080-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

intel_gvt_ggtt_h2g_index() and intel_gvt_ggtt_index_g2h() were
added in 2016 by
commit 2707e4446688 ("drm/i915/gvt: vGPU graphics memory virtualization")
but haven't been used.

Remove them.

They were the only users of intel_gvt_ggtt_gmadr_g2h() and
intel_gvt_ggtt_gmadr_h2g().

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 66 ----------------------------------
 drivers/gpu/drm/i915/gvt/gvt.h |  6 ----
 2 files changed, 72 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 1bce1493b86f..464fb17e82ee 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -71,72 +71,6 @@ bool intel_gvt_ggtt_validate_range(struct intel_vgpu *vgpu, u64 addr, u32 size)
 	return false;
 }
 
-/* translate a guest gmadr to host gmadr */
-int intel_gvt_ggtt_gmadr_g2h(struct intel_vgpu *vgpu, u64 g_addr, u64 *h_addr)
-{
-	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
-
-	if (drm_WARN(&i915->drm, !vgpu_gmadr_is_valid(vgpu, g_addr),
-		     "invalid guest gmadr %llx\n", g_addr))
-		return -EACCES;
-
-	if (vgpu_gmadr_is_aperture(vgpu, g_addr))
-		*h_addr = vgpu_aperture_gmadr_base(vgpu)
-			  + (g_addr - vgpu_aperture_offset(vgpu));
-	else
-		*h_addr = vgpu_hidden_gmadr_base(vgpu)
-			  + (g_addr - vgpu_hidden_offset(vgpu));
-	return 0;
-}
-
-/* translate a host gmadr to guest gmadr */
-int intel_gvt_ggtt_gmadr_h2g(struct intel_vgpu *vgpu, u64 h_addr, u64 *g_addr)
-{
-	struct drm_i915_private *i915 = vgpu->gvt->gt->i915;
-
-	if (drm_WARN(&i915->drm, !gvt_gmadr_is_valid(vgpu->gvt, h_addr),
-		     "invalid host gmadr %llx\n", h_addr))
-		return -EACCES;
-
-	if (gvt_gmadr_is_aperture(vgpu->gvt, h_addr))
-		*g_addr = vgpu_aperture_gmadr_base(vgpu)
-			+ (h_addr - gvt_aperture_gmadr_base(vgpu->gvt));
-	else
-		*g_addr = vgpu_hidden_gmadr_base(vgpu)
-			+ (h_addr - gvt_hidden_gmadr_base(vgpu->gvt));
-	return 0;
-}
-
-int intel_gvt_ggtt_index_g2h(struct intel_vgpu *vgpu, unsigned long g_index,
-			     unsigned long *h_index)
-{
-	u64 h_addr;
-	int ret;
-
-	ret = intel_gvt_ggtt_gmadr_g2h(vgpu, g_index << I915_GTT_PAGE_SHIFT,
-				       &h_addr);
-	if (ret)
-		return ret;
-
-	*h_index = h_addr >> I915_GTT_PAGE_SHIFT;
-	return 0;
-}
-
-int intel_gvt_ggtt_h2g_index(struct intel_vgpu *vgpu, unsigned long h_index,
-			     unsigned long *g_index)
-{
-	u64 g_addr;
-	int ret;
-
-	ret = intel_gvt_ggtt_gmadr_h2g(vgpu, h_index << I915_GTT_PAGE_SHIFT,
-				       &g_addr);
-	if (ret)
-		return ret;
-
-	*g_index = g_addr >> I915_GTT_PAGE_SHIFT;
-	return 0;
-}
-
 #define gtt_type_is_entry(type) \
 	(type > GTT_TYPE_INVALID && type < GTT_TYPE_PPGTT_ENTRY \
 	 && type != GTT_TYPE_PPGTT_PTE_ENTRY \
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 2c95aeef4e41..8580c6d057e7 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -531,12 +531,6 @@ int intel_gvt_set_edid(struct intel_vgpu *vgpu, int port_num);
 	    gvt_gmadr_is_hidden(gvt, gmadr))
 
 bool intel_gvt_ggtt_validate_range(struct intel_vgpu *vgpu, u64 addr, u32 size);
-int intel_gvt_ggtt_gmadr_g2h(struct intel_vgpu *vgpu, u64 g_addr, u64 *h_addr);
-int intel_gvt_ggtt_gmadr_h2g(struct intel_vgpu *vgpu, u64 h_addr, u64 *g_addr);
-int intel_gvt_ggtt_index_g2h(struct intel_vgpu *vgpu, unsigned long g_index,
-			     unsigned long *h_index);
-int intel_gvt_ggtt_h2g_index(struct intel_vgpu *vgpu, unsigned long h_index,
-			     unsigned long *g_index);
 
 void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
 		bool primary);
-- 
2.47.1

