Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D299FF67
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5911510E66A;
	Wed, 16 Oct 2024 03:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKC7z2IF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6739F10E655;
 Wed, 16 Oct 2024 03:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049099; x=1760585099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vh+BnVKxl1twpfwV0qWGQ7BR4pA5oXHUShwq1A98TeI=;
 b=mKC7z2IFDJ8NkQQ3xoEPSzVgjvxkj6eRHUetq0xa2kQgI/5WwoDR8HGt
 yvMFlKmgiGfQGnpjPRb9OkwxhGTkW1M3KkN4G3sgS86pqoNjxnQthECC+
 Y+i4iNkTooJPsMA1spKrxU3KJBnmFcxAlBNU3Dsuz5JQVs2K6bdc6PkKc
 KNRvsVBZm4wCXJ4GGiRcpN+9qayQsDlLwFulOCCwsQGKlDpworXAUZ3+s
 tJP4rlLEnBvjmSTZfqarbiqi2sJUVEusMrTEH3LYexMZV7ANU2XqSQ/Kq
 rQJO/OhjHB7nfAt9Eq1AXHRWa51U50DykC+3wSvuTEx0oaZMSQJI9omXI g==;
X-CSE-ConnectionGUID: 2CUiH5IsT4W5b6o2FdasnQ==
X-CSE-MsgGUID: CYhBnxn1TX+ja799Oa79HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056389"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056389"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
X-CSE-ConnectionGUID: EjwzJsTuR1iALGKMSfj01w==
X-CSE-MsgGUID: EdpNbrnrRwiBJn9ZQPFNyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930259"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 10/29] drm/gpuvm: Add DRM_GPUVA_OP_USER
Date: Tue, 15 Oct 2024 20:24:59 -0700
Message-Id: <20241016032518.539495-11-matthew.brost@intel.com>
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

Add DRM_GPUVA_OP_USER which allows driver to define their own gpuvm ops.

Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 include/drm/drm_gpuvm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6..cc3f8ed5113b 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -812,6 +812,11 @@ enum drm_gpuva_op_type {
 	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
 	 */
 	DRM_GPUVA_OP_PREFETCH,
+
+	/**
+	 * @DRM_GPUVA_OP_USER: the user defined op type
+	 */
+	DRM_GPUVA_OP_USER,
 };
 
 /**
-- 
2.34.1

