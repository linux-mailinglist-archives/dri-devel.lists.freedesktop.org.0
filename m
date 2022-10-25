Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD460D5C1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA48010E2FB;
	Tue, 25 Oct 2022 20:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3731E10E265
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 20:39:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA70961B98;
 Tue, 25 Oct 2022 20:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F874C433D6;
 Tue, 25 Oct 2022 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666730350;
 bh=LL+baUOB7lW6465yZqZsrPVV98M/NczV4Of/t7DTfVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hOKB+YW0cPiewh7GS3QZKPXq613lrbQWi1B3nMzqMfeEhLc79CcMmWIn3+ANnFhl1
 I24wya5Zq4J98LnRl8s669mcQ0LUw55+ed9lK7oay/GGxciBzRAfBhBnVzspCUhbzp
 4XTuuLd1KyncAWYC1/04s6rBHwk0mq7fL5IhVF4Y3l1C7885iAPum54cNNpc6VTVi9
 zR4ejQTYLw5r8TLPFmQe0B9eOOTyMW4MhW4/u9ffoZX6WKZy5bPr87GmpeAuMJfTCV
 HLc8qoJxlCME77dC2hR+eAAqXpFqh9/b9SUABTN9bMxRPyFCXFqGP1/z1IWhlCs854
 fPb+JSJE6jEuQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: [PATCH v2 6/8] agp/amd64: Update to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Oct 2022 15:38:50 -0500
Message-Id: <20221025203852.681822-7-helgaas@kernel.org>
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
 drivers/char/agp/amd64-agp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index 84a4aa9312cf..ce8651436609 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -588,9 +588,7 @@ static void agp_amd64_remove(struct pci_dev *pdev)
 	agp_bridges_found--;
 }
 
-#define agp_amd64_suspend NULL
-
-static int __maybe_unused agp_amd64_resume(struct device *dev)
+static int agp_amd64_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 
@@ -727,7 +725,7 @@ static const struct pci_device_id agp_amd64_pci_promisc_table[] = {
 	{ }
 };
 
-static SIMPLE_DEV_PM_OPS(agp_amd64_pm_ops, agp_amd64_suspend, agp_amd64_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(agp_amd64_pm_ops, NULL, agp_amd64_resume);
 
 static struct pci_driver agp_amd64_pci_driver = {
 	.name		= "agpgart-amd64",
-- 
2.25.1

