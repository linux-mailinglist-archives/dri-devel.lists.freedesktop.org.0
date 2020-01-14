Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2D0139E60
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 01:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E153F6E1B8;
	Tue, 14 Jan 2020 00:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F196E1B8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 00:37:43 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 16:37:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="424484284"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2020 16:37:43 -0800
Date: Mon, 13 Jan 2020 16:39:00 -0800
From: Manasi Navare <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/dp: Add function to parse EDID descriptors for
 adaptive sync limits
Message-ID: <20200114003900.GA27746@intel.com>
References: <20200108003208.18706-1-manasi.d.navare@intel.com>
 <20200109130852.GN1208@intel.com>
 <20200110231743.GB16729@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110231743.GB16729@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Nicholas Kazlauskas <nicholas.kazluaskas@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

So the two major changes you would like to see here are:

 use version_greate(edid) function =

and make use of :
drm_for_each_detailed_block() instead of the for loop.
But this function does not parse the monitor range yet so
you are suggesting modifying that dmr helper function as well?

Manasi

On Fri, Jan 10, 2020 at 03:17:43PM -0800, Manasi Navare wrote:
> On Thu, Jan 09, 2020 at 03:08:52PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Tue, Jan 07, 2020 at 04:32:08PM -0800, Manasi Navare wrote:
> > > Adaptive Sync is a VESA feature so add a DRM core helper to parse
> > > the EDID's detailed descritors to obtain the adaptive sync monitor ra=
nge.
> > > Store this info as part fo drm_display_info so it can be used
> > > across all drivers.
> > > This part of the code is stripped out of amdgpu's function
> > > amdgpu_dm_update_freesync_caps() to make it generic and be used
> > > across all DRM drivers
> > > =

> > > v2:
> > > * Change vmin and vmax to use u8 (Ville)
> > > * Dont store pixel clock since that is just a max dotclock
> > > and not related to VRR mode (Manasi)
> > > =

> > > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Clinton A Taylor <clinton.a.taylor@intel.com>
> > > Cc: Nicholas Kazlauskas <nicholas.kazluaskas@amd.com>
> > > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_edid.c  | 51 +++++++++++++++++++++++++++++++++++=
++
> > >  include/drm/drm_connector.h | 22 ++++++++++++++++
> > >  include/drm/drm_edid.h      |  2 ++
> > >  3 files changed, 75 insertions(+)
> > > =

> > > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > > index 99769d6c9f84..52781a0e708b 100644
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -4880,6 +4880,54 @@ static void drm_parse_cea_ext(struct drm_conne=
ctor *connector,
> > >  	}
> > >  }
> > >  =

> > > +void drm_get_adaptive_sync_limits(struct drm_connector *connector,
> > > +				  const struct edid *edid)
> > > +{
> > > +	struct drm_display_info *info =3D &connector->display_info;
> > > +	const struct detailed_timing *timing;
> > > +	const struct detailed_non_pixel *data;
> > > +	const struct detailed_data_monitor_range *range;
> > =

> > Needlessly wide scope for everything above.
> =

> Okay will move inside the for_each loop ?
> =

> > =

> > > +	int i;
> > > +
> > > +	/*
> > > +	 * Restrict Adaptive Sync only for dp and edp
> > > +	 */
> > > +	if (connector->connector_type !=3D DRM_MODE_CONNECTOR_DisplayPort &&
> > > +	    connector->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> > > +		return;
> > > +
> > > +	if (edid->version <=3D 1 && !(edid->version =3D=3D 1 && edid->revis=
ion > 1))
> > > +		return;
> > =

> > if (!version_greater(...))
> > 	return;
> =

> You mean simplify the condition or use define a function version_greater(=
) to check this condition?
> =

> > =

> > > +
> > > +	for (i =3D 0; i < 4; i++) {
> > =

> > This should probably use for_each_detailed_block()
> >
> =

> =

> Ok yes will use for_each_detailed_block
> =

> Manasi
> =

>  =

> > > +		timing  =3D &edid->detailed_timings[i];
> > > +		data    =3D &timing->data.other_data;
> > > +		range   =3D &data->data.range;
> > > +		/*
> > > +		 * Check if monitor has continuous frequency mode
> > > +		 */
> > > +		if (data->type !=3D EDID_DETAIL_MONITOR_RANGE)
> > > +			continue;
> > > +		/*
> > > +		 * Check for flag range limits only. If flag =3D=3D 1 then
> > > +		 * no additional timing information provided.
> > > +		 * Default GTF, GTF Secondary curve and CVT are not
> > > +		 * supported
> > > +		 */
> > > +		if (range->flags !=3D 1)
> > > +			continue;
> > > +
> > > +		info->adaptive_sync.min_vfreq =3D range->min_vfreq;
> > > +		info->adaptive_sync.max_vfreq =3D range->max_vfreq;
> > > +
> > > +		DRM_DEBUG_KMS("Adaptive Sync refresh rate range is %d Hz - %d Hz\n=
",
> > > +			      info->adaptive_sync.min_vfreq,
> > > +			      info->adaptive_sync.max_vfreq);
> > > +		break;
> > > +	}
> > > +}
> > > +EXPORT_SYMBOL(drm_get_adaptive_sync_limits);
> > > +
> > >  /* A connector has no EDID information, so we've got no EDID to comp=
ute quirks from. Reset
> > >   * all of the values which would have been set from EDID
> > >   */
> > > @@ -4901,6 +4949,7 @@ drm_reset_display_info(struct drm_connector *co=
nnector)
> > >  	memset(&info->hdmi, 0, sizeof(info->hdmi));
> > >  =

> > >  	info->non_desktop =3D 0;
> > > +	memset(&info->adaptive_sync, 0, sizeof(info->adaptive_sync));
> > >  }
> > >  =

