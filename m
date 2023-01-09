Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247E36633A1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 23:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B8010E09F;
	Mon,  9 Jan 2023 22:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5E510E513
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 22:00:59 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230109220058euoutp018f89581191253e63d2c0c1d82462140f~4wv4lmjDL1258712587euoutp01R
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 22:00:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230109220058euoutp018f89581191253e63d2c0c1d82462140f~4wv4lmjDL1258712587euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673301658;
 bh=oNj316/wrNXkPWQOOqvZpTUN5bmBqJu7fq2iwsgnbTg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=dHk3FqVcHjrbPUwPI2I480gxsqwA4b7jYk/Qsn/Sxc4+RPwcSVVTJRfhlo1mBGhHb
 8fa/L+cCVPq6i50rK1klJ1w9+tJkQo1WgAOanTbTM2rxfpy0IrS9hUHicsNIujyvp4
 YTrSOGuZrIOXIrT8ubMb6YzafE/tiVMG1eWrVNGw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230109220057eucas1p2eb238fa66cb3680d4e7d521e74686cfc~4wv3cfFBN1519015190eucas1p2b;
 Mon,  9 Jan 2023 22:00:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id D4.9B.56180.99E8CB36; Mon,  9
 Jan 2023 22:00:57 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230109220056eucas1p26418012878272961a3a21a365192ef60~4wv3IR-ox1575115751eucas1p2Y;
 Mon,  9 Jan 2023 22:00:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230109220056eusmtrp2954b769b5f4561fa8c26d06a2e61f62f~4wv3Hrl2E3272032720eusmtrp2L;
 Mon,  9 Jan 2023 22:00:56 +0000 (GMT)
X-AuditID: cbfec7f2-acbff7000000db74-fd-63bc8e998d31
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 0C.AA.52424.89E8CB36; Mon,  9
 Jan 2023 22:00:56 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230109220056eusmtip1f48eb352646e98805ed365f88d9d33e0~4wv2iZxCr1488214882eusmtip1U;
 Mon,  9 Jan 2023 22:00:56 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Subject: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion
