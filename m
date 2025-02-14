Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D317EA35F12
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608110EC8B;
	Fri, 14 Feb 2025 13:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xwhk3H+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4957510EC8B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:29:13 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so1096495f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739539752; x=1740144552; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWvbnHy+eruaNnpFjCJCWrVsj6FgpclpeKV+qjRmKSY=;
 b=Xwhk3H+4o4JeZgcKSmqdcRDQnRIkwtoM5Illy6O8TQGPHRwDM2JYLwKZf3HHxYImR8
 MuOOfNg8E0ZzXohPhIWCKmNInlphVR+Xl0zEelCFGE95g+NqAlQ+a/VTp+0kRHr2vY8W
 YLw+A4pO+Tdm7K0xI8JvxSGJVIj8UPNrup3pSL+CMe57V+DqN/sGXYHrOUEfDGQow64S
 mPqCIkMZo0bBH9k46IFtvKWNIxp3lrdbHgqShtOe5XXOsxA8T5RUNRqpsAAUPLna3a+x
 4IekmHNBqJRWmRSYAfDe5Gcd30sITG7TYK0WHrxafKh9644O6Iyi3YChtp7tJivqXdd+
 nl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539752; x=1740144552;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWvbnHy+eruaNnpFjCJCWrVsj6FgpclpeKV+qjRmKSY=;
 b=dt6yTOx8dYtTO5niB4ijy+YDhPAYrAHaEjZdCBKl3xI8Z/ZCwrJy/urAeLIg8Ssww1
 QnmpUV3DQr9W5z+3OSsEebVbeEYfaGGwDaYBzXRL2O1AGAAap2Rv5etrv+dhyVmMFy3B
 Wce6KPfTBk3MtdxJNLYDB0XDW2LvrCTWg9lilsDxNqzUC1oSlruQ8qEaIaHKC7DG17ci
 k5Gv21pcww7bRmF2wkBQn0XDhW/Npd/6H3N+5IOTv14w4p1+nP8VBftTImzE81hrRBOW
 6dloU/Y5dVWT29kkb4Ay0a2t6tjMZsNx3gpZkpSkIFQc1eneAvwyJ0LKmsFvJO9SM5tm
 q3cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ+Mki37/A+22417NmQHAWX/fdfd/DyldfNvyWjgTrFJkb0VOsqBn/KZO9eJjSDofhOXqtJPK8Rlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT2PkTbhMWG+CjcsT6P+EezbxBhfd6yv38O8NUWYAuIxL4wOMo
 mD8zulm2CIHK78XGzOjxQBnJbiH4SspOkiY2pGomBFj+dlzkZ03S
X-Gm-Gg: ASbGncslqd5RyCypj3MVttotdSBDtMiUAzp6c5wJf1JmHi60/DcwU1xBraxNPkIHUOd
 q+p37CNOBfPcBmT8HpuHCb6HFok+ENPmUGpGNUQpXm4St9Xt9XlaWoTXq8Dws02Ixw00kprSlHZ
 re8JWRLJCFcfx2WaAItVzR17GgJGlXcbNvNJ9xkEpd3LqbpNXUr3CDz+uWAAPPinegU6xe8WcIy
 Z0DZJOT7qMX7aYEyhn0mk/jJkBX2NIBqZX6RueuxpQwVm93AQfgAcXUmh/Lce6NssBB+qlkXLVV
 iKw0edIaFtQJXnNyAfc870EX8SXetJDIcf9dntmActuKpToQ7dxtvA==
X-Google-Smtp-Source: AGHT+IE/R0eXpSQdfNv8gz8NRaW1uh9+V+AeTS/4r/DrR2DWuIssTfwwnBlOlf91MqFEjlffVrFhSw==
X-Received: by 2002:a5d:6382:0:b0:38d:d18e:8811 with SMTP id
 ffacd0b85a97d-38f244e960amr7186462f8f.25.1739539751489; 
 Fri, 14 Feb 2025 05:29:11 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4396180f199sm44329255e9.15.2025.02.14.05.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:29:11 -0800 (PST)
Date: Fri, 14 Feb 2025 13:29:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Noralf =?UTF-8?B?VHI=?=
 =?UTF-8?B?w7hubmVz?= <noralf@tronnes.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
Message-ID: <20250214132910.2611f9cd@pumpkin>
In-Reply-To: <ejsf4dwcyg7j4wdpdtbs56lbwokzlq65fxn2gxio4l5xg6di2r@pmnpafv3nwxz>
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
 <ejsf4dwcyg7j4wdpdtbs56lbwokzlq65fxn2gxio4l5xg6di2r@pmnpafv3nwxz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 13 Feb 2025 20:54:59 -0500
Alex Lanzano <lanzano.alex@gmail.com> wrote:

> On Thu, Jan 16, 2025 at 05:48:01AM -0800, Nikita Zhandarovich wrote:
> > There are conditions, albeit somewhat unlikely, under which right hand
> > expressions, calculating the end of time period in functions like
> > repaper_frame_fixed_repeat(), may overflow.
> > 
> > For instance, if 'factor10x' in repaper_get_temperature() is high
> > enough (170), as is 'epd->stage_time' in repaper_probe(), then the
> > resulting value of 'end' will not fit in unsigned int expression.
> > 
> > Mitigate this by casting 'epd->factored_stage_time' to wider type before
> > any multiplication is done.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with static
> > analysis tool SVACE.
> > 
> > Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> > ---
> >  drivers/gpu/drm/tiny/repaper.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> > index 77944eb17b3c..d76c0e8e05f5 100644
> > --- a/drivers/gpu/drm/tiny/repaper.c
> > +++ b/drivers/gpu/drm/tiny/repaper.c
> > @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
> >  				       enum repaper_stage stage)
> >  {
> >  	u64 start = local_clock();
> > -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> > +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
> >  
> >  	do {
> >  		repaper_frame_fixed(epd, fixed_value, stage);
> > @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
> >  				      const u8 *mask, enum repaper_stage stage)
> >  {
> >  	u64 start = local_clock();
> > -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> > +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
> >  
> >  	do {
> >  		repaper_frame_data(epd, image, mask, stage);  
> 
> It might be best to change the underlying type in the struct instead of
> type casting

That'll just make people think there is a different overflow.
It'd also force the compiler to use a wider multiply.

A more subtle approach is to change the type of the first 1000 to 1000ull.

Personally I like to see the units on variables containing times (x_s, _ms, _ns)
since it makes off-by-1000 errors less likely and you can more easily tell
whether overflow if likely.

	David 

> 
> Best regards,
> Alex
> 

