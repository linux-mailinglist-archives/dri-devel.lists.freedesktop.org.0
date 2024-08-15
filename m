Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5D953AF2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 21:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7651E10E154;
	Thu, 15 Aug 2024 19:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jIKJN3uj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894A610E154
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 19:37:45 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7a337501630so88636285a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 12:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723750664; x=1724355464;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgHv8qIghW/XGbfA3/inME7zpGlhOrWspJ9Qn/7HUik=;
 b=jIKJN3ujfjQS82BT2ekTjYzUPDhhRm13QCwRN3KoarkqMPaH91qmbZ4UgsoLvwUzNp
 lCpLfo5qhwYff4ruUr4UbiZoeJPB8Cqco1QhA5TwFO9/MfQgdyt+RldB/V3V3eAnR9Qd
 I9izdOPdMWA/3zmkRPR2ThcfyVHjcGX1lwL+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723750664; x=1724355464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgHv8qIghW/XGbfA3/inME7zpGlhOrWspJ9Qn/7HUik=;
 b=j4CbE15QuAU6Wnq9s8VqYgRjLS/oXb3Ahm4zryaWmi0onSwWT+Lrt62YSST/93gl3x
 n6BChkPZyHmSIMBmMGVud+TxVuFAp2BA03Swr2oG5mEPIPVJARsfgwRGoD28cRECqPhx
 /yUaa9bMNxCWzS7myeju2KUvVlk5HZmiJxcQJgh+jPXDi9zhXShA+NJAE9o0DOTdwfvm
 VDEy/4vrV0if1pHkJFBbSntqKoIqmq/8sEFogmt9Vo6E5g3+6EEsddMqLobZ0Xk+azQN
 k+9cVZyBKaHuU2n9IE6bLPPDtmbmANcqicjKxyxTmp6B4fKaSUM0uS0XMMlIiPtw4MEa
 8Oiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzEz+JUT7S5jL5vBQL5YhPtJYGDU5lEiKdX5sfkn8FBgEvF3X9xvvzdUOhUw0PCDv9kSn1uKOn6XfbO1n5LCdjArdaPPRiy+PF690cqUpp
X-Gm-Message-State: AOJu0Yx6Cr3WsXRa5UheMBIaPmd0CSOaJpKHsBqgqT0uEBXvnp+YeYvC
 4qIWj6NWwWQeV6aXI9H58/rGsroACHKalwpMZ5Z89XbwNO8FdizL7mvr4lDBixR82AhNX8LRVJI
 =
X-Google-Smtp-Source: AGHT+IGi+hX4t8kAbkpOCK6YA/+iMhzgk1k5uAthS33rlGB2HLXumxZLm+RtWe8YoURfkHnZR/47CQ==
X-Received: by 2002:a05:620a:2448:b0:79f:1916:6b86 with SMTP id
 af79cd13be357-7a5068eabbcmr74208085a.10.1723750664063; 
 Thu, 15 Aug 2024 12:37:44 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com.
 [209.85.219.42]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff11d9b8sm91017185a.132.2024.08.15.12.37.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 12:37:43 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6bf6755323cso7338446d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 12:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVeNgpVF+C3PR2XrehWCbv6kIF1zQaX0pA9HulBeqCAQxJC5FZjLAqX349O12HdfkO1qbqwvLfdGBBe9uRW4UAGIQaa+Sr8/xBFR2CqJHvv
X-Received: by 2002:a05:6214:3186:b0:6bf:66e6:4754 with SMTP id
 6a1803df08f44-6bf7ce7c3efmr5290586d6.48.1723750663162; Thu, 15 Aug 2024
 12:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-6-wahrenst@gmx.net>
 <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
 <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
 <CAPDyKFpj0C1Bifmx=4zH3r8YooOrNfn_iDB+1sfRb0gTaKnT2Q@mail.gmail.com>
 <51b63ea5-808e-41e4-92a9-50e20afd155b@gmx.net>
In-Reply-To: <51b63ea5-808e-41e4-92a9-50e20afd155b@gmx.net>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 15 Aug 2024 12:37:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHnKJT4ubmV8EPRYi-qPFH21tNFzWEWMezY2PGEFEKrw@mail.gmail.com>
Message-ID: <CAD=FV=XHnKJT4ubmV8EPRYi-qPFH21tNFzWEWMezY2PGEFEKrw@mail.gmail.com>
Subject: Re: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM
 domain off
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Minas Harutyunyan <hminas@synopsys.com>,
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

On Wed, Aug 14, 2024 at 2:48=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> >> You're saying that your
> >> registers get saved _unless_ the power domain gets turned off, right?
> On BCM2835 there is no need to store the registers because there is no
> power management supported by USB core except of the power domain. So
> DWC2 don't expect a register loss.
> >> ...and the device core keeps power domains on for suspended devices if
> >> they are wakeup sources, which makes sense.
> >>
> >> So with that, your patch sounds like a plausible way to do it. I guess
> >> one other way to do it would be some sort of "canary" approach. You
> >> could _always_ save registers and then, at resume time, you could
> >> detect if some "canary" register had reset to its power-on default. If
> >> you see this then you can assume power was lost and re-init all the
> >> registers. This could be pretty much any register that you know won't
> >> be its power on default. In some ways a "canary" approach is uglier
> >> but it also might be more reliable across more configurations?
> I don't have enough knowledge about DWC2 and i also don't have the
> databook to figure out if there is a magic register which could be used
> for the canary approach. But all these different platforms, host vs
> gadget role, different low modes let me think the resulting solution
> would be also fragile and ugly.

I won't admit to having a DWC2 databook. ;-)

...but don't think it's too hard to find a good canary. What about
"GAHBCFG_GLBL_INTR_EN" ? From a quick glance it looks like the driver
seems to set that bit during driver startup and then it stays on until
driver shutdown. The databook that I definitely won't admit to having
almost certainly says that this register resets to 0 on all hardware
and it's applicable to both host and device. I think you could say
that if the register is 0 at resume time that registers must have been
lost and you can restore them.

I guess if that doesn't work then "GUSBCFG_TOUTCAL" could be used (I
think that resets to 0 but must be initted to non-0 by the driver).

Yet another register that could probably work as a canary would be
"GINTMSK". I believe that inits to all 0 (everything is masked) and
obviously to use the device we've got to unmask _some_ interrupts.

I can look for more, if need be.

-Doug
