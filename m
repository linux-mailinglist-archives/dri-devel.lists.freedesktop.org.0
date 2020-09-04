Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1526D25CF6A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 04:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A766F6E217;
	Fri,  4 Sep 2020 02:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F636E217
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 02:30:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85D26540;
 Fri,  4 Sep 2020 04:30:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599186611;
 bh=3IhAp6iiTQb1VIkwNiG2ixLcKMYBNgk+LZRubUP8PCw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lRcg68qSD5iYxtgkBuIVFRvJRfhUMvWKvU3HZyFB2v6AWSmK9IzjnnOl5o4J3w1ic
 swiLpzMA9uttHRDEkkhSHKyZ8vQZmlXrwm948O2PAHfZK1K+Yi274qHQZEKDcsBcsT
 um8P7GYinkLDmsvDgYhWubWdAb8OeV00+fQVWg78=
Date: Fri, 4 Sep 2020 05:29:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v9 2/3] drm: bridge: Add support for Cadence MHDP8546
 DPI/DP bridge
Message-ID: <20200904022948.GE9369@pendragon.ideasonboard.com>
References: <1598862215-10222-1-git-send-email-sjakhade@cadence.com>
 <1598862215-10222-3-git-send-email-sjakhade@cadence.com>
 <71452de7-80e7-0144-4802-e3370c00854b@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71452de7-80e7-0144-4802-e3370c00854b@ti.com>
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 jonas@kwiboo.se, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, robh+dt@kernel.org,
 jsarha@ti.com, Swapnil Jakhade <sjakhade@cadence.com>, nikhil.nd@ti.com,
 mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Tue, Sep 01, 2020 at 10:46:03AM +0300, Tomi Valkeinen wrote:
> Hi Swapnil,
> 
> On 31/08/2020 11:23, Swapnil Jakhade wrote:
> 
> > +static int cdns_mhdp_validate_mode_params(struct cdns_mhdp_device *mhdp,
> > +					  const struct drm_display_mode *mode,
> > +					  struct drm_bridge_state *bridge_state)
> > +{
> > +	u32 tu_size = 30, line_thresh1, line_thresh2, line_thresh = 0;
> > +	u32 rate, vs, vs_f, required_bandwidth, available_bandwidth;
> > +	struct cdns_mhdp_bridge_state *state;
> > +	int pxlclock;
> > +	u32 bpp;
> > +
> > +	state = to_cdns_mhdp_bridge_state(bridge_state);
> > +
> > +	pxlclock = mode->crtc_clock;
> > +
> > +	/* Get rate in MSymbols per second per lane */
> > +	rate = mhdp->link.rate / 1000;
> > +
> > +	bpp = cdns_mhdp_get_bpp(&mhdp->display_fmt);
> 
> None of the above are used when calling cdns_mhdp_bandwidth_ok(). For clarity, I'd move the above
> lines a bit closer to where they are needed, as currently it makes me think the above values are
> used when checking the bandwidth.
> 
> > +	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
> > +				    mhdp->link.rate)) {
> > +		dev_err(mhdp->dev, "%s: Not enough BW for %s (%u lanes at %u Mbps)\n",
> > +			__func__, mode->name, mhdp->link.num_lanes,
> > +			mhdp->link.rate / 100);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* find optimal tu_size */
> > +	required_bandwidth = pxlclock * bpp / 8;
> > +	available_bandwidth = mhdp->link.num_lanes * rate;
> > +	do {
> > +		tu_size += 2;
> > +
> > +		vs_f = tu_size * required_bandwidth / available_bandwidth;
> > +		vs = vs_f / 1000;
> > +		vs_f = vs_f % 1000;
> > +		/* Downspreading is unused currently */
> > +	} while ((vs == 1 || ((vs_f > 850 || vs_f < 100) && vs_f != 0) ||
> > +		 tu_size - vs < 2) && tu_size < 64);
> > +
> > +	if (vs > 64) {
> > +		dev_err(mhdp->dev,
> > +			"%s: No space for framing %s (%u lanes at %u Mbps)\n",
> > +			__func__, mode->name, mhdp->link.num_lanes,
> > +			mhdp->link.rate / 100);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (vs == tu_size)
> > +		vs = tu_size - 1;
> > +
> > +	line_thresh1 = ((vs + 1) << 5) * 8 / bpp;
> > +	line_thresh2 = (pxlclock << 5) / 1000 / rate * (vs + 1) - (1 << 5);
> > +	line_thresh = line_thresh1 - line_thresh2 / mhdp->link.num_lanes;
> > +	line_thresh = (line_thresh >> 5) + 2;
> > +
> > +	state->vs = vs;
> > +	state->tu_size = tu_size;
> > +	state->line_thresh = line_thresh;
> > +
> > +	return 0;
> > +}
> > +
> > +static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
> > +				  struct drm_bridge_state *bridge_state,
> > +				  struct drm_crtc_state *crtc_state,
> > +				  struct drm_connector_state *conn_state)
> > +{
> > +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> > +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> > +	int ret;
> > +
> > +	mutex_lock(&mhdp->link_mutex);
> > +
> > +	if (!mhdp->plugged) {
> > +		mhdp->link.rate = mhdp->host.link_rate;
> > +		mhdp->link.num_lanes = mhdp->host.lanes_cnt;
> > +	}
> > +
> > +	ret = cdns_mhdp_validate_mode_params(mhdp, mode, bridge_state);
> > +
> > +	mutex_unlock(&mhdp->link_mutex);
> > +
> > +	return ret;
> > +}
> 
> Laurent mentioned that atomic_check should not change state. Note that
> cdns_mhdp_validate_mode_params also changes state, as it calculates tu_size, vs and line_thresh.

