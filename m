Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFB69D181B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 19:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C798D10E556;
	Mon, 18 Nov 2024 18:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lfkJ/Jbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FF310E557
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 18:28:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D89C0E0006;
 Mon, 18 Nov 2024 18:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731954519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bqvaGMl+KmIs6tRIGUSSlJtXdl/yiooo7tTRfYyTRYw=;
 b=lfkJ/Jbg0A1ZknOB0R4gQXE0mAIm4oKSecHm/9Fxzrgw58Gl9tMMHEYttG7EIRlMo7Ffqw
 tJs5HVLFB0gpcPJ765PFzWmrtxyjFWjaoDdl3XIGSRRFhTzB8rAKrMB/4tXQk79nvyyTcZ
 fX4Bl4gcqL7o6lnGVKGOACMN2GABS1yHCySaj9pPYgBPxY+AtLEfqK0uy7gwYEOdJ+vQPE
 SdkVSZMt9w5IX6FQVDktyyjxvKeT1rB03+0PtR5t+P2pt4yxHTob+/BOzcz2Mczjep/pkz
 BzoDuxvJulMGYrAa28JgIK3t376oSIqDKlR6tHrCLZengZHAkJePUf9Mvg6o7g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 18 Nov 2024 19:28:24 +0100
Subject: [PATCH v14 9/9] drm/vkms: Remove useless drm_rotation_simplify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241118-yuv-v14-9-2dbc2f1e222c@bootlin.com>
References: <20241118-yuv-v14-0-2dbc2f1e222c@bootlin.com>
In-Reply-To: <20241118-yuv-v14-0-2dbc2f1e222c@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xjvTGjXfgFXj5LQtobz7nAEZ20B22QpuW/oNRtKaDz8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnO4dHISRrsvT6mZ5YkWlIznnL4TCKn3c633X/p
 +YpCshqo+mJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZzuHRwAKCRAgrS7GWxAs
 4oOKEACMTXGXTZKbxHwRGWbUslBEUkGW4NaV+vJnQ8YWIdlB/lc4yNEb+mtRFnieqd54Fr9uIMu
 qLfCk3tK6GjDwkgZDANNcMdrEh0mXpliTXo+yITgEO1VUXRVE0lb0UNEj1mmVN9h1dc25+jF+8k
 HCALbMMJLVXPZILqLrM/zkSP6IBS1v870btMgxBO3aRILUgMxSBOQAjNibKfNGBcSJopei98ZmQ
 zvzR9gGTDe5hX87Lntkmr9hIMORq+YwUrN7uzjlVUxxU604oOl5w1CssB6jQ/jUXX7wLYAn6kgc
 DEUTKfojrgdnGsfSE3M+4CPU54fvT+UqWMybQ1u/XqVPr2rxENxtawtTQ8gSpttS3hlD0km5Mpc
 cwjGrEUQhA68/pvygGiVVqQs1+1DAfxMZnhTlDy/zRbhRBzj7N7ZYBwCjuHjJE/ZPyoo9K5Kqkc
 MPILhiX3222eUtYCIR7aUh7HI/n6tjCZIlQ0+7hlV0X+SQr9jxQPSm5nk3ZgETpO+CM0warFN2Z
 qMYQQqs5DJEIVWvnejrtaW7M9wKtOG11OMdXaxoDF2OuZWdnJ+dNoNo9RIX/D62QJIiQdKUwOlw
 W72phss7lLaKf5EFsXKuO0eE0it5lnVOUsvk2RZ6gEtAcL68N7DuJd5zy5HNpIXESMAj+8vWVeq
 WM7pBmuvpNPGHjQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

As all the rotation are now supported by VKMS, this simplification does
not make sense anymore, so remove it.

Acked-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 8875bed7641043862fe933547be9f68fb4e2f59a..5a028ee96c9143709337abc7dad0ec608efb3ab4 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
 	drm_framebuffer_get(frame_info->fb);
-	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
-									  DRM_MODE_ROTATE_90 |
-									  DRM_MODE_ROTATE_270 |
-									  DRM_MODE_REFLECT_X |
-									  DRM_MODE_REFLECT_Y);
-
+	frame_info->rotation = new_state->rotation;
 
 	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
 }

-- 
2.47.0

