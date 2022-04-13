Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F94FF9E9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 17:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BCA10E131;
	Wed, 13 Apr 2022 15:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9749410E131;
 Wed, 13 Apr 2022 15:20:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0BD56B824F7;
 Wed, 13 Apr 2022 15:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33D8C385A4;
 Wed, 13 Apr 2022 15:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649863241;
 bh=xW51b7aAJaWUwm8yNfi8fusNAXVuiRAU8Cu1Mno0irk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hi6Mz+y12Bu/mWZQD886wB+y8IpB+ZN4eiu80S1v/5UK0u7PekxtFwC9i0wz+Ywiv
 XKOfTOodpX20zCSc9lTxcGk/R4m5+ivwMzDZpwPATnuAm4wCfdZy96VQvWIUADNvka
 7B9aDhIf/OEP6oMbpgrqQautvl8h6VFHQGMnEL3a9uaAGJsKwdcc6JZhWw6JsS+TCo
 +VlLIV40lZIaZUDyDCpjOSuQ3j9m5ERJuTGwR3esyAnSjwZjQa2voLwH3yFv/ktO/4
 nonlDKx93B8FiKvkQd9bMY250kwmxp8wNabUoDjlIKJhxM1uPhU+BlAStNkchvRhDQ
 gfWlGZI4Icz8Q==
Date: Wed, 13 Apr 2022 08:20:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] fbcon: Fix delayed takeover locking
Message-ID: <YlbqRxp4IY775RZj@dev-arch.thelio-3990X>
References: <20220413082128.348186-1-daniel.vetter@ffwll.ch>
 <YlaW7mq/LbHMN7AZ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlaW7mq/LbHMN7AZ@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 11:25:02AM +0200, Daniel Vetter wrote:
> On Wed, Apr 13, 2022 at 10:21:28AM +0200, Daniel Vetter wrote:
> > I messed up the delayed takover path in the locking conversion in
> > 6e7da3af008b ("fbcon: Move console_lock for register/unlink/unregister").
> > 
> > Fix it by re-extracting the lockless function and using it in the
> > delayed takeover path, where we need to hold the lock already to
> > iterate over the list of already registered fb. Well the current code
> > still is broken in there (since the list is protected by a
> > registration_lock, which we can't take here because it nests the other
> > way round with console_lock), but in the future this will be a list
> > protected by console_lock when this is all sorted out.
> > 
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> 
> Nathan, if you can supply a tested-by today still I could push it before I
> disappear into easter w/e. I'm pretty sure this is it, but better safe
> than sorry.
> -Daniel

Yup, sorry for the delay, timezones and such :( This patch resolves the
problem I was seeing, thank you for the quick response and fix!

Tested-by: Nathan Chancellor <nathan@kernel.org>

> > Fixes: 6e7da3af008b ("fbcon: Move console_lock for register/unlink/unregister")
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Du Cheng <ducheng2@gmail.com>
> > Cc: Claudio Suarez <cssk@net-c.es>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Zheyu Ma <zheyuma97@gmail.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 28 ++++++++++++++++++----------
> >  1 file changed, 18 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index 6a7d470beec7..b4e43b39d9a8 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -2772,7 +2772,6 @@ static void fbcon_unbind(void)
> >  static inline void fbcon_unbind(void) {}
> >  #endif /* CONFIG_VT_HW_CONSOLE_BINDING */
> >  
> > -/* called with console_lock held */
> >  void fbcon_fb_unbind(struct fb_info *info)
> >  {
> >  	int i, new_idx = -1;
> > @@ -2822,7 +2821,6 @@ void fbcon_fb_unbind(struct fb_info *info)
> >  	console_unlock();
> >  }
> >  
> > -/* called with console_lock held */
> >  void fbcon_fb_unregistered(struct fb_info *info)
> >  {
> >  	int i, idx;
> > @@ -2928,14 +2926,11 @@ MODULE_PARM_DESC(lockless_register_fb,
> >  	"Lockless framebuffer registration for debugging [default=off]");
> >  
> >  /* called with console_lock held */
> > -int fbcon_fb_registered(struct fb_info *info)
> > +static int do_fb_registered(struct fb_info *info)
> >  {
> >  	int ret = 0, i, idx;
> >  
> > -	if (!lockless_register_fb)
> > -		console_lock();
> > -	else
> > -		atomic_inc(&ignore_console_lock_warning);
> > +	WARN_CONSOLE_UNLOCKED();
> >  
> >  	fbcon_registered_fb[info->node] = info;
> >  	fbcon_num_registered_fb++;
> > @@ -2945,7 +2940,7 @@ int fbcon_fb_registered(struct fb_info *info)
> >  
> >  	if (deferred_takeover) {
> >  		pr_info("fbcon: Deferring console take-over\n");
> > -		goto out;
> > +		return 0;
> >  	}
> >  
> >  	if (info_idx == -1) {
> > @@ -2965,7 +2960,20 @@ int fbcon_fb_registered(struct fb_info *info)
> >  		}
> >  	}
> >  
> > -out:
> > +	return ret;
> > +}
> > +
> > +int fbcon_fb_registered(struct fb_info *info)
> > +{
> > +	int ret;
> > +
> > +	if (!lockless_register_fb)
> > +		console_lock();
> > +	else
> > +		atomic_inc(&ignore_console_lock_warning);
> > +
> > +	ret = do_fb_registered(info);
> > +
> >  	if (!lockless_register_fb)
> >  		console_unlock();
> >  	else
> > @@ -3280,7 +3288,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
> >  	logo_shown = FBCON_LOGO_DONTSHOW;
> >  
> >  	fbcon_for_each_registered_fb(i)
> > -		fbcon_fb_registered(fbcon_registered_fb[i]);
> > +		do_fb_registered(fbcon_registered_fb[i]);
> >  
> >  	console_unlock();
> >  }
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
