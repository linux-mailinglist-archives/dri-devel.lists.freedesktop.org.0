Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31792961C50
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2606010E467;
	Wed, 28 Aug 2024 02:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H293QB3u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2C910E44B;
 Wed, 28 Aug 2024 02:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813290; x=1756349290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mHgoc+QGoEPC26LQktqCllqoj2jzpaO6eQsC9ossdvc=;
 b=H293QB3unntHYVB5IepoCCXr/nLYQgHPdSiTxQnYqQ6HtmiNifJXmAtv
 JlTywkQd9huoM99ejwhzTdovKU6gDU6OZS+vzo9NDvQL63ZkT9LF7pbmC
 +EVW3Zg5LDEpzDnto9/C9nptIeFnMSTSygNscPhTeZYC4z0uPOdz5mXnf
 3ccZs3OrM254NKBdUGxuWknayshGopBIVo2A3L91Qd41WxWwQVjs5GXdP
 AQjrv0lLF1Bo7TiRRwaddZw1dz8D0Belaq9SF2UX8XldOHlfai/0PHvNS
 nGu3T5Uo+u4nVOHZNxb4zeM4IGsxEaIYIFbzWrjMmT5BytIxEmCmSrlUo w==;
X-CSE-ConnectionGUID: S7CLeUONQb2TNEeVgKR5ZA==
X-CSE-MsgGUID: 0JdBqmk+R6Cv7rmxyar3mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251910"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251910"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:09 -0700
X-CSE-ConnectionGUID: g6wxsU3KQXqGk5rqU2+w5Q==
X-CSE-MsgGUID: b777olezQEitpx0RsgugTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224631"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 15/28] drm/xe: Enable system allocator uAPI
Date: Tue, 27 Aug 2024 19:48:48 -0700
Message-Id: <20240828024901.2582335-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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
index d9bff07ef8d1..f7dc681a8b0e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2966,12 +2966,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
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

