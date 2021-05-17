Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE0382D1B
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 15:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BAE6E95C;
	Mon, 17 May 2021 13:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0856E95C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:16:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id t206so3587795wmf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=rcRjj0kSXaoUG+69UiGMoMFuPjntXCgBD6uppcpvNks=;
 b=lSTYoAxprm0avW4QjQOozjs5yBsqLn2q/rOyq4ZIh0s/uD1IWHh+lkKBgfXnZL920Z
 YIZ7pDGa2hn2nT9Z3fm2UPo+EwPk33GO8ecURuxVaf8v9D3vDpstRNXosUzz8WnVTGbo
 TDIAwRJqXufB+99sKOAcPEx2KUgNQ/HdYNUQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=rcRjj0kSXaoUG+69UiGMoMFuPjntXCgBD6uppcpvNks=;
 b=fDmPOGeGHn82SyO+tUfucN6waMcRENxFk7R+BtbTnUTGvepSoXJ7VvqeeaC3U00hL4
 jC/u2AvE0QZ1vI4pTBIOUniUzmkcke/ozNxyWPQe2nkf7vZ9UXL4o4MI74FF7A71uVIC
 4lGN4dkalE9bTBkFuoh8WF14ckI45oBFpLmV0qjkCSbfMNfYUgTzSsdxqYyu4F0Ea598
 UnicFfeS/4IR1+K4S8sF6NBNLf0cNZ3/Vr5Ks9hkqBNn9BOAgKvgHgYPeO8YfHVK7uhV
 S7bqoNDd0jfEMCl93eRKppwWwEkE+0GSlL6hn5aqAzJifDNt+nZ1RJMcQe+N8caI0+k0
 qWtQ==
X-Gm-Message-State: AOAM533G3RzHPZALzXBHpfMjgEIJE62hoKibA4F6LG/yLJlZOst2vUu3
 f7yhzkk10K4RsSPRRNGwA9Ud+usL/3nTwg==
X-Google-Smtp-Source: ABdhPJyCiK0AWV7OegSOvUzl9QU2kA5OTz7BASeaDdFo3fnYrQzNotPW2rnw1TP3Oq5TswGW8xQItA==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr8515150wmg.24.1621257362543;
 Mon, 17 May 2021 06:16:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v3sm9925105wrr.19.2021.05.17.06.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 06:16:01 -0700 (PDT)
Date: Mon, 17 May 2021 15:15:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/ingenic: Fix pixclock rate for 24-bit serial panels
Message-ID: <YKJsj+dDUshm/ZiT@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 od@zcrc.me, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20210323144008.166248-1-paul@crapouillou.net>
 <6DP1TQ.W6B9JRRW1OY5@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6DP1TQ.W6B9JRRW1OY5@crapouillou.net>
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

On Thu, May 13, 2021 at 01:29:30PM +0100, Paul Cercueil wrote:
> Hi,
> 
> Almost two months later,

Since you're committer it's expected that you go actively out to look for
review or trade with someone else who has some patches that need a quick
look. It will not happen automatically, this is on you.

Also generally after 2 weeks the patch is lost and you need to ping it.
-Daniel

> 
> 
> Le mar., mars 23 2021 at 14:40:08 +0000, Paul Cercueil
> <paul@crapouillou.net> a écrit :
> > When using a 24-bit panel on a 8-bit serial bus, the pixel clock
> > requested by the panel has to be multiplied by 3, since the subpixels
> > are shifted sequentially.
> > 
> > The code (in ingenic_drm_encoder_atomic_check) already computed
> > crtc_state->adjusted_mode->crtc_clock accordingly, but clk_set_rate()
> > used crtc_state->adjusted_mode->clock instead.
> > 
> > Fixes: 28ab7d35b6e0 ("drm/ingenic: Properly compute timings when using a
> > 3x8-bit panel")
> > Cc: stable@vger.kernel.org # v5.10
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Can I get an ACK for my patch?
> 
> Thanks!
> -Paul
> 
> > ---
> >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > index d60e1eefc9d1..cba68bf52ec5 100644
> > --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > @@ -342,7 +342,7 @@ static void ingenic_drm_crtc_atomic_flush(struct
> > drm_crtc *crtc,
> >  	if (priv->update_clk_rate) {
> >  		mutex_lock(&priv->clk_mutex);
> >  		clk_set_rate(priv->pix_clk,
> > -			     crtc_state->adjusted_mode.clock * 1000);
> > +			     crtc_state->adjusted_mode.crtc_clock * 1000);
> >  		priv->update_clk_rate = false;
> >  		mutex_unlock(&priv->clk_mutex);
> >  	}
> > --
> > 2.30.2
> > 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
