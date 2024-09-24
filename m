Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B298403D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147C210E679;
	Tue, 24 Sep 2024 08:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKSfSJM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431CD10E667
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165923; x=1758701923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzXVj0IIVt/qp2FDFkG3fACm7kF8F/FSWCZN9owgrOA=;
 b=HKSfSJM4AeywNDlNpFX8fSIeq9jDEKzeQ3hOEgTr6UtNC4Ouzr/p4oYG
 k2t9wJvvmnwBoLyWP5EFTawkpnd5XnhZmE4s2MQ7GzIVFWXEa5GK4SPMX
 uCw/LLTF5BVMP/97k7reaOa2uuKBdUzSu2PQzvRBu8ojFpGFkzro4HTxI
 Hb3ZQIIE9P5WXpDLXZLCK+ZWKnXbaWKyx5/POP1CPYZbP0wJSOVGofvQw
 PqXA3hftQefWE8c6+zz4lfQCtjasejDRy5as1DfhjmiftaoST+rB3ssT0
 sTg+rX/KbydkiiYnLjNd8hDn9y6TV3OBX0O5+cXnouUmYZ/lqnWIgjVEc A==;
X-CSE-ConnectionGUID: qe5NFKppS4KYKGk0Sn/HOA==
X-CSE-MsgGUID: d0f+A2fdQfq3s0etKm+WnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506985"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506985"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:43 -0700
X-CSE-ConnectionGUID: ZPUy7BtPQ/Ck2zXmxel5vg==
X-CSE-MsgGUID: 1XOzlLWsQKSVbaS6OrUGDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170736"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:41 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 19/29] accel/ivpu: Fix reset_engine debugfs file logic
Date: Tue, 24 Sep 2024 10:17:44 +0200
Message-ID: <20240924081754.209728-20-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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

From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>

The current reset_engine implementation unconditionally resets
all engines. Improve implementation to reset only the engine
requested by the user space to allow more granular testing.
Also use DEFINE_DEBUGFS_ATTRIBUTE() to simplify implementation.

Same changes applied to resume_engine debugfs file for consistency.

Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 42 ++++++-------------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index f788ace8f318f..c2849c12860ed 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -340,49 +340,23 @@ static const struct file_operations ivpu_force_recovery_fops = {
 	.write = ivpu_force_recovery_fn,
 };
 
-static ssize_t
-ivpu_reset_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+static int ivpu_reset_engine_fn(void *data, u64 val)
 {
-	struct ivpu_device *vdev = file->private_data;
-
-	if (!size)
-		return -EINVAL;
-
-	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
-		return -ENODEV;
-	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COPY))
-		return -ENODEV;
+	struct ivpu_device *vdev = (struct ivpu_device *)data;
 
-	return size;
+	return ivpu_jsm_reset_engine(vdev, (u32)val);
 }
 
-static const struct file_operations ivpu_reset_engine_fops = {
-	.owner = THIS_MODULE,
-	.open = simple_open,
-	.write = ivpu_reset_engine_fn,
-};
+DEFINE_DEBUGFS_ATTRIBUTE(ivpu_reset_engine_fops, NULL, ivpu_reset_engine_fn, "0x%02llx\n");
 
-static ssize_t
-ivpu_resume_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+static int ivpu_resume_engine_fn(void *data, u64 val)
 {
-	struct ivpu_device *vdev = file->private_data;
-
-	if (!size)
-		return -EINVAL;
-
-	if (ivpu_jsm_hws_resume_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
-		return -ENODEV;
-	if (ivpu_jsm_hws_resume_engine(vdev, DRM_IVPU_ENGINE_COPY))
-		return -ENODEV;
+	struct ivpu_device *vdev = (struct ivpu_device *)data;
 
-	return size;
+	return ivpu_jsm_hws_resume_engine(vdev, (u32)val);
 }
 
-static const struct file_operations ivpu_resume_engine_fops = {
-	.owner = THIS_MODULE,
-	.open = simple_open,
-	.write = ivpu_resume_engine_fn,
-};
+DEFINE_DEBUGFS_ATTRIBUTE(ivpu_resume_engine_fops, NULL, ivpu_resume_engine_fn, "0x%02llx\n");
 
 static int dct_active_get(void *data, u64 *active_percent)
 {
-- 
2.45.1

