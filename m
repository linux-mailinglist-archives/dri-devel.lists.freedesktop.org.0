Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800507CD366
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 07:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3D710E383;
	Wed, 18 Oct 2023 05:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBFB10E37E;
 Wed, 18 Oct 2023 05:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697605863; x=1729141863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z7l4GsviViNEBuJ4IMZVmWkLqK9g+LDQfyA0te/LnCI=;
 b=KLeApTb+HeVhET07mRBS0H9aAD+FjaHmCrI91UjevG/dQItzZP3mXPsF
 6Pa9vEmgTEiOabuxKw2GbgyCdLKm24SPO1WZ3ehkhuJJjBRNUz7BZfWUM
 m39oqjaiDAp303JrNyxaDxbHJOzEqW2SVWvpGwbikXW/xmW26DQIMv2zi
 5aeNPtzZnLTwjDOPGSjrUpZrOi+MJRXNrIYd14gGC32emsrNYRSo38qnh
 d7UI44HiO+X8/grZzDf6+coc14sQGlF/hxAV0tqMMkP0Ck9UUSnua20EI
 KddfPpjMLRyxN0X6zuZTfZEVfqQ6RpHr/JdiluFcfmxPYk3Ruai1tBoXY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389815359"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389815359"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 22:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="900180602"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="900180602"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2023 22:08:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7BCB4130; Wed, 18 Oct 2023 08:10:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [rft,
 PATCH v1 0/2] drm/i915/dsi: An attempt to get rid of IOSF GPIO on VLV
Date: Wed, 18 Oct 2023 08:10:50 +0300
Message-Id: <20231018051052.1328852-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
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

DSI code for VBT has a set of ugly GPIO hacks, one of which is direct
talking to GPIO IP behind the actual driver's back. An attempt to fix
that is here.

If I understood correctly, my approach should work in the similar way as
the current IOSF GPIO. 

Hans, I believe you have some devices that use this piece of code,
is it possible to give a test run on (one of) them?

Andy Shevchenko (2):
  drm/i915/dsi: Extract common soc_gpio_exec() helper
  drm/i915/dsi: Replace poking of VLV GPIOs behind the driver's back

 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 150 +++++++------------
 1 file changed, 58 insertions(+), 92 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

