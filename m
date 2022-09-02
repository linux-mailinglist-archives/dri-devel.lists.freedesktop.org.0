Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB85AB1E1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6821710E844;
	Fri,  2 Sep 2022 13:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAFD10E844;
 Fri,  2 Sep 2022 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662126254; x=1693662254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kIhTejJ9toZBphiJYncswQ1mwaNrsReI5PMujq9SNLA=;
 b=nD5KmeBt9hIK1ZxnyqBn7VXxY3QBvZz1B2O90dP4ipVhYrVZeZ546BkQ
 ZDjCw5Pn0x6+kPwszWFyecAHK8e4EBnrsx5JhRRBWz+QRAwCSHGnv4khI
 pfU3zd6vGw3IW/kQUgMlzuPz4yBoyTHyEdaGat3RJwZGDOL1k1LPJQbV3
 iLGuG2FlUvpiN+Fs/Udw0+RZL9Hl+BOJSMx2NLlXBlStXgyqqtBbhstap
 ndnybBNkZ6rbu44/PPDKMeKG808MvGP1eZaSc8xMD5zOQYni/SMG3ARPZ
 icsJp2BAlLKDeqZgSoNf8+8QJi2m5Fg+D9hJeFrnCs3CQi+BSM61VaKbv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="296763491"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="296763491"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="608983475"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 02 Sep 2022 06:44:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Sep 2022 16:44:10 +0300
Date: Fri, 2 Sep 2022 16:44:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Subject: Re: [PATCH 01/11] drm/edid: Handle EDID 1.4 range descriptor h/vfreq
 offsets
Message-ID: <YxIIqrhbc5vZltuC@intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-2-ville.syrjala@linux.intel.com>
 <20220827014012.GA106990@mdnavare-mobl1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220827014012.GA106990@mdnavare-mobl1.jf.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 26, 2022 at 06:40:12PM -0700, Navare, Manasi wrote:
> On Sat, Aug 27, 2022 at 12:34:51AM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > EDID 1.4 introduced some extra flags in the range
> > descriptor to support min/max h/vfreq >= 255. Consult them
> > to correctly parse the vfreq limits.
> > 
> > Note that some combinations of the flags are documented
> > as "reserved" (as are some other values in the descriptor)
> > but explicitly checking for those doesn't seem particularly
> > worthwile since we end up with bogus results whether we
> > decode them or not.
> > 
> > v2: Increase the storage to u16 to make it work (Jani)
> >     Note the "reserved" values situation (Jani)
> > v3: Document the EDID version number in the defines
> >     Drop some bogus (u8) casts
> > 
> > Cc: stable@vger.kernel.org
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6519
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_debugfs.c |  4 ++--
> >  drivers/gpu/drm/drm_edid.c    | 24 ++++++++++++++++++------
> >  include/drm/drm_connector.h   |  4 ++--
> >  include/drm/drm_edid.h        |  5 +++++
> >  4 files changed, 27 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > index 493922069c90..01ee3febb813 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -377,8 +377,8 @@ static int vrr_range_show(struct seq_file *m, void *data)
> >  	if (connector->status != connector_status_connected)
> >  		return -ENODEV;
> >  
> > -	seq_printf(m, "Min: %u\n", (u8)connector->display_info.monitor_range.min_vfreq);
> > -	seq_printf(m, "Max: %u\n", (u8)connector->display_info.monitor_range.max_vfreq);
> > +	seq_printf(m, "Min: %u\n", connector->display_info.monitor_range.min_vfreq);
> > +	seq_printf(m, "Max: %u\n", connector->display_info.monitor_range.max_vfreq);
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 90a5e26eafa8..4005dab6147d 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -6020,12 +6020,14 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
> >  }
> >  
> >  static
> > -void get_monitor_range(const struct detailed_timing *timing,
> > -		       void *info_monitor_range)
> > +void get_monitor_range(const struct detailed_timing *timing, void *c)
> >  {
> > -	struct drm_monitor_range_info *monitor_range = info_monitor_range;
> > +	struct detailed_mode_closure *closure = c;
> > +	struct drm_display_info *info = &closure->connector->display_info;
> > +	struct drm_monitor_range_info *monitor_range = &info->monitor_range;
> >  	const struct detailed_non_pixel *data = &timing->data.other_data;
> >  	const struct detailed_data_monitor_range *range = &data->data.range;
> > +	const struct edid *edid = closure->drm_edid->edid;
> >  
> >  	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
> >  		return;
> > @@ -6041,18 +6043,28 @@ void get_monitor_range(const struct detailed_timing *timing,
> >  
> >  	monitor_range->min_vfreq = range->min_vfreq;
> >  	monitor_range->max_vfreq = range->max_vfreq;
> > +
> > +	if (edid->revision >= 4) {
> > +		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
> > +			monitor_range->min_vfreq += 255;
> > +		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
> > +			monitor_range->max_vfreq += 255;
> 
> Yes this makes sense. This looks like added for supporting HRR (high
> refresh rate) panels.
> Do you think we should mention that in the commit message or in the
> comment in the code itself?

Didn't really see any need for that. Should be fairly obvious
a single u8 alone can't represent big values.

> 
> Other than that looks good to me:
> 
> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Thanks. Pushed this one to drm-misc-fixes.

> 
> Manasi
> 
> > +	}
> >  }
> >  
> >  static void drm_get_monitor_range(struct drm_connector *connector,
> >  				  const struct drm_edid *drm_edid)
> >  {
> > -	struct drm_display_info *info = &connector->display_info;
> > +	const struct drm_display_info *info = &connector->display_info;
> > +	struct detailed_mode_closure closure = {
> > +		.connector = connector,
> > +		.drm_edid = drm_edid,
> > +	};
> >  
> >  	if (!version_greater(drm_edid, 1, 1))
> >  		return;
> >  
> > -	drm_for_each_detailed_block(drm_edid, get_monitor_range,
> > -				    &info->monitor_range);
> > +	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
> >  
> >  	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
> >  		      info->monitor_range.min_vfreq,
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 248206bbd975..56aee949c6fa 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -319,8 +319,8 @@ enum drm_panel_orientation {
> >   *             EDID's detailed monitor range
> >   */
> >  struct drm_monitor_range_info {
> > -	u8 min_vfreq;
> > -	u8 max_vfreq;
> > +	u16 min_vfreq;
> > +	u16 max_vfreq;
> >  };
> >  
> >  /**
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 2181977ae683..1ed61e2b30a4 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -92,6 +92,11 @@ struct detailed_data_string {
> >  	u8 str[13];
> >  } __attribute__((packed));
> >  
> > +#define DRM_EDID_RANGE_OFFSET_MIN_VFREQ (1 << 0) /* 1.4 */
> > +#define DRM_EDID_RANGE_OFFSET_MAX_VFREQ (1 << 1) /* 1.4 */
> > +#define DRM_EDID_RANGE_OFFSET_MIN_HFREQ (1 << 2) /* 1.4 */
> > +#define DRM_EDID_RANGE_OFFSET_MAX_HFREQ (1 << 3) /* 1.4 */
> > +
> >  #define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00
> >  #define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01
> >  #define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02
> > -- 
> > 2.35.1
> > 

-- 
Ville Syrjälä
Intel
