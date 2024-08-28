Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7244A961C4E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828CD10E464;
	Wed, 28 Aug 2024 02:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTlCo86J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B961F10E441;
 Wed, 28 Aug 2024 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813289; x=1756349289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vh+BnVKxl1twpfwV0qWGQ7BR4pA5oXHUShwq1A98TeI=;
 b=lTlCo86J1LkIZZr15nsVH0jXAv6hYqJAXl0SwCbupvDMR+oWc289oL/i
 ENEeQ9ZVxqssaLvgtMvD958bVJUyO5g1R+jGtcGjUtgS9JeqK0/JnCYVw
 /3MU3D98rMeZBKE+YyCH6jWToo+/YWVxJJHVBIkgHPQf1uXrI9zfYI88V
 k96dckWTLJWDjS3V21TM8DwGcgBoLopIE7chvxyGJWXSdxFD/CV24Y3qr
 F+2QJAEcKm4Ap5QfhBEo+ZDMZBuxS6geuSzZUXBPv+SENTkqVn3iqurAa
 //DUVl3JeaPIJCTFK5D+pvJUjeg7X2R2YnOp5D6Fl7LV1Oqc44hMN92+T w==;
X-CSE-ConnectionGUID: VOOcArkHQAC6P6rZ4ACaXA==
X-CSE-MsgGUID: FTSh9FP4TbyN++6h/jeeug==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251888"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251888"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
X-CSE-ConnectionGUID: caqOARzOTwejXeHBZJuytw==
X-CSE-MsgGUID: kvVXUk99Tie4s/oIuHYvCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224614"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 10/28] drm/gpuvm: Add DRM_GPUVA_OP_USER
Date: Tue, 27 Aug 2024 19:48:43 -0700
Message-Id: <20240828024901.2582335-11-matthew.brost@intel.com>
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

