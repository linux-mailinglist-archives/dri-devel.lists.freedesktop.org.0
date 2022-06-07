Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3530541F57
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9B91122AE;
	Tue,  7 Jun 2022 23:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772021122AE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 23:11:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3640061703;
 Tue,  7 Jun 2022 23:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9DCC3411E;
 Tue,  7 Jun 2022 23:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654643479;
 bh=y+QVg0F3fAIYsNxlSyZ9c31L5KgrkSOzkMmIiNJ4tBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J708mHBcV3ASHhE64eucN/0OCRphrtgeh9kQjlGhSOT4U0ZFoUwBXKyPChkTBPfxA
 ngybZp2fvbz4/wudpP1WJxvoCNDimmb6mbgkZbqy2q+gO+Nz2gAqPM55dQGq1aExVM
 LidHotx7s6IOD0qTW0RFSluJ9NT5PSFwO2ljiECXNMOQcx/9bhkEyszMDuyyckSK0X
 15EyOC0uyANxJSj9C1Xq9vPm6nwT4mxLoyZD6+9m+202W7iJcIQ1FWjxLzP/J3CnPp
 AzWyeBFiQ0pwINv6cS72lOUOISDxHl1PKxKVwHgGeIN8NbHEMnD3cF1GpRirUsubQ4
 QbS0GdsPbc4KA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] video: fbdev: cirrusfb: Remove useless reference to PCI
 power management
Date: Tue,  7 Jun 2022 18:11:11 -0500
Message-Id: <20220607231112.354165-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607231112.354165-1-helgaas@kernel.org>
References: <20220607231112.354165-1-helgaas@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

PCI-specific power management (pci_driver.suspend and pci_driver.resume) is
deprecated.  The cirrusfb driver has never implemented power management at
all, but if it ever does, it should use the generic power management
framework, not the PCI-specific hooks.

Remove the commented-out references to the PCI-specific power management
hooks.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/video/fbdev/cirrusfb.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 3d47c347b897..51e072c03e1c 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -2184,12 +2184,6 @@ static struct pci_driver cirrusfb_pci_driver = {
 	.id_table	= cirrusfb_pci_table,
 	.probe		= cirrusfb_pci_register,
 	.remove		= cirrusfb_pci_unregister,
-#ifdef CONFIG_PM
-#if 0
-	.suspend	= cirrusfb_pci_suspend,
-	.resume		= cirrusfb_pci_resume,
-#endif
-#endif
 };
 #endif /* CONFIG_PCI */
 
-- 
2.25.1

