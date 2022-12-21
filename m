Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019B653990
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 00:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C11E10E4E2;
	Wed, 21 Dec 2022 23:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B690210E04A;
 Wed, 21 Dec 2022 23:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671663819; x=1703199819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rCTr22nuyWJndMmdoi54IWZm2UT7pyV0gYhgvO1306M=;
 b=JFGMPT0M6NWvcwjF9F1paUkcNI43dOJa0WU6XQiXC2HrnxkOOb1SRSBk
 OYJzHDBc8yGpIv6IA2TWf3n11mr3FKWFHJ9YuCJbedOk/d/2N7zLmhrem
 quRVl8+bsjN/XfCy/mKl7NvPCg9VttSrOBqBYJhkQAuu+sqTAANwwdP6q
 CzLnXUiFVb7a8+loZ9SG45OzoUlD8+cEiJ31Y07UIiuNkqrFagHTOMgqz
 M9WJgKMmA8UrzGPGUuqJv5Fwj4l2xMXJtSjKMBSDRNhFDjsg4rl4Ncu2n
 65/bP7UQzkwfRlWtnyNqA0H7t8WCUuchcf6kj4Ksque/qE+Js+Ktn7/IZ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321905522"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321905522"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 15:03:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="793864414"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="793864414"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2022 15:03:39 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/7] mei: mei-me: resume device in prepare
Date: Wed, 21 Dec 2022 15:06:22 -0800
Message-Id: <20221221230628.2715916-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
References: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodrigo <rodrigo.vivi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Juston Li <justonli@chromium.org>,
	Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Usyskin <alexander.usyskin@intel.com>

Async runtime resume is not possible while system is suspending.
The power management subsystem resumes device only in the
suspend phase, not in the prepare phase.
Force resume device in prepare to allow drivers on mei bus
to communicate in prepare callbacks.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/pci-me.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index 704cd0caa172..713c1acb931f 100644
--- a/drivers/misc/mei/pci-me.c
+++ b/drivers/misc/mei/pci-me.c
@@ -340,6 +340,12 @@ static void mei_me_remove(struct pci_dev *pdev)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static int mei_me_pci_prepare(struct device *device)
+{
+	pm_runtime_resume(device);
+	return 0;
+}
+
 static int mei_me_pci_suspend(struct device *device)
 {
 	struct pci_dev *pdev = to_pci_dev(device);
@@ -396,6 +402,11 @@ static int mei_me_pci_resume(struct device *device)
 
 	return 0;
 }
+
+static void mei_me_pci_complete(struct device *device)
+{
+	pm_runtime_suspend(device);
+}
 #endif /* CONFIG_PM_SLEEP */
 
 #ifdef CONFIG_PM
@@ -499,6 +510,8 @@ static inline void mei_me_unset_pm_domain(struct mei_device *dev)
 }
 
 static const struct dev_pm_ops mei_me_pm_ops = {
+	.prepare = mei_me_pci_prepare,
+	.complete = mei_me_pci_complete,
 	SET_SYSTEM_SLEEP_PM_OPS(mei_me_pci_suspend,
 				mei_me_pci_resume)
 	SET_RUNTIME_PM_OPS(
-- 
2.34.1

