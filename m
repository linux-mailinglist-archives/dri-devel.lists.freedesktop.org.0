Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED2940EF1B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 04:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674566EA56;
	Fri, 17 Sep 2021 02:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id EAE6E6EA56
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 02:07:50 +0000 (UTC)
Received: from BC-Mail-Ex12.internal.baidu.com (unknown [172.31.51.52])
 by Forcepoint Email with ESMTPS id 0D4B134AA735FED9982D;
 Fri, 17 Sep 2021 10:07:48 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex12.internal.baidu.com (172.31.51.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 17 Sep 2021 10:07:47 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 10:07:47 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/tegra: sor: Make use of the helper function
 dev_err_probe()
Date: Fri, 17 Sep 2021 10:07:41 +0800
Message-ID: <20210917020741.17525-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex16.internal.baidu.com (10.127.64.39) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
And using dev_err_probe() can reduce code size, the error value
gets printed.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Fix compile error-add ';'

 drivers/gpu/drm/tegra/sor.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 0ea320c1092b..d7964e498da9 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -2964,11 +2964,9 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 	int err;
 
 	sor->avdd_io_supply = devm_regulator_get(sor->dev, "avdd-io-hdmi-dp");
-	if (IS_ERR(sor->avdd_io_supply)) {
-		dev_err(sor->dev, "cannot get AVDD I/O supply: %ld\n",
-			PTR_ERR(sor->avdd_io_supply));
-		return PTR_ERR(sor->avdd_io_supply);
-	}
+	if (IS_ERR(sor->avdd_io_supply))
+		return dev_err_probe(sor->dev, PTR_ERR(sor->avdd_io_supply),
+				     "cannot get AVDD I/O supply\n");
 
 	err = tegra_sor_enable_regulator(sor, sor->avdd_io_supply);
 	if (err < 0) {
@@ -2978,11 +2976,9 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 	}
 
 	sor->vdd_pll_supply = devm_regulator_get(sor->dev, "vdd-hdmi-dp-pll");
-	if (IS_ERR(sor->vdd_pll_supply)) {
-		dev_err(sor->dev, "cannot get VDD PLL supply: %ld\n",
-			PTR_ERR(sor->vdd_pll_supply));
-		return PTR_ERR(sor->vdd_pll_supply);
-	}
+	if (IS_ERR(sor->vdd_pll_supply))
+		return dev_err_probe(sor->dev, PTR_ERR(sor->vdd_pll_supply),
+				     "cannot get VDD PLL supply\n");
 
 	err = tegra_sor_enable_regulator(sor, sor->vdd_pll_supply);
 	if (err < 0) {
@@ -2992,11 +2988,9 @@ static int tegra_sor_hdmi_probe(struct tegra_sor *sor)
 	}
 
 	sor->hdmi_supply = devm_regulator_get(sor->dev, "hdmi");
-	if (IS_ERR(sor->hdmi_supply)) {
-		dev_err(sor->dev, "cannot get HDMI supply: %ld\n",
-			PTR_ERR(sor->hdmi_supply));
-		return PTR_ERR(sor->hdmi_supply);
-	}
+	if (IS_ERR(sor->hdmi_supply))
+		return dev_err_probe(sor->dev, PTR_ERR(sor->hdmi_supply),
+				     "cannot get HDMI supply\n");
 
 	err = tegra_sor_enable_regulator(sor, sor->hdmi_supply);
 	if (err < 0) {
-- 
2.25.1

