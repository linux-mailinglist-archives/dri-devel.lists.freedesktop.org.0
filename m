Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC68B0EA35
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 07:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF17C10E747;
	Wed, 23 Jul 2025 05:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s6hU1dNB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4774810E745;
 Wed, 23 Jul 2025 05:55:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63C73668F9;
 Wed, 23 Jul 2025 05:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E049C4CEE7;
 Wed, 23 Jul 2025 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753250117;
 bh=yNIxe9WNdjMlMt5T6wP5iI1hqp2Pt062PwYTKa7D6Ug=;
 h=From:To:Cc:Subject:Date:From;
 b=s6hU1dNB1qZoBqPUcxtQr+CoF7gPP+QjeRP0BetXSXAHXBxHzQM1egBIJKHrGjQ5e
 8rVmT/4B3Bra0Jtwo0bq0BLrL24oIMeeMZ7EwZpwCe/NAJkCq6KXSg9T7rmDRYexsJ
 fq9G7OrM7vnEf4jYCjl/KBrDEzGh2YfFPcGXilHu3xcbuBF/SW47HiVFPJzzQRrdW9
 /2UvbbxDVx9yLBonb093qwMgFHmEUgglaO35XYeSoiZYnjXORc1P/3t7SeJpiH2N6l
 MiyLbUwvfcnGYdzi+30tmDee2FMq3WfJeRzxgqLf3zNnTD1Aa5UQyEasSp9TQ62i9b
 2rjHu9TpKO/yg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: dmitry.baryshkov@linaro.org
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH -resend] drm/msm: use dev_fwnode()
Date: Wed, 23 Jul 2025 07:55:12 +0200
Message-ID: <20250723055512.1800438-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.50.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

---

Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 1f5fe7811e01..ec7d83831b83 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -154,8 +154,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 
 	dev = msm_mdss->dev;
 
-	domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node), 32,
-			&msm_mdss_irqdomain_ops, msm_mdss);
+	domain = irq_domain_create_linear(dev_fwnode(dev), 32, &msm_mdss_irqdomain_ops, msm_mdss);
 	if (!domain) {
 		dev_err(dev, "failed to add irq_domain\n");
 		return -EINVAL;
-- 
2.50.1

