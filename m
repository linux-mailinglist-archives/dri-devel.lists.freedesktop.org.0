Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF827D5778
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 18:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAD210E400;
	Tue, 24 Oct 2023 16:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18B410E3F7;
 Tue, 24 Oct 2023 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698163751; x=1729699751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7jqqEWWBGXf6MxxYFo4aSwri3S4nhJtTigEXNG+6fpQ=;
 b=A+Yrb5uhKl0boBvn/aMXZs7qmeFiuAjKKNdTGlCnYKHwhdS8gxhCqPuj
 1SfJbz/3WU29FWQrg2EWCQybRAhPSwwl3zKVb3N3ReOa4T8UW5DQ1FYDs
 TtgWRJ4KTsTUE5n8MC6Itx64RiHtjwd1UblVy4uZVwPvxdk44s5HbWTq2
 STSGC9V0r0dyoNMc/qGLUUewwWTBX/gqtpCHd/4FsGFsVAWqQ+JIWzTJs
 RIEEn/2sDIEhG6niBfbpXME4kj0uzE/yeSyJci/H8Wx+C4NEG1Rsdpdzq
 QbdNM2YA9IjJp9uEu/yhxVA4FVBS+/faJy8XeehCL7SXOndRZG08ghXgj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473328727"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="473328727"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 08:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="708354961"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="708354961"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 24 Oct 2023 08:57:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EC1F0195; Tue, 24 Oct 2023 18:57:41 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [rft, PATCH v2 0/7] drm/i915/dsi: 2nd attempt to get rid of IOSF GPIO
Date: Tue, 24 Oct 2023 18:57:32 +0300
Message-Id: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
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
talking to GPIO IP behind the actual driver's back. A second attempt
to fix that is here.

If I understood correctly, my approach should work in the similar way as
the current IOSF GPIO.

Hans, I believe you have some devices that use this piece of code,
is it possible to give a test run on (one of) them?

In v2:
- added a few cleanup patches
- reworked to use dynamic GPIO lookup tables
- converted CHV as well

Andy Shevchenko (7):
  drm/i915/dsi: Replace while(1) with one with clear exit condition
  drm/i915/dsi: Get rid of redundant 'else'
  drm/i915/dsi: Replace check with a (missing) MIPI sequence name
  drm/i915/dsi: Extract common soc_gpio_exec() helper
  drm/i915/dsi: Replace poking of VLV GPIOs behind the driver's back
  drm/i915/dsi: Replace poking of CHV GPIOs behind the driver's back
  drm/i915/iosf: Drop unused APIs

 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 260 +++++++------------
 drivers/gpu/drm/i915/vlv_sideband.c          |  17 --
 drivers/gpu/drm/i915/vlv_sideband.h          |   3 -
 3 files changed, 96 insertions(+), 184 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

