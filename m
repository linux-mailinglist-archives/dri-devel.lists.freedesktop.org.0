Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHzyCwBdeWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0E9BBD7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DE110E5F1;
	Wed, 28 Jan 2026 00:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SslhA3z8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10D510E5DA;
 Wed, 28 Jan 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561330; x=1801097330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UakjHOKvxmbHnRgtSTWMyDUgDcCPWCbr/y/uFRCHbbk=;
 b=SslhA3z8kVKz65/Q5PU5cLMMdqim+JuTRhq9Xvc07esoNXTrGlBzgPRt
 bEywyRcm9URrp3+7S3XJOToqUmd+fQINhZuJaZDTCV54sVlU4sx8OC0NR
 9Xg8yMM4K/Zz8RXco0FxOzvvXjs73NPZq5YglUbEVfwQykKtC5Ra6CVW1
 mwz0xmjFa4bGpvv0TWnkxqwqPemb2ulrH5ePydS/JoK9Bc8diHh7fx+Ux
 n8Qo5K8xBorqY1lEtPVvhIGg0dSbSt6cVzFG5UY9laumJ2pPEGm8/5/PO
 osnWV0KijEfKnVusSbvntm3KVYRB5mUbKhRwMRxHSGFvVQGLIVAEPPAQ8 w==;
X-CSE-ConnectionGUID: nHItj997SyegFMxTzMEu5Q==
X-CSE-MsgGUID: z7lcfWfCS3eTvw6Gi8j2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427521"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: Ig14AQglTJaIddw8PShHeg==
X-CSE-MsgGUID: 0om+/xEmRWKvxJSKpjBXsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822663"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 07/11] drm/xe: Stub out DRM pagemap IOVA alloc
 implementation
Date: Tue, 27 Jan 2026 16:48:37 -0800
Message-Id: <20260128004841.2436896-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128004841.2436896-1-matthew.brost@intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 03D0E9BBD7
X-Rspamd-Action: no action

Stub out the minimal set of DRM pagemap IOVA vfuncs required for Xe.
This provides the basic scaffolding needed for functionality while the
full implementation is developed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..eb8d8fe6ff75 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1649,6 +1649,14 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 	return err;
 }
 
+static void *xe_drm_pagemap_device_iova_alloc(struct drm_pagemap *dpagemap,
+					      struct device *dev, size_t length,
+					      enum dma_data_direction dir)
+{
+	/* NIY */
+	return NULL;
+}
+
 static struct drm_pagemap_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  struct device *dev,
@@ -1720,6 +1728,7 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
 }
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
+	.device_iova_alloc = xe_drm_pagemap_device_iova_alloc,
 	.device_map = xe_drm_pagemap_device_map,
 	.device_unmap = xe_drm_pagemap_device_unmap,
 	.populate_mm = xe_drm_pagemap_populate_mm,
-- 
2.34.1

