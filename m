Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BA414C283
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 23:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026366F42B;
	Tue, 28 Jan 2020 22:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2152E6F42D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 22:00:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580248857; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yghdhlFiZU77aOY7g/N4Y1I7xkAvDvSkr40c3b2zObg=;
 b=iIJpBLsHXF8G2Au75zom5YkedevpQPNZpWa0sAnJX+gGf+wzdtYjFGeCQY0IXb+twV4tq/jk
 CO+un8s/Jk20qz2lBA/7AHFHyfg/YkqYWvw4gugod9TaCY/mVxsW1no8RU5k6ZnN3u5Tu4lw
 X50bIYnIrPoD1KL0TI5o1REnZA0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30af0d.7f6a00adcd18-smtp-out-n01;
 Tue, 28 Jan 2020 22:00:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 36ED4C447AF; Tue, 28 Jan 2020 22:00:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 14A37C4479C;
 Tue, 28 Jan 2020 22:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14A37C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v5 5/5] drm/msm/a6xx: Support split pagetables
Date: Tue, 28 Jan 2020 15:00:19 -0700
Message-Id: <1580248819-12644-6-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
References: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 will@kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Attempt to enable split pagetables if the arm-smmu driver supports it.
This will move the default address space from the default region to
the address range assigned to TTBR1. The behavior should be transparent
to the driver for now but it gets the default buffers out of the way
when we want to start swapping TTBR0 for context-specific pagetables.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 52 ++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a2c5412..9bec603c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -878,6 +878,56 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
 	return (unsigned long)busy_time;
 }
 
+static struct msm_gem_address_space *
+a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
+{
+	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
+	struct msm_gem_address_space *aspace;
+	struct msm_mmu *mmu;
+	u64 start, size;
+	u32 val = 1;
+	int ret;
+
+	if (!iommu)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * Try to request split pagetables - the request has to be made before
+	 * the domian is attached
+	 */
+	iommu_domain_set_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);
+
+	mmu = msm_iommu_new(&pdev->dev, iommu);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(iommu);
+		return ERR_CAST(mmu);
+	}
+
+	/*
+	 * After the domain is attached, see if the split tables were actually
+	 * successful.
+	 */
+	ret = iommu_domain_get_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);
+	if (!ret && val) {
+		/*
+		 * The aperture start will be at the beginning of the TTBR1
+		 * space so use that as a base
+		 */
+		start = iommu->geometry.aperture_start;
+		size = 0xffffffff;
+	} else {
+		/* Otherwise use the legacy 32 bit region */
+		start = SZ_16M;
+		size = 0xffffffff - SZ_16M;
+	}
+
+	aspace = msm_gem_address_space_create(mmu, "gpu", start, size);
+	if (IS_ERR(aspace))
+		iommu_domain_free(iommu);
+
+	return aspace;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -900,7 +950,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.gpu_state_get = a6xx_gpu_state_get,
 		.gpu_state_put = a6xx_gpu_state_put,
 #endif
-		.create_address_space = adreno_iommu_create_address_space,
+		.create_address_space = a6xx_create_address_space,
 	},
 	.get_timestamp = a6xx_get_timestamp,
 };
-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
