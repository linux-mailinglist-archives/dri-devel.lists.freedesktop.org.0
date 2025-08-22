Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149BB3224F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 20:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC3410EB85;
	Fri, 22 Aug 2025 18:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FwwFLtVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA6A10EB88;
 Fri, 22 Aug 2025 18:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755887809;
 bh=emo1Y+He1rL7+g/lnBKo9KHUxgoj16EF+fdtTkETCdg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FwwFLtVtG4Bv7Sw2mnor1fBatS0kOibcyamFMwJSoKlggaHCcZxAsUURHcDEsv2CQ
 ghmtO83Z4zQNVI96GrqPFgHO5v6bRsIrx4w3+44deJ2LoagxGmoKJ1nChvoCmQP28Q
 rqpl1eJnGVep0DoBXXuS/lcYPRAWTd+55uWemfEd+xlAoxwHN5a3qbhuRyt+GzBZUS
 Z68TujGclw69uzR4Cc3cya1YXAOgqoB57yCiUfxAaTPSEYcLXrAKQKXZRs8KDBYxDF
 9tEQ4B/ng2NGDNbUIydt5NeSwl/0Qid/tn2sl//x7KN0wR8QctScU+VThlnBBNVVLQ
 jdQ/+AwVtPjvw==
Received: from [127.0.1.1] (unknown
 [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2737517E159C;
 Fri, 22 Aug 2025 20:36:43 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 22 Aug 2025 14:36:12 -0400
Subject: [PATCH RFC 2/5] drm/colorop: Export drm_colorop_cleanup() so
 drivers can extend it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250822-mtk-post-blend-color-pipeline-v1-2-a9446d4aca82@collabora.com>
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
In-Reply-To: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
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

Export drm_colorop_cleanup() so drivers subclassing drm_colorop can
reuse this function in subclass cleanup routines.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_colorop.c | 3 ++-
 include/drm/drm_colorop.h     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index d53de1438d23def74a77730cacd3651131e82cbe..8a27861a367ab321d45835099f438ee5e2abd709 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -186,7 +186,7 @@ static int drm_plane_colorop_init(struct drm_device *dev,
  *
  * @colorop: The drm_colorop object to be cleaned
  */
-static void drm_colorop_cleanup(struct drm_colorop *colorop)
+void drm_colorop_cleanup(struct drm_colorop *colorop)
 {
 	struct drm_device *dev = colorop->dev;
 	struct drm_mode_config *config = &dev->mode_config;
@@ -201,6 +201,7 @@ static void drm_colorop_cleanup(struct drm_colorop *colorop)
 
 	kfree(colorop->state);
 }
+EXPORT_SYMBOL(drm_colorop_cleanup);
 
 /**
  * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 710a6199ebc5498a3f664de39ea07dbc95944eb7..158c2b8f775b99fd0a0efa03f2c019f14a9bc8b3 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -374,6 +374,7 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 	return mo ? obj_to_colorop(mo) : NULL;
 }
 
+void drm_colorop_cleanup(struct drm_colorop *colorop);
 void drm_colorop_pipeline_destroy(struct drm_device *dev);
 
 int drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,

-- 
2.47.2

