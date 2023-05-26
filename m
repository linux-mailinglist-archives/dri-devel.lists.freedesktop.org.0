Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5A37128D5
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 16:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF1B10E0F4;
	Fri, 26 May 2023 14:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0030910E0F4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 14:44:32 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-3f6ac005824so6213231cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685112271; x=1687704271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kmjb8xVhG45InllAO9viTIqjFppbVfXIordhnFBrUlg=;
 b=UkyP18mtHSUt82l7i5N7Y70cnkVF+Zji3Nnu7SauN0kW+mbGCrXTcxWuGFIeD7/jHr
 mxoxCvJFv2D4WXUO+60zwwRmhSRPD7Ticw1bSn4XsWAzpnU34kBrUb0qLFJCxGplJrKe
 /C4Nig8Vd1tTuZs2Vef8AqjOOr105CmQHmM20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685112271; x=1687704271;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kmjb8xVhG45InllAO9viTIqjFppbVfXIordhnFBrUlg=;
 b=k+KbFBg9YjD/uOCNHb5tU7b489vbYCKpFkdZjFqMxf8tHFRmTLrgu+2jNfdqlxEHvY
 qdyImfeMlP/vesQj9LwersvJSmKmDWwuLP54UF6EHzDY7s/AeVzjrjmcpVofx0/dumkQ
 iaBukpbLXsWdhIlIEKafuXCujojYVCf2Oa7yqW+qm1KCLIYMB13ehzT2zk6U2FsASloj
 wwJ6fuXHOSUbRS6pH65HPbKBlwMe7Ijk9hRnxswFADd5P4L5yVn44fCFfWBVurs/zi2L
 iqbEagVrtKjYXoLJ0mLeAxNaXKYzPk+jFkvXxoKI6VfnhmcDYPMFggDYIlKD2iSRdFvd
 ba5g==
X-Gm-Message-State: AC+VfDydRfbJNPCB6+jZ7XJGXvJxPnzQC8zBSwFimgpOeEM7GWfhAZmC
 ZiCBdc8A/51Y923ZanCjgX44C4fPYn30o3oOGWc=
X-Google-Smtp-Source: ACHHUZ6dGSK+nPqkoZl39g7k4UDGyZc3sxLPsCT/Sg8ftCyVAsZYvuvuPXSXk4NeT6YqVWp+f82ERg==
X-Received: by 2002:a05:6214:212e:b0:623:6fc8:f461 with SMTP id
 r14-20020a056214212e00b006236fc8f461mr2231701qvc.33.1685112271590; 
 Fri, 26 May 2023 07:44:31 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 qh8-20020a0562144c0800b00622cddd7edesm1245291qvb.129.2023.05.26.07.44.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 07:44:31 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-3f51ea3a062so166741cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:44:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:15c6:b0:335:e50d:9b11 with SMTP id
 q6-20020a056e0215c600b00335e50d9b11mr79802ilu.7.1685112250126; Fri, 26 May
 2023 07:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230526090709.1517297-1-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 May 2023 07:43:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-QLtGRGw5RfRyV06JOQNSd6sYuT7Y5=_VGn6xarWf9A@mail.gmail.com>
Message-ID: <CAD=FV=W-QLtGRGw5RfRyV06JOQNSd6sYuT7Y5=_VGn6xarWf9A@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Switch i2c drivers back to use .probe()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Crt Mori <cmo@melexis.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Sam Ravnborg <sam@ravnborg.org>,
 kernel@pengutronix.de, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Stefan Mavrodiev <stefan@olimex.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Liang He <windhl@126.com>,
 Phong LE <ple@baylibre.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 26, 2023 at 2:08=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() fro=
m
> struct i2c_driver.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> I didn't get feedback for (implicit) v1 that was sent with Message-Id:
> <20230427175954.666464-1-u.kleine-koenig@pengutronix.de>. This is a
> rebase on v6.4-rc1 as the former patch doesn't apply cleanly any more.
>
> I also added more people to Cc, maybe that helps to get feedback.
>
> This patch is based on v6.4-rc1, and applies fine on today's next.
> (There are also no new drivers that need adaption in next.)
>
> Thanks for considering,
> Uwe
>
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c             | 2 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c       | 2 +-
>  drivers/gpu/drm/bridge/analogix/anx7625.c                | 2 +-
>  drivers/gpu/drm/bridge/chipone-icn6211.c                 | 2 +-
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                 | 2 +-
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c                 | 2 +-
>  drivers/gpu/drm/bridge/ite-it6505.c                      | 2 +-
>  drivers/gpu/drm/bridge/ite-it66121.c                     | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                 | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c                  | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c               | 2 +-
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 ++--
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                     | 2 +-
>  drivers/gpu/drm/bridge/parade-ps8622.c                   | 2 +-
>  drivers/gpu/drm/bridge/parade-ps8640.c                   | 2 +-
>  drivers/gpu/drm/bridge/sii902x.c                         | 2 +-
>  drivers/gpu/drm/bridge/sii9234.c                         | 2 +-
>  drivers/gpu/drm/bridge/sil-sii8620.c                     | 2 +-
>  drivers/gpu/drm/bridge/tc358767.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358768.c                        | 2 +-
>  drivers/gpu/drm/bridge/tc358775.c                        | 2 +-
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                     | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c                    | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c                    | 2 +-
>  drivers/gpu/drm/bridge/ti-tfp410.c                       | 2 +-
>  drivers/gpu/drm/i2c/tda9950.c                            | 2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                        | 2 +-
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c       | 2 +-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c    | 2 +-
>  drivers/gpu/drm/solomon/ssd130x-i2c.c                    | 2 +-
>  32 files changed, 33 insertions(+), 33 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

This does apply to drm-misc-next and I'm happy to apply it there, but
I'm a bit iffy doing it on the Friday before a 3-day weekend (Monday
is a holiday in the US). If this is still pending next Tuesday and I'm
not swamped then, I'll plan to apply it. I'm more than happy if a
different drm commtter wants to apply it sooner. Thanks!

-Doug
