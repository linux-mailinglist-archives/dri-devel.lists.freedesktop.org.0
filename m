Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00F7EE405
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 16:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DA710E613;
	Thu, 16 Nov 2023 15:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CEB10E613
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 15:17:34 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3b566ee5f1dso530531b6e.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700147854; x=1700752654; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=upYktaC638C+1n8jos+j3AezzgKo0tWBtbMgfTx+UFw=;
 b=OH8uOAELZd5vb1EGKRb4EYK9gnu+e3EKXZqzn71pLlUtVIrEJPTMF0YNmPQEoIlGYC
 1qP65ufht/fligJAI1TcXsC9qOsJSc75WCTYSj/mfeW1E3rS+24dIP1qxLwzrgTpNQNP
 1DMlwUKQ4HV9+7gvb4PBeEvs/1c0/mUjL46Cijw2waGouTX+i+nOPKwnyPpgAA0p1shU
 sxw9cEDS/uzAa7vMGa/8q6S4vfs7pnGg9SRgmnwa2uwmk0zdpvrSSsz3AzeXv5BbkYuQ
 jAmI55BKvd+NWGpwLbKiVLNhztjV6ZFvME4Wit4twArJkWfKv5lFdkYQ9ahklKr/rECN
 ARcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700147854; x=1700752654;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upYktaC638C+1n8jos+j3AezzgKo0tWBtbMgfTx+UFw=;
 b=Ezou4pcNv63CL4ApZ/3143sg+3GmbDuxSPuQK0NOEnetNLID8Gkk1+hBFUcsO2sRkd
 F35NMcrviTtdAw/7UDj9fxXFq1mQ/TQQuOoaYhE/mZpCOe8eq8wTg8uzr7dcmWFkXlno
 MLigVqQrOMWHgjJxhEPH6PfpbyqUbJNi8ORB1+s+LNCiDhp8gw17RXKCbB5i4LKZfk1r
 FJWX3N0mv/2wocIs2NcrfZUtI4AQesS/oRitd9/S8Xc8feHLvTmCrXnmmGFYdLp//yr6
 en6HhsQ5jVMS9ruIZP+3ycpA1DKjhnXJiV7Cg+m9/igy+BLKshsUVjvpjUW0s4RCFT86
 L2CA==
X-Gm-Message-State: AOJu0YzfXIqWEpJdkxHL51MkWIh1E1+jgHTNgh6Z4cuKpECCSHb3Kivz
 7SYJzTv+ewqyH6aUUrNVHB8=
X-Google-Smtp-Source: AGHT+IHOtuHXMqHOf2OtX3tlLfuANhMWMt/Bn+r+cI9qmYCTvdSjrcAo6bpdlJuyR6U0MYK1p0VV4g==
X-Received: by 2002:a05:6808:320e:b0:3b2:d8c8:7bfa with SMTP id
 cb14-20020a056808320e00b003b2d8c87bfamr23975444oib.8.1700147854049; 
 Thu, 16 Nov 2023 07:17:34 -0800 (PST)
Received: from neuromancer. ([75.28.21.198]) by smtp.gmail.com with ESMTPSA id
 b7-20020aca1b07000000b003af732a2054sm1836824oib.57.2023.11.16.07.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 07:17:33 -0800 (PST)
Message-ID: <6556328d.ca0a0220.644a5.b79b@mx.google.com>
X-Google-Original-Message-ID: <ZVYyi09/1UjiKq+U@neuromancer.>
Date: Thu, 16 Nov 2023 09:17:31 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 2/4] drm/panel-elida-kd35t133: hold panel in reset for
 unprepare
References: <20231115152647.2303283-1-macroalpha82@gmail.com>
 <20231115152647.2303283-3-macroalpha82@gmail.com>
 <8959af0e-080f-42b0-8b3a-ba8ea7f34c91@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8959af0e-080f-42b0-8b3a-ba8ea7f34c91@quicinc.com>
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
Cc: neil.armstrong@linaro.org, Chris Morgan <macromorgan@hotmail.com>,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 01:38:11PM -0800, Jessica Zhang wrote:
> 
> 
> On 11/15/2023 7:26 AM, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > For devices like the Anbernic RG351M and RG351P the panel is wired to
> > an always on regulator. When the device suspends and wakes up, there
> > are some slight artifacts on the screen that go away over time. If
> > instead we hold the panel in reset status after it is unprepared,
> > this does not happen.
> 
> Hi Chris,
> 
> LGTM, though if this is fixing something maybe we can add
> 
> Fixes: 5b6603360c12 ("drm/panel: add panel driver for Elida KD35T133
> panels")

It *may* fix an intermittent issue with the panel resuming from
suspend, but it really more solves an issue with devices for which
we're still adding support.

Should I still tag it as a "fixes" then?

Thank you.

> 
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> 
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Thanks,
> 
> Jessica Zhang
> 
> > ---
> >   drivers/gpu/drm/panel/panel-elida-kd35t133.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > index 6cd8536c09ff..f1fc4a26f447 100644
> > --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> > @@ -104,6 +104,8 @@ static int kd35t133_unprepare(struct drm_panel *panel)
> >   		return ret;
> >   	}
> > +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > +
> >   	regulator_disable(ctx->iovcc);
> >   	regulator_disable(ctx->vdd);
> > -- 
> > 2.34.1
> > 
