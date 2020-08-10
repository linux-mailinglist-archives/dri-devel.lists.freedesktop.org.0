Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340C241321
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 00:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFF86E071;
	Mon, 10 Aug 2020 22:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8545E6E48C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 22:27:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597098476; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=1l56jKTnCbGbzDy9PC9bfDI6CvjcNk4zvHShg3Sn/ic=;
 b=plnu3a7tK7fwXam0TfJZyofm9ClVtH2SnXHR4W67Sq2ovyM6LoU4Xxo+KTq88wxws2tOyC8D
 jiLK5sqFKHE8PP09lhlOX6h2oeb39hv/krlfH2H9hXj0R9DpyvacHEwlaaHKaqzxTGc0kDIQ
 Wq8brdMvXwNpMr4s16Kbo2vb/OE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f31c9da1e4d3989d4197f9b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 22:27:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 32858C4344A; Mon, 10 Aug 2020 22:27:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A2429C433B2;
 Mon, 10 Aug 2020 22:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A2429C433B2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v12 10/13] drm/msm: Add support for private address space
 instances
Date: Mon, 10 Aug 2020 16:26:54 -0600
Message-Id: <20200810222657.1841322-11-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Will Deacon <will@kernel.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for allocating private address space instances. Targets that
support per-context pagetables should implement their own function to
allocate private address spaces.

The default will return a pointer to the global address space.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_drv.c     | 13 +++++++------
 drivers/gpu/drm/msm/msm_drv.h     |  5 +++++
 drivers/gpu/drm/msm/msm_gem_vma.c |  9 +++++++++
 drivers/gpu/drm/msm/msm_gpu.c     | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h     |  5 +++++
 5 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 108b663c3ef2..f072306f1260 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -597,7 +597,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
+	ctx->aspace = msm_gpu_create_private_address_space(priv->gpu);
 	file->driver_priv = ctx;
 
 	return 0;
@@ -780,18 +780,19 @@ static int msm_ioctl_gem_cpu_fini(struct drm_device *dev, void *data,
 }
 
 static int msm_ioctl_gem_info_iova(struct drm_device *dev,
-		struct drm_gem_object *obj, uint64_t *iova)
+		struct drm_file *file, struct drm_gem_object *obj,
+		uint64_t *iova)
 {
-	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_file_private *ctx = file->driver_priv;
 
-	if (!priv->gpu)
+	if (!ctx->aspace)
 		return -EINVAL;
 
 	/*
 	 * Don't pin the memory here - just get an address so that userspace can
 	 * be productive
 	 */
-	return msm_gem_get_iova(obj, priv->gpu->aspace, iova);
+	return msm_gem_get_iova(obj, ctx->aspace, iova);
 }
 
 static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
@@ -830,7 +831,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 		args->value = msm_gem_mmap_offset(obj);
 		break;
 	case MSM_INFO_GET_IOVA:
-		ret = msm_ioctl_gem_info_iova(dev, obj, &args->value);
+		ret = msm_ioctl_gem_info_iova(dev, file, obj, &args->value);
 		break;
 	case MSM_INFO_SET_NAME:
 		/* length check should leave room for terminating null: */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f69c6d62584d..51a5c9083e13 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -249,6 +249,10 @@ int msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma);
 
+
+struct msm_gem_address_space *
+msm_gem_address_space_get(struct msm_gem_address_space *aspace);
+
 void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
 
 struct msm_gem_address_space *
@@ -434,6 +438,7 @@ static inline void msm_file_private_destroy(struct kref *kref)
 	struct msm_file_private *ctx = container_of(kref,
 		struct msm_file_private, ref);
 
+	msm_gem_address_space_put(ctx->aspace);
 	kfree(ctx);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 5f6a11211b64..29cc1305cf37 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -27,6 +27,15 @@ void msm_gem_address_space_put(struct msm_gem_address_space *aspace)
 		kref_put(&aspace->kref, msm_gem_address_space_destroy);
 }
 
+struct msm_gem_address_space *
+msm_gem_address_space_get(struct msm_gem_address_space *aspace)
+{
+	if (!IS_ERR_OR_NULL(aspace))
+		kref_get(&aspace->kref);
+
+	return aspace;
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a1f3da6550e5..b070355369d8 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -823,6 +823,28 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
 	return 0;
 }
 
+/* Return a new address space for a msm_drm_private instance */
+struct msm_gem_address_space *
+msm_gpu_create_private_address_space(struct msm_gpu *gpu)
+{
+	struct msm_gem_address_space *aspace = NULL;
+
+	if (!gpu)
+		return NULL;
+
+	/*
+	 * If the target doesn't support private address spaces then return
+	 * the global one
+	 */
+	if (gpu->funcs->create_private_address_space)
+		aspace = gpu->funcs->create_private_address_space(gpu);
+
+	if (IS_ERR_OR_NULL(aspace))
+		aspace = msm_gem_address_space_get(gpu->aspace);
+
+	return aspace;
+}
+
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d496d488222c..d298657b4730 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -64,6 +64,8 @@ struct msm_gpu_funcs {
 	void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
 	struct msm_gem_address_space *(*create_address_space)
 		(struct msm_gpu *gpu, struct platform_device *pdev);
+	struct msm_gem_address_space *(*create_private_address_space)
+		(struct msm_gpu *gpu);
 };
 
 struct msm_gpu {
@@ -286,6 +288,9 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
 		const char *name, struct msm_gpu_config *config);
 
+struct msm_gem_address_space *
+msm_gpu_create_private_address_space(struct msm_gpu *gpu);
+
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
 struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
