Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5083024DF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 13:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9943898AA;
	Mon, 25 Jan 2021 12:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BBD898AA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 12:18:25 +0000 (UTC)
IronPort-SDR: BTXFNBBjV/vfTyzPlxrESTlD3cknv1SO4ff90DkpZQpr6L9v9o9urJ8Dhpcg74Y8iJdi5AlAN6
 LE8qt/Zxs9qQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="166815904"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="166815904"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 04:18:24 -0800
IronPort-SDR: oxSq+bW0tCqWU7I2UIGAZLet7pukoh2GDoYW+hDR7viC1W6Qv3oq8Ajr6Sxkxtvbu6MNER9gNl
 KhfYLaN582aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; d="scan'208";a="361471544"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 25 Jan 2021 04:18:20 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 25 Jan 2021 14:18:20 +0200
Date: Mon, 25 Jan 2021 14:18:20 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/dp_mst: Align mst link rate with soure rate
Message-ID: <YA63DOXXObWp6AF6@intel.com>
References: <20210113014105.28110-1-koba.ko@canonical.com>
 <20210113014105.28110-2-koba.ko@canonical.com>
 <8735z5t5qz.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8735z5t5qz.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Koba Ko <koba.ko@canonical.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 01:51:00PM +0200, Jani Nikula wrote:
> On Wed, 13 Jan 2021, Koba Ko <koba.ko@canonical.com> wrote:
> > After read the link rate from MST hub, align with
> > maximum source rate.
> >
> > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c   | 8 ++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.c | 7 +++++++
> >  include/drm/drm_dp_helper.h             | 8 ++++++++
> >  include/drm/drm_dp_mst_helper.h         | 4 ++++
> >  4 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/dr=
m_dp_mst_topology.c
> > index 6982ecbf30b5..e7ceae97be85 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3672,6 +3672,10 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_d=
p_mst_topology_mgr *mgr, bool ms
> >  {
> >  	int ret =3D 0;
> >  	struct drm_dp_mst_branch *mstb =3D NULL;
> > +	unsigned int max_link_rate_tbl[MAX_DRM_DP_MAX_RATE + 1] =3D {
> > +		DP_LINK_BW_1_62, DP_LINK_BW_2_7, DP_LINK_BW_5_4,
> > +		DP_LINK_BW_8_1, DP_LINK_RATE_TABLE
> > +	};
> =

> Please no. Read on for why.
> =

> >  =

> >  	mutex_lock(&mgr->payload_lock);
> >  	mutex_lock(&mgr->lock);
> > @@ -3693,6 +3697,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp=
_mst_topology_mgr *mgr, bool ms
> >  			goto out_unlock;
> >  		}
> >  =

> > +		if (mgr->max_source_rate < MAX_DRM_DP_MAX_RATE)
> > +			mgr->dpcd[1] =3D max_link_rate_tbl[mgr->max_source_rate];
> =

> Make ->max_source_rate the actual physical rate in kHz, and use
> drm_dp_link_rate_to_bw_code() here.
> =

> > +
> >  		mgr->pbn_div =3D drm_dp_get_vc_payload_bw(mgr->dpcd[1],
> >  							mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK);
> >  		if (mgr->pbn_div =3D=3D 0) {
> > @@ -5422,6 +5429,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_ms=
t_topology_mgr *mgr,
> >  	mgr->aux =3D aux;
> >  	mgr->max_dpcd_transaction_bytes =3D max_dpcd_transaction_bytes;
> >  	mgr->max_payloads =3D max_payloads;
> > +	mgr->max_source_rate =3D MAX_DRM_DP_MAX_RATE;
> >  	mgr->conn_base_id =3D conn_base_id;
> >  	if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
> >  	    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/=
i915/display/intel_dp.c
> > index 469e765a1b7b..a89b4c823123 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5392,6 +5392,13 @@ intel_dp_configure_mst(struct intel_dp *intel_dp)
> >  	intel_dp->is_mst =3D sink_can_mst &&
> >  		i915->params.enable_dp_mst;
> >  =

> > +	if (intel_dp_source_supports_hbr3(intel_dp))
> > +		intel_dp->mst_mgr.max_source_rate =3D DRM_DP_MAX_RATE_HBR3;
> > +	else if (intel_dp_source_supports_hbr2(intel_dp))
> > +		intel_dp->mst_mgr.max_source_rate =3D DRM_DP_MAX_RATE_HBR2;
> > +	else
> > +		intel_dp->mst_mgr.max_source_rate =3D DRM_DP_MAX_RATE_HBR;
> =

> Whenever this file references a "rate", it's the rate in kHz. This is
> confusing. Use the rate in kHz.
> =

> Also, please look at how intel_dp_source_supports_hbr* are implemented;
> we already have all the supported source rates cached in intel_dp.
> =

> The max source rate is:
> =

> 	intel_dp->source_rates[intel_dp->num_source_rates - 1].
> =

> No need to do the if ladder here at all. If you like, you can add a
> helper:
> =

> int intel_dp_max_source_rate(struct intel_dp *intel_dp)
> {
>         return intel_dp->source_rates[intel_dp->num_source_rates - 1];
> }

Using the max source rate isn't super great either. A bit better
than the current mess though.

The correct fix would be to let the driver provide the actually
used link_rate+lane_count to the MST code during atomic_check(),
instead of trying to guess what the driver is going to use.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
