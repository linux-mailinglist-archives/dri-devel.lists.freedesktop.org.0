Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F255383166
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A946E996;
	Mon, 17 May 2021 14:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C986E996
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:37:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k5-20020a05600c4785b0290174b7945d7eso3319180wmo.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=/GFAh/A0GfFHYjaPNZwKZ40wIJJNt8CthQS4oei97uk=;
 b=h1wuf3FDnPnhu/NTS/DGYPHZdVKHA7X0UeMSxqbK8OHp9Y9MGLH57PZg9Qq+YKVN9C
 f1PzgpBk8JnbGGg0Jul6KKY+PbSiYLRCPvROXGw6CrhBHvnnJ2jknpy9EMz4mNaccm+A
 2Vi+KxQMcXfSOelOWfaGM3sHyWCC0HwtlIPjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=/GFAh/A0GfFHYjaPNZwKZ40wIJJNt8CthQS4oei97uk=;
 b=snG7aVwocBDT9XG3En0mF0rHFo9gqUWy2LPpoLQKrwOT147T00gRI+/Kg6lTRVlchq
 kKj5MmxxtGwNCtPkjE13MLWrvmjykV5uNBF5CkF9SgZuPl5XSEq695fJDehfP3/qsXmy
 x3943k6ArArVkj8QEDyMFnxdJUakB0hmKITEmZ/DwKszNkZhY0nuJlgeZeNU9E0onouZ
 GopT2PScv5/2+1TNH2l+P0AhjNNWMIGKbOcXzBB1/VPDnzF+ahGJ0WQoraTaXgekDMVb
 JNwbLPvs0Ep8OisJsbztNq+DFXRoqZiMFpEtZAHbTDH5CKIYBZb4sYjFhBbuEzS836Po
 7a3w==
X-Gm-Message-State: AOAM532QuOcZVR2NLdLxZUMnzKEAcLOUfZn67xLKBJuLwenp9OYhQuYL
 ounOG3tgd/ibOaJTUBlCkcfpLg==
X-Google-Smtp-Source: ABdhPJxHkNcCNOXeddsZB81LmqWH5+pYAOLu1aI1JjnYFrX7APUE2O+sB7/Hq0DVxtbEP3FM30JHoA==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr253800wmk.97.1621262229091;
 Mon, 17 May 2021 07:37:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a129sm4249659wmh.20.2021.05.17.07.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:37:08 -0700 (PDT)
Date: Mon, 17 May 2021 16:37:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Fix pixclock rate for 24-bit serial panels
Message-ID: <YKJ/ko7+HZix4znQ@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 od@zcrc.me, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20210323144008.166248-1-paul@crapouillou.net>
 <6DP1TQ.W6B9JRRW1OY5@crapouillou.net>
 <YKJsj+dDUshm/ZiT@phenom.ffwll.local>
 <9N99TQ.6E5XN4XTCLTT1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9N99TQ.6E5XN4XTCLTT1@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, od@zcrc.me,
 stable@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 03:30:45PM +0100, Paul Cercueil wrote:
> Hi Daniel,
> 
> Le lun., mai 17 2021 at 15:15:59 +0200, Daniel Vetter <daniel@ffwll.ch> a
> écrit :
> > On Thu, May 13, 2021 at 01:29:30PM +0100, Paul Cercueil wrote:
> > >  Hi,
> > > 
> > >  Almost two months later,
> > 
> > Since you're committer it's expected that you go actively out to look
> > for
> > review or trade with someone else who has some patches that need a quick
> > look. It will not happen automatically, this is on you.
> 
> I maintain all drivers, platform code and DTS for Ingenic SoCs so I do my
> part, just not in this subsystem.
> 
> > Also generally after 2 weeks the patch is lost and you need to ping it.
> 
> OK. Then I guess I'll just include this one in a future patchset.

Well you do have an ack now. I just meant to highlight that generally it
doesn't happen automatically, and also that after 2 weeks generally a
patchset wont get attention anymore.
-Daniel

> 

> > -Daniel
> 
> Cheers,
> -Paul
> 
> > > 
> > > 
> > >  Le mar., mars 23 2021 at 14:40:08 +0000, Paul Cercueil
> > >  <paul@crapouillou.net> a écrit :
> > >  > When using a 24-bit panel on a 8-bit serial bus, the pixel clock
> > >  > requested by the panel has to be multiplied by 3, since the
> > > subpixels
> > >  > are shifted sequentially.
> > >  >
> > >  > The code (in ingenic_drm_encoder_atomic_check) already computed
> > >  > crtc_state->adjusted_mode->crtc_clock accordingly, but
> > > clk_set_rate()
> > >  > used crtc_state->adjusted_mode->clock instead.
> > >  >
> > >  > Fixes: 28ab7d35b6e0 ("drm/ingenic: Properly compute timings when
> > > using a
> > >  > 3x8-bit panel")
> > >  > Cc: stable@vger.kernel.org # v5.10
> > >  > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > 
> > >  Can I get an ACK for my patch?
> > > 
> > >  Thanks!
> > >  -Paul
> > > 
> > >  > ---
> > >  >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
> > >  >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  >
> > >  > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > index d60e1eefc9d1..cba68bf52ec5 100644
> > >  > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  > @@ -342,7 +342,7 @@ static void
> > > ingenic_drm_crtc_atomic_flush(struct
> > >  > drm_crtc *crtc,
> > >  >  	if (priv->update_clk_rate) {
> > >  >  		mutex_lock(&priv->clk_mutex);
> > >  >  		clk_set_rate(priv->pix_clk,
> > >  > -			     crtc_state->adjusted_mode.clock * 1000);
> > >  > +			     crtc_state->adjusted_mode.crtc_clock * 1000);
> > >  >  		priv->update_clk_rate = false;
> > >  >  		mutex_unlock(&priv->clk_mutex);
> > >  >  	}
> > >  > --
> > >  > 2.30.2
> > >  >
> > > 
> > > 
> > 
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
