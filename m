Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 289204B48CD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4010E2E3;
	Mon, 14 Feb 2022 10:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B200D10E2E2;
 Mon, 14 Feb 2022 10:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644832877; x=1676368877;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hbA9JlLdvAAfcjPpN7hWCsFwxF/9P4dYQRZD/kcGy2U=;
 b=e6UQjpI9W6sIy7VovSYtOs50RQuez3fhWIx1Lll5Z1wS5EkvFSWpVQ/g
 KXuiO0kZxhx3xPXJGWe6GDZU8P8Bj9OHmUYkOjLvPfZQ7kuBC92B5+tbF
 SctwbfJrLGdFpXphNW/mc39WPWPzMOSS9YPys8rkY+ZvGxUz0kcfwS1B8
 6/wU1tfB2OPL7x0lpVC6JR+oTwcYnbChiuwP2xgahIkfPsczJqaTnHROx
 Wni9TRG7H9geSiEeqc1QTqqFNiYsUQ6skq1fWcYMeOffyyJInM/slx3V0
 c5GLhVSbWpfFJiTMLjj/HoAN+fmmgRz7e9raCDIXjHTwzuttF/OldxIB9 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="274628529"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="274628529"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:01:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="543383125"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:01:14 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v2 0/5] Add data flow metering support for HDMI2.1
Date: Mon, 14 Feb 2022 07:33:52 +0530
Message-Id: <20220214020357.10063-1-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The below patches add support for data flow metering
as mentioned in the section 6.5.6 FRL data flow metering
of HDMI 2.1 specification.

Add functions to calclulate the DFM parameters
for the given frl config, which is further used to evaluate the
data flow metering requirement as specified in the spec.

As per the spec the below patches implement the frl capacity computation
functions for both compressed and uncompressed video.
Finally exposing 1 function each for compressed and uncompressed video
to figure out if the data flow metering requirement is met or not.

v2: Changed u32 to unsigned int, corrected patch 4 to address build
issue, addressed checkpatch issues, moved the drm_frl_dfm_helper under
kms_helpers section for compilation in the Makefile.

Ankit Nautiyal (1):
  drm/hdmi21: Add support for DFM calculation with DSC

Vandita Kulkarni (4):
  drm/hdmi21: Define frl_dfm structure
  drm/hdmi21: Add non dsc frl capacity computation helpers
  drm/hdmi21: Add helpers to verify non-dsc DFM requirements
  drm/hdmi21: Add frl_dfm_helper to Makefile

 drivers/gpu/drm/Makefile             |   4 +-
 drivers/gpu/drm/drm_frl_dfm_helper.c | 854 +++++++++++++++++++++++++++
 include/drm/drm_frl_dfm_helper.h     | 129 ++++
 3 files changed, 986 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_frl_dfm_helper.c
 create mode 100644 include/drm/drm_frl_dfm_helper.h

-- 
2.32.0

