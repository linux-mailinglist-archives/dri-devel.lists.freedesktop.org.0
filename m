Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86025176B5C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 03:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A986E969;
	Tue,  3 Mar 2020 02:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB266E95A;
 Tue,  3 Mar 2020 02:50:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ED742468D;
 Tue,  3 Mar 2020 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583203811;
 bh=zBcaWmOWFsefY4orvoW3vKI4XM4VDFpW+rPtM3jGBuE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XZfhWXtVHtU5f98yCCYAjOHmQEkoCb1fmWVilzIh5VeeALbdFXuAD6gkEDHtIfOd/
 4nn+btDuVy5HSftD7zJfp75M1H0Cc8aFJh+71e1Sl1OVVvtIOotP95LIXsY8cDkUoE
 LuDOVs6yB75+kL1CCAXtznDwxdi6QbByTKdv0OXY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 06/13] drm/msm/dsi: save pll state before dsi host
 is powered off
Date: Mon,  2 Mar 2020 21:49:55 -0500
Message-Id: <20200303025002.10600-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303025002.10600-1-sashal@kernel.org>
References: <20200303025002.10600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Harigovindan P <harigovi@codeaurora.org>

[ Upstream commit a1028dcfd0dd97884072288d0c8ed7f30399b528 ]

Save pll state before dsi host is powered off. Without this change
some register values gets resetted.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 10d49d43c17eb..d46b9e75a8473 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -438,6 +438,7 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct drm_panel *panel = msm_dsi->panel;
+	struct msm_dsi_pll *src_pll;
 	bool is_dual_dsi = IS_DUAL_DSI();
 	int ret;
 
@@ -471,6 +472,10 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 								id, ret);
 	}
 
+	/* Save PLL status if it is a clock source */
+	src_pll = msm_dsi_phy_get_pll(msm_dsi->phy);
+	msm_dsi_pll_save_state(src_pll);
+
 	ret = msm_dsi_host_power_off(host);
 	if (ret)
 		pr_err("%s: host %d power off failed,%d\n", __func__, id, ret);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
