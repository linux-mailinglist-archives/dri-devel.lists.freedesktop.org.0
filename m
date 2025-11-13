Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC6C58B40
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C1010E8B2;
	Thu, 13 Nov 2025 16:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ycdd7mnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580CF10E8B1;
 Thu, 13 Nov 2025 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051227; x=1794587227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eXY9NGXcwRMx1xvaKvqt9qvpIBzUTXZuSwBZqc+Vd8I=;
 b=Ycdd7mnPM46jxDge4+qqBQWvAdNSSS22aGKaS7NiszCbh/Ng+1eONZ8H
 PlZeyXevP0uqDarQia6EAy2kX9+d3qwhbDBQh1gBbB2LKLhrienfRxqt9
 drtIOKRZDriezgmTjz4sgcmAJhCVGh/dBaPEUrTfdfCtkdsAkoHb2c0o+
 R9a+n/c1thb8KZm06Ms+666EDiE7D0Id9DGMVSgBb0ScOCt2FxFjHKHxg
 1mKnsxI4baBIFrNxxlRluuhlruibWC/1Dkl3ptmK9suko03tujDYaTcc7
 lZNNfNftB9n8Ejx08VjssQQZbue1GJQa9TdLrNqXJrn76SEmI7jwWaG21 w==;
X-CSE-ConnectionGUID: 6+v9t2McQfOeUekqvPzjCg==
X-CSE-MsgGUID: XPyGN16+QluJcI5KQeJAXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68766621"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="68766621"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:27:07 -0800
X-CSE-ConnectionGUID: UPI+Qi84Rr+aHEhkQ6DphA==
X-CSE-MsgGUID: vMO03pLcRGmHlXEzSYk55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189553826"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:27:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 02/11] PCI/IOV: Adjust ->barsz[] when changing BAR size
Date: Thu, 13 Nov 2025 18:26:19 +0200
Message-Id: <20251113162628.5946-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

pci_rebar_set_size() adjusts BAR size for both normal and IOV BARs. The
struct pci_srvio keeps a cached copy of BAR size in unit of resource_size_t
in ->barsz[] which is not adjusted by pci_rebar_set_size() but by
pci_iov_resource_set_size(). pci_iov_resource_set_size() is called also
from pci_resize_resource_set_size().

The current arrangement is problematic once BAR resize algorithm starts to
roll back changes properly in case of a failure. The normal resource
fitting algorithm rolls back resource size using the struct
pci_dev_resource easily but also calling pci_resize_resource_set_size() or
pci_iov_resource_set_size() to roll back BAR size would be an extra burden,
whereas combining ->barsz[] update with pci_rebar_set_size() naturally
rolls back it when restoring the old BAR size on a different layer of the
BAR resize operation.

Thus, rework pci_rebar_set_size() to also update ->barsz[].

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/iov.c       | 15 ++++-----------
 drivers/pci/pci.c       |  4 ++++
 drivers/pci/pci.h       |  5 ++---
 drivers/pci/setup-res.c | 10 ++++------
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 77dee43b7858..04b675e90963 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -158,8 +158,7 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
 	return dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)];
 }
 
-void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
-			       resource_size_t size)
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, int size)
 {
 	if (!pci_resource_is_iov(resno)) {
 		pci_warn(dev, "%s is not an IOV resource\n",
@@ -167,7 +166,8 @@ void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
 		return;
 	}
 
-	dev->sriov->barsz[pci_resource_num_to_vf_bar(resno)] = size;
+	resno = pci_resource_num_to_vf_bar(resno);
+	dev->sriov->barsz[resno] = pci_rebar_size_to_bytes(size);
 }
 
 bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
@@ -1340,7 +1340,6 @@ EXPORT_SYMBOL_GPL(pci_sriov_configure_simple);
 int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
 {
 	u32 sizes;
-	int ret;
 
 	if (!pci_resource_is_iov(resno))
 		return -EINVAL;
@@ -1355,13 +1354,7 @@ int pci_iov_vf_bar_set_size(struct pci_dev *dev, int resno, int size)
 	if (!(sizes & BIT(size)))
 		return -EINVAL;
 
-	ret = pci_rebar_set_size(dev, resno, size);
-	if (ret)
-		return ret;
-
-	pci_iov_resource_set_size(dev, resno, pci_rebar_size_to_bytes(size));
-
-	return 0;
+	return pci_rebar_set_size(dev, resno, size);
 }
 EXPORT_SYMBOL_GPL(pci_iov_vf_bar_set_size);
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b14dd064006c..7dfc58b0e55e 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3803,6 +3803,10 @@ int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size)
 	ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
 	ctrl |= FIELD_PREP(PCI_REBAR_CTRL_BAR_SIZE, size);
 	pci_write_config_dword(pdev, pos + PCI_REBAR_CTRL, ctrl);
+
+	if (pci_resource_is_iov(bar))
+		pci_iov_resource_set_size(pdev, bar, size);
+
 	return 0;
 }
 
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4492b809094b..bf1a577e9623 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -808,8 +808,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
 void pci_restore_iov_state(struct pci_dev *dev);
 int pci_iov_bus_range(struct pci_bus *bus);
-void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
-			       resource_size_t size);
+void pci_iov_resource_set_size(struct pci_dev *dev, int resno, int size);
 bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
 static inline u16 pci_iov_vf_rebar_cap(struct pci_dev *dev)
 {
@@ -851,7 +850,7 @@ static inline int pci_iov_bus_range(struct pci_bus *bus)
 	return 0;
 }
 static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
-					     resource_size_t size) { }
+					     int size) { }
 static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
 {
 	return false;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c3ba4ccecd43..3d0b0b3f60c4 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -450,12 +450,10 @@ static void pci_resize_resource_set_size(struct pci_dev *dev, int resno,
 	resource_size_t res_size = pci_rebar_size_to_bytes(size);
 	struct resource *res = pci_resource_n(dev, resno);
 
-	if (!pci_resource_is_iov(resno)) {
-		resource_set_size(res, res_size);
-	} else {
-		resource_set_size(res, res_size * pci_sriov_get_totalvfs(dev));
-		pci_iov_resource_set_size(dev, resno, res_size);
-	}
+	if (pci_resource_is_iov(resno))
+		res_size *= pci_sriov_get_totalvfs(dev);
+
+	resource_set_size(res, res_size);
 }
 
 int pci_resize_resource(struct pci_dev *dev, int resno, int size)
-- 
2.39.5

