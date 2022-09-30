Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 138985F090D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D873B10EC53;
	Fri, 30 Sep 2022 10:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C275F10EC53
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664533607; x=1696069607;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=raYBzqBDZluctPisluj4I2mAWSYKjB2ggoZk817TDXU=;
 b=HBr0p3OdM8c+hFBCgYAiLHuH9Oh4C9DuOn6l8h2osBnHk7aU80hoQu3p
 mSMgjX1TbhdbEiMGyIIz38fVclM6/zBn4nPW7T/dH3VrlX0th5ZKLqiBA
 cYBcoPzNXy8xl3vdqSlkoXT4PhPOzyd8hsYK6TnqpNGmaSVXCmp8pjF1A
 C0BMJ+hvaRGgRVzGvaFSIxQZ8GuRy7Yw02xRqxotHRPe6gH4XuK/YZo23
 JDcSw0h03jLs5i8kN5en2Hr2jq0Gz1GY0XqxjtLsA0wRp921cOAJ6W/xx
 uH0dJ3MY75zuWfW4S1aFvWU6ADYtL/5NGtkFN9Yf/SWVEkYL0jXYJFE+V Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="303645407"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="303645407"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 03:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="951500773"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="951500773"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga005.fm.intel.com with SMTP; 30 Sep 2022 03:26:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 30 Sep 2022 13:26:43 +0300
Date: Fri, 30 Sep 2022 13:26:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/atomic-helper: Don't allocated plane state in CRTC
 check
Message-ID: <YzbEYyUQIJX1ut1q@intel.com>
References: <20220929140714.14794-1-tzimmermann@suse.de>
 <YzXsFOjOuRUdeNo6@intel.com>
 <7e01f298-152c-d2b3-057c-b788c6f577b8@suse.de>
 <Yzay6XYpfuZrknUZ@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yzay6XYpfuZrknUZ@intel.com>
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

On Fri, Sep 30, 2022 at 12:12:09PM +0300, Ville Syrjälä wrote:
> On Fri, Sep 30, 2022 at 11:01:52AM +0200, Thomas Zimmermann wrote:
> > Hi,
> > 
> > thanks for reviewing.
> > 
> > Am 29.09.22 um 21:03 schrieb Ville Syrjälä:
> > > On Thu, Sep 29, 2022 at 04:07:14PM +0200, Thomas Zimmermann wrote:
> > >> In drm_atomic_helper_check_crtc_state(), do not add a new plane state
> > >> to the global state if it does not exist already. Adding a new plane
> > >> state will results in overhead for the plane during the atomic-commit
> > >> step.
> > >>
> > >> For the test in drm_atomic_helper_check_crtc_state() to succeed, it is
> > >> important that the CRTC has an enabled primary plane after the commit.
> > >> This can be a newly enabled plane or an already enabled plane. So if a
> > >> plane is not part of the commit, use the plane's existing state. The new
> > >> helper drm_atomic_get_next_plane_state() returns the correct instance.
> > >>
> > >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Fixes: d6b9af1097fe ("drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()")
> > >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> > >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > >> Cc: Maxime Ripard <mripard@kernel.org>
> > >> Cc: David Airlie <airlied@linux.ie>
> > >> Cc: Daniel Vetter <daniel@ffwll.ch>
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> ---
> > >>   drivers/gpu/drm/drm_atomic_helper.c |  4 +---
> > >>   include/drm/drm_atomic.h            | 20 ++++++++++++++++++++
> > >>   2 files changed, 21 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > >> index 98cc3137c062..463d4f3fa443 100644
> > >> --- a/drivers/gpu/drm/drm_atomic_helper.c
> > >> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > >> @@ -960,9 +960,7 @@ int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
> > >>   
> > >>   			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> > >>   				continue;
> > >> -			plane_state = drm_atomic_get_plane_state(state, plane);
> > >> -			if (IS_ERR(plane_state))
> > >> -				return PTR_ERR(plane_state);
> > >> +			plane_state = drm_atomic_get_next_plane_state(state, plane);
> > >>   			if (plane_state->fb && plane_state->crtc) {
> > > 
> > > Hmm. Why this is even looking at these. If the plane is in the crtc's
> > > plane_mask then surely plane_state->crtc must already point to this
> > > crtc? And I don't think ->fb and ->crtc are allowed to disagree, so
> > > if one is set then surely the other one must be as well or we'd
> > > return an error at some point somewhere?
> > 
> > Yeah, the crtc test is done for keeping consistency. Other places also 
> > sometimes validate that these fields don't disagree. I'll remove the 
> > crtc test in the next version. The fb test is the important one.
> 
> What I'm asking how can you have crtc!=NULL && fb==NULL at all here?
> Some other plane state check function (can't remember which one
> specifically) should have rejected that. So either you're checking
> for impossible things, or there is a bug somewhere else. 

Oh and btw, fb != NULL doesn't guarantee the plane is actually
visible (could have been fully clipped), if that is what you're
trying to check here.

-- 
Ville Syrjälä
Intel
