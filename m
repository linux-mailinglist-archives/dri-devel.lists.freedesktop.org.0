Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4303A3152
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6665D6EDB0;
	Thu, 10 Jun 2021 16:48:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CAE6EDB0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 16:48:56 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i94so3095809wri.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Va0amXVpbOJYAdcXM2qj5nU9Tu9UczfM1jakTq/wmdg=;
 b=FyfMFTyYNn6kzp1mOKyvxeIHW7+zNDTMt9LT+2mQjekJebzJvlPSU1rhnFEIcvuZxx
 qtOqbwl8ew2XrQQUnPjEBcEwKGuqSEjeCxk9niJH5oO3IgynvvkpsDES13fSJo4zgnC7
 YK8a0hzM5M/sRRzXENNS36PWnn0WzFtfTRi9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Va0amXVpbOJYAdcXM2qj5nU9Tu9UczfM1jakTq/wmdg=;
 b=R9o9p49lHgFWNYZ/uSaecW42L7RwL0pAdW2bhFqUfWDjKShgGyj8mbe0AKIGSLEKHB
 DpjH1h7ImNFlkGOAJBSfrJjtjCxltQwfqqpTMjuOYu8agoQ/XC7vP2yjU7YRaP4vSHvO
 alC4H+xVVmcCbZ8y4SZU0AiBeee5v8W0Ftc7eabqdwxsFihAvsa2JCFGlP2Tc8KIQh7H
 KiTfw5Ll1mOh6Z7O7G0Jy/X/vh+Gmlz2AmwTeEZXUT53C1PUvngU4gVfgBITw8M5zj5s
 4wZ8CGANO0v7+hytftT+ZMlXgHXgb3gZf8jg50axm6P6KHYWmBa0ppUfyRF/l0rkX9t4
 968g==
X-Gm-Message-State: AOAM53189NgAPizEFkCGxL72NL5+NqpC2x5046V5sW6HOxCEr2OHlSBs
 Iwgj6FbSKhphex5hM/WF8xeUJw==
X-Google-Smtp-Source: ABdhPJwKUd+3xHMQQumAoTuOuRiDExJUPLezgyBaaYn3NvQs12ckjvG7Xo578Rk9Mrz+3+WPv44Yfg==
X-Received: by 2002:a5d:4538:: with SMTP id j24mr6513899wra.391.1623343735014; 
 Thu, 10 Jun 2021 09:48:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a10sm2313774wrr.48.2021.06.10.09.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 09:48:54 -0700 (PDT)
Date: Thu, 10 Jun 2021 18:48:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
Message-ID: <YMJCdG7k5sNaiHen@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
 <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
 <f16f4123-bd0b-f09c-ddf1-7197c841b588@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f16f4123-bd0b-f09c-ddf1-7197c841b588@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 11:21:39PM +0800, Desmond Cheong Zhi Xi wrote:
> On 10/6/21 6:10 pm, Daniel Vetter wrote:
> > On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
> > > This patch eliminates the following smatch warning:
> > > drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
> > > 
> > > The 'file_priv->master' field should be protected by the mutex lock to
> > > '&dev->master_mutex'. This is because other processes can concurrently
> > > modify this field and free the current 'file_priv->master'
> > > pointer. This could result in a use-after-free error when 'master' is
> > > dereferenced in subsequent function calls to
> > > 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
> > > 
> > > An example of a scenario that would produce this error can be seen
> > > from a similar bug in 'drm_getunique()' that was reported by Syzbot:
> > > https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> > > 
> > > In the Syzbot report, another process concurrently acquired the
> > > device's master mutex in 'drm_setmaster_ioctl()', then overwrote
> > > 'fpriv->master' in 'drm_new_set_master()'. The old value of
> > > 'fpriv->master' was subsequently freed before the mutex was unlocked.
> > > 
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > 
> > Thanks a lot. I've done an audit of this code, and I found another
> > potential problem in drm_is_current_master. The callers from drm_auth.c
> > hold the dev->master_mutex, but all the external ones dont. I think we
> > need to split this into a _locked function for use within drm_auth.c, and
> > the exported one needs to grab the dev->master_mutex while it's checking
> > master status. Ofc there will still be races, those are ok, but right now
> > we run the risk of use-after free problems in drm_lease_owner.
> > 
> > Are you up to do that fix too?
> > 
> 
> Hi Daniel,
> 
> Thanks for the pointer, I'm definitely up for it!
> 
> > I think the drm_lease.c code also needs an audit, there we'd need to make
> > sure that we hold hold either the lock or a full master reference to avoid
> > the use-after-free issues here.
> > 
> 
> I'd be happy to look into drm_lease.c as well.
> 
> > Patch merged to drm-misc-fixes with cc: stable.
> > -Daniel
> > 
> > > ---
> > >   drivers/gpu/drm/drm_auth.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > > index f00e5abdbbf4..b59b26a71ad5 100644
> > > --- a/drivers/gpu/drm/drm_auth.c
> > > +++ b/drivers/gpu/drm/drm_auth.c
> > > @@ -315,9 +315,10 @@ int drm_master_open(struct drm_file *file_priv)
> > >   void drm_master_release(struct drm_file *file_priv)
> > >   {
> > >   	struct drm_device *dev = file_priv->minor->dev;
> > > -	struct drm_master *master = file_priv->master;
> > > +	struct drm_master *master;
> > > 
> > >   	mutex_lock(&dev->master_mutex);
> > > +	master = file_priv->master;
> > >   	if (file_priv->magic)
> > >   		idr_remove(&file_priv->master->magic_map, file_priv->magic);
> > > -- 
> > > 2.25.1
> > > 
> > 
> 
> From what I can see, there are other places in the kernel that could use the
> _locked version of drm_is_current_master as well, such as drm_mode_getfb in
> drm_framebuffer.c. I'll take a closer look, and if the changes make sense
> I'll prepare a patch series for them.

Oh maybe we have a naming confusion: the _locked is the one where the
caller must grab the lock already, whereas drm_is_current_master would
grab the master_mutex internally to do the check. The one in
drm_framebuffer.c looks like it'd need the internal one since there's no
other need to grab the master_mutex.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
