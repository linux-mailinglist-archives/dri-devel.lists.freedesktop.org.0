Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AB91FB82F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 17:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8AF6E900;
	Tue, 16 Jun 2020 15:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553786E900;
 Tue, 16 Jun 2020 15:55:19 +0000 (UTC)
IronPort-SDR: oqj+p3xAetIwK6jX0NJsI0cGi5nK9CIe+fBe8pyM9AkWNC5s/U64KUXUnp92R52oo+lTlyL/CW
 EHN51SxJzluQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 08:55:11 -0700
IronPort-SDR: T26vHbTc1/jQPKspHbU3TVCcz09DVK7VvNbOwjavhU46qNTNsKJvU0DDNQFZKitycvAFCB6dZ5
 RK9HfdYE0qkQ==
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; d="scan'208";a="263049409"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 08:55:09 -0700
Date: Tue, 16 Jun 2020 18:54:41 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/i915/dp_mst: Ensure the DPCD ACT sent flag is
 cleared before waiting for it
Message-ID: <20200616155441.GC21389@ideak-desk.fi.intel.com>
References: <20200616141855.746-1-imre.deak@intel.com>
 <20200616141855.746-6-imre.deak@intel.com>
 <20200616154546.GY6112@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616154546.GY6112@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 06:45:46PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Jun 16, 2020 at 05:18:55PM +0300, Imre Deak wrote:
> > Atm, we clear the ACT sent flag in the sink's DPCD before updating the
> > sink's payload table, along clearing the payload table updated flag.
> > The sink is supposed to set this flag once it detects that the source
> > has completed the ACT sequence (after detecting the 4 required ACT MTPH
> > symbols sent by the source). As opposed to this 2 DELL monitors I have
> > set the flag already along the payload table updated flag, which is not
> > quite correct.
> > =

> > To be sure that the sink has detected the ACT MTPH symbols before
> > continuing enabling the encoder, clear the ACT sent flag before enabling
> > or disabling the transcoder VC payload allocation (which is what starts
> > the ACT sequence).
> > =

> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c       | 31 +++++++++++++++++++--
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c |  2 ++
> >  include/drm/drm_dp_mst_helper.h             |  2 ++
> >  3 files changed, 33 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/dr=
m_dp_mst_topology.c
> > index b2f5a84b4cfb..e3bf8c9c8267 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -4377,6 +4377,34 @@ void drm_dp_mst_deallocate_vcpi(struct drm_dp_ms=
t_topology_mgr *mgr,
> >  }
> >  EXPORT_SYMBOL(drm_dp_mst_deallocate_vcpi);
> >  =

> > +/**
> > + * drm_dp_clear_payload_status() - Clears the payload table status fla=
gs
> > + * @mgr: manager to use
> > + *
> > + * Clears the payload table ACT handled and table updated flags in the=
 MST hub's
> > + * DPCD. This function must be called before updating the payload tabl=
e or
> > + * starting the ACT sequence and waiting for the corresponding flags t=
o get
> > + * set by the hub.
> > + *
> > + * Returns:
> > + * 0 if the flag got cleared successfully, otherwise a negative error =
code.
> > + */
> > +int drm_dp_clear_payload_status(struct drm_dp_mst_topology_mgr *mgr)
> > +{
> > +	int ret;
> > +
> > +	ret =3D drm_dp_dpcd_writeb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
> > +				 DP_PAYLOAD_ACT_HANDLED);
> > +	if (ret < 0) {
> > +		DRM_DEBUG_DRIVER("Can't clear the ACT sent flag (%d)\n", ret);
> > +		return ret;
> > +	}
> > +	WARN_ON(ret !=3D 1);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_dp_clear_payload_status);
> > +
> >  static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *m=
gr,
> >  				     int id, struct drm_dp_payload *payload)
> >  {
> > @@ -4384,8 +4412,7 @@ static int drm_dp_dpcd_write_payload(struct drm_d=
p_mst_topology_mgr *mgr,
> >  	int ret;
> >  	int retries =3D 0;
> >  =

> > -	drm_dp_dpcd_writeb(mgr->aux, DP_PAYLOAD_TABLE_UPDATE_STATUS,
> > -			   DP_PAYLOAD_TABLE_UPDATED);
> =

> We used to clear DP_PAYLOAD_TABLE_UPDATED but now we clear
> DP_PAYLOAD_ACT_HANDLED ?

Eek. We should write DP_PAYLOAD_TABLE_UPDATED which is the only way to
clear both the act-handled and the table-updated flags. I tested things
that way but managed to send an old version. Thanks for catching it.

> =

> > +	drm_dp_clear_payload_status(mgr);
> >  =

> >  	payload_alloc[0] =3D id;
> >  	payload_alloc[1] =3D payload->start_slot;
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/=
drm/i915/display/intel_dp_mst.c
> > index 9308b5920780..3c4b0fb10d8b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -323,6 +323,8 @@ static void clear_act_sent(struct intel_dp *intel_d=
p)
> >  =

> >  	intel_de_write(i915, intel_dp->regs.dp_tp_status,
> >  		       DP_TP_STATUS_ACT_SENT);
> > +
> > +	drm_dp_clear_payload_status(&intel_dp->mst_mgr);
> >  }
> >  =

> >  static void wait_for_act_sent(struct intel_dp *intel_dp)
> > diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_h=
elper.h
> > index 8b9eb4db3381..2facb87624bf 100644
> > --- a/include/drm/drm_dp_mst_helper.h
> > +++ b/include/drm/drm_dp_mst_helper.h
> > @@ -763,6 +763,8 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topolo=
gy_mgr *mgr,
> >  			   int pbn);
> >  =

> >  =

> > +int drm_dp_clear_payload_status(struct drm_dp_mst_topology_mgr *mgr);
> > +
> >  int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr);
> >  =

> >  =

> > -- =

> > 2.23.1
> =

> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
