Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349B2E19D0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 09:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7976E6E8D5;
	Wed, 23 Dec 2020 08:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1F1E6E8D2;
 Wed, 23 Dec 2020 08:15:06 +0000 (UTC)
IronPort-SDR: stgcoIPThOxnAX7r/LrsfSZsiHkKbabym59nar97vgiskyBjGFDm0dnZyunxHfrXoL0VtHgfiD
 LfdBy5FCc+bQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="237541936"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="237541936"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 00:15:05 -0800
IronPort-SDR: KKAZw1iaiaQ8OkG4WzZwjHaTHr8wHr2snKovxo/xfiyCKzgIOymwIicyzA2Tmw40YP7fr1FSvk
 qh5AjCRDClsQ==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="373878273"
Received: from odonov3x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.250.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 00:15:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
Subject: [PULL] topic/dp-hdmi-2.1-pcon for drm-misc-next
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 23 Dec 2020 10:14:58 +0200
Message-ID: <87lfdpndkt.fsf@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Maarten, Maxime, and Thomas -

Here's the DP-HDMI2.1 PCON support topic pull consisting of the series
[1]. The series is split roughly 50-50 between drm helpers and i915, so
a topic branch seemed to be the right way to go.

I'll also pull this to drm-intel-next once you've merged to
drm-misc-next.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/82098/


topic/dp-hdmi-2.1-pcon-2020-12-23:
Add support for DP-HDMI2.1 PCON

From the series cover letter:

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

The following changes since commit b3bf99daaee96a141536ce5c60a0d6dba6ec1d23:

  drm/i915/display: Defer initial modeset until after GGTT is initialised (2020-11-26 11:01:52 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/topic/dp-hdmi-2.1-pcon-2020-12-23

for you to fetch changes up to 522508b665df3bbfdf40381d4e61777844b1703f:

  drm/i915/display: Let PCON convert from RGB to YCbCr if it can (2020-12-22 17:59:07 +0200)

----------------------------------------------------------------
Add support for DP-HDMI2.1 PCON

From the series cover letter:

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

----------------------------------------------------------------
Ankit Nautiyal (11):
      drm/edid: Parse DSC1.2 cap fields from HFVSDB block
      drm/dp_helper: Add Helpers for FRL Link Training support for DP-HDMI2.1 PCON
      drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon
      drm/dp_helper: Add helpers to configure PCONs RGB-YCbCr Conversion
      drm/i915: Capture max frl rate for PCON in dfp cap structure
      drm/i915: Add support for starting FRL training for HDMI2.1 via PCON
      drm/i915: Check for FRL training before DP Link training
      drm/i915: Read DSC capabilities of the HDMI2.1 PCON encoder
      drm/i915: Add helper functions for calculating DSC parameters for HDMI2.1
      drm/i915/display: Configure PCON for DSC1.1 to DSC1.2 encoding
      drm/i915/display: Let PCON convert from RGB to YCbCr if it can

Swati Sharma (4):
      drm/edid: Add additional HFVSDB fields for HDMI2.1
      drm/edid: Parse MAX_FRL field from HFVSDB block
      drm/dp_helper: Add support for link failure detection
      drm/i915: Add support for enabling link status and recovery

 drivers/gpu/drm/drm_dp_helper.c                    | 566 +++++++++++++++++++++
 drivers/gpu/drm/drm_edid.c                         | 103 ++++
 drivers/gpu/drm/i915/display/intel_ddi.c           |   6 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |  10 +
 drivers/gpu/drm/i915/display/intel_dp.c            | 440 +++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h            |   7 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c          | 233 +++++++++
 drivers/gpu/drm/i915/display/intel_hdmi.h          |   7 +
 include/drm/drm_connector.h                        |  49 ++
 include/drm/drm_dp_helper.h                        | 218 ++++++++
 include/drm/drm_edid.h                             |  30 ++
 11 files changed, 1650 insertions(+), 19 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
