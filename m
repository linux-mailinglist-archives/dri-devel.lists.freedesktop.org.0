Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6E061F7DB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F5C10E3F5;
	Mon,  7 Nov 2022 15:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE1B10E3F5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667835644; x=1699371644;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O1WMCw7z9oK5APN6bETV00yyQiB234s2mqfIGxbABoU=;
 b=WL5SkTsA7HrlbxK6dBbvd9SZy6leg9nS12M/1Qdv7wV7eC6RJztyuDco
 B8OYcCwAy7c5Ld2z/7XpezO6rdthNbQlsPNtJZiasmeGhmvxrhPtKBGWl
 JSOw+13V2JvRXJnM+yWK/x1S89coI8WTFP3N+7t9fiNnXRo4lEwQ0XGe+
 TBXCJgX4VzM9qQEVQSwKxAT0ZF2lMQDc0gX+l9eLlHEx9WzeVnwE48i1E
 Yi01ST3QGtS4ogHRZkT2QI3W3E3Ku8uO2qcTwX5JhruoT0LKO0hNlqguQ
 lj8/g7wNMd1mpWG6xz4ypp/l5vYq1auwZGI+TQcj7Fg2269IsCJKt2UnD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="337162029"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="337162029"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 07:40:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="725180860"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="725180860"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 07:40:42 -0800
Date: Mon, 7 Nov 2022 16:40:41 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH RESEND] drm: fix crash in drm_minor_alloc_release
Message-ID: <20221107154041.GA3600973@linux.intel.com>
References: <20221107144500.3692212-1-stanislaw.gruszka@linux.intel.com>
 <Y2kf+HLy/Kz5BclF@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2kf+HLy/Kz5BclF@intel.com>
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

On Mon, Nov 07, 2022 at 05:10:48PM +0200, Ville Syrjälä wrote:
> On Mon, Nov 07, 2022 at 03:45:00PM +0100, Stanislaw Gruszka wrote:
> > index 8214a0b1ab7f..e3a1243dd2ae 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -102,7 +102,8 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> >  
> >  	WARN_ON(dev != minor->dev);
> >  
> > -	put_device(minor->kdev);
> > +	if (!IS_ERR(minor->kdev))
> > +		put_device(minor->kdev);
> 
> Assigning error pointers into things is a terrible idea.
> IMO the correct fix would be to not return some
> half-constructed garbage from drm_minor_alloc().
> So basically should at least partically revert
> commit f96306f9892b ("drm: manage drm_minor cleanup with drmm_")

I would prefer to not change any ordering or remove drmm_* stuff, since
as pointed to above commit message, things are tricky there.

I think assigning NULL to minor->kdev should be fine:

	if (IS_ERR(minor->kdev)) {
		r = PTR_ERR(minor->kdev);
		minor->kdev = NULL;
		return r;
	}

put_device() in drm_minor_alloc_release() will cope nicely with it.

Regards
Stanislaw

