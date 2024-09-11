Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A1975B3B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 22:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F221F10EA7D;
	Wed, 11 Sep 2024 20:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrWqI9Cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D274A10E9C4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 20:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726084890; x=1757620890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8gQJxasyXdeCaQeqL0TIhYng6/UlVBJxcdQeteEiWis=;
 b=PrWqI9Cv5OA9+iltmjCm0dH6FJFiQUdodEaX3UHrwxo90/jnJHm6kJHC
 bwr4jqSXqlKWpuRMiMPyqsls7XdGjG0UNKwOZH+8KHvkI0Ljb5ltF1K9g
 JrGTRIYxmq9bXOK1U3QBon2EILweKKu+YKm78xJ9wu/2NBBQAWkzjazaz
 mgOErxB1t7697HZfBUmQTK9mDtqh7/j8cUzqeyrZ1T5xEQGSb4wm4jRVm
 XRlQHTPUOhzrqyoeh4I5nbRF+NC66DvLuei3Hmtl9hPcW7VKc06KdmhXn
 Up1f4ur2QM6YxcRu2DXA6THPcyAZbw0tsUTrQXIJz7IkqTACumYbBYQ2y A==;
X-CSE-ConnectionGUID: moP8M9OPR9SyjUZxWoZAww==
X-CSE-MsgGUID: vlL2GuzXTXqVHNZXhgNpmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27827554"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="27827554"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:01:30 -0700
X-CSE-ConnectionGUID: takfm/xlTKe0vdK+sMGcmg==
X-CSE-MsgGUID: lMDLr+vvRUOyKVrQaAC6Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="71857567"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2024 13:01:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 800A7170; Wed, 11 Sep 2024 23:01:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] drm/panel: sony-acx565akm: Use %*ph to print small
 buffer
Date: Wed, 11 Sep 2024 23:01:25 +0300
Message-ID: <20240911200125.2886384-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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

Use %*ph format to print small buffer as hex string.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 217f03569494..d437f5c84f5f 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -562,8 +562,7 @@ static int acx565akm_detect(struct acx565akm_panel *lcd)
 		lcd->enabled ? "enabled" : "disabled ", status);
 
 	acx565akm_read(lcd, MIPI_DCS_GET_DISPLAY_ID, lcd->display_id, 3);
-	dev_dbg(&lcd->spi->dev, "MIPI display ID: %02x%02x%02x\n",
-		lcd->display_id[0], lcd->display_id[1], lcd->display_id[2]);
+	dev_dbg(&lcd->spi->dev, "MIPI display ID: %3phN\n", lcd->display_id);
 
 	switch (lcd->display_id[0]) {
 	case 0x10:
-- 
2.43.0.rc1.1336.g36b5255a03ac

