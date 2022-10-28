Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85273611D72
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 00:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC3910E8ED;
	Fri, 28 Oct 2022 22:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A1610E8EC;
 Fri, 28 Oct 2022 22:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666996827; x=1698532827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jCV2Nad0e2GEzOj2JWzWmI8jvuurDWwcJKrrti+nqEc=;
 b=WSQmfV/InB+LzlRZO/cs86ExBUZA7rS+9eiCxBJ34Dl7EhDI6AKDel4+
 pPtzjvbbshdlhudbjPnKOMGQzWRO66rIIfNWYmYfvkNrYwU0r5lElsdoM
 29I17dOov0mFIv+K9TVmF63ZIril9KwUs7I6NLfU5dMHuWqpm7hDIMcIH
 d6NA0+QNMmJgpD3q/CNpcITgeUehzoah0WEKoPyF3gIbRFxdxbQzCy4uG
 iIB4RKtRUlL8LucbNjCk6lWPWOaPXs6STdnKCxadZAY6T3/doTlycisOr
 ZuPOXysogaoACl/rGbnhlCLe5pK65vgYHJVAR2KVx2gCpg+gPaFzU/qgG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="291901274"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="291901274"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 15:40:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="664184693"
X-IronPort-AV: E=Sophos;i="5.95,222,1661842800"; d="scan'208";a="664184693"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 15:40:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Add missing steering table terminators
Date: Fri, 28 Oct 2022 15:40:22 -0700
Message-Id: <20221028224022.964997-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The termination entries were missing for a couple of the recently-added
MTL steering tables.

Fixes: f32898c94a10 ("drm/i915/xelpg: Add multicast steering")
Fixes: a7ec65fc7e83 ("drm/i915/xelpmp: Add multicast steering for media GT")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 46cf2f3d1e8e..830edffe88cc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -128,11 +128,13 @@ static const struct intel_mmio_range xelpg_dss_steering_table[] = {
 	{ 0x00D800, 0x00D87F },		/* SLICE */
 	{ 0x00DC00, 0x00DCFF },		/* SLICE */
 	{ 0x00DE80, 0x00E8FF },		/* DSS (0xE000-0xE0FF reserved) */
+	{},
 };
 
 static const struct intel_mmio_range xelpmp_oaddrm_steering_table[] = {
 	{ 0x393200, 0x39323F },
 	{ 0x393400, 0x3934FF },
+	{},
 };
 
 void intel_gt_mcr_init(struct intel_gt *gt)
-- 
2.37.3

