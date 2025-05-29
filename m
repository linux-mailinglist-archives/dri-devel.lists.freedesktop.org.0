Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3B8AC77F0
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D07810E6F4;
	Thu, 29 May 2025 05:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4Z9S1xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9B010E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497461; x=1780033461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GNv2RKvyaLb/r2umwW27kcjDvWo5+4A29CNU15DNhN4=;
 b=n4Z9S1xbC5UVNafwcIjCmTurEZmBmQT9Q2KpiDnelP543rTul9o6SylZ
 FnLF2QJ4XRiXMB1K417aQKMWkOnI7vwAicjq5q2NgFTEavIpZqN4xoX7H
 OYPNDs3NeyQXeOpGM+azGzNwxVUDxwKIpz9s/1jeZks0S/aDeORioJMLQ
 OUuLxXe7sHwU62X4HNCG/NYi6hp+IXjo4UA/KSmfvoRP4RcPkwHNFowMN
 TN9/+fbh7IEtO8Hp3Zz2KkqURNBWEl/FHhhSII60dAw3lRzV4ImX5suie
 8seai7On5v3s4fmNRqtVqPrjpQgdu3J0uaPY3iyy6DB0/F79DaSvbf7I/ A==;
X-CSE-ConnectionGUID: RpOWYacySy2tdh0v/tkNcQ==
X-CSE-MsgGUID: ZTWMaEilSV2bwER/7vz3zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67963388"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67963388"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:44:21 -0700
X-CSE-ConnectionGUID: uG+vLF2RRoeXmzPQgvbfyA==
X-CSE-MsgGUID: r//6m1aFQ+ylGKPz+nsRXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443620"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:44:14 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 25/30] coco/tdx_tsm: Add connect()/disconnect() handlers
 prototype
Date: Thu, 29 May 2025 13:35:08 +0800
Message-Id: <20250529053513.1592088-26-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
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

From: Wu Hao <hao.wu@intel.com>

Add basic skeleton for connect()/disconnect() handlers. The major steps
are SPDM setup first and then IDE selective stream setup.

No detailed TDX Connect implementation.

Signed-off-by: Wu Hao <hao.wu@intel.com>
Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/virt/coco/host/tdx_tsm.c | 55 +++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/host/tdx_tsm.c b/drivers/virt/coco/host/tdx_tsm.c
index 72f3705fe7bb..d1a8384d8339 100644
--- a/drivers/virt/coco/host/tdx_tsm.c
+++ b/drivers/virt/coco/host/tdx_tsm.c
@@ -79,13 +79,66 @@ static int tdx_tsm_guest_req(struct pci_dev *pdev,
 	return -ENXIO;
 }
 
+static int tdx_tsm_spdm_session_setup(struct tdx_tsm *ttsm)
+{
+	return 0;
+}
+
+static int tdx_tsm_spdm_session_teardown(struct tdx_tsm *ttsm)
+{
+	return 0;
+}
+
+static int tdx_tsm_ide_stream_setup(struct tdx_tsm *ttsm)
+{
+	return 0;
+}
+
+static int tdx_tsm_ide_stream_teardown(struct tdx_tsm *ttsm)
+{
+	return 0;
+}
+
 static int tdx_tsm_connect(struct pci_dev *pdev)
 {
-	return -ENXIO;
+	struct tdx_tsm *ttsm = to_tdx_tsm(pdev->tsm);
+	int ret;
+
+	ret = tdx_tsm_spdm_session_setup(ttsm);
+	if (ret) {
+		pci_err(pdev, "fail to setup spdm session\n");
+		return ret;
+	}
+
+	ret = tdx_tsm_ide_stream_setup(ttsm);
+	if (ret) {
+		pci_err(pdev, "fail to setup ide stream\n");
+		tdx_tsm_spdm_session_teardown(ttsm);
+		return ret;
+	}
+
+	pci_dbg(pdev, "%s complete\n", __func__);
+	return ret;
 }
 
 static void tdx_tsm_disconnect(struct pci_dev *pdev)
 {
+	struct tdx_tsm *ttsm = to_tdx_tsm(pdev->tsm);
+	int ret;
+
+	ret = tdx_tsm_ide_stream_teardown(ttsm);
+	if (ret) {
+		pci_err(pdev, "fail to teardown ide stream\n");
+		return;
+	}
+
+	ret = tdx_tsm_spdm_session_teardown(ttsm);
+	if (ret) {
+		pci_err(pdev, "fail to teadown spdm session\n");
+		return;
+	}
+
+	pci_dbg(pdev, "%s complete\n", __func__);
 }
 
 static struct pci_tsm *tdx_tsm_pci_probe(struct pci_dev *pdev)
-- 
2.25.1

