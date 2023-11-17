Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2D97EF3ED
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 14:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9A110E00E;
	Fri, 17 Nov 2023 13:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DD710E00E;
 Fri, 17 Nov 2023 13:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700229488; x=1731765488;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UOJO5xsP8HF0ptx/SzA5k6vjlgatzH25aQLhhMj+Am0=;
 b=D5vt5DZJGL9l5/XhEPc6zN1N21oq0i6qglL5IDr9cgq8WuJriU/JAYm9
 p1F7LpmsY3Fb9BJYveU8vpAASgHpQfoxqXUByOtVBqoGDpO/IQv4ecm8m
 aW3Q2ukf5CKU5+GW+2CqMn7CO6P8Xn5azL3IP2PRBPU+iWSIBUZ9cf2l4
 dhs0zWmSbgqapvANOnXtfAaOi+LTri5W9NBMgo5YrM4VpWmcnp02YjvVg
 ui5uTZ01B40CyPGWJqbIhAi8m6aJRkcjmKv4pe8GnoyCgjAmxcDhTqjfL
 1TeFOYPD5PHEG470mv/fCzDl9YTU51JnYVSbfHnXNlDDQmmJrWj7nTitp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="477517053"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="477517053"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 05:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="13492030"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 05:58:05 -0800
Date: Fri, 17 Nov 2023 15:58:05 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 02/11] drm/dp_mst: Fix PBN divider
 calculation for UHBR rates
Message-ID: <ZVdxMqEt5eu0ChRG@ideak-desk.fi.intel.com>
References: <20231116131841.1588781-1-imre.deak@intel.com>
 <20231116131841.1588781-3-imre.deak@intel.com>
 <ZVdH6rwVHAWMTLuf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVdH6rwVHAWMTLuf@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 01:00:58PM +0200, Ville Syrjälä wrote:
> On Thu, Nov 16, 2023 at 03:18:32PM +0200, Imre Deak wrote:
> > The current way of calculating the pbn_div value, the link BW per each
> > MTP slot, worked only for DP 1.4 link rates. Fix things up for UHBR
> > rates calculating with the correct channel coding efficiency based on
> > the link rate.
> > 
> > v2:
> > - Return the fractional pbn_div value from drm_dp_get_vc_payload_bw().
> > 
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 13 ++++++++++---
> >  include/drm/display/drm_dp_helper.h           | 13 +++++++++++++
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 000d05e80352a..3fbd5585d5e6c 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -3585,14 +3585,18 @@ static int drm_dp_send_up_ack_reply(struct drm_dp_mst_topology_mgr *mgr,
> >  fixed20_12 drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
> >  				    int link_rate, int link_lane_count)
> >  {
> > +	int ch_coding_efficiency =
> > +		drm_dp_bw_channel_coding_efficiency(drm_dp_is_uhbr_rate(link_rate));
> >  	fixed20_12 ret;
> >  
> >  	if (link_rate == 0 || link_lane_count == 0)
> >  		drm_dbg_kms(mgr->dev, "invalid link rate/lane count: (%d / %d)\n",
> >  			    link_rate, link_lane_count);
> >  
> > -	/* See DP v2.0 2.6.4.2, VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
> > -	ret.full = dfixed_const(link_rate * link_lane_count / 54000);
> > +	/* See DP v2.0 2.6.4.2, 2.7.6.3 VCPayload_Bandwidth_for_OneTimeSlotPer_MTP_Allocation */
> > +	ret.full = DIV_ROUND_DOWN_ULL(mul_u32_u32(link_rate * link_lane_count,
> > +						  ch_coding_efficiency),
> > +				      (1000000ULL * 8 * 5400) >> 12);
> 
> Seems to produce the correct numbers.
> 
> >  
> >  	return ret;
> >  }
> > @@ -4315,6 +4319,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
> >  	struct drm_dp_mst_atomic_payload *payload = NULL;
> >  	struct drm_connector_state *conn_state;
> >  	int prev_slots = 0, prev_bw = 0, req_slots;
> > +	fixed20_12 req_slots_fp;
> >  
> >  	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
> >  	if (IS_ERR(topology_state))
> > @@ -4342,7 +4347,9 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
> >  		}
> >  	}
> >  
> > -	req_slots = DIV_ROUND_UP(pbn, dfixed_trunc(topology_state->pbn_div));
> > +	req_slots_fp.full = dfixed_div((fixed20_12)dfixed_init(pbn), topology_state->pbn_div);
> 
> dfixed_div() looks super dodgy. It seems to have some kind of hand
> rolled round to closest behaviour, which would imply that this can
> return a rounded down result.

Yes, dfixed_ceil(dfixed_div(..)) doesn't actually round up the result,
thanks for spotting that. It should be instead:

	req_slots = DIV_ROUND_UP(dfixed_const(pbn), topology_state->pbn_div.full);

Fixing the division similarly in patch 8.

> 
> > +	req_slots_fp.full = dfixed_ceil(req_slots_fp);
> > +	req_slots = dfixed_trunc(req_slots_fp);
> >  
> >  	drm_dbg_atomic(mgr->dev, "[CONNECTOR:%d:%s] [MST PORT:%p] TU %d -> %d\n",
> >  		       port->connector->base.id, port->connector->name,
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index c5f1079acb3b1..863b2e7add29e 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -252,6 +252,19 @@ drm_edp_backlight_supported(const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE])
> >  	return !!(edp_dpcd[1] & DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP);
> >  }
> >  
> > +/**
> > + * drm_dp_is_uhbr_rate - Determine if a link rate is UHBR
> > + * @link_rate: link rate in 10kbits/s units
> > + *
> > + * Determine if the provided link rate is an UHBR rate.
> > + *
> > + * Returns: %True if @link_rate is an UHBR rate.
> > + */
> > +static inline bool drm_dp_is_uhbr_rate(int link_rate)
> > +{
> > +	return link_rate >= 1000000;
> > +}
> > +
> >  /*
> >   * DisplayPort AUX channel
> >   */
> > -- 
> > 2.39.2
> 
> -- 
> Ville Syrjälä
> Intel
