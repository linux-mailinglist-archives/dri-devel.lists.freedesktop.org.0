Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 996584EEFD3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882E510E3BC;
	Fri,  1 Apr 2022 14:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FDD10E3BA;
 Fri,  1 Apr 2022 14:30:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB83761CD6;
 Fri,  1 Apr 2022 14:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEEBC340F2;
 Fri,  1 Apr 2022 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823414;
 bh=WTCcys5M8nuJoEQ48767Pm3nH88jdDikgQW3uQHmsBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWSaF+HYWEPOWcPQfwg4QgtUG5XgsnGvm9w12pU5LpzgriJyajLNCk6tRwRwaPzBC
 RFaOzX6hO6tvhrvxhMOpyJLzjxoGb+WMITAdhajzLZPpDNJTgkNkLgNeqxs6XklUOp
 Dc3jBH5VWHndSoWuLYz2wjoKiBhSCf2FwZB5t2uz1ojfe+jl2Sjis+L7jsncpYAanH
 w4NtV66Ap6b1PCupHMbYnqi6AoYTTCHbTgNNKF8aPZOTjoxYq8lApxjklFxdXxMMcV
 sOJO0Rv0ymuA4UrY2EBhM+ES2Gc+Hz1EOwEl1f2HRCw2Bez/vtqQiWAfIK6sBFRd7S
 IRl+uYgZWsJJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 083/149] drm/msm/dsi: Remove spurious
 IRQF_ONESHOT flag
Date: Fri,  1 Apr 2022 10:24:30 -0400
Message-Id: <20220401142536.1948161-83-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401142536.1948161-1-sashal@kernel.org>
References: <20220401142536.1948161-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, freedreno@lists.freedesktop.org,
 Daniel Thompson <daniel.thompson@linaro.org>, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Thompson <daniel.thompson@linaro.org>

[ Upstream commit 24b176d8827d167ac3b379317f60c0985f6e95aa ]

Quoting the header comments, IRQF_ONESHOT is "Used by threaded interrupts
which need to keep the irq line disabled until the threaded handler has
been run.". When applied to an interrupt that doesn't request a threaded
irq then IRQF_ONESHOT has a lesser known (undocumented?) side effect,
which it to disable the forced threading of irqs (and for "normal" kernels
it is a nop). In this case I can find no evidence that suppressing forced
threading is intentional. Had it been intentional then a driver must adopt
the raw_spinlock API in order to avoid deadlocks on PREEMPT_RT kernels
(and avoid calling any kernel API that uses regular spinlocks).

Fix this by removing the spurious additional flag.

This change is required for my Snapdragon 7cx Gen2 tablet to boot-to-GUI
with PREEMPT_RT enabled.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://lore.kernel.org/r/20220201174734.196718-2-daniel.thompson@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6b3ced4aaaf5..3a3f53f0c8ae 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1877,7 +1877,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* do not autoenable, will be enabled later */
 	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
-			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			"dsi_isr", msm_host);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
-- 
2.34.1

