Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70771165DF7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 13:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0800D6E8DD;
	Thu, 20 Feb 2020 12:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86E08862C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:59:02 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200220125900euoutp014269e5f539361bdb46b11499d4b73ff2~1HbzJqV5f0533705337euoutp01B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:59:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200220125900euoutp014269e5f539361bdb46b11499d4b73ff2~1HbzJqV5f0533705337euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582203540;
 bh=tZrGDaCqzHWhmHLZdoo3aAV9VY8K36ZSu/4KWQRAcjs=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ttI43cW539949HGhwbTKCjVs2cniZWb4UKn0xRrZ+BbD/gyNFXRUmi1lhHDAAmNZL
 ex3atI91oyjuhHe5kmYsJZ4DGW82f41WFPKGEr080Lvn25bqstvFOwnhfaIr5v42aT
 Hok7a2kw42NDRkKzL/ZLNT+lQ4Ete8+OgE/wWKYU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200220125900eucas1p108d93fb5b79f1f8a380ff03955e297c2~1Hby6-IkA0194901949eucas1p1g;
 Thu, 20 Feb 2020 12:59:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 24.1B.60698.4928E4E5; Thu, 20
 Feb 2020 12:59:00 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200220125900eucas1p11f6e56f11c8fcf25acf28b082107c89d~1HbydkUQY0196101961eucas1p1R;
 Thu, 20 Feb 2020 12:59:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200220125900eusmtrp1297724b237974fd3dd718825160ddbdd~1Hbyc0Ua61290212902eusmtrp1Y;
 Thu, 20 Feb 2020 12:59:00 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-0c-5e4e82945ae5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 78.87.07950.3928E4E5; Thu, 20
 Feb 2020 12:58:59 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200220125859eusmtip1db2444ebb034b0a9c6ee0a8cc550e663~1HbyBB1IH1117411174eusmtip1U;
 Thu, 20 Feb 2020 12:58:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm/exynos: hdmi: don't leak enable HDMI_EN regulator if
 probe fails
Date: Thu, 20 Feb 2020 13:57:26 +0100
Message-Id: <20200220125726.19442-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7djPc7pTmvziDE6uFrO4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAcxSXTUpqTmZZ
 apG+XQJXxs7266wFbfIV1zsbWRsYv0l1MXJySAiYSCzZPosVxBYSWMEosXVBBIT9hVHi18SQ
 LkYuIPszo8T3Y7cZYRpendzCDpFYzijx8dxiNggHqGPPk4tsIFVsAoYSXW+7wGwRATeJpsMz
 WUGKmAWuM0p8+7GIHSQhLBAucaFhKVARBweLgKpEy3ZTkDCvgC3Qhi9sENvkJVZvOMAM0ish
 cIBNYlP7fRaIhIvE/pY+JghbWOLV8S3sELaMxOnJPSwQDc2MEg/PrWWHcHoYJS43zYB6wlri
 zrlfYJuZBTQl1u/Shwg7Sqx/2MwMEpYQ4JO48VYQJMwMZE7aNh0qzCvR0SYEUa0mMev4Ori1
 By9cYoawPSSeXnvMDAnGWInN+1rYJjDKzULYtYCRcRWjeGppcW56arFxXmq5XnFibnFpXrpe
 cn7uJkZg3J/+d/zrDsZ9f5IOMQpwMCrx8FY0+MUJsSaWFVfmHmKU4GBWEuFV4wEK8aYkVlal
 FuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvEwSnVwDjhf3+TePA2ra3L9m1K
 5Lii+zf2umjE/pp1Dv/c66NOy/TJ+0bOW7Bc3+dm0UOTl/rHzvisWyGc7i6mpyk16bpl5Plr
 M/7W3mBoZ65wsX0jcvOv3tzdwa/a9DY52U1c9l5ZxOuU3JWIKW/anyZP5l47tfe+W9jNu0xp
 u1IreXadN3yldn9TEJ8SS3FGoqEWc1FxIgDdfMl59wIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsVy+t/xu7qTm/ziDDYet7K4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVmsPXKX3WLG5JdsDuwe97uPM3n0bVnF6PF5k1wAc5SeTVF+aUmq
 QkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexs7266wFbfIV1zsb
 WRsYv0l1MXJySAiYSLw6uYW9i5GLQ0hgKaPEpkWNbBAJGYmT0xpYIWxhiT/Xutggij4xSpzY
 /Z4JJMEmYCjR9bYLrEFEwEOi+dtxsEnMArcZJZZ+mMfSxcjBISwQKvHjXiyIySKgKtGy3RSk
 nFfAFmjxF6hd8hKrNxxgnsDIs4CRYRWjSGppcW56brGRXnFibnFpXrpecn7uJkZguG079nPL
 Dsaud8GHGAU4GJV4eCsa/OKEWBPLiitzDzFKcDArifCq8QCFeFMSK6tSi/Lji0pzUosPMZoC
 7Z7ILCWanA+MhbySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalFMH1MHJxSDYyp
 WvfD39pVdDWlVfsuCODNXybXdCfSdw37j2Pvfwvn7jzxz9zN77hSSm7gTzHW25VPGgP+G/Fc
 yglJFohq9LzGYaOb1Nj/SDLEWUm54SLbVvf+Hq1DGdszWfWSd1VKX1juuFJU9aiTf/HvJ2Jq
 jHxXnjw/wMzvXisVWVYU80eKy8PJQNRCiaU4I9FQi7moOBEAuXyN400CAAA=
