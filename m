Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EB2356DF9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 15:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFACC6E914;
	Wed,  7 Apr 2021 13:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BCD6E90F;
 Wed,  7 Apr 2021 13:57:42 +0000 (UTC)
IronPort-SDR: 4dnF6t1DnKUB/IrNQBrLUQc3lEBcFXcLS24bzy+Pz2iiOlR0HaWeb9PXf5S3z7ucv5vGPRb+fV
 aACuyICUqigQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="257297312"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="257297312"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 06:57:42 -0700
IronPort-SDR: 6e/g5NI4cf94yXyT50CGZBQagCUa1fwj3J1O+bCmD1LytEy0mg3/eCnJijwka626GZ6cdVFHDn
 sV+47szdOoWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="381331043"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 07 Apr 2021 06:57:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 07 Apr 2021 16:57:36 +0300
Date: Wed, 7 Apr 2021 16:57:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] drm/i915/display/vlv_dsi: Do not skip
 panel_pwr_cycle_delay when disabling the panel
Message-ID: <YG26UEx8XI5vX3P0@intel.com>
References: <20210325114823.44922-1-hdegoede@redhat.com>
 <9cb6711d-d183-79d4-dfc1-d932b8c8fcab@redhat.com>
 <YG2mzs+/wZ5cH+7M@intel.com>
 <5f54a568-c81a-a54c-cbaf-2c111269c046@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f54a568-c81a-a54c-cbaf-2c111269c046@redhat.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 07, 2021 at 03:50:35PM +0200, Hans de Goede wrote:
> Hi,
> =

> On 4/7/21 2:34 PM, Ville Syrj=E4l=E4 wrote:
> > On Tue, Apr 06, 2021 at 03:57:32PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 3/25/21 12:48 PM, Hans de Goede wrote:
> >>> After the recently added commit fe0f1e3bfdfe ("drm/i915: Shut down
> >>> displays gracefully on reboot"), the DSI panel on a Cherry Trail based
> >>> Predia Basic tablet would no longer properly light up after reboot.
> >>>
> >>> I've managed to reproduce this without rebooting by doing:
> >>> chvt 3; echo 1 > /sys/class/graphics/fb0/blank;\
> >>> echo 0 > /sys/class/graphics/fb0/blank
> >>>
> >>> Which rapidly turns the panel off and back on again.
> >>>
> >>> The vlv_dsi.c code uses an intel_dsi_msleep() helper for the various =
delays
> >>> used for panel on/off, since starting with MIPI-sequences version >=
=3D 3 the
> >>> delays are already included inside the MIPI-sequences.
> >>>
> >>> The problems exposed by the "Shut down displays gracefully on reboot"
> >>> change, show that using this helper for the panel_pwr_cycle_delay is
> >>> not the right thing to do. This has not been noticed until now because
> >>> normally the panel never is cycled off and directly on again in quick
> >>> succession.
> >>>
> >>> Change the msleep for the panel_pwr_cycle_delay to a normal msleep()
> >>> call to avoid the panel staying black after a quick off + on cycle.
> >>>
> >>> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >>> Fixes: fe0f1e3bfdfe ("drm/i915: Shut down displays gracefully on rebo=
ot")
> >>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>
> >> Ping? Ville AFAICT this is ready for merging, can you review this plea=
se so that I can push it to drm-intel-next ?
> > =

> > Didn't get the original mail, but lgtm.
> =

> Yeah, these bounced I mentioned that in a p.s. in one of the emails
> in our private threads about the mail issues, with patchwork links,
> but I guess the p.s. was hidden in all the other stuff in that thread.
> Anyways this is solved now.
> =

> > Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Thank you, note this is patch 1/2 does the Reviewed-by apply to
> both?  Patch 2/2 is here:
> =

> https://patchwork.freedesktop.org/patch/425983/

That one looks good as well.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> =

> Regards,
> =

> Hans
> =

> =

> =

> =

> >>> ---
> >>>  drivers/gpu/drm/i915/display/vlv_dsi.c | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm=
/i915/display/vlv_dsi.c
> >>> index d5a3f69c5df3..38d5a1f3ded5 100644
> >>> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> >>> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> >>> @@ -996,14 +996,14 @@ static void intel_dsi_post_disable(struct intel=
_atomic_state *state,
> >>>  	 * FIXME As we do with eDP, just make a note of the time here
> >>>  	 * and perform the wait before the next panel power on.
> >>>  	 */
> >>> -	intel_dsi_msleep(intel_dsi, intel_dsi->panel_pwr_cycle_delay);
> >>> +	msleep(intel_dsi->panel_pwr_cycle_delay);
> >>>  }
> >>>  =

> >>>  static void intel_dsi_shutdown(struct intel_encoder *encoder)
> >>>  {
> >>>  	struct intel_dsi *intel_dsi =3D enc_to_intel_dsi(encoder);
> >>>  =

> >>> -	intel_dsi_msleep(intel_dsi, intel_dsi->panel_pwr_cycle_delay);
> >>> +	msleep(intel_dsi->panel_pwr_cycle_delay);
> >>>  }
> >>>  =

> >>>  static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
> >>>
> > =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
