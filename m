Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BB1D270F
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 08:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08C76E0D8;
	Thu, 14 May 2020 06:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F076E0D8;
 Thu, 14 May 2020 06:07:36 +0000 (UTC)
IronPort-SDR: GnOgTeEJ4YR/asU5DNJ3093DTARyovhne2/ULqCtAksC+519Y2i01YR7Q9OffvAgpuWLfwHaQJ
 LGvyx6J7zeXQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 23:07:35 -0700
IronPort-SDR: c13WEoS8ehivtoHdDnFEnqQBENThqwIRcPERvbTyEjie15kSyzl7+U4bb7RUvzRFXYzRN1PC3P
 emJgmMEIzAyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; d="scan'208";a="409956957"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.252.18.167])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:07:33 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 00/14] In order to readout DP SDPs,
 refactors the handling of DP SDPs 
Date: Thu, 14 May 2020 09:07:18 +0300
Message-Id: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to readout DP SDPs (Secondary Data Packet: DP HDR Metadata
Infoframe SDP, DP VSC SDP), it refactors handling DP SDPs codes.
It adds new compute routines for DP HDR Metadata Infoframe SDP
and DP VSC SDP. 
And new writing routines of DP SDPs (Secondary Data Packet) that uses
computed configs.
New reading routines of DP SDPs are added for readout.
It adds a logging function for DP VSC SDP.
When receiving video it is very useful to be able to log DP VSC SDP.
This greatly simplifies debugging.
In order to use a common VSC SDP Colorimetry calculating code on PSR,
it uses a new psr vsc sdp compute routine.

v2: Minor style fix
v3: 
  - Add a new drm data structure for DP VSC SDP
  - Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
  - Move logging functions to drm core [Jani N]
    And use drm core's DP VSC SDP logging function
  - Explicitly disable unused DIPs (AVI, GCP, VS, SPD, DRM. They will be
    used for HDMI), when intel_dp_set_infoframes() function will be called.
v4:
  - Use struct drm_device logging macros
  - Rebased
v5:
  - Use intel_de_*() functions for register access
  - Add warning where a bpc is 6 and a pixel format is RGB.
  - Addressed review comments from Uma
    Add kernel docs for added data structures
    Rename enum dp_colorspace to dp_pixelformat
    Polish commit message and comments
    Combine the if checks of sdp.HB2 and sdp.HB3
    Add 6bpc to packining and unpacking of VSC SDP
v6: Fix enabled infoframe states of lspcon
v7: Fix the wrong check of combination bpc 6 and RGB pixelformat
v8: Rebased
v9: Add clear comments to hdmi_drm_infoframe_unpack_only() and
    hdmi_drm_infoframe_unpack() (Laurent Pinchart)
v10:
  - Fix packing of VSC SDP where Pixel Encoding/Colorimetry Format is not
    supported
  - When a PSR is enabled, it needs to add DP_SDP_VSC to infoframes.enable.
  - Change a checking of PSR state.
  - Skip checking of VSC SDP when a crtc config has psr.
  - Rebased
v11: If PSR is disabled by flag, it don't enable psr on pipe compute
v12: Fix an inconsistent indenting

Gwan-gyeong Mun (14):
  video/hdmi: Add Unpack only function for DRM infoframe
  drm/i915/dp: Read out DP SDPs
  drm: Add logging function for DP VSC SDP
  drm/i915: Include HDMI DRM infoframe in the crtc state dump
  drm/i915: Include DP HDR Metadata Infoframe SDP in the crtc state dump
  drm/i915: Include DP VSC SDP in the crtc state dump
  drm/i915: Program DP SDPs with computed configs
  drm/i915: Add state readout for DP HDR Metadata Infoframe SDP
  drm/i915: Add state readout for DP VSC SDP
  drm/i915: Fix enabled infoframe states of lspcon
  drm/i915: Program DP SDPs on pipe updates
  drm/i915: Stop sending DP SDPs on ddi disable
  drm/i915/dp: Add compute routine for DP PSR VSC SDP
  drm/i915/psr: Use new DP VSC SDP compute routine on PSR

 drivers/gpu/drm/drm_dp_helper.c              | 174 ++++++++
 drivers/gpu/drm/i915/display/intel_ddi.c     |  19 +-
 drivers/gpu/drm/i915/display/intel_display.c |  63 +++
 drivers/gpu/drm/i915/display/intel_dp.c      | 406 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.h      |  15 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c     |  58 +--
 drivers/gpu/drm/i915/display/intel_psr.h     |   6 +-
 drivers/gpu/drm/i915/i915_drv.h              |   1 +
 drivers/video/hdmi.c                         |  65 ++-
 include/drm/drm_dp_helper.h                  |   3 +
 include/linux/hdmi.h                         |   2 +
 12 files changed, 551 insertions(+), 263 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
