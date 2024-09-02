Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A420E968094
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849CE10E211;
	Mon,  2 Sep 2024 07:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIaThZOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20DB710E210;
 Mon,  2 Sep 2024 07:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725262112; x=1756798112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sbihx63rRH8gdcp/5yltnhaUOeB9DCjFMU5dJ0lMfjE=;
 b=ZIaThZOSNj0jv2Wc70i+yT2SX9IgjNa+ZZFnAurG+VYxQ4fURNxCNEKZ
 KPBR9y52ZrCWIVB1zV6g1qNqVA2l8NnWULVTD3M6V6dqY2og9tocp0pJs
 SiRifx/Lvo0/Dn1qwET5lYWkRAM5c2tCUKQi+NsB3wHQvlI+Fwn9lqlKx
 89kyEN5vzlR+aipBS50NxapRE3mo/XFXOLk2NlHnsV88BtDl0PgXH9l5w
 jQD+W3PgjteZiknMFlt5DZbsdIsLPRuF19Gy/tzMB3RQgEUynW8iwGMZK
 ZOodA6tJF+YkLo+n0KuRlogthsDYxgM7IsFT9HpkTKCxipUokkFR7pa3G w==;
X-CSE-ConnectionGUID: 5oE1r1LMQTKDnaq6iKL2QA==
X-CSE-MsgGUID: azR6yMElRnqNwUmoUoYiMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23990680"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23990680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 00:28:32 -0700
X-CSE-ConnectionGUID: 6lbmkXkGQhCMTQwEgu8Gjw==
X-CSE-MsgGUID: 69YR4mQrQ32Bp3j6LhUgWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="68922607"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2024 00:28:27 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, bellekallu.rajkiran@intel.com,
 saikishore.konda@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 3/3] drm/i915: Use device wedged event
Date: Mon,  2 Sep 2024 13:18:59 +0530
Message-Id: <20240902074859.2992849-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902074859.2992849-1-raag.jadav@intel.com>
References: <20240902074859.2992849-1-raag.jadav@intel.com>
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
index 735cd23a43c6..60d09ec536c4 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1409,6 +1409,8 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 
 	if (!test_bit(I915_WEDGED, &gt->reset.flags))
 		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
+	else
+		drm_dev_wedged(&gt->i915->drm);
 }
 
 /**
-- 
2.34.1

