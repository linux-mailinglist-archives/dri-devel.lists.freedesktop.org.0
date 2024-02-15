Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2796F856B75
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 18:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF2D10E923;
	Thu, 15 Feb 2024 17:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVQX/q27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC5010E136;
 Thu, 15 Feb 2024 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708019209; x=1739555209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PlVKByctW1DoAUvKuZe/1fiYUxkkK/LQWJlA5HGfayo=;
 b=JVQX/q27hcn3MkJXOdsEKCO52a+Ggc3XmWQ1vg4XGpzDM/k+anVAjXZU
 MVXa1KzQ4S7Kkbz07aTzAl2gohXLTefLE8Q3HctbhW7K4ZejeaPvz5YIW
 ei7VOddprCDIblVQ9FeITlU5ZVFGMKVgOZaQtHFPK9cus5EQhRSygnUnJ
 LDn7lYUMJdW5CMtQyJx1c7Xm7QJBv12k4DWtmN0fGXIBKgsXd9g2DGMtD
 JmA2mWU7ZK1op5Bpk72HzQjcvJaY3PYtWpV/ZBuCcKWja6PaxJtTgbPvU
 rlkXyk37Pu1ZoGjRG+iQoLeYuN0Cl+ymnKMyfq6hu9Z/4cBijqiWhaB7P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13514038"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13514038"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3892137"
Received: from dhalpin-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.158])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:46:46 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 6/6] drm/xe/stolen: ignore first page for FBC
Date: Thu, 15 Feb 2024 17:44:37 +0000
Message-ID: <20240215174431.285069-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215174431.285069-7-matthew.auld@intel.com>
References: <20240215174431.285069-7-matthew.auld@intel.com>
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

Seems like we can potentially hit underruns if the CFB offset is within
the first page of stolen. Just like i915 skip the first page.

BSpec: 50214
Reported-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
index bd233007c1b7..003474cfdf31 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem_stolen.h
@@ -19,6 +19,9 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 	int err;
 	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
 
+	if (start < SZ_4K)
+		start = SZ_4K;
+
 	if (align)
 		size = ALIGN(size, align);
 
-- 
2.43.0

