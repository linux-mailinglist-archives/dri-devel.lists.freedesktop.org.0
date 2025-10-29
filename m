Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7CC1B43D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2BB10E7CA;
	Wed, 29 Oct 2025 14:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wpwXU8Li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD28710E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 44BABC0DA85;
 Wed, 29 Oct 2025 14:37:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D57E606E8;
 Wed, 29 Oct 2025 14:37:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3F3F117F81AF; Wed, 29 Oct 2025 15:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wuzcvgdxKucfzXi8j9im5vi/vTJhBZGMa5n+dwDEVE8=;
 b=wpwXU8Li2/6wN+XcWgPzVcZOQiH+n9oqv609Yka7wVMI0+znjXOocV7UxkALOoOv7QPCBn
 ecoE1pH7Mytoblv7WPVkZKm7d+1RVY0N3Xw/Zz9zMA3WggSUarkEvvtBXlJaeC8eLeDUDb
 QsR/1BumbB0fP5nt0yroKSfouYUUMs/h1N3DagWSUZoYbeTdrm65SU5Brqbdu5Jur9rp+R
 Tnc3zBzeEXYZsDcqpz/tXowJzLgTtRijG5IrmKb/clgNsLSyC8Jksufd+cGkdIiXfMt4mU
 LYdgM9AhhFD4C6aL21Nx1TouqZpq11xutXr4/BCpPAVlqc2XCJJGO6Y53jVUEA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:55 +0100
Subject: [PATCH RESEND v2 18/32] drm/vkms: Properly render plane using
 their zpos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-18-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rnZm7r0xEd9LrIvetwHGtyd26t99JexCbu1jReAcAkA=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ8bCaudyWE+A46e5tkBU4wtEm5i2Rcwx3CM
 dtYEjx2VhuJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImfAAKCRAgrS7GWxAs
 4ouSEAC+Az4FjpAq1CI4MetBO1K/TjVnfjMYKXHpb0KXMqNzNpKz6y5kFhL4fHqIxochAVYO+EQ
 4S7hBnTAoWTpuLJWxBrZnPhtB6XPcVTQat36SztGkgaAg/IlmJnGGswMKVbngD30fDGtE+GBi5x
 5oHqZSOZ96f2qT7c/eme3a0PYoKDu0o8V3G+z/veqc8Z/KQhiJqVibhBQxPmCzo0TLBrFU9JL8Y
 FUnVKiqmwtQsjXlOKcE6gbleXbOUYKxEkhDVFlo9tbF0Gbepo7OXqhgaKev48lJf1Sx+CzM77AK
 Tz4YkPEeCH7ix1QUJdmYULWVazQ1ZzY35hAABwfccE4ECc3CFhGFVdFzrnV4FpoW2inX0GkYRjN
 XFdiHiPc5gCXVGqcqnCogpJ0s9Dy+muPMyy7Dh8dLNDlY7dXUGK25PSxC7h0/wvhsi5iuvlBk3Q
 PSqlSlISIUUuyYLT8LDLckxzSOpUFGMHTfujwoSsAkvcqSjrhwxVppjE1PoZgITiGQF7aLNBY35
 Cx8Lq0lRlhTSVJkQr2qnJMO3DD4y7AFXkyhBeeZXjFZx0mB/tE/igHwnWdkK0yDwazM+SPcNhJ8
 MmX7EOW7hX61KulOeWZ7bHaP9AJyj0zvwnLTjaaa3rHBdvg9v01stAA110Y4R9OVDfiIZyZ3wNJ
 DhKHLt/tUShe+oQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

Currently planes are rendered in creation order. This is not an issue, but
with the introduction of new zpos configuration, it is required to
properly render planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index bac0790c6577..0524c47460fb 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -141,14 +142,20 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
-	i = 0;
+	ret = drm_atomic_normalize_zpos(crtc->dev, state);
+	if (ret)
+		return ret;
+
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
 
-		vkms_state->active_planes[i++] =
+		// Order planes according to their normalized_zpos
+		// After drm_atomic_normalize_zpos, the possible values are 0..n_planes-1
+		// so store them using this index
+		vkms_state->active_planes[plane_state->normalized_zpos] =
 			to_vkms_plane_state(plane_state);
 	}
 

-- 
2.51.0