> > >  u32 drm_add_display_info(struct drm_connector *connector, const stru=
ct edid *edid)
> > > @@ -4916,6 +4965,8 @@ u32 drm_add_display_info(struct drm_connector *=
connector, const struct edid *edi
> > >  =

> > >  	info->non_desktop =3D !!(quirks & EDID_QUIRK_NON_DESKTOP);
> > >  =

> > > +	drm_get_adaptive_sync_limits(connector, edid);
> > > +
> > >  	DRM_DEBUG_KMS("non_desktop set to %d\n", info->non_desktop);
> > >  =

> > >  	if (edid->revision < 3)
> > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > index 221910948b37..77df404a2e01 100644
> > > --- a/include/drm/drm_connector.h
> > > +++ b/include/drm/drm_connector.h
> > > @@ -254,6 +254,23 @@ enum drm_panel_orientation {
> > >  	DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
> > >  };
> > >  =

> > > +/**
> > > + * struct drm_adaptive_sync_info - Panel's Adaptive Sync capabilitie=
s for
> > > + * &drm_display_info
> > > + *
> > > + * This struct is used to store a Panel's Adaptive Sync capabilities
> > > + * as parsed from EDID's detailed monitor range descriptor block.
> > > + *
> > > + * @min_vfreq: This is the min supported refresh rate in Hz from
> > > + *             EDID's detailed monitor range.
> > > + * @max_vfreq: This is the max supported refresh rate in Hz from
> > > + *             EDID's detailed monitor range
> > > + */
> > > +struct drm_adaptive_sync_info {
> > > +	u8 min_vfreq;
> > > +	u8 max_vfreq;
> > > +};
> > > +
> > >  /*
> > >   * This is a consolidated colorimetry list supported by HDMI and
> > >   * DP protocol standard. The respective connectors will register
> > > @@ -465,6 +482,11 @@ struct drm_display_info {
> > >  	 * @non_desktop: Non desktop display (HMD).
> > >  	 */
> > >  	bool non_desktop;
> > > +
> > > +	/**
> > > +	 * @adaptive_sync: Adaptive Sync capabilities of the DP/eDP sink
> > > +	 */
> > > +	struct drm_adaptive_sync_info adaptive_sync;
> > >  };
> > >  =

> > >  int drm_display_info_set_bus_formats(struct drm_display_info *info,
> > > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > > index f0b03d401c27..b9a230aa3e69 100644
> > > --- a/include/drm/drm_edid.h
> > > +++ b/include/drm/drm_edid.h
> > > @@ -503,4 +503,6 @@ void drm_edid_get_monitor_name(struct edid *edid,=
 char *name,
> > >  struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
> > >  					   int hsize, int vsize, int fresh,
> > >  					   bool rb);
> > > +void drm_get_adaptive_sync_limits(struct drm_connector *connector,
> > > +				  const struct edid *edid);
> > >  #endif /* __DRM_EDID_H__ */
> > > -- =

> > > 2.19.1
> > =

> > -- =

> > Ville Syrj=E4l=E4
> > Intel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
