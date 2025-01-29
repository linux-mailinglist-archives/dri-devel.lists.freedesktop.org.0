Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66EA224B5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 20:51:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44C210E896;
	Wed, 29 Jan 2025 19:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQJSJQzq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEC010E88F;
 Wed, 29 Jan 2025 19:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180283; x=1769716283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oPf77tGWvtlMAKp1LwRhOo+YZ0oCgb+ABmr4IiOLXvE=;
 b=SQJSJQzqs2/OZtUiM/IwKCVYbOgDDzQF/cDVnc/ur2JnU+phay2zc14G
 8cpb3AzzB7A+8wgiKaakraW4TuX7cWLyJQOOG+HrS1Mqydzu+3wZ70e+1
 oFsUzNitQqSUBgHOcEa5wNJm1RLe/IfK7zusQbOEopYyIAi5jPdgPTgiX
 zet4AQwco0DfeLMdIv3sunprx5sVJwxlaGFD9qbcdZKnubQTabaoXO3n9
 TcoPhKZ4aodzQomz+sy9gecOJYMg/IfYdn5mCFpqYaTRBTkvSbZXulpCG
 qAJWu2TbzI2990oKJjrmJR24Fpm9jL95rMThzV3sRETU2lVOBJdC7kQWC g==;
X-CSE-ConnectionGUID: ahM0lSffSsiAHjCig9inZQ==
X-CSE-MsgGUID: ZmpPOQtjSDG3rylBnpWFWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50132787"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50132787"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:23 -0800
X-CSE-ConnectionGUID: I4PG5OztSYWb2DP1y2MpAQ==
X-CSE-MsgGUID: s/hk9BdWRp62x5dfXTVz6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="132392144"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 11:51:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v4 13/33] drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
Date: Wed, 29 Jan 2025 11:51:52 -0800
Message-Id: <20250129195212.745731-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250129195212.745731-1-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
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

Add DRM_GPUVA_OP_DRIVER which allows driver to define their own gpuvm
ops. Useful for driver created ops which can be passed into the bind
software pipeline.

v3:
 - s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
 - Better commit message (Thomas)

Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_gpuvm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6..2a9629377633 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -812,6 +812,11 @@ enum drm_gpuva_op_type {
 	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
 	 */
 	DRM_GPUVA_OP_PREFETCH,
+
+	/**
+	 * @DRM_GPUVA_OP_DRIVER: the driver defined op type
+	 */
+	DRM_GPUVA_OP_DRIVER,
 };
 
 /**
-- 
2.34.1

