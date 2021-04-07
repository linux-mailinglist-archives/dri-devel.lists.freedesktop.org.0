Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F4356C30
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 14:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BF76E158;
	Wed,  7 Apr 2021 12:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69626E0EF;
 Wed,  7 Apr 2021 12:34:26 +0000 (UTC)
IronPort-SDR: t9Kzn5WAR+5A49m4kPs8StDOGdjuZTK6Vom6ay1lNfihOhYzXYQp4yIsLJ/rpoEArtT+wi/Flc
 90/UKkROTuyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="180840427"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="180840427"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 05:34:26 -0700
IronPort-SDR: DcNbVi99Nvwzbg3ivl40lPH1+F+yl9TNWmx4msit5BrabI+DC4BtOpxdEhC0N3zjBbNpsDp6tr
 UggNxwglfWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="396648311"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 07 Apr 2021 05:34:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 07 Apr 2021 15:34:22 +0300
Date: Wed, 7 Apr 2021 15:34:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] drm/i915/display/vlv_dsi: Do not skip
 panel_pwr_cycle_delay when disabling the panel
Message-ID: <YG2mzs+/wZ5cH+7M@intel.com>
References: <20210325114823.44922-1-hdegoede@redhat.com>
 <9cb6711d-d183-79d4-dfc1-d932b8c8fcab@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9cb6711d-d183-79d4-dfc1-d932b8c8fcab@redhat.com>
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

On Tue, Apr 06, 2021 at 03:57:32PM +0200, Hans de Goede wrote:
> Hi,
> =

> On 3/25/21 12:48 PM, Hans de Goede wrote:
> > After the recently added commit fe0f1e3bfdfe ("drm/i915: Shut down
> > displays gracefully on reboot"), the DSI panel on a Cherry Trail based
> > Predia Basic tablet would no longer properly light up after reboot.
> > =

> > I've managed to reproduce this without rebooting by doing:
> > chvt 3; echo 1 > /sys/class/graphics/fb0/blank;\
> > echo 0 > /sys/class/graphics/fb0/blank
> > =

> > Which rapidly turns the panel off and back on again.
> > =

> > The vlv_dsi.c code uses an intel_dsi_msleep() helper for the various de=
lays
> > used for panel on/off, since starting with MIPI-sequences version >=3D =
3 the
> > delays are already included inside the MIPI-sequences.
> > =

> > The problems exposed by the "Shut down displays gracefully on reboot"
> > change, show that using this helper for the panel_pwr_cycle_delay is
> > not the right thing to do. This has not been noticed until now because
> > normally the panel never is cycled off and directly on again in quick
> > succession.
> > =

> > Change the msleep for the panel_pwr_cycle_delay to a normal msleep()
> > call to avoid the panel staying black after a quick off + on cycle.
> > =

> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Fixes: fe0f1e3bfdfe ("drm/i915: Shut down displays gracefully on reboot=
")
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> =

> Ping? Ville AFAICT this is ready for merging, can you review this please =
so that I can push it to drm-intel-next ?

Didn't get the original mail, but lgtm.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> =

> Regards,
> =

> Hans
> =

> =

> > ---
> >  drivers/gpu/drm/i915/display/vlv_dsi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i=
915/display/vlv_dsi.c
> > index d5a3f69c5df3..38d5a1f3ded5 100644
> > --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> > +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> > @@ -996,14 +996,14 @@ static void intel_dsi_post_disable(struct intel_a=
tomic_state *state,
> >  	 * FIXME As we do with eDP, just make a note of the time here
> >  	 * and perform the wait before the next panel power on.
> >  	 */
> > -	intel_dsi_msleep(intel_dsi, intel_dsi->panel_pwr_cycle_delay);
> > +	msleep(intel_dsi->panel_pwr_cycle_delay);
> >  }
> >  =

> >  static void intel_dsi_shutdown(struct intel_encoder *encoder)
> >  {
> >  	struct intel_dsi *intel_dsi =3D enc_to_intel_dsi(encoder);
> >  =

> > -	intel_dsi_msleep(intel_dsi, intel_dsi->panel_pwr_cycle_delay);
> > +	msleep(intel_dsi->panel_pwr_cycle_delay);
> >  }
> >  =

> >  static bool intel_dsi_get_hw_state(struct intel_encoder *encoder,
> > =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
