Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AC41FAFE8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 14:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4AB6E8AF;
	Tue, 16 Jun 2020 12:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A868E6E8AF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 12:10:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r9so2643675wmh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 05:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=5QWjCps9FQO9o//U7Sgj6WRAuJJOpmMo6AsQMUTmG1I=;
 b=FDxXN5LNMQhJ+U0Lbq6FL19TnObJXisz0N6E5K81GMnjKG7EeF+tQDAYsgtjlv3k9j
 IvIzjcQoJM74t0X6StRdDHj06/FHTN9r/gtA7/R6eJicd3XRUrtXx5Ymiz/ATd+LroLA
 sRLA8+1uGBypwIpt7WFzdzF3fkQ4CAlYxyeRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=5QWjCps9FQO9o//U7Sgj6WRAuJJOpmMo6AsQMUTmG1I=;
 b=QHq3/MVHKEI9lc1/tynIjCsns+YKA4UGorZRopg2HbaqG4xIy4RAfxOgpOKtHFmK4J
 VffITjhhqxQMCEUm2hLTYTmLsRGZjfituSe0wmMy1TiQ+ESxMWY+HZZxidsar7JsRI7P
 Nux5DLc2jMPEOPyfMcneaaoX3CSZlnNNo6s90IxsTlNrfCrGGsjdy1h5xjcRJJHUs8Iq
 oDZ8bCC+vderm0BAz5ACiD8eG63PhIiFV8nSDG5eQDU4jv+OJr8BVYw/UOqrL5DkzkOD
 hakIwLUl54fo3Dabw4ZHZSX7TEapttLDfIimjjgM8bFHubsI1Rwh+qXUUE4E4f5VJdC8
 L5gA==
X-Gm-Message-State: AOAM531VcsYj4kkDnlmzjRkniZYaBaSIo6wn07qUQBqzeMaM6mHD4vQt
 wsAWwM2LfRTU/RBvCTWYEK3h/FBU9O4=
X-Google-Smtp-Source: ABdhPJzr5tEYt0yBuPjN1sXIbPUe6J1xRlewI7i+jrZI2ek42MJkm+CWMwjQCfntoJ1csgCZhjRLEQ==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr2984082wmj.149.1592309457330; 
 Tue, 16 Jun 2020 05:10:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z16sm28964586wrm.70.2020.06.16.05.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 05:10:56 -0700 (PDT)
Date: Tue, 16 Jun 2020 14:10:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drm/bridge: fix reference count leaks due to
 pm_runtime_get_sync()
Message-ID: <20200616121054.GM20149@phenom.ffwll.local>
Mail-Followup-To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Aditya Pakki <pakki001@umn.edu>, kjlu@umn.edu, wu000273@umn.edu,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20200614024005.125578-1-pakki001@umn.edu>
 <20200614134655.GA5960@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614134655.GA5960@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, wu000273@umn.edu,
 Aditya Pakki <pakki001@umn.edu>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 04:46:55PM +0300, Laurent Pinchart wrote:
> Hi Aditya,
> 
> (CC'ing Rafael)
> 
> Thank you for the patch.
> 
> On Sat, Jun 13, 2020 at 09:40:05PM -0500, Aditya Pakki wrote:
> > On calling pm_runtime_get_sync() the reference count of the device
> > is incremented. In case of failure, decrement the
> > reference count before returning the error.
> > 
> > Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> 
> I've seen lots of similar patches recently. Instead of mass-patching the
> drivers this way, shouldn't pm_runtime_get_sync() (and similar
> functions) decrease the refcount on their failure path ? That would
> require patching drivers that already handle this issue, but I believe
> that would cause less churn, and more importantly, avoid the issue once
> and for good for new code.

Yeah the current interface looks rather dodgy, generally drivers aren't
expected to clean up if the first function failed.

Rafael and Greg, what's your take on this here? See patch below and
Laurent's comment above.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/bridge/cdns-dsi.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
> > index 69c3892caee5..583cb8547106 100644
> > --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> > +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> > @@ -788,8 +788,10 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
> >  	u32 tmp, reg_wakeup, div;
> >  	int nlanes;
> >  
> > -	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
> > +	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0)) {
> > +		pm_runtime_put(dsi->base.dev);
> >  		return;
> > +	}
> >  
> >  	mode = &bridge->encoder->crtc->state->adjusted_mode;
> >  	nlanes = output->dev->lanes;
> > @@ -1028,8 +1030,10 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
> >  	int ret, i, tx_len, rx_len;
> >  
> >  	ret = pm_runtime_get_sync(host->dev);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		pm_runtime_put(host->dev);
> >  		return ret;
> > +	}
> >  
> >  	cdns_dsi_init_link(dsi);
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
