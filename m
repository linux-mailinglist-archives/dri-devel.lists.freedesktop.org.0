Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A11FA33C24
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 11:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4365E10EA44;
	Thu, 13 Feb 2025 10:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mcwMON3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC92110EA44
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 10:10:27 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4395a917f33so9666355e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441426; x=1740046226;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=;
 b=mcwMON3Q5qaAhRCdJtT2rt2YB1KUjivJFZ+SBeUT2nkeHkedqIpIG1RPNBxxSUTeyG
 dVLImaB+fVzD7p+OtHyKCOfBrV1rkhny6bHeVNldQhHhiDBxUt1HwdUYfafpjrjD+j/1
 H/3lgCzZzR4ifyLtVP2LhmXH3KQw84+ruBFBO7Ve7plEjOmU5qb0cesTftJOKbyfZHe0
 4O+1rj6LqsU/1ZjUoyaawPtSbJbIsZoUVHQgN70z5rq398boKo/RQd1WqnxoztcgVjOd
 SAevf54QmS9gJjxs4rrjcu42vhypsnxXzBRVQo2ez2aXJSVK+g6P2iNJzOKEhuJl8v9X
 Au6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739441426; x=1740046226;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=;
 b=w7FcAQ1gfIAnj52DBBP+W1v992Ylf0ULoCJLYoN0gwQ8pzLGM/KEs6eurOO88Ll/cD
 x1YDCO9ToSCSN5p+MT6XZEWrgm0gRZlrfW+a/iw/uXu7vXq/2zkdw3y7FJdar2WPlW/o
 PVdjqyqitgBXQ0QFtRS+6uS6anFT2ds9TVMbAsSZHZ7YiOz0X2+XMbemVx0qlvPmPpa5
 Tf2sdVs3wQB47YozftArAy6/tKD18FS4Gu4zzBZ5cAuA+UVd3qWRtgBqsbh5jTY2NF7O
 rv233+xUOafxYg8nyfhU2+9n5LMJ5DBpozwiQa9LDEm1H8ZQtqkUPyrNcIcwmYP1mP37
 fc1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvioDO3dB58m11naSWdcCV32ElmIkVS5O4f8PMH6X86sPqX0ZNLwbM2jseyhczh8+i+jL2ZfdN60k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytTedE4f4M62Iadx/mhjk/UNH1JUk1oRWL+UnDsB7+EBsDhxa0
 0AD8X3UwQLH+WvdNC5UtofZ2JfFusd8mXYB0q4HojwxMV2dEuztPBziMXnjm+pA=
X-Gm-Gg: ASbGncuAOmBxeLAmcZLQmOaaDly5hyDPHvatorluW9n2QfBma4YqD/7UKRJTkj6cijy
 TyYKBXl5pTENee+9iOK1P4sVzYGy8hQ2/CqP+PvHPwAw5M92aICXXOKLbFt85mGGQqax3R9cZh9
 hpGpYcVi2G0thKn7voKJCF+xJ96CrTVFBpebarmDrjOsKyzCKh9N6Ag0+FVR8rVFY/tzvvD+EhO
 HINzDOVhyCKsSnOFXUMg22c9lI2fn306ulk47HMRJI5z9R1fIJTPGIeniaoUWzLZzx5KZ/grBmY
 gi32XBPifNKsMQ==
X-Google-Smtp-Source: AGHT+IFnAzzmsoX/LnTlYKfUwdNafAjQwt9ZvkB3qt0FKjzX4kx3PyzgxFabDyvJ+Y073z4cgUVqUg==
X-Received: by 2002:a5d:648b:0:b0:386:3327:4f21 with SMTP id
 ffacd0b85a97d-38f24f9cc70mr1962954f8f.27.1739441426065; 
 Thu, 13 Feb 2025 02:10:26 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5c36sm1435555f8f.67.2025.02.13.02.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 02:10:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary
 device creation helper
In-Reply-To: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
 (Doug Anderson's message of "Wed, 12 Feb 2025 08:38:25 -0800")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
 <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:10:24 +0100
Message-ID: <1jfrki17fz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wed 12 Feb 2025 at 08:38, Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.c=
om> wrote:
>>
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++-------------------=
-------
>>  1 file changed, 20 insertions(+), 64 deletions(-)
>
> Thanks for creating the helpers and getting rid of some boilerplate!
> This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
> Fix multiple instances") which is in drm-next, though. Please resolve.

Noted. this is based on v6.14-rc1 ATM

>
> Since nothing here is urgent, I would assume patch #1 would land and
> then we'd just wait until it made it to mainline before landing the
> other patches in their respective trees?

That would simplest way to handle it I think. No rush.
I'll rebase when the time comes.

>
>
>> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
>> -                                      struct auxiliary_device **aux_out,
>> -                                      const char *name)
>> -{
>> -       struct device *dev =3D pdata->dev;
>> -       struct auxiliary_device *aux;
>> -       int ret;
>> -
>> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
>> -       if (!aux)
>> -               return -ENOMEM;
>> -
>> -       aux->name =3D name;
>> -       aux->dev.parent =3D dev;
>> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
>> -       device_set_of_node_from_dev(&aux->dev, dev);
>> -       ret =3D auxiliary_device_init(aux);
>> -       if (ret) {
>> -               kfree(aux);
>> -               return ret;
>> -       }
>> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, a=
ux);
>> -       if (ret)
>> -               return ret;
>> -
>> -       ret =3D auxiliary_device_add(aux);
>> -       if (ret)
>> -               return ret;
>> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, a=
ux);
>> -       if (!ret)
>> -               *aux_out =3D aux;
>
> I notice that your new code has one fewer devm_add_action_or_reset()
> than the code here which you're replacing. That means it needs to call
> "uninit" explicitly in one extra place.

... but it needs one memory allocation less ;)

> It still seems clean enough,
> though, so I don't have any real objections to the way you're doing it
> there. ;-)

Both ways are valid indeed. Just a matter of personal taste I guess.

>
> -Doug

--=20
Jerome
