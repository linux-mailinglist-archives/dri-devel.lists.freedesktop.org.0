Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0B13BEE1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 12:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198066E92B;
	Wed, 15 Jan 2020 11:53:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A1B6E92B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 11:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 4D7363F6BB;
 Wed, 15 Jan 2020 12:53:48 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=LNbNk9Pb; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZIjx1h21eIX; Wed, 15 Jan 2020 12:53:47 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D30013F6EE;
 Wed, 15 Jan 2020 12:53:46 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id CFC31360391;
 Wed, 15 Jan 2020 12:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579089225; bh=ozYRVz3nC1rceajt/g6B9YKLneoR/4/F4b8OxgkpWQM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LNbNk9PbdBQRfIyMNxwOZmQZxJtXGtz8NbViSiDF0tVlp2o+YxIaTiSszGjbLkkYy
 mxQY3ljPZv7+aB5aKYJR4QS5sSLgC1SlvkkCboBf5k+zTuCjVYM/nznzMki2IUGgFS
 ZErwfuG2onw2GVNMuij6KO3TevupThz6bAjuGtoE=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/vmwgfx: drop DRM_AUTH for render ioctls
Date: Wed, 15 Jan 2020 12:53:26 +0100
Message-Id: <20200115115329.2836-6-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200115115329.2836-1-thomas_os@shipmail.org>
References: <20200115115329.2836-1-thomas_os@shipmail.org>
MIME-Version: 1.0
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 linux-graphics-maintainer@vmware.com,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

With earlier commit 9c84aeba67cc ("drm/vmwgfx: Kill unneeded legacy
security features") we removed the no longer applicable validation, as
we now have isolation of primary clients from different master realms.

As of last commit, we're explicitly checking for authentication in the
only render ioctls which care about one.

With those in place, the DRM_AUTH token serves no real purpose. Let's
drop it.

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
Signed-off-by: Thomas Hellstrom <thellstrom@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index dc3d04f00683..bc3d85174ca0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -165,9 +165,9 @@
 
 static const struct drm_ioctl_desc vmw_ioctls[] = {
 	VMW_IOCTL_DEF(VMW_GET_PARAM, vmw_getparam_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_ALLOC_DMABUF, vmw_bo_alloc_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_UNREF_DMABUF, vmw_bo_unref_ioctl,
 		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_CURSOR_BYPASS,
@@ -182,16 +182,16 @@ static const struct drm_ioctl_desc vmw_ioctls[] = {
 		      DRM_MASTER),
 
 	VMW_IOCTL_DEF(VMW_CREATE_CONTEXT, vmw_context_define_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_UNREF_CONTEXT, vmw_context_destroy_ioctl,
 		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_CREATE_SURFACE, vmw_surface_define_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_UNREF_SURFACE, vmw_surface_destroy_ioctl,
 		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_REF_SURFACE, vmw_surface_reference_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
-	VMW_IOCTL_DEF(VMW_EXECBUF, vmw_execbuf_ioctl, DRM_AUTH |
+		      DRM_RENDER_ALLOW),
+	VMW_IOCTL_DEF(VMW_EXECBUF, vmw_execbuf_ioctl,
 		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_FENCE_WAIT, vmw_fence_obj_wait_ioctl,
 		      DRM_RENDER_ALLOW),
@@ -201,9 +201,9 @@ static const struct drm_ioctl_desc vmw_ioctls[] = {
 	VMW_IOCTL_DEF(VMW_FENCE_UNREF, vmw_fence_obj_unref_ioctl,
 		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_FENCE_EVENT, vmw_fence_event_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_GET_3D_CAP, vmw_get_cap_3d_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 
 	/* these allow direct access to the framebuffers mark as master only */
 	VMW_IOCTL_DEF(VMW_PRESENT, vmw_present_ioctl,
@@ -221,28 +221,28 @@ static const struct drm_ioctl_desc vmw_ioctls[] = {
 		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_CREATE_SHADER,
 		      vmw_shader_define_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_UNREF_SHADER,
 		      vmw_shader_destroy_ioctl,
 		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_GB_SURFACE_CREATE,
 		      vmw_gb_surface_define_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_GB_SURFACE_REF,
 		      vmw_gb_surface_reference_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_SYNCCPU,
 		      vmw_user_bo_synccpu_ioctl,
 		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_CREATE_EXTENDED_CONTEXT,
 		      vmw_extended_context_define_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_GB_SURFACE_CREATE_EXT,
 		      vmw_gb_surface_define_ext_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 	VMW_IOCTL_DEF(VMW_GB_SURFACE_REF_EXT,
 		      vmw_gb_surface_reference_ext_ioctl,
-		      DRM_AUTH | DRM_RENDER_ALLOW),
+		      DRM_RENDER_ALLOW),
 };
 
 static const struct pci_device_id vmw_pci_id_list[] = {
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
