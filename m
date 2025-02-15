Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E14FA36F7A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 17:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FED10E1E4;
	Sat, 15 Feb 2025 16:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="af0Zym5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9621C10E1CB
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 16:35:07 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-471b5372730so38230931cf.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 08:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739637306; x=1740242106; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GTDjCGRpUNKDDvAUL0WPoPLyp3KWBVbd5boILJywKts=;
 b=af0Zym5SufgCSyg/174vyl0gzwfed2l833y54h7iIKAZ9eCXDDzDeZ0GdMO17JL2YQ
 8JW9mG6/1PoD0x2q0JOlMgBXF/5JE0OEUSTnmmWtLt7WbAltSI7xC0xCiLYGtzCKCcq9
 juAkw+QuWQsOgmgK85hup485N8NRUwz1OxluoeXXWVkJhfg6kAgyYrNCp/tQjli+Yt2L
 9o+65N7lKqgNAtUc8Hx+5o1dSyl+iYIyc+WuK70+00K2baWv5zMMpOtp9hLIsELVdqVW
 x/JEIf3lv1AJBr1vrr2evQIdhjKes0oejhVAJCB/gRokyDr870NQmXH1MUL3q/r6ToA6
 mSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739637306; x=1740242106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GTDjCGRpUNKDDvAUL0WPoPLyp3KWBVbd5boILJywKts=;
 b=ouYtTEW99DxrKcbWtaySAnrLmKJ9Nfuwit5mOz0+HnvBgVywcv9CnC8aEzqaCdGjt0
 e2sOqRyakO5AR0TEKd1vxHjGPN+eWLPQ/Fh0RofIf+cV0PxbtM0lRhX/nSfJtcF+bYxW
 u/8cxDRQJhm2jIuMqnMw8yfRXpkovMN1C4pJIZ9g3mfzgvFRth+Qk2Wa+p+SlygRfPT8
 RSY4VBlMweGEupR/AT2Pz9SADysxkMaXYDHbTYwSyieFbOL1GKJ9c8xS2tmgV9kz30Dl
 /mHceu6wWgwkQX2SznSA6SfU/gfUx31Ax48HHaEE9oMAfbcPLUSaUG8umPq9X9JA5y4p
 +zBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbZNyu3oOdNesAkKQQCqxWItnWIYLmFXw5KcO6Pp7+o55zLtR8JzolqeRmvx/T72cydTj25vtrLuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8f7pl6d030P4sLHZ2M5ekiH9hyPDMkIAUlE0FGdu4yivLaBc6
 MFKuA+GSquSzJnFPJNOfRbXcRBBLcMHh6zMVHN516I7BbJV2FX78
X-Gm-Gg: ASbGncvGft6X0ADVi22NJPSdLKN7m3NIpmxa7QtmwjNOwgOZg34hXAll0lTUCn4gk2/
 ZsZC7tJpklM1/lQ0EKW95ZpWGxXECrqLKtwkO8klVcWaQNeMVFxeRa3JTG4B6bsjGGH8JIGmxUv
 z4ZwsD6VxH4ihJ+F3edMFcPjiXBWnXQMEgcesXx53Q8343M3btKrM9ou4nlxKJRL9LgQDlJuzaA
 wThPui0ms9Zolb7pzsjW9AaRpU1R+NXNnD/0qGqWR8/NUcbzzkjsZJ+bsW+xFGbDFsTtIlcbkiI
 LY9krA4TWdhI8v8VUvHvOtF+5abDX5EJI2OK7DpsCJbANpwpMezu
X-Google-Smtp-Source: AGHT+IE5ndOLlJRNvl0FnbJw+hM9GbE588rdpBwbd0mV/9012KSspZa9WM3VBWjd+245FTni/WeHRg==
X-Received: by 2002:ac8:7c45:0:b0:471:a17c:ceca with SMTP id
 d75a77b69052e-471dbd22bb5mr46825011cf.13.1739637306251; 
 Sat, 15 Feb 2025 08:35:06 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-471c2b049b8sm28801181cf.76.2025.02.15.08.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 08:35:05 -0800 (PST)
