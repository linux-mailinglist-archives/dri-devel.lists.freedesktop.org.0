Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4FEA84722
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 16:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F17C10E9E8;
	Thu, 10 Apr 2025 14:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhBrik22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305DB10E9E7
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744297164; x=1775833164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pub1Rt/OErcXhovCyJt4Y/l8eTEjVIE7/KTvNHJNhJs=;
 b=LhBrik22E5bBz4KCwYRDjWZWIcMP1Uz3MPOWRUf1VaSAJ3tz3IgaeoJD
 SD0Eo37SELVhrEz65lHNnZc9p+4Iy+EMa43sRxy0/X6mY6RbxrTNESb2b
 wEN2lhGmgCSFCYAbpsnF29XUQrEh3kFKlccf4AQhG78DoNuhmlMFOSJ7j
 x+Jn4qtTzMzTBjg9WQn/eFGC6qvKeGSMyeVOF29CChCiCVw4QiYuVC4dC
 f9udm4QsvaEV7b7mDnd2OFkJRcOa7lW8TmVASjoJJcOLOGwh2Mxuu4FHx
 TLI217itItiP1C8+qKoJMNuYl9G1S5o5n1dOg+Qzv6r8hTCKy+W/0gEKk A==;
X-CSE-ConnectionGUID: AjJ0qMqjSOOSJaBG0UE3bw==
X-CSE-MsgGUID: jKMNHAg6SgafRdJhdr7FRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="71208157"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="71208157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 07:59:24 -0700
X-CSE-ConnectionGUID: LRniU5rPS0itJI3g+O1wVg==
X-CSE-MsgGUID: TFgLvg3HT9ivx1VVe9v4yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134102000"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 07:59:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 17:59:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 5/6] drm/armada: Allow build with COMPILE_TEST=y
Date: Thu, 10 Apr 2025 17:59:03 +0300
Message-ID: <20250410145904.25550-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
References: <20250410145904.25550-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Allow armada to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/armada/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/Kconfig b/drivers/gpu/drm/armada/Kconfig
index b22c891a670b..1376337548da 100644
--- a/drivers/gpu/drm/armada/Kconfig
+++ b/drivers/gpu/drm/armada/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_ARMADA
 	tristate "DRM support for Marvell Armada SoCs"
-	depends on DRM && HAVE_CLK && ARM && MMU
+	depends on DRM && HAVE_CLK && MMU && (ARM || COMPILE_TEST)
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
-- 
2.49.0

