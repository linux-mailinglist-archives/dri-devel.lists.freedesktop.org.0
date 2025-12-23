Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02165CDA342
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6765810E146;
	Tue, 23 Dec 2025 18:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="cl64Vq1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9195F10E146
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766512924; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WfJBSHvwBxpz/T1hEQ+0DGlss+E9/4l47FVJpgUJA87eIAQzQS8mvNq/hSFRefccnHbtl2S2+Mdq8JcM1Ocg//Crmsa47mfSgsM7pVFgwiqX4OWNlMic6nlO6rgyVdrXRSSnIZrAxWI+pa312twV1h4TLtXaAnj465WdC2U20vk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766512924;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Y2sg/43B/M/N6T5dk67t/7KTqteR6KXHAqu/Msin4/Y=; 
 b=OjSdcQY4V6k1HrYAmAcEGjxreonNb/RyBEWBIShBXkbMLioPTaB1pJMIHsII4bsAKGqXOYcBifb3mClpQFELGg8r9sjR+saOokUxLh71ROv9I757vCFBAtaklNawmucv+3E/pMknk58xem35Mfmo6riZzvm9mXdw74gjEEADULc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512924; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Y2sg/43B/M/N6T5dk67t/7KTqteR6KXHAqu/Msin4/Y=;
 b=cl64Vq1Fb/bP+Ec896+b3tLCBvDAl0tG32I26BG/PuxgzvA9ZVCwa1wRtzrJYjfv
 OLXonZVVR6HF/fEKnQ9VPQJECObKXmnfQuueMJM4yIipzQlvRcPbhANhrpNYj/Z7Svp
 WOIz/ob3zdaRiLF3WdasTp23nsR3JskmT8deq/S4=
Received: by mx.zohomail.com with SMTPS id 176651292198076.79937415292932;
 Tue, 23 Dec 2025 10:02:01 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:22 -0300
Subject: [PATCH v3 02/21] drm/colorop: Allow parenting colorop to CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-2-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=4585;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=+4lFHIOYldd0VRCezp6RS36U7f4KcV6URV+Z9zloWmk=;
 b=b2spIzcZQKGM2Y/y9vddf+sOUbr2tnLuzWDwuP1EReTKJoKMlIlaLzDTT33I09EwSE+6cTGyb
 C9ghTeKRmEZCLPFHdxOaOjiE1GkLnJdTRsllx0PUZY5oewz3ies06py
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

In order to allow for post-blend color pipelines, colorops need to be
assigned to a crtc rather than a plane. Add a crtc to the colorop
struct to enable this. Either the plane or the crtc will be set for any
given colorop depending on whether it is part of a pre- or post-blend
color pipeline.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c  |  6 +++---
 drivers/gpu/drm/drm_colorop.c | 25 +++++++++++++++++++++++++
 include/drm/drm_colorop.h     | 17 +++++++++++++++--
 3 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6d3ea8056b603..e9022d7ad04b0 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -620,7 +620,7 @@ drm_atomic_get_colorop_state(struct drm_atomic_state *state,
 	if (colorop_state)
 		return colorop_state;
 
-	ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
+	ret = drm_colorop_modeset_lock(colorop, state->acquire_ctx);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -2012,10 +2012,10 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 
 	list_for_each_entry(colorop, &config->colorop_list, head) {
 		if (take_locks)
-			drm_modeset_lock(&colorop->plane->mutex, NULL);
+			drm_colorop_modeset_lock(colorop, NULL);
 		drm_atomic_colorop_print_state(p, colorop->state);
 		if (take_locks)
-			drm_modeset_unlock(&colorop->plane->mutex);
+			drm_colorop_modeset_unlock(colorop);
 	}
 
 	list_for_each_entry(plane, &config->plane_list, head) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 44eb823585d2e..bf3b8ff51571b 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -24,6 +24,7 @@
  *
  */
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_colorop.h>
 #include <drm/drm_print.h>
 #include <drm/drm_drv.h>
@@ -597,3 +598,27 @@ void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_color
 	colorop->next = next;
 }
 EXPORT_SYMBOL(drm_colorop_set_next_property);
+
+int drm_colorop_modeset_lock(struct drm_colorop *colorop, struct drm_modeset_acquire_ctx *ctx)
+{
+	if (colorop->plane)
+		return drm_modeset_lock(&colorop->plane->mutex, ctx);
+
+	if (colorop->crtc)
+		return drm_modeset_lock(&colorop->crtc->mutex, ctx);
+
+	drm_err(colorop->dev, "Dangling colorop, it must be attached to a plane or a CRTC\n");
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_colorop_modeset_lock);
+
+void drm_colorop_modeset_unlock(struct drm_colorop *colorop)
+{
+	if (colorop->plane)
+		drm_modeset_unlock(&colorop->plane->mutex);
+	else if (colorop->crtc)
+		drm_modeset_unlock(&colorop->crtc->mutex);
+	else
+		drm_err(colorop->dev, "Dangling colorop, it must be attached to a plane or a CRTC\n");
+}
+EXPORT_SYMBOL(drm_colorop_modeset_unlock);
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index a3a32f9f918c7..49d342b7f8b0b 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -29,6 +29,7 @@
 
 #include <drm/drm_mode_object.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_modeset_lock.h>
 #include <drm/drm_property.h>
 
 /* DRM colorop flags */
@@ -223,11 +224,21 @@ struct drm_colorop {
 	/**
 	 * @plane:
 	 *
-	 * The plane on which the colorop sits. A drm_colorop is always unique
-	 * to a plane.
+	 * The plane on which the colorop sits if it is a pre-blend colorop.
+	 * In this case it is unique to the plane.
+	 * NOTE: plane and crtc are mutually exclusive.
 	 */
 	struct drm_plane *plane;
 
+	/**
+	 * @crtc:
+	 *
+	 * The CRTC on which the colorop sits if it is a post-blend colorop.
+	 * In this case it is unique to the CRTC.
+	 * NOTE: plane and crtc are mutually exclusive.
+	 */
+	struct drm_crtc *crtc;
+
 	/**
 	 * @state:
 	 *
@@ -460,5 +471,7 @@ const char *
 drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+int drm_colorop_modeset_lock(struct drm_colorop *colorop, struct drm_modeset_acquire_ctx *ctx);
+void drm_colorop_modeset_unlock(struct drm_colorop *colorop);
 
 #endif /* __DRM_COLOROP_H__ */

-- 
2.51.0

