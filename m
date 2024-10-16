Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE3399FF71
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D5C10E67E;
	Wed, 16 Oct 2024 03:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlCKMnWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DA710E652;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049100; x=1760585100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DqXx+tHQx5aFwqC8s4xirhuMVV7bWDu0Qh7dnKRf8f4=;
 b=XlCKMnWpcPBlq+X3LTgcyeI98zM40J8gt3f2+WnnBk+hRNcNxwZihooa
 MmpZ14lzRETkceo0yp7pfjSoy5zehr/ouQFlYHA1PMERXeHAl65BMeL6d
 wLDKpyo/qNwWQhZ3MJ1sLvNXnwpPwLAlsILd+8k9+6E8oHpIGegj9Nv3a
 JGystK07JLaR1qvPfWNTxWupH4ynlZcVs9mkJ3SI+5QPM58awBVegcMIE
 ekF3MGj7jEGqYAad3mOHr2HbiZlP+VPZ1O5BRBdnaXoVvHmCPzHfedvet
 joKflfa67y/txagV7KuuYNetFFRa50nHSQP/6mh5g5nRwQ10NHmk4fDvy A==;
X-CSE-ConnectionGUID: N2KuuN5LS1iFoz1ty7qdcQ==
X-CSE-MsgGUID: ahp8N/NgSQSs/O6svcbFXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056436"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056436"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: gzBdbpwhRXmsusa9va/Lsw==
X-CSE-MsgGUID: vtR/01LcTqWuyahe73u0AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930269"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 18/29] drm/xe: Add drm_gpusvm_devmem to xe_bo
Date: Tue, 15 Oct 2024 20:25:07 -0700
Message-Id: <20241016032518.539495-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Add drm_gpusvm_devmem to xe_bo. Required to enable SVM migrations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 13c6d8a69e91..54d337004621 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -8,6 +8,8 @@
 
 #include <linux/iosys-map.h>
 
+#include "drm_gpusvm.h"
+
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_execbuf_util.h>
@@ -74,6 +76,9 @@ struct xe_bo {
 	 */
 	u16 cpu_caching;
 
+	/** @devmem_allocation: SVM device memory allocation */
+	struct drm_gpusvm_devmem devmem_allocation;
+
 	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
 		struct list_head vram_userfault_link;
 
-- 
2.34.1

