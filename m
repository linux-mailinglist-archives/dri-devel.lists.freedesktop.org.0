Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6E69FA30E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 01:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5571110E19F;
	Sun, 22 Dec 2024 00:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="AYJwumjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28AD810E163
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 00:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=1bruFzOeZGedeEmzyy3gebb3G+WVopkhjQB23yNgkW0=; b=AYJwumjdYl/UNMMK
 GGQPS389rY6SApx3dsPzAUuA+e6+gYNyW3LJHY1O78ZEZbdwPX0DBybi4Fy8dAxJhRB3Cgk1yVl7T
 BR3tKOOW1TSEGYz7qFRjAr6AGtEwdg7ZrE/9uTOXFCRMRLyyQGA5gKNikvSdyGj8+5f4kCzvOg3ta
 l2KOHEPWR5iEDEFK2hJU+yrBGD+36U5I6enqdxzdmxNYk97asXTHriXe97Rc12ZgzQOxaB8zRphyJ
 yseafZBdvMwBmI7tJol2VkKmoeZCZRomje2U57oJKJVycHOVa9Ddb/u7pD000R4Y7C8Tzyq9jT2Sh
 +Z+Sdh4ByUh1W5JtjQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tP9iA-006iX5-1x;
 Sun, 22 Dec 2024 00:20:46 +0000
From: linux@treblig.org
To: zhenyuw@linux.intel.com, zhi.wang.linux@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] drm/i915/gvt: Remove unused
 intel_gvt_in_force_nonpriv_whitelist
Date: Sun, 22 Dec 2024 00:20:43 +0000
Message-ID: <20241222002043.173080-4-linux@treblig.org>
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

The last use of intel_gvt_in_force_nonpriv_whitelist() was
removed in 2020 by
commit 02dd2b12a685 ("drm/i915/gvt: unify lri cmd handler and mmio
handlers")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 17 -----------------
 drivers/gpu/drm/i915/gvt/mmio.h     |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 9494d812c00a..7aca66dd12cd 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -3113,23 +3113,6 @@ int intel_vgpu_mask_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	return 0;
 }
 
-/**
- * intel_gvt_in_force_nonpriv_whitelist - if a mmio is in whitelist to be
- * force-nopriv register
- *
- * @gvt: a GVT device
- * @offset: register offset
- *
- * Returns:
- * True if the register is in force-nonpriv whitelist;
- * False if outside;
- */
-bool intel_gvt_in_force_nonpriv_whitelist(struct intel_gvt *gvt,
-					  unsigned int offset)
-{
-	return in_whitelist(offset);
-}
-
 /**
  * intel_vgpu_mmio_reg_rw - emulate tracked mmio registers
  * @vgpu: a vGPU
diff --git a/drivers/gpu/drm/i915/gvt/mmio.h b/drivers/gpu/drm/i915/gvt/mmio.h
index 32ebacb078e8..3dc912aba80b 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.h
+++ b/drivers/gpu/drm/i915/gvt/mmio.h
@@ -96,9 +96,6 @@ int intel_vgpu_default_mmio_read(struct intel_vgpu *vgpu, unsigned int offset,
 int intel_vgpu_default_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 				  void *p_data, unsigned int bytes);
 
-bool intel_gvt_in_force_nonpriv_whitelist(struct intel_gvt *gvt,
-					  unsigned int offset);
-
 int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 			   void *pdata, unsigned int bytes, bool is_read);
 
-- 
2.47.1

