Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE23B4ADA70
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 14:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A022110E13B;
	Tue,  8 Feb 2022 13:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B2C10E13B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 13:54:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id m14so30819674wrg.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 05:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4O7t+VO/eUKPV3zCNKFSbvq0Ljp3XWU8Qf/HjmcbkEc=;
 b=gnx0wctQF0ZOrloVcj5vzxR/MoXGQ5grkToQFc0SpnV2toiN0RcEU0b0Joz5mj4Uz1
 aoQNEtoZVQWUxi5PJcDDd+IJmgG3zUT40M1A6XASvbF1bwhM1Tyd+B7c5s4K+rgh3g1m
 H0laAeLoROpuVYCKj2hPvYin3DylTSujPrm5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4O7t+VO/eUKPV3zCNKFSbvq0Ljp3XWU8Qf/HjmcbkEc=;
 b=wfqUrvolMwCB7n86jE+NVjRvcNavN5pAipdFJS5fKvOyAseaK1usL59L/638X3u7yT
 BWgkr4P8S501WPmWWpZBJKPbLe40642plO9FK7mSO3awSQebOHBYx4eifde+ORpOzjHw
 rPLwTNzdBMM8Oa+jaf663rFEaMcH0Kuzu4J2PgAVkgwGaKS8d0cHo/QaKPsOlX5dYm+d
 +wO9Jk1jdiAHzYFiBmGEtA7xgv8VHjlSy/wuYJOvPdE5+aCNzwiUDHUtHY6ePFX1xFoT
 CatW4cUx9fV0ndNxuTbVdjMv/+2f4nXczwSwIcqQhHFHVu53NMz11HrEjnVbH1n8ZG4H
 PFFQ==
X-Gm-Message-State: AOAM5337ooPCY+vwK5ypYgp3aHAPi0p7Oro5TfKsqS50atOUHFnfriXx
 n/7IWNBgY8xL5e1rtYB/VLcTCg==
X-Google-Smtp-Source: ABdhPJwtMvoSlZ1zJLr+xk0DKI6HZ/HhJrH76WUKQbFlTNz3OgcD8QA8YxnqOWoVUYW/4bYjDOFLTg==
X-Received: by 2002:adf:de12:: with SMTP id b18mr3660421wrm.293.1644328441602; 
 Tue, 08 Feb 2022 05:54:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bg23sm2829083wmb.5.2022.02.08.05.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:54:00 -0800 (PST)
Date: Tue, 8 Feb 2022 14:53:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 13/21] fbcon: move more common code into fb_open()
Message-ID: <YgJ19zts7nxCjGk5@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-14-daniel.vetter@ffwll.ch>
 <Yf2AAx9rlIsh/h8I@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yf2AAx9rlIsh/h8I@ravnborg.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 04, 2022 at 08:35:31PM +0100, Sam Ravnborg wrote:
