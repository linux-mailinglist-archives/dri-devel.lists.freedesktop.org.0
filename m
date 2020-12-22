Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590E2E0D5E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 17:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7646E413;
	Tue, 22 Dec 2020 16:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E5F6E413;
 Tue, 22 Dec 2020 16:28:53 +0000 (UTC)
IronPort-SDR: 1HrQ7NKLr3WWdm7paX+evefkD+7PeGTyocWoMpUA9Xeo8ZPPZ4fbaLCvLdxZUh31sUZ2MOHhwW
 26ZIfdACcO2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="237452224"
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="237452224"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 08:28:52 -0800
IronPort-SDR: eJJeFWsYtBQvhD9Ms0S2XRIvqfYUEon98n2xBB2M5WuU4KRP4G/UDQtnlQtIrJm/XHAt+vM46Y
 uhn2hjjdj5ww==
X-IronPort-AV: E=Sophos;i="5.78,439,1599548400"; d="scan'208";a="373459791"
Received: from sauterhx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.229])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 08:28:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v7 00/15] Add support for DP-HDMI2.1 PCON
In-Reply-To: <20201218103723.30844-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201218103723.30844-1-ankit.k.nautiyal@intel.com>
Date: Tue, 22 Dec 2020 18:28:44 +0200
Message-ID: <87v9ctoldv.fsf@intel.com>
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
Cc: airlied@linux.ie, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, swati2.sharma@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Dec 2020, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> This patch series attempts to add support for a DP-HDMI2.1 Protocol
> Convertor. The VESA spec for the HDMI2.1 PCON are proposed in Errata
> E5 to DisplayPort_v2.0:
> https://vesa.org/join-vesamemberships/member-downloads/?action=stamp&fileid=42299
> The details are mentioned in:
> VESA DP-to-HDMI PCON Specification Standalone Document
> https://groups.vesa.org/wg/DP/document/15651

Thanks for the patches and review.

I've pushed the series to a new topic branch topic/dp-hdmi-2.1-pcon as
discussed with Maarten and Daniel a while back. I've used 'git
merge-base drm-misc/drm-misc-next drm-intel/drm-intel-next' as the base
to allow merging to both. I'll send pull requests soon, and wait for the
drm-misc-next merge before merging to i915.

BR,
Jani.



>
> This series starts with adding support for FRL (Fixed Rate Link)
> Training between the PCON and HDMI2.1 sink.
> As per HDMI2.1 specification, a new data-channel or lane is added in
> FRL mode, by repurposing the TMDS clock Channel. Through FRL, higher
> bit-rate can be supported, ie. up to 12 Gbps/lane (48 Gbps over 4
> lanes).
>
> With these patches, the HDMI2.1 PCON can be configured to achieve FRL
> training based on the maximum FRL rate supported by the panel, source
> and the PCON.
> The approach is to add the support for FRL training between PCON and
> HDMI2.1 sink and gradually add other blocks for supporting higher
> resolutions and other HDMI2.1 features, that can be supported by pcon
> for the sources that do not natively support HDMI2.1.
>
> This is done before the DP Link training between the source and PCON
> is started. In case of FRL training is not achieved, the PCON will
> work in the regular TMDS mode, without HDMI2.1 feature support.
> Any interruption in FRL training between the PCON and HDMI2.1 sink is
> notified through IRQ_HPD. On receiving the IRQ_HPD the concerned DPCD
> registers are read and FRL training is re-attempted.
>
> Currently, we have tested the FRL training and are able to enable 4K
> display with TGL Platform + Realtek PCON RTD2173 with HDMI2.1 supporting
> panel.
>
> v2: Addressed review comments and re-organized patches as suggested in
> comments on RFC patches.
>
> v3: Addressed review comments on previous version.
>
> v4: Added support for RGB->YCBCR conversion through PCON
>
> v5: Addressed review comments on previous version.
>
> v6: Fix typo in one of the patch.
>
> v7: Rebased on latest drm-tip and addressed the review comments.
>
> Ankit Nautiyal (11):
>   drm/edid: Parse DSC1.2 cap fields from HFVSDB block
>   drm/dp_helper: Add Helpers for FRL Link Training support for
>     DP-HDMI2.1 PCON
>   drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon
>   drm/dp_helper: Add helpers to configure PCONs RGB-YCbCr Conversion
>   drm/i915: Capture max frl rate for PCON in dfp cap structure
>   drm/i915: Add support for starting FRL training for HDMI2.1 via PCON
>   drm/i915: Check for FRL training before DP Link training
>   drm/i915: Read DSC capabilities of the HDMI2.1 PCON encoder
>   drm/i915: Add helper functions for calculating DSC parameters for
>     HDMI2.1
>   drm/i915/display: Configure PCON for DSC1.1 to DSC1.2 encoding
>   drm/i915/display: Let PCON convert from RGB to YCbCr if it can
>
> Swati Sharma (4):
>   drm/edid: Add additional HFVSDB fields for HDMI2.1
>   drm/edid: Parse MAX_FRL field from HFVSDB block
>   drm/dp_helper: Add support for link failure detection
>   drm/i915: Add support for enabling link status and recovery
>
>  drivers/gpu/drm/drm_dp_helper.c               | 566 ++++++++++++++++++
>  drivers/gpu/drm/drm_edid.c                    | 103 ++++
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   6 +-
>  .../drm/i915/display/intel_display_types.h    |  10 +
>  drivers/gpu/drm/i915/display/intel_dp.c       | 442 +++++++++++++-
>  drivers/gpu/drm/i915/display/intel_dp.h       |   7 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c     | 233 +++++++
>  drivers/gpu/drm/i915/display/intel_hdmi.h     |   7 +
>  include/drm/drm_connector.h                   |  49 ++
>  include/drm/drm_dp_helper.h                   | 218 +++++++
>  include/drm/drm_edid.h                        |  30 +
>  11 files changed, 1652 insertions(+), 19 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
