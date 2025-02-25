Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3FA43442
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 05:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545AC10E55B;
	Tue, 25 Feb 2025 04:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lC/waOQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C49010E545;
 Tue, 25 Feb 2025 04:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740458533; x=1771994533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AkWywLauA6LSYrGET646PjoWw8Pl9RVMcyPKdP8qT0g=;
 b=lC/waOQwZwp5xi1KGMHrJP67VV7Q3anMBhuInSjqCO2ChyOEZd5rcLpw
 HrCEIdJe8JVxSc+XJ9XOj7/xJ8e3XFn2lk/XbsZ4TmSUE6EO++Uh6Fmhh
 +w6LWnm37hSMEu9BLYPhnzlwomgqIGVpIusAc0Ef2VBUr8DG7vPk8bPaj
 yc1z2EWudAl8n3ZdbMS4elQU2ksJSVrCQG51okbKhRlCnCx626/iOj5jt
 4vKP0/L/quFt7tJmbw5kGQyv3vTPYr2eQc4zZ7ogK6H/pzsaRA9ECF1+h
 Aq1VUvsZRx2IOdb1JJPQqmgx2+PTvS9vCYQEpHcmOfFpYmKHWvV0hJcp3 w==;
X-CSE-ConnectionGUID: EgGGlyRrS+K8qzG7TWLCUQ==
X-CSE-MsgGUID: 6ht93qnIQ/e2QyDfYJmu+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51884979"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="51884979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:13 -0800
X-CSE-ConnectionGUID: Jl8i91AlTZuuRr2SIenc3g==
X-CSE-MsgGUID: m/Q9SHXqTWyE22alP6Owgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116290284"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 20:42:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v6 13/32] drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
Date: Mon, 24 Feb 2025 20:42:52 -0800
Message-Id: <20250225044311.3178695-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225044311.3178695-1-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
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

Add DRM_GPUVA_OP_DRIVER which allows driver to define their own gpuvm
ops. Useful for driver created ops which can be passed into the bind
software pipeline.

v3:
 - s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
 - Better commit message (Thomas)

Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/drm_gpuvm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 00d4e43b76b6..2a9629377633 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -812,6 +812,11 @@ enum drm_gpuva_op_type {
 	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
 	 */
 	DRM_GPUVA_OP_PREFETCH,
+
+	/**
+	 * @DRM_GPUVA_OP_DRIVER: the driver defined op type
+	 */
+	DRM_GPUVA_OP_DRIVER,
 };
 
 /**
-- 
2.34.1

