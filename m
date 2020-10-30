Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50282A08B0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 15:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A756EDE0;
	Fri, 30 Oct 2020 14:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A721D6EDE0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 14:58:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E96B6139F;
 Fri, 30 Oct 2020 07:58:56 -0700 (PDT)
Received: from e112269-lin.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E63B3F68F;
 Fri, 30 Oct 2020 07:58:55 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: Fix module unload
Date: Fri, 30 Oct 2020 14:58:33 +0000
Message-Id: <20201030145833.29006-1-steven.price@arm.com>
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
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When unloading the call to pm_runtime_put_sync_suspend() will attempt to
turn the GPU cores off, however panfrost_device_fini() will have turned
the clocks off. This leads to the hardware locking up.

Instead don't call pm_runtime_put_sync_suspend() and instead simply mark
the device as suspended using pm_runtime_set_suspended(). And also
include this on the error path in panfrost_probe().

Fixes: aebe8c22a912 ("drm/panfrost: Fix possible suspend in panfrost_remove")
Signed-off-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 23513869500c..0ac8ad18fdc6 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -627,6 +627,7 @@ static int panfrost_probe(struct platform_device *pdev)
 err_out1:
 	pm_runtime_disable(pfdev->dev);
 	panfrost_device_fini(pfdev);
+	pm_runtime_set_suspended(pfdev->dev);
 err_out0:
 	drm_dev_put(ddev);
 	return err;
@@ -641,9 +642,9 @@ static int panfrost_remove(struct platform_device *pdev)
 	panfrost_gem_shrinker_cleanup(ddev);
 
 	pm_runtime_get_sync(pfdev->dev);
-	panfrost_device_fini(pfdev);
-	pm_runtime_put_sync_suspend(pfdev->dev);
 	pm_runtime_disable(pfdev->dev);
+	panfrost_device_fini(pfdev);
+	pm_runtime_set_suspended(pfdev->dev);
 
 	drm_dev_put(ddev);
 	return 0;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
