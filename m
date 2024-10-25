Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC489AFD12
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 10:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1C310EA35;
	Fri, 25 Oct 2024 08:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmYsUhFk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F7410EA39;
 Fri, 25 Oct 2024 08:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729846160; x=1761382160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Svj8ABxPDx0YDOfkwsRDJHrtjUOb/SfFshkhtuXbvMI=;
 b=mmYsUhFkwIan4GegBwEofUN3Y//rD0qx2h4B/NjNRSw+Nd5y2bzb1naO
 fBBOl5pkjYJbe6xQgewMecabL2V7wi53sRQ0zXFxVoLEBarpbXw+CpqCQ
 QsWNt4+52Gd9EGE3YXTsYnMGSe25pxtxUv/mc9tBTA8yTH+fNhT8WwYEl
 g9okdJL46okP8KAikUHirb+zsnuS1I/ZK3oCoxbSpkQtpEgT9k2XZBqAx
 MuowBnRfp2UUx879nsuUaV+HHPJmASoEypLmbZBsjHY4RoAEHCrNzgk1N
 957oaTWXlxnqjAb0Te0CKm1Pkgtgl7WoEfypXe1QYWvBb69R2pBhB9Rrh Q==;
X-CSE-ConnectionGUID: kAQqa4/CSvetn/XXtakE6w==
X-CSE-MsgGUID: jCN0CTvxSpOw/79bocdGvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32369533"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="32369533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 01:49:19 -0700
X-CSE-ConnectionGUID: ohI25//FQAaPij8uhzHFGA==
X-CSE-MsgGUID: f9RsNs2aQNOF6Y9vt8iGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80768588"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 01:49:13 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v8 4/4] drm/i915: Use device wedged event
Date: Fri, 25 Oct 2024 14:18:17 +0530
Message-Id: <20241025084817.144621-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025084817.144621-1-raag.jadav@intel.com>
References: <20241025084817.144621-1-raag.jadav@intel.com>
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

Now that we have device wedged event provided by DRM core, make use
of it and support both driver rebind and bus-reset based recovery.
With this in place, userspace will be notified of wedged device on
gt reset failure.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 8f1ea95471ef..06bfd2dbb6c8 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1418,6 +1418,9 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 
 	if (!test_bit(I915_WEDGED, &gt->reset.flags))
 		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
+	else
+		drm_dev_wedged_event(&gt->i915->drm,
+				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 }
 
 /**
-- 
2.34.1

