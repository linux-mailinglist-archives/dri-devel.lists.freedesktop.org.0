Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB41B84E7DB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 19:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6727E10E9FF;
	Thu,  8 Feb 2024 18:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eh4V5eMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DE710E9FF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707417800; x=1738953800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PVZQea4vz3DuEQPtaVt+MCdeOQtQVI09e+jW/aO8CU8=;
 b=Eh4V5eMzisr/1wKUxh1hXg9ii9Jk2PP9eANhyhVIHs6n8M9fOo9DIJd5
 NqII/REFIF0ntpI3mdalrmnxuC2tZ+VFHOA8jl4Hjc92DzCQ38jOeqntX
 xji573RDH0JwLwCU447YIPQKBsETj8yyEYa2S/SOpsTPEQ3/8gHIW3pN/
 YsJEjaibxEY4mXPWAs1kepQWhtByUUL4HIw17TYJKsFwHALZXy9QeFMdr
 rdOBlryWW5+UeA3h4qj6AvEmA7gyttZaTSdD5Z8+bb+1n+KMSQhs+A+TC
 rJFZ9FrOGEtlxGYhfhaAH1zI1QQ9RiPOWMqOApcCflHDUNzP9UG70GtlM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1184666"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1184666"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:43:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934213719"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="934213719"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2024 10:43:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 284ECE1; Thu,  8 Feb 2024 20:43:16 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Flavio Suligoi <f.suligoi@asem.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: [resend,
 PATCH v3 0/3] backlight: mp3309c: Allow to use on non-OF platforms
Date: Thu,  8 Feb 2024 20:42:25 +0200
Message-ID: <20240208184313.2224579-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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

Allow to use driver on non-OF platforms and other cleanups.

Changelog v3:
- rebased on top of the last changes against this driver (Lee)
- added tags to patch 2 (Daniel, Flavio)

Changelog v2:
- rename pm3309c_parse_dt_node() --> mp3309c_parse_fwnode() (Daniel)                                             - add tags (Daniel, Flavio)
- new patch 2

Andy Shevchenko (3):
  backlight: mp3309c: Make use of device properties
  backlight: mp3309c: use dev_err_probe() instead of dev_err()
  backlight: mp3309c: Utilise temporary variable for struct device

 drivers/video/backlight/mp3309c.c | 88 ++++++++++++-------------------
 1 file changed, 35 insertions(+), 53 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096

