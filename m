Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28596B584
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8E610E6FB;
	Wed,  4 Sep 2024 08:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhiRLe6s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D610210E6FB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725439949; x=1756975949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4nqZKDJt8eR5/BEzxVR2qol/jabhvWubfFPzjPIY3J0=;
 b=WhiRLe6sBn/TQwvYEiFvu6RP1+rFWX7/UjtiHLzXCAvCTIAb7Ylf1KV+
 /L334NVixqIjF3GZBo7tf0yIFlXMhYwRsCwaLRvmOI4qgkuHWNS972Kwj
 DqJKgLVP8pUYAIWC2SWHt7wmB9QKTZk/OrYJLZYw8w33RUxGRr+CwFmDc
 fMXR7k5ApSvfET+km2PDRR1C2GSLpCeetaVlly4QPnQHkLpQc/hs3MoS+
 kPcEnlGW5n5+PRKcaAsZ4YaHczWSc9bwWLjr/xonQZ69GSlGV8xkc/SpI
 iwc9C5z61s0ELWFmR3V2GCqBYmtHCBKiTQxFVg6JRoiBnKDZWvxYxbq2s A==;
X-CSE-ConnectionGUID: gQZsR4X4QY6lvgOhfB6xAA==
X-CSE-MsgGUID: 4OXUBcvRTmWdGTV7Lfah3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13365057"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="13365057"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:52:28 -0700
X-CSE-ConnectionGUID: +3/C+o0eQ0+Na1JzQvPuow==
X-CSE-MsgGUID: bvw4UEV7SHKhxDNo/+C/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="102612859"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:52:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Marc Gonzalez <mgonzalez@freebox.fr>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/bridge/tdp158: fix build failure
Date: Wed,  4 Sep 2024 11:52:06 +0300
Message-Id: <20240904085206.3331553-1-jani.nikula@intel.com>
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

ARCH=arm build fails with:

  CC [M]  drivers/gpu/drm/bridge/ti-tdp158.o
../drivers/gpu/drm/bridge/ti-tdp158.c: In function ‘tdp158_enable’:
../drivers/gpu/drm/bridge/ti-tdp158.c:31:9: error: implicit declaration of function ‘gpiod_set_value_cansleep’ [-Werror=implicit-function-declaration]
   31 |         gpiod_set_value_cansleep(tdp158->enable, 1);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
../drivers/gpu/drm/bridge/ti-tdp158.c: In function ‘tdp158_probe’:
../drivers/gpu/drm/bridge/ti-tdp158.c:80:26: error: implicit declaration of function ‘devm_gpiod_get_optional’; did you mean ‘devm_regulator_get_optional’? [-Werror=implicit-function-declaration]
   80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
      |                          ^~~~~~~~~~~~~~~~~~~~~~~
      |                          devm_regulator_get_optional
../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: error: ‘GPIOD_OUT_LOW’ undeclared (first use in this function)
   80 |         tdp158->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
      |                                                                 ^~~~~~~~~~~~~
../drivers/gpu/drm/bridge/ti-tdp158.c:80:65: note: each undeclared identifier is reported only once for each function it appears in

Add the proper gpio consumer #include to fix this, and juggle the
include order to be a bit more pleasant on the eye while at it.

Fixes: a15710027afb ("drm/bridge: add support for TI TDP158")
Cc: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/ti-tdp158.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tdp158.c b/drivers/gpu/drm/bridge/ti-tdp158.c
index 4ee0ad29874d..3472ed5924e8 100644
--- a/drivers/gpu/drm/bridge/ti-tdp158.c
+++ b/drivers/gpu/drm/bridge/ti-tdp158.c
@@ -2,10 +2,13 @@
 /*
  * Copyright 2024 Freebox SAS
  */
-#include <drm/drm_bridge.h>
-#include <drm/drm_atomic_helper.h>
+
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+
 struct tdp158 {
 	struct drm_bridge bridge;
 	struct drm_bridge *next;
-- 
2.39.2

