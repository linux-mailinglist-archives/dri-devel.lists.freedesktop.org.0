Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36464845B48
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3610EFD6;
	Thu,  1 Feb 2024 15:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTFjCenl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E218A10EFD6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706800909; x=1738336909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wIQGdFqlY0xAMd+07bg96OAGO6sKPhtrx96e+mX0ZBE=;
 b=PTFjCenlJ2n1wDzLe6sjRlUZKZyt6YJCS1s46VquCnmdeo1Q9l4tz/5M
 P+v8fVD6JljAis4JmPGKHv5CbqWLqOJAnkEBPxqhOWsCp+RdzLfYmoh33
 RVVn5VfDAoeiLhFzHFK+PHERoYH+73aafJzb0R9E8GY62TVxusfyzLR07
 dM5YM7aRQV5veGte1hVek+8dd7ZrC5YrHE6/cuQWwyOu3Sy0bL4sIN1+5
 01UMUGbJhZwOqiRT/r7/jk27Wb2fp69Vg52HcJO73elrCKve8p74JrTmq
 DXDmtTTZb0z2PA0+F1aregQSCRAZfHKTfxFcVqeXgavyLVGsGsztuLtmQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402762451"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="402762451"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:21:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788953699"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="788953699"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 01 Feb 2024 07:21:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B8E0CBA3; Thu,  1 Feb 2024 17:15:42 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Flavio Suligoi <f.suligoi@asem.it>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF platforms
Date: Thu,  1 Feb 2024 17:14:12 +0200
Message-ID: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
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

Changelog v2:
- rename pm3309c_parse_dt_node() --> mp3309c_parse_fwnode() (Daniel)
- add tags (Daniel, Flavio)
- new patch 2

Andy Shevchenko (3):
  backlight: mp3309c: Make use of device properties
  backlight: mp3309c: use dev_err_probe() instead of dev_err()
  backlight: mp3309c: Utilise temporary variable for struct device

 drivers/video/backlight/mp3309c.c | 88 ++++++++++++-------------------
 1 file changed, 35 insertions(+), 53 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096

