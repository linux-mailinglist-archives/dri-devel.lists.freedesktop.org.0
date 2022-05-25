Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6D533FAC
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67F810FA8F;
	Wed, 25 May 2022 14:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6554010FA8F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:58:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 94FAC1F450F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653490696;
 bh=CcULeZxjY87ecxTA0HcUOCLHUV0rECEmqTrVAi386iI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O+8jb27A4B7maymABi5fpZFg6lIo5ElWSABs76c1Rpiu7SdK081CjQ8LLBXWiCdLk
 JMxh/+PXaQVaQZKA96R4ax6mQEifXfCP5wFVK0eVltFBkzkPhQp/iCBq9DjOLB+wTK
 ZC9bw8AzYkWK6Ti8ESxc86i8Jbl7haDYRjGHGOXXcE+qlt+GFIdK3VOzN9XnJ6jb05
 twSkGZScijfVsNQh7Xy6cPUaa35HkUuhNkBjA8NobLfSkdehftBkuBBsKr9N2v9ej4
 6MJFghYWq3Vv4+qhr+Y8YDadLKTmjgadj5xhK+ywt8MS/aSvD2RJe7POYGjxHc3JWH
 D/UzhOQuU34UA==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/9] drm/panfrost: Handle HW_ISSUE_TTRX_3076
Date: Wed, 25 May 2022 10:57:49 -0400
Message-Id: <20220525145754.25866-5-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
References: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Valhall GPUs require resets when encountering bus faults due to
occlusion query writes. Add the issue bit for this and handle it.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 9 +++++++--
 drivers/gpu/drm/panfrost/panfrost_issues.h | 4 ++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 7f51a4682ccb..ee612303f076 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -11,6 +11,7 @@
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
 #include "panfrost_features.h"
+#include "panfrost_issues.h"
 #include "panfrost_gpu.h"
 #include "panfrost_job.h"
 #include "panfrost_mmu.h"
@@ -380,9 +381,13 @@ const char *panfrost_exception_name(u32 exception_code)
 bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
 				    u32 exception_code)
 {
-	/* Right now, none of the GPU we support need a reset, but this
-	 * might change.
+	/* If an occlusion query write causes a bus fault on affected GPUs,
+	 * future fragment jobs may hang. Reset to workaround.
 	 */
+	if (exception_code == DRM_PANFROST_EXCEPTION_JOB_BUS_FAULT)
+		return panfrost_has_hw_issue(pfdev, HW_ISSUE_TTRX_3076);
+
+	/* No other GPUs we support need a reset */
 	return false;
 }
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 14670ee58ace..e35807e4b743 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -128,6 +128,10 @@ enum panfrost_hw_issue {
 	/* Must set SC_VAR_ALGORITHM */
 	HW_ISSUE_TTRX_2968_TTRX_3162,
 
+	/* Bus fault from occlusion query write may cause future fragment jobs
+	 * to hang */
+	HW_ISSUE_TTRX_3076,
+
 	HW_ISSUE_END
 };
 
-- 
2.35.1

