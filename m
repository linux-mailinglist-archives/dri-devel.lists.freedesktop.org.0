Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7F917B2A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBAC10E7C4;
	Wed, 26 Jun 2024 08:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g6PTqkFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F50710E7C4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:42:28 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so77397461fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719391346; x=1719996146; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Oh0VR40TRUiFXajEyAtrpMuiTr3n0qWoEDC9cdem7E=;
 b=g6PTqkFWA6rAWNSSTJ3ym66D4c+NWob4Sv39KskWxbn9eq3Kz/2YCV/sum2L8e35tL
 EdjFY7Hw9FwpQJq6688PTxtw4U7wBgbAf+jR2jx2GYB8JPl/5ovGXC4uVISTVO4Zml3K
 CQkhKZECilIc7cvMigA8dOOYAIfRnxGIv08ITcvE2OFL9yGUuHajoCTHIl78BvMxvNXd
 t2sRi7+i76G3WHIEPEJmmwIHZmkWmKvyHkj/i5j9vkcK+BSK9FULnY2OBZLDNQXf4Fgv
 wG8HA56MOyC1nExhO4WYPKKnmSNt7JZHgYI9PqETmQ6LDJCTQe+BTLpibbWVq83U6hwx
 91kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719391346; x=1719996146;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Oh0VR40TRUiFXajEyAtrpMuiTr3n0qWoEDC9cdem7E=;
 b=R8mYNbaFfDWGINqrZD3PQ5UJhCxLW33/WCyiwpYp810yD/XdgOsZ7cQJqNANxbv+ej
 v199cFpdCN9+HTv1BSuavXBDZS0c8air5HXhTWi05gCf8z7OsqcolxDJOTHXPFZd3UbU
 4nl+a5IXlmchx4GM+Rd+8zrPFX87O4/dSd3Q9t+8ppTJWET1zDgdqQfIaIWxYKyls4+5
 x6u545j8c7eFEEa8lXy/+RXh2ui2ni3ARrgSX7TeUlbgsevDgo912ELo4/IBtNWxfP+k
 LSWx4vGK9vEYvwfyV5ONjy6mHVsptT5tUXei2Nn5VpFBc0KUF0K9NitEwynOZbBjBaom
 KI1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwLQ5Azc2iIYOJ8ufwSWQbhCiIEelWRn0XnF2p32b5puhkHcIfFExZBTvSq9+vUDhXG/qTYwGhDxWnQxNu4fVtILk2YEc2Oyx7NfOexpKp
X-Gm-Message-State: AOJu0YxDOmXJZQbBjnxdzulXWBt0VR2uUs1x7MLp1rUZpevcR16Sf9Jl
 5K869fab0q8fW3/qUYIDM6xuT32QxotkofVMrzYNuCauBALlmCvp4aDYh4T2zDc=
X-Google-Smtp-Source: AGHT+IFrbNPIOjz4l8L0QPdLiBhOanVgKGAzX1JGKORXX+GcNOkKakHvdEgvdrxZRYI3gB9j/fY5+Q==
X-Received: by 2002:ac2:5b4c:0:b0:52c:dcd4:8953 with SMTP id
 2adb3069b0e04-52ce1839881mr6045361e87.36.1719391346204; 
 Wed, 26 Jun 2024 01:42:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cec517173sm501360e87.244.2024.06.26.01.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 01:42:25 -0700 (PDT)
Date: Wed, 26 Jun 2024 11:42:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
Message-ID: <kzk46s2hqrbipehnqhcx47q5mtkdjc3oeeobr2jwinw2ch3pra@37xuwtyakeus>
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <8c55dba5-6308-685e-13da-e728197d8101@quicinc.com>
 <CAAObsKD4-k7Ya4Mi=vEPaC9DucbnVGDO5SaEUt-_o2_Bg+_FgA@mail.gmail.com>
 <CAAObsKCm49y-nUph=m9c+-eG37SaGKG93-1etwOQab4f5MXxOg@mail.gmail.com>
 <20240509144118.baib2pftmpk5nikr@GABBAY.>
 <ZnvCsJfdZdLvw1ZN@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnvCsJfdZdLvw1ZN@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 26, 2024 at 09:26:40AM GMT, Daniel Vetter wrote:
> On Thu, May 09, 2024 at 05:41:18PM +0300, Oded Gabbay wrote:
> > On Thu, May 09, 2024 at 03:53:01PM +0200, Tomeu Vizoso wrote:
> > > Oded, Dave,
> > > 
> > > Do you have an opinion on this?
> > > 
> > > Thanks,
> > > 
> > > Tomeu
> > Hi Tomeu,
> > 
> > Sorry for not replying earlier, I was down with Covid (again...).
> > 
> > To your question, I don't have an objection to what you are
> > suggesting. My personal view of accel is that it is an integral part of 
> > DRM and therefore, if there is an *existing* drm driver that wants to 
> > create an accel node, I'm not against it. 
> 
> Yeah, there's a continum from "clearly 3d gpu" to "compute AI
> accelerator", with everything possible in-between shipping somewhere.
> Collaboration is the important part, hair-splitting on where exactly the
> driver should be is kinda secondary. I mean beyond "don't put a pure 3d
> driver into accel or vice versa" of course :-)
> 
> > There is the question of why you want to expose an accel node, and
> > here I would like to hear Dave's and Sima's opinion on your suggested
> > solution as it may affect the direction of other drm drivers.
> 
> So existing userspace that blindly assumes that any render node will give
> it useful 3d acceleration, then that's broken already.
> 
> - kernel with new driver support but old mesa without that driver already
>   gives you that, even for a pure 3d chip.
> 
> - intel (and I think also amd) have pure compute chips without 3d, so this
>   issue already exists
> 
> Same for the other directions, 3d gpus have variable amounts of compute
> chips nowadays.
> 
> That leaves imo just the pragmatic choice, and if we need to complicate
> the init flow of the kernel driver just for a different charnode major,
> then I don't really see the point.
> 
> And if we do see the point in this, I think the right approach would be if
> we split the init flow further into allocating the drm_device, and then in
> a 2nd step either allocate the accel or render uapi stuff as needed. The
> DRIVER_FOO flags just aren't super flexible for this kinda of stuff and
> have a bit a midlayer taste to them.

Being able to defer render allocation would be extremely useful for MSM
too as it's not currently possible to mask the driver_features during
drm_dev_init()

-- 
With best wishes
Dmitry
