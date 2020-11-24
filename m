Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25372C2BC1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 16:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F05A6E453;
	Tue, 24 Nov 2020 15:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA6A6E453;
 Tue, 24 Nov 2020 15:50:00 +0000 (UTC)
IronPort-SDR: cpWCsGQbS1whqsGj6vyzbub8msXDVRNgVOoqmFDw6vjs+MYvPcxWdXgVrrLtArBHUS+aIQ19eS
 DqwYnftCMZQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151806768"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="151806768"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 07:50:00 -0800
IronPort-SDR: uukol10vZ3/84iSGEtI/4Ge+knvbmS2AgzM3MY6bD35NlsfndOW9MvSf5MzVeic0H2R4KpKub1
 hUX86Mgn8JJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="332602260"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 24 Nov 2020 07:49:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Nov 2020 17:49:56 +0200
Date: Tue, 24 Nov 2020 17:49:56 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] drm/i915/dsi: Use unconditional msleep for the
 panel_on_delay when there is no reset-deassert MIPI-sequence
Message-ID: <20201124154956.GL6112@intel.com>
References: <20201118124058.26021-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118124058.26021-1-hdegoede@redhat.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 01:40:58PM +0100, Hans de Goede wrote:
> Commit 25b4620ee822 ("drm/i915/dsi: Skip delays for v3 VBTs in vid-mode")
> added an intel_dsi_msleep() helper which skips sleeping if the
> MIPI-sequences have a version of 3 or newer and the panel is in vid-mode;
> and it moved a bunch of msleep-s over to this new helper.
> =

> This was based on my reading of the big comment around line 730 which
> starts with "Panel enable/disable sequences from the VBT spec.",
> where the "v3 video mode seq" column does not have any wait t# entries.
> =

> Given that this code has been used on a lot of different devices without
> issues until now, it seems that my interpretation of the spec here is
> mostly correct.
> =

> But now I have encountered one device, an Acer Aspire Switch 10 E
> SW3-016, where the panel will not light up unless we do actually honor the
> panel_on_delay after exexuting the MIPI_SEQ_PANEL_ON sequence.
> =

> What seems to set this model apart is that it is lacking a
> MIPI_SEQ_DEASSERT_RESET sequence, which is where the power-on
> delay usually happens.
> =

> Fix the panel not lighting up on this model by using an unconditional
> msleep(panel_on_delay) instead of intel_dsi_msleep() when there is
> no MIPI_SEQ_DEASSERT_RESET sequence.
> =

> Fixes: 25b4620ee822 ("drm/i915/dsi: Skip delays for v3 VBTs in vid-mode")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i91=
5/display/vlv_dsi.c
> index 194c239ab6b1..ef673277b36d 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -816,10 +816,14 @@ static void intel_dsi_pre_enable(struct intel_atomi=
c_state *state,
>  		intel_dsi_prepare(encoder, pipe_config);
>  =

>  	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_POWER_ON);
> -	intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
>  =

> -	/* Deassert reset */
> -	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_DEASSERT_RESET);
> +	if (dev_priv->vbt.dsi.sequence[MIPI_SEQ_DEASSERT_RESET]) {
> +		intel_dsi_msleep(intel_dsi, intel_dsi->panel_on_delay);
> +		/* Deassert reset */
> +		intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_DEASSERT_RESET);
> +	} else {
> +		msleep(intel_dsi->panel_on_delay);
> +	}

Could perhaps use a comment ot explain to the reader what's going on.

Looks sane enough to me, and if we get this wrong we just get a bigger
delay than necessary I guess. So mostly harmless.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  =

>  	if (IS_GEMINILAKE(dev_priv)) {
>  		glk_cold_boot =3D glk_dsi_enable_io(encoder);
> -- =

> 2.28.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
