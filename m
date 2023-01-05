Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770CF65F104
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 17:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E7910E0FB;
	Thu,  5 Jan 2023 16:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E464410E0FB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 16:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r+kVFqTuWTOVHoRBP3DY3VvNPFBFHrb0zXM1CGy8pdA=; b=jpKQ0Epne0CmbNen9RYEPCpFuW
 CX8Ddy/hRaSSNrug5rgpmU/5YKNjxFTARnqIvSASED5KsOnlUFdrIl17mRPd6yw5P4obR7/k2W/Su
 ZTFKNdJahV1/XmtM0z53EnEAjRlrng971FVvejD7edZSsG1onhXaD+fK4L3miIXSo897Mduo8tWeN
 SdWIcKUgFNWURUmW2pHwSo8YD7lunrD0FKeksC7KQxELCUJdgTJ8WrYS6w53Xswe78Z7U5l51smZS
 8fa5O8Ok61exRec1Dh4V8JiasGCAQvxLKbuRm7oKnLPf3tE1epiPxjrneQ9cUna9KlXZxV/oeyYq8
 +RjyhA4A==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pDT0F-000C4j-UI; Thu, 05 Jan 2023 17:22:04 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
Date: Thu,  5 Jan 2023 13:21:48 -0300
Message-Id: <20230105162148.234218-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With commit 359c6649cd9a ("drm/gem: Implement shadow-plane {begin,
end}_fb_access with vmap"), the behavior of the shadow-plane helpers
changed and the vunmap is now performed at the end of
the current pageflip, instead of the end of the following pageflip.

By performing the vunmap at the end of the current pageflip, invalid
memory is accessed by the vkms during the plane composition, as the data
is being unmapped before being used.

Therefore, introduce again prepare_fb and cleanup_fb functions to the
vkms, which were previously removed on commit b43e2ec03b0d ("drm/vkms:
Let shadow-plane helpers prepare the plane's FB").

Fixes: 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access with vmap")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 36 ++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index c3a845220e10..b3f8a115cc23 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -160,10 +160,44 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
	return 0;
 }

+static int vkms_prepare_fb(struct drm_plane *plane,
+			   struct drm_plane_state *state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state;
+	struct drm_framebuffer *fb = state->fb;
+	int ret;
+
+	if (!fb)
+		return 0;
+
+	shadow_plane_state = to_drm_shadow_plane_state(state);
+
+	ret = drm_gem_plane_helper_prepare_fb(plane, state);
+	if (ret)
+		return ret;
+
+	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
+}
+
+static void vkms_cleanup_fb(struct drm_plane *plane,
+			    struct drm_plane_state *state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state;
+	struct drm_framebuffer *fb = state->fb;
+
+	if (!fb)
+		return;
+
+	shadow_plane_state = to_drm_shadow_plane_state(state);
+
+	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
+}
+
 static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
	.atomic_update		= vkms_plane_atomic_update,
	.atomic_check		= vkms_plane_atomic_check,
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.prepare_fb		= vkms_prepare_fb,
+	.cleanup_fb		= vkms_cleanup_fb,
 };

 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
--
2.39.0

