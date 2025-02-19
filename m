Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D46A3C33F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 16:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B48E10E834;
	Wed, 19 Feb 2025 15:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CcUJyDSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2499610E839
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 15:13:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so6073385e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739978006; x=1740582806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drt0+j9GwUEYRUPa0Msh+AZlxPlFbPJs9VWQL5t8VpM=;
 b=CcUJyDSHza4RkWb5LKY3v8mtWnW3tYkhxZf8emLOz6H09xuS/bZravgBPFhPlU+ei4
 TezWoOAx08+4aAisTu6HMOeyzXYukMqOnXsCGSYiOssVNy/jWvD7X8TcgGUdVkYJ8UBK
 6wgyv2i99aNzoLJBDhw9g53+vonGO6yT2WukouLdQ0czr0znyjQdy+Mk61/IzEwT5RTw
 VulQ1l+7CjFRsWT9nfZzaDcUMAgMD9XmAez8D/hcqY7yahrGMKoe5FS3Xh0bZC4RGC7n
 qzjelNy6QaofC4uSqLRumCKtupmG04fVZqSDYFJ8KOK3FkuJePVPjOIH6914dKJED3nO
 Ll1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739978006; x=1740582806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drt0+j9GwUEYRUPa0Msh+AZlxPlFbPJs9VWQL5t8VpM=;
 b=UEN/HEuHJeL2attUZ0O/Gx35PY8CgTuvlcMfG5vdNuHlTwcksVPq/NRKRkrdBL0NN1
 KV7i2ZUhNjgJN00HKu6sMy3YFPUO5NeGf59vbqz/2weP2oq1keljmZFBIujwcFqNc09l
 /ej7WH5cmqBAw/MxnY/5Q3+Ms5MuGfx+HKiWl+otWQkBcZuY4DdarktvHYnSKumq8EKQ
 aydpSh93FVU7Vssuy/e9tSw00VIPdLugUqV7bJAEVY208XDOTRKA3PmV3TDX4lWDX9eo
 gTM7ywBQmkRKk3T+XFCVCbrRyWMDbj7+TAfa5/GogmN19jd6Cxd7RC6KjrM4VWEOOW75
 0aUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRRfqh2hZIjvUmfKZu8ZdtpOkfLmz6VtW6OVCmph3gYUYvLrd9EONWbtwREs1QCKUyjZK365bSZDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjX2J/yif9NmAw6hBV/ZRe1a7ZS9ABdlf+iVmqZ5tOnfO8XE4+
 EGrhZEHC4vBGO9T3AONkTVOEp1BOlQYzEZ2dj0nk8avLnKuZaXQPukl5VC7C4BzlITHSqka9na0
 iznJcxHxna3b9FAaF353zj2Tam0Y=
X-Gm-Gg: ASbGncuP4OAqqLbXZ8rvlsZ1bcf5ut/y/gaZ5IOv83Fsm91KbwFC3BITsn7zrFp8qgE
 ALy+YXl+n4MeyaYDuR/E/PK18ZrmOgPSFreL9ft5fyq7KMsWZQtbuXBNnm1Jd/B75zjeTh5rF9w
 ==
X-Google-Smtp-Source: AGHT+IGZjyYv7inH5rGul4/nFCxLPjiYnaafDWPgkEdRu9+5PeRR1GZ+8z1ALgaPlmJj0wiSt+tzaqhh5lN+rJfpqVs=
X-Received: by 2002:a05:6000:1fa1:b0:38d:c6b8:9fe1 with SMTP id
 ffacd0b85a97d-38f57ea1cfcmr3735864f8f.24.1739978006290; Wed, 19 Feb 2025
 07:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-3-clamor95@gmail.com>
 <Z7XqKcOUt5niXzpv@smile.fi.intel.com>
 <CAPVz0n1_WQyOHhtEVAh53uhEUhZvqqZSEJh6XALtSrVfkMSLYw@mail.gmail.com>
 <Z7XzgfHcjyK_UZKv@smile.fi.intel.com>
In-Reply-To: <Z7XzgfHcjyK_UZKv@smile.fi.intel.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 19 Feb 2025 17:13:15 +0200
X-Gm-Features: AWEUYZkkApm2pdMCm-ce2W0NUEFkWtCs86nFAeRIR60gASygQyZJcvz4RbQHc2Q
Message-ID: <CAPVz0n2WwAOb1UU7J7aDTdhXXCaAZkCpYjW_nc_CBRgkGWdEOw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mfd: lm3533: convert to use OF
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

=D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 17:07 Andy=
 Shevchenko
<andriy.shevchenko@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Feb 19, 2025 at 04:36:38PM +0200, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 19 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16:27 =
Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Tue, Feb 18, 2025 at 03:27:00PM +0200, Svyatoslav Ryhel wrote:
> > > > Remove platform data and fully relay on OF and device tree
> > > > parsing and binding devices.
> > >
> > > Thanks for following the advice, but the problem with this change as =
it does
> > > too much at once. It should be split to a few simpler ones.
> > > On top of that, this removes MFD participation from the driver but le=
aves it
> > > under MFD realm. Moreover, looking briefly at the code it looks like =
it open
> > > codes the parts of MFD. The latter needs a very goo justification whi=
ch commit
> > > message is missing.
>
> ...
>
> > Splitting this into a set of commits would be nearly impossible,
>
> I don't buy this.
> One patch can introduce device property support.
> Another one removes the old platform data interface.
>
> So, at bare minimum there will be two patches. (Besides the advice to hav=
e
> two more.)
>
> > original driver does not relay on OF, it relays on platform data.
>
> And?..
>
> > Ripping out platform data will leave behind a broken useless driver.
>
> Hmm... This cna be the case if and only if we have the user in kernel.
> Is this the case?
>
> > So it has to be done simultaneously.
>
> Nope.
>
> > MFD part is removed since MFD cells binding is unconditional, while
> > the device supports any amount of children grater then one. For
> > example, my  device uses only backlight at bank A, while all other
> > subdevices are not present and used. This patch switches to dynamic
> > bind of children.
>
> MFD does the same. Please, take your time and get familiar with how MFD w=
orks.
>

It does not. I have tried. If mfd cell binding is missing, driver will
complain and fail.

> ...
>
> > > > +     device_property_read_string(&pdev->dev, "linux,default-trigge=
r",
> > > > +                                 &led->cdev.default_trigger);
> > >
> > > One prerequisite patch you probably want is an introduction of
> > >
> > >         struct device *dev =3D &pdev->dev;
> > >
> > > in the respective ->probe() implementations. This, in particular, mak=
es the
> > > above lines shorter and fit one line.
> >
> > This is not a scope of this patchset. Original driver uses &pdev->dev
>
> Indirectly it is. The change you are proposing tries to continue using th=
is
> construction with making needlessly longer.
>
> ...
>
> > > > +             if (!strcmp(comatible, "ti,lm3533-als"))
> > > > +                     lm3533->have_als =3D 1;
> > >
> > > If you end up having this, it's not the best what we can do. OF ID ta=
bles have
> > > a driver_data field exactly for the cases like this.
> >
> > This is required by core driver to handle some attributes and is here
> > solely not to touch those in this patch.
>
> What does this mean?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Let this driver rot for now, I might return to it. At some point
