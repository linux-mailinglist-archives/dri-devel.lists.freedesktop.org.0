Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77A135A27
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 14:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412656E419;
	Thu,  9 Jan 2020 13:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CEFB56E419
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 13:31:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77B9431B;
 Thu,  9 Jan 2020 05:31:10 -0800 (PST)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 432493F534;
 Thu,  9 Jan 2020 05:31:09 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Remove core stack power management
Date: Thu,  9 Jan 2020 13:31:04 +0000
Message-Id: <20200109133104.11661-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Explict management of the GPU's core stacks is only necessary in the
case of a broken integration with the PDC. Since there are no known
platforms which have such a broken integration let's remove the explict
control from the driver since this apparently causes problems on other
platforms and will have a small performance penality.

The out of tree mali_kbase driver contains this text regarding
controlling the core stack (CONFIGMALI_CORESTACK):

  Enabling this feature on supported GPUs will let the driver powering
  on/off the GPU core stack independently without involving the Power
  Domain Controller. This should only be enabled on platforms which
  integration of the PDC to the Mali GPU is known to be problematic.
  This feature is currently only supported on t-Six and t-HEx GPUs.

  If unsure, say N.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 8822ec13a0d6..460fc190de6e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -309,10 +309,6 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
 		val, val == pfdev->features.l2_present, 100, 1000);
 
-	gpu_write(pfdev, STACK_PWRON_LO, pfdev->features.stack_present);
-	ret |= readl_relaxed_poll_timeout(pfdev->iomem + STACK_READY_LO,
-		val, val == pfdev->features.stack_present, 100, 1000);
-
 	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
 	ret |= readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
 		val, val == pfdev->features.shader_present, 100, 1000);
@@ -329,7 +325,6 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 {
 	gpu_write(pfdev, TILER_PWROFF_LO, 0);
 	gpu_write(pfdev, SHADER_PWROFF_LO, 0);
-	gpu_write(pfdev, STACK_PWROFF_LO, 0);
 	gpu_write(pfdev, L2_PWROFF_LO, 0);
 }
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
