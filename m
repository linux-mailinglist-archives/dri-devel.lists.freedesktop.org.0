Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1222F9E3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 22:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8591989E2A;
	Mon, 27 Jul 2020 20:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AECA89E2A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 20:11:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t142so9611117wmt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zDl5RUkfGHLSMInWwOp5px8udHYRLdUMjoic1PpjVzM=;
 b=KHq123hD2/MOYXmQm30EB+T4d29gRLDQE8GGnUbZIJXHvyl32bmUhJ6AL0P0OGCHdR
 T2iLLaWxd5MPHEG+8jlBEb5904LKf+hJ79p5kPdGa+N3iVa+Y6CVeZwLFYTdpaQUhs7D
 tsVSMWoP2JoVj05Bk1DLst1iCaCjNhYu2om7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zDl5RUkfGHLSMInWwOp5px8udHYRLdUMjoic1PpjVzM=;
 b=NKGT/8hndDoRT329j1PsbKBPiCupxPxVdzqXkdD1CqMFF67PW6ZMKMsPsDbeYtgnse
 Q8hiLkVWkNXTipPVZltNr6/bhon6zDY/OyQRfRacoUms2zLstoEZ44iuJHFW9ixOWv8o
 A636l/akjeNlny/fnM6y4IPDLL6RWNDXhUgw9Q8FVcp2gukLRMBkYTpZGXxgnW4uFNC5
 pmAPE8uQNRrK5zrEfJGgsZxu0+Cu0zKxrr0Bx75Ks2VLE/mIZuB+s95Tb2vR+NcE6NMx
 22W57wn+r67q7zOe/Ggp2IrWGBp3mN2bkevLJPJeFpYHIRZnea5zU3XBbvVzihlLS9SL
 JWOw==
X-Gm-Message-State: AOAM533mjyyBtT9T95Szsgt2tfyOmx/+zvzkJ3e8PAHGs+TlXICPSs2z
 gq1iWrbGrafKAmo7yp8xBL8LRg==
X-Google-Smtp-Source: ABdhPJx2a1g6uHcTUbQzBEkQW+R9PdQZzqy6R2CTGKDOzBc2bsgXoymvHQ3XrYGlWk0eY5Ti4DJdiw==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr762510wmj.164.1595880691611; 
 Mon, 27 Jul 2020 13:11:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b137sm1000166wmb.9.2020.07.27.13.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 13:11:30 -0700 (PDT)
Date: Mon, 27 Jul 2020 22:11:28 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH V2] drm: hold gem reference until object is no longer
 accessed
Message-ID: <20200727201128.GX6419@phenom.ffwll.local>
References: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
 <20200727195507.GA240123@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727195507.GA240123@kroah.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: adelva@google.com, Steve Cohen <cohens@codeaurora.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 pdhaval@codeaurora.org, seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 09:55:07PM +0200, Greg KH wrote:
> On Mon, Jul 20, 2020 at 06:30:50PM -0400, Steve Cohen wrote:
> > A use-after-free in drm_gem_open_ioctl can happen if the
> > GEM object handle is closed between the idr lookup and
> > retrieving the size from said object since a local reference
> > is not being held at that point. Hold the local reference
> > while the object can still be accessed to fix this and
> > plug the potential security hole.
> > 
> > Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 7bf628e..ee2058a 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -871,9 +871,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
> >   * @file_priv: drm file-private structure
> >   *
> >   * Open an object using the global name, returning a handle and the size.
> > - *
> > - * This handle (of course) holds a reference to the object, so the object
> > - * will not go away until the handle is deleted.
> >   */
> >  int
> >  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> > @@ -898,14 +895,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
> >  
> >  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
> >  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
> > -	drm_gem_object_put_unlocked(obj);
> >  	if (ret)
> > -		return ret;
> > +		goto err;
> >  
> >  	args->handle = handle;
> >  	args->size = obj->size;
> >  
> > -	return 0;
> > +err:
> > +	drm_gem_object_put_unlocked(obj);
> > +	return ret;
> >  }
> >  
> >  /**
> 
> As this seems to fix an important issue, any reason it wasn't cc: stable
> on it so that it gets backported properly?
> 
> How about a "Fixes:" tag so that we know what commit id it fixes so we
> know how far back to backport things?
> 
> And a hint to the maintainers that "this is an issue that needs to get
> into 5.8-final, it shouldn't wait around longer please" would have also
> been nice to see :)
> 
> And what chagned from v1, aren't you supposed to list that somewhere in
> the changelog or below the --- line (never remember what DRM drivers
> want here...)
> 
> Care to send a v3?

Don't worry, I'm pushing this to drm-misc-fixes now, should still make it
to 5.8. Plus cc: stable. I didn't bother with Fixes: since I think the bug
is rather old. Also, worst case you leak 32bit of some kernel memory that
got reused already (but yeah I know that's often enough to get the foot in
somewhere nasty and crack the door open).

I think it fell through cracks because Sam said he'll apply, guess that
didn't happen.

Also yes a changelog, somewhere, for next time around.
-Daniel


> 
> thanks,
> 
> greg k-h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
