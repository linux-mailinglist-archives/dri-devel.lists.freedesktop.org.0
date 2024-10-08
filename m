Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851D59957AD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 21:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0195310E5AD;
	Tue,  8 Oct 2024 19:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUebyC3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE9910E5AD;
 Tue,  8 Oct 2024 19:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728416028; x=1759952028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FFH8zM3BROPn2pRXsqgKQKQLAlLNhwN/0ojTnn2VMp4=;
 b=OUebyC3aaiv2oA94MAecdHYeU9TFxdhX7cSIYusooHiYbMFkgx+M2Mg3
 y4w0MDrRLWNLuK0LhbbJc30yMFS5EHChAetPOrvzsDdBeI6C0Swa5UChC
 XQcBl8BP/LqiH10Nmgkdzt2BpKFe3rsynE6y/aZTf1HjDtS8ndBSUZqtj
 MJ7SLLvivflbT+wYsWapVknwSmNB+lYef6ddIX3S3bZkFGrBfNDGWZFoJ
 uLOKu8pxdzhUqSjjpGscZ0bT9biRjsLhelhgwqbpiG3vfi1FEUkFuXJ5r
 0AnRTGOztSRJafPUHPvd6+tjIQaOok3FCOKrYW/+uoHOKFpufeiiSsG3I w==;
X-CSE-ConnectionGUID: uT+r0g4IQt6VuAG+D0ubyg==
X-CSE-MsgGUID: 0DFRB98kRKmeuTg9w0b6Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27540455"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27540455"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 12:33:47 -0700
X-CSE-ConnectionGUID: nTFkb151R5WudsdFMM9pgQ==
X-CSE-MsgGUID: yuskp5osRa+qXowzI+D9rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="76069592"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 Oct 2024 12:33:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Oct 2024 22:33:44 +0300
Date: Tue, 8 Oct 2024 22:33:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/8] drm/client: Make copies of modes
Message-ID: <ZwWJGGh-ys9CtrsE@intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
 <20241003113304.11700-5-ville.syrjala@linux.intel.com>
 <d6678cad-7017-4d46-914f-27126d894b91@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6678cad-7017-4d46-914f-27126d894b91@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 07, 2024 at 09:36:13AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.10.24 um 13:33 schrieb Ville Syrjala:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > drm_client_firmware_config() is currently picking up the current
> > mode of the crtc via the legacy crtc->mode, which is not supposed
> > to be used by atomic drivers at all. We can't simply switch over
> > to the proper crtc->state->mode because we drop the crtc->mutex
> > (which protects crtc->state) before the mode gets used.
> >
> > The most straightforward solution to extend the lifetime of
> > modes[] seem to be to make full copies of the modes instead
> > of just storing pointers. We do have to replace the NULL checks
> > with something else though. Checking that mode->clock!=0
> > should be sufficient.
> >
> > And with this we can undo also commit 3eadd887dbac
> > ("drm/client:Fully protect modes[] with dev->mode_config.mutex")
> > as the lifetime of modes[] no longer has anything to do with
> > that lock.
> 
> I think it would be a lot better to first build that mode list while 
> holding the mutex, and afterwards copy the resulting modes before 
> releasing the lock. The code below is convoluted with drm_mode_copy().

My first thought was to make copies but still keep track
of pointers. That idea was a complete disaster because you
now had to carefully free the modes on the list.

I then considred some kind of double list approach, but that
too seemed more complicated/confusing than the (IMO fairly
straightforward) apporach I ended up with. I'd prefer to reduce
the nummber of arrays this thing uses rather than increase them.

> 
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/gpu/drm/drm_client_modeset.c | 80 +++++++++++++++-------------
> >   1 file changed, 43 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> > index 888323137a6a..d413e119db3f 100644
> > --- a/drivers/gpu/drm/drm_client_modeset.c
> > +++ b/drivers/gpu/drm/drm_client_modeset.c
> > @@ -265,10 +265,15 @@ static void drm_client_connectors_enabled(struct drm_connector *connectors[],
> >   		enabled[i] = drm_connector_enabled(connectors[i], false);
> >   }
> >   
> > +static bool mode_valid(const struct drm_display_mode *mode)
> > +{
> > +	return mode->clock != 0;
> 
> A mode's clock isn't always known and not all drivers might set it 
> correctly. At least in simpledrm/ofdrm, we have to make up a clock value 
> for the firmware framebuffer. Otherwise some of our userspace would oops.
> 
> The test for clock != 0 makes sense, but it's maybe the wrong place to 
> do this. Would a test for hdisplay/vdisplay != 0 work instead?

That would work as well. drm_mode_validate_basic() rejects
everything with clock/hdisplay/vdisplay==0.

> 
> > +}
> > +
> >   static bool drm_client_target_cloned(struct drm_device *dev,
> >   				     struct drm_connector *connectors[],
> >   				     unsigned int connector_count,
> > -				     const struct drm_display_mode *modes[],
> > +				     struct drm_display_mode modes[],
> >   				     struct drm_client_offset offsets[],
> >   				     bool enabled[], int width, int height)
> >   {
> > @@ -296,15 +301,16 @@ static bool drm_client_target_cloned(struct drm_device *dev,
> >   	for (i = 0; i < connector_count; i++) {
> >   		if (!enabled[i])
> >   			continue;
> > -		modes[i] = drm_connector_pick_cmdline_mode(connectors[i]);
> > -		if (!modes[i]) {
> > +
> > +		drm_mode_copy(&modes[i], drm_connector_pick_cmdline_mode(connectors[i]));
> > +		if (!mode_valid(&modes[i])) {
> 
> You're copying and only then test for validity?

I thought drm_mode_copy() is a nop for NULL. Turns out I was wrong,
hence the v2.

For this specific case I suppose one could also write something like
 if (whatever_mode())
	drm_mode_copy(&modes[i], whatever_mode());
here, but having to repeat oneself is not so great.

We could of course avoid that with
 mode = whatever_mode();
 if (mode)
	drm_mode_copy(&modes[i], mode);
with the downside of needing yet another local
variable.

-- 
Ville Syrjälä
Intel
