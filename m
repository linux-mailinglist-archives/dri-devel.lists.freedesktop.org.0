Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D26E8B240E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B184C11A4A9;
	Thu, 25 Apr 2024 14:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMgLITST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0EE11A4A6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055232; x=1745591232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gxYu0C20vsruH6KE+KGqY9pjeOljO8yEKIpRfI6XilA=;
 b=GMgLITSTkyShaM7vETLq8V40CCgrj4bTEvcG41TibxWbA9e2coxAuKKG
 fsdLXX0ISnPxSJK5CXzwHRn7cqIRHO6KBHhArOyUerQSytvJEIqvm5nQe
 T4Pi/VHqnG/WwwunQw7a/mhB9Q9LKBeP9jH9gMrvhyzJECQR68NVHrRl9
 nzNwlaoUAsK9eYuqvcVPuc91JNhegtjzHdeggz3f4ipXSoBf9XMran0SB
 aqke3/0tUIhE+1sTb4BuS9emAQg10JOrBtXkl/cGLMGj8haefXo/tSCAv
 Rg6dzFtuQf6thxC182AhBF+to0EcEkMC5Vd/+mvVNJMY4wkEVbjYX6V0k Q==;
X-CSE-ConnectionGUID: UtLsl3ZPS4+mEIhtFGJ8Lg==
X-CSE-MsgGUID: ivT2XGwATi6Fjs+tXRhQxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10281345"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="10281345"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:27:11 -0700
X-CSE-ConnectionGUID: csIbbWLGSHKzrTne17MmPg==
X-CSE-MsgGUID: UEcpJTBwQpqCWYq4MAO2JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29555175"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP; 25 Apr 2024 07:27:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 11A04586; Thu, 25 Apr 2024 17:27:07 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 2/3] drm/panel: ili9341: Respect deferred probe
Date: Thu, 25 Apr 2024 17:26:18 +0300
Message-ID: <20240425142706.2440113-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
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

GPIO controller might not be available when driver is being probed.
There are plenty of reasons why, one of which is deferred probe.

Since GPIOs are optional, return any error code we got to the upper
layer, including deferred probe. With that in mind, use dev_err_probe()
in order to avoid spamming the logs.

Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 7584ddb0e441..24c74c56e564 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -715,11 +715,11 @@ static int ili9341_probe(struct spi_device *spi)
 
 	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(reset))
-		dev_err(dev, "Failed to get gpio 'reset'\n");
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get gpio 'reset'\n");
 
 	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
 	if (IS_ERR(dc))
-		dev_err(dev, "Failed to get gpio 'dc'\n");
+		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get gpio 'dc'\n");
 
 	if (!strcmp(id->name, "sf-tc240t-9370-t"))
 		return ili9341_dpi_probe(spi, dc, reset);
-- 
2.43.0.rc1.1336.g36b5255a03ac

