Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EB4402B94
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE84B892C8;
	Tue,  7 Sep 2021 15:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25085892C8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:17:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 187Eun7c017194;
 Tue, 7 Sep 2021 17:17:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Z3kLq+iRfOzStH8O3le61AdJ+iVekYXxLeWKDMeJ8KA=;
 b=su13Up+Nlw1v0E/ZGKxVRciKeB31ArDhisMq3fGZ4BIB/0YizHXqKKvubD/W1gc2cKGL
 vUs1yfkedxw7y+pJo5SPhYk1djVnO9QPDOW38ODkcBnY+HB4RwNz2vnDUCzKeKTHYF6A
 PNnk/0uHOT/LezrbDS1DOsxJm4Z1RvBlaH1bXhSeRqfuxmgcWKH5ivFWk0CW6pRblbe7
 dcPbFB7o59uQaEv2Vapa1+Olz9v8Sj5Jid6ae7A+uH4b3jHU5LdYl+UTXdwU3ZfEw0l/
 yWGHuRq8FyvVN/hfwKn7XJUjs4L3Bjdxcu7Km2xPQ5UScxhg8nf1kMJFBLyyXtdJO7D9 mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3awyx2um6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 17:17:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2683310002A;
 Tue,  7 Sep 2021 17:17:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1629D22A6C9;
 Tue,  7 Sep 2021 17:17:31 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep 2021 17:17:30
 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@st.com>
Subject: [PATCH v2] drm/stm: ltdc: add layer alpha support
Date: Tue, 7 Sep 2021 17:15:34 +0200
Message-ID: <20210907151534.6013-1-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_05,2021-09-07_01,2020-04-07_01
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

Android Hardware Composer supports alpha values applied to layers.
Enabling non-opaque layers for the STM CRTC could help offload GPU
resources for screen composition.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Acked-by: Yannick Fertre <yannick.fertre@foss.st.com>
Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 195de30eb90c..e0fef8bacfa8 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -845,7 +845,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
 
 	/* Specifies the constant alpha value */
-	val = CONSTA_MAX;
+	val = newstate->alpha >> 8;
 	reg_update_bits(ldev->regs, LTDC_L1CACR + lofs, LXCACR_CONSTA, val);
 
 	/* Specifies the blending factors */
@@ -997,6 +997,8 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 
 	drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
 
+	drm_plane_create_alpha_property(plane);
+
 	DRM_DEBUG_DRIVER("plane:%d created\n", plane->base.id);
 
 	return plane;
-- 
2.17.1

