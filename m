Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3EC264830
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 16:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6816E0D2;
	Thu, 10 Sep 2020 14:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D517C6E0D2;
 Thu, 10 Sep 2020 14:46:27 +0000 (UTC)
IronPort-SDR: 81pe3WUUMdPAghELRYsbBqbOs6Nq7B+AJawcJr22G5MKHtygvc9X5Aj5tmzqL5ehrRS7L4Vukv
 mK3xIt74chQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="146265913"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="146265913"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 07:46:26 -0700
IronPort-SDR: F7x1XAFxak9jxoMnSzC0n0WPTL4nWiX8RHcRVcmc2C/bOFDQDNgZjXAZIWF07OLmExU32iMz47
 sr0fuZ9tU29Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="304902237"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 10 Sep 2020 07:46:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Sep 2020 17:46:23 +0300
Date: Thu, 10 Sep 2020 17:46:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 07/18] drm/dp: Pimp drm_dp_downstream_max_bpc()
Message-ID: <20200910144623.GA6112@intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
 <20200904115354.25336-8-ville.syrjala@linux.intel.com>
 <b74be975fee266257887126a0d2921ac550d725f.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b74be975fee266257887126a0d2921ac550d725f.camel@redhat.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 01:51:56PM -0400, Lyude Paul wrote:
> On Fri, 2020-09-04 at 14:53 +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Deal with more cases in drm_dp_downstream_max_bpc():
> > - DPCD 1.0 -> assume 8bpc for non-DP
> > - DPCD 1.1+ DP (or DP++ with DP sink) -> allow anything
> > - DPCD 1.1+ TMDS -> check the caps, assume 8bpc if the value is crap
> > - anything else -> assume 8bpc
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_dp_helper.c               | 69 +++++++++++--------
> >  .../drm/i915/display/intel_display_debugfs.c  |  3 +-
> >  drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
> >  include/drm/drm_dp_helper.h                   | 10 ++-
> >  4 files changed, 51 insertions(+), 33 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > b/drivers/gpu/drm/drm_dp_helper.c
> > index 0fcb94f7dbe5..ab87209c25d8 100644
> > --- a/drivers/gpu/drm/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > @@ -653,36 +653,44 @@ int drm_dp_downstream_max_clock(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE],
> >  EXPORT_SYMBOL(drm_dp_downstream_max_clock);
> >  =