X-CMS-MailID: 20200220125900eucas1p11f6e56f11c8fcf25acf28b082107c89d
X-Msg-Generator: CA
X-RootMTR: 20200220125900eucas1p11f6e56f11c8fcf25acf28b082107c89d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200220125900eucas1p11f6e56f11c8fcf25acf28b082107c89d
References: <CGME20200220125900eucas1p11f6e56f11c8fcf25acf28b082107c89d@eucas1p1.samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move enabling and disabling HDMI_EN optional regulator to probe() function
to keep track on the regulator status. This fixes following warning if
probe() fails (for example when I2C DDC adapter cannot be yet gathered
due to the missing driver). This fixes following warning observed on
Arndale5250 board with multi_v7_defconfig:

[drm] Failed to get ddc i2c adapter by node
------------[ cut here ]------------
WARNING: CPU: 0 PID: 214 at drivers/regulator/core.c:2051 _regulator_put+0x16c/0x184
Modules linked in: ...
CPU: 0 PID: 214 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200219-00040-g38af1dfafdbb #7570
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c0312258>] (unwind_backtrace) from [<c030cc10>] (show_stack+0x10/0x14)
[<c030cc10>] (show_stack) from [<c0f0d3a0>] (dump_stack+0xcc/0xe0)
[<c0f0d3a0>] (dump_stack) from [<c0346a58>] (__warn+0xe0/0xf8)
[<c0346a58>] (__warn) from [<c0346b20>] (warn_slowpath_fmt+0xb0/0xb8)
[<c0346b20>] (warn_slowpath_fmt) from [<c0893f58>] (_regulator_put+0x16c/0x184)
[<c0893f58>] (_regulator_put) from [<c0893f8c>] (regulator_put+0x1c/0x2c)
[<c0893f8c>] (regulator_put) from [<c09b2664>] (release_nodes+0x17c/0x200)
[<c09b2664>] (release_nodes) from [<c09aebe8>] (really_probe+0x10c/0x350)
[<c09aebe8>] (really_probe) from [<c09aefa8>] (driver_probe_device+0x60/0x1a0)
[<c09aefa8>] (driver_probe_device) from [<c09af288>] (device_driver_attach+0x58/0x60)
[<c09af288>] (device_driver_attach) from [<c09af310>] (__driver_attach+0x80/0xbc)
[<c09af310>] (__driver_attach) from [<c09ace34>] (bus_for_each_dev+0x68/0xb4)
[<c09ace34>] (bus_for_each_dev) from [<c09ae00c>] (bus_add_driver+0x130/0x1e8)
[<c09ae00c>] (bus_add_driver) from [<c09afd98>] (driver_register+0x78/0x110)
[<c09afd98>] (driver_register) from [<bf139558>] (exynos_drm_init+0xe8/0x11c [exynosdrm])
[<bf139558>] (exynos_drm_init [exynosdrm]) from [<c0302fa8>] (do_one_initcall+0x50/0x220)
[<c0302fa8>] (do_one_initcall) from [<c03dc02c>] (do_init_module+0x60/0x210)
[<c03dc02c>] (do_init_module) from [<c03daf44>] (load_module+0x1c0c/0x2310)
[<c03daf44>] (load_module) from [<c03db85c>] (sys_finit_module+0xac/0xbc)
[<c03db85c>] (sys_finit_module) from [<c0301000>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xecca3fa8 to 0xecca3ff0)
...
---[ end trace 276c91214635905c ]---

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 9ff921f43a93..f141916eade6 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1805,18 +1805,10 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 
 	hdata->reg_hdmi_en = devm_regulator_get_optional(dev, "hdmi-en");
 
-	if (PTR_ERR(hdata->reg_hdmi_en) != -ENODEV) {
+	if (PTR_ERR(hdata->reg_hdmi_en) != -ENODEV)
 		if (IS_ERR(hdata->reg_hdmi_en))
 			return PTR_ERR(hdata->reg_hdmi_en);
 
-		ret = regulator_enable(hdata->reg_hdmi_en);
-		if (ret) {
-			DRM_DEV_ERROR(dev,
-				      "failed to enable hdmi-en regulator\n");
-			return ret;
-		}
-	}
-
 	return hdmi_bridge_init(hdata);
 }
 
@@ -2023,6 +2015,15 @@ static int hdmi_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (!IS_ERR(hdata->reg_hdmi_en)) {
+		ret = regulator_enable(hdata->reg_hdmi_en);
+		if (ret) {
+			DRM_DEV_ERROR(dev,
+			      "failed to enable hdmi-en regulator\n");
+			goto err_hdmiphy;
+		}
+	}
+
 	pm_runtime_enable(dev);
 
 	audio_infoframe = &hdata->audio.infoframe;
@@ -2047,7 +2048,8 @@ static int hdmi_probe(struct platform_device *pdev)
 
 err_rpm_disable:
 	pm_runtime_disable(dev);
-
+	if (!IS_ERR(hdata->reg_hdmi_en))
+		regulator_disable(hdata->reg_hdmi_en);
 err_hdmiphy:
 	if (hdata->hdmiphy_port)
 		put_device(&hdata->hdmiphy_port->dev);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
