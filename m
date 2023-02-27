Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1DF6A37B1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA46010E17F;
	Mon, 27 Feb 2023 02:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F1610E1A1;
 Mon, 27 Feb 2023 02:10:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ABC18B80D1F;
 Mon, 27 Feb 2023 02:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7308AC433D2;
 Mon, 27 Feb 2023 02:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463852;
 bh=RVNIuXrSNR3J0wQepec5k6SS1Vcg2l4MQsEf4Dc4O4E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YWUis3po/95t1IvuRB4qjaU2xQeaI83t3QNu0wyg0Nv1vA6gAHPWlNxJGNTnnpuME
 15uMNnY7bTDlytl/9jLpoh9O2ZyrP1Z218OC7Ua/HqLx6KdCLtGk2/EGXEIhQk+owx
 qEP0GAR9ucA6Gow+S6b3u1GxFu4LrlMyHRWox/6B0sXBoJiZYzG1HeVSsx/4i2ApMb
 5bFkBmndThUQMOiXOzJxKPXLDgb//Obm+U7pw6oByi9BYzigWPxYSAoPSUvMZvrbrj
 CK/0t+sqVaq27U9ZZJnSWd5LflRG3oD+kKqaPWpIsp3kBExEpU1UtQ3x1bc/kqjJHB
 bBmaXum1YRBCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 05/15] drm/msm/dsi: Add missing check for
 alloc_ordered_workqueue
Date: Sun, 26 Feb 2023 21:10:24 -0500
Message-Id: <20230227021038.1052958-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227021038.1052958-1-sashal@kernel.org>
References: <20230227021038.1052958-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, vkoul@kernel.org, marex@denx.de,
 linux-arm-msm@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 vladimir.lypak@gmail.com, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiasheng Jiang <jiasheng@iscas.ac.cn>

[ Upstream commit 115906ca7b535afb1fe7b5406c566ccd3873f82b ]

Add check for the return value of alloc_ordered_workqueue as it may return
NULL pointer and cause NULL pointer dereference.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/517646/
Link: https://lore.kernel.org/r/20230110021651.12770-1-jiasheng@iscas.ac.cn
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 743142e15b4c1..c59764f156f94 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1877,6 +1877,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* setup workqueue */
 	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
+	if (!msm_host->workqueue)
+		return -ENOMEM;
+
 	INIT_WORK(&msm_host->err_work, dsi_err_worker);
 	INIT_WORK(&msm_host->hpd_work, dsi_hpd_worker);
 
-- 
2.39.0

