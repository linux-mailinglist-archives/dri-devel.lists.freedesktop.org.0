Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C8ADF67E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B827610E925;
	Wed, 18 Jun 2025 18:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/11fzey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0741010E91D;
 Wed, 18 Jun 2025 18:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750273012; x=1781809012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X+WyNxNuM0Q4IQ8urTprc524L7zLkn5i46sj2rLJYsY=;
 b=n/11fzey02Swycg8IbEptMS31cRIjdY9hjCIvrPgLRNOL6NwxsQubXWe
 RhDQOP+xvi8x04dCGNrOEzYcoBePNz2H3cIjPpCDzEbznDo3Zgdgjajtf
 kg1ygSZZ+bOR1IvU7zoExUIINHJJdOul11rZz1LkYjygzLaXcIs7dC4XK
 Us7otr49nLKFX1XOuJ60HYngD52Cz7MupUWEgiZGmf2VAYJtRXpi1d2LH
 RH4+a3mxmIDoKAvKF69jnFeriUsTbIAY7F5Fe2MPhkBe3ZjGCLHD8SWpX
 Nm5RQotVJFc/LeWrmZe/jqr2d0sdajSxsh0VjV1Cpt6SczChWIQvlSViI g==;
X-CSE-ConnectionGUID: s02fF9RGSIO8Vaj0YkKVUQ==
X-CSE-MsgGUID: cCCxR1vDS2ebT9HQERH27Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52210215"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="52210215"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 11:56:51 -0700
X-CSE-ConnectionGUID: RLF7miY+QVaa3v145XwDbg==
X-CSE-MsgGUID: e9Fzr2XfRdW1VkPp1kfWhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="153951931"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 11:56:49 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com, jgg@nvidia.com
Subject: [PATCH v3 07/10] drm/xe/xe_late_bind_fw: Reload late binding fw in
 S2Idle/S3 resume
Date: Thu, 19 Jun 2025 00:30:04 +0530
Message-Id: <20250618190007.2932322-8-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618190007.2932322-1-badal.nilawar@intel.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
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

Reload late binding fw during S2Idle/S3 resume.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 91923fd4af80..6c44a075a6ab 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -205,6 +205,9 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_pxp_pm_resume(xe->pxp);
 
+	if (xe->d3cold.allowed)
+		xe_late_bind_fw_load(&xe->late_bind);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
-- 
2.34.1

