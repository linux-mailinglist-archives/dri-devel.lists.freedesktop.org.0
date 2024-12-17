Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F49F5A6E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262F510EA9F;
	Tue, 17 Dec 2024 23:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXvDC984";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6B310E655;
 Tue, 17 Dec 2024 23:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478390; x=1766014390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oPf77tGWvtlMAKp1LwRhOo+YZ0oCgb+ABmr4IiOLXvE=;
 b=nXvDC984furv8bz/Q9sPySGry38qbKVLgg5wGOH3a0U9+1yuqQ4SVXN2
 kmYiQcgIwm1a8WjGgfU222z3IGxbPU8nU7WY6HgW6PhD924gdadob3pan
 jrIxMI9WsRctVNaMlXhW2nfl7CypzK/oPRQud4EkvezO5shPOS2DeXOnG
 tM1i39XBkykQn5fw8/ZwAWn5q/DZ5z85e8N/wTwHVeQ8HUFJqcFP0DOOz
 wCFcQDE7uLC5C+ZWiDFWEWZUukrvJ8nWD2uwjqxopCMFlHPoLykBXgiu7
 blG00JtVXHhV8Xlgnxk1e+wx9SjdHoa4ZphqCeVS6YYjl44Ve6bc3GwOt A==;
X-CSE-ConnectionGUID: 3yjJyZ/MTGujyRN8Wnkyrw==
X-CSE-MsgGUID: 7aEzhrT3QOO/HN+fZn4dwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517394"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:10 -0800
X-CSE-ConnectionGUID: D0pSwON7SSaoi/pYQq22uw==
X-CSE-MsgGUID: xWKQA0PkSzCtKuXbXNeyKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273439"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 12/30] drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
Date: Tue, 17 Dec 2024 15:33:30 -0800
Message-Id: <20241217233348.3519726-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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

