Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E511A621948
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAA510E4BA;
	Tue,  8 Nov 2022 16:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF9F10E4CE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667924666; x=1699460666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JWcp+udE3kV0sIzY3NzDGLFMJx9zyzsbuG1EyA3H/yQ=;
 b=Fycmh0lQvoATA/PX5pKEBSu+WeWELKEhsWHV866On0tPQ+PaMpCL1VDr
 F3AcnJ51QqP8Qh4NOh6kUfpAfg9Hx7rN+NF6MqQQoMscWwfRYgBGw03kt
 tEMbNM2gxXhOqG4j01DquHfWA1x6C65LySEQ1lPm49n65qjO//p4Tyzvd
 zBU21vdRiboavz2kwqSt/D0M8NpJAvlKkHoIoH0ShCUZtEV8E0ZIZsRTk
 M9CN4xqSdWbqWEyTmEpx91yA5SvnIRKuDtGeMJ1u9BMUALXkjZC38722N
 KTJKuVERsYTy2b58Ncseghta4dTDUu5D+wDQHSSDBxIacq3P2QqV9kpQV w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="308359866"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="308359866"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 08:24:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="965646683"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="965646683"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 08:24:23 -0800
Date: Tue, 8 Nov 2022 17:24:22 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH RESEND] drm: fix crash in drm_minor_alloc_release
Message-ID: <20221108162422.GB6397@linux.intel.com>
References: <20221107144500.3692212-1-stanislaw.gruszka@linux.intel.com>
 <Y2kf+HLy/Kz5BclF@intel.com>
 <20221107154041.GA3600973@linux.intel.com>
 <Y2kqtJH2K7O8sTu+@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2kqtJH2K7O8sTu+@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 05:56:36PM +0200, Ville Syrjälä wrote:
> On Mon, Nov 07, 2022 at 04:40:41PM +0100, Stanislaw Gruszka wrote:
> > On Mon, Nov 07, 2022 at 05:10:48PM +0200, Ville Syrjälä wrote:
> > > On Mon, Nov 07, 2022 at 03:45:00PM +0100, Stanislaw Gruszka wrote:
> > > > index 8214a0b1ab7f..e3a1243dd2ae 100644
> > > > --- a/drivers/gpu/drm/drm_drv.c
> > > > +++ b/drivers/gpu/drm/drm_drv.c
> > > > @@ -102,7 +102,8 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> > > >  
> > > >  	WARN_ON(dev != minor->dev);
> > > >  
> > > > -	put_device(minor->kdev);
> > > > +	if (!IS_ERR(minor->kdev))
> > > > +		put_device(minor->kdev);
> > > 
> > > Assigning error pointers into things is a terrible idea.
> > > IMO the correct fix would be to not return some
> > > half-constructed garbage from drm_minor_alloc().
> > > So basically should at least partically revert
> > > commit f96306f9892b ("drm: manage drm_minor cleanup with drmm_")
> > 
> > I would prefer to not change any ordering or remove drmm_* stuff, since
> > as pointed to above commit message, things are tricky there.
> 
> Looks to me that it's only tricky because of drmm. Without that it was
> totally clear what was happening. I think if the managed stuff is making
> stuff more tricky then it has failed its purpose.

I'm not huge fan of managed resources everywhere either, but I think
we should do rather small fixes for bugs to avoid regressions.

> > I think assigning NULL to minor->kdev should be fine:
> > 
> > 	if (IS_ERR(minor->kdev)) {
> > 		r = PTR_ERR(minor->kdev);
> > 		minor->kdev = NULL;
> > 		return r;
> > 	}

Seems having minor->kdev NULL was ordinal Daniel idea in commit
f96306f9892b, but was not done properly when finally patch get's in.

Regards
Stanislaw
