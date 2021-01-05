Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3000A2EA675
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D806E07D;
	Tue,  5 Jan 2021 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8C489F77
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 07:37:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1609832225; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0T+xlGHJP2wMYpgxmfrGKe+ecRzlLCw68x3Rb2S7kVs=;
 b=Kut1py2NYV/QgDoyGHagOPljl7UVPNRbWc2fkxqMYEf0agzA88TeEkC4dfpAplFxAOKqTZiR
 qqBF09lGl182yalWMcNhNBciTU+sKHT6UUzhZRwYw1Eyj6+utrZx5J0UXOMh7LdLhNRic2bt
 5Ng0wGgr/wbf0T3raxt1CYe85Bw=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ff4171f584481b01b7b8bf9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Jan 2021 07:37:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EB0F3C43464; Tue,  5 Jan 2021 07:37:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 63A46C433CA;
 Tue,  5 Jan 2021 07:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 63A46C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, robh@kernel.org,
 tomeu.vizoso@collabora.com
Subject: [PATCH RESEND 4/7] iommu/arm-smmu-v3: Add dependency on
 io-pgtable-arm format module
Date: Mon,  4 Jan 2021 23:36:42 -0800
Message-Id: <1609832205-10055-5-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609832205-10055-1-git-send-email-isaacm@codeaurora.org>
References: <1609832205-10055-1-git-send-email-isaacm@codeaurora.org>
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:21:09 +0000
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno@lists.freedesktop.org, pdaly@codeaurora.org, pratikp@codeaurora.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SMMUv3 driver depends on the availability of the ARM LPAE io-pgtable
format code to work properly. In preparation for having the io-pgtable
formats as modules, add a "pre" dependency with MODULE_SOFTDEP() to
ensure that the io-pgtable-arm format module is loaded before loading
the ARM SMMUv3 driver module.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8ca7415..c498ac8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3650,3 +3650,4 @@ MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
 MODULE_ALIAS("platform:arm-smmu-v3");
 MODULE_LICENSE("GPL v2");
+MODULE_SOFTDEP("pre: io-pgtable-arm");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
