Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3238BAB95A5
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 07:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AAB10E99B;
	Fri, 16 May 2025 05:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E7D10E86B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 12:36:15 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZyqSl3BGRzW88
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 20:36:07 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4ZyqSm15rszBRHKQ
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 20:36:08 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZyqSY3sJvz5B1Gq;
 Thu, 15 May 2025 20:35:57 +0800 (CST)
Received: from njy2app04.zte.com.cn ([10.40.12.64])
 by mse-fl1.zte.com.cn with SMTP id 54FCZoE7025362;
 Thu, 15 May 2025 20:35:50 +0800 (+08)
 (envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app01[null]) by mapi (Zmail) with MAPI id mid201;
 Thu, 15 May 2025 20:35:54 +0800 (CST)
Date: Thu, 15 May 2025 20:35:54 +0800 (CST)
X-Zmail-TransId: 2af96825dfaaffffffffa32-c85aa
X-Mailer: Zmail v1.0
Message-ID: <20250515203554564-j1jBXUXR6bdiN6zARicC@zte.com.cn>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <hjc@rock-chips.com>
Cc: <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <fang.yumeng@zte.com.cn>, <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
 <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vcm9ja2NoaXA6IFVzZSBkZXZfZXJyX3Byb2JlKCkgdG8gc2ltcGxpZnkgY29kZQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 54FCZoE7025362
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6825DFB6.000/4ZyqSl3BGRzW88
X-Mailman-Approved-At: Fri, 16 May 2025 05:50:09 +0000
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

From: Yumeng Fang <fang.yumeng@zte.com.cn>

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index f737e7d46e66..acb59b25d928 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -213,17 +213,13 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)

 	if (IS_ERR(hdmi->ref_clk)) {
 		ret = PTR_ERR(hdmi->ref_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get reference clock\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get reference clock\n");
 	}

 	hdmi->grf_clk = devm_clk_get_optional(hdmi->dev, "grf");
 	if (IS_ERR(hdmi->grf_clk)) {
 		ret = PTR_ERR(hdmi->grf_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get grf clock\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get grf clock\n");
 	}

 	ret = devm_regulator_get_enable(hdmi->dev, "avdd-0v9");
@@ -573,17 +569,13 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,

 	ret = rockchip_hdmi_parse_dt(hdmi);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "Unable to parse OF data\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "Unable to parse OF data\n");
 	}

 	hdmi->phy = devm_phy_optional_get(dev, "hdmi");
 	if (IS_ERR(hdmi->phy)) {
 		ret = PTR_ERR(hdmi->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(hdmi->dev, "failed to get phy\n");
-		return ret;
+		return dev_err_probe(hdmi->dev, ret, "failed to get phy\n");
 	}

 	if (hdmi->phy) {
-- 
2.25.1
