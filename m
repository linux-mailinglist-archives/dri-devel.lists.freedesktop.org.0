Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1FB11E3CE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 13:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23706E7D2;
	Fri, 13 Dec 2019 12:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2019 12:47:23 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDAC6E7D2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 12:47:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 0915E292C87
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: Prefix interrupt handlers' names
Date: Fri, 13 Dec 2019 09:39:42 -0300
Message-Id: <20191213123942.22891-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
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
Cc: kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the interrupt lines requested by Panfrost
use ambiguous names, which adds some obscurity
to interrupt introspection (i.e. any tool based
on procfs' interrupts file).

In order to improve this, prefix each requested
interrupt with either the module name or the device
name, where possible.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index f67ed925c0ef..0355c4a78eaa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -348,7 +348,7 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 		return -ENODEV;
 
 	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
-			       IRQF_SHARED, "gpu", pfdev);
+			       IRQF_SHARED, dev_name(pfdev->dev), pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "failed to request gpu irq");
 		return err;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 05c85f45a0de..3bd79ebb6c40 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -480,7 +480,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		return -ENODEV;
 
 	ret = devm_request_irq(pfdev->dev, irq, panfrost_job_irq_handler,
-			       IRQF_SHARED, "job", pfdev);
+			       IRQF_SHARED, KBUILD_MODNAME "-job", pfdev);
 	if (ret) {
 		dev_err(pfdev->dev, "failed to request job irq");
 		return ret;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 842bdd7cf6be..806958434726 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -612,9 +612,11 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
 	if (irq <= 0)
 		return -ENODEV;
 
-	err = devm_request_threaded_irq(pfdev->dev, irq, panfrost_mmu_irq_handler,
+	err = devm_request_threaded_irq(pfdev->dev, irq,
+					panfrost_mmu_irq_handler,
 					panfrost_mmu_irq_handler_thread,
-					IRQF_SHARED, "mmu", pfdev);
+					IRQF_SHARED, KBUILD_MODNAME "-mmu",
+					pfdev);
 
 	if (err) {
 		dev_err(pfdev->dev, "failed to request mmu irq");
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
