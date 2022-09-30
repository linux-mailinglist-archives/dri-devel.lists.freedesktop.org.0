Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE75F0745
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 11:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E1F10EBF2;
	Fri, 30 Sep 2022 09:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DBC10EBEF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664529133; x=1696065133;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G3OWJsTXvQHQMsdN7K4jewvlv7vWi6GBuN29PwJEVN4=;
 b=OIi4aoDzPyf0HtmChqBulLZurl/7KSpXHujlKh1qJwabXRoWy8bjCPEX
 bIIY07gctNnycOE8FQDPH8Pm052aZjJyziiktJX7uI4HEzCzXel2csz01
 DbTPuMyxQZI3dMkq/l9cJt6tZ3HiB5RQRmnv6oLReDEDXYOFHesZ8S760
 aEB8rVCErH3R0CAvtMSZdPROUyHhsC8DHE5YJvG8JDvYnf2PjYNz6S4et
 FxQHmHWj1kjkdxjtk2h0JXojmlfls6/Fc48tUIfEQ4yDkCB1mov7EhMpR
 35mZiVyd+0oskUGOCcBYi6jqnpPk/LgW3zKdQr83nWKwPh6ld3BFumznU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="300864860"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="300864860"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 02:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="711735147"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="711735147"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 30 Sep 2022 02:12:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 12:12:09 +0300
Date: Fri, 30 Sep 2022 12:12:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC
 check
Message-ID: <Yzay6XYpfuZrknUZ@intel.com>
References: <20220929140714.14794-1-tzimmermann@suse.de>
 <YzXsFOjOuRUdeNo6@intel.com>
 <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, jfalempe@redhat.com, javierm@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 11:01:52AM +0200, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for reviewing.
> 
> Am 29.09.22 um 21:03 schrieb Ville Syrjälä:
> > On Thu, Sep 29, 2022 at 04:07:14PM +0200, Thomas Zimmermann wrote:
> >> In drm_atomic_helper_check_crtc_state(), do not add a new plane state
> >> to the global state if it does not exist already. Adding a new plane
> >> state will results in overhead for the plane during the atomic-commit
> >> step.
> >>
> >> For the test in drm_atomic_helper_check_crtc_state() to succeed, it is
> >> important that the CRTC has an enabled primary plane after the commit.
> >> This can be a newly enabled plane or an already enabled plane. So if a
> >> plane is not part of the commit, use the plane's existing state. The new
> >> helper drm_atomic_get_next_plane_state() returns the correct instance.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> Fixes: d6b9af1097fe ("drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()")
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Cc: Maxime Ripard <mripard@kernel.org>
> >> Cc: David Airlie <airlied@linux.ie>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: dri-devel@lists.freedesktop.org
> >> ---
> >>   drivers/gpu/drm/drm_atomic_helper.c |  4 +---
> >>   include/drm/drm_atomic.h            | 20 ++++++++++++++++++++
> >>   2 files changed, 21 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> >> index 98cc3137c062..463d4f3fa443 100644
> >> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >> @@ -960,9 +960,7 @@ int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
> >>   
> >>   			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> >>   				continue;
> >> -			plane_state = drm_atomic_get_plane_state(state, plane);
> >> -			if (IS_ERR(plane_state))
> >> -				return PTR_ERR(plane_state);
> >> +			plane_state = drm_atomic_get_next_plane_state(state, plane);
> >>   			if (plane_state->fb && plane_state->crtc) {
> > 
> > Hmm. Why this is even looking at these. If the plane is in the crtc's
> > plane_mask then surely plane_state->crtc must already point to this
> > crtc? And I don't think ->fb and ->crtc are allowed to disagree, so
> > if one is set then surely the other one must be as well or we'd
> > return an error at some point somewhere?
> 
> Yeah, the crtc test is done for keeping consistency. Other places also 
> sometimes validate that these fields don't disagree. I'll remove the 
> crtc test in the next version. The fb test is the important one.

What I'm asking how can you have crtc!=NULL && fb==NULL at all here?
Some other plane state check function (can't remember which one
specifically) should have rejected that. So either you're checking
for impossible things, or there is a bug somewhere else. 

So to me it looks like it should be enough to just check the plane_mask
and not even bother looking at the plane state at all.


> 
> > 
> >>   				has_primary_plane = true;
> >>   				break;
> >> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> >> index 10b1990bc1f6..4006f2d459e3 100644
> >> --- a/include/drm/drm_atomic.h
> >> +++ b/include/drm/drm_atomic.h
> >> @@ -623,6 +623,26 @@ drm_atomic_get_new_plane_state(struct drm_atomic_state *state,
> >>   	return state->planes[drm_plane_index(plane)].new_state;
> >>   }
> >>   
> >> +/**
> >> + * drm_atomic_get_next_plane_state - get plane state after atomic commit
> >> + * @state: global atomic state object
> >> + * @plane: plane to grab
> >> + *
> >> + * This function returns the plane state that the given plane will have
> >> + * after the atomic commit. This will be the new plane state if the plane
> >> + * is part of the global atomic state, or the current state otherwise.
> >> + */
> >> +static inline struct drm_plane_state *
> >> +drm_atomic_get_next_plane_state(struct drm_atomic_state *state,
> >> +				struct drm_plane *plane)
> >> +{
> >> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> >> +
> >> +	if (plane_state)
> >> +		return plane_state;
> >> +	return plane->state;
> > 
> > You're not holding the appropriate lock so that does not look safe. Even
> > if you know somewhere, somehow this sort of thing to be safe I don't
> > think it's a good idea to promote this with any kind of official
> > function because someone will shoot themselves in the foot with it.
> 
> OK. It'll be inlined with locking added.
> 
> Best regards
> Thomas
> 
> > 
> >> +}
> >> +
> >>   /**
> >>    * drm_atomic_get_existing_connector_state - get connector state, if it exists
> >>    * @state: global atomic state object
> >> -- 
> >> 2.37.3
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Ville Syrjälä
Intel
