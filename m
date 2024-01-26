Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D990983E31B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 21:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2B710FE24;
	Fri, 26 Jan 2024 20:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FB510FE21
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 20:09:17 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-599e913264eso457754eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706299697; x=1706904497;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNaPGeyKlKQ94ax58bojymvRs406SDq+X0qIIGYQv8Y=;
 b=CwQ4dIdCjR8gfnqj4er5XBCzxWU49aOgVBGGccXJ5+vxrjI1Rb1eZsu/gIR4AolS4T
 UjjNpZ0zl/Er1f1n8G5ralD4zCSQPj5Q+x+A0uCs2CRstAAmmpFOGzLgep09q6fLu0F+
 9Wogjlcq3lrqOrAzct74+VK7WbRulXhFUzE8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706299697; x=1706904497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNaPGeyKlKQ94ax58bojymvRs406SDq+X0qIIGYQv8Y=;
 b=dDCrp5AoNY+H27IkV/hNGCtO29m+DdTAdQmqWjDHx+owLTMsHcXSxPcNhq3FITJUcI
 ChJVJVpvvd+g0W7XgJtZ4ksHFhy8CwrCdC1T4+uSx13WTsznimlS9EagLIv5Ud3rMmz9
 kHyaNtmAnEUZSIhTbkMnOzXAEjsTJ4si6Uw0TX/RA0jFEUTnsMi5pU+ulXEecxkfV3r9
 ttl8VTiW8nACD3dxQONPy9Ecd5DEi7YheTax57YIFMKshfIg5Co/k7MI7ev6IRpiZ6SD
 47txMArap1i/Xd1C3SJelkyvRnkN7oICURiNBfIZzyjMViCSZ1BoVlZQm2nS/8srkmlm
 tlgA==
X-Gm-Message-State: AOJu0YwPgFy/czgfK67bxlodme2h368R0DV4Xos3OuIgY80oKBuxbzK6
 IURqPnkC2ofWq02WQbkapEW9nQrKqrsr8dXcWH5q+1VDIWNXZvQAjXmGih4+XRN56te81J1vwlo
 nU2zrwdmiM4L+oJiMTMxt7qISCJV+56/bVbTiHojottIh4W84+oO8owsgIXQDWWqDB3Y2bJmvh8
 oOXixQgHAq7WJ+U/Yi/Gs034rMvDdMI7DzUA482Bq37I8ZHUbZ4A==
X-Google-Smtp-Source: AGHT+IH39b86p7OqPsmMTO5ocOSpZNAU7+xTWrB4e1H9kvKTfsrMeuXyzi31u0AJH0P4OBY3fkLt2Q==
X-Received: by 2002:a4a:bd8c:0:b0:59a:161e:ed64 with SMTP id
 k12-20020a4abd8c000000b0059a161eed64mr191671oop.8.1706299696997; 
 Fri, 26 Jan 2024 12:08:16 -0800 (PST)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a4abd87000000b00599f5c2c052sm358161oop.8.2024.01.26.12.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 12:08:16 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/vmwgfx: Fix the lifetime of the bo cursor memory
Date: Fri, 26 Jan 2024 15:08:04 -0500
Message-Id: <20240126200804.732454-6-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240126200804.732454-1-zack.rusin@broadcom.com>
References: <20240126200804.732454-1-zack.rusin@broadcom.com>
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
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cleanup can be dispatched while the atomic update is still active,
which means that the memory acquired in the atomic update needs to
not be invalidated by the cleanup. The buffer objects in vmw_plane_state
instead of using the builtin map_and_cache were trying to handle
the lifetime of the mapped memory themselves, leading to crashes.

Use the map_and_cache instead of trying to manage the lifetime of the
buffer objects held by the vmw_plane_state.

Fixes kernel oops'es in IGT's kms_cursor_legacy forked-bo.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: bb6780aa5a1d ("drm/vmwgfx: Diff cursors when using cmds")
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index e2bfaf4522a6..cd4925346ed4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -185,13 +185,12 @@ static u32 vmw_du_cursor_mob_size(u32 w, u32 h)
  */
 static u32 *vmw_du_cursor_plane_acquire_image(struct vmw_plane_state *vps)
 {
-	bool is_iomem;
 	if (vps->surf) {
 		if (vps->surf_mapped)
 			return vmw_bo_map_and_cache(vps->surf->res.guest_memory_bo);
 		return vps->surf->snooper.image;
 	} else if (vps->bo)
-		return ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem);
+		return vmw_bo_map_and_cache(vps->bo);
 	return NULL;
 }
 
@@ -653,22 +652,12 @@ vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
 {
 	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(old_state);
-	bool is_iomem;
 
 	if (vps->surf_mapped) {
 		vmw_bo_unmap(vps->surf->res.guest_memory_bo);
 		vps->surf_mapped = false;
 	}
 
-	if (vps->bo && ttm_kmap_obj_virtual(&vps->bo->map, &is_iomem)) {
-		const int ret = ttm_bo_reserve(&vps->bo->tbo, true, false, NULL);
-
-		if (likely(ret == 0)) {
-			ttm_bo_kunmap(&vps->bo->map);
-			ttm_bo_unreserve(&vps->bo->tbo);
-		}
-	}
-
 	vmw_du_cursor_plane_unmap_cm(vps);
 	vmw_du_put_cursor_mob(vcp, vps);
 
-- 
2.40.1