> On Mon, Jan 31, 2022 at 10:05:44PM +0100, Daniel Vetter wrote:
> > No idea why con2fb_acquire_newinfo() initializes much less than
> > fbcon_startup(), but so be it. From a quick look most of the
> > un-initialized stuff should be fairly harmless, but who knows.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Claudio Suarez <cssk@net-c.es>
> > Cc: Du Cheng <ducheng2@gmail.com>
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 74 +++++++++++++-------------------
> >  1 file changed, 31 insertions(+), 43 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index b83a5a77d8a8..5a3391ff038d 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -680,8 +680,18 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
> >  
> >  #endif /* CONFIG_MISC_TILEBLITTING */
> >  
> > +static void fbcon_release(struct fb_info *info)
> > +{
> > +	if (info->fbops->fb_release)
> > +		info->fbops->fb_release(info, 0);
> > +
> > +	module_put(info->fbops->owner);
> > +}
> > +
> >  static int fbcon_open(struct fb_info *info)
> >  {
> > +	struct fbcon_ops *ops;
> > +
> >  	if (!try_module_get(info->fbops->owner))
> >  		return -ENODEV;
> >  
> > @@ -691,19 +701,22 @@ static int fbcon_open(struct fb_info *info)
> >  		return -ENODEV;
> >  	}
> >  
> > -	return 0;
> > -}
> > +	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
> > +	if (!ops) {
> > +		fbcon_release(info);
> > +		return -ENOMEM;
> > +	}
> >  
> > -static void fbcon_release(struct fb_info *info)
> > -{
> > -	if (info->fbops->fb_release)
> > -		info->fbops->fb_release(info, 0);
> > +	INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
> > +	ops->info = info;
> > +	info->fbcon_par = ops;
> > +	ops->cur_blink_jiffies = HZ / 5;
> >  
> > -	module_put(info->fbops->owner);
> > +	return 0;
> >  }
> >  
> >  static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
> > -				  int unit, int oldidx)
> > +				  int unit)
> >  {
> >  	struct fbcon_ops *ops = NULL;
> >  	int err;
> > @@ -712,27 +725,10 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
> >  	if (err)
> >  		return err;
> >  
> > -	if (!err) {
> > -		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
> > -		if (!ops)
> > -			err = -ENOMEM;
> > -
> > -		INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
> > -	}
> > -
> > -	if (!err) {
> > -		ops->cur_blink_jiffies = HZ / 5;
> > -		ops->info = info;
> > -		info->fbcon_par = ops;
> > -
> > -		if (vc)
> > -			set_blitting_type(vc, info);
> > -	}
> > +	ops = info->fbcon_par;
> >  
> > -	if (err) {
> > -		con2fb_map[unit] = oldidx;
> > -		fbcon_release(info);
> > -	}
> > +	if (vc)
> > +		set_blitting_type(vc, info);
> >  
> >  	return err;
> >  }
> > @@ -840,9 +836,11 @@ static int set_con2fb_map(int unit, int newidx, int user)
> >  
> >  	found = search_fb_in_map(newidx);
> >  
> > -	con2fb_map[unit] = newidx;
> > -	if (!err && !found)
> > -		err = con2fb_acquire_newinfo(vc, info, unit, oldidx);
> > +	if (!err && !found) {
> > +		err = con2fb_acquire_newinfo(vc, info, unit);
> > +		if (!err)
> > +			con2fb_map[unit] = newidx;
> > +	}
> This looks like an unintentional change of functionality as con2fb_map[unit] is
> only assigned when we do a con2fb_acquire_newinfo().
> 
> Staring at the code I could not say it is wrong, but not nice to hide
> the change in this patch.

Nope, it's not an unintentional bugfix. The old con2fb_acquire_newinfo did
reset con2fb_map to oldidx upon failure, which I've found to be a most
bizarre calling convention. So this sorts this out.

The reason I smashed this into the same patch is that I had to remove the
fbcon_release call, and so the error handling in there looked even more
funny. But I indeed failed to explain this all in the commit message.

Ack with that explainer, or do you want me to split this out properly?
-Daniel

> 
> 	Sam
> 
> 
> >  
> >  	/*
> >  	 * If old fb is not mapped to any of the consoles,
> > @@ -939,20 +937,10 @@ static const char *fbcon_startup(void)
> >  	if (fbcon_open(info))
> >  		return NULL;
> >  
> > -	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
> > -	if (!ops) {
> > -		fbcon_release(info);
> > -		return NULL;
> > -	}
> > -
> > -	INIT_DELAYED_WORK(&ops->cursor_work, fb_flashcursor);
> > -
> > +	ops = info->fbcon_par;
> >  	ops->currcon = -1;
> >  	ops->graphics = 1;
> >  	ops->cur_rotate = -1;
> > -	ops->cur_blink_jiffies = HZ / 5;
> > -	ops->info = info;
> > -	info->fbcon_par = ops;
> >  
> >  	p->con_rotate = initial_rotation;
> >  	if (p->con_rotate == -1)
> > @@ -1022,7 +1010,7 @@ static void fbcon_init(struct vc_data *vc, int init)
> >  		return;
> >  
> >  	if (!info->fbcon_par)
> > -		con2fb_acquire_newinfo(vc, info, vc->vc_num, -1);
> > +		con2fb_acquire_newinfo(vc, info, vc->vc_num);
> >  
> >  	/* If we are not the first console on this
> >  	   fb, copy the font from that console */
> > -- 
> > 2.33.0

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
