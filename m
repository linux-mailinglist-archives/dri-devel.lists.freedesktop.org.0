Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9E4B94D1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBADD10E1F8;
	Thu, 17 Feb 2022 00:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080CE10E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:08:40 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r20so5837545ljj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 16:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJ+5mbwD/7lPCQPyt9Z7JoknhxYPPxgDVRd9pXODZ5o=;
 b=vC3CA/0YHRFW4zBqC0DeMPM5gDVicSFaSDXd1UK11xJBi8q+szSDcaAv33hiWrgkj4
 EL26NvtOIjV1cQWedrxXJuGCDYKAYK14sVCzugaPkkdrCHWzDJDITQ1aVWcReqPd0R8j
 E5Iy5vHe2r8W+Fi6hP/VgoGwjKCO17p0Ma3win19afh4VMLQN7RvgbVe+Sui+M/q0Ukc
 q/R3yQ8MCJfox1DA4wXjPJxHlcknj3AllFDXIHC6/ySzK0bhmoNhbewwQ68tuwIO1MvZ
 7n9idR0HtuLK6VNP8/OKunOf4lAA8XWw/zeTlq3jT28tT675wPvlX3yl+N6gSgTaDDlO
 pyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cJ+5mbwD/7lPCQPyt9Z7JoknhxYPPxgDVRd9pXODZ5o=;
 b=edWhan/Xj5kj3H10Wedrf8e23yH6U4vwxeEmCz1ERgAnbMwjjyg7YtMsFNON+ZRCEV
 QAlE7qu/+WFPom7kpg9nuswcC789SAIp5aALlv5Rk2rCEU+seyRnoEkkSJS7WViMNWlQ
 jqijSapthpPkwpNIcgShh2AQDQcTKpNkFerWITC1BY/t/x5D5q7MeNEsvzrG5NyM46sH
 pLoJNYMt+rXiVTGoUskfCF+JrUvJKv6Sl+jpgzaN345JFVHlwKjWu03nlvwmkpJ+DcCT
 wh63c2t80EIBQsxdKAIElPSSBMgALHMFMpICZQwTpXcP6RuTozWyv/U+RtQYbkd9WoQN
 P+sw==
X-Gm-Message-State: AOAM533xxudfilFdmDPFstLa1AcopnxKhJtRYLK+fLsogTD1UArzwUe0
 Jzn/2nA3JQblBfSds/kKW37Thw==
X-Google-Smtp-Source: ABdhPJyNCL64USD67u1GLsNkk0UPMfyzMabfTjAIsduxOUYQMuJVlRYXMbUVQS/fcJg7SwvRnyLHAA==
X-Received: by 2002:a05:651c:307:b0:244:dc4c:c2f2 with SMTP id
 a7-20020a05651c030700b00244dc4cc2f2mr331058ljp.531.1645056519081; 
 Wed, 16 Feb 2022 16:08:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x3sm740845lfr.283.2022.02.16.16.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 16:08:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dsi/phy: fix 7nm v4.0 settings for C-PHY mode
Date: Thu, 17 Feb 2022 03:08:37 +0300
Message-Id: <20220217000837.435340-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dsi_7nm_phy_enable() disagrees with downstream for
glbl_str_swi_cal_sel_ctrl and glbl_hstx_str_ctrl_0 values. Update
programmed settings to match downstream driver. To remove the
possibility for such errors in future drop less_than_1500_mhz
assignment and specify settings explicitly.

Fixes: 5ac178381d26 ("drm/msm/dsi: support CPHY mode for 7nm pll/phy")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 36eb6109cb88..6e506feb111f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -864,20 +864,26 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	/* Alter PHY configurations if data rate less than 1.5GHZ*/
 	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
 
-	/* For C-PHY, no low power settings for lower clk rate */
-	if (phy->cphy_mode)
-		less_than_1500_mhz = false;
-
 	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
-		glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
-		glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
+		if (phy->cphy_mode) {
+			glbl_rescode_top_ctrl = 0x00;
+			glbl_rescode_bot_ctrl = 0x3c;
+		} else {
+			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
+			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
+		}
 		glbl_str_swi_cal_sel_ctrl = 0x00;
 		glbl_hstx_str_ctrl_0 = 0x88;
 	} else {
 		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
-		glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
-		glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
+		if (phy->cphy_mode) {
+			glbl_str_swi_cal_sel_ctrl = 0x03;
+			glbl_hstx_str_ctrl_0 = 0x66;
+		} else {
+			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
+			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
+		}
 		glbl_rescode_top_ctrl = 0x03;
 		glbl_rescode_bot_ctrl = 0x3c;
 	}
-- 
2.34.1

