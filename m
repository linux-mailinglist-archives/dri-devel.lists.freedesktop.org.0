Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB6B4ABCB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1538A10E6B1;
	Tue,  9 Sep 2025 11:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="W24bISGN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F1210E697
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E42A66022E;
 Tue,  9 Sep 2025 11:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8A4C4CEF4;
 Tue,  9 Sep 2025 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417287;
 bh=UiS9eGDzLJAdk4nBDkEEBCWb+nak6KQQAsDK1lE1TsA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W24bISGNfCoTWl+p1WVrJ7EKhybLispJPOQ2ANmnaWCI9rDGrn0IDeU9MskvVsQ26
 9C8guT2j3xG48+it0B41Sicchwvz7PXTqE4fauBQiiOL2jKvBRd+pD47+ujBea0xlr
 /R2WpiM2cUIezu/Siz+Fddb03ZzRr57V8Zgg5dqeNx3fv//iPcEY94/eZSzf51Uuym
 Hyl7Vm3JLF5C3pWnRLIZ9vSqIN3s5ajy3OLTZklPjw1iWyDlyHnQz2KmC9f1syRKrV
 tHlZOq6vqjYGU/uf9ZQZAjVYcl7l+VsIsQnVUj9uaHLjm4opwxNXJynl9EWIaJgo0N
 DOfI3+V+4Q+lQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:25 +0200
Subject: [PATCH v3 06/39] drm/vkms: Convert vkms_crtc_atomic_check() to use
 new plane state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-6-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023; i=mripard@kernel.org;
 h=from:subject:message-id; bh=UiS9eGDzLJAdk4nBDkEEBCWb+nak6KQQAsDK1lE1TsA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+FXWX7YWZDp7q/fG6eNfLkk/FBZLExU8flv77pNP7
 z9yB06u7JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATuSXBWB8zzWjO0XfGWb/e
 usbtrJMviJuS6LMzMUFS5/KVyZdei5TyhQovNcg45ii+LyiR1SgznLFhD39Azu7Hj8LeBhhusiv
 8EsinulT22y7zh49dd56+3p96xP6Yau7PXYHrOq59S/wRtG0CAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The vkms_crtc_atomic_check() function calls the deprecated
drm_atomic_get_existing_plane_state() helper for its internal mode
checking logic.

During atomic_check, the existing state is the new state and
drm_atomic_get_existing_plane_state() can thus be replaced by
drm_atomic_get_new_plane_state().

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index e60573e0f3e9510252e1f198b00e28bcc7987620..48237f32ac3b8f78b1495e8fbcc630be863ec7e4 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -183,11 +183,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 	ret = drm_atomic_add_affected_planes(crtc_state->state, crtc);
 	if (ret < 0)
 		return ret;
 
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);
 
 		if (!plane_state->visible)
 			continue;
 
@@ -199,11 +199,11 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
 	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
-		plane_state = drm_atomic_get_existing_plane_state(crtc_state->state, plane);
+		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
 
 		vkms_state->active_planes[i++] =

-- 
2.50.1

