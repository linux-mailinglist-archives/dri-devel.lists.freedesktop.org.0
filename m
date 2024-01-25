Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4383CA4B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 18:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7CD10E758;
	Thu, 25 Jan 2024 17:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EB010E374
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 17:49:06 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51013a784easo2496421e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1706204882; x=1706809682;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=074q1EE9hpsgWGpB52nwOlz+bd5PI1pLVOMFeLU4aEQ=;
 b=JbwJzXE0+VUsQaCQGyQ1yk3r0A/skYs1jtKcNMi6JWmwOrex/pwxAl4/G/JBfLFpje
 yJ6AcFpDr+4vdjj6wMsvxc+sn8RiJVQn2SQJ6d8d0X+Sj/SiyFzvIcCmhXKDhiKbH9/A
 LvAy4khZHqP8Lt1RaKtdyEKj/LA/81yGLaqUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706204882; x=1706809682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=074q1EE9hpsgWGpB52nwOlz+bd5PI1pLVOMFeLU4aEQ=;
 b=Kgs2rL8yvwitq8VUqKxca5CXowIurCTvCT0zPjLrWoVJ6d1XQK2X1iiBcvJW4oTGEV
 GI0XNdY3/4PiQ58u3EtKubSOAtJgvpKM5s6cVSpswci+Iy5+rGihIpDEsLcSum5ZztYy
 01MwI3EBC7VVlEPN6UyPfGaHCVzgu12EwNubUxApA421zVfx2bKprnBh3Z8crol3JlOH
 gE3ChFXEoapIrmQ/NFkCkiWakqTdjp6QAUbFMJW+6oCaZTZUVh7HuryUT2lD8HD2jEQN
 /lklL0xRCF6JCiEWrS5jgV1ozE19nLnLD0T9vtUzYL15ugAaOnG46JmFIgZs5d4CdFVX
 Htiw==
X-Gm-Message-State: AOJu0YxkLu2YFzW53LFx4ATYfsi2KoCx1DK+EFMiHmdzIfjz46STTrJd
 rEXlQ1jRTWHPdpf8IsPL0uza9S1ciZMfm8JzH5GcTPZhV5GOZtglM0KivAkngJOLCnV5Mx5Pq4e
 Gig==
X-Google-Smtp-Source: AGHT+IGdzGoLHeRe5NDS9XjKUdAxemv0YigG/EjH4duN/r8EqXsdsd3gxOqlmCb5OzD/qQjP46/3PQ==
X-Received: by 2002:a19:ac46:0:b0:50f:1c9a:13f4 with SMTP id
 r6-20020a19ac46000000b0050f1c9a13f4mr41632lfc.52.1706204882338; 
 Thu, 25 Jan 2024 09:48:02 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 cu15-20020a170906ba8f00b00a318cb84525sm662426ejd.216.2024.01.25.09.48.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 09:48:00 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40e865bccb4so1035e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:48:00 -0800 (PST)
X-Received: by 2002:a05:600c:3b88:b0:40e:4990:d573 with SMTP id
 n8-20020a05600c3b8800b0040e4990d573mr203441wms.4.1706204879688; Thu, 25 Jan
 2024 09:47:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <5ff5120f2b4ef6442a1d7c05916a772ec59a8c34.1706182805.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <5ff5120f2b4ef6442a1d7c05916a772ec59a8c34.1706182805.git.u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Jan 2024 09:47:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VqPCbfTP86Wewf+-o9_v5oLsQUu1Dqb5EMLZZEsqGmRw@mail.gmail.com>
Message-ID: <CAD=FV=VqPCbfTP86Wewf+-o9_v5oLsQUu1Dqb5EMLZZEsqGmRw@mail.gmail.com>
Subject: Re: [PATCH v5 037/111] drm/bridge: ti-sn65dsi86: Make use of
 pwmchip_parent() macro
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 25, 2024 at 4:11=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> struct pwm_chip::dev is about to change. To not have to touch this
> driver in the same commit as struct pwm_chip::dev, use the macro
> provided for exactly this purpose.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

This seems OK with me. Unless someone more senior in the drm-misc
community contradicts me, feel free to take this through your tree.

Acked-by: Douglas Anderson <dianders@chromium.org>

NOTE: though the patch seems OK to me, I have one small concern. If I
understand correctly, your eventual goal is to add a separate "dev"
for the PWM chip without further changes to the ti-sn65dsi86 driver.
If that's true, you'll have to find some way to magically call
devm_pm_runtime_enable() on the new "dev" since the code you have here
is calling pm_runtime functions on what will eventually be this new
"dev". Maybe you'll do something like enabling runtime PM on it
automatically if its parent had runtime PM enabled?
