Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86022744CE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD62D6E8A1;
	Tue, 22 Sep 2020 14:55:55 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2226E8A1
 for <dri-devel@freedesktop.org>; Tue, 22 Sep 2020 14:55:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600786551; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=w8SwwyDZi49J/LRRslQzSR10Itlo02aPR2rsKvDIPZ8=;
 b=QtElfvO8BdBOBrPLIb+04NlzDGwkYWyJS2JPC+G4Bss2DKohb+o91lV2Mz5/u+/grPmmwKXa
 WstgyAtc1ryLkwzj+czdL0hZ5StnN72Mv/MRwYBEgz48nGSTkeY5w+6K+NlbhD1pI7idvm54
 AU5z7yo/e+0Du9O4fltOTmgEMeU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f6a106c15795ac412c4c677 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 14:55:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1AC14C433F1; Tue, 22 Sep 2020 14:55:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DBC64C43382;
 Tue, 22 Sep 2020 14:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DBC64C43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm: Leave inuse count intact on map failure
Date: Tue, 22 Sep 2020 20:25:27 +0530
Message-Id: <1600786527-7343-2-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600786527-7343-1-git-send-email-akhilpo@codeaurora.org>
References: <1600786527-7343-1-git-send-email-akhilpo@codeaurora.org>
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
Cc: jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org, mka@chromium.org,
 dri-devel@freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Leave the inuse count intact on map failure to keep the accounting
accurate.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 80a8a26..f914ddb 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -88,8 +88,10 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 		ret = aspace->mmu->funcs->map(aspace->mmu, vma->iova, sgt,
 				size, prot);
 
-	if (ret)
+	if (ret) {
 		vma->mapped = false;
+		vma->inuse--;
+	}
 
 	return ret;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
