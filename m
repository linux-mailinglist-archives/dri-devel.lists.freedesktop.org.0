Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C18CB30F
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 19:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D4610F016;
	Tue, 21 May 2024 17:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OSbnpOWe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ED510F016;
 Tue, 21 May 2024 17:40:45 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso73814641fa.0; 
 Tue, 21 May 2024 10:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716313244; x=1716918044; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BGtR1ws+JRg9IaP0YvowCKNdfiSrHkAApZjY1DSgmn0=;
 b=OSbnpOWe+7kr7S9djRO3o+Kta9ojXxwM9idukYgpjej+GJ7nKi2UJGKy0XzGHUf3p5
 rl0ZhNXbQmnpWo5xmgq0LiQO73Ar4cg0+bYyzDNN1QIQmSBBDeI/jlCmfGStKqdR/7Cj
 ZM1k5bzBL/hoV/07B8U+EVjd6sdDJWaJhMjT/qijsTtLtjKvhJhLUD25TxnWXu2IPKNu
 mKciq6+PC113J1zdHNm3hgrzOwtrqXWxlWaEECLpy4kn2D2ZHJOQnc+ruzWxs2IGnnaG
 gJczlYCaayOK+yjwyPPXSBZQ6N4nA+kbpNBwZ7rhw5k81r5q0RJHxIWAjmPsnubrQaY2
 jOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716313244; x=1716918044;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BGtR1ws+JRg9IaP0YvowCKNdfiSrHkAApZjY1DSgmn0=;
 b=uh7EfF1oIGEoObaLlx7T7IP0STFHH0inJ5fxF35JVSqBC7XTokaA9kYQ2MP1FQe8iX
 k4q3vtggAHCESEHYhoSQc0X9YyUkSxrEt74+O4aFMcmB2Jsfg8lTIbT8j+hHganwp4Er
 V4rJB2qMxUOEShpjqUJn/SrM5JjftzgBo7bHU35W85J1YWB+d2qqCP0oDkmJh6dWrPGZ
 49rFsqW+psL8yHPTpiDO8D6e4TW+y7pME1vruFRkF63BQ2aHZCPoK+kD6u8gr5toOxMg
 CqDm7qhaYqaw+hJWBL47Qqf30+zBtNkF9z913cYcG80ZgYcvZG20vE21M6tRF3zxv73l
 TtbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr501z5bMW6IMHM2+lMPu3/Ta7UOrZSrERLT4prBEXuhJDkTuYqWiFqA7B/3c1Jc12jSw7IW5jnxRZqFXYcamCDh7wjTCHJYJbhY5p+DjEJo/5w0joJsALNRmEaCctIayvnRXkHzqulwBzFffZCA==
X-Gm-Message-State: AOJu0YyfWD0M0C1AM7B3dlkMIr2NDa6TqOD/zfMziZObLj16HC3cLi7y
 +QUKOY7ZdXubMkhmZtlW50ypTxjDe06dMXNk6pzXVL4ah7Q5WG0/eSP9dDfv/B9JAYkiAbiSd7X
 ApjT5Rc9SFgIKimNveQRacafvbTA=
X-Google-Smtp-Source: AGHT+IHYEuO5MgwTyT5sB8of44MmsDP4esL79AuzjW60jj/rU/cDu1ZEmGk9v0lit8+7zoyMMlf33gCrlcw+m0dJHxo=
X-Received: by 2002:a2e:461a:0:b0:2e5:2414:a205 with SMTP id
 38308e7fff4ca-2e52414a255mr244516321fa.27.1716313243532; Tue, 21 May 2024
 10:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240519130610.7773-1-mario.limonciello@amd.com>
 <-KAO9zJq5vTiesgtw-PMO0lDkSH1tuV271WNqlVuh3ZSkMzKWB9JQJce68-X-GwhD57QilHIBnLxN9k03I3-CMeYQm30NJMLizfyUUxTqHA=@emersion.fr>
 <e3a4331a-307e-4377-a349-8699024f8459@amd.com>
 <CAFZQkGyupsydjSEfv6OgMqPmHm9kMy4HQs7aNvzn77omSN+ZhQ@mail.gmail.com>
 <a35f2f5b-024f-42ed-9d59-48efcf4516a8@amd.com>
 <55205499-293e-45cd-870c-1ccccd05145d@amd.com>
In-Reply-To: <55205499-293e-45cd-870c-1ccccd05145d@amd.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Tue, 21 May 2024 19:40:31 +0200
Message-ID: <CAFZQkGzNJiG=gAW-zaMyT+Dct50tLTanpiqko6MxL9c=aLuh7Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for Panel Power Savings property
To: Leo Li <sunpeng.li@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Simon Ser <contact@emersion.fr>, 
 amd-gfx@lists.freedesktop.org, Harry.Wentland@amd.com, 
 dri-devel@lists.freedesktop.org, "seanpaul@google.com" <seanpaul@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Am Di., 21. Mai 2024 um 19:28 Uhr schrieb Leo Li <sunpeng.li@amd.com>:
>
>
>
> On 2024-05-21 12:21, Mario Limonciello wrote:
> > On 5/21/2024 11:14, Xaver Hugl wrote:
> >> Am Di., 21. Mai 2024 um 16:00 Uhr schrieb Mario Limonciello
> >> <mario.limonciello@amd.com>:
> >>>
> >>> On 5/21/2024 08:43, Simon Ser wrote:
> >>>> This makes sense to me in general. I like the fact that it's simple and
> >>>> vendor-neutral.
> >>>>
> >>>> Do we want to hardcode "panel" in the name? Are we sure that this will
> >>>> ever only apply to panels?
> >>>>
> >>>> Do we want to use a name which reflects the intent, rather than the
> >>>> mechanism? In other words, something like "color fidelity" = "preferred"
> >>>> maybe? (I don't know, just throwing ideas around.)
> >>>
> >>> In that vein, how about:
> >>>
> >>> "power saving policy"
> >>> --> "power saving"
> >>> --> "color fidelity"
> >>
> >> It's not just about colors though, is it? The compositor might want to
> >> disable it to increase the backlight brightness in bright
> >> environments, so "color fidelity" doesn't really sound right
> >
> > Either of these better?
> >
> > "power saving policy"
> > --> "power saving"
> > --> "accuracy"
> >
> > "power saving policy"
> > --> "allowed"
> > --> "forbidden"
> >
> > Or any other idea?
>
> Another consideration in addition to accuracy is latency.
>
> I suppose a compositor may want to disable features such as PSR for use-cases
> requiring low latency. Touch and stylus input are some examples.
>
> I wonder if flags would work better than enums? A compositor can set something
> like `REQUIRE_ACCURACY & REQUIRE_LOW_LATENCY`, for example.

I think that's a good idea. With a flag for color accuracy and one for
brightness, the compositor's intent would be communicated well.

> - Leo
>
> >
> >>
> >>>>
> >>>> Would be nice to add documentation for the property in the "standard
> >>>> connector properties" section.
> >>>
> >>> Ack.
> >>>
> >
