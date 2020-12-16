Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FA2DBAAC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 06:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5027489864;
	Wed, 16 Dec 2020 05:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727E98985A;
 Wed, 16 Dec 2020 05:37:32 +0000 (UTC)
IronPort-SDR: aOnCjAcypHUj/EOdm7J7Pkg694bPhBDiFE774WFHuDdYWUnf3sLaOo9Ye0Oo+1c8G0xAz85NuE
 hn0XmZfnsdcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="172437286"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="172437286"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 21:37:32 -0800
IronPort-SDR: 64Bg3jd1tY2b1rtmCh2cLo+np6Fnh690UuPPUSIx8JfQ6IlHBhYtEowRDj4BW/KHtNqMF4dt+P
 2SR44UeBqbJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="556647027"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2020 21:37:29 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 00/15] Add support for DP-HDMI2.1 PCON
Date: Wed, 16 Dec 2020 11:01:06 +0530
Message-Id: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series attempts to add support for a DP-HDMI2.1 Protocol
Convertor. The VESA spec for the HDMI2.1 PCON are proposed in Errata
E5 to DisplayPort_v2.0:
https://vesa.org/join-vesamemberships/member-downloads/?action=stamp&fileid=42299
The details are mentioned in:
VESA DP-to-HDMI PCON Specification Standalone Document
https://groups.vesa.org/wg/DP/document/15651

This series starts with adding support for FRL (Fixed Rate Link)
Training between the PCON and HDMI2.1 sink.
As per HDMI2.1 specification, a new data-channel or lane is added in
FRL mode, by repurposing the TMDS clock Channel. Through FRL, higher
bit-rate can be supported, ie. up to 12 Gbps/lane (48 Gbps over 4
lanes).

With these patches, the HDMI2.1 PCON can be configured to achieve FRL
training based on the maximum FRL rate supported by the panel, source
and the PCON.
The approach is to add the support for FRL training between PCON and
HDMI2.1 sink and gradually add other blocks for supporting higher
resolutions and other HDMI2.1 features, that can be supported by pcon
for the sources that do not natively support HDMI2.1.

This is done before the DP Link training between the source and PCON
is started. In case of FRL training is not achieved, the PCON will
work in the regular TMDS mode, without HDMI2.1 feature support.
Any interruption in FRL training between the PCON and HDMI2.1 sink is
notified through IRQ_HPD. On receiving the IRQ_HPD the concerned DPCD
registers are read and FRL training is re-attempted.

Currently, we have tested the FRL training and are able to enable 4K
display with TGL Platform + Realtek PCON RTD2173 with HDMI2.1 supporting
panel.

v2: Addressed review comments and re-organized patches as suggested in
comments on RFC patches.

v3: Addressed review comments on previous version.

v4: Added support for RGB->YCBCR conversion through PCON

v5: Addressed review comments on previous version.

Ankit Nautiyal (11):
  drm/edid: Parse DSC1.2 cap fields from HFVSDB block
  drm/dp_helper: Add Helpers for FRL Link Training support for
    DP-HDMI2.1 PCON
  drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon
  drm/dp_helper: Add helpers to configure PCONs RGB-YCbCr Conversion
  drm/i915: Capture max frl rate for PCON in dfp cap structure
  drm/i915: Add support for starting FRL training for HDMI2.1 via PCON
  drm/i915: Check for FRL training before DP Link training
  drm/i915: Read DSC capabilities of the HDMI2.1 PCON encoder
  drm/i915: Add helper functions for calculating DSC parameters for
    HDMI2.1
  drm/i915/display: Configure PCON for DSC1.1 to DSC1.2 encoding
  drm/i915/display: Let PCON convert from RGB to YUV if it can

Swati Sharma (4):
  drm/edid: Add additional HFVSDB fields for HDMI2.1
  drm/edid: Parse MAX_FRL field from HFVSDB block
  drm/dp_helper: Add support for link failure detection
  drm/i915: Add support for enabling link status and recovery

 drivers/gpu/drm/drm_dp_helper.c               | 566 ++++++++++++++++++
 drivers/gpu/drm/drm_edid.c                    | 103 ++++
 drivers/gpu/drm/i915/display/intel_ddi.c      |   6 +-
 .../drm/i915/display/intel_display_types.h    |  10 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 438 +++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   7 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 233 +++++++
 drivers/gpu/drm/i915/display/intel_hdmi.h     |   7 +
 include/drm/drm_connector.h                   |  49 ++
 include/drm/drm_dp_helper.h                   | 218 +++++++
 include/drm/drm_edid.h                        |  30 +
 11 files changed, 1645 insertions(+), 22 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
