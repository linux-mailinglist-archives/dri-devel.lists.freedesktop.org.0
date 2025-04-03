Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7DA7AE5B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D033610EB40;
	Thu,  3 Apr 2025 20:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7hAiEQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9179510EA67;
 Thu,  3 Apr 2025 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743711955; x=1775247955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzMwQuXidQMUhSnA9WwbP7ZSDx73OS5wYEVIStd5jKo=;
 b=W7hAiEQtdQnZLrYFqIRKBhruK4Foel5qcPs8rKMSOLFg7K7OOGIe/fMs
 vFG7l7oFbLvWBwbrdeZZ3HQBl7mp+Yfde5QuV9G5UWySb5dmB1Rx7j7f0
 /hO2oZCYqgZ08y3957vRj17oXrmxoTC05fnnn/iQCqkPNhhZClusqXWa3
 Fl6OwknlPaj+xBe/SxExShKLTgvgA6o/cM2J/oCas75IHdzS0cud1o291
 qXuGxwIfSEVcfUf/C19gHSHkpS6+dnpSgKhFxvoqQW7DaZLRAUp50b6Uo
 hVtLn2dC1A87OFOQ027PEtnmoL3VGSzXc8z/OrLZbKjoH9J3TYB/EJGDv Q==;
X-CSE-ConnectionGUID: Di8dcw70QE6K6OjTcvymFg==
X-CSE-MsgGUID: uNz9ytfzRPGK43bVRLEE1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55337818"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55337818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
X-CSE-ConnectionGUID: 7evRfP+SSbWY13yb22Lp/w==
X-CSE-MsgGUID: RziysdyMTlOlAP99a9zVtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127972862"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/print: Add drm_printer_is_full
Date: Thu,  3 Apr 2025 13:27:04 -0700
Message-Id: <20250403202705.18488-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403202705.18488-1-matthew.brost@intel.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
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

Add drm_printer_is_full which indicates if a drm printer's output is
full. Useful to short circuit coredump printing once printer's output is
full.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_print.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index f31eba1c7cab..db7517ee1b19 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -242,6 +242,23 @@ struct drm_print_iterator {
 	ssize_t offset;
 };
 
+/**
+ * drm_printer_is_full() - DRM printer output is full
+ * @p: DRM printer
+ *
+ * DRM printer output is full, useful to short circuit coredump printing once
+ * printer is full.
+ *
+ * RETURNS:
+ * True if DRM printer output buffer is full, False otherwise
+ */
+static inline bool drm_printer_is_full(struct drm_printer *p)
+{
+	struct drm_print_iterator *iterator = p->arg;
+
+	return !iterator->remain;
+}
+
 /**
  * drm_coredump_printer - construct a &drm_printer that can output to a buffer
  * from the read function for devcoredump
-- 
2.34.1

