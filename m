Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C414C2C0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 23:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B4B6E155;
	Tue, 28 Jan 2020 22:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809BB6E141
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 22:16:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580249783; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GpI+mTVrUBvTTsjKcw+tKygwnL3f9JdTCVmD4fbxwzA=;
 b=aCNm8M4t97Gkjb0oayaKLkA44+OC39oEl9ajYmrynsBcPfwf16fEZMfI8upVFZeDLwh5KLK8
 m9SDH78x8Nf+khx8LAXfpFL7/DDEJPKu2h3bm1mQ7zKe3N/z7Ox2CwjQG7kEDUUa1EJhFUTi
 Dt7TyEVNGDvkW/k9HdatTye90BI=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30b2b5.7f0683b63458-smtp-out-n02;
 Tue, 28 Jan 2020 22:16:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D02FCC447A4; Tue, 28 Jan 2020 22:16:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 17571C4479F;
 Tue, 28 Jan 2020 22:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17571C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v1 3/6] drm/msm/adreno: ADd support for IOMMU auxiliary domains
Date: Tue, 28 Jan 2020 15:16:07 -0700
Message-Id: <1580249770-1088-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
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
 will@kernel.org, robin.murphy@arm.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for creating a auxiliary domain from the IOMMU device to
implement per-instance pagetables. Also add a helper function to
return the pagetable base address (ttbr) and asid to the caller so
that the GPU target code can set up the pagetable switch.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_iommu.c | 72 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h   |  3 ++
 2 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index e773ef8..df0d70a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -7,9 +7,17 @@
 #include "msm_drv.h"
 #include "msm_mmu.h"
 
+/*
+ * It is up to us to assign ASIDS for our instances. Start at 32 to give a
+ * cushion to account for ASIDS assigned to real context banks
+ */
+static int msm_iommu_asid = 32;
+
 struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
+	u64 ttbr;
+	int asid;
 };
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
 
@@ -58,6 +66,20 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 	kfree(iommu);
 }
 
+static void msm_iommu_aux_detach(struct msm_mmu *mmu)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	iommu_aux_detach_device(iommu->domain, mmu->dev);
+}
+
+static const struct msm_mmu_funcs aux_funcs = {
+		.detach = msm_iommu_aux_detach,
+		.map = msm_iommu_map,
+		.unmap = msm_iommu_unmap,
+		.destroy = msm_iommu_destroy,
+};
+
 static const struct msm_mmu_funcs funcs = {
 		.detach = msm_iommu_detach,
 		.map = msm_iommu_map,
@@ -65,6 +87,56 @@ static const struct msm_mmu_funcs funcs = {
 		.destroy = msm_iommu_destroy,
 };
 
+bool msm_iommu_get_ptinfo(struct msm_mmu *mmu, u64 *ttbr, u32 *asid)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	if (!iommu->ttbr)
+		return false;
+
+	if (ttbr)
+		*ttbr = iommu->ttbr;
+	if (asid)
+		*asid = iommu->asid;
+
+	return true;
+}
+
+struct msm_mmu *msm_iommu_new_instance(struct device *dev,
+		struct iommu_domain *domain)
+{
+	struct msm_iommu *iommu;
+	u64 ptbase;
+	int ret;
+
+	ret = iommu_aux_attach_device(domain, dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
+	if (ret) {
+		iommu_aux_detach_device(domain, dev);
+		return ERR_PTR(ret);
+	}
+
+	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
+	if (!iommu) {
+		iommu_aux_detach_device(domain, dev);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	iommu->domain = domain;
+	iommu->ttbr = ptbase;
+	iommu->asid = msm_iommu_asid++;
+
+	if (msm_iommu_asid > 0xff)
+		msm_iommu_asid = 32;
+
+	msm_mmu_init(&iommu->base, dev, &aux_funcs);
+
+	return &iommu->base;
+}
+
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 {
 	struct msm_iommu *iommu;
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index bae9e8e..65a5cb2 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -32,6 +32,9 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 }
 
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
+struct msm_mmu *msm_iommu_new_instance(struct device *dev,
+		struct iommu_domain *domain);
+bool msm_iommu_get_ptinfo(struct msm_mmu *mmu, u64 *ttbr, u32 *asid);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
