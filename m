Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE379A25C9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CE210E85B;
	Thu, 17 Oct 2024 14:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUiUpPe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794AC10E85A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177121; x=1760713121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=81BiLfDi6XH4s1InjJUogOwT060U25LSUJSt2TGmTAg=;
 b=KUiUpPe1FG7evcJ9QaAILlgOw94hkrtrEJV7qONJ5poPKxD6zrBU36Iw
 jprOgiqu94fLy4oda1xKHgE0l0biSA5APgjCktneHKdIRLKgKwObaPz2O
 QPrhHrnceZnpSNeXfcCAIOQ887MYtrJeXnKPAfshAODgWXg4N+D6IT5kn
 Q2i7LLXhfvPZtHfzpnQvE4jNjA3H0MvkaH16D9150XaGRw3ieU7fI0iL1
 gPnCMuJ7Ej6li1b4JDPU8lM/T3wgLxnXavvGc9RkZ93ThMSNYjExUyddR
 8o7qgBh+svlvtciCfP6DA8sGPDHfUiKNPamPqEWG979iMYKalefeLQuSu w==;
X-CSE-ConnectionGUID: Rjbbh+5lTNKds9s0rfBGeQ==
X-CSE-MsgGUID: 0MFUKsjKSi6ss9iQyUK5cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790375"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790375"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:41 -0700
X-CSE-ConnectionGUID: OU6RPPXXQCGAi/vxGNFlmg==
X-CSE-MsgGUID: E0mtAxNyQXatKBq4/E0TeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374572"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:40 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 11/11] accel/ivpu: Move secondary preemption buffer allocation
 to DMA range
Date: Thu, 17 Oct 2024 16:58:17 +0200
Message-ID: <20241017145817.121590-12-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Secondary preemption buffer is accessible by NPU's DMA and can be
allocated with addresses above 4 GB. Move secondary preemption buffer
allocation from SHAVE range which is much smaller (2GB) to DMA range.
This allows to allocate more command queues with corresponding
preemption buffers without running out of address range.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 39ba6d3d8b0de..7149312f16e19 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -46,7 +46,7 @@ static int ivpu_preemption_buffers_create(struct ivpu_device *vdev,
 		return -ENOMEM;
 	}
 
-	cmdq->secondary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &vdev->hw->ranges.shave,
+	cmdq->secondary_preempt_buf = ivpu_bo_create(vdev, &file_priv->ctx, &vdev->hw->ranges.dma,
 						     secondary_size, DRM_IVPU_BO_WC);
 	if (!cmdq->secondary_preempt_buf) {
 		ivpu_err(vdev, "Failed to create secondary preemption buffer\n");
-- 
2.45.1

