Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD5950D70
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 21:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A21910E3F3;
	Tue, 13 Aug 2024 19:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Kp1/J3YY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A31C10E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 19:57:38 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a7ac469e4c4so40621566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723579055; x=1724183855;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HY47OI6qgPGV0/QE09FI/k+0tj+UYHuJ+dL5B1JuDSE=;
 b=Kp1/J3YYhRwYfHcnteNEWNVszX0ZIAfl1ww3e+CPuMMK0EGH2Uc08SZYKeyufyjnIL
 Qs4KwI9jwUAvtmQtyrFU5WxOPxqRqoMRQjikuoIR+q/vvWhgs9PPSwUHK3lqlB3IHw/K
 jlVJAcIAPSSayndZaTBNN1TVU5GRLspNCNQGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723579055; x=1724183855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HY47OI6qgPGV0/QE09FI/k+0tj+UYHuJ+dL5B1JuDSE=;
 b=n/hcOQqDHvDWg8Lmj7rEO8GU4+vJXMV5B6OzIi+dsG/eaRdpWmn7heHLKG3z/mYRYw
 wjB3k8VxnE055IAOaQQKKPdKlznutePJHHA5ZEiWPBisiM1w1zPdWRzu1yoW+71zQdCI
 lAhMbHVtpt/J5rcl72fdTXpmDswaQivvffuBsz3wYW8sG8+32wmB8N5m6cwPLZqjx/5D
 THN0jXBS8CnmpxCIYY8gPPNtCaVuIZeJsQuTNu7aduWHXx7dKBw5GkW3xVSnJ7eFGD5i
 wWdIG2O4fDdjIK4AMgse6EghESK11M8E2BmeDYTLD8DweAemeRhWzzx6vNK8NNzulhCk
 HSUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1IKb/Sa/nxN+96iGBp4KzYO03q2b0YOM7zdv6/gCVK4jcZdi1XAzecaDt2kKY890qoV7AunQu110FMcYKDSDDrDP1oUQJkxC3nApwwio4
X-Gm-Message-State: AOJu0YygGv6/eOVxSqv+IjmMuslFM8scrGO0a1oI3by6PFhIfPVnz3JV
 6czXRe7VGe0g7G65iBq3PJ9DAxK3syE3QJdWMI/EWPxZeaU/Nf8ETU2BmOvso6NnqhcP8K4+3v1
 ddw==
X-Google-Smtp-Source: AGHT+IHJHjqhw5/8SGyzCuykaVCSLPmdgaov098G77xdKwLw3b3lAk4NaN1i1MqBIMdO15xYn7HHiw==
X-Received: by 2002:a17:907:7f8c:b0:a77:cdae:6a59 with SMTP id
 a640c23a62f3a-a80f0c1c0ecmr332181266b.21.1723579054883; 
 Tue, 13 Aug 2024 12:57:34 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3fa466asm94925666b.56.2024.08.13.12.57.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 12:57:33 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-368440b073bso154186f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 12:57:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdoyJHu2fq4NDYKGXRRVZ6NS8PTo/geAPytXfHtM/g8tnD/rK28rDH95i/bgs8soy0SM6nH0EsvJ+pmYJIY72+fnN+b9RDpXWz1RlbY4xl
X-Received: by 2002:a05:6000:1e98:b0:367:8f89:f7c9 with SMTP id
 ffacd0b85a97d-371775d5820mr524329f8f.33.1723579053293; Tue, 13 Aug 2024
 12:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-6-wahrenst@gmx.net>
 <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
In-Reply-To: <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Aug 2024 12:57:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
Message-ID: <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
Subject: Re: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM
 domain off
To: Stefan Wahren <wahrenst@gmx.net>
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Minas Harutyunyan <hminas@synopsys.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lukas Wunner <lukas@wunner.de>, 
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, 
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-list@raspberrypi.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Jiri Slaby <jirislaby@kernel.org>
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

Hi,

On Mon, Aug 12, 2024 at 4:48=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Hi Doug,
>
> Am 28.07.24 um 15:00 schrieb Stefan Wahren:
> > DO NOT MERGE
> >
> > According to the dt-bindings there are some platforms, which have a
> > dedicated USB power domain for DWC2 IP core supply. If the power domain
> > is switched off during system suspend then all USB register will lose
> > their settings.
> >
> > So use the power on/off notifier in order to save & restore the USB
> > registers during system suspend.
> sorry for bothering you with this DWC2 stuff, but it would great if you
> can gave some feedback about this patch.

Boy, it's been _ages_ since I looked at anything to do with dwc2, but
I still have some fondness in my heart for the crufty old driver :-P I
know I was involved with some of the patches to get
wakeup-from-suspend working on dwc2 host controllers in the past but,
if I remember correctly, I mostly shepherded / fixed patches from
Rockchip. Not sure I can spend the days trawling through the driver
and testing things with printk that really answering properly would
need, but let's see...


> I was working a lot to get
> suspend to idle working on Raspberry Pi. And this patch is the most
> complex part of the series.
>
> Would you agree with this approach or did i miss something?
>
> The problem is that the power domain driver acts independent from dwc2,
> so we cannot prevent the USB domain power down except declaring a USB
> device as wakeup source. So i decided to use the notifier approach. This
> has been successful tested on some older Raspberry Pi boards.

My genpd knowledge is probably not as good as it should be. Don't tell
anyone (aside from all the people and lists CCed here). ;-)

...so I guess you're relying on the fact that
dev_pm_genpd_add_notifier() will return an error if a power-domain
wasn't specified for dwc2 in the device tree, then you ignore that
error and your callback will never happen. You assume that the power
domain isn't specified then the dwc2 registers will be saved?

I guess one thing is that I'd wonder if that's really reliable. Maybe
some dwc2 controllers lose their registers over system suspend but
_don't_ specify a power domain? Maybe the USB controller just gets its
power yanked as part of system suspend. Maybe that's why the functions
for saving / restoring registers are already there? It looks like
there are ways for various platforms to specify that registers are
lost in some cases...

...but I guess you can't use the existing ways to say that registers
are lost because you're trying to be dynamic. You're saying that your
registers get saved _unless_ the power domain gets turned off, right?
...and the device core keeps power domains on for suspended devices if
they are wakeup sources, which makes sense.

So with that, your patch sounds like a plausible way to do it. I guess
one other way to do it would be some sort of "canary" approach. You
could _always_ save registers and then, at resume time, you could
detect if some "canary" register had reset to its power-on default. If
you see this then you can assume power was lost and re-init all the
registers. This could be pretty much any register that you know won't
be its power on default. In some ways a "canary" approach is uglier
but it also might be more reliable across more configurations?

I guess those would be my main thoughts on the topic. Is that roughly
the feedback you were looking for?

-Doug
