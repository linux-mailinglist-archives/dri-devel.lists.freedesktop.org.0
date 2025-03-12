Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10542A5E620
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A95A10E7CD;
	Wed, 12 Mar 2025 21:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQoW9J7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A2D10E7CB;
 Wed, 12 Mar 2025 21:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813545; x=1773349545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dcSxuCrGHWfxvSHM9MeazuvHeBsTaxB7lM9WsE/52i0=;
 b=AQoW9J7FYzJ/aCx0ryq54S2sawjCB8pl0cPcSFHtpLXcsTFrfXA/Xl7b
 ILd4tLolqRARZIAONXCoQb6DEo2YmQmnJKsov+7T0lODFxaTNUdHiMDtm
 plQFZlMk8yVZuiNWMPaW0mCV9CDN51gg+5nUjUFLFzzEtE9bT3gwiBppH
 d1sY6wnP9BQcKvmSqVjIoX8mqQ2ONFu1g29sBFWQJy55y2I96D3IrxuLo
 Y7WJaxYdGcUIV7HqPdGjsCUjAAIePDb9w/YkfQZf+IhbtDIcEGl1VqSQv
 hzzDJu1+HwyLkLN9+3IIoO5pmB1ZrVhj8VIfNfn2veO0afzZ0K2rMday/ A==;
X-CSE-ConnectionGUID: cWiiAsl5QBaP3AcIXz0fVQ==
X-CSE-MsgGUID: aEGtamXYSqO1OYqdVhYb0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562265"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:44 -0700
X-CSE-ConnectionGUID: eaHWjI6IQLSfeYDHEjAtoA==
X-CSE-MsgGUID: kcu5iW9CQJyJto6VwWIwkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791233"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:41 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 16/19] drm/xe/migrate: Allow xe_migrate_vram() also on
 non-pagefault capable devices
Date: Wed, 12 Mar 2025 22:04:13 +0100
Message-ID: <20250312210416.3120-17-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

The drm_pagemap functionality does not depend on the device having
recoverable pagefaults available. So allow xe_migrate_vram() also for
such devices. Even if this will have little use in practice, it's
beneficial for testin multi-device SVM, since a memory provider could
be a non-pagefault capable gpu.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3894efe7ba60..23c258b775a0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1609,6 +1609,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 {
 	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
+	bool use_usm_batch = xe->info.has_usm;
 	struct dma_fence *fence = NULL;
 	u32 batch_size = 2;
 	u64 src_L0_ofs, dst_L0_ofs;
@@ -1625,7 +1626,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 	batch_size += pte_update_cmd_size(round_update_size);
 	batch_size += EMIT_COPY_DW;
 
-	bb = xe_bb_new(gt, batch_size, true);
+	bb = xe_bb_new(gt, batch_size, use_usm_batch);
 	if (IS_ERR(bb)) {
 		err = PTR_ERR(bb);
 		return ERR_PTR(err);
@@ -1650,7 +1651,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 		  XE_PAGE_SIZE);
 
 	job = xe_bb_create_migration_job(m->q, bb,
-					 xe_migrate_batch_base(m, true),
+					 xe_migrate_batch_base(m, use_usm_batch),
 					 update_idx);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
-- 
2.48.1

