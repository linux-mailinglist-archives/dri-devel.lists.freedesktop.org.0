Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C285291D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5ED10E85D;
	Tue, 13 Feb 2024 06:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQGIqoPD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1827910E85D;
 Tue, 13 Feb 2024 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806452; x=1739342452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nkGDdlEIx2D/1BmCVgJqPklC4B3iMlMx6PrbhsaaYDQ=;
 b=mQGIqoPDw0UPNZQY68Ux9nSqobS4v6k+0OxPlPkYO12s71dG+SaWolCO
 hiqqlqPZfiAuWOumgbGuTVfD4oxy8Seg5MCCQttEj0oGZeDW1GkPnJRQP
 7Mmnw3pfaZr7Ngex+UMDj8BBUb/ChbTz7ogYuZzkgv3Fcqf9MLXRHEKo9
 Fz+DnElVJH6YT85T29TqOCKqzUcl/heXFinMUpRYSoLNzMQ8O8sBTObt2
 kpDOL+PzEQI1inxumvv9kAj6aZscQEZCqvxQkOQiekw8YB/SlJIrx6Qfw
 p1uon2FpkPlEk1yLs+9gdRFbBo3cpuDJyUADF3PNzrL+9DziSroFZnIVk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947678"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:40:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450174"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:40:45 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 03/28] drm: handle NULL next colorop in
 drm_colorop_set_next_property
Date: Tue, 13 Feb 2024 12:18:10 +0530
Message-ID: <20240213064835.139464-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

In scenarios, where there is only one colorop in a colorpipeline,
the user of the helper drm_colorop_set_next_property could use it
to set the next colorop as NULL explicitly. Make the helper handle
this case.

Note: This patch can be squashed with following patch

("drm/colorop: Add NEXT property") [1]

[1] https://patchwork.freedesktop.org/patch/566588/?series=123446&rev=3

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 67e6efc90803..462ffec42cdf 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -286,7 +286,7 @@ void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_color
 
 	drm_object_property_set_value(&colorop->base,
 				      colorop->next_property,
-				      next->base.id);
+				      next ? next->base.id : 0);
 	colorop->next = next;
 }
 EXPORT_SYMBOL(drm_colorop_set_next_property);
-- 
2.42.0

