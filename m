Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F8766EBB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 15:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66F410E6ED;
	Fri, 28 Jul 2023 13:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD7B10E6ED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 13:48:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE827620FD;
 Fri, 28 Jul 2023 13:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FFCC433C7;
 Fri, 28 Jul 2023 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690552136;
 bh=ybAewDSIihhc9NHGhos2fH++UkcTbQSngJl7W7DzYpc=;
 h=From:To:Cc:Subject:Date:From;
 b=oDxPzCSS6ehCZesw8RUEPFEJvyhTJvVh/bwVCf/zMFZ8ahhmcU1v6L0qxMJrJC2L1
 w826i3oZYo16kjtBfSrcWXLvw6+wzJ2+FfBRzoHEUuji3Bv8PjcYMMN/M7wq19U5om
 pTRClACtk8Rf797gBpL8u1ns1MFtNCc1p/zQy208F+rrB4NmB91JIcbgVi4933dC8U
 dsVa93vqJe190+Jrf2LYiyNfjf4nPqBs721jYiR33v0p1IF6WIRgVG4e0ltAL9hYdm
 tH3MGCT6juqTCo29mUJHmtAxdLhsC170M6MBzonGxxguVNCrDMDSXp3MimuOTrf00F
 fwPwf68IjUrHw==
Received: (nullmailer pid 3224739 invoked by uid 1000);
 Fri, 28 Jul 2023 13:48:55 -0000
From: Rob Herring <robh@kernel.org>
To: David Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3] char: Explicitly include correct DT includes
Date: Fri, 28 Jul 2023 07:48:45 -0600
Message-Id: <20230728134845.3224553-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v3:
 - Split out hw_random, ipmi and tpm
---
 drivers/char/agp/uninorth-agp.c | 1 +
 drivers/char/bsr.c              | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
index 62de7f4ba864..84411b13c49f 100644
--- a/drivers/char/agp/uninorth-agp.c
+++ b/drivers/char/agp/uninorth-agp.c
@@ -3,6 +3,7 @@
  * UniNorth AGPGART routines.
  */
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/init.h>
diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
index 12143854aeac..70d31aed9011 100644
--- a/drivers/char/bsr.c
+++ b/drivers/char/bsr.c
@@ -6,11 +6,10 @@
  * Author: Sonny Rao <sonnyrao@us.ibm.com>
  */
 
+#include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/cdev.h>
-- 
2.40.1

