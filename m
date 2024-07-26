Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD93D93CC6E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 03:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6C010E28B;
	Fri, 26 Jul 2024 01:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y2UXQPjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39810E28B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 01:25:27 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7a1d436c95fso6993885a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 18:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721957127; x=1722561927; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gcsiN3AG493yzq0rgBlB09MibvytHV+9kiz8MZRlZLg=;
 b=Y2UXQPjSTFmZG2CqqCuEJOEUs4VgPpl8xpQFiXFRhswwAB7TwkxcaeE7MRMVCSco1N
 P9QpFti0zmxlBrwlEjT4P3n9MrNwY1zu4m3ryeapiAfXKKXv6DMeWKybbzpv6ef5DjVS
 ZlU/E/os2v9aouuGT93fyfc1Qvno8gsE1oZ3D9yMPQ/QPI2mnYLmw+KC5rC+pUGiS8Sf
 rYSHlcqOsBiVJeaTRuRR9aKoOieB3yfkXsQgCcHxLmBY6Yr9a2Jc7HxafmQZytu7+Dct
 rffF1oQjW4uybGaXiDFtM+RzICGbmzQsEvRpQ+28lIq3elRSY4xomNCU9gvHm3Qv5BUh
 W8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721957127; x=1722561927;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcsiN3AG493yzq0rgBlB09MibvytHV+9kiz8MZRlZLg=;
 b=JWJarRZ0oFKud+h6wJj41HgfaTnba1OETf27R7n/b2LR+gHCVX9WbY2Dr7VbUFK81+
 wZEYgzyP8ennlZgrxqvy53fbdGZ6VFzTEuqumSXiUXMv5xwvQLtq2i29I4ZgyoSeCX0R
 S/sMX9cfMvs3rf7uVDvgSQjUEaHUDlwc0FqHvDpiQacCnoLoYn6ZoydXmsqV7ByYKtpc
 rW4EPrH5N2ZAYL5QfcjFcIycf3CP+4TE0ZeELuJtNbYhOWmbQYP8ND7PhHW03QwW5FGW
 av2AbvTKnxPwtfP5qmDa+IftJgK2CkKNZrT8UQDMEzuYBYagp/t4t9ltTCv1BTR2XKK2
 g+rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHhHIUa/MvfnQ7BGrpdmN/EHojIFfYB9m6eYTnzC0uRsuLthqxYaDGv/L0ODMRdkBJroyVeLJJbapS7ZuPNJEG8LnVttLISe8ooWGydDXh
X-Gm-Message-State: AOJu0YyBz+PfnGeA3Meq+xKeqpVei277sOveORNrVVgciHADOcLUED6j
 Y22F0EhF4m7Q3GvnWx+9mx/l8jAWYD18KxSzbwWO1cqXc4ZDeOPR
X-Google-Smtp-Source: AGHT+IEbX1qyvuNhBgiKknHBt9L3xXVKiF4PnTrA2aIRaf7R6KzZWcObfO6At+M5nm+Oef0b88VtJw==
X-Received: by 2002:a05:620a:40cd:b0:79f:84f:80a8 with SMTP id
 af79cd13be357-7a1d7e13d23mr495676885a.13.1721957126727; 
 Thu, 25 Jul 2024 18:25:26 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d7398234sm132921785a.17.2024.07.25.18.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 18:25:26 -0700 (PDT)
Date: Thu, 25 Jul 2024 21:25:23 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mehdi.djait@bootlin.com, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <j5laj5fy4lamyhlyelaq5vfu5vfxj4ybrssrbvrbyndbnvmsyh@6voevw6f3xf7>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240725004734.644986-3-lanzano.alex@gmail.com>
 <0f98db88-71d4-43a6-85f7-a9661c50a382@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f98db88-71d4-43a6-85f7-a9661c50a382@kernel.org>
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

On Thu, Jul 25, 2024 at 08:08:57AM GMT, Krzysztof Kozlowski wrote:
> On 25/07/2024 02:47, Alex Lanzano wrote:
> > +static const struct spi_device_id sharp_memory_ids[] = {
> > +	{"ls010b7dh04", LS010B7DH04},
> > +	{"ls011b7dh03", LS011B7DH03},
> > +	{"ls012b7dd01", LS012B7DD01},
> > +	{"ls013b7dh03", LS013B7DH03},
> > +	{"ls013b7dh05", LS013B7DH05},
> > +	{"ls018b7dh02", LS018B7DH02},
> > +	{"ls027b7dh01", LS027B7DH01},
> > +	{"ls027b7dh01a", LS027B7DH01A},
> > +	{"ls032b7dd02", LS032B7DD02},
> > +	{"ls044q7dh01", LS044Q7DH01},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(spi, sharp_memory_ids);
> > +
> > +static const struct of_device_id sharp_memory_of_match[] = {
> > +	{.compatible = "sharp,ls010b7dh04"},
> 
> Both ID tables should be in sync. See not-so-recent IIO discussions and
> commits.
> 
> > +	{.compatible = "sharp,ls011b7dh03"},
> > +	{.compatible = "sharp,ls012b7dd01"},
> > +	{.compatible = "sharp,ls013b7dh03"},
> > +	{.compatible = "sharp,ls013b7dh05"},
> > +	{.compatible = "sharp,ls018b7dh02"},
> > +	{.compatible = "sharp,ls027b7dh01"},
> > +	{.compatible = "sharp,ls027b7dh01a"},
> > +	{.compatible = "sharp,ls032b7dd02"},
> > +	{.compatible = "sharp,ls044q7dh01"},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, sharp_memory_of_match);

I'm having some trouble finding the discussions and commits you're referring to.
When you say the tables should be in sync are you referring to the ordering of
entries in the tables? Like at index x of both tables should define model y?

Best regards,
Alex
