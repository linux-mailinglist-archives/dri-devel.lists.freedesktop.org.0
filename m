Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7B9D1BF3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 00:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931BC10E58A;
	Mon, 18 Nov 2024 23:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpIow4kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CA310E568;
 Mon, 18 Nov 2024 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731973046; x=1763509046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G7l0ib8+QEAgg4AIsKBibiDazGQbjzzu/FWpLW6Gqes=;
 b=UpIow4kQRfoFPhp6PPI8PKPLQkb1R9kXNFoiTIPMVU04XKMPvmLhXguI
 lscZ6h83pG2OqmxrNVqdPXnesYnQJ1iokBtlAfnxifG6RWD8Wu8Ebc2JJ
 A3DKc8czsHaaA9l12UuCdW22jrdWTbIodn4QnaaRbRgq/yPcia0FxNjwO
 jwrjbEcIPuH/a2kjdsCSH3ZuxCn+RAvH8qp8DL5tVdAWTXinZdQa3/kxu
 VdfTJbdOUQBAPTMUJ4/yfXxqdK1oQgUP2S1HiE42WansUSE/DB2poZSO3
 K27cNpqUURspbps7jHQgVV/oE2O7g1YvXczlSd5e2cP4V4cX5pGFV3553 Q==;
X-CSE-ConnectionGUID: qqVsIqk0Q26QzjIG6Rl2OQ==
X-CSE-MsgGUID: a1oUDGKRROKAoI2O+Gt7JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31878909"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31878909"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:26 -0800
X-CSE-ConnectionGUID: BQKhGgVhS/67DEVnecavKQ==
X-CSE-MsgGUID: KW2BGiVMS6G7WYkS+QhSHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89521702"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:37:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kenneth.w.graunke@intel.com, lionel.g.landwerlin@intel.com,
 jose.souza@intel.com, simona.vetter@ffwll.ch,
 thomas.hellstrom@linux.intel.com, boris.brezillon@collabora.com,
 airlied@gmail.com, christian.koenig@amd.com, mihail.atanassov@arm.com,
 steven.price@arm.com, shashank.sharma@amd.com
Subject: [RFC PATCH 10/29] drm/xe: Enable indirect ring on media GT
Date: Mon, 18 Nov 2024 15:37:38 -0800
Message-Id: <20241118233757.2374041-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
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

The media GT supports this, required for UMD submission, so enable by
default.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9b81e7d00a86..a27450e63cf9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -209,6 +209,7 @@ static const struct xe_media_desc media_xelpmp = {
 
 static const struct xe_media_desc media_xe2 = {
 	.name = "Xe2_LPM / Xe2_HPM / Xe3_LPM",
+	.has_indirect_ring_state = 1,
 	.hw_engine_mask =
 		GENMASK(XE_HW_ENGINE_VCS7, XE_HW_ENGINE_VCS0) |
 		GENMASK(XE_HW_ENGINE_VECS3, XE_HW_ENGINE_VECS0) |
-- 
2.34.1

