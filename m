Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AB4A6880B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 10:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636A410E4EA;
	Wed, 19 Mar 2025 09:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cqTmTDLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988C310E36D;
 Wed, 19 Mar 2025 09:31:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C55325C5A6F;
 Wed, 19 Mar 2025 09:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A847C4CEE9;
 Wed, 19 Mar 2025 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742376697;
 bh=x7l0PcBAwBQ5PVjrvhw7mYOlBby/JPar1g9BxOMRBIQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cqTmTDLoCx/XQ8XTxKWiqTJiJcpbmzBzr07rLr7YAzWt4/zYinNbbxuXOxrTsbvcR
 0n4IVwHvRCnjwS9QYzQTuRWTo/WKV2/bbbGoPwdLGbUrR9TSkesYLfghXMd4RmD1g7
 woTf/gWvo0I8WIfQ/6N4owbsXhsrGTq6C7IT7bhYzPa+jIEMa53DplXTsdu3ukVkEz
 lHdo9E2DLUStIHz0eUf6MAuB0jzngF17+6nZC8bLAy3AzRp+QuFY+y835D8oVr+WXj
 sG6RcL/sW1ZYl6Yk4VJjfTDCd1AYziiLzN6LTwriJnzHErQcj0mB0paVPpi3cY0Hnh
 eU/JWSyEDN6zw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org, linux-kernel@vger.kernel.org,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 18/57] irqdomain: gpu: Switch to irq_domain_create_linear()
Date: Wed, 19 Mar 2025 10:29:11 +0100
Message-ID: <20250319092951.37667-19-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 4 ++--
 drivers/gpu/drm/msm/msm_mdss.c          | 2 +-
 drivers/gpu/ipu-v3/ipu-common.c         | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 19ce4da285e8..38e7043016e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -725,8 +725,8 @@ static const struct irq_domain_ops amdgpu_hw_irqdomain_ops = {
  */
 int amdgpu_irq_add_domain(struct amdgpu_device *adev)
 {
-	adev->irq.domain = irq_domain_add_linear(NULL, AMDGPU_MAX_IRQ_SRC_ID,
-						 &amdgpu_hw_irqdomain_ops, adev);
+	adev->irq.domain = irq_domain_create_linear(NULL, AMDGPU_MAX_IRQ_SRC_ID,
+						    &amdgpu_hw_irqdomain_ops, adev);
 	if (!adev->irq.domain) {
 		DRM_ERROR("GPU irq add domain failed\n");
 		return -ENODEV;
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402..9d006ee88a8a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -150,7 +150,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 
 	dev = msm_mdss->dev;
 
-	domain = irq_domain_add_linear(dev->of_node, 32,
+	domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node), 32,
 			&msm_mdss_irqdomain_ops, msm_mdss);
 	if (!domain) {
 		dev_err(dev, "failed to add irq_domain\n");
diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index fa77e4e64f12..223e6d563a6b 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1169,8 +1169,8 @@ static int ipu_irq_init(struct ipu_soc *ipu)
 	};
 	int ret, i;
 
-	ipu->domain = irq_domain_add_linear(ipu->dev->of_node, IPU_NUM_IRQS,
-					    &irq_generic_chip_ops, ipu);
+	ipu->domain = irq_domain_create_linear(of_fwnode_handle(ipu->dev->of_node), IPU_NUM_IRQS,
+					       &irq_generic_chip_ops, ipu);
 	if (!ipu->domain) {
 		dev_err(ipu->dev, "failed to add irq domain\n");
 		return -ENODEV;
-- 
2.49.0