Date: Sat, 15 Feb 2025 11:35:03 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, 
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
Message-ID: <igbvobwlcofadqtqxmlwr56tvzekdx6nqr4t7uxbgnxo56yiu3@fzyhaeyqqn3m>
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
 <ejsf4dwcyg7j4wdpdtbs56lbwokzlq65fxn2gxio4l5xg6di2r@pmnpafv3nwxz>
 <20250214132910.2611f9cd@pumpkin>
 <cx4efp5kx3hahymdtgrjwu64373du4vg2v7errm3t34exrgezn@weo6exjuq2fu>
 <20250215114800.5c8d8d2b@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215114800.5c8d8d2b@pumpkin>
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

On Sat, Feb 15, 2025 at 11:48:00AM +0000, David Laight wrote:
> On Fri, 14 Feb 2025 20:02:01 -0500
> Alex Lanzano <lanzano.alex@gmail.com> wrote:
> 
> > On Fri, Feb 14, 2025 at 01:29:10PM +0000, David Laight wrote:
> > > On Thu, 13 Feb 2025 20:54:59 -0500
> > > Alex Lanzano <lanzano.alex@gmail.com> wrote:
> > >   
> > > > On Thu, Jan 16, 2025 at 05:48:01AM -0800, Nikita Zhandarovich wrote:  
> > > > > There are conditions, albeit somewhat unlikely, under which right hand
> > > > > expressions, calculating the end of time period in functions like
> > > > > repaper_frame_fixed_repeat(), may overflow.
> > > > > 
> > > > > For instance, if 'factor10x' in repaper_get_temperature() is high
> > > > > enough (170), as is 'epd->stage_time' in repaper_probe(), then the
> > > > > resulting value of 'end' will not fit in unsigned int expression.
> > > > > 
> > > > > Mitigate this by casting 'epd->factored_stage_time' to wider type before
> > > > > any multiplication is done.
> > > > > 
> > > > > Found by Linux Verification Center (linuxtesting.org) with static
> > > > > analysis tool SVACE.
> > > > > 
> > > > > Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> > > > > ---
> > > > >  drivers/gpu/drm/tiny/repaper.c | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> > > > > index 77944eb17b3c..d76c0e8e05f5 100644
> > > > > --- a/drivers/gpu/drm/tiny/repaper.c
> > > > > +++ b/drivers/gpu/drm/tiny/repaper.c
> > > > > @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
> > > > >  				       enum repaper_stage stage)
> > > > >  {
> > > > >  	u64 start = local_clock();
> > > > > -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> > > > > +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
> > > > >  
> > > > >  	do {
> > > > >  		repaper_frame_fixed(epd, fixed_value, stage);
> > > > > @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
> > > > >  				      const u8 *mask, enum repaper_stage stage)
> > > > >  {
> > > > >  	u64 start = local_clock();
> > > > > -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> > > > > +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
> > > > >  
> > > > >  	do {
> > > > >  		repaper_frame_data(epd, image, mask, stage);    
> > > > 
> > > > It might be best to change the underlying type in the struct instead of
> > > > type casting  
> > > 
> > > That'll just make people think there is a different overflow.  
> > The commit message should describe which overflow this applies to regardless.
> > 
> > > It'd also force the compiler to use a wider multiply.
> > > 
> > > A more subtle approach is to change the type of the first 1000 to 1000ull.
> > >   
> > My reasoning for favoring the type change route is as follows:
> > 
> > 1. I'm not a big fan of using the standard C integer types especially
> > mixing them with the fixed sized kernel integer types for these kinds of
> > overflow scenarios
> 
> I'm not sure whether the code is converting seconds to us or ms to ns.
> But in either case 32bit is plenty for the configured timeout.
> Whether that is 'unsigned int' or 'u32' doesn't really matter.
> If you change the type to u64 someone is going to decide that the
> multiply needs an overflow check.
> 
> OTOH use of 'unsigned long' is often an 'accident waiting to happen'.
> There are far too many of them used for clock frequencies and similar.
> I'm sure 'long' has been used because of worries that 'int' might be 16bit.
> Even when Linux was started that was never going to be true.

Fair enough. I don't want to delay this patch further. Maybe down the
road this can be can be refactored a bit to add units as you said and change types
if need be to mitigate future issues. I'll add it to my TODO list.

Best regards,
Alex

> > 
> > 2. It would remove the chances of this field causing the same overflow
> > issues in future development
> > 
> > > Personally I like to see the units on variables containing times (x_s, _ms, _ns)
> > > since it makes off-by-1000 errors less likely and you can more easily tell
> > > whether overflow if likely.  
> > Agreed but this is out of scope of this patch
> > 
> > Best regards,
> > Alex
> 
