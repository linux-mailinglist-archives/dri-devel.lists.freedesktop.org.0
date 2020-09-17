Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F80826E37B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 20:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B202A6EC70;
	Thu, 17 Sep 2020 18:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B756EC65;
 Thu, 17 Sep 2020 18:25:42 +0000 (UTC)
IronPort-SDR: qBqrzP1ft7D8LV20AajU+07sM4w/HE4jcnRJZVBKheSVU1PvRTk758gPnfC9GK4R2yVNBMNcJm
 Gcygqaar9ApQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="147513345"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="147513345"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 11:25:40 -0700
IronPort-SDR: 0MU/L3WiEAPXHeCBncpghtt2DA820Q9WuJRKZP00bpui4njk2Nt9PzpclzkKqYuKTfkupvVbLj
 NXRvnlqHpe+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="410021995"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 17 Sep 2020 11:25:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 17 Sep 2020 21:25:35 +0300
Date: Thu, 17 Sep 2020 21:25:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Puthikorn Voravootivat <puthik@chromium.org>
Subject: Re: [PATCH] i915: Introduce quirk for shifting eDP brightness.
Message-ID: <20200917182535.GC6112@intel.com>
References: <20200917110838.1.I63d52f5b96d7e81e1e2dc2a72c4bf5fd84d3d3d0@changeid>
 <87o8m4uxcn.fsf@intel.com>
 <CANM=9DOn9wvL1RBDhxzawY1rRq0PFUBmKdXUGmG1CygApK1Vyg@mail.gmail.com>
 <CANCcNXc18jEXF+wdLm8sxR3ySR88D8S65a2x_vYtR5ihZ6XnMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANCcNXc18jEXF+wdLm8sxR3ySR88D8S65a2x_vYtR5ihZ6XnMw@mail.gmail.com>
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
Cc: Kevin Chowski <chowski@chromium.org>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 11:14:43AM -0700, Puthikorn Voravootivat wrote:
> The Lyude fde7266fb2f6 change is actually based on Chromium change
> (https://crrev.com/c/1650325) that fixes the brightness for Samsung
> Galaxy Chromebook. So currently we have 2 examples that use LSB
> interpretation and 1 that use MSB.

"If field 4:0 of the EDP_PWMGEN_BIT_COUNT register represents a value
of greater than 8 and the BACKLIGHT_BRIGHTNESS_BYTE_COUNT bit
is cleared to 0, only the 8 MSB of the brightness control value can be
controlled.
(See Note below.)
Assigned bits are allocated to the MSB of the enabled register
combination."

I think that's pretty clear the assigned bits are supposed to be
msb aligned.

> =

> =

> On Thu, Sep 17, 2020 at 10:55 AM Kevin Chowski <chowski@chromium.org> wro=
te:
> >
> > Apologies for being too vague. To be as precise I can be, here is the
> > specific code delta I tested: https://crrev.com/c/2406616 . To answer
> > your other question, the code I tested against is indeed including the
> > fde7266fb2f6 (despite ostensibly being called 5.4 in my commit
> > message): our current top-of-tree for our 5.4 branch includes the
> > intel_dp_aux_calc_max_backlight logic. Further, I'll note that change
> > is exactly the change which breaks my Pixelbook model: prior to the
> > change, the max_brightness was hard-coded to 0xFFFF and the math
> > worked out that it didn't matter that the hardware cared about the MSB
> > despite the driver code caring about the LSB.
> >
> > To answer Ville's question: the fde7266fb2f6 change which fixes one
> > laptop (I believe Thinkpad X1 extreme Gen 2, from some bug reports I
> > dug up) and breaks another (Pixelbook); so unfortunately I believe we
> > need a quirk at least for some laptop. Reading through the copy of the
> > datasheet I have, it wasn't clear to me which was the correct
> > interpretation. I'm cc'ing puthik@, who was leaning toward the current
> > kernel code (caring about LSB) being the correct interpretation. I
> > believe we have other chromebooks which do rely on LSB functionality,
> > so unless we can find more examples of laptops wanting MSB it
> > currently looks like Pixelbook is the outlier.
> >
> > On Thu, Sep 17, 2020 at 11:28 AM Jani Nikula
> > <jani.nikula@linux.intel.com> wrote:
> > >
> > > On Thu, 17 Sep 2020, Kevin Chowski <chowski@chromium.org> wrote:
> > > > We have observed that Google Pixelbook's backlight hardware is
> > > > interpretting these backlight bits from the most-significant side o=
f the
> > > > 16 bit word (if DP_EDP_PWMGEN_BIT_COUNT < 16), whereas the driver c=
ode
> > > > assumes the peripheral cares about the least-significant bits.
> > > >
> > > > Testing was done from within Chrome OS's build environment when the
> > > > patch is backported to 5.4 (the version we are newly targeting for =
the
> > > > Pixelbook); for the record:
> > > >    $ emerge-eve-kernelnext sys-kernel/chromeos-kernel-5_4 && \
> > > >       ./update_kernel.sh --remote=3D$IP
> > > >
> > > > I used `/sys/kernel/debug/dri/0/eDP-1/i915_dpcd` on my laptop to ve=
rify
> > > > that the registers were being set according to what the actual hard=
ware
> > > > expects; I also observe that the backlight is noticeably brighter w=
ith
> > > > this patch.
> > >
> > > It's unclear to me what kernel version this is against, and what you'=
ve
> > > actually tested.
> > >
> > > Have you tried v5.7 kernel with Lyude's fde7266fb2f6 ("drm/i915: Fix =
eDP
> > > DPCD aux max backlight calculations")?
> > >
> > > I just want to make sure you've tested with all the relevant fixes
> > > before adding quirks.
> > >
> > > BR,
> > > Jani.
> > >
> > > >
> > > > Signed-off-by: Kevin Chowski <chowski@chromium.org>
> > > > ---
> > > >
> > > >  .../drm/i915/display/intel_dp_aux_backlight.c | 34 +++++++++++++++=
++++
> > > >  drivers/gpu/drm/i915/display/intel_quirks.c   | 13 +++++++
> > > >  drivers/gpu/drm/i915/i915_drv.h               |  1 +
> > > >  3 files changed, 48 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c =
b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > index acbd7eb66cbe3..99c98f217356d 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > @@ -91,6 +91,23 @@ static u32 intel_dp_aux_get_backlight(struct int=
el_connector *connector)
> > > >       if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_=
COUNT)
> > > >               level =3D (read_val[0] << 8 | read_val[1]);
> > > >
> > > > +     if (i915->quirks & QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS) {
> > > > +             if (!drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_=
BIT_COUNT,
> > > > +                                             &read_val[0])) {
> > > > +                     DRM_DEBUG_KMS("Failed to read DPCD register 0=
x%x\n",
> > > > +                                     DP_EDP_PWMGEN_BIT_COUNT);
> > > > +                     return 0;
> > > > +             }
> > > > +             // Only bits 4:0 are used, 7:5 are reserved.
> > > > +             read_val[0] =3D read_val[0] & 0x1F;
> > > > +             if (read_val[0] > 16) {
> > > > +                     DRM_DEBUG_KMS("Invalid DP_EDP_PWNGEN_BIT_COUN=
T 0x%X, expected at most 16\n",
> > > > +                                             read_val[0]);
> > > > +                     return 0;
> > > > +             }
> > > > +             level >>=3D 16 - read_val[0];
> > > > +     }
> > > > +
> > > >       return level;
> > > >  }
> > > >
> > > > @@ -106,6 +123,23 @@ intel_dp_aux_set_backlight(const struct drm_co=
nnector_state *conn_state, u32 lev
> > > >       struct drm_i915_private *i915 =3D dp_to_i915(intel_dp);
> > > >       u8 vals[2] =3D { 0x0 };
> > > >
> > > > +     if (i915->quirks & QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS) {
> > > > +             if (!drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_=
BIT_COUNT,
> > > > +                                             &vals[0])) {
> > > > +                     DRM_DEBUG_KMS("Failed to write aux backlight =
level: Failed to read DPCD register 0x%x\n",
> > > > +                                       DP_EDP_PWMGEN_BIT_COUNT);
> > > > +                     return;
> > > > +             }
> > > > +             // Only bits 4:0 are used, 7:5 are reserved.
> > > > +             vals[0] =3D vals[0] & 0x1F;
> > > > +             if (vals[0] > 16) {
> > > > +                     DRM_DEBUG_KMS("Failed to write aux backlight =
level: Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X, expected at most 16\n",
> > > > +                                             vals[0]);
> > > > +                     return;
> > > > +             }
> > > > +             level <<=3D (16 - vals[0]) & 0xFFFF;
> > > > +     }
> > > > +
> > > >       vals[0] =3D level;
> > > >
> > > >       /* Write the MSB and/or LSB */
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/=
gpu/drm/i915/display/intel_quirks.c
> > > > index 46beb155d835f..63b27d49b2864 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> > > > @@ -53,6 +53,16 @@ static void quirk_increase_ddi_disabled_time(str=
uct drm_i915_private *i915)
> > > >       drm_info(&i915->drm, "Applying Increase DDI Disabled quirk\n"=
);
> > > >  }
> > > >
> > > > +/*
> > > > + * Some eDP backlight hardware uses the most-significant bits of t=
he brightness
> > > > + * register, so brightness values must be shifted first.
> > > > + */
> > > > +static void quirk_shift_edp_backlight_brightness(struct drm_i915_p=
rivate *i915)
> > > > +{
> > > > +     i915->quirks |=3D QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS;
> > > > +     DRM_INFO("Applying shift eDP backlight brightness quirk\n");
> > > > +}
> > > > +
> > > >  struct intel_quirk {
> > > >       int device;
> > > >       int subsystem_vendor;
> > > > @@ -156,6 +166,9 @@ static struct intel_quirk intel_quirks[] =3D {
> > > >       /* ASRock ITX*/
> > > >       { 0x3185, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
> > > >       { 0x3184, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
> > > > +
> > > > +     /* Google Pixelbook */
> > > > +     { 0x591E, 0x8086, 0x2212, quirk_shift_edp_backlight_brightnes=
s },
> > > >  };
> > > >
> > > >  void intel_init_quirks(struct drm_i915_private *i915)
> > > > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915=
/i915_drv.h
> > > > index e4f7f6518945b..cc93bede4fab8 100644
> > > > --- a/drivers/gpu/drm/i915/i915_drv.h
> > > > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > > > @@ -525,6 +525,7 @@ struct i915_psr {
> > > >  #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
> > > >  #define QUIRK_INCREASE_T12_DELAY (1<<6)
> > > >  #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
> > > > +#define QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS (1<<8)
> > > >
> > > >  struct intel_fbdev;
> > > >  struct intel_fbc_work;
> > >
> > > --
> > > Jani Nikula, Intel Open Source Graphics Center

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
