Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C695C9EB1A9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 14:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B0F510E8CA;
	Tue, 10 Dec 2024 13:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OarPhwi8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1C810E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733836184; x=1765372184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kins5pRBzjG2BfRs5W6rRnhUS4kpsEx0TMCHyLNnups=;
 b=OarPhwi8WwdHuZOjV748FeRsH8C/Iyg9GHDzBcGfVuMZ5i7IMFdy5f2R
 m4GaA3b8Ou+5iFaahzPl22nsOcPbx/CIfkvo9GHknrXct7sfTWP4yy7r2
 8VZgbpKfcXWsg24BhmwAJoJ7NA18cXt9Ar0julRMKhEuc66L/9hGsxBny
 TUwPBNmbzKo0af1biaA5HJBVzeJ5A9ZjukXC5o+rFGuyI+zXIrfKpfjjw
 fiNMDV+bX/LXINA8bCis2FEen3/Lr6hQ2b5+wxHkPPiEWX/FnUfSlZBSf
 A1R3BpSNziyfOxyzIrMXtfJJbYA0Fk2ZGAQMvQQ+LnSW3qSqWjlzr3j2d Q==;
X-CSE-ConnectionGUID: OsNVrAmMSHGg+n3YFscYwA==
X-CSE-MsgGUID: CAbMC7hrQ2eEwElNQg/r9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34080111"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34080111"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:09:44 -0800
X-CSE-ConnectionGUID: NAGnexRgSbeHscYKd9XPmQ==
X-CSE-MsgGUID: eRmEsOjIQmeP0iafsVh8Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95242036"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 05:09:42 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org, Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 1/3] accel/ivpu: Fix general protection fault in ivpu_bo_list()
Date: Tue, 10 Dec 2024 14:09:37 +0100
Message-ID: <20241210130939.1575610-2-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
References: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
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

Check if ctx is not NULL before accessing its fields.

Fixes: 37dee2a2f433 ("accel/ivpu: Improve buffer object debug logs")
Cc: <stable@vger.kernel.org> # v6.8
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index d8e97a760fbc0..16178054e6296 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -409,7 +409,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
 	mutex_lock(&bo->lock);
 
 	drm_printf(p, "%-9p %-3u 0x%-12llx %-10lu 0x%-8x %-4u",
-		   bo, bo->ctx->id, bo->vpu_addr, bo->base.base.size,
+		   bo, bo->ctx ? bo->ctx->id : 0, bo->vpu_addr, bo->base.base.size,
 		   bo->flags, kref_read(&bo->base.base.refcount));
 
 	if (bo->base.pages)
-- 
2.45.1

