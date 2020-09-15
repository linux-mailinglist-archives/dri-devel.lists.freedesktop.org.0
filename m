Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F07F26A9EE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 18:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAA36E88E;
	Tue, 15 Sep 2020 16:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB83F6E88E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 16:36:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600187773; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Zj8H4MSyOK22ukzy0KaQrrwY/oa0CFBox252XyYOyuw=;
 b=wAkhsLiH3nLOxZTOcXo1IG5TcpYc7Yw07LgenKgGD5iutPFn2RfBsvIIPZkrl3gIYKt1wUVh
 JPzBvSqRjO1ewBFzv5oMrQJp0YehPNq+dlgYJxKMHc6sjAR5z2yNFJuqQAbXDm/nmXp7wUXG
 Xpq+a7+zo5jYWAA3jy/y6XBQ7DI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f60ed6ed7b4e269135f35cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 16:35:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 70E60C43387; Tue, 15 Sep 2020 16:35:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E838C433C8;
 Tue, 15 Sep 2020 16:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E838C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] drm/msm: Fix the a650 hw_apriv check
Date: Tue, 15 Sep 2020 10:35:51 -0600
Message-Id: <20200915163551.1713571-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 604234f33658 ("drm/msm: Enable expanded apriv support for a650")
was checking the result of adreno_is_a650() before the gpu revision
got probed in adreno_gpu_init() so it was always coming across as
false. Snoop into the revision ID ahead of time to correctly set the
hw_apriv flag so that it can be used by msm_gpu to properly setup
global buffers.

Fixes: 604234f33658 ("drm/msm: Enable expanded apriv support for a650")
Reported-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Tested-by: Jonathan Marek <jonathan@marek.ca>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 74bc27eb4203..f3b6d93c207c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1048,6 +1048,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info;
 	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
@@ -1064,7 +1066,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 	adreno_gpu->reg_offsets = a6xx_register_offsets;
 
-	if (adreno_is_a650(adreno_gpu))
+	/*
+	 * We need to know the platform type before calling into adreno_gpu_init
+	 * so that the hw_apriv flag can be correctly set. Snoop into the info
+	 * and grab the revision number
+	 */
+	info = adreno_info(config->rev);
+
+	if (info && info->revn == 650)
 		adreno_gpu->base.hw_apriv = true;
 
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
