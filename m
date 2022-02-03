Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED54A857D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB05C10F923;
	Thu,  3 Feb 2022 13:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A20910F91B;
 Thu,  3 Feb 2022 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643896072; x=1675432072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/FZGd9cmiCp7OJRyM77N3x0R7uI3kFfOCn2FKl5GQ7Q=;
 b=BjHkoKB1DuSbELDdymJenKvCrN/j49QAWzY+/LgeDD71QC3h7pp8u3il
 jjyFKaf/MFsISLeKTYJE2KLgn5SeSCgL+V+LqvhFMyIfVavaM39sObxNo
 YKIUSdwtJxe/aL7E0z71KoNcdeRMw8FZtwhCuE/TJjrupQr1oG2i/6fiv
 RvnzJbkFL//dc+9I4MBlR8FeoFXeOQkUe1BnYUt7k03hxbEsbgBSHj+yE
 sycaVL07fGgVSsz2mOTVmnII32xd8H5HHEiQ/d2Fl1iJUYwIFKQR22He1
 4cHOo9Ugj9yyby/iwRIKH2XVrxXr+ulqYoTzCB12TTsvxMqBXBjTc7gZA g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="308872253"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="308872253"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="583793056"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:26 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/5] Add data flow metering support for HDMI2.1
Date: Thu,  3 Feb 2022 11:20:07 +0530
Message-Id: <20220203055012.14568-1-vandita.kulkarni@intel.com>
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
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

Ankit Nautiyal (1):
  drm/hdmi21: Add support for DFM calculation with DSC

Vandita Kulkarni (4):
  drm/hdmi21: Define frl_dfm structure
  drm/hdmi21: Add non dsc frl capacity computation helpers
  drm/hdmi21: Add helpers to verify non-dsc DFM requirements
  drm/hdmi21: Add frl_dfm_helper to Makefile

 drivers/gpu/drm/Makefile             |   2 +-
 drivers/gpu/drm/drm_frl_dfm_helper.c | 855 +++++++++++++++++++++++++++
 include/drm/drm_frl_dfm_helper.h     | 131 ++++
 3 files changed, 987 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_frl_dfm_helper.c
 create mode 100644 include/drm/drm_frl_dfm_helper.h

-- 
2.32.0

