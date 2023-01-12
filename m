Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5336667D3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 01:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753CD10E841;
	Thu, 12 Jan 2023 00:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4588E10E2C1;
 Thu, 12 Jan 2023 00:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673483830; x=1705019830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ALdp5m4zJK4j40J6RgfsW0Df3XImqncrm7b3PrJivg=;
 b=mA8IJMwS9bRpTr0eh1yZS27NDacpNls9YcCSQ5bBbzl19vNwSd6a3tll
 JU1giJXFqS7+GZJgT71/N1Li35GpEgzwSplL3auQFUW96YtC2oHmpmYgl
 DEJL2vXx6S4l7lrbEr4PGAyarrDJSETfF9eGb+yabYDj9cmfT4PCHMIVa
 HUsGPDBYdo1hRmUbuh6LlmYeEw/LnMj28Tiuaw3hVj5dON6nyfTLoK0kc
 n1dUeIiHyGZZwuCRO8SsJA9hGM70ffA306WtCHr0Rnnbmngvc4OQBXoXL
 VHewyzKHRo/aZYvKY2RsDNzSCDiq+6Ckj1ZJhRzDH9FNJAy8KlW6YHqfL w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303271470"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="303271470"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 16:37:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635179834"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="635179834"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 16:37:09 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/6] mei: mei-me: resume device in prepare
Date: Wed, 11 Jan 2023 16:37:01 -0800
Message-Id: <20230112003706.950931-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
References: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
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
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/misc/mei/pci-me.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index 704cd0caa172..4280759739f0 100644
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
@@ -396,7 +402,17 @@ static int mei_me_pci_resume(struct device *device)
 
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
+#define mei_me_pci_suspend NULL
+
+#endif /* !CONFIG_PM_SLEEP */
 
 #ifdef CONFIG_PM
 static int mei_me_pm_runtime_idle(struct device *device)
@@ -499,6 +515,8 @@ static inline void mei_me_unset_pm_domain(struct mei_device *dev)
 }
 
 static const struct dev_pm_ops mei_me_pm_ops = {
+	.prepare = mei_me_pci_prepare,
+	.complete = mei_me_pci_complete,
 	SET_SYSTEM_SLEEP_PM_OPS(mei_me_pci_suspend,
 				mei_me_pci_resume)
 	SET_RUNTIME_PM_OPS(
-- 
2.39.0

