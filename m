Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EE08B240B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 16:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6184311A4A8;
	Thu, 25 Apr 2024 14:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M57j0m8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1563511A4A6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714055232; x=1745591232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wqkixd+I8NnZZhvtO5vNvN0lkMlJWXalpNMQ17i+pvY=;
 b=M57j0m8wkPxG2rhpgM7kh6Fel3UX9OaQiqwSFD15VLrZumrkJziJfJBv
 0832vmr6PAeVsj5YADxnSp0mDYk5f/TC0wk93jHjpOYMRVwsgRi85JZQZ
 bppUoLTJQjIFBSn0prl9xChwdwuwYKzgGP/0GtlAPLdGp142MRBGtbNEP
 FKyNfPUmlFbffHnnxhNZSUfwhJnVkQXDs3tl9aw8zITjtqX7ddz+F9Kfa
 RIURuVTGpt72Cidd2oFNeyVdk7s3pDSdCerpz6aV+16LV/OwjjHMMOIK1
 zXq7pKpnZ20si8qVJ0UpZrSNpHYgnQUHzjmEAFEKrV/7zOjj7F7d7ojQT Q==;
X-CSE-ConnectionGUID: BaN4YJQlSUu4gpIdfmcrkg==
X-CSE-MsgGUID: xQpC8TW1Sa2mMlPsbY0B5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10281360"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="10281360"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:27:11 -0700
X-CSE-ConnectionGUID: l5RaI+T3Q36ko0vgLIA/hA==
X-CSE-MsgGUID: b22RoA9cQ1CL9Ir+2tJIjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="56027430"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP; 25 Apr 2024 07:27:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 1C3E079F; Thu, 25 Apr 2024 17:27:07 +0300 (EEST)
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
Subject: [PATCH v1 3/3] drm/panel: ili9341: Use predefined error codes
Date: Thu, 25 Apr 2024 17:26:19 +0300
Message-ID: <20240425142706.2440113-4-andriy.shevchenko@linux.intel.com>
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

In one case the -1 is returned which is quite confusing code for
the wrong device ID, in another the ret is returning instead of
plain 0 that also confusing as readed may ask the possible meaning
of positive codes, which are never the case there. Convert both
to use explicit predefined error codes to make it clear what's going
on there.

Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 24c74c56e564..b933380b7eb7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -422,7 +422,7 @@ static int ili9341_dpi_prepare(struct drm_panel *panel)
 
 	ili9341_dpi_init(ili);
 
-	return ret;
+	return 0;
 }
 
 static int ili9341_dpi_enable(struct drm_panel *panel)
@@ -726,7 +726,7 @@ static int ili9341_probe(struct spi_device *spi)
 	else if (!strcmp(id->name, "yx240qv29"))
 		return ili9341_dbi_probe(spi, dc, reset);
 
-	return -1;
+	return -ENODEV;
 }
 
 static void ili9341_remove(struct spi_device *spi)
-- 
2.43.0.rc1.1336.g36b5255a03ac

