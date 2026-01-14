Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AAAD1FF5D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 16:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A153110E581;
	Wed, 14 Jan 2026 15:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="nCTKLLGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F35810E581
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 15:53:39 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so49137445e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768406017; x=1769010817;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mrePS2BeC/5/zU5iIVNiA/HxBMqtaGmBB9n2hBMQrA0=;
 b=nCTKLLGRjJvEgDkHJvR8ALDKlxrsQhM+reV0eVp6fo67mTywc3c7P4H1oWxIJQeL/a
 298YQXEnbjoLTnmfAF4t3ij798DiVoCYvm9NaBqAtPpiRIurHlGsvxRlO0m3Dl4OB4Q8
 UOxV24OKRhvGWNiYYcS95SUomwXC1j7kVMwlDkSZ3xdY0tX+X6zUsXJ9GtZpNihvoDVR
 MpkRioHYzFWF7KrLvL3YY4j6exsyeq2EX52krKnR+hNjqsWh6V/L3gktGfHQn2OIt/xT
 PIxFRN19dqDtPoRMlzbiZjL7TUlBxPTebnXWm1XKDfiWcq9XorT9Z3c0XsXSA5rdC+Fv
 83Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768406017; x=1769010817;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrePS2BeC/5/zU5iIVNiA/HxBMqtaGmBB9n2hBMQrA0=;
 b=U/Atp6/b4vxKjRGaVzBB5JswuBULrVfUp7p8y/bIMRexXq5OIBBzSeHVHftkiBMjr1
 cFVruDTLp8Yra2rygCWhCyLJGqea1pxg8B/hYLyvOYKGhHvUDUv83k5tnskyf9PHym2I
 bTqg0ilpI56j/+a7kxhZ29RjwJoET4g2b2cHQLP7uHrrqW5Vyw8LqpnB/Yh0ic7wopct
 skFla94agRAVPMGOKaeQ6LnGM95sl0RQHqenEX45ARgtw+7qc3RihyH5+Vt7mMVJhh+G
 HewIvby/X2e+4FEB74Ht1dQaU+Lm3C6TA5EHqcoGY4wP/KhO6Tpr1Zok0Qgr/jwN+i5g
 AWgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkWmRq1h/BDjE5wSSrtiItKujLQODfBFyY28nEdSJ4DruIpAbRbiwvTIOTSBwAEvtLWaU6YXLBf7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIy83wNqjA7DJkbigWfn6xbfMgty+xXI3qACbAVYJGvCmi+OXy
 lTcD+ac9CSACwRmh5lZ/pwmYWq5d1dfBpssRR7mzPtW8XEs4Nf8aOmu7LtlPyQ6lNJg=
X-Gm-Gg: AY/fxX4X3tzu04W4lCxY7HkI6HJj1Y2UOZg7HaN+7ENm7S74XdnTIhh/PZvTij0RJ9b
 34kbtrTfzkf35VGcuw2E0SzcaNQpzmbVFLfa/Jg5W/hCL2uePFjIq8jg1POqKEpfbQ/4MByNPUP
 d3TPdsytECnOe6QZxo/IfAecQVdLczlcnRf9/fQgqR4QVqkdVHhAJXf5avZ0A3awHNUu0BBSWFH
 FdAtRMckAIiyPTHcai3n5P94QWyHen45ET+6UqYhAsVrmzSMSXyHXN2V0rILuUvNCPnoBkda4qH
 l/mOk3/YTzmR0qDaqkGvMIGMbf3lCqeEPIemvw/4TUP+3J7/NylVH9QPCkxH0KxM37Hj0UlkHEe
 ty/Fc7YypVjmeM2ZvGJ+YzRfaumUSFYCLjnpxRhNZ6FMwc+uhx81DfiqYojp1FxxC8qtuQdaMRZ
 InodczcWhTtrvQKQ0Aa/tM6dPa01quiops+IOSS1rFzi3HKM/nXVHGUz3pihp0D7CUBuX/P2w3A
 sdK5CVG5Y2b1b9jBq7UGPHCfoM1VafIzPvE8y8DVRI0Kwny1dwlv2DC1n2AvKHWjciLY6PczMpS
 tm2LbVw=
X-Received: by 2002:a05:600c:4515:b0:45c:4470:271c with SMTP id
 5b1f17b1804b1-47ee339455dmr35015355e9.18.1768406016823; 
 Wed, 14 Jan 2026 07:53:36 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee870sm51184009f8f.36.2026.01.14.07.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 07:53:36 -0800 (PST)
Date: Wed, 14 Jan 2026 15:53:34 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: tessolveupstream@gmail.com
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aWe7_hFpmO0E2sJe@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
 <aVuKdAyXfWLs-WJI@aspen.lan>
 <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c182df66-8503-49cf-8d1d-7da17214b843@gmail.com>
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

On Tue, Jan 13, 2026 at 10:15:53AM +0530, tessolveupstream@gmail.com wrote:
>
>
> On 05-01-2026 15:25, Daniel Thompson wrote:
> > On Mon, Jan 05, 2026 at 02:21:19PM +0530, Sudarshan Shetty wrote:
> >> Update the gpio-backlight binding to support configurations that require
> >> more than one GPIO for enabling/disabling the backlight.
> >>
> >> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> >> ---
> >>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
> >>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> >> index 584030b6b0b9..1483ce4a3480 100644
> >> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> >> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> >> @@ -17,7 +17,8 @@ properties:
> >>
> >>    gpios:
> >>      description: The gpio that is used for enabling/disabling the backlight.
> >> -    maxItems: 1
> >> +    minItems: 1
> >> +    maxItems: 2
> >
> > Why 2?
> >
>
> In the current design, the LVDS panel has a single backlight that
> is controlled by two GPIOs. Initially, It described as two separate
> backlight devices using the same gpio-backlight driver, since the
> existing driver supports only one GPIO per instance.
>
> So the maintainer suggested to extend the gpio-backlight driver
> and bindings to support multiple GPIOs.
> https://lore.kernel.org/all/q63bdon55app4gb2il5e7skyc6z2amcnaiqbqlhen7arkxphtb@3jejbelji2ti/

Right. So, once we support multiple GPIOs then why limit it to 2?


Daniel.
