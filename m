Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D5D0EF1A
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 14:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D82C10E199;
	Sun, 11 Jan 2026 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id2WHOKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90A810E199
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768136494; x=1799672494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ar3w+zP3BNu5p9Gay7suEUUELjCBrbv6SWUGjVBJaHs=;
 b=id2WHOKtdnsQQAV2oYAYMCwbM/NPiKJhhT9ruikAOsGZbd9b2T50ESwX
 Ml9T4j7cFBrdpDiXE+mePP46/M8byFz1zC7dU2BWQrT0ZMcmFtwglLkWl
 qgRkvX9Hv7PgyUFqYB9ehAgtwjyWthuGwQjKAoKW5FUaV/QjXG8KTGmMK
 ufg2uUpAdcU9tqMgUplRY8HADd9MfmEsd5zbf0SLBtNDbOdlxpEhHscJm
 2K4KcznPc/Q0e/+Z+Hj69VfDEetUdL7EdpOc7TG9WnJ+fQDqfdsZ5i0aP
 dCxfILXZNk/jpsiMuD3vpV8HExk81g1aScAgbrgWStaIWJLH2bxDkpeTp Q==;
X-CSE-ConnectionGUID: xOd80VAsSc2/f46l+H/UXA==
X-CSE-MsgGUID: 3DEvNtKrTIOFHgYIfVEr9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="69513028"
X-IronPort-AV: E=Sophos;i="6.21,218,1763452800"; d="scan'208";a="69513028"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 05:01:33 -0800
X-CSE-ConnectionGUID: rRnzYx2kSSWLjPc8aVBO6A==
X-CSE-MsgGUID: DNRK7mTmQ8uNVun56+wzJw==
X-ExtLoop1: 1
Received: from unknown (HELO junjie-NUC14RVS.bj.intel.com) ([10.238.152.92])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2026 05:01:31 -0800
From: Junjie Cao <junjie.cao@intel.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, caojunjie650@gmail.com,
 Junjie Cao <junjie.cao@intel.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] backlight: aw99706: Fix build errors caused by wrong gpio
 header
Date: Sun, 11 Jan 2026 21:01:17 +0800
Message-ID: <20260111130117.5041-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
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

The driver uses GPIO descriptor API (devm_gpiod_get,
gpiod_set_value_cansleep, GPIOD_OUT_LOW) but includes the legacy
<linux/gpio.h> header instead of <linux/gpio/consumer.h>.

When CONFIG_GPIOLIB is not set, <linux/gpio.h> does not include
<linux/gpio/consumer.h>, causing build errors:

  error: implicit declaration of function 'gpiod_set_value_cansleep'
  error: implicit declaration of function 'devm_gpiod_get'
  error: 'GPIOD_OUT_LOW' undeclared

Fix by including the correct header <linux/gpio/consumer.h>.

Fixes: 147b38a5ad06 ("backlight: aw99706: Add support for Awinic AW99706 backlight")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512171631.uKXlYwqu-lkp@intel.com/
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
 drivers/video/backlight/aw99706.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
index df5b23b2f753..938f352aaab7 100644
--- a/drivers/video/backlight/aw99706.c
+++ b/drivers/video/backlight/aw99706.c
@@ -12,7 +12,7 @@
 #include <linux/backlight.h>
 #include <linux/bitfield.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.43.0

