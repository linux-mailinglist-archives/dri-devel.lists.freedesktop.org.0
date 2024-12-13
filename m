Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 117C09F0724
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E4810EF69;
	Fri, 13 Dec 2024 09:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c+pw5LVi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218D210EF69
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:03:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E045FA42772;
 Fri, 13 Dec 2024 09:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BDBC4CED0;
 Fri, 13 Dec 2024 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734080584;
 bh=6M2BE/YkDncPuZAYofQG/dj3wcltiY44hkQ3DVP8cO4=;
 h=From:To:Cc:Subject:Date:From;
 b=c+pw5LVioue94aMM7KXv6oRGsk2Knm+Ag1MIpSZkmOu+1jQ0Zz92gEMdYkAJGmhse
 Zm5BTKiT9Q6qNeUcPFkv84NXignDv5NzzSe7aQpbtyiZHq1M6fSvQ//DOGusZL/gpa
 qG3m4djUjYFMRmY7Q8TeIPGJ7EabpfAZ+LF1Vx+XiU34GXIg6EysJVJGvfz/eoxJ9z
 HjA6j7kk4c1AIUDI/UuKe2hqK5LdobSatMwjfJmze12LoKtNT6nI3tZNFc2z1H0U8c
 uQiKSvhYEEkR9aOKL4AA9WX6K4dYDaK3dvN/54bZmI32HYxQKiPHb88b5OYOA3J3Zb
 nbG8O52CgWQbg==
From: Arnd Bergmann <arnd@kernel.org>
To: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Narendra Gutta <VenkataNarendraKumar.Gutta@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] accel/amdxdna: use modern PM helpers
Date: Fri, 13 Dec 2024 10:02:54 +0100
Message-Id: <20241213090259.68492-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

The old SET_SYSTEM_SLEEP_PM_OPS and SET_RUNTIME_PM_OPS macros cause a build
warning when CONFIG_PM is disabled:

drivers/accel/amdxdna/amdxdna_pci_drv.c:343:12: error: 'amdxdna_pmops_resume' defined but not used [-Werror=unused-function]
  343 | static int amdxdna_pmops_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~
drivers/accel/amdxdna/amdxdna_pci_drv.c:328:12: error: 'amdxdna_pmops_suspend' defined but not used [-Werror=unused-function]
  328 | static int amdxdna_pmops_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~

Change these to the modern replacements.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 02533732d4ca..b2342abdddc6 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -390,8 +390,8 @@ static int amdxdna_rpmops_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops amdxdna_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
-	SET_RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
+	RUNTIME_PM_OPS(amdxdna_rpmops_suspend, amdxdna_rpmops_resume, NULL)
 };
 
 static struct pci_driver amdxdna_pci_driver = {
-- 
2.39.5

