Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63753E440
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 13:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DE810E5CF;
	Mon,  6 Jun 2022 11:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 381C710E6D4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 11:47:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC5DE1596;
 Mon,  6 Jun 2022 04:47:47 -0700 (PDT)
Received: from e126387.arm.com (unknown [10.57.68.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A4723F73B;
 Mon,  6 Jun 2022 04:47:47 -0700 (PDT)
From: carsten.haitzler@foss.arm.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/komeda - At init write GCU control block to handle
 already on DPU
Date: Mon,  6 Jun 2022 12:47:13 +0100
Message-Id: <20220606114714.175499-2-carsten.haitzler@foss.arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
References: <20220606114714.175499-1-carsten.haitzler@foss.arm.com>
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
Cc: liviu.dudau@arm.com, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Carsten Haitzler <carsten.haitzler@arm.com>

If something has already set up the DPU before the komeda driver comes
up, it will fail to init because it was just writing to the SRST bit in
the GCU control register and ignoring others. This resulted in TBU
bringup stalling and init failing. By writing completely we also  set the
mode back to 0 (inactive) too and thus TBU bringup works.

Signed-off-by: Carsten Haitzler <carsten.haitzler@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
index 00fa56c29b3e..39618c1a4c81 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
@@ -309,8 +309,7 @@ static int d71_reset(struct d71_dev *d71)
 	u32 __iomem *gcu = d71->gcu_addr;
 	int ret;
 
-	malidp_write32_mask(gcu, BLK_CONTROL,
-			    GCU_CONTROL_SRST, GCU_CONTROL_SRST);
+	malidp_write32(gcu, BLK_CONTROL, GCU_CONTROL_SRST);
 
 	ret = dp_wait_cond(!(malidp_read32(gcu, BLK_CONTROL) & GCU_CONTROL_SRST),
 			   100, 1000, 10000);
-- 
2.32.0

