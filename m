Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D0F4764D2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CC110FADF;
	Wed, 15 Dec 2021 21:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76AC10FADF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 21:48:23 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFF2cfV011435;
 Wed, 15 Dec 2021 22:48:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=TuPgsiRrJ7CEkwzlT3BG+2xG5KFUoOpxKTkrihEVGs4=;
 b=k4AJZFXVGOVXA2UCn5uARPNPLnyoKZyAGDf5uPro9UPZEdD7/6Uf3Wm1QyG9ZL1hZQ7f
 0qJ5eAYm04Ph9Gw68yaKDaJgqKfu89vVdMI7w9YopTV0MeK9n8+yxnsirQSyURkYdmS0
 1UotT2WBRBUSa9BTLR97FflolKPLEhuYVooNXjjqCxJbu5lu6wzKlusVYykrhCZ9Ke3G
 5yOnOvXPPwGOwgcbbRkE7V4cDqpvMloZR30raDKhFEq3N4COCQ7RM1FHOrtlIF5HLtI/
 9T7b96LOxk07WWY4j+Km9++MKuYtPMhPyQ3rir6DBNmDci2vsTtdqyeVNI74V58ibMrS iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cy79j6180-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 22:48:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5777210002A;
 Wed, 15 Dec 2021 22:48:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D87420A74E;
 Wed, 15 Dec 2021 22:48:19 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 22:48:18
 +0100
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] drm/stm: ltdc: add per plane update support
Date: Wed, 15 Dec 2021 22:48:17 +0100
Message-ID: <20211215214817.20310-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_13,2021-12-14_01,2021-12-02_01
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

Recent ltdc hardware versions offer the ability
to update a plane independently of others planes.
This is could be useful especially if a plane is
assigned to another OS.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 26 +++++++++++++++++++++++---
 drivers/gpu/drm/stm/ltdc.h |  1 +
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index b819f4cbcc3d..862d43fe3087 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -197,6 +197,10 @@
 
 #define LXCFBLNR_CFBLN	GENMASK(10, 0)	/* Color Frame Buffer Line Number */
 
+#define LXRCR_IMR	BIT(0)		/* IMmediate Reload */
+#define LXRCR_VBR	BIT(1)		/* Vertical Blanking Reload */
+#define LXRCR_GRMSK	BIT(2)		/* Global (centralized) Reload MaSKed */
+
 #define CLUT_SIZE	256
 
 #define CONSTA_MAX	0xFF		/* CONSTant Alpha MAX= 1.0 */
@@ -534,7 +538,8 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
 	regmap_set_bits(ldev->regmap, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
 
 	/* Commit shadow registers = update planes at next vblank */
-	regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_VBR);
+	if (!ldev->caps.plane_reg_shadow)
+		regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_VBR);
 
 	drm_crtc_vblank_on(crtc);
 }
@@ -553,7 +558,8 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
 	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
 
 	/* immediately commit disable of layers before switching off LTDC */
-	regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_IMR);
+	if (!ldev->caps.plane_reg_shadow)
+		regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_IMR);
 
 	pm_runtime_put_sync(ddev->dev);
 }
@@ -769,7 +775,8 @@ static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
 	ltdc_crtc_update_clut(crtc);
 
 	/* Commit shadow registers = update planes at next vblank */
-	regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_VBR);
+	if (!ldev->caps.plane_reg_shadow)
+		regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_VBR);
 
 	if (event) {
 		crtc->state->event = NULL;
@@ -1010,6 +1017,11 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	val |= LXCR_LEN;
 	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN, val);
 
+	/* Commit shadow registers = update plane at next vblank */
+	if (ldev->caps.plane_reg_shadow)
+		regmap_write_bits(ldev->regmap, LTDC_L1RCR + lofs,
+				  LXRCR_IMR | LXRCR_VBR | LXRCR_GRMSK, LXRCR_VBR);
+
 	ldev->plane_fpsi[plane->index].counter++;
 
 	mutex_lock(&ldev->err_lock);
@@ -1035,6 +1047,11 @@ static void ltdc_plane_atomic_disable(struct drm_plane *plane,
 	/* disable layer */
 	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN, 0);
 
+	/* Commit shadow registers = update plane at next vblank */
+	if (ldev->caps.plane_reg_shadow)
+		regmap_write_bits(ldev->regmap, LTDC_L1RCR + lofs,
+				  LXRCR_IMR | LXRCR_VBR | LXRCR_GRMSK, LXRCR_VBR);
+
 	DRM_DEBUG_DRIVER("CRTC:%d plane:%d\n",
 			 oldstate->crtc->base.id, plane->base.id);
 }
@@ -1307,6 +1324,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 			ldev->caps.pad_max_freq_hz = 65000000;
 		ldev->caps.nb_irq = 2;
 		ldev->caps.ycbcr_output = false;
+		ldev->caps.plane_reg_shadow = false;
 		break;
 	case HWVER_20101:
 		ldev->caps.layer_ofs = LAY_OFS_0;
@@ -1316,6 +1334,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.pad_max_freq_hz = 150000000;
 		ldev->caps.nb_irq = 4;
 		ldev->caps.ycbcr_output = false;
+		ldev->caps.plane_reg_shadow = false;
 		break;
 	case HWVER_40100:
 		ldev->caps.layer_ofs = LAY_OFS_1;
@@ -1325,6 +1344,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
 		ldev->caps.pad_max_freq_hz = 90000000;
 		ldev->caps.nb_irq = 2;
 		ldev->caps.ycbcr_output = true;
+		ldev->caps.plane_reg_shadow = true;
 		break;
 	default:
 		return -ENODEV;
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index f04fcebb5223..68a5a199e320 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -22,6 +22,7 @@ struct ltdc_caps {
 	int pad_max_freq_hz;	/* max frequency supported by pad */
 	int nb_irq;		/* number of hardware interrupts */
 	bool ycbcr_output;	/* ycbcr output converter supported */
+	bool plane_reg_shadow;	/* plane shadow registers ability */
 };
 
 #define LTDC_MAX_LAYER	4
-- 
2.17.1

