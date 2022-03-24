Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 611194E61B4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 11:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4120B10E871;
	Thu, 24 Mar 2022 10:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE5E10E871
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648117629; x=1679653629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KwSM7CrPLiRRXVsNLiBCr4Q1U/K5rD0PcxtLtvrH9AQ=;
 b=kbhz6Nalc/pzuEB2H9btkh4Di3hb95IQ2V9QKBJhNaDeT+duxfZ2w6pK
 eHHVo6fBYyBJaEcQ22cmjkgwtKrMv84qsXDiDn38EVUoyNkkHCZS/sHJj
 cfuJsOrtCBPztCP7xip7xJogMkXKvlwMgwsLxrI7hLQRUIiSoc8O7zP8m
 EsYGOtRSTOg10UuhD1/LNL/hddTrRNuB2C/CYcdomFXIK1Pzr/FFyKNi0
 1KlS0QXYM6P2yrIrsVjlD6MDzP2YNmZs32hQ8c1/gsUeCTNpZkDCep0tG
 gZPcSUyhc/E7jfG0FQzKhgpiUb0b1kz50ajGziauY9EnYzkQmVPDxddhf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="321535380"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="321535380"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 03:27:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="552818011"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga007.fm.intel.com with SMTP; 24 Mar 2022 03:27:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 24 Mar 2022 12:27:04 +0200
Date: Thu, 24 Mar 2022 12:27:04 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v6 0/7] drm/vc4: hdmi: Yet Another Approach to HDMI YUV
 output
Message-ID: <YjxHeDOeugXLETvS@intel.com>
References: <20220222164042.403112-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222164042.403112-1-maxime@cerno.tech>
X-Patchwork-Hint: comment
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Werner Sembach <wse@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 05:40:35PM +0100, Maxime Ripard wrote:
> Hi,
> 
> This is another attempt at supporting the HDMI YUV output in the vc4 HDMI
> driver.
> 
> This is a follow-up of
> https://lore.kernel.org/dri-devel/20210317154352.732095-1-maxime@cerno.tech/
> 
> And the discussions that occured recently on the mailing lists and IRC about
> this.
> 
> The series mentioned above had multiple issues, the main one being that it was
> a bit too much complicated for what we wanted to achieve. This series is taking
> a much simpler approach with an ad-hoc solution.
> 
> I think some parts of it could still be moved to KMS helpers (notably, the
> output format enum, and the helper to set the infoframe for it) and structures
> (the output format stored in drm_connector_state). This would also interact
> nicely with the work done here:
> 
> https://lore.kernel.org/dri-devel/20211118103814.524670-1-maxime@cerno.tech/
> 
> This can come as a second step though.
> 
> The other issues with the first attempt was that nothing was reported to
> userspace about the decision we made about the format, and that this decision
> was essentially policy, without any way for the userspace to influence it.
> 
> Those two points however are being worked on by Werner in a cross-driver
> effort:
> 
> https://lore.kernel.org/dri-devel/e452775c-5b95-bbfd-e818-f1480f556336@tuxedocomputers.com/
> 
> Since it's a KMS decision, I don't think we should hold off any driver as long
> as it's consistent with what the other drivers are doing.
> 
> Let me know what you think,

High level view looks fine to me. No clue about the low level hw bits.
Acked-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> Maxime
> 
> ---
> 
> Changes from v5:
>   - Renamed pixel_rate to tmds_char_rate
>   - used do_div when necessary
>   - Used limited range YUV matrixes
>   - Rebased on current drm-misc-next
> 
> Changes from v4:
>   - Fix a clock calculation
>   - Rebased on latest drm-misc-next tag
> 
> Changes from v3:
>   - Rebased on latest next
>   - Fixed build error
> 
> Changes from v2:
>   - Rename the output format enum
>   - Split the edid_hdmi_dc_modes in two for RGB444 and YUV444
>   - Remove color_formats modifications from _parse_deep_color entirely
>   - Fixed comment formatting
>   - Fixed mode_valid that would always return true
>   - Fixed max_tmds_clock handling
> 
> Changes from v1:
>   - Fixed an EDID parsing error for YUV422
>   - Fixed the scrambling setup when using a bpc > 8
>   - Added some logging
>   - Fixed some build-bot warnings
>   - Fixed a number of HDMI specifications and EDID issues
>   - Try to max out the bpc every time
> 
> Maxime Ripard (7):
>   drm/vc4: hdmi: Rename pixel_rate variable
>   drm/vc4: hdmi: Move clock validation to its own function
>   drm/vc4: hdmi: Move clock calculation into its own function
>   drm/vc4: hdmi: Take the sink maximum TMDS clock into account
>   drm/vc4: hdmi: Take bpp into account for the scrambler
>   drm/vc4: hdmi: Always try to have the highest bpc
>   drm/vc4: hdmi: Support HDMI YUV output
> 
>  drivers/gpu/drm/vc4/vc4_hdmi.c      | 429 +++++++++++++++++++++++++---
>  drivers/gpu/drm/vc4/vc4_hdmi.h      |  23 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |   2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   6 +
>  drivers/gpu/drm/vc4/vc4_regs.h      |  16 ++
>  5 files changed, 427 insertions(+), 49 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
Ville Syrjälä
Intel
