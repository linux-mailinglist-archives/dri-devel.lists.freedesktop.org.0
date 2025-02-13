Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56AEA3353A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE1F10E9DA;
	Thu, 13 Feb 2025 02:10:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsMC725f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108A410E9CB;
 Thu, 13 Feb 2025 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412619; x=1770948619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pKoUloYrQMotRRRf5cjgNz1Y+vQDEeoXaRaImoe9Lwk=;
 b=SsMC725fSQr4jhE+G9gj3O1Br56ALRAyXfFrg8MSOfK+jHK2xHlSEa3a
 LtYkL6KobnB1RckqsKCp06DtMKqCUYNwCEd2OtjwZ7KADeL8/l2S2U6hm
 /N/LxR7/UahXh8cdk7nSi7Mfq/jezyLgTDnneb3T/Q3kL65u5IJg4wu3m
 HR9x9F7wBye8xTXcsMkOCzB20OD20fj5nNKdFU2GIBeXykvN8UwaMkHIa
 vqG+e7Yg5/yaqszFgiZhi3O+MsUDVGQ6/T/A+PlwnnJKNkMNdglFMK0+F
 14JE36fm2+LMASsqng9OqWgqynwdonqz8T0Rp/Zp1vnVA7lTzvVn4VOvz Q==;
X-CSE-ConnectionGUID: b7g1wnPaRdqS41q6gd8uIg==
X-CSE-MsgGUID: +VGoZeXBSiukvwA1NDafWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456021"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456021"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: K8iXB6HcRvCoHkQw3bdzBg==
X-CSE-MsgGUID: kuaKtlcjT6WRZKFhR94A1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945087"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 18/32] drm/xe: Enable CPU address mirror uAPI
Date: Wed, 12 Feb 2025 18:10:58 -0800
Message-Id: <20250213021112.1228481-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Support for CPU address mirror bindings in SRAM fully in place, enable the
implementation.

v3:
 - s/system allocator/CPU address mirror (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 06b013d1f533..6c9c3f9e307d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3040,12 +3040,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 		u16 pat_index = (*bind_ops)[i].pat_index;
 		u16 coh_mode;
 
-		/* FIXME: Disabling CPU address mirror for now */
-		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror)) {
-			err = -EOPNOTSUPP;
-			goto free_bind_ops;
-		}
-
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 !xe_vm_in_fault_mode(vm))) {
 			err = -EINVAL;
-- 
2.34.1

