Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0213E653998
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 00:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E87C10E4E5;
	Wed, 21 Dec 2022 23:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE7310E135;
 Wed, 21 Dec 2022 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671663823; x=1703199823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rkqspy9JZnOKiKQY8/9w7m0+kGXTpEmU2kglbH4Htv4=;
 b=I4EgpRFqLnjnl3hm5Evvad/aYYs19dFSWsDY5vbg84Su3jjZl8trHWan
 Yk1Z2JBsnKPon9ljr8ND3lRPxGxNEBVyE1s71Do3JixiNCu/WEDP7y5jd
 P3/NkszAKBCq7tAGS6VEMTFSCxdPDgTnmTpPqwdzOC53zwAfVlOnk9DoP
 HUWWQhrFHSnlwg+8IJpy/i+1m5DfnLaFXmbSwgx4SOTf6XRAbs8s8/JiK
 cxFWaKopuGJha1NhbPmZavIqC1Jq+1Gu5OFP+JoUlCC+O9vM+SouBvFCr
 BeWJXan188uZ2yICmCGq/USR2FPf0Il0GObp96jeECpW8zdgp8582xfR/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="321905562"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="321905562"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 15:03:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="793864465"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="793864465"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2022 15:03:43 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/7] HAX: force enable PXP Kconfig
Date: Wed, 21 Dec 2022 15:06:28 -0800
Message-Id: <20221221230628.2715916-8-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
References: <20221221230628.2715916-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodrigo <rodrigo.vivi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Juston Li <justonli@chromium.org>,
	Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Force PXP configs on for CI testing to trigger full subtests
in IGT's gem_pxp as opposed to the partial "unsupported hw substests".

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/Kconfig | 2 +-
 drivers/misc/mei/pxp/Kconfig | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 3efce05d7b57..93595d804ef0 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -136,7 +136,7 @@ config DRM_I915_PXP
 	bool "Enable Intel PXP support"
 	depends on DRM_I915
 	depends on INTEL_MEI && INTEL_MEI_PXP
-	default n
+	default y
 	help
 	  PXP (Protected Xe Path) is an i915 component, available on graphics
 	  version 12 and newer GPUs, that helps to establish the hardware
diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
index 4029b96afc04..89e4ee5b4b07 100644
--- a/drivers/misc/mei/pxp/Kconfig
+++ b/drivers/misc/mei/pxp/Kconfig
@@ -6,6 +6,7 @@ config INTEL_MEI_PXP
 	tristate "Intel PXP services of ME Interface"
 	select INTEL_MEI_ME
 	depends on DRM_I915
+	default y
 	help
 	  MEI Support for PXP Services on Intel platforms.
 
-- 
2.34.1

