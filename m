Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B925902C6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A30711A45A;
	Thu, 11 Aug 2022 16:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE6B11B1D2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:13:48 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id kb8so34367888ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=zOizcOJIgGhIFewZIe3tvubYUQPW/ntL4zGunsrA5cw=;
 b=Qr3BDp2juYCGelRivuqM4UY+YzW3uhXpsjH5+gYZbu4b/3zTcBI8ZH6mreBtxXYvBt
 PeFIvWDNS1zXcUcNpWyyxsRfets6LKqEm3joxorkU1MJGzzVtcT0w9LT8T+bD2lBmJKW
 tx2ZPbmqEtI8YkoI5p9WuGWFA6QDenuo0Vjsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=zOizcOJIgGhIFewZIe3tvubYUQPW/ntL4zGunsrA5cw=;
 b=qrBqHqdL0zOidqC4uDRqyFN/ZCG+pzvOAiQpJfkSCPkddzdF8G00OFtzDjGjxXmnty
 FD57r+w+WF9xPeu7TpuN6aabc+s2cVraEa83azoSn5594nQodcKPglpWosgBUP3s1AWC
 P+12mKFZ46zsQIMs6Ai3NEforQFGQYittbW0O/o7gg8dnyrW+5n582sT1BOqGiZSGs37
 UkzZ+4I2ZaeBmXEvXIhDJ8ODoCTMtBPebJfii2UfeyhR2zaoEhvwNMDjwmaKtPqcr6E3
 r6fMoHzVN2ow5R9OiLcJ9mDd7D2/bdpACSh0A1MpNySOgtoLMMJfQ6UUibUigsgJCmBK
 FPIg==
X-Gm-Message-State: ACgBeo2jF+j32dgB+Mb1fEiT0z6TU5xYoRx52jqjZ+SW8Im1nd+hm0qX
 KzUERWVV0nRKToQDU9sbDkxmig==
X-Google-Smtp-Source: AA6agR4VY+h5OjJ214NHuhkvNNtRyE7xfzFLbkbwMj1pY8fIL4OWEp83VpubLbSxZt7nDyyNAlPSLQ==
X-Received: by 2002:a17:906:58c6:b0:731:39e0:3eb8 with SMTP id
 e6-20020a17090658c600b0073139e03eb8mr17662181ejs.205.1660234426792; 
 Thu, 11 Aug 2022 09:13:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a1709066c9900b00734bfab4d59sm372376ejr.170.2022.08.11.09.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:13:46 -0700 (PDT)
Date: Thu, 11 Aug 2022 18:13:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm:pl111: Add of_node_put() when breaking out of
 for_each_available_child_of_node()
Message-ID: <YvUquMUG6VoMiwGQ@phenom.ffwll.local>
References: <20220711131550.361350-1-windhl@126.com>
 <YvPeNbHCV29oHNtw@phenom.ffwll.local>
 <CAL_JsqKX-XsMM90iQNmk=9de9cJu51+ebLAtBcRcAvHAHFbH=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKX-XsMM90iQNmk=9de9cJu51+ebLAtBcRcAvHAHFbH=g@mail.gmail.com>
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
Cc: airlied@linux.ie, Liang He <windhl@126.com>,
 dri-devel@lists.freedesktop.org, emma@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 01:35:36PM -0600, Rob Herring wrote:
> On Wed, Aug 10, 2022 at 10:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jul 11, 2022 at 09:15:50PM +0800, Liang He wrote:
> > > The reference 'child' in the iteration of for_each_available_child_of_node()
> > > is only escaped out into a local variable which is only used to check
> > > its value. So we still need to the of_node_put() when breaking of the
> > > for_each_available_child_of_node() which will automatically increase
> > > and decrease the refcount.
> > >
> > > Fixes: ca454bd42dc2 ("drm/pl111: Support the Versatile Express")
> > > Signed-off-by: Liang He <windhl@126.com>
> > > ---
> > >
> > > As 'Check-after-Put' has been widely accepted in kernel source, we just
> > > use it. If the maintainer thinks it is harmful, I'd like also to use
> > > 'Check-and-Put' coding style but with a bit more work.
> > >
> > >  drivers/gpu/drm/pl111/pl111_versatile.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> > > index bdd883f4f0da..963a5d5e6987 100644
> > > --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> > > +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> > > @@ -402,6 +402,7 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
> > >               if (of_device_is_compatible(child, "arm,pl111")) {
> > >                       has_coretile_clcd = true;
> > >                       ct_clcd = child;
> > > +                     of_node_put(child);
> >
> > The same issue seems to exist right below in the next break? Can you pls
> > respin with that included?
> 
> It has a put already.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Huh I was blind.

Thanks for patch&review, pushed to drm-misc-next.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
