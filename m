Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1E767AB9C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 09:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB8D89FC9;
	Wed, 25 Jan 2023 08:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CF988FAE;
 Wed, 25 Jan 2023 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674635204; x=1706171204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kBmMnLyy6W2MDFW1b38+tE3Zdfm36TxVLDVPmm+kaNU=;
 b=eoA5qo9IJS5jTZHwdA+w7lsXqmE431qmpPfFCCidl73SECs0excXCXa/
 51NvlB8UrGsM1VSlM8NUsPykCQOUXAZfPAaCKjpLEIc4UXgTsXmIBhjy4
 lDmaMplcmGViZbzhDycFLipE9WH8nRH+1VBSZIpAVx+KbczRbvfspKHJh
 ctDoXvw6KVVIMGjwD6745sT87mbHruIyGB82S9EMkUZp+7dK7Y/2hi3jy
 CIPyFSsHSM5LWKPdY/0C9ymYiRWEnp7rV2m3gdu13jH0FQ37/rs5snHxa
 STiE4IqldIpzTGLD8lGk9LEIiw487eU+C7qypZLjPyvFXrtfBYngRhHsX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="325180410"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="325180410"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 00:26:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="662426108"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="662426108"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga002.jf.intel.com with ESMTP; 25 Jan 2023 00:26:38 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 1/6] mei: mei-me: resume device in prepare
Date: Wed, 25 Jan 2023 00:26:32 -0800
Message-Id: <20230125082637.118970-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
References: <20230125082637.118970-1-alan.previn.teres.alexis@intel.com>
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
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
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

