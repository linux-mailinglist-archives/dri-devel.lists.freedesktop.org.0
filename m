Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A834A5A4D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC2210EC32;
	Tue,  1 Feb 2022 10:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913E010EC32;
 Tue,  1 Feb 2022 10:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712130; x=1675248130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E4PHG/hUs9wEetcP1AMkMky0ASTyC/HHytT8Nahwkic=;
 b=dl+j4ezC83Rwhmc88DDLjuQUfw1kuV7FW+vz5e2Q3/cqGTy+1XKyOshG
 8Et1+FniHr9hz2bQEZoinCduDVPG0OQbr6QCpq6rPJioVkvl9db7rYzHa
 LA1t9nJFJA6oXvxGYIUgKPc0rTiEGBlg06LsjSfrObar9rdri8iLwVPo7
 xw0SJnfQ5xjGnwVY5bOO0fh0/6bO72hx2hLEx3bIeTP+H1YfAn2MzRfAS
 Hh4Avr719Jx+EdKyEx7O22L48DO5KaIzjdJx2hHUfpUMhaBZcidqMWxWa
 +Rkvv7FQ9FkoXyaH6mb7piB8ziILNUymfbzuhMWh+EuK6GVh7mYyInkNN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020641"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020641"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011280"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:42:07 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 13/19] drm/i915: Introduce new Tile 4 format
Date: Tue,  1 Feb 2022 16:11:26 +0530
Message-Id: <20220201104132.3050-14-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220201104132.3050-1-ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
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
Cc: Nanley Chery <nanley.g.chery@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

This tiling layout uses 4KB tiles in a row-major layout. It has the same
shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
only differs from Tile Y at the 256B granularity in between. At this
granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
of 64B x 8 rows.

Reviewed-by: Imre Deak <imre.deak@intel.com>
Acked-by: Nanley Chery <nanley.g.chery@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 include/uapi/drm/drm_fourcc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index fc0c1454d275..b73fe6797fc3 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -572,6 +572,17 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
 
+/*
+ * Intel Tile 4 layout
+ *
+ * This is a tiled layout using 4KB tiles in a row-major layout. It has the same
+ * shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
+ * only differs from Tile Y at the 256B granularity in between. At this
+ * granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
+ * of 64B x 8 rows.
+ */
+#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
-- 
2.20.1

