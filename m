Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9732CEA3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 09:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0042B6EA08;
	Thu,  4 Mar 2021 08:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 373 seconds by postgrey-1.36 at gabe;
 Wed, 03 Mar 2021 23:14:52 UTC
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DCE6E413
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 23:14:52 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4DrV6W3F73z2d;
 Thu,  4 Mar 2021 00:08:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1614812916; bh=NqS2aRIA5DCDhNKC+JPOLs07Qcg/kZwTJzmJdtbxEIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l/a2+aZQduaWPdlwfSOEzClBurO0AgayGKavZuhQ7R0/hvVNEYpf1Dia53gS7D0uw
 hlXLrbjH2yFZzrmpk0AN5aazcIGButIzuSyMbTiIRqRUzFiDKgundWlYc4WSqN2bNI
 3Lc3/ui52sY44DiQ9pax2BrAd9+dDrYBDcTf8PUszu3RSHlJGBqFJ2e4NmKs9Y6JcG
 Hq9LA1hsdBR/5yKMfcYNHsX+rYnB3p9aYfW0rO6mgbR/aEsnviofdT9Le8W/nCMIUT
 rFg/D2Zzc0fhSsAHy0QDNbIF5VruL/488ZCYLx6k/VeZbaIFexJY9UoZbp7Jad35SR
 W/x4X+WFpCthQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 4 Mar 2021 00:08:27 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v13 1/2] drm/tegra: dc: Support memory bandwidth management
Message-ID: <20210303230827.GA22628@qmqm.qmqm.pl>
References: <20210302124445.29444-1-digetx@gmail.com>
 <20210302124445.29444-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302124445.29444-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 04 Mar 2021 08:41:51 +0000
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 02, 2021 at 03:44:44PM +0300, Dmitry Osipenko wrote:
> Display controller (DC) performs isochronous memory transfers, and thus,
> has a requirement for a minimum memory bandwidth that shall be fulfilled,
> otherwise framebuffer data can't be fetched fast enough and this results
> in a DC's data-FIFO underflow that follows by a visual corruption.
> =

> The Memory Controller drivers provide facility for memory bandwidth
> management via interconnect API. Let's wire up the interconnect API
> support to the DC driver in order to fix the distorted display output
> on T30 Ouya, T124 TK1 and other Tegra devices.

I did a read on the code. I have put some thoughts and nits inbetween the
diff, but here are more general questions about the patch:

Is there a reason why the bandwidth is allocated per plane instead of just
using one peak and average for the whole configuration? Or is there a need
to expose all the planes as interconnect channels and allocate their
bandwidth individually?

From algorithmic part I see that the plane overlaps are calculated twice
(A vs B and later B vs A). The cursor plane is ignored, but nevertheless
its overlap mask is calculated before being thrown away. The bandwidths
are also calculated twice: once for pre-commit and then again for
post-commit.  Is setting bandwidth for an interconnect expensive when
re-setting a value that was already set? The code seems to avoid this
case, but maybe unnecessarily?

[...cut the big and interesting part...]

