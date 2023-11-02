Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11C97DF5FE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7859510E927;
	Thu,  2 Nov 2023 15:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D4C10E8F2;
 Thu,  2 Nov 2023 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937960; x=1730473960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ODvGQw6Tg94m3psZSIA44X71pQMmWqIy0X3VaZ/r7qU=;
 b=DTQFJ32ls1Gn1cn8Fc2Nlfg3bQDPT/T1XuZ5TfdFja99PJ0i0PSRmUdu
 KCT8pmp01n5GWr8UqBuOL+9qwSp8xWTn2rmknthyPNaaFBl6O84M08LJi
 PnFnAaZcX/gBF20eDfyxj43ZZJ3dw4HqbD7kAvsK1Y57SSKFhosNxClUu
 TFy9+XxAhn3BGhym1EGHNdgddBxrflA5h4up2z57HV23BD66UUmMalfhm
 LnB6NbLQWspPmAu78OCoT+pYyKh7QKVZToqklCESdVw3dkc91qwPg2HBA
 brFvnNL+KFJ/r/LH7CqLUy9ANUMhKFHFwmTcLvAHGtv9uHyEqNkEUrFLv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1660173"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1660173"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737784566"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="737784566"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 02 Nov 2023 08:12:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0E9036B4; Thu,  2 Nov 2023 17:12:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/15] drm/i915/dsi: Fix wrong initial value for GPIOs in
 bxt_exec_gpio()
Date: Thu,  2 Nov 2023 17:12:23 +0200
Message-Id: <20231102151228.668842-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

Fix wrong initial value for GPIOs in bxt_exec_gpio().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 8e6beef90e5e..0f9da0168a7b 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -356,9 +356,7 @@ static void bxt_gpio_set_value(struct intel_connector *connector,
 	if (!gpio_desc) {
 		gpio_desc = devm_gpiod_get_index(dev_priv->drm.dev,
 						 NULL, gpio_index,
-						 value ? GPIOD_OUT_LOW :
-						 GPIOD_OUT_HIGH);
-
+						 value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
 		if (IS_ERR_OR_NULL(gpio_desc)) {
 			drm_err(&dev_priv->drm,
 				"GPIO index %u request failed (%ld)\n",
-- 
2.40.0.1.gaa8946217a0b

