Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C049EDAC6
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFDD10EC4D;
	Wed, 11 Dec 2024 23:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRqtzQtU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E050B10EC65;
 Wed, 11 Dec 2024 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958184; x=1765494184;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fGSlh/zhJdIfVsmOJovFGnD3Nxl3WOJ0zFbOGizbQhE=;
 b=dRqtzQtUKhoePzg/WAaLJaXi8UXeXzRxTh2IapIHjTPsNHpY0Smc2I1C
 xYu3LKFBYO+t5iIcrJsezd9FF5nhEKUlgRY2BRudg12fn0EivvCjhoX7W
 cPejdC+q69Zk/aO9+/uvJ+ilcCjKRzKfIrdf5yVrrbcB6e9xGBBQRxYqI
 pMmjMIyRqIiw7JQTQUHJLCcY1bjnb8rsojl/Fl8wnai3s1YxCQmDA6nZP
 nOoMeGT3FZr7x82alBLyn77OGQYc7IMypI2n3eekyoqyMDBmYUMyreb1d
 yWmPFIccyaUOVM6PQ9TIC458GZJv7kjZFrqvZsgvxZie1e5VyUGaf1F4l A==;
X-CSE-ConnectionGUID: W7ZPsRxKTIiLNsrfoLv1Sg==
X-CSE-MsgGUID: Hh+zrYgDRCWyUFNyXQRniw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401507"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401507"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:03:04 -0800
X-CSE-ConnectionGUID: fmryekkWQS+SDaddj58hAw==
X-CSE-MsgGUID: lvd6plF6SYCYBgXS4v8EEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962575"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:03:02 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 08/11] drm/connector: Warn if a connector is
 registered/added incorrectly
Date: Thu, 12 Dec 2024 01:03:25 +0200
Message-ID: <20241211230328.4012496-9-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241211230328.4012496-1-imre.deak@intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
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

All the drivers should be converted now to use
drm_connector_dynamic_init() for MST connectors, hence
drm_connector_dynamic_register()->drm_connector_add() can WARN now if
this was not the case (for instance if a driver inited an MST connector
with one of the drm_connector_init*() functions incorrectly).

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_connector.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index c322dbf6e3161..1bd7407223fbb 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -330,11 +330,7 @@ static void drm_connector_add(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct drm_mode_config *config = &dev->mode_config;
 
-	/*
-	 * TODO: Change this to a WARN, once all drivers are converted to
-	 * call drm_connector_dynamic_init() for MST connectors.
-	 */
-	if (!list_empty(&connector->head))
+	if (drm_WARN_ON(dev, !list_empty(&connector->head)))
 		return;
 
 	spin_lock_irq(&config->connector_list_lock);
-- 
2.44.2

