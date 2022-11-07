Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662961F80D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:56:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D4910E432;
	Mon,  7 Nov 2022 15:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A136410E438
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667836603; x=1699372603;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p+x7JSU3SOxlwX4TBBBHg1OTJgpF1kYj6OZkGlbsb4A=;
 b=FKscAI8+tAf5oPrwf5dzpe4JrFbCvr41OmWWmOKF8E8B7vaOwlheaukl
 +7UlNax7tMJUt2/l9O7LHbrPPTfwctRafqlvhWUI0z19RDO9FUjmWD2EU
 Xh3QkwSc6VHzk6usym9mhOoCg0GIFt+Hqv29c8OGy8Sg7rE1JFO9OOKOg
 9bnpmBcCw87i+NLFqUirwMx+pITsX1aVPFLDkeGAu5RGzF0OF2fnj17CJ
 5bzMnMK/p2dUyBpoa+5IXyXbzjcczeBgCePM14QeGpvBDM+xUHvPRT0ey
 TGoJTGrfjssf7If3inYbdzvDL6q6DjrLml82dSgfJB1aW+nh/bo0BccyH w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308067595"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308067595"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 07:56:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="810881641"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="810881641"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga005.jf.intel.com with SMTP; 07 Nov 2022 07:56:37 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 17:56:36 +0200
Date: Mon, 7 Nov 2022 17:56:36 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Subject: Re: [PATCH RESEND] drm: fix crash in drm_minor_alloc_release
Message-ID: <Y2kqtJH2K7O8sTu+@intel.com>
References: <20221107144500.3692212-1-stanislaw.gruszka@linux.intel.com>
 <Y2kf+HLy/Kz5BclF@intel.com>
 <20221107154041.GA3600973@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107154041.GA3600973@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 04:40:41PM +0100, Stanislaw Gruszka wrote:
> On Mon, Nov 07, 2022 at 05:10:48PM +0200, Ville Syrjälä wrote:
> > On Mon, Nov 07, 2022 at 03:45:00PM +0100, Stanislaw Gruszka wrote:
> > > index 8214a0b1ab7f..e3a1243dd2ae 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -102,7 +102,8 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> > >  
> > >  	WARN_ON(dev != minor->dev);
> > >  
> > > -	put_device(minor->kdev);
> > > +	if (!IS_ERR(minor->kdev))
> > > +		put_device(minor->kdev);
> > 
> > Assigning error pointers into things is a terrible idea.
> > IMO the correct fix would be to not return some
> > half-constructed garbage from drm_minor_alloc().
> > So basically should at least partically revert
> > commit f96306f9892b ("drm: manage drm_minor cleanup with drmm_")
> 
> I would prefer to not change any ordering or remove drmm_* stuff, since
> as pointed to above commit message, things are tricky there.

Looks to me that it's only tricky because of drmm. Without that it was
totally clear what was happening. I think if the managed stuff is making
stuff more tricky then it has failed its purpose.

> 
> I think assigning NULL to minor->kdev should be fine:
> 
> 	if (IS_ERR(minor->kdev)) {
> 		r = PTR_ERR(minor->kdev);
> 		minor->kdev = NULL;
> 		return r;
> 	}
> 
> put_device() in drm_minor_alloc_release() will cope nicely with it.
> 
> Regards
> Stanislaw

-- 
Ville Syrjälä
Intel
