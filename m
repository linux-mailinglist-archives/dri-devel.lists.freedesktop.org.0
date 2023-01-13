Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5DC669EFC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 18:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1AF10EA70;
	Fri, 13 Jan 2023 17:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBE210EA70;
 Fri, 13 Jan 2023 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hMAR/fe4a+AqXAMEBm+JMkSSpKLeGsuHKZQINVwuouc=; b=peM/G9C7k2HUlD7jat6cOSPzU9
 8uNMHGtngx06eV9F78Fti+qynhmhmz186Rc3Bu3nykmWf2vrQMogZeq7elnMxn0/6GeDMD8MJ5kOY
 3Jal1x7vNxsbIxWKKfz0sikIMS7/n3HvbcaNOwdBoHw+ub5bGq5/vYsGh9maTJg6pj4J/mlWNyqoX
 PHfRNP1iPrJPCTSzknti/5bB9f75IiduN692EuMiEDyHFS6blY3I7h1lzdIa3I6wah4gm+ea+My4m
 qzHNOk5n20gvwQEeGBIzpopDq6t4JHuNxihqp90aNHdJcQEUSYLC04XskLOu0wcitRn0xihrw2P3a
 EjH/Dcxw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pGNPx-007Hoz-Co; Fri, 13 Jan 2023 18:00:37 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Subject: [PATCH v3 3/3] drm/vmwgfx: Remove redundant framebuffer format check
Date: Fri, 13 Jan 2023 13:59:20 -0300
Message-Id: <20230113165919.580210-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113165919.580210-1-mcanal@igalia.com>
References: <20230113165919.580210-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 amd-gfx@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that framebuffer_check() verifies that the format is properly
supported, there is no need to check it again on vmwgfx's inside
helpers.

Therefore, remove the redundant framebuffer format check from the
vmw_kms_new_framebuffer_surface() and vmw_kms_new_framebuffer_bo()
functions, letting framebuffer_check() perform the framebuffer
validation.

Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 257f090071f1..05b8d8f912bf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1317,15 +1317,6 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
 	 * Sanity checks.
 	 */
 
-	if (!drm_any_plane_has_format(&dev_priv->drm,
-				      mode_cmd->pixel_format,
-				      mode_cmd->modifier[0])) {
-		drm_dbg(&dev_priv->drm,
-			"unsupported pixel format %p4cc / modifier 0x%llx\n",
-			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
-		return -EINVAL;
-	}
-
 	/* Surface must be marked as a scanout. */
 	if (unlikely(!surface->metadata.scanout))
 		return -EINVAL;
@@ -1648,15 +1639,6 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
 		return -EINVAL;
 	}
 
-	if (!drm_any_plane_has_format(&dev_priv->drm,
-				      mode_cmd->pixel_format,
-				      mode_cmd->modifier[0])) {
-		drm_dbg(&dev_priv->drm,
-			"unsupported pixel format %p4cc / modifier 0x%llx\n",
-			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
-		return -EINVAL;
-	}
-
 	vfbd = kzalloc(sizeof(*vfbd), GFP_KERNEL);
 	if (!vfbd) {
 		ret = -ENOMEM;
-- 
2.39.0

