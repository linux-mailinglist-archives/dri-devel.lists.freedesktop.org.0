Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C3802FC8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 11:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60A710E0A1;
	Mon,  4 Dec 2023 10:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0598D10E30A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 10:12:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3B47qmuS011775; Mon, 4 Dec 2023 11:11:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=uxlxZGGWiCK9ukUifKVDu5ceC0YPpoymX4MhiItDcpE=; b=xf
 yhtO6yrjNOd14b9FGi4oHKHKiQMsBanHfnxjgLsckWsELDwMCILUvv6YGstnZzXD
 tVyMNCojHdhbiDRtZkLUKhk0t3f0VT4x+TG5BndWNpo9WGpZHi9ewUC2CPv2gkTK
 jEaqT6SnXufoeD4bvByKr3+3QuxZDt8XwAN2QwXJGI6rK9gQ1PCbreZBshukNMB2
 hoPzn6i9gzTMA7Kv2EloombwN+bWsSBTl4eS865G5xXeK6bdtvRoSnGqZGMvS4vi
 cW5SvgOf2761MEQ9HdLP+xSHrwM7iWOEd1gsMEmDbWSnkLQVSjGDV/zpzc5U78o7
 RBGALyruR+u/o2HFkbRQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uqtvkxv31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 11:11:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07AD6100089;
 Mon,  4 Dec 2023 11:11:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0B9921ADB1;
 Mon,  4 Dec 2023 11:11:55 +0100 (CET)
Received: from localhost (10.252.13.105) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 4 Dec
 2023 11:11:53 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v2 1/4] drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro
Date: Mon, 4 Dec 2023 11:11:10 +0100
Message-ID: <20231204101113.276368-2-raphael.gallais-pou@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101113.276368-1-raphael.gallais-pou@foss.st.com>
References: <20231204101113.276368-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.13.105]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

