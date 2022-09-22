Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1625E6F71
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 00:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B92E10E4CC;
	Thu, 22 Sep 2022 22:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F7E10E476;
 Thu, 22 Sep 2022 22:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663884630; x=1695420630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W46h6/cdVDiXsPueI3KajWyigoxAfLUcIjF+gJpoHIY=;
 b=VdWALbvnS3TjdVy45i/atX0sEWerlXNtAMohtOon2CY2hbUAUGWS78YL
 P2Esibyt+UjDRyULUHIJ5ezOjS5uIKhLdY67N5279Kd8E/5VAWDtX/jUX
 puAaKu2nVMLZpyBelrrHWYG7RJ8/SXUeM+qXx0TiO2CgSGCoZB3A+G32X
 xuTvxunca29fWMAEcQtK6aPy0DYXY6+YR1f1uSzEkLu4iLumpRgO+lojc
 YJSMkV6nekYzL2yJuJ6LA6uZNgjvhtSHbeWkmXPEy0bOM9P2kv3cl8Shd
 CvXK+xiNSkJwXLslWJMeMcwEgpSVTJQN8U3sSQxk3gxKqF0pKtvUFRt+1 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280815508"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280815508"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="682416248"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:30 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915/guc: Add GuC deprivilege feature to MTL
Date: Thu, 22 Sep 2022 15:11:14 -0700
Message-Id: <20220922221117.458087-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stuart Summers <stuart.summers@intel.com>

MTL supports GuC deprivilege. Add the feature flag to this platform.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 77e7df21f539..b1b720870da8 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1143,6 +1143,7 @@ static const struct intel_device_info mtl_info = {
 	.display.has_modular_fia = 1,
 	.extra_gt_list = xelpmp_extra_gt,
 	.has_flat_ccs = 0,
+	.has_guc_deprivilege = 1,
 	.has_snoop = 1,
 	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
 	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
-- 
2.37.3

