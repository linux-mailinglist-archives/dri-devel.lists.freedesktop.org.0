Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BC1A5CFC5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE5B10E09C;
	Tue, 11 Mar 2025 19:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sq4SUvLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AB610E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:46:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 326515C0F67;
 Tue, 11 Mar 2025 19:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DBCC4CEE9;
 Tue, 11 Mar 2025 19:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741722404;
 bh=FMrHmimwuL7y/rhrAvw0eIdTqLiAViP8PtCNYlWUMFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sq4SUvLzbyLCoYUV/Yj2NyflNcE26NFzLob9g03G75M01V46rZRGa19PwWa49BQVC
 4JVqqHby+tRA0TENZ7Iccfb1QDXty8GNH4hutkiQJJP0h205xrgjQcesG4rUND90fW
 YdFQJQUVxkMaoumIGwwvBBhFf7+c45gat5j7RyIwqW1PYiFTtPTqSGJMRFvcjLHQqN
 XRtMfCgRLwtubkoSbGDT11mxOmAJwwtGp4FlduhPmgh4L2gz7JIhnf+nOz8j8iGP/u
 LNcPlURVPEv66luArhD62aLWWqqZIuivmANZpWpycAfJsIc0kxv0drO8ipfACX9DA9
 kH6DRPFVkQ7KQ==
Date: Tue, 11 Mar 2025 21:46:39 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
Message-ID: <g25hgb2mocl4sjny26k4nzn2hwpwhlodenqganzcqfzzg6itms@herenniualnw>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-4-fbdb94f02562@collabora.com>
 <20250311-hypersonic-mature-leopard-d3afdc@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-hypersonic-mature-leopard-d3afdc@houat>
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

On Tue, Mar 11, 2025 at 04:55:17PM +0100, Maxime Ripard wrote:
> Hi,
> 
> I think the first thing we need to address is that we will need to
> differentiate between HDMI 1.4 devices and HDMI 2.0.
> 
> It applies to YUV420, which is HDMI 2.0-only, and I guess your patches
> are good enough if you consider YUV420 support only, but scrambler setup
> for example is a thing we want to support in that infrastructure
> eventually, and is conditioned on HDMI 2.0 as well.
> 
> On Tue, Mar 11, 2025 at 12:57:36PM +0200, Cristian Ciocaltea wrote:
> > Try to make use of YUV420 when computing the best output format and
> > RGB cannot be supported for any of the available color depths.
> > 
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 69 +++++++++++++------------
> >  1 file changed, 35 insertions(+), 34 deletions(-)
> > 

[...]

> >  	return -EINVAL;
> >  }
> >  
> > +static int
> > +hdmi_compute_config(const struct drm_connector *connector,
> > +		    struct drm_connector_state *conn_state,
> > +		    const struct drm_display_mode *mode)
> > +{
> > +	unsigned int max_bpc = clamp_t(unsigned int,
> > +				       conn_state->max_bpc,
> > +				       8, connector->max_bpc);
> > +	int ret;
> > +
> > +	ret = hdmi_try_format(connector, conn_state, mode, max_bpc,
> > +			      HDMI_COLORSPACE_RGB);
> > +	if (!ret)
> > +		return 0;
> > +
> > +	if (connector->ycbcr_420_allowed)
> > +		ret = hdmi_try_format(connector, conn_state, mode, max_bpc,
> > +				      HDMI_COLORSPACE_YUV420);
> 
> I think that's conditioned on a few more things:
>   - That the driver supports HDMI 2.0

Isn't that included into connector->ycbcr_420_allowed? I'd expect that
HDMI 1.4-only drivers don't set that flag.

>   - That the display is an HDMI output
>   - That the mode is allowed YUV420 by the sink EDIDs
> 
> > +	else
> > +		drm_dbg_kms(connector->dev,
> > +			    "%s output format not allowed for connector\n",
> > +			    drm_hdmi_connector_get_output_format_name(HDMI_COLORSPACE_YUV420));
> 
> And I think we should keep the catch-all failure message we had.
> 
> Maxime



-- 
With best wishes
Dmitry
