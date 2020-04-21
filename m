Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5501B32C8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 00:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162CC6E10E;
	Tue, 21 Apr 2020 22:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 336336E0E0;
 Tue, 21 Apr 2020 22:51:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E48731B;
 Tue, 21 Apr 2020 15:51:47 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA42B3F73D;
 Tue, 21 Apr 2020 15:51:46 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: yuq825@gmail.com
Subject: [PATCH 1/2] drm/lima: Clean up IRQ warnings
Date: Tue, 21 Apr 2020 23:51:36 +0100
Message-Id: <de475904091400ef6c123285f221094654d96d35.1587509150.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
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
Cc: lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the optional form of platform_get_irq() for blocks that legitimately
may not be present, to avoid getting an annoying barrage of spurious
warnings for non-existent PPs on configurations like Mali-450 MP2.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/lima/lima_device.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index 247f51fd40a2..c334d297796a 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -171,8 +171,10 @@ static void lima_regulator_fini(struct lima_device *dev)
 
 static int lima_init_ip(struct lima_device *dev, int index)
 {
+	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct lima_ip_desc *desc = lima_ip_desc + index;
 	struct lima_ip *ip = dev->ip + index;
+	const char *irq_name = desc->irq_name;
 	int offset = desc->offset[dev->id];
 	bool must = desc->must_have[dev->id];
 	int err;
@@ -183,8 +185,9 @@ static int lima_init_ip(struct lima_device *dev, int index)
 	ip->dev = dev;
 	ip->id = index;
 	ip->iomem = dev->iomem + offset;
-	if (desc->irq_name) {
-		err = platform_get_irq_byname(dev->pdev, desc->irq_name);
+	if (irq_name) {
+		err = must ? platform_get_irq_byname(pdev, irq_name) :
+			     platform_get_irq_byname_optional(pdev, irq_name);
 		if (err < 0)
 			goto out;
 		ip->irq = err;
-- 
2.23.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
