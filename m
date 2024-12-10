Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7679EA477
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 02:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2267E10E5A9;
	Tue, 10 Dec 2024 01:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VqwUXvSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF2310E5A9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 01:45:24 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e3a58827e25so747064276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 17:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733795123; x=1734399923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDeSzNmG0r25Rn5nUf/295MidZQ+oiAWsebYRxIgxz4=;
 b=VqwUXvSZsB6ir317h7ErMjo6AOxUHPRhbsln2NuvqErSrO/CvUqD4znntIaO2c3kSq
 QRRLsAKh/o7ACQQUSnkB21LnkcEsIKwtLrsdXF0UpkBQwOAhWngqmW19T/hJaOrFIOOV
 QncDxBSTI37a7xRZaUbs4ig5tIo/g/zx5B3NKGUwYjn5Q7A+azGkhNUzPMmN721e/NPk
 ltgPuM8AB0/uu178KTOLAoLjcSRVBnYe/3gNoQhXZLxfYZ7s+ShQ+o/VZx5ZA4vAXgox
 TMBxa4+0PfZpg8WLcOrqmmYujeExpBTnOU8txXNcfckx91djNhi8hOCehIjSJeAkG+F4
 uv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733795123; x=1734399923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDeSzNmG0r25Rn5nUf/295MidZQ+oiAWsebYRxIgxz4=;
 b=VEaGbueGDsqePHxvlQcCbRCD0xuagFrtkqQq+mp0FkFQtfSDxg/2VkSjyUBQu/GehJ
 sanDTIVmQKSsXZadPhV9+N52YsA86jeuamhvx6BldMEhIbHo2Jbsh4zDk9+eOVllcoTv
 xTDwjsNFMVgUAERch0Rs3iOGLkxdOhyOqVk+S5gBpoXf5hlAAnb59Cj5NzJLQ4Rew+1U
 KuA2nLliI8c5jEqRzwcSVeFX44BsuYTEEht1PvRTwUgL8/EZDW2GR4r6bAPsVPLMlk0K
 Dgjum/i3HgEZLzfktetxSfx6PwGjhoyr44hYuDz46EdCkHddRw6CGzjs7xrrWDJMCzK4
 C+dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUd7fDWZShCoBHEE9l05lUq6BgYTaZl2KPTFRhY8zcX7UhW80HM4bMGXF4nIQckZlK4lnJqTGKUcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze0Qe35ruIdKsSvgFE97jKnFOMO5uzyg2VagnNrYInKfqikClT
 Rxg/ey9plYokXuqrknuDfWM4SVKdLTURqXGXJc8pgH80zLh1mxpM1Qydy3btWJZBYJuvkxtGUJ/
 PQj4H7YEzJp49OsZpqRR4MCCUwLPmOzlFeF2aIg==
X-Gm-Gg: ASbGncsGy9bL6l4oNsXT6lbrXfwXbiW6Os+GRp2Tc7G3IBScGhYJxVNARowYsfceUxU
 hBOMATF3av9OfUkPN0X6QwEP+sW44QFX4zN4Q
X-Google-Smtp-Source: AGHT+IH9FYdZyuYf6+rQs47uyzndT1wVwnYcReW2ltFVfptMntuMiqQM909xz0QThYmGJkZYxK5rC55WkYQfh3JUnOo=
X-Received: by 2002:a05:6902:150b:b0:e38:b2fb:f57d with SMTP id
 3f1490d57ef6-e3a0b12a8c7mr11436978276.28.1733795122949; Mon, 09 Dec 2024
 17:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org> <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
 <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
 <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
In-Reply-To: <33e2c5db.1300.193ae284b6d.Coremail.andyshrk@163.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 03:45:11 +0200
Message-ID: <CAA8EJprLA09NP0KAztc5eoAMkGcrom84jg_pcbNcwN0FAaSLrw@mail.gmail.com>
Subject: Re: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
To: Andy Yan <andyshrk@163.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Daniel Semkowicz <dse@thaumatec.com>, Diederik de Haas <didi.debian@cknow.org>,
 andy.yan@rock-chips.com, 
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
 conor+dt@kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, quentin.schulz@cherry.de, rfoss@kernel.org, 
 robh@kernel.org, tzimmermann@suse.de
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

On Tue, 10 Dec 2024 at 03:22, Andy Yan <andyshrk@163.com> wrote:
>
>
> Hi Dmitry,
>
> =E5=9C=A8 2024-12-10 09:01:38=EF=BC=8C"Dmitry Baryshkov" <dmitry.baryshko=
v@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> >>
> >>
> >> Hi,
> >>
> >> At 2024-12-10 07:12:26, "Heiko St=C3=BCbner" <heiko@sntech.de> wrote:
> >> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de Haas:
> >> >> Hi,
> >> >>
> >> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> >> > > This series adds a bridge and glue driver for the DSI2 controll=
er found
> >> >> > > in the rk3588 soc from Rockchip, that is based on a Synopsis IP=
 block.
> >> >> > >
> >> >> >
> >> >> > I did more tests with different LVDS displays. I tested following
> >> >> > configurations with DSI/LVDS bridge:
> >> >> > - 1024x600@60.01
> >> >> > - 1024x768@60.02
> >> >> > - 1280x800@60.07
> >> >> > - 1366x768@60.06
> >> >> >
> >> >> > All of them worked without issues, except 1366x768.
> >> >> > With this resolution, video is blurry, and offset incorrectly
> >> >> > to the left. There are also repeating errors on the console:
> >> >> >
> >> >> >   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY ir=
q err at vp3
> >> >> >
> >> >> > In correct operation with other resolutions, there is no error.
> >> >> > I am not sure if this is a problem in your series or rather in VO=
P2
> >> >> > driver.
> >> >
> >> >This really sounds like something is wrong on the vop side.
> >> >The interrupt is part of the vop, the divisable by 4 things likely to=
o.
> >>
> >> This is a hardware limitation on vop side:
> >> The horizontal resolution must be 4 pixel aligned.
> >
> >Then mode_valid() and atomic_check() must reject modes that don't fit.
>
> We round down to 4 pixel aligned in mode_fixup in our bsp kernel,

What is meant by the "bsp kernel" here? I don't see it being present
in the mainline kernel. So, if the mode is unsupported, it should be
rejected.

> because sometimes, some boards do indeed choose a screen that is not 4 pi=
xel aligned
> >
> >>
> >>
> >>
> >
> >--
> >With best wishes
> >Dmitry



--=20
With best wishes
Dmitry
