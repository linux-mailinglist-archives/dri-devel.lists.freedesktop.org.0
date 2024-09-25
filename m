Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911369862F4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5F010EA40;
	Wed, 25 Sep 2024 15:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E7rTT5XT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AF310EA39;
 Wed, 25 Sep 2024 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727277489; x=1758813489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qM1u+AYC+ftDE9rd9j8PoGoZ11+0BbuLMtw4RwQPr8Y=;
 b=E7rTT5XTX1bgbGydiAJZ2MbHUi8ARLSWS3rDN+m6k748Yk4WMbDNtt4q
 x+vJXsYHoCHlcGoqBsbsFfhhD7XsmMapx7cyjF+ZmwB29B9z2RU9Xmej4
 U0U7MtYUzA8BZo4oN5sckG2N9u5ShgF3v52tHGJkCgfSMlrQd6JEAZYdM
 uhsLRoem1z/hTgF9GXftjREDdfqdSYYGYZb3Z1yUu2ilCor1KuO32oFkg
 wO0y6aWzotYxj1lJrnDnnb6pQ/0bhB/x8xHTmMEAoTMzSkymGhk1lljUu
 1geS6XHx1ERPku7vC3ugQxD+rRdQntKFH7+colL5tcXv19hEUsCut10Ou Q==;
X-CSE-ConnectionGUID: FJScUnPmT1Gx/wbYAZoOOA==
X-CSE-MsgGUID: TPwo/c/HTlqpJ9ahqetqcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48866872"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="48866872"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:17:53 -0700
X-CSE-ConnectionGUID: voc2L2lFTlGNURu/iGvrPA==
X-CSE-MsgGUID: fvDHSZeiQjaKHuOK/tr/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76612940"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2024 08:17:50 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 3/7] drm/xe: Add histogram support to Xe builds
Date: Wed, 25 Sep 2024 20:37:50 +0530
Message-Id: <20240925150754.1876893-4-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240925150754.1876893-1-arun.r.murthy@intel.com>
References: <20240925150754.1876893-1-arun.r.murthy@intel.com>
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

Histogram added as part of i915/display driver. Adding the same for xe
as well.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1122765c711d..16d2da0f48e0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -241,6 +241,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_hdcp.o \
 	i915-display/intel_hdcp_gsc_message.o \
 	i915-display/intel_hdmi.o \
+	i915-display/intel_histogram.o \
 	i915-display/intel_hotplug.o \
 	i915-display/intel_hotplug_irq.o \
 	i915-display/intel_hti.o \
-- 
2.25.1

