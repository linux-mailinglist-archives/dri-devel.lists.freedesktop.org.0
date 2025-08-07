Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7397BB1DB7D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7964610E878;
	Thu,  7 Aug 2025 16:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bp7M/eNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3905710E87E;
 Thu,  7 Aug 2025 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754583404; x=1786119404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TgDrRTmPyBhn2CphMie8VbAt093mVF5Dc9HDahWjlmo=;
 b=bp7M/eNhpupv2xAdf9CcLe6lG26KsEl1kFzcHXA3nK1ad+vcWJeXq8oH
 2Ror0ddinsVq6RUWfYz2E5dnt9Utmy8IZso1Fn+BrqKwKOKBrdXoXz+Vf
 3us5MK2OEHEiCzzUvv2HEqPs6UNlEzTZgtVaP1VhXYSH5b39CxyhB5Wm/
 QGyHmYOEFO5lw/1fG1dL58n225iFb8flnGF94E9GM95xUaOOTGcA5J0cy
 8m2xSticH1IloY5i4yHkDKLHUxo70/HE4xFiBFhCL7HOt+fC9rKBzrbb+
 01NCZmtFZXicntN0i5eK2stnXJgFhWJ5GVfoledAebG8wt2Jp/IA32hlw A==;
X-CSE-ConnectionGUID: PqWRjdyMRAu+xoK1YVwdEg==
X-CSE-MsgGUID: N575myyYSPaumIfPZqDY3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56845543"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56845543"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 09:16:44 -0700
X-CSE-ConnectionGUID: WzNy+2rsRWqiIeCEF/fxMg==
X-CSE-MsgGUID: pOiZqZ+ARFOBXzvwwMEccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="195937727"
Received: from unknown (HELO himal-Super-Server.iind.intel.com)
 ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 09:16:42 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/26] drm/gpuvm: Support flags in drm_gpuvm_map_req
Date: Thu,  7 Aug 2025 22:13:15 +0530
Message-Id: <20250807164338.1832254-4-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
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

This change adds support for passing flags to drm_gpuvm_sm_map() and
sm_map_ops_create(), enabling future extensions that affect split/merge
logic in drm_gpuvm.

v2
- Move flag to drm_gpuvm_map_req

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 include/drm/drm_gpuvm.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index cbb9b6519462..116f77abd570 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1049,6 +1049,13 @@ struct drm_gpuva_ops {
  */
 #define drm_gpuva_next_op(op) list_next_entry(op, entry)
 
+enum drm_gpuvm_sm_map_ops_flags {
+	 /**
+	  * %DRM_GPUVM_SM_MAP_OPS_FLAG_NONE: DEFAULT sm_map ops
+	  */
+	DRM_GPUVM_SM_MAP_OPS_FLAG_NONE = 0,
+};
+
 /**
  * struct drm_gpuvm_map_req - arguments passed to drm_gpuvm_sm_map[_ops_create]()
  */
@@ -1057,6 +1064,11 @@ struct drm_gpuvm_map_req {
 	 * @op_map: struct drm_gpuva_op_map
 	 */
 	struct drm_gpuva_op_map op_map;
+
+	/**
+	 * @flags: drm_gpuvm_sm_map_ops_flags for this mapping request
+	 */
+	enum drm_gpuvm_sm_map_ops_flags flags;
 };
 
 struct drm_gpuva_ops *
-- 
2.34.1

