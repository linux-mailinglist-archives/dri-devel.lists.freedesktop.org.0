Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB24378C907
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E04A10E3EB;
	Tue, 29 Aug 2023 15:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059F410E3E2;
 Tue, 29 Aug 2023 15:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324739; x=1724860739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DtTqGytOUry8UdwRzgAQXoGMp0W5qKlN8BbmMkXLJi0=;
 b=KHhmLrv3+IZknaIiy/Vy6HDWJXckBQFXqwtm+0H5biCmdfO6W4MJcb7I
 cOl7+EXV8aS9c+HDdT/HIfQh9fFxCN0HUYNwZW44Y19u38I37thZjLnE7
 HE63Z3fDLqrOOaxclBa2LExrxYP1K5sNagqzcEaj4KBu/yrQlSXD3LSSm
 I3UYXuxWvgXBRCGxaWSvIhaoQXC1P/82uHExJ1w2mXZQoIyx2p9ah89Kh
 FIUH7Ir+RhXtemUEB5E6S3pQM4/WYjn/9F5GiRScfK6hVRtYw+f1SKxdc
 bdwpO3+pJAjv5T9W8nnvT/8mBBnE/csJB+ZXem3T5QyIfpqPLjUQ1UF1u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769240"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769240"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554991"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554991"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:58:56 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 07/33] drm: Add Enhanced Gamma LUT precision structure
Date: Tue, 29 Aug 2023 21:33:56 +0530
Message-ID: <20230829160422.1251087-8-uma.shankar@intel.com>
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

Existing LUT precision structure is having only 16 bit
precision. This is not enough for upcoming enhanced hardwares
and advance usecases like HDR processing. Hence added a new
structure with 32 bit precision values.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 include/uapi/drm/drm_mode.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index a21825ee93e2..1cd656b0e994 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -943,6 +943,23 @@ struct hdr_output_metadata {
 	};
 };
 
+/**
+ * struct drm_color_lut_ext - Represents high precision lut values
+ *
+ * Creating 64 bit palette entries for better data
+ * precision. This will be required for HDR and
+ * similar color processing usecases.
+ */
+struct drm_color_lut_ext {
+	/*
+	 * Data is U32.32 fixed point format.
+	 */
+	__u64 red;
+	__u64 green;
+	__u64 blue;
+	__u64 reserved;
+};
+
 /**
  * enum color_op_block
  *
-- 
2.38.1

