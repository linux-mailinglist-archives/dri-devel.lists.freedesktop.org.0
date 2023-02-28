Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1016A60F1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 22:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4309910E0CD;
	Tue, 28 Feb 2023 21:09:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD11410E025;
 Tue, 28 Feb 2023 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677618538; x=1709154538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZBYA86E1II7ug4ZqzgPazpy3WHVKYMEGhODdvErJabg=;
 b=eZq2i2XIH3Qjwk8CSYm0AegONK04pF7wfA5Btrbnv+947S8kxB0kraBH
 Q3e4bGpWusasH05sCYyRkm6HjTA5CSj5eYbt2pgZH6fQ91AiGgq9MDSgF
 H7lSJ5qZ1yimdURkpj8BfPf6CqRzH1WcjTvfoCZO3JVsQoD8/z9Df3pz4
 iOLkRmB9gnusmLQhd5npv1EVGnO7fIe9kP8Ny5ITQeJAt+Mmwu+17xOE+
 E4qe+Ka9NWAxMT/HahavPe3ZNC5tCAxzpszIr2/LNmPzcoa/vagy3HDpR
 jZHmWOPfUZhd79RprIUUcxfEV8amlv6jZHyuN4WJqKPR9FcznGDiYRhjA w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="399032389"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="399032389"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 13:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="817250930"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="817250930"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga001.fm.intel.com with SMTP; 28 Feb 2023 13:08:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 28 Feb 2023 23:08:54 +0200
Date: Tue, 28 Feb 2023 23:08:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/edid: Fix csync detailed mode parsing
Message-ID: <Y/5tZpaOZa6262FL@intel.com>
References: <20230227143648.7776-1-ville.syrjala@linux.intel.com>
 <87y1ohwnyl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1ohwnyl.fsf@intel.com>
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

On Tue, Feb 28, 2023 at 10:10:26PM +0200, Jani Nikula wrote:
> On Mon, 27 Feb 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Remove the bogus csync check and replace it with something that:
> > - triggers for all forms of csync, not just the basic analog variant
> > - actually populates the mode csync flags so that drivers can
> >   decide what to do with the mode
> >
> > Originally the code tried to outright reject csync, but that
> > apparently broke some bogus LCD monitor that claimed to have
> > a detailed mode that uses analog csync, despite also claiming
> > the monitor only support separate sync:
> > https://bugzilla.redhat.com/show_bug.cgi?id=540024
> > Potentially that monitor should just be quirked or something.
> >
> > Anyways, what we are dealing with now is some kind of funny i915
> > JSL machine with eDP where the panel claims to support a sensible
> > 60Hz separate sync mode, and a 50Hz mode with bipolar analog
> > csync. The 50Hz mode does not work so we want to not use it.
> > Easiest way is to just correctly flag it as csync and the driver
> > will reject it.
> >
> > TODO: or should we just reject any form of csync (or at least
> > the analog variants) for digital display interfaces?
> >
> > Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8146
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 23 +++++++++++++++--------
> >  include/drm/drm_edid.h     | 12 +++++++++---
> >  2 files changed, 24 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index ebab862b8b1a..fa20b1107ce3 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -3424,10 +3424,6 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
> >  			    connector->base.id, connector->name);
> >  		return NULL;
> >  	}
> > -	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
> > -		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
> > -			    connector->base.id, connector->name);
> > -	}
> >  
> >  	/* it is incorrect if hsync/vsync width is zero */
> >  	if (!hsync_pulse_width || !vsync_pulse_width) {
> > @@ -3474,10 +3470,21 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
> >  	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
> >  		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
> >  	} else {
> > -		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> > -			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> > -		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> > -			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> > +		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
> > +		case DRM_EDID_PT_ANALOG_CSYNC:
> > +		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
> > +		case DRM_EDID_PT_DIGITAL_CSYNC:
> > +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync!\n",
> > +				    connector->base.id, connector->name);
> > +			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
> 
> Not sure it makes a huge difference, and I expect this case to be rare,
> but what's the _N_ CSYNC based on here?

I think csync is pretty much always negative. Well, tri-state sync is
both negative and positive, but it goes negative first.

> 
> I also observe the spec appears to indicate "Horizontal Sync is Negative
> (outside of V-sync)" and "Horizontal Sync is Positive (outside of
> V-sync)" bit is valid also for Digital Composite Sync.
> 
> See how the bits for vertical sync have "1 1 0" or "1 1 1" but for
> horizontal sync it's "1 _ _ 0" and "1 _ _ 1". Does that indicate the
> polarity for digital composite sync?! The spec is not super clear.

Hmm. I tought EDID 1.4 got rid of that, but I guess it still
implies the hsync polarity applies to csync too.

Confusuingly it only talks about hsync and nothing about vsync.
Maybe it means both really. Not sure how anything would work 
anyway if hsync and vsync had opposite polarity here. Wouldn't
that just mean everything looks like vsync?

So I guess grabbing the csync polarity from that bit is
probably correct.

> 
> > +			break;
> > +		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
> > +			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
> > +				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
> > +			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
> > +				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
> 
> I think this is the good stuff, we shouldn't be looking at these flags
> and setting PHSYNC/NHSYNC/PVSYNC/NVSYNC unless we have digital separate
> sync.
> 
> Overall I think
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> Although it's not all completely clear. But I think being explicit is
> better than assuming something and simply debug logging about csync and
> not really doing anything about it.
> 
> > +			break;
> > +		}
> >  	}
> >  
> >  set_size:
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 70ae6c290bdc..49ee10272603 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -61,9 +61,15 @@ struct std_timing {
> >  	u8 vfreq_aspect;
> >  } __attribute__((packed));
> >  
> > -#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
> > -#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
> > -#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
> > +#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
> > +# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
> > +# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
> > +# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
> > +#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only */
> > +#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
> > +# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
> > +#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1)
> > +#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
> >  #define DRM_EDID_PT_STEREO         (1 << 5)
> >  #define DRM_EDID_PT_INTERLACED     (1 << 7)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
