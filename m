Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55646A34D99
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67F110EB6C;
	Thu, 13 Feb 2025 18:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jf0AyP2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AF110EB71
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 18:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739471140; x=1771007140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=feGGHOi3zI3MPTYTRwIv47zVrsjrDEIKTSIWX8tUD9w=;
 b=jf0AyP2BUUN13t5lMBpWk8AMKpgQCoSSHxgYNjXKsA5FIhLsii8qrDHP
 wTuAOSkcS0HDnSOdM0aVToLLUINrzFyIvNQjbLKMrbRo/N8PYD28Jalzk
 E6z1BNPCs7PJIJikBO8NVS2VnfZ7lPPARmD8NeB6ofo0FPfc8xxrE05z4
 21ip2gffmo3BRqHr0IvhVhnfSAXPz0gkfHCXl4dRIqKXKiw/g6PX3wNfZ
 Ox5adR2AtMWOTXOw4ZLB2DS9v+gRcPViic+OtBkY+sRfVAhe7NFB3S5ow
 BNSAqCRoCU7nqtCcQQsM97yVgSQGvnhXxQfxwtBdfRvh1ppJdEUHXfV5g Q==;
X-CSE-ConnectionGUID: q6t0+w0UQwq07it8pkgQiA==
X-CSE-MsgGUID: gUvUVdATREy/RijIAOkdlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51177667"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="51177667"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:25:35 -0800
X-CSE-ConnectionGUID: 2kv5/gDFTa2LCfXXmvCe7A==
X-CSE-MsgGUID: PQkSx2DlREChrWj3GYuAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113721779"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP; 13 Feb 2025 10:25:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EAC3B1FD; Thu, 13 Feb 2025 20:25:28 +0200 (EET)
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
Subject: [PATCH v2 0/2] gpiolib: Make code more robust by using for_each_if()
Date: Thu, 13 Feb 2025 20:23:59 +0200
Message-ID: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
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

Instead of opencoding with long lines, use for_each_if() macro
which makes intention clearer and less error prone.

In v2:
- moved original for_each_if() implementation to the global header (Bart)

Andy Shevchenko (2):
  drm: Move for_each_if() to util_macros.h for wider use
  gpiolib: Switch to use for_each_if() helper

 include/drm/drm_util.h      | 16 +---------------
 include/linux/gpio/driver.h |  7 ++++---
 include/linux/util_macros.h | 15 +++++++++++++++
 3 files changed, 20 insertions(+), 18 deletions(-)

-- 
2.45.1.3035.g276e886db78b