[...]
> @@ -65,7 +75,9 @@ struct tegra_dc_soc_info {
>  	unsigned int num_overlay_formats;
>  	const u64 *modifiers;
>  	bool has_win_a_without_filters;
> +	bool has_win_b_vfilter_mem_client;
>  	bool has_win_c_without_vert_filter;
> +	unsigned int plane_tiled_memory_bandwidth_x2;

This looks more like bool in the code using it.

[...]
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
[...]
> +static int tegra_plane_check_memory_bandwidth(struct drm_plane_state *st=
ate)

The function's body looks more like 'update' or 'recalculate' rather
than 'check' the memory bandwidth.

> +	struct tegra_plane_state *tegra_state =3D to_tegra_plane_state(state);
> +	unsigned int i, bpp, bpp_plane, dst_w, src_w, src_h, mul;
> +	const struct tegra_dc_soc_info *soc;
> +	const struct drm_format_info *fmt;
> +	struct drm_crtc_state *crtc_state;
> +	u32 avg_bandwidth, peak_bandwidth;
> +
> +	if (!state->visible)
> +		return 0;
> +
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state->state, state->crtc);
> +	if (!crtc_state)
> +		return -EINVAL;
> +
> +	src_w =3D drm_rect_width(&state->src) >> 16;
> +	src_h =3D drm_rect_height(&state->src) >> 16;
> +	dst_w =3D drm_rect_width(&state->dst);
> +
> +	fmt =3D state->fb->format;
> +	soc =3D to_tegra_dc(state->crtc)->soc;
> +
> +	/*
> +	 * Note that real memory bandwidth vary depending on format and
> +	 * memory layout, we are not taking that into account because small
> +	 * estimation error isn't important since bandwidth is rounded up
> +	 * anyway.
> +	 */
> +	for (i =3D 0, bpp =3D 0; i < fmt->num_planes; i++) {
> +		bpp_plane =3D fmt->cpp[i] * 8;

Nit: you could declare the bpp_plane here.

> +		/*
> +		 * Sub-sampling is relevant for chroma planes only and vertical
> +		 * readouts are not cached, hence only horizontal sub-sampling
> +		 * matters.
> +		 */
> +		if (i > 0)
> +			bpp_plane /=3D fmt->hsub;
> +
> +		bpp +=3D bpp_plane;
> +	}
> +
> +	/*
> +	 * Horizontal downscale takes extra bandwidth which roughly depends
> +	 * on the scaled width.
> +	 */
> +	if (src_w > dst_w)
> +		mul =3D (src_w - dst_w) * bpp / 2048 + 1;
> +	else
> +		mul =3D 1;

Does it really need more bandwidth to scale down? Does it read the same
data multiple times just to throw it away?

> +	/* average bandwidth in bytes/s */
> +	avg_bandwidth  =3D src_w * src_h * bpp / 8 * mul;
> +	avg_bandwidth *=3D drm_mode_vrefresh(&crtc_state->mode);
> +
> +	/* mode.clock in kHz, peak bandwidth in kbit/s */
> +	peak_bandwidth =3D crtc_state->mode.clock * bpp * mul;

I would guess that (src_w * bpp / 8) needs rounding up unless the plane
is continuous. Or you could just add the max rounding error here and
get a safe overestimated value. Maybe this would be better done when
summing per-plane widths.

> +	/* ICC bandwidth in kbyte/s */
> +	peak_bandwidth =3D kbps_to_icc(peak_bandwidth);
> +	avg_bandwidth  =3D Bps_to_icc(avg_bandwidth);

This could be merged with the assignments after the following 'if' block.

> +	/*
> +	 * Tegra30/114 Memory Controller can't interleave DC memory requests
> +	 * and DC uses 16-bytes atom for the tiled windows, while DDR3 uses 32
> +	 * bytes atom. Hence there is x2 memory overfetch for tiled framebuffer
> +	 * and DDR3 on older SoCs.
> +	 */
> +	if (soc->plane_tiled_memory_bandwidth_x2 &&
> +	    tegra_state->tiling.mode =3D=3D TEGRA_BO_TILING_MODE_TILED) {
> +		peak_bandwidth *=3D 2;
> +		avg_bandwidth *=3D 2;
> +	}
> +
> +	tegra_state->peak_memory_bandwidth =3D peak_bandwidth;
> +	tegra_state->avg_memory_bandwidth =3D avg_bandwidth;
> +
> +	return 0;
> +}

[...]
> +static const char * const tegra_plane_icc_names[] =3D {
> +	"wina", "winb", "winc", "", "", "", "cursor",
> +};
> +
> +int tegra_plane_interconnect_init(struct tegra_plane *plane)
> +{
> +	const char *icc_name =3D tegra_plane_icc_names[plane->index];

Is plane->index guaranteed to be <=3D 6? I would guess so, but maybe
BUILD_BUG_ON(sizeof(icc_names)=3D=3DTEGRA_DC_LEGACY_PLANES_NUM) or some
other check could document this?

[...]

Best Regards
Micha=B3 Miros=B3aw
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
