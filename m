Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF2A4DFDC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 14:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5285E10E5CD;
	Tue,  4 Mar 2025 13:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyyri6Ee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6378410E5C9
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741096504; x=1772632504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dQgArLKhvfiWa9vt/ktAwnp9Lz7/YHtFXYLGR4Hu1ws=;
 b=nyyri6EesEY0srxsGiWg/t4JaOwt0gFO7HVA78Q2xIBVVV2VUPcTeeJ9
 GpkD5U81r93feThATIrEPwg6mEaOch2OQA+9RgZNWpI8ukDnHU874xN0B
 Puzt0c844+dotNq9BJxlz2N4HYu8j4/FfT8gCexThwy9BpGqycMIpJ5RQ
 fbQOb+naNUst7WH88aQztlE34t2p08Az6InNtMkEB9tg/Pd9/Z6yr9azp
 AYnykEGuPItRhB1ZW+TY3+mrCmOtPRa/uT0rC//BgdDK7/wcLKIuGqSsZ
 v2orA/pqgwcGfiJUHLgP3q9AUzkceMt25PYgP0cghP7I7B7+IZ2aFzhKF A==;
X-CSE-ConnectionGUID: UQJ1AJ5nR3qandKsxbClSw==
X-CSE-MsgGUID: a8psjzioSRi+0+2QPzQ7fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41910726"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41910726"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 05:55:04 -0800
X-CSE-ConnectionGUID: lUkdvvWkSnWmlJiI/2eCvA==
X-CSE-MsgGUID: cl9T2g4ASkKkNSW08hIq3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123574506"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 05:55:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/appletbdrm: fix format character for size_t
Date: Tue,  4 Mar 2025 15:54:56 +0200
Message-Id: <20250304135456.429407-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Use %zu for size_t instead of %lu to avoid failures on 32-bit builds:

error: format ‘%lu’ expects argument of type ‘long unsigned int’, but
argument 4 has type ‘size_t’ {aka ‘unsigned int’}

Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
Cc: Kerem Karabay <kekrby@gmail.com>
Cc: Atharva Tiwari <evepolonium@gmail.com>
Cc: Aditya Garg <gargaditya08@live.com>
Cc: Aun-Ali Zaidi <admin@kodeit.net>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tiny/appletbdrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index f5d177e234e4..394c8f9bd41a 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -167,7 +167,7 @@ static int appletbdrm_send_request(struct appletbdrm_device *adev,
 	}
 
 	if (actual_size != size) {
-		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%zu)\n",
 			actual_size, size);
 		return -EIO;
 	}
@@ -208,7 +208,7 @@ static int appletbdrm_read_response(struct appletbdrm_device *adev,
 	}
 
 	if (actual_size != size) {
-		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%zu)\n",
 			actual_size, size);
 		return -EBADMSG;
 	}
-- 
2.39.5

