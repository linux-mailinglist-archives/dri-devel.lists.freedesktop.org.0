Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CDAA05F80
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 16:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BA210EBD2;
	Wed,  8 Jan 2025 15:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjXYckh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2B210E8E0;
 Wed,  8 Jan 2025 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736348448; x=1767884448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wcwbdI1pFgh3+XOrhT2zQSrpDh73t8l9ZVg7swDTwcM=;
 b=KjXYckh+ZGKKKoFjIAa5EKnJL/eT3D2PeixGhChE2G8LUfUK0Bq/k9Mo
 5PSExP+RiPPEmxlGi6rG1UCfsUyJ1ef09TnwPwh45pccV73uKJc1q9oEX
 LgEx+M7i+rU8BRaRAa0dXT0d2kXRyykGwYKQtNtshos7CFglet0ByefoW
 m0SAhwhpN7+Nxof/VlsY6YTV2TFiGpc0dX8RShwP+Zt1qEog0hLbQpl76
 45gSdY7aEMmlBLVRZM5wiWSsGtPGWhkWUYuF1ZOx9WYDvZvivyzDjxEdT
 JuDKAxHiDlx8W7shZ/7MJ2BJvx6Fa0NF1CpVyZIED2ZsyqifcnzTj6Cnh g==;
X-CSE-ConnectionGUID: HCnyvlRIRumHM/gWzgb+PA==
X-CSE-MsgGUID: Or9vqmp2RGiEE1T/pHrsIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35805114"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="35805114"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:00:48 -0800
X-CSE-ConnectionGUID: /Ut6RKu0RL6+IXu3ZDZCRw==
X-CSE-MsgGUID: CYpLCo84STmV2AicWwKuYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="103337160"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:00:45 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 0/2] Add UAPI support for low latency hint
Date: Wed,  8 Jan 2025 20:36:01 +0530
Message-Id: <20250108150603.2995709-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.34.1
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

With this user can hint low latency during exec queue creation.
KMD will forward hint to guc.

Note : There is some issue going on with GUC, that setting hint is not
correctly fixing high frequency. The work to fix that in GUC is
being done parallely so sending RFC to get KMD reviews going.

Tejas Upadhyay (2):
  drm/xe/guc: Use exec queue hints for GT frequency
  drm/uapi: Adjust uniform spacing

 drivers/gpu/drm/xe/abi/guc_actions_slpc_abi.h |  3 +++
 drivers/gpu/drm/xe/xe_exec_queue.c            |  7 ++++---
 drivers/gpu/drm/xe/xe_guc_pc.c                | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  7 +++++++
 include/uapi/drm/xe_drm.h                     |  9 +++++----
 5 files changed, 35 insertions(+), 7 deletions(-)

-- 
2.34.1

