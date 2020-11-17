Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B22B6AB4
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 17:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0AA899B7;
	Tue, 17 Nov 2020 16:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388A6899B7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 16:54:26 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p8so23888368wrx.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 08:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=obDjCnbNhkja6ht5vGPPA3q8r5DdxQxiGC3gW13kKE0=;
 b=Ohkk/wJx8CLXtMW13zUWZeS+hKUcbtjEsRNjd+r5qzXwEfeNKHkSgAbxziQdDK6OvZ
 cvdmeeYCpl5IuS20knAiqzBILStMko+5G/0Hdby3lD48x2G9a8QDVhJrKt2mcgi0yeBH
 q2ZGVMHFiIUR/EZgv7leo/RzOh/24V29ZZyLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=obDjCnbNhkja6ht5vGPPA3q8r5DdxQxiGC3gW13kKE0=;
 b=m83BTULFppzjBoX9t3nT4oDACoTqq0J5ZpY1iEpYs0WHjktKxjcxeGjvO6ZlTL406W
 m3V47bgfhKa5twAAqtiGSdK55l5EuiU8HUyeC2Mhcgt4wIgOhYTPsn6ZEVBfMKjnW3oy
 U+GqhviAj+J3X+FNCOEb/QKRJcIgwHj8ZbJQsYoP/fGxceiOkaLEJ30TLP5H0cgxq/s7
 R2F1LGJQfcAUOkLRe327J0c3+xlpCUFHnzWQ91eN/kUQM/9F6YlqReq4cEg82BELvNAb
 aVJVyLXbcx59Wimk3utY65XLk5cnYXHyUyona3Wlil8wFcuFAAbuKI+SZgZEosrxn8bN
 IqNw==
X-Gm-Message-State: AOAM533l7EAMm6DAMBU/C6xEvlnuNYDcDfYf9Et6d6N+eTQLu1AYQbKp
 rRCgR9Ix4mS+ejRDN8zdvjlSAA==
X-Google-Smtp-Source: ABdhPJz9pnfU+7oqI3IHAq8bH+mv2njpRxhjlGEHDNLhaxx2ZJ//DrG+R751UR1qDhuOFtsWYIJM9Q==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr438099wra.247.1605632064755;
 Tue, 17 Nov 2020 08:54:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q5sm25769589wrf.41.2020.11.17.08.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:54:23 -0800 (PST)
Date: Tue, 17 Nov 2020 17:54:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 08/10] drm/fb-helper: Restore damage area upon errors
Message-ID: <20201117165421.GL401619@phenom.ffwll.local>
References: <20201116200437.17977-1-tzimmermann@suse.de>
 <20201116200437.17977-9-tzimmermann@suse.de>
 <20201116205216.GH401619@phenom.ffwll.local>
 <20201117151446.bqbhbt2tqijjmj2h@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117151446.bqbhbt2tqijjmj2h@earth.universe>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 04:14:46PM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Nov 16, 2020 at 09:52:16PM +0100, Daniel Vetter wrote:
> > On Mon, Nov 16, 2020 at 09:04:35PM +0100, Thomas Zimmermann wrote:
> > > If the damage handling fails, restore the damage area. The next invocation
> > > of the damage worker will then perform the update.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > >  drivers/gpu/drm/drm_fb_helper.c | 23 ++++++++++++++++++++---
> > >  1 file changed, 20 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > > index 2e1a335bafd2..13b65dad2ca8 100644
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -431,11 +431,28 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
> > >  	if (helper->buffer) {
> > >  		ret = drm_fb_helper_damage_blit(helper, &clip_copy);
> > >  		if (ret)
> > > -			return;
> > > +			goto err;
> > >  	}
> > >  
> > > -	if (helper->fb->funcs->dirty)
> > > -		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
> > > +	if (helper->fb->funcs->dirty) {
> > > +		ret = helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
> > > +		if (ret)
> > > +			goto err;
> > 
> > I think this is unexpected enough that we should put some drm error
> > printing here I think.
> 
> Note, that the dirty framebuffer routines are used by the
> framebuffer console. Printing warnings means another line
> in the framebuffer console and thus another call to the
> dirty routines. Assuming the problem does not get solved
> magically the system will be busy printing warnings forever.
> I have been through that fun while working on the OMAP DSI
> command mode patches and I suggest to only do ratelimited
> logging in the code related to damage tracking.

Excellent point. Maybe _once is good enough even, perhaps with a dump of
the entire atomic state included for debugging (in case it's transient or
something like that). Past that there's nothing we can do anyway, and most
likely it's just hurting.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