.atomic_check() isn't allowed to change any global state, which means
both hardware state and data in cdns_mhdp_device. The drm_bridge_state
(and thus the cdns_mhdp_bridge_state) can be modified as it stores the
state for the atomic commit being checked.

> There seems to be issues with mode changes, but I think the first step would be to clarify the
> related code a bit. cdns_mhdp_validate_mode_params() is misnamed, I think it should be renamed to
> calculate_tu or something like that.
> 
> cdns_mhdp_bandwidth_ok() should take display_fmt or bpp as a parameter, as currently it digs that up
> from the current state.
> 
> Probably cdns_mhdp_validate_mode_params() would be better if it doesn't write the result to the
> state, but returns the values. That way it could also be used to verify if suitable settings can be
> found, without changing the state.

This use case is actually a very good example of proper usage of the
atomic state :-) .atomic_check() has to perform computations to verify
the atomic commit, and storing the results in the commit's state
prevents duplicating the same calculation at .atomic_commit() time.

> The are two issues I see with some testing, which are probably related.
> 
> The first one is that if I run kmstest with a new mode, I see tu-size & co being calculated. But the
> calculation happens before link training, which doesn't make sense. So I think what's done here is
> that atomic_check causes tu-size calculations, then atomic_enable does link training and enables the
> video.
> 
> The second happens when my monitor fails with the first CR after power-on, and the driver drops
> number-of-lanes to 2. It goes like this:
> 
> The driver is loaded. Based on EDID, fbdev is created with 1920x1200. Link training is done, which
> has the CR issue, and because of that the actual mode that we get is 1280x960. I get a proper
> picture here, so far so good.
> 
> Then if I run kmstest, it only allows 1280x960 as the link doesn't support higher modes (that's ok).
> It the does link training and gets a 4 lane link, and enables 1280x960. But the picture is not ok.
> 
> If I then exit kmstest, it goes back to fbdev, but now that picture is broken also.
> 
> Running kmstest again gives me 1920x1200 (as the link has been 4 lane now), and the picture is fine.
> 
> I think the above suggests that the driver is not properly updating all the registers based on the
> new mode and link. I tried adding cdns_mhdp_validate_mode_params() call to
> cdns_mhdp_atomic_enable(), so that tu-size etc will be calculated, but that did not fix the problem.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
