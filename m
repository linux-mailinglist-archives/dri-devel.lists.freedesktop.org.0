Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD643CAD1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194686E89B;
	Wed, 27 Oct 2021 13:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91BB6E89A;
 Wed, 27 Oct 2021 13:38:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217070595"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="217070595"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 06:38:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="447219659"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 27 Oct 2021 06:38:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 27 Oct 2021 16:38:30 +0300
Date: Wed, 27 Oct 2021 16:38:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Subject: Re: [PATCH] drm/i915: Add NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk
Message-ID: <YXlWVtnaTUEJ6yQs@intel.com>
References: <20211024155010.126275-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211024155010.126275-1-hdegoede@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 24, 2021 at 05:50:10PM +0200, Hans de Goede wrote:
> Add a NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk to fix i915 not working on
> the Xiaomi Mi Pad 2 (with CHT x5-Z8500 SoC).
> 
> The Xiaomi Mi Pad 2 uses quite an unusual hardware-design for a Cherry
> Trail tablet. It deviates from the typical reference design based tablets
> in many ways.
> 
> The Mi Pad 2 does not have any DisplayPort or HDMI outouts. I suspect that
> as part of its unusual design it also has some supply rail which is only
> used for DisplayPort or HDMI not connected.

Do we have the VBT somewhere (preferable attached to a bug report)?
Maybe we can avoid an ugly quirk.

> 
> Force-enabling the dpio-common-bc powerwell as the i915 normal does at boot
> appears to cause the P-Unit to hang. When booting with a serial-usb console
> the following errors are logged before the system freezes:
> 
>  i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fffff3ff)
>  i915 0000:00:02.0: [drm] *ERROR* Display PHY 0 is not power up

Hmm. I wonder if we're missing a clock or something...

Either of these do anything different?

--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1419,6 +1419,10 @@ static void vlv_display_power_well_init(struct drm_i915_private *dev_priv)
 	for_each_pipe(dev_priv, pipe) {
 		u32 val = intel_de_read(dev_priv, DPLL(pipe));
 
+		val |= DPLL_SSC_REF_CLK_CHV;
		or
+		val &= ~DPLL_SSC_REF_CLK_CHV;

 		val |= DPLL_REF_CLK_ENABLE_VLV | DPLL_VGA_MODE_DIS;
 		if (pipe != PIPE_A)
 			val |= DPLL_INTEGRATED_CRI_CLK_VLV;

-- 
Ville Syrjälä
Intel
