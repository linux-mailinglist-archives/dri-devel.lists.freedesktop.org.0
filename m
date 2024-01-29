Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF08402FE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 11:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFDB11281C;
	Mon, 29 Jan 2024 10:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844BB11282E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 10:41:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T61Eh1004842; Mon, 29 Jan 2024 11:41:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=uxlxZGGWiCK9ukUifKVDu5ceC0YPpoymX4MhiItDcpE=; b=Gg
 /+p5iMgUrTaGxRwwzg8NlPbIAerP7E8cISQoELZMJc7bm+UUSDlYXHWzoDCNQTUd
 ipWku2L75D+TaPQDzCVetkVrQ/M3ZoZY9WfzZAB2RUbQwxOjb7u1DusY7CDQUuih
 NVZ/zZo0ic0mvX9WstNhvoMFVlqQH5JEvGEVQDH5lb9MAMuOo3QlLE8/skVR0CWq
 v7uZ6sbIU+3etG2+uZW/rwJBNaHX8vQEqwiH2iKE0qoR237L2lN4NzS7Ake/GXCi
 I/48mToYuR/YOS1nIiHngU9yMu4fW7uUi/vyywUe4om//exR54KoEBge636jQP4o
 yXGntVs7gGjHy3D0EEWQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vvr4kpn7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 11:41:21 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0D75E10005A;
 Mon, 29 Jan 2024 11:41:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0609F216837;
 Mon, 29 Jan 2024 11:41:18 +0100 (CET)
Received: from localhost (10.252.28.37) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 29 Jan
 2024 11:41:17 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH RESEND v3 1/3] drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS()
 macro
Date: Mon, 29 Jan 2024 11:41:04 +0100
Message-ID: <20240129104106.43141-2-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.28.37]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_06,2024-01-29_01,2023-05-22_02
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
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use RUNTIME_PM_OPS() instead of the old SET_SYSTEM_SLEEP_PM_OPS().
This means we don't need  __maybe_unused on the functions.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index d5f8c923d7bc..b1aee43d51e9 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -544,7 +544,7 @@ static void dw_mipi_dsi_stm_remove(struct platform_device *pdev)
 	regulator_disable(dsi->vdd_supply);
 }
 
-static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
+static int dw_mipi_dsi_stm_suspend(struct device *dev)
 {
 	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
 
@@ -556,7 +556,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
+static int dw_mipi_dsi_stm_resume(struct device *dev)
 {
 	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
 	int ret;
@@ -580,8 +580,8 @@ static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dw_mipi_dsi_stm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
-				dw_mipi_dsi_stm_resume)
+	SYSTEM_SLEEP_PM_OPS(dw_mipi_dsi_stm_suspend,
+			    dw_mipi_dsi_stm_resume)
 };
 
 static struct platform_driver dw_mipi_dsi_stm_driver = {
-- 
2.25.1

