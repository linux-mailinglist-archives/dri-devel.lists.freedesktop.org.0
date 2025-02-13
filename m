Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD1A34D9B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85F410EB72;
	Thu, 13 Feb 2025 18:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N530O3Jm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC30410EB6C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739471140; x=1771007140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k7ua/KFoZaBYMvO6Q/O+0QUvgRzL0DRgto7N8H41V7g=;
 b=N530O3JmXoChO0hkLgp1XVLSZkYuQ38m5y4ITJnT35SEXyNdvMDgu+bT
 4iRkobkSV+yUI/q24BzpjQTIyYdgrVvdBtjdw0TWVN38WdGles2+Dz1/a
 z6u/BoZzOnbxzdH1fOZxAHlC7OrTKTWkpE97Ni272WCysOwH/eWwv8Cdf
 cqknx/el8moXUkiMFFrmbMSZlvxCxK7LnECrBr3VMiWLpdSS0J/JzZkv+
 ZK5cYPxNcxndfUZpZipZKSCAgFKMnTOrYjR7MeL/kNuqOd/Y4JRedlaEF
 K3Xoi8BC+vIoV6rxhbNNLpUcTcvKX5yCSpakYKjbiF2ub7XyLRjBIbjlC Q==;
X-CSE-ConnectionGUID: rD7ia4RyQceASbqNERJDMQ==
X-CSE-MsgGUID: 6k3qBaD5QrOQr6xM5Pow3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51177660"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="51177660"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:25:35 -0800
X-CSE-ConnectionGUID: 2w/+92TyT6SEWaUrBCUo0A==
X-CSE-MsgGUID: O+bpjhxARyus70Sw3d5X/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113721778"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP; 13 Feb 2025 10:25:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 1BE642CA; Thu, 13 Feb 2025 20:25:29 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Alexandru Ardelean <aardelean@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/2] gpiolib: Switch to use for_each_if() helper
Date: Thu, 13 Feb 2025 20:24:01 +0200
Message-ID: <20250213182527.3092371-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
In-Reply-To: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
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

The for_each_*() APIs that are conditional can be written shorter and
less error prone with for_each_if() helper in use. Switch them to use
this helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/gpio/driver.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index ae93f75170f2..af046f7fd4f5 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -14,6 +14,7 @@
 #include <linux/property.h>
 #include <linux/spinlock_types.h>
 #include <linux/types.h>
+#include <linux/util_macros.h>
 
 #ifdef CONFIG_GENERIC_MSI_IRQ
 #include <asm/msi.h>
@@ -561,7 +562,7 @@ DEFINE_CLASS(_gpiochip_for_each_data,
 	for (CLASS(_gpiochip_for_each_data, _data)(&_label, &_i);			\
 	     _i < _size;								\
 	     _i++, kfree(_label), _label = NULL)					\
-		if (IS_ERR(_label = gpiochip_dup_line_label(_chip, _base + _i))) {} else
+		for_each_if(!IS_ERR(_label = gpiochip_dup_line_label(_chip, _base + _i)))
 
 /**
  * for_each_hwgpio - Iterates over all GPIOs for given chip.
@@ -583,7 +584,7 @@ DEFINE_CLASS(_gpiochip_for_each_data,
  */
 #define for_each_requested_gpio_in_range(_chip, _i, _base, _size, _label)		\
 	for_each_hwgpio_in_range(_chip, _i, _base, _size, _label)			\
-		if (_label == NULL) {} else
+		for_each_if(_label)
 
 /* Iterates over all requested GPIO of the given @chip */
 #define for_each_requested_gpio(chip, i, label)						\
@@ -869,7 +870,7 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
 
 #define for_each_gpiochip_node(dev, child)					\
 	device_for_each_child_node(dev, child)					\
-		if (!fwnode_property_present(child, "gpio-controller")) {} else
+		for_each_if(fwnode_property_present(child, "gpio-controller"))
 
 static inline unsigned int gpiochip_node_count(struct device *dev)
 {
-- 
2.45.1.3035.g276e886db78b

