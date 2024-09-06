Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EC96EFDC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7A110E9DB;
	Fri,  6 Sep 2024 09:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8iL+Szl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B14510E9DA;
 Fri,  6 Sep 2024 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725615792; x=1757151792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RKWTyFwPDUfBN6fzOOUhe2f/iAKmt3OcjbUwlENMT18=;
 b=b8iL+Szli/E9J0kk1Cgc8adU1hsAytg5uRwv2kkV1NQOc3LL3594GcnH
 kwVeuGAL3HytPclwmoDQAnfCE/xJalk9qAU4FtAO77cyqMsTvP2i980wi
 Jqtcb9aTvaSc2/CcddxuIRpIocTvypwudRyw+yhNSbD2BocImZJ+p37kx
 0DmMG0yilfoqLVjvu6SoZtbWfPhvl45PhbDYSdp3cwe2ZeKAlwGHXduyR
 ab4Nx0qPfK0oYDd502TYksGCYfXOYHqiQjDx85ahmSHkeD7/ZapQy9pz4
 iyc4D2BHXsStbPH4Lu2WVy3MU+sYfkdEloYom/wgMc/hWyviw7b1WbPhH A==;
X-CSE-ConnectionGUID: Pe2Ynf02TG2ATCrtgMdMFg==
X-CSE-MsgGUID: b/1e8MdGQoW5d09mTbst4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="34965525"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="34965525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 02:43:12 -0700
X-CSE-ConnectionGUID: 7bsRKj8NQ1CgKX/bKQNwvA==
X-CSE-MsgGUID: /yAKZd4uTkOHBMJ4TXPD8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="103377587"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa001.jf.intel.com with ESMTP; 06 Sep 2024 02:43:07 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v4 3/3] drm/i915: Use device wedged event
Date: Fri,  6 Sep 2024 15:12:25 +0530
Message-Id: <20240906094225.3082162-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906094225.3082162-1-raag.jadav@intel.com>
References: <20240906094225.3082162-1-raag.jadav@intel.com>
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

Now that we have device wedged event supported by DRM core, make use
of it. With this in place, userspace will be notified of wedged device
on gt reset failure.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 735cd23a43c6..be0906490ce5 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1409,6 +1409,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 
 	if (!test_bit(I915_WEDGED, &gt->reset.flags))
 		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
+	else
+		drm_dev_wedged_event(&gt->i915->drm);
 }
 
 /**
-- 
2.34.1

