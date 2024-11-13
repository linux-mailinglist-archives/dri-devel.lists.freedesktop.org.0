Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A14D9C7B54
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 19:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE1910E289;
	Wed, 13 Nov 2024 18:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9jW8YZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D69A10E289;
 Wed, 13 Nov 2024 18:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731522984; x=1763058984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X8S0eKO7OEtk7uEtze88lcEDfJiOg0jgEvrEfL3DSlw=;
 b=I9jW8YZc+ISg8iYX0RpC0HO1pzjLfAw2gzMrlP6lhTV0MTMKJbMPb0GK
 Xbe/E7amLfEOtI5ipPNS1OrVApsNOskrXoqX9PcgDFn9sWHBVcDR9kdzf
 +dSM1iu03A4JauaTQ5z5B5fjI91mYpdV6MsvWdAB/3t1FIPQCft6Go/Yq
 dFn68A5Yn6EVRvPB79witC7xt7BJcFEAWFgN8wixSruejAuowouS9aUV5
 OXMp4EohXbBd3qRuthVULwYc2+LQ54dnfFnFsqtzlWXjP4oxqyrJ/iCAD
 kgd47rirjIwzNdtD88XR1AH7/iCImGLA0ltdhofbw2UWzmVDnsFODrImE Q==;
X-CSE-ConnectionGUID: dQDTMukuS9666G9GAH0tMA==
X-CSE-MsgGUID: FrYEZmtcSbKrxerXSJljFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31202895"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31202895"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 10:36:24 -0800
X-CSE-ConnectionGUID: 3e63pFc/RP+S8f/3SOu8aA==
X-CSE-MsgGUID: GdLN1IDwQ3++IyiuHLGsLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="92882968"
Received: from slindbla-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.190])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 10:36:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v13 8/8] drm/xe: Increase the XE_PL_TT watermark
Date: Wed, 13 Nov 2024 19:35:50 +0100
Message-ID: <20241113183550.6228-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241113183550.6228-1-thomas.hellstrom@linux.intel.com>
References: <20241113183550.6228-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The XE_PL_TT watermark was set to 50% of system memory.
The idea behind that was unclear since the net effect is that
TT memory will be evicted to TTM_PL_SYSTEM memory if that
watermark is exceeded, requiring PPGTT rebinds and dma
remapping. But there is no similar watermark for TTM_PL_1SYSTEM
memory.

The TTM functionality that tries to swap out system memory to
shmem objects if a 50% limit of total system memory is reached
is orthogonal to this, and with the shrinker added, it's no
longer in effect.

Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
allowing all graphics memory to be bound to the device unless it
has been swapped out by the shrinker.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
index 9844a8edbfe1..d38b91872da3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
@@ -108,9 +108,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
 	u64 gtt_size;
 
 	si_meminfo(&si);
+	/* Potentially restrict amount of TT memory here. */
 	gtt_size = (u64)si.totalram * si.mem_unit;
-	/* TTM limits allocation of all TTM devices by 50% of system memory */
-	gtt_size /= 2;
 
 	man->use_tt = true;
 	man->func = &xe_ttm_sys_mgr_func;
-- 
2.46.2

