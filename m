Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1B93F58E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 14:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5975D10E3BA;
	Mon, 29 Jul 2024 12:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRLboFMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CA510E3B8;
 Mon, 29 Jul 2024 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722256596; x=1753792596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P+5CAXMXBkqcJR9YVQm9pynsEUzJdowImNIxU3unc60=;
 b=NRLboFMyW6SPO1FWq1L0H0JetJvx4+Cwq/YjnQEmSxSAku1YLClpcOM2
 /Z5+c6RRnpQuQ6+GfS6NPD/3EFELGBUswc6abJwAde98LKHmDK6kPwpc0
 Jlr1wmkp1hI/XWooOepax2+5/iEDfFm8ksoaiY2QdJ045KGi27lY+748y
 E2V4OafZ6v+BvkuLpmxFWkzv4AeH1P7LfPPNpey+fQxII3aRcSlyEAlp8
 7zO48Vo4PSzpRVSui2Rx235RLKgTCfAazR6AOVoo9pcnWiq/fiCjCTffa
 JX/YqHqlY3hokOZ5K/pb+dOgQmCi/PaPMpDrnfYj36kvlhjGxwOtgZxbP Q==;
X-CSE-ConnectionGUID: 0mlin1DjTBCsCmZTP06RcQ==
X-CSE-MsgGUID: J3t1C9r+TimEsRkfXaNAdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20136511"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="20136511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 05:36:35 -0700
X-CSE-ConnectionGUID: KXeeIkZDSii8q5iNBJEyNQ==
X-CSE-MsgGUID: J4+b+V91T1On1T0H9I4rdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="53880368"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 05:36:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Ben Skeggs <bskeggs@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: remove unused variable ret
Date: Mon, 29 Jul 2024 15:36:24 +0300
Message-Id: <20240729123624.868907-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Fix build with CONFIG_NOUVEAU_PLATFORM_DRIVER enabled:

../drivers/gpu/drm/nouveau/nouveau_platform.c: In function ‘nouveau_platform_probe’:
../drivers/gpu/drm/nouveau/nouveau_platform.c:29:13: error: unused variable ‘ret’ [-Werror=unused-variable]
   29 |         int ret;
      |             ^~~

Fixes: 961ae5f9807b ("drm/nouveau: handle pci/tegra drm_dev_{alloc, register} from common code")
Cc: Ben Skeggs <bskeggs@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_platform.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index 3194b110eff8..829fdc6e4031 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -26,7 +26,6 @@ static int nouveau_platform_probe(struct platform_device *pdev)
 	const struct nvkm_device_tegra_func *func;
 	struct nvkm_device *device = NULL;
 	struct drm_device *drm;
-	int ret;
 
 	func = of_device_get_match_data(&pdev->dev);
 
-- 
2.39.2

