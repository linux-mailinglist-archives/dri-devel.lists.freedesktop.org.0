Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D419F4EA4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 15:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD0210E9C1;
	Tue, 17 Dec 2024 14:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7LwhwqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CBF10E9D1;
 Tue, 17 Dec 2024 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734447574; x=1765983574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xVtDZjrM+9ilzETbb9iYCs38I+9mafYXRIhuhzjUN44=;
 b=S7LwhwqNhw+ms2i/Ce+86C0mgp1C3e7akmp/UkXbfVOEzpqOY3Zqcoyr
 HrIH5ozAAznNPpzG7f0I8vWM+B4Jwbb8wfwVCJWavjZwBeRYKAJ1ScAcx
 LsegnodC8y9teyThwniNPunfPzo+tiThKQV0Bn4+UNqQd79izPGxVOUD3
 /htfayBudXvezb1zkoT+WRXuIfdmlgE+erbBh/UhdHHlC5yTiDOOow6oI
 RLPo+ad4ralTf8hWEIDSLlJv2H8uAuEt++f4T8B0fczkjliWngbTSZgix
 xnVHummS2x8cmqN7PhyIufkBSYXK9P+PJqaoObzo6U2NgXPRwgVEEPyp/ w==;
X-CSE-ConnectionGUID: p4Dtq/QGQCaiUj3PgJ0pNQ==
X-CSE-MsgGUID: de1XeOF/TpO8s+bIAvTbdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34914488"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="34914488"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:59:34 -0800
X-CSE-ConnectionGUID: z9RcYTS+RI+e5BjJTPMQZg==
X-CSE-MsgGUID: 8VrGGbquToiVV86fZc7U2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101694367"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.49])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 06:59:31 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v15 9/9] drm/xe: Increase the XE_PL_TT watermark
Date: Tue, 17 Dec 2024 15:58:52 +0100
Message-ID: <20241217145852.37342-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
References: <20241217145852.37342-1-thomas.hellstrom@linux.intel.com>
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
2.47.1

