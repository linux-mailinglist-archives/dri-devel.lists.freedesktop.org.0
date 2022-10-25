Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEFC60D5B9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4275B10E259;
	Tue, 25 Oct 2022 20:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E36C10E265
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 20:39:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C075361BA0;
 Tue, 25 Oct 2022 20:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF16BC4314C;
 Tue, 25 Oct 2022 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666730352;
 bh=4U2Y2nS1NEDGY730Ztzv3h+sGYHHC0Hoahv0O6htLzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MQ+rjRAtEcr4UaIO8JPylqo5thwJdP/krAtsIHAsmnTh8411Mou/ZLhovXA+dGXDg
 po38aAy223M47Qm78VosJmh0gnW8kkOGpBWsuqjSl4vG9MaB/h2VRF73REgs2sZQSJ
 FCxgQPgQKH5Ur7IOILecgY/RSOH7xny3/sh5ZgQfVGMJWVoRX3dmTzeli2g9ITGd4e
 msXpM7H4dYuEJ9/7OvBKX8N2M7riiZbb4SJY+aw9qZmzwRqCGa8XPMLdwsGAynnTvl
 a1VXIirkNVOjYYIHOMrrNDJbtFScjOSVB6ntzyp/urcN0zCIWmIQwpX2TfWtImAeUg
 J5+zonViGhn9w==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: [PATCH v2 7/8] agp/sis: Update to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Oct 2022 15:38:51 -0500
Message-Id: <20221025203852.681822-8-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025203852.681822-1-helgaas@kernel.org>
References: <20221025203852.681822-1-helgaas@kernel.org>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

As of 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old
ones"), SIMPLE_DEV_PM_OPS() is deprecated in favor of
DEFINE_SIMPLE_DEV_PM_OPS(), which has the advantage that the PM callbacks
don't need to be wrapped with #ifdef CONFIG_PM or tagged with
__maybe_unused.

Convert to DEFINE_SIMPLE_DEV_PM_OPS().  No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/char/agp/sis-agp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/char/agp/sis-agp.c b/drivers/char/agp/sis-agp.c
index f8a02f4bef1b..484bb101c53b 100644
--- a/drivers/char/agp/sis-agp.c
+++ b/drivers/char/agp/sis-agp.c
@@ -217,10 +217,7 @@ static void agp_sis_remove(struct pci_dev *pdev)
 	agp_put_bridge(bridge);
 }
 
-#define agp_sis_suspend NULL
-
-static int __maybe_unused agp_sis_resume(
-	__attribute__((unused)) struct device *dev)
+static int agp_sis_resume(__attribute__((unused)) struct device *dev)
 {
 	return sis_driver.configure();
 }
@@ -407,7 +404,7 @@ static const struct pci_device_id agp_sis_pci_table[] = {
 
 MODULE_DEVICE_TABLE(pci, agp_sis_pci_table);
 
-static SIMPLE_DEV_PM_OPS(agp_sis_pm_ops, agp_sis_suspend, agp_sis_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(agp_sis_pm_ops, NULL, agp_sis_resume);
 
 static struct pci_driver agp_sis_pci_driver = {
 	.name		= "agpgart-sis",
-- 
2.25.1

