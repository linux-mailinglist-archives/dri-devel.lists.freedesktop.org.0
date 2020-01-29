Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4A14CF2A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 18:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC62C6F5F0;
	Wed, 29 Jan 2020 17:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210086F5F0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 17:05:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so495880wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xkI97nwb8UhKTzo9RfVn3ZtAzZCPu347U5qNCO04TsU=;
 b=gJZfwLMP1Tx7L/mQahukNxW87QP1aSZfZxwe9AoDX0kIycLiK/Rt6b44oXyTUJhCNs
 KIe7M1ovgojtS+ZxQbSAc5tWutt+8RnL3TLYdfzUm1wXmWECs8IGjGo9VpHQs1ZXeNyz
 8FM16dIjVVbD8XQkmkpvIG96XuKWkCj4o8EQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xkI97nwb8UhKTzo9RfVn3ZtAzZCPu347U5qNCO04TsU=;
 b=U1BL93S3KF9MIhNXpRXSbM0PUq/XATk8kNOSfs+wn8yvavi27kGzfC5sme25s9S1nU
 7AJzbnLnNYrfVzBjiffHiqzkUdo+sA4p3YfL70hoHsdRZBSQZegaa0I7qY6VGaYovEWE
 O2NLabsvNq5tl7pBdsOEtM13O3XAKSB5R/mXPhYgM2Epj028G0P3qM5zxqT1zCEuzLcE
 GioXpupDcPhHqDjlLABSncXLsdLAUQkwnVUDi9VZgejoINBYoqaeFFiPn7eA4mjwJNhm
 vtlWiLcJVDTDnV99IcxDWMaAJF6lrrXBSNKJUUT5iuaHZd4chjvQctkUiskT/124g11+
 n6bA==
X-Gm-Message-State: APjAAAXiU0Mre3joWnCJbxoY19DytJGiHWBLSszcj4DWT1XReM9ag4O3
 YN4jo5BY3x6rMcjFtJcDiCvyeJxEqrZdYQ==
X-Google-Smtp-Source: APXvYqwVD0lTgdC9GL5ZqYIoufEDvBesiynTTGbu0wtY95KC4cFr6YAt+nHasqUhGwzquylL/MxK7w==
X-Received: by 2002:a05:600c:54e:: with SMTP id
 k14mr173051wmc.115.1580317535740; 
 Wed, 29 Jan 2020 09:05:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t9sm2776350wmj.28.2020.01.29.09.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 09:05:35 -0800 (PST)
Date: Wed, 29 Jan 2020 18:05:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 4/5] drm: Push drm_global_mutex locking in drm_open
Message-ID: <20200129170533.GM43062@phenom.ffwll.local>
References: <20200129082410.1691996-1-daniel.vetter@ffwll.ch>
 <20200129082410.1691996-5-daniel.vetter@ffwll.ch>
 <20200129164545.GA22331@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129164545.GA22331@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 29, 2020 at 05:45:45PM +0100, Sam Ravnborg wrote:
> Hi Daniel.
> 
> On Wed, Jan 29, 2020 at 09:24:09AM +0100, Daniel Vetter wrote:
> > We want to only take the BKL on crap drivers, but to know whether
> The BKL was killed long time ago..
> In other words I was confused until I realized that
> - BKL
> - drm_global_mutex BKL
> - drm_global_mutex
> 
> Was all the same. At least my OCD color me confused as is.

The Real BKL was converted into drm_global_mutex for drm when the BKL was
killed. Which is kinda relevant, because the BKL locking horrors (at least
in drm) have been inherited by drm_global_mutex (and the conversion broke
a few things that had to be papered over). Hence the motivation to finally
clean up the locking and figure out what exactly is still protected by
this lock. If you're bored, all this is at least in modern git history
afaics.
-Daniel

> 
> > we have a crap driver we first need to look it up. Split this shuffle
> > out from the main BKL-disabling patch, for more clarity.
> > 
> > Since the minors are refcounted drm_minor_acquire is purely internal
> > and this does not have a driver visible effect.
> > 
> > v2: Push the locking even further into drm_open(), suggested by Chris.
> > This gives us more symmetry with drm_release(), and maybe a futuer
> > avenue where we make drm_globale_mutex locking (partially) opt-in like
> s/drm_globale_mutex/drm_global_mutex/
> 
> > with drm_release_noglobal().
> > 
> > Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Above is IMO fix-while-committing stuff.
> 
> 	Sam
> 
> > ---
> >  drivers/gpu/drm/drm_drv.c  | 14 +++++---------
> >  drivers/gpu/drm/drm_file.c |  6 ++++++
> >  2 files changed, 11 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 8deff75b484c..05bdf0b9d2b3 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -1085,17 +1085,14 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
> >  
> >  	DRM_DEBUG("\n");
> >  
> > -	mutex_lock(&drm_global_mutex);
> >  	minor = drm_minor_acquire(iminor(inode));
> > -	if (IS_ERR(minor)) {
> > -		err = PTR_ERR(minor);
> > -		goto out_unlock;
> > -	}
> > +	if (IS_ERR(minor))
> > +		return PTR_ERR(minor);
> >  
> >  	new_fops = fops_get(minor->dev->driver->fops);
> >  	if (!new_fops) {
> >  		err = -ENODEV;
> > -		goto out_release;
> > +		goto out;
> >  	}
> >  
> >  	replace_fops(filp, new_fops);
> > @@ -1104,10 +1101,9 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
> >  	else
> >  		err = 0;
> >  
> > -out_release:
> > +out:
> >  	drm_minor_release(minor);
> > -out_unlock:
> > -	mutex_unlock(&drm_global_mutex);
> > +
> >  	return err;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index 1075b3a8b5b1..d36cb74ebe0c 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -378,6 +378,8 @@ int drm_open(struct inode *inode, struct file *filp)
> >  	if (IS_ERR(minor))
> >  		return PTR_ERR(minor);
> >  
> > +	mutex_unlock(&drm_global_mutex);
> > +
> >  	dev = minor->dev;
> >  	if (!atomic_fetch_inc(&dev->open_count))
> >  		need_setup = 1;
> > @@ -395,10 +397,14 @@ int drm_open(struct inode *inode, struct file *filp)
> >  			goto err_undo;
> >  		}
> >  	}
> > +
> > +	mutex_unlock(&drm_global_mutex);
> > +
> >  	return 0;
> >  
> >  err_undo:
> >  	atomic_dec(&dev->open_count);
> > +	mutex_unlock(&drm_global_mutex);
> >  	drm_minor_release(minor);
> >  	return retcode;
> >  }
> > -- 
> > 2.24.1
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
