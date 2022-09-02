Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6215AB2B4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 16:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455AA10E855;
	Fri,  2 Sep 2022 14:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E2210E846;
 Fri,  2 Sep 2022 14:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662127324; x=1693663324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5v9CULFfuPfdm9D8YPgxPVfK73ifSs/YqwYUxK0SCWA=;
 b=hmAw8MGahh8qNec1IsuVNm6z/N8ayBQblATT7dokSR+DDqOGd3KPDxEP
 RiQhO9u3KZJW2whMB+36yAH2dn8+6j7wUSgG51k06YHfngaYuPmq2De7t
 74vT9aX8PJo5Pxxf3l8l57rny7UP7I8JlUMrAhPxZyVYdqdPb4/biIMVO
 FZU40nGHPK8c+o0MbJETebi0PCB8lO88JuAI1JuvH9HA7qXdXK/8yX78U
 CO0K9xhCiOPNMeocUugPVbqquU7AHcbpePzdJZ9Wo3E0FfkR4sJSlmR6A
 ogZgjkaz4xwxKRYu/dgNr7vBt0IW3XoX/c+mPXxq5NiQ0Ks3IQxbs8j+s Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359943562"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="359943562"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 07:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="702147263"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 02 Sep 2022 07:02:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Sep 2022 17:02:00 +0300
Date: Fri, 2 Sep 2022 17:02:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 08/11] drm/edid: Use the correct formula for
 standard timings
Message-ID: <YxIM2EmoMc1ElSCK@intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
 <20220826213501.31490-9-ville.syrjala@linux.intel.com>
 <87edwtevvz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87edwtevvz.fsf@intel.com>
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

On Fri, Sep 02, 2022 at 04:41:36PM +0300, Jani Nikula wrote:
> On Sat, 27 Aug 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Prefer the timing formula indicated by the range
> > descriptor for generating the non-DMT standard timings.
> >
> > Previously we just used CVT for all EDID 1.4 continuous
> > frequency displays without even checking if the range
> > descriptor indicates otherwise. Now we check the range
> > descriptor first, and fall back to CVT if nothing else
> > was indicated. EDID 1.4 more or less deprecates GTF/GTF2
> > but there are still a lot of 1.4 EDIDs out there that
> > don't advertise CVT support, so seems safer to use the
> > formula the EDID actually reports as supported.
> >
> > For EDID 1.3 we use GTF2 if indicated (as before), and for
> > EDID 1.2+ we now just use GTF without even checking the
> > feature flag. There seem to be quite a few EDIDs out there that
> > don't set the GTF feature flag but still include a GTF range
> > descriptor and non-DMT standard timings.
> >
> > This to me seems to be roughly what appendix B of EDID 1.4
> > suggests should be done.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 49 +++++++++++++++++++++++++++++++-------
> >  1 file changed, 41 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index fed2bdd55c09..c1c85b9e1208 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -3077,20 +3077,53 @@ drm_gtf2_2j(const struct drm_edid *drm_edid)
> >  	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2.j : 0;
> >  }
> >  
> > +static void
> > +get_timing_level(const struct detailed_timing *descriptor, void *data)
> > +{
> > +	int *res = data;
> > +
> > +	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
> > +		return;
> > +
> > +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.flags) != 10);
> > +
> > +	switch (descriptor->data.other_data.data.range.flags) {
> > +	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:
> > +		*res = LEVEL_GTF;
> > +		break;
> > +	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG:
> > +		*res = LEVEL_GTF2;
> > +		break;
> > +	case DRM_EDID_CVT_SUPPORT_FLAG:
> > +		*res = LEVEL_CVT;
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> >  /* Get standard timing level (CVT/GTF/DMT). */
> >  static int standard_timing_level(const struct drm_edid *drm_edid)
> >  {
> >  	const struct edid *edid = drm_edid->edid;
> >  
> > -	if (edid->revision >= 2) {
> > -		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
> > -			return LEVEL_CVT;
> > -		if (drm_gtf2_hbreak(drm_edid))
> > -			return LEVEL_GTF2;
> > -		if (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
> > -			return LEVEL_GTF;
> > +	if (edid->revision >= 4) {
> > +		/*
> > +		 * If the range descriptor doesn't
> > +		 * indicate otherwise default to CVT
> > +		 */
> > +		int ret = LEVEL_CVT;
> > +
> > +		drm_for_each_detailed_block(drm_edid, get_timing_level, &ret);
> 
> Please remind me why it's okay to iterate all of them and pick the last?
> I mean ret gets overwritten by the last block.

I think there is an implied assumption that there is only
zero or one of these included in the EDID. While not explicitly
stated in the spec, there is no mention anywhere what it would
mean to have multiple different types of range descriptors.
And so far I didn't come across any EDIDs that would disagree with
that.

> 
> Otherwise it all seems okay to me, though I admit my confidence level in
> this review is considerably lower than for the other patches.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> > +
> > +		return ret;
> > +	} else if (edid->revision >= 3 && drm_gtf2_hbreak(drm_edid)) {
> > +		return LEVEL_GTF2;
> > +	} else if (edid->revision >= 2) {
> > +		return LEVEL_GTF;
> > +	} else {
> > +		return LEVEL_DMT;
> >  	}
> > -	return LEVEL_DMT;
> >  }
> >  
> >  /*
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
