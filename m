Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CAC4FFAE5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 18:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F5810E39B;
	Wed, 13 Apr 2022 16:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1072910E39B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:05:55 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k22so3339479wrd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nPdGkgfedd/A4OP8KwTTe+FHIMRJcA3jhSUiZu8tE4s=;
 b=SMSq1vzhpdQ78zUIkOaNXUt3O9fifj0rXSBWRdwImunuLxqHLuE58sPWO9jCz+Rqps
 JUzCFp9Yp9LHRB2XxmnmQ9qMlaMqOe/uqH8ZYfYk5GGsbLwpVLKfasf4LLCNxk4lJP5O
 Njosm3BtBMYcp5sEyZed8HqQKM9BYZM73WQO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nPdGkgfedd/A4OP8KwTTe+FHIMRJcA3jhSUiZu8tE4s=;
 b=hkp02qIROJDJ8LqtS+nTcAYqwYD8RHC6hNef6th7nEj5cCMjlLHmGf1U8ZclCegJrI
 PCS1S48GCh3J9tC9UbUgBiRrksEwK3ex7BW+Vo34ufDIoAlB34I4ZllrrtIra9yrMH/q
 /wrUMexpGg0EKlCkblt3iKlpfkJ9I9RRNaVT5/eqk+yruXqaFDt3Fb4Nw9XtasZoXknS
 Fgyykps9dkB2j9T+ZQmFWopEK3w7WI+tULtoqVSLgrb1/6m1oHKWynQUIFVbeBvz3Ccf
 qPqH6jjkmVyUiiSPshOq68V7JVbBAKvTe2Y8lZd4QTMuJW/SK2bl5cE/fjNvKzbDjDdk
 +uJg==
X-Gm-Message-State: AOAM533WqgesfOuGQC3fzl8LhM1WMQ35jEIM3L428JSQ0bKCG3XonP/6
 /1A7RBe6jPAsbB8yR3Lby8UzGg==
X-Google-Smtp-Source: ABdhPJxCHSZR6sOhR82MWDqkHkKQxYBi5t7yzBdb+67OAJKLu81jjVxRF6LbEco5kZi775i1Cfk2zw==
X-Received: by 2002:adf:e944:0:b0:207:af9e:a4e7 with SMTP id
 m4-20020adfe944000000b00207af9ea4e7mr6330680wrn.296.1649865953497; 
 Wed, 13 Apr 2022 09:05:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b0038eca3cdbb3sm2716964wmr.13.2022.04.13.09.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 09:05:53 -0700 (PDT)
Date: Wed, 13 Apr 2022 18:05:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
Message-ID: <Ylb0316ABOhOe1Rb@phenom.ffwll.local>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
 <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, frowand.list@gmail.com, deller@gmx.de,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, paulus@samba.org, mpe@ellerman.id.au, sam@ravnborg.org,
 linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 13, 2022 at 12:50:50PM +0200, Javier Martinez Canillas wrote:
> On 4/13/22 11:24, Thomas Zimmermann wrote:
> > A workaround makes fbdev hot-unplugging work for framebuffers without
> > device. The only user for this feature was offb. As each OF framebuffer
> > now has an associated platform device, the workaround is no longer
> > needed. Remove it. Effectively reverts commit 0f525289ff0d ("fbdev: Fix
> > unregistering of framebuffers without device").
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  drivers/video/fbdev/core/fbmem.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index bc6ed750e915..bdd00d381bbc 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1579,14 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
> >  			 * If it's not a platform device, at least print a warning. A
> >  			 * fix would add code to remove the device from the system.
> >  			 */
> > -			if (!device) {
> > -				/* TODO: Represent each OF framebuffer as its own
> > -				 * device in the device hierarchy. For now, offb
> > -				 * doesn't have such a device, so unregister the
> > -				 * framebuffer as before without warning.
> > -				 */
> > -				do_unregister_framebuffer(registered_fb[i]);
> 
> Maybe we could still keep this for a couple of releases but with a big
> warning that's not supported in case there are out-of-tree drivers out
> there that still do this ?
> 
> Or at least a warning if the do_unregister_framebuffer() call is removed.

Yeah dying while holding console_lock isn't fun, and not having a WARN_ON
+ bail-out code pretty much forces bug reporters to do a bisect here to
give us something more than "machine dies at boot with no messages".

I'd just outright keep the WARN_ON here for 1-2 years even to really make
sure we got all the bug reports, since often these older machines only
update onto LTS releases.

And it needs to be a WARN_ON + bail out since BUG_ON is as bad as just
oopsing.
-Daniel

> 
> Regardless of what you chose to do, the patch looks good to me.
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