> >  /**
> > - * drm_dp_downstream_max_bpc() - extract branch device max
> > - *                               bits per component
> > - * @dpcd: DisplayPort configuration data
> > - * @port_cap: port capabilities
> > - *
> > - * See also:
> > - * drm_dp_read_downstream_info()
> > - * drm_dp_downstream_max_clock()
> > - *
> > - * Returns: Max bpc on success or 0 if max bpc not defined
> > - */
> > +  * drm_dp_downstream_max_bpc() - extract downstream facing port max
> > +  *                               bits per component
> > +  * @dpcd: DisplayPort configuration data
> > +  * @port_cap: downstream facing port capabilities
> > +  * @edid: EDID
> > +  *
> > +  * Returns max bpc on success or 0 if max bpc not defined
> > +  */
> >  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > -			      const u8 port_cap[4])
> > +			      const u8 port_cap[4],
> > +			      const struct edid *edid)
> >  {
> > -	int type =3D port_cap[0] & DP_DS_PORT_TYPE_MASK;
> > -	bool detailed_cap_info =3D dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> > -		DP_DETAILED_CAP_INFO_AVAILABLE;
> > -	int bpc;
> > -
> > -	if (!detailed_cap_info)
> =

> I don't think we can drop this check. There's a somewhat surprising blurb
> about downstream port caps in the DP 2.0 spec (section 5.3.3.1):
> =

>    In addition, the adapter shall set the Detailed Capabilities Info regi=
sters
>    (DPCD Addresses 00080h through 0008Fh) to show all the downstream type=
s,
>    including DFP 0. Either one or four bytes are used, per DFP type
>    indication. Therefore, up to 16 (with 1-byte descriptor) or four (with=
 4-
>    byte descriptor) DFP capabilities can be stored.
> =

> I've never once actually seen a sink do this, but this does mean it's
> technically possible tthat if we don't check the detailed caps bit then we
> might end up reading another port's DFP type instead of max_bpc info. Note
> though that we can make the assumption the four byte version of the field=
 is
> used for DP 1.4+

The check is now ...


> =

> > +	if (!drm_dp_is_branch(dpcd))
> >  		return 0;
> >  =

> > -	switch (type) {
> > -	case DP_DS_PORT_TYPE_VGA:
> > -	case DP_DS_PORT_TYPE_DVI:
> > -	case DP_DS_PORT_TYPE_HDMI:
> > +	if (dpcd[DP_DPCD_REV] < 0x11) {
> > +		switch (dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> > DP_DWN_STRM_PORT_TYPE_MASK) {
> > +		case DP_DWN_STRM_PORT_TYPE_DP:
> > +			return 0;
> > +		default:
> > +			return 8;
> > +		}
> > +	}
> > +
> > +	switch (port_cap[0] & DP_DS_PORT_TYPE_MASK) {
> > +	case DP_DS_PORT_TYPE_DP:
> > +		return 0;
> >  	case DP_DS_PORT_TYPE_DP_DUALMODE:
> > -		bpc =3D port_cap[2] & DP_DS_MAX_BPC_MASK;
> > +		if (is_edid_digital_input_dp(edid))
> > +			return 0;
> > +		fallthrough;
> > +	case DP_DS_PORT_TYPE_HDMI:
> > +	case DP_DS_PORT_TYPE_DVI:
> > +	case DP_DS_PORT_TYPE_VGA:
> > +		if ((dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> > DP_DETAILED_CAP_INFO_AVAILABLE) =3D=3D 0)
> > +			return 8;

... here


> >  =

> > -		switch (bpc) {
> > +		switch (port_cap[2] & DP_DS_MAX_BPC_MASK) {
> >  		case DP_DS_8BPC:
> >  			return 8;
> >  		case DP_DS_10BPC:
> > @@ -691,10 +699,12 @@ int drm_dp_downstream_max_bpc(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE],
> >  			return 12;
> >  		case DP_DS_16BPC:
> >  			return 16;
> > +		default:
> > +			return 8;
> >  		}
> > -		fallthrough;
> > +		break;
> >  	default:
> > -		return 0;
> > +		return 8;
> >  	}
> >  }
> >  EXPORT_SYMBOL(drm_dp_downstream_max_bpc);
> > @@ -717,12 +727,15 @@ EXPORT_SYMBOL(drm_dp_downstream_id);
> >   * @m: pointer for debugfs file
> >   * @dpcd: DisplayPort configuration data
> >   * @port_cap: port capabilities
> > + * @edid: EDID
> >   * @aux: DisplayPort AUX channel
> >   *
> >   */
> >  void drm_dp_downstream_debug(struct seq_file *m,
> >  			     const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > -			     const u8 port_cap[4], struct drm_dp_aux *aux)
> > +			     const u8 port_cap[4],
> > +			     const struct edid *edid,
> > +			     struct drm_dp_aux *aux)
> >  {
> >  	bool detailed_cap_info =3D dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> >  				 DP_DETAILED_CAP_INFO_AVAILABLE;
> > @@ -789,7 +802,7 @@ void drm_dp_downstream_debug(struct seq_file *m,
> >  				seq_printf(m, "\t\tMax TMDS clock: %d kHz\n",
> > clk);
> >  		}
> >  =

> > -		bpc =3D drm_dp_downstream_max_bpc(dpcd, port_cap);
> > +		bpc =3D drm_dp_downstream_max_bpc(dpcd, port_cap, edid);
> >  =

> >  		if (bpc > 0)
> >  			seq_printf(m, "\t\tMax bpc: %d\n", bpc);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > index 53a0a3d9a22d..0bf31f9a8af5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> > @@ -626,6 +626,7 @@ static void intel_dp_info(struct seq_file *m,
> >  {
> >  	struct intel_encoder *intel_encoder =3D
> > intel_attached_encoder(intel_connector);
> >  	struct intel_dp *intel_dp =3D enc_to_intel_dp(intel_encoder);
> > +	const struct drm_property_blob *edid =3D intel_connector-
> > >base.edid_blob_ptr;
> >  =

> >  	seq_printf(m, "\tDPCD rev: %x\n", intel_dp->dpcd[DP_DPCD_REV]);
> >  	seq_printf(m, "\taudio support: %s\n", yesno(intel_dp->has_audio));
> > @@ -633,7 +634,7 @@ static void intel_dp_info(struct seq_file *m,
> >  		intel_panel_info(m, &intel_connector->panel);
> >  =

> >  	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp->downstream_ports,
> > -				&intel_dp->aux);
> > +				edid ? edid->data : NULL, &intel_dp->aux);
> >  }
> >  =

> >  static void intel_dp_mst_info(struct seq_file *m,
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 2c8e82d97a34..c73b3efd84e0 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -6071,7 +6071,7 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
> >  =

> >  	intel_dp->dfp.max_bpc =3D
> >  		drm_dp_downstream_max_bpc(intel_dp->dpcd,
> > -					  intel_dp->downstream_ports);
> > +					  intel_dp->downstream_ports, edid);
> >  =

> >  	drm_dbg_kms(&i915->drm, "[CONNECTOR:%d:%s] DFP max bpc %d\n",
> >  		    connector->base.base.id, connector->base.name,
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 4f946826dfce..6218de1294c1 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -1646,10 +1646,14 @@ bool drm_dp_downstream_is_tmds(const u8
> > dpcd[DP_RECEIVER_CAP_SIZE],
> >  int drm_dp_downstream_max_clock(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> >  				const u8 port_cap[4]);
> >  int drm_dp_downstream_max_bpc(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > -			      const u8 port_cap[4]);
> > +			      const u8 port_cap[4],
> > +			      const struct edid *edid);
> >  int drm_dp_downstream_id(struct drm_dp_aux *aux, char id[6]);
> > -void drm_dp_downstream_debug(struct seq_file *m, const u8
> > dpcd[DP_RECEIVER_CAP_SIZE],
> > -			     const u8 port_cap[4], struct drm_dp_aux *aux);
> > +void drm_dp_downstream_debug(struct seq_file *m,
> > +			     const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > +			     const u8 port_cap[4],
> > +			     const struct edid *edid,
> > +			     struct drm_dp_aux *aux);
> >  enum drm_mode_subconnector
> >  drm_dp_subconnector_type(const u8 dpcd[DP_RECEIVER_CAP_SIZE],
> >  			 const u8 port_cap[4]);
> -- =

> Cheers,
> 	Lyude Paul (she/her)
> 	Software Engineer at Red Hat

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
