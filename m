Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D445AAFF0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 14:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FAA10E828;
	Fri,  2 Sep 2022 12:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF9710E82B;
 Fri,  2 Sep 2022 12:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662122767; x=1693658767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3gwVHlrTsPkNzuLM1RkqgziFv66dPQP0iNTuxReQkTk=;
 b=Rbp4CofyPCG9+0cfRYOpLGRWxsD+jMkJ002qvwfXGauzJmNyydG+TXV4
 +2RTM95qsdAVefAxmL458OKKn2EZl5+mEM8SnWsUJxk77EE+c4I4eRRXQ
 RbHYxZKykjFHsMW6rUIafJSCUxoqdOV5pd8labLaxSnPB5ddJMLxlBltS
 LasxvO81e4WN3iHRp705T58bxnV7b5yA41+5SN5qyCMfU/MQN9zsSD7ZY
 5SBIy1F2iiQkjjxMQThRNWry6LFT1FnwSlcvCsxGHxKCQWhWZcG3dF56P
 WYtASEySjMQW30KHMi1HFlJQ8vCcN10VXzYkPDKYonJD3kmw7IWUuC2Ej w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="276372797"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="276372797"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 05:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="716507768"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 02 Sep 2022 05:45:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Sep 2022 15:45:55 +0300
Date: Fri, 2 Sep 2022 15:45:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/edid: Use GTF2 for inferred modes
Message-ID: <YxH7ApmwbP99kKr4@intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-8-ville.syrjala@linux.intel.com>
 <87v8q6dku4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v8q6dku4.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 02, 2022 at 03:25:39PM +0300, Jani Nikula wrote:
> On Sat, 27 Aug 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > For some resaon we only use the secondary GTF curve for the
> > standard timings. Use it for inferred modes as well.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 0c7cbe9b44f5..fed2bdd55c09 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -3546,6 +3546,35 @@ static int drm_gtf_modes_for_range(struct drm_connector *connector,
> >  	return modes;
> >  }
> >  
> > +static int drm_gtf2_modes_for_range(struct drm_connector *connector,
> > +				    const struct drm_edid *drm_edid,
> > +				    const struct detailed_timing *timing)
> > +{
> > +	int i, modes = 0;
> > +	struct drm_display_mode *newmode;
> > +	struct drm_device *dev = connector->dev;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
> > +		const struct minimode *m = &extra_modes[i];
> > +
> > +		newmode = drm_gtf2_mode(dev, drm_edid, m->w, m->h, m->r);
> > +		if (!newmode)
> > +			return modes;
> > +
> > +		drm_mode_fixup_1366x768(newmode);
> > +		if (!mode_in_range(newmode, drm_edid, timing) ||
> > +		    !valid_inferred_mode(connector, newmode)) {
> > +			drm_mode_destroy(dev, newmode);
> > +			continue;
> > +		}
> > +
> > +		drm_mode_probed_add(connector, newmode);
> > +		modes++;
> > +	}
> > +
> > +	return modes;
> > +}
> > +
> >  static int drm_cvt_modes_for_range(struct drm_connector *connector,
> >  				   const struct drm_edid *drm_edid,
> >  				   const struct detailed_timing *timing)
> > @@ -3594,7 +3623,11 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
> >  		return; /* GTF not defined yet */
> >  
> >  	switch (range->flags) {
> > -	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG: /* XXX could do more */
> > +	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG:
> > +		closure->modes += drm_gtf2_modes_for_range(closure->connector,
> > +							   closure->drm_edid,
> > +							   timing);
> > +		break;
> >  	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:
> 
> Additionally, per spec:
> 
> * Default GTF supported if bit 0 in Feature Support Byte at address 18h = 1
> 
> * Secondary GTF supported --- requires support for Default GTF
> 
> So I guess both of these would need the edid->features &
> DRM_EDID_FEATURE_DEFAULT_GTF check?

There is one actually
	if (drm_edid->edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
	                num_modes += add_inferred_modes(connector, drm_edid);

Though as I think I mentioned in some of these patches a lot of
real world EDIDs don't set the default gtf/continuous frequency
bit but still include a range descriptor. While illegal, I think
a reasonable interpretation might be that they want us to use 
the formula specified in the range descriptor for the non-DMT
standard timings, while still indicating that other timings
generated by said formula are not supported. 

> 
> Other than that,
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> 
> >  		closure->modes += drm_gtf_modes_for_range(closure->connector,
> >  							  closure->drm_edid,
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
