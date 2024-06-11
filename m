Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B0903B6B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3C510E5DF;
	Tue, 11 Jun 2024 12:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcSf7YhR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A8A10E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107496; x=1749643496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pBt+W9RpQgrp8VeqIazvGMVnJkTx40lW35+ZF1U/8Rg=;
 b=dcSf7YhRMjVBBystOzMvoe8vESRMXUCWK2ZJclXxo+7joW2kfwe0Cb/U
 JlYBhHg6/LIp3rNgmJFAfXMJqvk8k6HfyYCGs8ROU6bF3Zehuc771OhCl
 QL+Mcom1lcl+oAa9s5FsSvp1MIM1Kl7gorxdXwv6lMyH1sThbUDNlZ44i
 1Vnn7IHjO2+3M41tB73tM+MpExXXiYL7RRPp+N4IGanMzu7GDN0vbChxR
 dyGDZwy0Tvs7lEedCndWvm3zCEZe1tLddDGwXKNnHgF+W0rROHO3rSEUl
 2S0qT7/4yeM7E2U293G4XMkn2y0/eqJT/WG6m7s0D/L99vKQBWR1WCxog A==;
X-CSE-ConnectionGUID: HEgumzKrSoawQoIVAqJmGQ==
X-CSE-MsgGUID: XvEi3ngfTjiSGs3S5Zy/rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296087"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:55 -0700
X-CSE-ConnectionGUID: uG2seLGtRGGwcS55f0rZLQ==
X-CSE-MsgGUID: uQE0TIZGTlKR6V74Aqac/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877149"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:54 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 11/15] accel/ivpu: Disable MMU before checking for idle
Date: Tue, 11 Jun 2024 14:04:28 +0200
Message-ID: <20240611120433.1012423-12-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

Disable MMU communication before checking if NPU is idle.
NPU may otherwise be woken up when adding/removing contexts.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
index 602fa4e65c22..e7aed16b1a36 100644
--- a/drivers/accel/ivpu/ivpu_pm.c
+++ b/drivers/accel/ivpu/ivpu_pm.c
@@ -245,6 +245,8 @@ int ivpu_pm_runtime_suspend_cb(struct device *dev)
 
 	ivpu_dbg(vdev, PM, "Runtime suspend..\n");
 
+	ivpu_mmu_disable(vdev);
+
 	is_idle = ivpu_hw_is_idle(vdev) || vdev->pm->dct_active_percent;
 	if (!is_idle)
 		ivpu_err(vdev, "NPU is not idle before autosuspend\n");
-- 
2.45.1

