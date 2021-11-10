Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5396044BC0A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 08:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A7D72BBD;
	Wed, 10 Nov 2021 07:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1451372BBE;
 Wed, 10 Nov 2021 07:16:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1636528225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fG3gkDcQonf6Prf1+ZK3uzrJ/B8Z3f4W3CT7fjv7dVU=;
 b=s6oAroCIAjjg89u3xzpyPBEk9g2CgYdiy97XvqCfgjhnoDQB7SHXcz8mbWjx1ZadqkH3QI
 b8GMkg99nGk/Qwc9wz46pRfXGAcInIlV6UnxEYUfZ9NPG0YiksDCLZiKd4rQBw7sFd4nHC
 gfy8WmHkcnBptEtAdTbknVamk27f4tI=
From: Jackie Liu <liu.yun@linux.dev>
To: robdclark@gmail.com,
	sean@poorly.run,
	airlied@linux.ie
Subject: [PATCH 1/3] drm/msm/hdmi: fix build without CONFIG_COMMON_CLK
Date: Wed, 10 Nov 2021 15:09:48 +0800
Message-Id: <20211110070950.3355597-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
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
Cc: architt@codeaurora.org, liu.yun@linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 chandanu@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jackie Liu <liuyun01@kylinos.cn>

HDMI 8996 PHY/PLL support need common clk. avoid like:

[...]
x86_64-linux-gnu-ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3e0): undefined reference to `msm_hdmi_phy_8996_cfg'

Fixes: e17afdceb4f2 ("drm/msm/hdmi: HDMI 8996 PHY/PLL support")
Reported-by: kernelbot <kernel-bot@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 16b0e8836d27..84d7f79f1aa8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -192,8 +192,10 @@ static const struct of_device_id msm_hdmi_phy_dt_match[] = {
 	  .data = &msm_hdmi_phy_8x74_cfg },
 	{ .compatible = "qcom,hdmi-phy-8084",
 	  .data = &msm_hdmi_phy_8x74_cfg },
+#ifdef CONFIG_COMMON_CLK
 	{ .compatible = "qcom,hdmi-phy-8996",
 	  .data = &msm_hdmi_phy_8996_cfg },
+#endif
 	{}
 };
 
-- 
2.25.1

