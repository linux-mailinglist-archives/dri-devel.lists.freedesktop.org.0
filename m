Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C384049FE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 13:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BFA6E52A;
	Thu,  9 Sep 2021 11:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE43D6E529;
 Thu,  9 Sep 2021 11:43:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3C1F6121E;
 Thu,  9 Sep 2021 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187832;
 bh=Sbp8hkmrJH0wllDVah8IY9qF0XbUzi100p4DkLVpl9g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cm7q/NoKfFPKKUuR/KAfAw3FPWZ508UDZwdVijrudH6EE9ygPrQ5LZukfLwrtg2kQ
 FQK5tazdwjUGVvCgy0vs7gwbDW6Afzbt88u6t4MXZFcv3AeQDbGwVW/dH/EFqQTR7p
 6olFWo0Vz5bkUEUXmHI+udhGCRov//ttsQzrkCPQnyZJP9ICHvidz2iTGqXUjvmdp4
 k6DGVH1MrPPBk27JehnSFn7d3UH07lTAoJzY4kZmRVNc77a9xVmGogDXnPJVxTiPf1
 CCRgK8QcVOJd2AQyiuG5cSpEzV9Fy68AjhO71MKa2It0fpqXcH+odoGaiAaHhwEWxR
 xbw/ziY+6gJuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.14 128/252] drm/msm/dsi: Fix DSI and DSI PHY
 regulator config from SDM660
Date: Thu,  9 Sep 2021 07:39:02 -0400
Message-Id: <20210909114106.141462-128-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

[ Upstream commit 462f7017a6918d152870bfb8852f3c70fd74b296 ]

VDDA is not present and the specified load value is wrong. Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Link: https://lore.kernel.org/r/20210728222057.52641-1-konrad.dybcio@somainline.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index f3f1c03c7db9..763f127e4621 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -154,7 +154,6 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
 	.reg_cfg = {
 		.num = 2,
 		.regs = {
-			{"vdd", 73400, 32 },	/* 0.9 V */
 			{"vdda", 12560, 4 },	/* 1.2 V */
 		},
 	},
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index a34cf151c517..bb31230721bd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1050,7 +1050,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.reg_cfg = {
 		.num = 1,
 		.regs = {
-			{"vcca", 17000, 32},
+			{"vcca", 73400, 32},
 		},
 	},
 	.ops = {
-- 
2.30.2

