Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B914990C438
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741DF10E598;
	Tue, 18 Jun 2024 07:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIwXA7eE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CC810E598;
 Tue, 18 Jun 2024 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718695137; x=1750231137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aZVEsAvJxq8YFPiN/+jcPgTLkaLcMRVVRzSS31qNVTQ=;
 b=CIwXA7eEqRxCRgOkIJXbVh6HE596tmL+lVZW84pVM/EJM44lBiBYpvvk
 SESLOIzyo+85i7rLB2i5uQdrArDWO/b07oVw7to05zDxUWZrJLJHei2cG
 JxMJEoIKvOx5gn0jpH8DO9/iHEhU+Rj6c63O0WmJFhQPoWk9OjYXd9xCw
 9hio9MV1ZPWsZoGwGez09xkeMAai0tbgbbPQCdMt5UHdVKExuCq+kX6Vd
 eB/dwE7BUNdL02wIPYCB4oZTOThJ7+DY12taPTpUgOQJKBk3gxLLu6Ev6
 jG/RKAOm+Z69P5AfehUikbB27coaPC0zaB6D/xXEnwcEoNr1YEYpaGo/b g==;
X-CSE-ConnectionGUID: DbincNZEQpabz0qFxrmzUg==
X-CSE-MsgGUID: Zq1sN3PySBeP30MIzt96pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15389374"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15389374"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:57 -0700
X-CSE-ConnectionGUID: UuzxwMEIRR+n9UbaORPsxQ==
X-CSE-MsgGUID: XH0mPKsIT/eWYZFULCzRPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="78910855"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.51])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 00:18:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 12/12] drm/xe: Increase the XE_PL_TT watermark
Date: Tue, 18 Jun 2024 09:18:20 +0200
Message-ID: <20240618071820.130917-13-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
References: <20240618071820.130917-1-thomas.hellstrom@linux.intel.com>
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
remapping. But there is no similar watermark for TTM_PL_SYSTEM
memory.

The TTM functionality that tries to swap out system memory to
shmem objects if a 50% limit of total system memory is reached
is orthogonal to this, and with the shrinker added, it's no
longer in effect.

Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
allowing all graphics memory to be bound to the device unless it
has been swapped out by the shrinker.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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
2.44.0

