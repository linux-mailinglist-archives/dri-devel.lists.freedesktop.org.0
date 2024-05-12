Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CD08C371F
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 17:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8853D10E2BB;
	Sun, 12 May 2024 15:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRQ+NXX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6B110E2B4;
 Sun, 12 May 2024 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528195; x=1747064195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zv3dENl+B07Af4W2wswlYvH7KrFD7s2CNxHPDgLv2v4=;
 b=DRQ+NXX/Y+HERE2kXCtfoIhZ7t5GihEP1Xg9wjle5Zayg3+RcAKFUAgE
 Z8ECiAZF4i9mJV37UvCkmQZgZi14nbpXuA1KeTrDxiGUt3PvimMyvYcpp
 Yluz8wGncOFAY3B7Lzl+diKHVbltJv0Vup69ti5vo9aIocTQiLCWfUBbn
 p4LUiYGNwWpCZzU5zX6KnTQhIGdHavZDquZo4fi/LCDFXAqeZOrGkQqrD
 0HxbZABwY+4bA6TqBPmqyk7mL9kEtqziYNTbepuyxJmk5qPiEsBIGl6Ph
 Ha95+QVLhGh34444XWkQLiU0gcBI68iBAVEWDjUm4nrkCGpMuq22IgyQr w==;
X-CSE-ConnectionGUID: LEVHqAWQRfWaJTgZveZHNw==
X-CSE-MsgGUID: Ztsq0CQWRLSFoTvGPJ41UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11403311"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="11403311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:35 -0700
X-CSE-ConnectionGUID: +MHMnX9jRyuzFWgXe65Z6w==
X-CSE-MsgGUID: wC86a7wLSWqmGz0G1nk7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="34976581"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:32 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-fsdevel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/xe: Add wrapper for iosys_map_read_from
Date: Sun, 12 May 2024 17:36:05 +0200
Message-Id: <20240512153606.1996-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240512153606.1996-1-michal.wajdeczko@intel.com>
References: <20240512153606.1996-1-michal.wajdeczko@intel.com>
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

It is preferable to use the xe_map layer instead of directly
accessing iosys_map, so add a wrapper for the recently added
iosys_map_read_from() function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
Cc: linux-fsdevel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/xe/xe_map.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index f62e0c8b67ab..1db1d23c4f69 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -44,6 +44,15 @@ static inline void xe_map_memset(struct xe_device *xe,
 	iosys_map_memset(dst, offset, value, len);
 }
 
+static inline ssize_t xe_map_read_from(struct xe_device *xe, void __user *to,
+				       size_t count, loff_t *ppos,
+				       const struct iosys_map *map,
+				       size_t available)
+{
+	xe_device_assert_mem_access(xe);
+	return iosys_map_read_from(to, count, ppos, map, available);
+}
+
 /* FIXME: We likely should kill these two functions sooner or later */
 static inline u32 xe_map_read32(struct xe_device *xe, struct iosys_map *map)
 {
-- 
2.43.0

