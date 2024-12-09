Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E529E971A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B882E10E744;
	Mon,  9 Dec 2024 13:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDeyMtX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95E310E768;
 Mon,  9 Dec 2024 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751222; x=1765287222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wjKEhuQIZxZQamJ2eGfMVpXxIsfEqV84VEgXGtOiwjw=;
 b=lDeyMtX8osycrZALAtEPXpDJ/qbxCZDYI41dj/Yd74PSiNtCurBCIIR3
 cKSRb6qUl/VP6TAhR4Taq1O7Qb7PP30mMHesOp/Yg1zoGLBKbe52Itjkq
 QVWga8m+1k0qDTxr+wHUnY98zLq0L6pdXUxCulQ4WAonwj19kXcaeCcfq
 CEKwrBDmYoULC71iIzvu+pORh8CX7M3Nebg5gTLCpYlItQtCICwT/RO2c
 uQYfhw/MXRO1qggsvFWjqhSFcMe2lyWmqfS3MkVzdnHXrmaD1tD4sfIxb
 6sOP05U5RcFAldSMcFtsE40l5tjIKWnKj/ckVTSkZCEzuAmoJYXTywI+c g==;
X-CSE-ConnectionGUID: +Nf5L8oES1azjBE9JDAHuA==
X-CSE-MsgGUID: OQFT6C4pQFqUhQOwwwQURQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192184"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192184"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:41 -0800
X-CSE-ConnectionGUID: vxNA+sVhSr6fCmdxZxdZtg==
X-CSE-MsgGUID: 82la/lOaSG+6qjPjRoky+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531373"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:40 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 22/26] drm/xe/eudebug/ptl: Add RCU_DEBUG_1 register support
 for xe3
Date: Mon,  9 Dec 2024 15:33:13 +0200
Message-ID: <20241209133318.1806472-23-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Format of Register_RenderControlUnitDebug1 is different from
previous gens. Adjust it so it matches PTL/xe3 format.

Acked-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index c259e5804386..09b455a96571 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -1443,6 +1443,17 @@ static u32 engine_status_xe2(const struct xe_hw_engine * const hwe,
 	return (rcu_debug1 >> shift) & RCU_DEBUG_1_ENGINE_STATUS;
 }
 
+static u32 engine_status_xe3(const struct xe_hw_engine * const hwe,
+			     u32 rcu_debug1)
+{
+	const unsigned int first = 6;
+	const unsigned int incr = 4;
+	const unsigned int i = rcu_debug1_engine_index(hwe);
+	const unsigned int shift = first + (i * incr);
+
+	return (rcu_debug1 >> shift) & RCU_DEBUG_1_ENGINE_STATUS;
+}
+
 static u32 engine_status(const struct xe_hw_engine * const hwe,
 			 u32 rcu_debug1)
 {
@@ -1452,6 +1463,8 @@ static u32 engine_status(const struct xe_hw_engine * const hwe,
 		status = engine_status_xe1(hwe, rcu_debug1);
 	else if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 30)
 		status = engine_status_xe2(hwe, rcu_debug1);
+	else if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 35)
+		status = engine_status_xe3(hwe, rcu_debug1);
 	else
 		XE_WARN_ON(GRAPHICS_VER(gt_to_xe(hwe->gt)));
 
-- 
2.43.0

