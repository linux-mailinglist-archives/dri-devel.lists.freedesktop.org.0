Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CF4F292D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 10:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8D510EE60;
	Tue,  5 Apr 2022 08:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E9610EE58
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 08:45:56 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id bh17so25191087ejb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 01:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=kLwOSJh4JkUAu8bAVMQPem4swoCfWHajhhsSaSbd3wA=;
 b=bMbT3uGp3dFxXv5749rP/YEH0fwf2ipBnL4qQcoZffJmqP63odGiG48c6lrEQDoOuE
 2Io2E+FIcefJqaP5UzCFcWumnT1yERlYhCUDpyrunp/zi7DwDGmp9jA4EjrBmXZPUbxe
 m4RBFNb29e21bIjfvB3+04nX0j65o9B8vbaPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=kLwOSJh4JkUAu8bAVMQPem4swoCfWHajhhsSaSbd3wA=;
 b=p2QOPY3lW0g2o4yv8H7B7Xd5EgXHhliE+f3BCW9ZXoDhIQK2m11kfUpBUcHBRLbQ+O
 7QV/eWalU2GXoKNLfI4dgR3aVohkmqlyX43mdlIBICc90tdh0Yt8mszJ4mUIX96ptqdE
 uccEK8LqOS+xilw4GWuq2j4dDvfkAX7GyHP752xFbXkxhD/J8e9/s4AfISKK6a9TdAEY
 Mb2cARshRIDgnAIz0VM/Xg1+PCaAKpI9fLwO4hqArdqYEQj3qwCB7WCCEaN+eGfDY0dV
 qosQLfxW2evCtOlytax72QvIe0CUSCd2r/SW5ZlLB/SkYlQll96jyLE3NUKs3cyuvOzl
 wboA==
X-Gm-Message-State: AOAM531MLmdcK2pVmkBINm+dg15LgZFPnuEgqaNPz9Dh44CS7i4ZkQBc
 Yg7Nmod7lMS6IinDfDFsalzmTw==
X-Google-Smtp-Source: ABdhPJylM+dFHXlrCCet5bi78ssTO3yLx8DQZUwNTohynsB3hLO/O0NXGESroauDwjtoDMbXczTEkA==
X-Received: by 2002:a17:906:300f:b0:6e0:b38d:777d with SMTP id
 15-20020a170906300f00b006e0b38d777dmr2418845ejz.189.1649148355361; 
 Tue, 05 Apr 2022 01:45:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a50ff16000000b00410d029ea5csm6312065edu.96.2022.04.05.01.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 01:45:54 -0700 (PDT)
Date: Tue, 5 Apr 2022 10:45:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 09/19] fbcon: Extract fbcon_open/release helpers
Message-ID: <YkwBwW6E9gbL2Sut@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-10-daniel.vetter@ffwll.ch>
 <0879a2ff-37df-a9ae-0ce1-2bfcb2d1b322@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0879a2ff-37df-a9ae-0ce1-2bfcb2d1b322@suse.de>
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
 Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 12:46:32PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.02.22 um 22:08 schrieb Daniel Vetter:
> > There's two minor behaviour changes in here:
> > - in error paths we now consistently call fb_ops->fb_release
> > - fb_release really can't fail (fbmem.c ignores it too) and there's no
> >    reasonable cleanup we can do anyway.
> > 
> > Note that everything in fbcon.c is protected by the big console_lock()
> > lock (especially all the global variables), so the minor changes in
> > ordering of setup/cleanup do not matter.
> > 
> > v2: Explain a bit better why this is all correct (Sam)
> > 
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Claudio Suarez <cssk@net-c.es>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Cc: Du Cheng <ducheng2@gmail.com>
> > ---
> >   drivers/video/fbdev/core/fbcon.c | 107 +++++++++++++++----------------
> >   1 file changed, 53 insertions(+), 54 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index 058e885d24f6..3e1a3e7bf527 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -682,19 +682,37 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
> >   #endif /* CONFIG_MISC_TILEBLITTING */
> > +static int fbcon_open(struct fb_info *info)
> > +{
> > +	if (!try_module_get(info->fbops->owner))
> > +		return -ENODEV;
> > +
> > +	if (info->fbops->fb_open &&
> > +	    info->fbops->fb_open(info, 0)) {
> > +		module_put(info->fbops->owner);
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void fbcon_release(struct fb_info *info)
> > +{
> > +	if (info->fbops->fb_release)
> > +		info->fbops->fb_release(info, 0);
> > +
> > +	module_put(info->fbops->owner);
> > +}
> >   static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
> >   				  int unit, int oldidx)
> >   {
> >   	struct fbcon_ops *ops = NULL;
> > -	int err = 0;
> > -
> > -	if (!try_module_get(info->fbops->owner))
> > -		err = -ENODEV;
> > +	int err;
> > -	if (!err && info->fbops->fb_open &&
> > -	    info->fbops->fb_open(info, 0))
> > -		err = -ENODEV;
> > +	err = fbcon_open(info);
> > +	if (err)
> > +		return err;
> >   	if (!err) {
> >   		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
> > @@ -715,7 +733,7 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
> >   	if (err) {
> >   		con2fb_map[unit] = oldidx;
> > -		module_put(info->fbops->owner);
> > +		fbcon_release(info);
> >   	}
> >   	return err;
> > @@ -726,45 +744,34 @@ static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
> >   				  int oldidx, int found)
> >   {
> >   	struct fbcon_ops *ops = oldinfo->fbcon_par;
> > -	int err = 0, ret;
> > +	int ret;
> > -	if (oldinfo->fbops->fb_release &&
> > -	    oldinfo->fbops->fb_release(oldinfo, 0)) {
> > -		con2fb_map[unit] = oldidx;
> 
> We don't need oldidx any longer?
> 
> There's some logic wrt to the parameter 'found' here and in set_con2fb_map()
> that appears to be relevant.

Yeah further patches clean this up more. Or did you see a potential bug
here? I did ditch the fb_release error handling, simply because there's
not really much we can do anyway, it shouldn't ever fail (that's a driver
bug) and it was convoluting the code for no gain. But I might have missed
something in this cargo-cult.
-Daniel

> 
> Best regards
> Thomas
> 
> 
> > -		if (!found && newinfo->fbops->fb_release)
> > -			newinfo->fbops->fb_release(newinfo, 0);
> > -		if (!found)
> > -			module_put(newinfo->fbops->owner);
> > -		err = -ENODEV;
> > -	}
> > +	fbcon_release(oldinfo);
> > -	if (!err) {
> > -		fbcon_del_cursor_work(oldinfo);
> > -		kfree(ops->cursor_state.mask);
> > -		kfree(ops->cursor_data);
> > -		kfree(ops->cursor_src);
> > -		kfree(ops->fontbuffer);
> > -		kfree(oldinfo->fbcon_par);
> > -		oldinfo->fbcon_par = NULL;
> > -		module_put(oldinfo->fbops->owner);
> > -		/*
> > -		  If oldinfo and newinfo are driving the same hardware,
> > -		  the fb_release() method of oldinfo may attempt to
> > -		  restore the hardware state.  This will leave the
> > -		  newinfo in an undefined state. Thus, a call to
> > -		  fb_set_par() may be needed for the newinfo.
> > -		*/
> > -		if (newinfo && newinfo->fbops->fb_set_par) {
> > -			ret = newinfo->fbops->fb_set_par(newinfo);
> > +	fbcon_del_cursor_work(oldinfo);
> > +	kfree(ops->cursor_state.mask);
> > +	kfree(ops->cursor_data);
> > +	kfree(ops->cursor_src);
> > +	kfree(ops->fontbuffer);
> > +	kfree(oldinfo->fbcon_par);
> > +	oldinfo->fbcon_par = NULL;
> > +	/*
> > +	  If oldinfo and newinfo are driving the same hardware,
> > +	  the fb_release() method of oldinfo may attempt to
> > +	  restore the hardware state.  This will leave the
> > +	  newinfo in an undefined state. Thus, a call to
> > +	  fb_set_par() may be needed for the newinfo.
> > +	*/
> > +	if (newinfo && newinfo->fbops->fb_set_par) {
> > +		ret = newinfo->fbops->fb_set_par(newinfo);
> > -			if (ret)
> > -				printk(KERN_ERR "con2fb_release_oldinfo: "
> > -					"detected unhandled fb_set_par error, "
> > -					"error code %d\n", ret);
> > -		}
> > +		if (ret)
> > +			printk(KERN_ERR "con2fb_release_oldinfo: "
> > +				"detected unhandled fb_set_par error, "
> > +				"error code %d\n", ret);
> >   	}
> > -	return err;
> > +	return 0;
> >   }
> >   static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
> > @@ -919,7 +926,6 @@ static const char *fbcon_startup(void)
> >   	struct fbcon_display *p = &fb_display[fg_console];
> >   	struct vc_data *vc = vc_cons[fg_console].d;
> >   	const struct font_desc *font = NULL;
> > -	struct module *owner;
> >   	struct fb_info *info = NULL;
> >   	struct fbcon_ops *ops;
> >   	int rows, cols;
> > @@ -938,17 +944,12 @@ static const char *fbcon_startup(void)
> >   	if (!info)
> >   		return NULL;
> >   	
> > -	owner = info->fbops->owner;
> > -	if (!try_module_get(owner))
> > +	if (fbcon_open(info))
> >   		return NULL;
> > -	if (info->fbops->fb_open && info->fbops->fb_open(info, 0)) {
> > -		module_put(owner);
> > -		return NULL;
> > -	}
> >   	ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
> >   	if (!ops) {
> > -		module_put(owner);
> > +		fbcon_release(info);
> >   		return NULL;
> >   	}
> > @@ -3314,10 +3315,6 @@ static void fbcon_exit(void)
> >   		}
> >   		if (mapped) {
> > -			if (info->fbops->fb_release)
> > -				info->fbops->fb_release(info, 0);
> > -			module_put(info->fbops->owner);
> > -
> >   			if (info->fbcon_par) {
> >   				struct fbcon_ops *ops = info->fbcon_par;
> > @@ -3327,6 +3324,8 @@ static void fbcon_exit(void)
> >   				kfree(info->fbcon_par);
> >   				info->fbcon_par = NULL;
> >   			}
> > +
> > +			fbcon_release(info);
> >   		}
> >   	}
> >   }
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
