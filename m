Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895EA151FB1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 18:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FB489E47;
	Tue,  4 Feb 2020 17:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D773989E47
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 17:42:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580838158; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=lamwbTdrVAFepeQwkgLRLZ0iEFybtVZEKB4EDxho6/w=;
 b=YiYceiTclNUeFpM42LxTpPXoxZ4zysqY4bMKCY3Qpp2rKJ6Q1Cr6R8w13JrgHUuFZnTVG8Sv
 up8ajrWnzGakdQ0aE0M9SY9tCQOBr/m9iNSnoqE9aRS/XWbjErTn9kAmB/EbHdWSMgbtYb0p
 e59SUeSk+mFV579becvKziPrsUA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e39ad0d.7f6d06f38848-smtp-out-n01;
 Tue, 04 Feb 2020 17:42:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B66F9C4479C; Tue,  4 Feb 2020 17:42:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EB26C447A9;
 Tue,  4 Feb 2020 17:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EB26C447A9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: Remove unneeded GBIF unhalt
Date: Tue,  4 Feb 2020 10:42:28 -0700
Message-Id: <1580838148-2981-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit e812744c5f95 ("drm: msm: a6xx: Add support for A618") added a
universal GBIF un-halt into a6xx_start(). This can cause problems for
a630 targets which do not use GBIF and might have access protection
enabled on the region now occupied by the GBIF registers.

But it turns out that we didn't need to unhalt the GBIF in this path
since the stop function already takes care of that after executing a flush
but before turning off the headswitch. We should be confident that the
GBIF is open for business when we restart the hardware.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index daf0780..e51c723 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -378,18 +378,6 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	int ret;
 
-	/*
-	 * During a previous slumber, GBIF halt is asserted to ensure
-	 * no further transaction can go through GPU before GPU
-	 * headswitch is turned off.
-	 *
-	 * This halt is deasserted once headswitch goes off but
-	 * incase headswitch doesn't goes off clear GBIF halt
-	 * here to ensure GPU wake-up doesn't fail because of
-	 * halted GPU transactions.
-	 */
-	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
-
 	/* Make sure the GMU keeps the GPU on while we set it up */
 	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
