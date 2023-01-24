Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7061678FEA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C784610E5FE;
	Tue, 24 Jan 2023 05:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC3710E5F0;
 Tue, 24 Jan 2023 05:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674538314; x=1706074314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4ArxoXirkgOKloGmAmJiYs7bIiBmJ9MRGfZLIQ4mnM=;
 b=I+KMNoYiyyoJz0q+MBUjdi8eCNb2S4ouC/+dRP53mE15WzJkJKKacK+M
 XZYYokKNpDFejfS5Wf4uO7rbBvqfJbvOm2X9rL0yHrC+bE7ZQAxODepOe
 WgCex7o5Y4jYEGswLAwma5459rElmjY4hTVqXHU+oDmoP98XZFqFAyiW7
 5yIaFhE9EOsy+xeEuV5e5ArS/NDV4X9A2VVVIUAW7BuE6iepoXeDWt+Ny
 ZKUIOjj3uMe/hDoFLN0Gk6vceQ/vkQXNy8aGr3Lcel+qwAzujXJepjazg
 Vpv66MVUDIGdBgPP1au3HdnTuRQKZiTvb2uDlz66T7jBrrmb3XZeFEYP4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324906424"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="324906424"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 21:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="611921441"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; d="scan'208";a="611921441"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 23 Jan 2023 21:31:52 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 1/6] mei: mei-me: resume device in prepare
Date: Mon, 23 Jan 2023 21:31:45 -0800
Message-Id: <20230124053150.3543928-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
References: <20230124053150.3543928-1-alan.previn.teres.alexis@intel.com>
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

Asynchronous runtime resume is not possible while the system
is suspending.
The power management subsystem resumes the device only in the
suspend phase, not in the prepare phase.
Force resume device in prepare to allow drivers on mei bus
to communicate in their prepare callbacks.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
---
 drivers/misc/mei/pci-me.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index 5bf0d50d55a0..676d566f38dd 100644
--- a/drivers/misc/mei/pci-me.c
+++ b/drivers/misc/mei/pci-me.c
@@ -342,6 +342,12 @@ static void mei_me_remove(struct pci_dev *pdev)
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
@@ -398,7 +404,17 @@ static int mei_me_pci_resume(struct device *device)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
+
+static void mei_me_pci_complete(struct device *device)
+{
+	pm_runtime_suspend(device);
+}
+#else /* CONFIG_PM_SLEEP */
+
+#define mei_me_pci_prepare NULL
+#define mei_me_pci_complete NULL
+
+#endif /* !CONFIG_PM_SLEEP */
 
 #ifdef CONFIG_PM
 static int mei_me_pm_runtime_idle(struct device *device)
@@ -501,6 +517,8 @@ static inline void mei_me_unset_pm_domain(struct mei_device *dev)
 }
 
 static const struct dev_pm_ops mei_me_pm_ops = {
+	.prepare = mei_me_pci_prepare,
+	.complete = mei_me_pci_complete,
 	SET_SYSTEM_SLEEP_PM_OPS(mei_me_pci_suspend,
 				mei_me_pci_resume)
 	SET_RUNTIME_PM_OPS(
-- 
2.39.0

