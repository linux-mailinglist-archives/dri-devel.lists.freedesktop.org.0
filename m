Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4D3BCE58
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944DD6E434;
	Tue,  6 Jul 2021 11:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B866E434
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:25:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 683E861EAB;
 Tue,  6 Jul 2021 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570731;
 bh=ZP1acyJ8uDVnQc1RK57kx3rIAh4r8Qwak6pgb9sNWd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sGCS3iPRGJkzusBlNYKfTodlBukjUSUmmh9ZNiI/iWflpIvmJAafgJPEgQu+CWChf
 NlvT6YiaLr2V9gCtb4m6gW6eqagGaZDY+S1cBH/QF9wbII3P6voFPlX+AwihgXaBdG
 PVRXJCozXcBHCSLEnjERVkyZYZsBcW3KCwoAchi6kuxR/dfXrpwO2gvfkqg6qCHhVh
 3iYG5rOjYo3sgvh3DjC0BPM4iUEyE5/eDGgQhDqZIx8nAQ0G9SoMbistJNrtKA8toA
 E/BUFNUyb9hwym9hxElBF2isbqw7G6VuzL0jmyko0bbT8vivLe9JuEJerDT4OttMGU
 C4l0189hVdDjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 22/74] drm/bridge: cdns: Fix PM reference leak in
 cdns_dsi_transfer()
Date: Tue,  6 Jul 2021 07:24:10 -0400
Message-Id: <20210706112502.2064236-22-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112502.2064236-1-sashal@kernel.org>
References: <20210706112502.2064236-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Hulk Robot <hulkci@huawei.com>,
 Zou Wei <zou_wei@huawei.com>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zou Wei <zou_wei@huawei.com>

[ Upstream commit 33f90f27e1c5ccd648d3e78a1c28be9ee8791cf1 ]

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/1621840862-106024-1-git-send-email-zou_wei@huawei.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/cdns-dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index 6166dca6be81..0cb9dd6986ec 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -1026,7 +1026,7 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
 	struct mipi_dsi_packet packet;
 	int ret, i, tx_len, rx_len;
 
-	ret = pm_runtime_get_sync(host->dev);
+	ret = pm_runtime_resume_and_get(host->dev);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

