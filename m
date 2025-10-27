Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10852C0BC90
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 05:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E8F10E34D;
	Mon, 27 Oct 2025 04:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vi0SGzc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3B510E33E;
 Mon, 27 Oct 2025 04:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761540517; x=1793076517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lxFUsUvyr1966bGCJMZqZqmUE971d/cX9NW4srJNETE=;
 b=Vi0SGzc9Yju25VhhsC/RD8DMvUjzPgEOemTMcax0sQ+fvLYe8rG5vbrf
 6Fdmaxl7NYEtSWio+Cx15TTZIbuFii7N6cOPcMn/6JWxskVpXz0Xd/WjO
 GYgFgR+VnI0152CQQgH3O+75wYXmTTNa00uknSCbr5NUnH/7r1xFin234
 hD0Lxpunp2xu9sQdFodX3kLByn7Lej98ul+PIdxXjLhZiaNEcHdR8tyXA
 weFHbuLJj091i8rwRoSj64JSdkHe9QYFcrfiW/Rz8rX1V1PWRhCaLysE4
 q+RSXLdlNbmrfECkOxB44QyQUY9wAPrwYRMEwKQfmO+23bLo8ymQZiO4y A==;
X-CSE-ConnectionGUID: aSFICuUeTzqAqPtDybXPfA==
X-CSE-MsgGUID: EjSt/foqSDSGSF1xOG6u2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63515631"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63515631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:37 -0700
X-CSE-ConnectionGUID: aRLkuwB+QhWyDXjLM6KugQ==
X-CSE-MsgGUID: Eu1wa7rlS/CvUy5lYRXnjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="188992982"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC v2 3/8] dma-buf: Create and expose IOV interconnect to all
 exporters/importers
Date: Sun, 26 Oct 2025 21:44:15 -0700
Message-ID: <20251027044712.1676175-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
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

The IOV interconnect is a virtual interconnect between an SRIOV
physical function (PF) and its virtual functions (VFs). In order
for negotiation (or match) to succeed, the exporter is expected
to be a VF while the importer is expected to be the PF.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/dma-buf-interconnect.c | 3 +++
 include/linux/dma-buf-interconnect.h   | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-interconnect.c b/drivers/dma-buf/dma-buf-interconnect.c
index 12db77e6b9f1..492e4d3fe4c8 100644
--- a/drivers/dma-buf/dma-buf-interconnect.c
+++ b/drivers/dma-buf/dma-buf-interconnect.c
@@ -159,3 +159,6 @@ bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
 	return false;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_match_interconnects, "DMA_BUF");
+
+CREATE_INTERCONNECT(iov)
+EXPORT_SYMBOL_NS_GPL(iov_interconnect, "DMA_BUF");
diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
index efe3ca1c354a..37dee1a26f24 100644
--- a/include/linux/dma-buf-interconnect.h
+++ b/include/linux/dma-buf-interconnect.h
@@ -20,6 +20,13 @@
 
 struct dma_buf_attachment;
 
+/**
+ * The iov interconnect instance would be created and exported out of
+ * dma-buf-interconnect.c as it is a global interconnect that is expected
+ * to be supported by different exporters and importers.
+ */
+extern const struct dma_buf_interconnect *iov_interconnect;
+
 /**
  * struct dma_buf_interconnect - holds info associated with an interconnect
  * @name: name of the interconnect.
-- 
2.50.1

