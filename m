Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D99F26E10A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 18:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0F46E2B8;
	Thu, 17 Sep 2020 16:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97B76E271;
 Thu, 17 Sep 2020 16:45:44 +0000 (UTC)
IronPort-SDR: a3yHeTw3lM+7ZTTt7nswvAs2RrISSj47XUN9XNzsrFA7Xx24FT0m5U2SY/Lnp2fphs0HLhLzou
 SEYaWI6ZSR/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159039496"
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="159039496"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 09:45:30 -0700
IronPort-SDR: P3uSJqm1rPKtZatSfhnSZ8jQySr32IzUJw2JpKRkZSk+cCr1RrfV7XmKJWIgIdOH4b2ui+sbAL
 CuFA8kfQWSJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,271,1596524400"; d="scan'208";a="346686176"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 17 Sep 2020 09:45:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 17 Sep 2020 19:45:24 +0300
Date: Thu, 17 Sep 2020 19:45:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH v5 14/20] drm/nouveau/kms/nv50-: Use
 downstream DP clock limits for mode validation
Message-ID: <20200917164524.GZ6112@intel.com>
References: <20200826182456.322681-1-lyude@redhat.com>
 <20200826182456.322681-15-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826182456.322681-15-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, James Jones <jajones@nvidia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 26, 2020 at 02:24:50PM -0400, Lyude Paul wrote:
> This adds support for querying the maximum clock rate of a downstream
> port on a DisplayPort connection. Generally, downstream ports refer to
> active dongles which can have their own pixel clock limits.
> =

> Note as well, we also start marking the connector as disconnected if we
> can't read the DPCD, since we wouldn't be able to do anything without
> DPCD access anyway.
> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c   |  3 +++
>  drivers/gpu/drm/nouveau/nouveau_dp.c      | 15 +++++++++++----
>  drivers/gpu/drm/nouveau/nouveau_encoder.h |  1 +
>  3 files changed, 15 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 8e1effb10425d..d2141ca16107b 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1258,7 +1258,10 @@ nv50_mstc_detect(struct drm_connector *connector,
>  =

>  	ret =3D drm_dp_mst_detect_port(connector, ctx, mstc->port->mgr,
>  				     mstc->port);
> +	if (ret !=3D connector_status_connected)
> +		goto out;
>  =

> +out:
>  	pm_runtime_mark_last_busy(connector->dev->dev);
>  	pm_runtime_put_autosuspend(connector->dev->dev);
>  	return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouve=
au/nouveau_dp.c
> index 005750aeb6d4f..ad852e572cfec 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -61,6 +61,11 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_con=
nector,
>  			mstm->can_mst =3D drm_dp_read_mst_cap(aux, dpcd);
>  	}
>  =

> +	ret =3D drm_dp_read_downstream_info(aux, dpcd,
> +					  outp->dp.downstream_ports);
> +	if (ret < 0)
> +		return connector_status_disconnected;
> +
>  	return connector_status_connected;
>  }
>  =

> @@ -176,8 +181,6 @@ void nouveau_dp_irq(struct nouveau_drm *drm,
>  /* TODO:
>   * - Use the minimum possible BPC here, once we add support for the max =
bpc
>   *   property.
> - * - Validate the mode against downstream port caps (see
> - *   drm_dp_downstream_max_clock())
>   * - Validate against the DP caps advertised by the GPU (we don't check =
these
>   *   yet)
>   */
> @@ -188,15 +191,19 @@ nv50_dp_mode_valid(struct drm_connector *connector,
>  		   unsigned *out_clock)
>  {
>  	const unsigned min_clock =3D 25000;
> -	unsigned max_clock, clock;
> +	unsigned max_clock, ds_clock, clock;
>  	enum drm_mode_status ret;
>  =

>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
>  		return MODE_NO_INTERLACE;

I stumbled on this code when applying my big DFP series (sorry that
I forgot to read this while it was on the list).

Anyways, this code appears somewhat confused about the different
clocks.

>  =

>  	max_clock =3D outp->dp.link_nr * outp->dp.link_bw;

That I presume is the max symbol rate of the link.

> -	clock =3D mode->clock * (connector->display_info.bpc * 3) / 10;
> +	ds_clock =3D drm_dp_downstream_max_clock(outp->dp.dpcd,
> +					       outp->dp.downstream_ports);

That is the maximum dotclock (also the max TMDS clock before my DFP
series landed) the DFP supports.

> +	if (ds_clock)
> +		max_clock =3D min(max_clock, ds_clock);

max() between the symbol rate and dotclock doesn't really
make sense. One is the amount of symbols (or data in other
words), the other is amount of pixels (which depending on
bpc can result in various amounts of symbols/data).

>  =

> +	clock =3D mode->clock * (connector->display_info.bpc * 3) / 10;

I presume this trying to compute the symbol rate we require.
Due to the 8b/10b encoding each 10bit symbol carries 8 bits of
actual data, so the /10 should be /8. IIRC we had this same
bug in i915, but it was fixed years ago.

This is also calculating things based on display_info.bpc which
IIRC is the max bpc the display supports. Using the max may be
overly pessimistic in case a) the driver/hw doesn't even support
bpc that high, b) the driver can dynamically reduce the bpc in
order to fit the mode onto the link. In i915 we take the opposite
approach and just use the min bpc (=3D=3D6) in mode_valid(). During
modeset we start from the max bpc and keep reducing it until
things fit.


So I suspect what you want here is something like:

max_clock =3D outp->dp.link_nr * outp->dp.link_bw;
clock =3D mode->clock * (connector->display_info.bpc * 3) / 8; // or maybe =
just use 6 for bpc
if (clock > max_clock)
	reurn CLOCK_HIGH;

ds_clock =3D drm_dp_downstream_max_dotclock();
if (ds_clock && mode->clock > ds_clock)
	return CLOCK_HIGH;

+ a bit more if you want to also deal with the TMDS
clock limits sensibly. That also requires some though
as to which bpc to use. In i915 we assume 8bpc when
calculating the TMDS clock since that's the minimum
DVI/HDMI supports.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
