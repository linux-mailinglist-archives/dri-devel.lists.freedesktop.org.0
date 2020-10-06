Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6C82849B5
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 11:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4109789A5E;
	Tue,  6 Oct 2020 09:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA59C89A59;
 Tue,  6 Oct 2020 09:54:30 +0000 (UTC)
IronPort-SDR: fqOop4notg6+Q0OYkUuOKA1QhVRe7QmvTfeV9XyI6acxH0uwiGhmTZiBTs/1lqoWmvq92bdABL
 jLC+hAydBvig==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="151361674"
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="151361674"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 02:54:29 -0700
IronPort-SDR: tDu8CNxhpyhE8x6p5M7KRgNXKdHw88wGXfgb9/CB+QngpOYLMlGC00lmDRz3T2q71C1rNq3IaX
 /uJhbBkokdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="342171678"
Received: from unknown (HELO linux-akn.iind.intel.com) ([10.223.34.148])
 by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2020 02:54:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 0/8] Add support for DP-HDMI2.1 PCON
Date: Tue,  6 Oct 2020 15:17:11 +0530
Message-Id: <20201006094719.24119-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org, swati2.sharma@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series attempts to add support for a DP-HDMI2.1 Protocol
Convertor. The VESA spec for the HDMI2.1 PCON are proposed in Errata
E5 to DisplayPort_v2.0:
https://vesa.org/join-vesamemberships/member-downloads/?action=stamp&fileid=42299
The details are mentioned in DP to HDMI2.1 PCON Enum/Config
improvement slide decks:
https://groups.vesa.org/wg/DP/document/folder/1316

This RFC series starts with adding support for FRL (Fixed Rate Link)
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

v2: Added patch to capture the PCON FRL caps in downstream facing port
cap structure.

Ankit Nautiyal (4):
  drm/dp_helper: Add FRL training support for a DP-HDMI2.1 PCON
  drm/i915: Capture max frl rate for PCON in dfp cap structure
  drm/i915: Add support for starting FRL training for HDMI2.1 via PCON
  drm/i915: Check for FRL training before DP Link training

Swati Sharma (4):
  drm/edid: Add additional HFVSDB fields for HDMI2.1
  drm/edid: Parse MAX_FRL field from HFVSDB block
  drm/dp_helper: Add support for link status and link recovery
  drm/i915: Add support for enabling link status and recovery

 drivers/gpu/drm/drm_dp_helper.c               | 338 ++++++++++++++++++
 drivers/gpu/drm/drm_edid.c                    |  50 +++
 drivers/gpu/drm/i915/display/intel_ddi.c      |   2 +
 .../drm/i915/display/intel_display_types.h    |   7 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 282 ++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   2 +
 include/drm/drm_connector.h                   |   6 +
 include/drm/drm_dp_helper.h                   |  96 +++++
 include/drm/drm_edid.h                        |  30 ++
 9 files changed, 808 insertions(+), 5 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
