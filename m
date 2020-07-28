Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4C2305D1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 10:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED9A6E21D;
	Tue, 28 Jul 2020 08:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D2C6E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:52:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o8so16519355wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 01:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HGy3jmbnLWtAugJhNyMPmIfpo7WUVn9rkKkQMW0ipLs=;
 b=M0e+APlLzUzGPEQPb5lfmfSp/o1k5PEssqciRfuFNdb3qha7nkzlBkC5i4JT2rzaO3
 sVfant5ccFL4AzNOePYhmHnXyZ4waR4H7ygUIgWUkzaFMamybKKUIxUuo6i3HWPBvxGn
 RoVPbV+rY96rVH4R2kzqG5FARO4ooptQ5407s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HGy3jmbnLWtAugJhNyMPmIfpo7WUVn9rkKkQMW0ipLs=;
 b=hkFj3cqV06PJkq/lB4IuwvYpKLhEepWVPc6lvGvmbeL7Xb9CAI9Fr2VwDZJnozgGh+
 0QUUjmvbYEMG9KM4xrZ853JSgV1etWks7l9Jj06LoqcRvXTVCbR5HGowURvO//RSLXt6
 HLr/Ovfy9HRiPZWCKE6btWImXA0qD/xbM3R8QMgDpa/tXWHuj7fPWTr4qL7UfOw/IYlU
 UMQyIfNZ6MchH28PvgrwcX6V3dgrq3uoC70G4JZfvuj8Cq5H3l29ROxxVFeXVx3aIY6f
 aIMgi/LfC9mSNth38gndlWA/jVJYtLwnZ1gPln4lQLjQ+x5/0/ZE2k1RHySeAbKQ1iJ0
 e0AQ==
X-Gm-Message-State: AOAM5305Rg6CK4aByEDaJWxAqqpO8X7A/upLDvl7oAMgfQ7oO8ogjegs
 NyETyysT9yr0iojcruIwjBB2/Q==
X-Google-Smtp-Source: ABdhPJyiM85CyXyw1HU6z/kML8IsbJGp9eXAAaJbV6ajj+CHl0qhajof/NwnJjkMBiAqdI6zzfqQxw==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr3189753wmc.160.1595926367684; 
 Tue, 28 Jul 2020 01:52:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z207sm3317950wmc.2.2020.07.28.01.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 01:52:46 -0700 (PDT)
Date: Tue, 28 Jul 2020 10:52:44 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [Freedreno] [PATCH V2] drm: hold gem reference until object is
 no longer accessed
Message-ID: <20200728085244.GY6419@phenom.ffwll.local>
References: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
 <20200727195507.GA240123@kroah.com>
 <20200727201128.GX6419@phenom.ffwll.local>
 <f035111e7139bdaeb7562afd2415f366@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f035111e7139bdaeb7562afd2415f366@codeaurora.org>
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
Cc: adelva@google.com, sam@ravnborg.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pdhaval@codeaurora.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 27, 2020 at 05:54:59PM -0400, cohens@codeaurora.org wrote:
> On 2020-07-27 16:11, daniel@ffwll.ch wrote:
> > On Mon, Jul 27, 2020 at 09:55:07PM +0200, Greg KH wrote:
> > > On Mon, Jul 20, 2020 at 06:30:50PM -0400, Steve Cohen wrote:
> > > > A use-after-free in drm_gem_open_ioctl can happen if the
> > > > GEM object handle is closed between the idr lookup and
> > > > retrieving the size from said object since a local reference
> > > > is not being held at that point. Hold the local reference
> > > > while the object can still be accessed to fix this and
> > > > plug the potential security hole.
> > > >
> > > > Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> > > > ---
> > > >  drivers/gpu/drm/drm_gem.c | 10 ++++------
> > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > index 7bf628e..ee2058a 100644
> > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > @@ -871,9 +871,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
> > > >   * @file_priv: drm file-private structure
> > > >   *
> > > >   * Open an object using the global name, returning a handle and the size.
> > > > - *
> > > > - * This handle (of course) holds a reference to the object, so the object
> > > > - * will not go away until the handle is deleted.
> > > >   */
> > > >  int
> > > >  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> > > > @@ -898,14 +895,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
> > > >
> > > >  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
> > > >  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
> > > > -	drm_gem_object_put_unlocked(obj);
> > > >  	if (ret)
> > > > -		return ret;
> > > > +		goto err;
> > > >
> > > >  	args->handle = handle;
> > > >  	args->size = obj->size;
> > > >
> > > > -	return 0;
> > > > +err:
> > > > +	drm_gem_object_put_unlocked(obj);
> > > > +	return ret;
> > > >  }
> > > >
> > > >  /**
> > > 
> > > As this seems to fix an important issue, any reason it wasn't cc:
> > > stable
> > > on it so that it gets backported properly?
> > > 
> > > How about a "Fixes:" tag so that we know what commit id it fixes so we
> > > know how far back to backport things?
> > > 
> > > And a hint to the maintainers that "this is an issue that needs to get
> > > into 5.8-final, it shouldn't wait around longer please" would have
> > > also
> > > been nice to see :)
> > > 
> > > And what chagned from v1, aren't you supposed to list that somewhere
> > > in
> > > the changelog or below the --- line (never remember what DRM drivers
> > > want here...)
> > > 
> > > Care to send a v3?
> > 
> > Don't worry, I'm pushing this to drm-misc-fixes now, should still make
> > it
> > to 5.8. Plus cc: stable. I didn't bother with Fixes: since I think the
> > bug
> > is rather old. Also, worst case you leak 32bit of some kernel memory
> > that
> > got reused already (but yeah I know that's often enough to get the foot
> > in
> > somewhere nasty and crack the door open).
> > 
> > I think it fell through cracks because Sam said he'll apply, guess that
> > didn't happen.
> 
> Sam added his Reviewed-By on V1 with a comment to rename the goto label,
> but in V2 I also updated the API documentation and the commit text for
> a more complete change and thought he would re-add the tag.
> 
> > Also yes a changelog, somewhere, for next time around.
> 
> Apologies, it won't happen again. Should I still submit a V3?
> It looks like you've got Greg's concerns covered.

Uh no, but we need another patch to re-add the kerneldoc you deleted. I
missed that when merging your patch. Also that's kinda what patch
changelogs are for, for blind reviewers like me :-)
-Daniel

> 
> -Steve
> 
> > -Daniel
> > 
> > 
> > > 
> > > thanks,
> > > 
> > > greg k-h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
