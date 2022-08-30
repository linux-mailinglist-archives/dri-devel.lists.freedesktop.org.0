Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CD5A645C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 15:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0799E10E037;
	Tue, 30 Aug 2022 13:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756F110E030;
 Tue, 30 Aug 2022 13:06:07 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MH6rN25ZCzDrg6;
 Tue, 30 Aug 2022 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1661864485; bh=Nk7sSkLdWjbvaHwlOx/XVnKITNR4n1yEk7l3jrLRub0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xgywuz6lmTAvGUs7vhxY2Loa6qW52AKr1P+aLSAV8WNCb1nXHfXLN9zA9+a7kvcGa
 C2O/Sa81vfeQTy6RT2sveyndq5X61MaAaJa/5eq5NBxrJwq9YwujDDfXL+vlXIzgY9
 6l0M5ENRY20bYDrOXr3S/kJWWAVHQHzrazjQI4Xg=
X-Riseup-User-ID: 5D5EE6516F5DE958141214263D4B3555CC47E2A84653AF835A73DC2E5E0FD65F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MH6rB0pmNz5vXJ;
 Tue, 30 Aug 2022 13:01:12 +0000 (UTC)
Message-ID: <485b38c1-517c-d3fd-c5c0-7136cbae25e2@riseup.net>
Date: Tue, 30 Aug 2022 10:01:11 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
Content-Type: text/plain; charset=UTF-8
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 8/29/22 10:11, Maxime Ripard wrote:
> Multiple drivers (meson, vc4, sun4i) define analog TV 525-lines and
> 625-lines modes in their drivers.
> 
> Since those modes are fairly standard, and that we'll need to use them
> in more places in the future, it makes sense to move their definition
> into the core framework.
> 
> However, analog display usually have fairly loose timings requirements,
> the only discrete parameters being the total number of lines and pixel
> clock frequency. Thus, we created a function that will create a display
> mode from the standard, the pixel frequency and the active area.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 304004fb80aa..ee581ee17171 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -116,6 +116,459 @@ void drm_mode_probed_add(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_mode_probed_add);
>  
> +enum drm_mode_analog {
> +	DRM_MODE_ANALOG_NTSC,
> +	DRM_MODE_ANALOG_PAL,
> +};
> +
> +/*
> + * The timings come from:
> + * - https://web.archive.org/web/20220406232708/http://www.kolumbus.fi/pami1/video/pal_ntsc.html
> + * - https://web.archive.org/web/20220406124914/http://martin.hinner.info/vga/pal.html
> + * - https://web.archive.org/web/20220609202433/http://www.batsocks.co.uk/readme/video_timing.htm
> + */
> +#define NTSC_LINE_DURATION_NS		63556U
> +#define NTSC_LINES_NUMBER		525
> +
> +#define NTSC_HBLK_DURATION_TYP_NS	10900U
> +#define NTSC_HBLK_DURATION_MIN_NS	(NTSC_HBLK_DURATION_TYP_NS - 200)
> +#define NTSC_HBLK_DURATION_MAX_NS	(NTSC_HBLK_DURATION_TYP_NS + 200)
> +
> +#define NTSC_HACT_DURATION_TYP_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_DURATION_TYP_NS)
> +#define NTSC_HACT_DURATION_MIN_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_DURATION_MAX_NS)
> +#define NTSC_HACT_DURATION_MAX_NS	(NTSC_LINE_DURATION_NS - NTSC_HBLK_DURATION_MIN_NS)
> +
> +#define NTSC_HFP_DURATION_TYP_NS	1500
> +#define NTSC_HFP_DURATION_MIN_NS	1270
> +#define NTSC_HFP_DURATION_MAX_NS	2220
> +
> +#define NTSC_HSLEN_DURATION_TYP_NS	4700
> +#define NTSC_HSLEN_DURATION_MIN_NS	(NTSC_HSLEN_DURATION_TYP_NS - 100)
> +#define NTSC_HSLEN_DURATION_MAX_NS	(NTSC_HSLEN_DURATION_TYP_NS + 100)
> +
> +#define NTSC_HBP_DURATION_TYP_NS	4700
> +
> +/*
> + * I couldn't find the actual tolerance for the back porch, so let's
> + * just reuse the sync length ones.
> + */
> +#define NTSC_HBP_DURATION_MIN_NS	(NTSC_HBP_DURATION_TYP_NS - 100)
> +#define NTSC_HBP_DURATION_MAX_NS	(NTSC_HBP_DURATION_TYP_NS + 100)
> +
> +#define PAL_LINE_DURATION_NS		64000U
> +#define PAL_LINES_NUMBER		625
> +
> +#define PAL_HACT_DURATION_TYP_NS	51950U
> +#define PAL_HACT_DURATION_MIN_NS	(PAL_HACT_DURATION_TYP_NS - 100)
> +#define PAL_HACT_DURATION_MAX_NS	(PAL_HACT_DURATION_TYP_NS + 400)
> +
> +#define PAL_HBLK_DURATION_TYP_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURATION_TYP_NS)
> +#define PAL_HBLK_DURATION_MIN_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURATION_MAX_NS)
> +#define PAL_HBLK_DURATION_MAX_NS	(PAL_LINE_DURATION_NS - PAL_HACT_DURATION_MIN_NS)
> +
> +#define PAL_HFP_DURATION_TYP_NS		1650
> +#define PAL_HFP_DURATION_MIN_NS		(PAL_HFP_DURATION_TYP_NS - 100)
> +#define PAL_HFP_DURATION_MAX_NS		(PAL_HFP_DURATION_TYP_NS + 400)
> +
> +#define PAL_HSLEN_DURATION_TYP_NS	4700
> +#define PAL_HSLEN_DURATION_MIN_NS	(PAL_HSLEN_DURATION_TYP_NS - 200)
> +#define PAL_HSLEN_DURATION_MAX_NS	(PAL_HSLEN_DURATION_TYP_NS + 200)
> +
> +#define PAL_HBP_DURATION_TYP_NS		5700
> +#define PAL_HBP_DURATION_MIN_NS		(PAL_HBP_DURATION_TYP_NS - 200)
> +#define PAL_HBP_DURATION_MAX_NS		(PAL_HBP_DURATION_TYP_NS + 200)
> +
> +#define PAL_VFP_INTERLACE_LINES		5
> +#define PAL_VSLEN_INTERLACE_LINES	5
> +
> +#define PAL_SHORT_SYNC_DURATION_NS	((2 + 30) * NSEC_PER_USEC)
> +#define PAL_LONG_SYNC_DURATION_NS	((30 + 2) * NSEC_PER_USEC)
> +
> +struct analog_param_field {
> +	unsigned int even, odd;
> +};
> +
> +#define PARAM_FIELD(_odd, _even)		\
> +	{ .even = _even, .odd = _odd }
> +
> +struct analog_param_range {
> +	unsigned int	min, typ, max;
> +};
> +
> +#define PARAM_RANGE(_min, _typ, _max)		\
> +	{ .min = _min, .typ = _typ, .max = _max }
> +
> +struct analog_parameters {
> +	unsigned int			num_lines;
> +	unsigned int			line_duration_ns;
> +
> +	struct analog_param_range	hact_ns;
> +	struct analog_param_range	hfp_ns;
> +	struct analog_param_range	hslen_ns;
> +	struct analog_param_range	hbp_ns;
> +	struct analog_param_range	hblk_ns;
> +
> +	struct analog_param_field	vfp_lines;
> +	struct analog_param_field	vslen_lines;
> +	struct analog_param_field	vbp_lines;
> +};
> +
> +#define TV_MODE_PARAMETER(_mode, _lines, _line_dur, _hact, _hfp, _hslen, _hbp, _hblk, _vfp, _vslen, _vbp) \
> +	[_mode] = {							\
> +		.num_lines = _lines,					\
> +		.line_duration_ns = _line_dur,				\
> +		.hact_ns = _hact,					\
> +		.hfp_ns = _hfp,						\
> +		.hslen_ns = _hslen,					\
> +		.hbp_ns = _hbp,						\
> +		.hblk_ns = _hblk,					\
> +		.vfp_lines = _vfp,					\
> +		.vslen_lines = _vslen,					\
> +		.vbp_lines = _vbp,					\
> +	}
> +
> +const static struct analog_parameters tv_modes_parameters[] = {
> +	TV_MODE_PARAMETER(DRM_MODE_ANALOG_NTSC,
> +			  NTSC_LINES_NUMBER,
> +			  NTSC_LINE_DURATION_NS,
> +			  PARAM_RANGE(NTSC_HACT_DURATION_MIN_NS,
> +				      NTSC_HACT_DURATION_TYP_NS,
> +				      NTSC_HACT_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HFP_DURATION_MIN_NS,
> +				      NTSC_HFP_DURATION_TYP_NS,
> +				      NTSC_HFP_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HSLEN_DURATION_MIN_NS,
> +				      NTSC_HSLEN_DURATION_TYP_NS,
> +				      NTSC_HSLEN_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HBP_DURATION_MIN_NS,
> +				      NTSC_HBP_DURATION_TYP_NS,
> +				      NTSC_HBP_DURATION_MAX_NS),
> +			  PARAM_RANGE(NTSC_HBLK_DURATION_MIN_NS,
> +				      NTSC_HBLK_DURATION_TYP_NS,
> +				      NTSC_HBLK_DURATION_MAX_NS),
> +			  PARAM_FIELD(3, 3),
> +			  PARAM_FIELD(3, 3),
> +			  PARAM_FIELD(3, 3)),
> +	TV_MODE_PARAMETER(DRM_MODE_ANALOG_PAL,
> +			  PAL_LINES_NUMBER,
> +			  PAL_LINE_DURATION_NS,
> +			  PARAM_RANGE(PAL_HACT_DURATION_MIN_NS,
> +				      PAL_HACT_DURATION_TYP_NS,
> +				      PAL_HACT_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HFP_DURATION_MIN_NS,
> +				      PAL_HFP_DURATION_TYP_NS,
> +				      PAL_HFP_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HSLEN_DURATION_MIN_NS,
> +				      PAL_HSLEN_DURATION_TYP_NS,
> +				      PAL_HSLEN_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HBP_DURATION_MIN_NS,
> +				      PAL_HBP_DURATION_TYP_NS,
> +				      PAL_HBP_DURATION_MAX_NS),
> +			  PARAM_RANGE(PAL_HBLK_DURATION_MIN_NS,
> +				      PAL_HBLK_DURATION_TYP_NS,
> +				      PAL_HBLK_DURATION_MAX_NS),
> +
> +			  /*
> +			   * The front porch is actually 6 short sync
> +			   * pulses for the even field, and 5 for the
> +			   * odd field. Each sync takes half a life so
> +			   * the odd field front porch is shorter by
> +			   * half a line.
> +			   *
> +			   * In progressive, we're supposed to use 6
> +			   * pulses, so we're fine there
> +			   */
> +			  PARAM_FIELD(3, 2),
> +
> +			  /*
> +			   * The vsync length is 5 long sync pulses,
> +			   * each field taking half a line. We're
> +			   * shorter for both fields by half a line.
> +			   *
> +			   * In progressive, we're supposed to use 5
> +			   * pulses, so we're off by half
> +			   * a line.
> +			   *
> +			   * In interlace, we're now off by half a line
> +			   * for the even field and one line for the odd
> +			   * field.
> +			   */
> +			  PARAM_FIELD(3, 3),
> +
> +			  /*
> +			   * The back porch is actually 5 short sync
> +			   * pulses for the even field, 4 for the odd
> +			   * field. In progressive, it's 5 short syncs.
> +			   *
> +			   * In progressive, we thus have 2.5 lines,
> +			   * plus the 0.5 line we were missing
> +			   * previously, so we should use 3 lines.
> +			   *
> +			   * In interlace, the even field is in the
> +			   * exact same case than progressive. For the
> +			   * odd field, we should be using 2 lines but
> +			   * we're one line short, so we'll make up for
> +			   * it here by using 3.
> +			   */
> +			  PARAM_FIELD(3, 3)),
> +};
> +
> +static int fill_analog_mode(struct drm_display_mode *mode,
> +			    const struct analog_parameters *params,
> +			    unsigned long pixel_clock_hz,
> +			    unsigned int hactive,
> +			    unsigned int vactive,
> +			    bool interlace)
> +{
> +	unsigned long pixel_duration_ns = NSEC_PER_SEC / pixel_clock_hz;
> +	unsigned long long htotal;
> +	unsigned int vtotal;
> +	unsigned int max_hact, hact_duration_ns;
> +	unsigned int hblk, hblk_duration_ns;
> +	unsigned int hfp, hfp_min, hfp_duration_ns;
> +	unsigned int hslen, hslen_duration_ns;
> +	unsigned int hbp, hbp_min, hbp_duration_ns;
> +	unsigned int porches, porches_duration_ns;
> +	unsigned int vfp, vfp_min;
> +	unsigned int vbp, vbp_min;
> +	unsigned int vslen;
> +	int porches_rem;
> +	bool strict = true;
> +
> +	max_hact = params->hact_ns.max / pixel_duration_ns;
> +	if (pixel_clock_hz == 13500000 && hactive > max_hact && hactive <= 720)
> +		strict = false;
> +
> +	/*
> +	 * Our pixel duration is going to be round down by the division,
> +	 * so rounding up is probably going to introduce even more
> +	 * deviation.
> +	 */
> +	htotal = params->line_duration_ns * pixel_clock_hz / NSEC_PER_SEC;
> +
> +	hact_duration_ns = hactive * pixel_duration_ns;
> +	if (strict &&
> +	    (hact_duration_ns < params->hact_ns.min ||
> +	     hact_duration_ns > params->hact_ns.max)) {
> +		DRM_ERROR("Invalid horizontal active area duration: %uns (min: %u, max %u)\n",
> +			  hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
> +		return -EINVAL;
> +	}
> +
> +	hblk = htotal - hactive;
> +	hblk_duration_ns = hblk * pixel_duration_ns;
> +	if (strict &&
> +	    (hblk_duration_ns < params->hblk_ns.min ||
> +	     hblk_duration_ns > params->hblk_ns.max)) {
> +		DRM_ERROR("Invalid horizontal blanking duration: %uns (min: %u, max %u)\n",
> +			  hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
> +		return -EINVAL;
> +	}
> +
> +	hslen = DIV_ROUND_UP(params->hslen_ns.typ, pixel_duration_ns);
> +	hslen_duration_ns = hslen * pixel_duration_ns;
> +	if (strict &&
> +	    (hslen_duration_ns < params->hslen_ns.min ||
> +	     hslen_duration_ns > params->hslen_ns.max)) {
> +		DRM_ERROR("Invalid horizontal sync duration: %uns (min: %u, max %u)\n",
> +			  hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
> +		return -EINVAL;
> +	}
> +
> +	porches = hblk - hslen;
> +	porches_duration_ns = porches * pixel_duration_ns;
> +	if (strict &&
> +	    (porches_duration_ns > (params->hfp_ns.max + params->hbp_ns.max) ||
> +	     porches_duration_ns < (params->hfp_ns.min + params->hbp_ns.min))) {
> +		DRM_ERROR("Invalid horizontal porches duration: %uns\n", porches_duration_ns);
> +		return -EINVAL;
> +	}
> +
> +	hfp_min = DIV_ROUND_UP(params->hfp_ns.min, pixel_duration_ns);
> +	hbp_min = DIV_ROUND_UP(params->hbp_ns.min, pixel_duration_ns);
> +	porches_rem = porches - hfp_min - hbp_min;
> +
> +	hfp = hfp_min + DIV_ROUND_UP(porches_rem, 2);
> +	hfp_duration_ns = hfp * pixel_duration_ns;
> +	if (strict &&
> +	    (hfp_duration_ns < params->hfp_ns.min ||
> +	     hfp_duration_ns > params->hfp_ns.max)) {
> +		DRM_ERROR("Invalid horizontal front porch duration: %uns (min: %u, max %u)\n",
> +			  hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
> +		return -EINVAL;
> +	}
> +
> +	hbp = porches - hfp;
> +	hbp_duration_ns = hbp * pixel_duration_ns;
> +	if (strict &&
> +	    (hbp_duration_ns < params->hbp_ns.min ||
> +	     hbp_duration_ns > params->hbp_ns.max)) {
> +		DRM_ERROR("Invalid horizontal back porch duration: %uns (min: %u, max %u)\n",
> +			  hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
> +		return -EINVAL;
> +	}
> +
> +	if (htotal != (hactive + hfp + hslen + hbp))
> +		return -EINVAL;
> +
> +	mode->clock = pixel_clock_hz / 1000;
> +	mode->hdisplay = hactive;
> +	mode->hsync_start = hactive + hfp;
> +	mode->hsync_end = hactive + hfp + hslen;
> +	mode->htotal = hactive + hfp + hslen + hbp;
> +
> +	if (interlace) {
> +		vfp_min = params->vfp_lines.even + params->vfp_lines.odd;
> +		vbp_min = params->vbp_lines.even + params->vbp_lines.odd;
> +		vslen = params->vslen_lines.even + params->vslen_lines.odd;
> +	} else {
> +		/*
> +		 * By convention, NSTC (aka 525/60) systems start with
> +		 * the even field, but PAL (aka 625/50) systems start
> +		 * with the odd one.
> +		 *
> +		 * PAL systems also have asymetric timings between the
> +		 * even and odd field, while NTSC is symetric.
> +		 *
> +		 * Moreover, if we want to create a progressive mode for
> +		 * PAL, we need to use the odd field timings.
> +		 *
> +		 * Since odd == even for NTSC, we can just use the odd
> +		 * one all the time to simplify the code a bit.
> +		 */
> +		vfp_min = params->vfp_lines.odd;
> +		vbp_min = params->vbp_lines.odd;
> +		vslen = params->vslen_lines.odd;
> +	}
> +
> +	porches = params->num_lines - vactive - vslen;
> +	porches_rem = porches - vfp_min - vbp_min;
> +
> +	vfp = vfp_min + (porches_rem / 2);
> +	vbp = porches - vfp;
> +
> +	vtotal = vactive + vfp + vslen + vbp;
> +	if (params->num_lines != vtotal) {
> +		DRM_ERROR("Invalid vertical total: %upx (expected %upx)\n",
> +			  vtotal, params->num_lines);
> +		return -EINVAL;
> +	}
> +
> +	mode->vdisplay = vactive;
> +	mode->vsync_start = vactive + vfp;
> +	mode->vsync_end = vactive + vfp + vslen;
> +	mode->vtotal = vactive + vfp + vslen + vbp;
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER;
> +	mode->flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC;
> +	if (interlace)
> +		mode->flags |= DRM_MODE_FLAG_INTERLACE;
> +
> +	drm_mode_set_name(mode);
> +
> +	if (mode->vtotal != params->num_lines)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_analog_tv_mode - create a display mode for an analog TV
> + * @dev: drm device
> + * @tv_mode: TV Mode standard to create a mode for. See DRM_MODE_TV_MODE_*.
> + * @pixel_clock_hz: Pixel Clock Frequency, in Hertz
> + * @hdisplay: hdisplay size
> + * @vdisplay: vdisplay size
> + * @interlace: whether to compute an interlaced mode
> + *
> + * This function creates a struct drm_display_mode instance suited for
> + * an analog TV output, for one of the usual analog TV mode.
> + *
> + * Note that @hdisplay is larger than the usual constraints for the PAL
> + * and NTSC timings, and we'll choose to ignore most timings constraints
> + * to reach those resolutions.
> + *
> + * Returns:
> + *
> + * A pointer to the mode, allocated with drm_mode_create(). Returns NULL
> + * on error.
> + */
> +struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
> +					    enum drm_connector_tv_mode tv_mode,
> +					    unsigned long pixel_clock_hz,
> +					    unsigned int hdisplay,
> +					    unsigned int vdisplay,
> +					    bool interlace)
> +{
> +	struct drm_display_mode *mode;
> +	enum drm_mode_analog analog;
> +	int ret;
> +
> +	switch (tv_mode) {
> +	case DRM_MODE_TV_MODE_NTSC_443:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_NTSC_J:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_NTSC_M:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_PAL_60:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_PAL_M:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_SECAM_60:
> +		analog = DRM_MODE_ANALOG_NTSC;
> +		break;
> +
> +	case DRM_MODE_TV_MODE_PAL_B:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_PAL_D:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_PAL_G:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_PAL_H:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_PAL_I:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_PAL_N:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_PAL_NC:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_SECAM_B:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_SECAM_D:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_SECAM_G:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_SECAM_K:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_SECAM_K1:
> +		fallthrough;
> +	case DRM_MODE_TV_MODE_SECAM_L:
> +		analog = DRM_MODE_ANALOG_PAL;
> +		break;
> +
> +	default:
> +		return NULL;
> +	}
> +
> +	mode = drm_mode_create(dev);
> +	if (!mode)
> +		return NULL;
> +
> +	ret = fill_analog_mode(mode,
> +			       &tv_modes_parameters[analog],
> +			       pixel_clock_hz, hdisplay, vdisplay, interlace);
> +	if (ret)
> +		goto err_free_mode;
> +
> +	return mode;
> +
> +err_free_mode:
> +	drm_mode_destroy(dev, mode);
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_analog_tv_mode);
> +
>  /**
>   * drm_cvt_mode -create a modeline based on the CVT algorithm
>   * @dev: drm device
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
> index b29ef1085cad..b22ac96fdd65 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
>  	drm_framebuffer_test.o \
>  	drm_kunit_helpers.o \
>  	drm_mm_test.o \
> +	drm_modes_test.o \
>  	drm_plane_helper_test.o \
>  	drm_rect_test.o
> diff --git a/drivers/gpu/drm/tests/drm_modes_test.c b/drivers/gpu/drm/tests/drm_modes_test.c
> new file mode 100644
> index 000000000000..87d398fcb99e
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_modes_test.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kunit test for drm_modes functions
> + */
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_modes.h>
> +
> +#include "drm_kunit_helpers.h"
> +
> +struct drm_modes_test_priv {
> +	struct drm_device *drm;
> +};
> +
> +static int drm_modes_test_init(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv;
> +
> +	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;

I believe it would be nicer to use KUNIT_ASSERT_NOT_NULL here, instead
of returning a error.

> +	test->priv = priv;
> +
> +	priv->drm = drm_kunit_device_init("drm-modes-test");
> +	if (IS_ERR(priv->drm))
> +		return PTR_ERR(priv->drm);

Here you could use KUNIT_ASSERT_NOT_ERR_OR_NULL.

> +
> +	return 0;
> +}
> +
> +static void drm_modes_test_exit(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +
> +	drm_kunit_device_exit(priv->drm);
> +}
> +
> +static void drm_modes_analog_tv_ntsc_480i(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_analog_tv_mode(priv->drm,
> +				  DRM_MODE_TV_MODE_NTSC_M,
> +				  13500 * 1000, 720, 480,
> +				  true);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 60);
> +	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
> +
> +	/* 63.556us * 13.5MHz = 858 pixels */
> +	KUNIT_EXPECT_EQ(test, mode->htotal, 858);
> +	KUNIT_EXPECT_EQ(test, mode->vdisplay, 480);
> +	KUNIT_EXPECT_EQ(test, mode->vtotal, 525);
> +}

I would be nice to see this test and drm_modes_analog_tv_pal_576i
parametrized.

Best Regards,
- Maíra Canal

> +
> +static void drm_modes_analog_tv_ntsc_480i_inlined(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +	struct drm_display_mode *expected, *mode;
> +
> +	expected = drm_analog_tv_mode(priv->drm,
> +				      DRM_MODE_TV_MODE_NTSC_M,
> +				      13500 * 1000, 720, 480,
> +				      true);
> +	KUNIT_ASSERT_NOT_NULL(test, expected);
> +
> +	mode = drm_mode_analog_ntsc_480i(priv->drm);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
> +}
> +
> +static void drm_modes_analog_tv_pal_576i(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_analog_tv_mode(priv->drm,
> +				  DRM_MODE_TV_MODE_PAL_B,
> +				  13500 * 1000, 720, 576,
> +				  true);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_EQ(test, drm_mode_vrefresh(mode), 50);
> +	KUNIT_EXPECT_EQ(test, mode->hdisplay, 720);
> +
> +	/* 64us * 13.5MHz = 864 pixels */
> +	KUNIT_EXPECT_EQ(test, mode->htotal, 864);
> +	KUNIT_EXPECT_EQ(test, mode->vdisplay, 576);
> +	KUNIT_EXPECT_EQ(test, mode->vtotal, 625);
> +}
> +
> +static void drm_modes_analog_tv_pal_576i_inlined(struct kunit *test)
> +{
> +	struct drm_modes_test_priv *priv = test->priv;
> +	struct drm_display_mode *expected, *mode;
> +
> +	expected = drm_analog_tv_mode(priv->drm,
> +				      DRM_MODE_TV_MODE_PAL_B,
> +				      13500 * 1000, 720, 576,
> +				      true);
> +	KUNIT_ASSERT_NOT_NULL(test, expected);
> +
> +	mode = drm_mode_analog_pal_576i(priv->drm);
> +	KUNIT_ASSERT_NOT_NULL(test, mode);
> +
> +	KUNIT_EXPECT_TRUE(test, drm_mode_equal(expected, mode));
> +}
> +
> +static struct kunit_case drm_modes_analog_tv_tests[] = {
> +	KUNIT_CASE(drm_modes_analog_tv_ntsc_480i),
> +	KUNIT_CASE(drm_modes_analog_tv_ntsc_480i_inlined),
> +	KUNIT_CASE(drm_modes_analog_tv_pal_576i),
> +	KUNIT_CASE(drm_modes_analog_tv_pal_576i_inlined),
> +	{ }
> +};
> +
> +static struct kunit_suite drm_modes_analog_tv_test_suite = {
> +	.name = "drm_modes_analog_tv",
> +	.init = drm_modes_test_init,
> +	.exit = drm_modes_test_exit,
> +	.test_cases = drm_modes_analog_tv_tests,
> +};
> +
> +kunit_test_suites(
> +	&drm_modes_analog_tv_test_suite
> +);
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index a80ae9639e96..5ccf3d51d313 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -443,6 +443,23 @@ bool drm_mode_is_420_also(const struct drm_display_info *display,
>  bool drm_mode_is_420(const struct drm_display_info *display,
>  		     const struct drm_display_mode *mode);
>  
> +struct drm_display_mode *drm_analog_tv_mode(struct drm_device *dev,
> +					    enum drm_connector_tv_mode mode,
> +					    unsigned long pixel_clock_hz,
> +					    unsigned int hdisplay,
> +					    unsigned int vdisplay,
> +					    bool interlace);
> +
> +static inline struct drm_display_mode *drm_mode_analog_ntsc_480i(struct drm_device *dev)
> +{
> +	return drm_analog_tv_mode(dev, DRM_MODE_TV_MODE_NTSC_M, 13500000, 720, 480, true);
> +}
> +
> +static inline struct drm_display_mode *drm_mode_analog_pal_576i(struct drm_device *dev)
> +{
> +	return drm_analog_tv_mode(dev, DRM_MODE_TV_MODE_PAL_B, 13500000, 720, 576, true);
> +}
> +
>  struct drm_display_mode *drm_cvt_mode(struct drm_device *dev,
>  				      int hdisplay, int vdisplay, int vrefresh,
>  				      bool reduced, bool interlaced,
> 
