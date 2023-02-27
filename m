Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17206A3775
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0483210E335;
	Mon, 27 Feb 2023 02:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E724010E334;
 Mon, 27 Feb 2023 02:09:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 33F48CE0F47;
 Mon, 27 Feb 2023 02:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F1EC433EF;
 Mon, 27 Feb 2023 02:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463772;
 bh=bJsrmwNRnazNjOb4CR0aliKEV+9KZrk49a1BvMKGwbE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pqXjNQr35h7wNvPySG71mXHbXdqCb9hg2QoukyWw8grXs6GgmbJnRx819g+vBUiYk
 7esqIs6Y3ORGXfhwReHoDICvpdZ7Oswinj8UUHMZohJWJo72XLD9E1txzixGmaNEYF
 IHwtRoYIST+SStrVGsqzxw/reFTy32TGemvSzwFAeWMwsjBLbTIDDq/kNVj4AYM8Rt
 U+RCOm1ULkSYi7o6LPSOfThcGFxrm/3TTNFmCW6GCf64bEZZo3b1R+xpUeceXSdnvA
 nOeW3RtlDSqHQZI1ytMw6AFX8TndzQp6HEJ51WjiDQUiTDM+7jNHtp2hoNS4mRWCxA
 K5nRjfBggm/Uw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 11/25] drm/msm/dsi: Add missing check for
 alloc_ordered_workqueue
Date: Sun, 26 Feb 2023 21:08:34 -0500
Message-Id: <20230227020855.1051605-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020855.1051605-1-sashal@kernel.org>
References: <20230227020855.1051605-1-sashal@kernel.org>
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
index eb60ce125a1fc..d3ec4d67a9a35 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1929,6 +1929,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* setup workqueue */
 	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
+	if (!msm_host->workqueue)
+		return -ENOMEM;
+
 	INIT_WORK(&msm_host->err_work, dsi_err_worker);
 	INIT_WORK(&msm_host->hpd_work, dsi_hpd_worker);
 
-- 
2.39.0

