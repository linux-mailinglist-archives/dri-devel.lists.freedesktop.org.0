Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAAA78C902
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43ED10E3E1;
	Tue, 29 Aug 2023 15:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A632B10E3D1;
 Tue, 29 Aug 2023 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324734; x=1724860734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hbW9+YdA04nud4kbR3D2ODKFMs+DMFvhK3hsr9+XUUU=;
 b=RqT4LrLALaHkOt00ek0H8TngoauvAdwA/4HrcMd3X1zY87sqpCiGD0TE
 bPknC10iQhspOW0YkDer8i8QhWMpYEGemqjOniO67JzuB0VIYAN7sxNxn
 fKhiIbescRy714UP2T6cBkxYwF9fX0nIzM8L4NS/aw7zDzZuPboWvgVxo
 zei67EVumpJfkgrqTOVTGI1usOk4J2G7FMkGPLjitkx/YcKHevnCXlb6H
 ga4DcL5M47tDaV0ZBwqB5lVT9FE1WR3rVS72EEWl0fRPeqeoKiMvujOot
 oXjQkN87TXEU+d0bFF5uyfk4VNAum+Z1fso0TGOq2MjuXx666ci5haPfE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769223"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769223"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:58:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554964"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554964"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:52 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 05/33] drm: Add structures for setting color pipeline
Date: Tue, 29 Aug 2023 21:33:54 +0530
Message-ID: <20230829160422.1251087-6-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add structures using which user space can set a color pipeline it
desires. The patch introduces two structures

struct drm_color_op_data represents data to be passed
onto individual color hardware blocks.

struct drm_color_pipeline represents the aggregate of drm_color_op_data
structures to program the respective color hardware blocks of the
pipeline. It also contains the pipeline number to be set.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 include/uapi/drm/drm_mode.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 882479f41745..a21825ee93e2 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1015,6 +1015,36 @@ struct drm_color_op {
 	__u32 private_flags;
 };
 
+/**
+ * struct drm_color_op_data
+ *
+ * Structure for userspace to send data to a particular color operation
+ * block.
+ *
+ * @name: Name of the color block for which the data is being sent
+ * @blob_id: Id pointing to blob with data for the color operation block
+ */
+struct drm_color_op_data {
+	enum color_op_block name;
+	__u32 blob_id;
+};
+
+/**
+ * struct drm_color_pipeline
+ *
+ * This structure represents the aggregate pipeline to be set
+ *
+ * @num: pipeline number to be selected
+ * @size: size of the data to be passed onto the driver
+ * @data: array of struct drm_color_op_data with data for the
+ *       hardware block/s that user space wants to set values for
+ */
+struct drm_color_pipeline {
+	int num;
+	int size;
+	struct drm_color_op_data *data;
+};
+
 /**
  * DRM_MODE_PAGE_FLIP_EVENT
  *
-- 
2.38.1

