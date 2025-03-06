Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403DCA53FCB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2E210E897;
	Thu,  6 Mar 2025 01:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G91EBQTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461D010E881;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AkWywLauA6LSYrGET646PjoWw8Pl9RVMcyPKdP8qT0g=;
 b=G91EBQTHSFPX3acPPZ5730XGR6DL0sVYETrltRcPQ1xGix+aau1kipSi
 vU0hIJN0lKiMjGhcsZ38aVm8kRzWGXjjilEbYdvLoI2E+Wam+OPaj06/Q
 fJ3V7tfutO2XVHyVZI6ll7F3Lb9tOGQLYUq4Jr+dlhzmXTgrNmq1hdwyX
 f6ET6QN216blc9gDhEoqdKUlhdewXVHClRhvDsijpGQZRmZN9gDU1XKAf
 gD8EkVyEVs7Qjilz9k4c/KUCrzu7VpvNs/EGsT+vIGTIK/yAIEELBzrtl
 IUrz6zrAVZOL9VnTDNwvMkuW05L7TJjvmS3rUZo0tWuvqudEAZOvO4yD6 w==;
X-CSE-ConnectionGUID: tY/e6lj1TIes9bbPKbxLRA==
X-CSE-MsgGUID: Ym9Ki278S5aMTt5nhvMs+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427332"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: 7J+LH8kRRkeUm+C5WP57zg==
X-CSE-MsgGUID: NAXmHtu6RLyRZIsyH3oAZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063272"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 13/32] drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
Date: Wed,  5 Mar 2025 17:26:38 -0800
Message-Id: <20250306012657.3505757-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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

Add DRM_GPUVA_OP_DRIVER which allows driver to define their own gpuvm
ops. Useful for driver created ops which can be passed into the bind
software pipeline.

v3:
 - s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
 - Better commit message (Thomas)

Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