Date: Mon,  9 Jan 2023 23:00:33 +0100
Message-Id: <20230109220033.31202-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsWy7djPc7oz+/YkG/xdxGZx4voiJov/2yYy
 W1z5+p7N4s2jI8wWP9u3MFksmM1tsfbIXXaLY4tOsljMWXqCxeL9zluMDlwe72+0snvs/baA
 xWPnrLvsHk8nTGb3uHNtD5vH/e7jTB6bl9R79G1ZxRjAEcVlk5Kak1mWWqRvl8CVseLqBOaC
 PewV/057NTBuZ+ti5OSQEDCRuLL8I0sXIxeHkMAKRolPXddYQRJCAl8YJbq/B0AkPjNKzFjU
 xgjTMan9NlTHckaJPQfPsUI4QB1PVx5jBqliEzCU6HrbBbZDRMBN4seByYwgRcwCN5kkjnx/
 xgSSEBYIlng+fy5QgoODRUBVYuNjbpAwr4CtxIOjD1kgtslLtD7fygoRF5Q4OfMJWJwZKN68
 dTYzyEwJgTMcEp/+3mSCaHCR2PP/DtRzwhKvjm9hh7BlJP7vnM8E0dDOKLHg930oZwKjRMPz
 W1DPWUvcOfeLDeQiZgFNifW79EFMCQFHiQkzCiFMPokbbwUhbuCTmLRtOjNEmFeio00IYoaa
 xKzj6+C2HrxwiRnC9pA4Mn8tCyR0YyXOrOlknMCoMAvJZ7OQfDYL4YQFjMyrGMVTS4tz01OL
 DfNSy/WKE3OLS/PS9ZLzczcxAlPU6X/HP+1gnPvqo94hRiYOxkOMEhzMSiK8Kzn3JAvxpiRW
 VqUW5ccXleakFh9ilOZgURLnnbF1frKQQHpiSWp2ampBahFMlomDU6qByUrUaf/vJJOKr75O
 vprnO3jtrYWfK9T4uS3/Vpygb5hY5n1218+dpm0u32pU7vktX1oj/uodQ9ma+lt1zzzN7NS9
 g0vV/NQfHUhLCrqSd3fpU/nV9j90i/gnvtpw3e6live0aqfcJI53l7M3CUnf+rL02Y4ehTSj
 K1K9Mx9ukNm18IWlhqf3856HQSuPx37sVhR951tu7GWyKzc/93bjysJ3ocW7i93mvroTdGap
 9dS4F0vuMn3seFO8zqVonrrdqSTu6JBEJ2ObHofTxlllaWr/39dMLtevSxcufDPjV+rXjmuG
 XGcKOee8YXkqfiDy7Dcru58WvO3GXiEpVbL/GN13sD2c6agafNggdqUSS3FGoqEWc1FxIgBo
 MqbVwAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42I5/e/4Xd0ZfXuSDaZv0rY4cX0Rk8X/bROZ
 La58fc9m8ebREWaLn+1bmCwWzOa2WHvkLrvFsUUnWSzmLD3BYvF+5y1GBy6P9zda2T32flvA
 4rFz1l12j6cTJrN73Lm2h83jfvdxJo/NS+o9+rasYgzgiNKzKcovLUlVyMgvLrFVija0MNIz
 tLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLWHF1AnPBHvaKf6e9Ghi3s3UxcnJICJhI
 TGq/zdLFyMUhJLCUUWL6ts+MEAkZiZPTGlghbGGJP9e62CCKPjFKLG1fxgKSYBMwlOh62wU2
 SUTAQ+Li6wawImaBu0wSR+7+YAZJCAsESizdvYy9i5GDg0VAVWLjY26QMK+ArcSDow9ZIBbI
 S7Q+38oKEReUODnzCVicGSjevHU28wRGvllIUrOQpBYwMq1iFEktLc5Nzy020itOzC0uzUvX
 S87P3cQIjI5tx35u2cG48tVHvUOMTByMhxglOJiVRHhXcu5JFuJNSaysSi3Kjy8qzUktPsRo
 CnTeRGYp0eR8YHzmlcQbmhmYGpqYWRqYWpoZK4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUw
 zTz0a1mYQ/LMtQwsBy7PV4vrnb1K7ZzIL7ZL3+LCG3aeuKV9+1KlXp/PfHlHh89vV+26mecw
 i+9TZJRAAxfn1hWT+ivmmz9T3Biqe0O/X0VJ9GCU2NYZuw17FKptd7Grt0udLe0ovDhdXFQx
 X6D0HKPxqR9Wn3n8Z1nVCdcLC259E/bt4ck+UWFfudu3nJ6KmVZYMdguEI3WUKk6cP7TZfs3
 91pf82g5z+d0bC157jMh+U2DrFW9xbcetxnvP6llPOlaeHttbbWE7SI++/m7fpx9IXH41Nw7
 obYBTZe86m5ZV4b/+S2r19cfxv1D91W+0TbFoiX7XBRXsTfmtlyyrvl1fWOqWNB5aa5Fy28o
 sRRnJBpqMRcVJwIAsoAqARcDAAA=
X-CMS-MailID: 20230109220056eucas1p26418012878272961a3a21a365192ef60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230109220056eucas1p26418012878272961a3a21a365192ef60
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230109220056eucas1p26418012878272961a3a21a365192ef60
References: <CGME20230109220056eucas1p26418012878272961a3a21a365192ef60@eucas1p2.samsung.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_regulator_get_enable_optional() function returns 0 on success, so
use it for the check if function succeded instead of the -ENODEV value.

Fixes: 429e87063661 ("drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 7642f740272b..534621a13a34 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
 
 	ret = devm_regulator_get_enable_optional(dev, "hdmi");
-	if (ret != -ENODEV)
+	if (ret < 0)
 		return ret;
 
 	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
-- 
2.39.0

