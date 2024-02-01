Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84A845ADD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D83A10EEFB;
	Thu,  1 Feb 2024 15:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCKAqLK0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224A710EEFB
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706800004; x=1738336004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gV3rpgXyCLB5Os65qh8tufSawczRz8oU+Pr448CXlGg=;
 b=MCKAqLK0RfwhPWd9iVsIcTGsaO9oEGvfEJA/Qv1Ox9Woim3mHqetGOWg
 pXcVwRX84lqROjYOyOFbLKwVu7eFvUYJT8D+24nV26eFn0hJZyuYSzZs1
 pncEkN4OFqnnpgpKh0JkYMVI3Tqzyr4xR3Vay5lmY06C8GC2sztAMYBwi
 4nHcOnwaGSXC0RtxRLWxuxUKIwpX/c+GVMYBXFFNRXSKrZ27GlXs1E/rQ
 r2ZGe655MHzYsCML/jKkCyBwwyoHroNtVlslUeQ3yZE7PDaQOP0rCJxFC
 PoG8pLaDsbBAkToJQ/EqElCUxn9jylUi843ocOcgfLvB2RV94SCFAf9a9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403525478"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="403525478"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:06:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="859168146"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="859168146"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2024 07:06:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DD39EA23; Thu,  1 Feb 2024 16:49:52 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v2 0/4] backlight: hx8357: Clean up and make OF-independent
Date: Thu,  1 Feb 2024 16:47:41 +0200
Message-ID: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
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

A few ad-hoc cleanups and one patch to make driver OF-independent.

Chagelog v2:
- renamed init to init_fn and typedef accordingly (Daniel)
- added tags (Daniel, Javier)

Andy Shevchenko (4):
  backlight: hx8357: Make use of device properties
  backlight: hx8357: Move OF table closer to its consumer
  backlight: hx8357: Make use of dev_err_probe()
  backlight: hx8357: Utilise temporary variable for struct device

 drivers/video/backlight/hx8357.c | 57 +++++++++++++++-----------------
 1 file changed, 27 insertions(+), 30 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096

