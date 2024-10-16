Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A199FF6B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5AA10E66C;
	Wed, 16 Oct 2024 03:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTt8S8dD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380FA10E655;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049100; x=1760585100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sn4Tu0pLn0iisz/GIqe1WMmdJ6ts6vjULmPxiUJ+szo=;
 b=eTt8S8dDwgNpDG+F82bYWjXkhIevBWVlVQwLLzH7OzFc30IKgBdF+90C
 STb3yRqKT+60/K+D40ogJ6dDAOdI3w2kEPaJKsTXMm1lvv4gKoYy2zEW/
 hXwcBM/WdY3Xb/MheLzQguCaUDhtHZaA/S2JqqBEJIsnD0Qbt80jqf24W
 b7tQ1py8VidMqkJa3o4DNGpr2ihThgATlwFP5sWW7+IJlhp/+xlLDxV9z
 gOGxbvnBMzBF/g2ZYj89ALmti3Sk/W3napZDePrWdvryILqqtH/ODX6Yb
 NT8xmKwfP4h28YAv2LafguhWcE/GEQzKCjBKfdKJS1+7byoqNzUHyVhYz Q==;
X-CSE-ConnectionGUID: pUphBOC+RLijP9QB/nSNDg==
X-CSE-MsgGUID: CJtTw+DITIeEtk+rckErwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056419"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
X-CSE-ConnectionGUID: i988FIoMSiWXhPG0tR/0iQ==
X-CSE-MsgGUID: 244K/411Rmeop21LnCxxHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930264"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 15/29] drm/xe: Enable system allocator uAPI
Date: Tue, 15 Oct 2024 20:25:04 -0700
Message-Id: <20241016032518.539495-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Support for system allocator bindings in SRAM fully in place, enable the
implementation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 158fbb1c3f28..8eed820079ba 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2962,12 +2962,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
-		/* FIXME: Disabling system allocator for now */
-		if (XE_IOCTL_DBG(xe, is_system_allocator)) {
-			err = -EOPNOTSUPP;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
 			err = -EINVAL;
 			goto free_bind_ops;
-- 
2.34.1

