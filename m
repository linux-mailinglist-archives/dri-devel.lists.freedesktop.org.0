Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8DA97A47B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 16:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B6A10E3A6;
	Mon, 16 Sep 2024 14:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kzMXQdOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26710E3A1;
 Mon, 16 Sep 2024 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726498315; x=1758034315;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ntsbITRUzLwcNZFnAg3rvoPTTLsB4joZjV6X0NlEiSo=;
 b=kzMXQdOHXLyxUTwjg6DfTxTjG4u2gA3OXtWrCYexCzOLoKrKTs3uPQMR
 RMGiPQ4mH/6sT42U1eaPVFIEN4+kMVegUeJcVTeLKs4fZypljbDQQrNr1
 dOu3tk7Z25IVdc3lR04ctNqhzxCROLPkXk5FeduUmvEa6pfuSbWl6SXbx
 tGzU8KQ+o0JXZ2KdtghPXSnGli1Pc0HZFWmmfTZnE7scKh8J+/w4eArKc
 q+Lg8XrUppnuJoebRTIslQPZUvBEWNjWiXPb3ulIvOGhvwMw8QBN53KVY
 q1FyrLxh4RY5q+uy4n8nH3wQORb8qMy3JR+EdAVFF4yiSVrRqUWCOwn6W A==;
X-CSE-ConnectionGUID: 25POUgiqS6KlW2wZQXcDDA==
X-CSE-MsgGUID: 5wNtSlQpSmOpi1cC24mU+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25259490"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="25259490"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 07:51:55 -0700
X-CSE-ConnectionGUID: 4ebW1khcRea2o0OCJWzo0A==
X-CSE-MsgGUID: SNf2nkg7TiK6edhGOZmriA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68572979"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.45])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 07:51:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v10 7/7] drm/xe: Increase the XE_PL_TT watermark
Date: Mon, 16 Sep 2024 16:51:12 +0200
Message-ID: <20240916145112.3336-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916145112.3336-1-thomas.hellstrom@linux.intel.com>
References: <20240916145112.3336-1-thomas.hellstrom@linux.intel.com>
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
2.46.0

