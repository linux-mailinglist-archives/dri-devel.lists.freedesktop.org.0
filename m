Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471C6623A0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A34010E3D9;
	Mon,  9 Jan 2023 11:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E1B10E3D9;
 Mon,  9 Jan 2023 11:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V5/qx31Umdj7qyI/DYqiwcwccn1rAZXUVGviGuCPWcU=; b=S925dcg/iB3k3CKo2aYIvXpI7U
 wWROTkjnhBu0Ek6JuqvDhBT6x2pcL0UEhwGyU5EiOZ0PM7eqkz2ZvOQpL1X6xpSOs1/nYoqkvO/A0
 MQHQLcGDxBSjFjUDWRLAMjtjR2Bt4AJCyqtfmT0hvMZJ2jSA53MKqLnq58/1d7PK7SZU0FdY2rrdn
 eobyBDRiJnOpWt0SlU3X/VJSKpn5xpoF0bIADlQld4X/Uh/y3zbsP+lTgddBc28W8lIEMYH8VN/WP
 RIFmlAlVRfi593VgdyLlHJii+bEuX4y2ODPl6z70pbbouRX1qKsknMqOrl+CSCRUsmXs39X7z5pvR
 Xq9XxOsw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEptY-003J8T-9X; Mon, 09 Jan 2023 12:00:48 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Simon Ser <contact@emersion.fr>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Subject: [PATCH 4/5] drm/vmwgfx: Remove redundant framebuffer format check
Date: Mon,  9 Jan 2023 07:58:07 -0300
Message-Id: <20230109105807.18172-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109105807.18172-1-mcanal@igalia.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
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
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that framebuffer_check() verifies that the format is properly
supported, there is no need to check it again on vmwgfx's inside
helpers.

Therefore, remove the redundant framebuffer format check from the
vmw_kms_new_framebuffer_surface() and vmw_kms_new_framebuffer_bo()
functions, letting framebuffer_check() perform the framebuffer
validation.

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

