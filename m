Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88558507724
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 20:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C1310EDB4;
	Tue, 19 Apr 2022 18:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B5610E805;
 Tue, 19 Apr 2022 18:11:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF860B818E0;
 Tue, 19 Apr 2022 18:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D3CC385A7;
 Tue, 19 Apr 2022 18:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650391873;
 bh=HHSBzrlIipK0nujA927z1nFCcxi1J+e1mhmEtz+5L5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ryn/DSkLmpAHsC8Iuxb75603zqSRyl+Q7ZLW+qq7X9c2WPRhYVa63HYcX3K86342x
 n9m7zHphIWtGB5ePui9jGRoIGHnAzsKLKrUceGeOBE3ZzTA3j0wg/91OmsjgMWPCGl
 JBMIrJLFVInONfhZ05YVguiRKXk7L8IWP20wtuHJ5hvuR9hb/EHkJUsFGHdKU7VqFx
 YSqljwcyp5KYtVBs+joKnG7BN5BIKlyrppbDoGcPnGMJr2Zi0EGAv30m3SnQNcSvkf
 /qEVjdRtwISpm/LJH1gf4VIP6WCguIC5clVMeeXhIfagbyN3tL2uxCSIrfta7grSi8
 DB69XQP8QUcDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 02/34] drm/msm/gpu: Remove mutex from wait_event
 condition
Date: Tue, 19 Apr 2022 14:10:29 -0400
Message-Id: <20220419181104.484667-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419181104.484667-1-sashal@kernel.org>
References: <20220419181104.484667-1-sashal@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>,
 jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 vladimir.lypak@gmail.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, nathan@kernel.org, quic_akhilpo@quicinc.com,
 freedreno@lists.freedesktop.org, sean@poorly.run,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit 7242795d520d3fb48e005e3c96ba54bb59639d6e ]

The mutex wasn't really protecting anything before.  Before the previous
patch we could still be racing with the scheduler's kthread, as that is
not necessarily frozen yet.  Now that we've parked the sched threads,
the only race is with jobs retiring, and that is harmless, ie.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Link: https://lore.kernel.org/r/20220310234611.424743-4-robdclark@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index b93de79000e1..e8a8240a6868 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -608,22 +608,13 @@ static int adreno_runtime_resume(struct device *dev)
 	return gpu->funcs->pm_resume(gpu);
 }
 
-static int active_submits(struct msm_gpu *gpu)
-{
-	int active_submits;
-	mutex_lock(&gpu->active_lock);
-	active_submits = gpu->active_submits;
-	mutex_unlock(&gpu->active_lock);
-	return active_submits;
-}
-
 static int adreno_runtime_suspend(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
 	int remaining;
 
 	remaining = wait_event_timeout(gpu->retire_event,
-				       active_submits(gpu) == 0,
+				       gpu->active_submits == 0,
 				       msecs_to_jiffies(1000));
 	if (remaining == 0) {
 		dev_err(dev, "Timeout waiting for GPU to suspend\n");
-- 
2.35.1

