Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684AC9F0728
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CAC10EF6C;
	Fri, 13 Dec 2024 09:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kxRpzPIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB3310EF6C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:03:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6902B5C68E3;
 Fri, 13 Dec 2024 09:02:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B13C4CED0;
 Fri, 13 Dec 2024 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734080595;
 bh=NizxC6ffABBIqBlStRdWBBxHvkeP+72l2DX9fzyIYCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kxRpzPIZnnnDBm/XykoqLZyTN+GsGvqQvgPCw1HSgyhujXWEKZPqdlBRDdvtGVtUk
 CG3+gWKfxHtFW7b/oQnIFLIHUjPCx8Vafi6IL1hUpdwtpo6EpceVegW8VGXjXxB1ej
 D9Z0n5GduLYhGzbbeGnYWNOOxtl3I5DE6Oz7bAQWlm2AC7WGJapuaqLTk9CBYhql2V
 adtOMV+DrPMMfVseR6EpzwtUSP1pNp60diN+yJ1xsmnut6JObdpNauEB2kpeWumXlp
 apt1M3ub6suN3nqA9FDiH0mvWfqPVEd1hjSEs8OBL5CSDiAld+U0qPsbyKAyogBxKG
 X2wocE0dxAA3g==
From: Arnd Bergmann <arnd@kernel.org>
To: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, George Yang <George.Yang@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] accel/amdxdna: add missing includes
Date: Fri, 13 Dec 2024 10:02:55 +0100
Message-Id: <20241213090259.68492-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241213090259.68492-1-arnd@kernel.org>
References: <20241213090259.68492-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

This driver fails to build in random configurations:

drivers/accel/amdxdna/amdxdna_mailbox.c:357:8: error: unknown type name 'irqreturn_t'
  357 | static irqreturn_t mailbox_irq_handler(int irq, void *p)
      |        ^~~~~~~~~~~
drivers/accel/amdxdna/amdxdna_mailbox.c: In function 'mailbox_irq_handler':
drivers/accel/amdxdna/amdxdna_mailbox.c:367:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
  367 |         return IRQ_HANDLED;
      |                ^~~~~~~~~~~
drivers/accel/amdxdna/amdxdna_mailbox.c:367:16: note: each undeclared identifier is reported only once for each function it appears in
drivers/accel/amdxdna/amdxdna_mailbox.c: In function 'mailbox_rx_worker':
drivers/accel/amdxdna/amdxdna_mailbox.c:395:25: error: implicit declaration of function 'disable_irq'; did you mean 'disable_work'? [-Wimplicit-function-declaration]
  395 |                         disable_irq(mb_chann->msix_irq);
      |                         ^~~~~~~~~~~
drivers/accel/amdxdna/aie2_solver.c: In function 'remove_partition_node':
drivers/accel/amdxdna/aie2_solver.c:121:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
  121 |         kfree(pt_node);
      |         ^~~~~
drivers/accel/amdxdna/aie2_solver.c: In function 'get_free_partition':
drivers/accel/amdxdna/aie2_solver.c:153:19: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
  153 |         pt_node = kzalloc(sizeof(*pt_node), GFP_KERNEL);

Include the headers that have the necessary declarations.

Fixes: c88d3325ae69 ("accel/amdxdna: Add hardware resource solver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

amdxdna: includ linux/interrupt.h

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/amdxdna/aie2_solver.c     | 1 +
 drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_solver.c b/drivers/accel/amdxdna/aie2_solver.c
index a537c66589a4..0bbf91cad334 100644
--- a/drivers/accel/amdxdna/aie2_solver.c
+++ b/drivers/accel/amdxdna/aie2_solver.c
@@ -8,6 +8,7 @@
 #include <drm/drm_print.h>
 #include <linux/bitops.h>
 #include <linux/bitmap.h>
+#include <linux/slab.h>
 
 #include "aie2_solver.h"
 
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 415d99abaaa3..41bbc5796e11 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -7,6 +7,7 @@
 #include <drm/drm_managed.h>
 #include <linux/bitfield.h>
 #include <linux/iopoll.h>
+#include <linux/interrupt.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/amdxdna.h>
-- 
2.39.5

