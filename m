Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3012A61EBA7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33AE10E0B7;
	Mon,  7 Nov 2022 07:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD2610E0B7;
 Mon,  7 Nov 2022 07:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805609; x=1699341609;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8rG1EyKVqykiX6mVkyZIqYl2MfESdJMqL7sDgsnx3rg=;
 b=YHdKDecga6EF1FriX46sWMbyWv7SHfIk74cmQVwUjUVxRJ7H2QaEGeTv
 0/Rd2I5pvsTetiHvKe6E1JsSkeewzeLrdPk9+2t6qI/mBrvJiGvEseVkH
 GioJuCO9oqdMAlcNq+UcHLlTXrL5w8EImbtxaf8VywqR5UStirOrmy6jV
 z+GL9bCCVvtOV1m/ds11PfM/aJ1xl7HoXSFO9of+Q+1/hKuU9aqw1RT03
 HoTyC0XueW1YezwnQ502v4i5SU6p1iesvqFUB2RBSQMJnsebVMo9a1F9k
 5RtGHgbBIKiGLyOxTdyteiSatecg2W3SPXCHQzP09/81pxLT5u3Cj8kA7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463312"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463312"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:08 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767223"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767223"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:06 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 00/15] Add support for HDMI2.1 FRL
Date: Mon,  7 Nov 2022 12:50:30 +0530
Message-Id: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This set is RFC for adding support for HDMI2.1 FRL Link training.
FRL or Fixed Rate Link is defined by HDMI2.1 spec for supporting higher
bit-rate. As per HDMI2.1 specification, a new data-channel or lane is
added in FRL mode, by repurposing the TMDS clock Channel. This enables
HDMI to support 48 Gbps bandwidth (i.e. bit rate of 12 Gbps/lane for 4
lanes).

This series is a step for Native HDMI2.1 support for MTL and to begin
discussion on the Fixed Rate Link Training part. It adds new structures,
registers and functions for facilitating FRL training for HDMI2.1.
Basically it provides the support for starting the Link training for a
given bit rate and lane count.

The appropriate bit rate and lanes need to be computed in the compute
config phase for HDMI, for a given video-mode, which is not part of this
series, but can be built on the basic structures and new members added
in this series. The FRL Training will take place only when we take a
decision to go for FRL mode and set the crtc_state parameters
appropriately during compute config phase.

The first 2 patches are prep work to have helper for getting MAX
FRL rate for existing DP-to HDMI2.1 PCON and Native HDMI2.1 from an
older series: https://patchwork.freedesktop.org/series/99311/

As HDMI2.1 needs C20 PHY, there is dependency on patch series from
Mika: https://patchwork.freedesktop.org/series/109714/
Therefore Patch 3 which adds the C10/C20 registers, is taken from the
above series for completeness, and FRL bits are added on top of that.

Ankit Nautiyal (13):
  drm/edid: Add helper to get max FRL rate for an HDMI sink
  drm/i915/dp: Use the drm helpers for getting max FRL rate
  drm/i915/hdmi21/mtl: Add new data members for FRL configuration
  drm/drm_scdc_helper: Add SCDC helper funcs for HDMI2.1
  drm/i915/mtl: Add registers for FRL Link Training
  drm/i915/mtl: Add HDMI2.1 bits in PORT_BUF_CTL_1
  drm/i915/mtl: Add port_data/data width for TRANS_DDI_FUNC and
    DDI_BUF_CTL
  drm/i915/display/mtl: Add new members in crtc_state for FRL
    configuration
  drm/i915/display/mtl: Update Transcoder/DDI registers with the frl
    bits
  drm/i915/display/mtl: Reset FRL Transcoder config while disabling HDMI
  drm/i915/hdmi21/mtl: Enable Scrambling only for FRL mode
  drm/i915/hdmi21/mtl: Add support for sending uevent to user for FRL
    training failure
  drm/i915/display/mtl: Add functions for FRL trainining state machine

Mika Kahola (1):
  drm/i915/mtl: Create separate reg file for PICA registers

Vandita Kulkarni (1):
  drm/i915/hdmi21/mtl: Parse frl max link rate from vbt

 drivers/gpu/drm/display/drm_scdc_helper.c     | 196 ++++++++
 drivers/gpu/drm/drm_edid.c                    |  38 ++
 drivers/gpu/drm/i915/display/intel_bios.c     |  51 ++
 drivers/gpu/drm/i915/display/intel_bios.h     |   1 +
 .../gpu/drm/i915/display/intel_cx0_reg_defs.h | 144 ++++++
 drivers/gpu/drm/i915/display/intel_ddi.c      |  63 ++-
 .../drm/i915/display/intel_display_types.h    |  32 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  17 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 443 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.h     |   2 +
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |   7 +
 drivers/gpu/drm/i915/i915_reg.h               |  33 +-
 include/drm/display/drm_scdc.h                |  23 +
 include/drm/display/drm_scdc_helper.h         |  21 +
 include/drm/drm_edid.h                        |   2 +
 15 files changed, 1052 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_cx0_reg_defs.h

-- 
2.25.1

