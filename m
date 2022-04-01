Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958654EF15B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A027A10F3FC;
	Fri,  1 Apr 2022 14:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC4710F488;
 Fri,  1 Apr 2022 14:40:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1879B82503;
 Fri,  1 Apr 2022 14:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8C0C2BBE4;
 Fri,  1 Apr 2022 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648824006;
 bh=284TnvbaXGlYGB8egfJjTlAB5liChDdlV0p235OHsg4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SwGrxCDApdkW7Vs8wy/pri+9WnrfCsADAVXmetXa3PTZZ/D8ZiQ0Bp/DnpMbKqdzM
 U2eUBNxKyaphalqDxPBrunyaDaPLH0hnoHnYymlLtT/cGOUKeu7my0t8fMQYDDae6V
 GqLqFqxI/fOdXT4a2jG0AGCi0hHq0GEXY5d4eKa8sgEflFJM8CS3Mg0Es0VGLol/qB
 y1r4dc6eBBPwxFeScUvaS0dOX2/aemoEgDWDlIDgwYgXLvxjzk/1zYFiTkTGCuFztu
 7C5gQJxyxsNNUcLcJD1mtxj3iPC6z0iLscwpso6jiBQ0M66B57O0LZzruEC3JotPNN
 5YIUq1Xu5v+bg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 47/98] drm/msm/dsi: Remove spurious IRQF_ONESHOT
 flag
Date: Fri,  1 Apr 2022 10:36:51 -0400
Message-Id: <20220401143742.1952163-47-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
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
index dc85974c7897..eea679a52e86 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1909,7 +1909,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* do not autoenable, will be enabled later */
 	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
-			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			"dsi_isr", msm_host);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
-- 
2.34.1

