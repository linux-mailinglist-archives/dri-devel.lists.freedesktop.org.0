Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D07FCB65
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F320310E366;
	Wed, 29 Nov 2023 00:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C72810E365
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:34:44 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a0064353af8so72806766b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701218082; x=1701822882;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fERB6GkxflX3B/1T+DzFfKG9k8hor8I1mk2bX5bhiMU=;
 b=fltgrbIXKc4GkrRKKixVnLFlUoG++bwbFe2Gg8mB9JjyY/ReJHLuWG8hlRs71DK3sS
 AFXOiTl0RAMuSHKgHdmljlD6WZdSO4q1qlJrR7r3b3SOEL8zZxbnZWheqbzSh9ZWq6HW
 Nlc/AmoKMleS+FC3oxEHHb4FMpWkXGeymgtug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701218082; x=1701822882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fERB6GkxflX3B/1T+DzFfKG9k8hor8I1mk2bX5bhiMU=;
 b=QbDw6mLrinLXm93cfWe4Dw1JIs+Fpz0W1EtUTXZgpvbB2NuOMvZC03n/nWthWlnIHC
 v+ghbqoW86kFVLoKavZxfU0SWAHvBnl1lheT4Zie//Z2lq/+WxHkQr7Adcjq5Mv2yQDw
 CyvFbcR2WGJbHSccYAUKqEOdUniyvGYeM58Wpe9a7CfAsBxo6+jAp7WQdf6Kbgv0GDnB
 kaosv3QZTcAgUN6h8OS+FMB2q46N/ApJU0Ox9wYd8E8YG2ZCi9vsnRwdCGJKA7bsugIf
 rcXXxJf4dfVntAQpGqH3O70InwHEn7xNSj+XI1r09Vh8wciTxm/gADyNwT/xpDovzjZC
 fK8g==
X-Gm-Message-State: AOJu0YzUFh0NjUc7gjCn6YTiptpq1CRUphSO2OvFYhtRcaKUrGGD5ZdU
 8mXkU9JuXe3kMyggFm1B93uSEXCnWySAatzdu1HovxYK
X-Google-Smtp-Source: AGHT+IE8fu8v7R+fPPF6O7K5Lyr5H7uIaXc1oDPAHz0kkg3xC0F/TMZqkpVBMOHDqkJLJqDrr20sPg==
X-Received: by 2002:a17:906:100e:b0:a0e:7e2:1b1e with SMTP id
 14-20020a170906100e00b00a0e07e21b1emr8922143ejm.23.1701218082353; 
 Tue, 28 Nov 2023 16:34:42 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 z2-20020a170906434200b009ad7fc17b2asm7273078ejm.224.2023.11.28.16.34.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 16:34:42 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40b35199f94so32875e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:34:42 -0800 (PST)
X-Received: by 2002:a05:600c:45cc:b0:40b:3d89:ba70 with SMTP id
 s12-20020a05600c45cc00b0040b3d89ba70mr544380wmo.7.1701218082055; Tue, 28 Nov
 2023 16:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231123175425.496956-3-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Nov 2023 16:34:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ug+th=1T2aZAhMW7TQJ=pq8uU+pWSQd5k+usZ0864P_w@mail.gmail.com>
Message-ID: <CAD=FV=Ug+th=1T2aZAhMW7TQJ=pq8uU+pWSQd5k+usZ0864P_w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Change parameters of
 ti_sn65dsi86_{read, write}_u16
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Bjorn Andersson <andersson@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 23, 2023 at 9:54=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> This aligns the function's parameters to regmap_{read,write} and
> simplifies the next change that takes pwm driver data out of struct
> ti_sn65dsi86.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

I'm on the fence for this one. It almost feels like if this takes a
"regmap" as the first field then it should be part of the regmap API.
Adding a concept like this to the regmap API might be interesting if
there were more than one user, but that's a pretty big yak to shave.

I'd tend to agree with your statement in the cover letter that this
patch really makes more sense if we were to take patch #3, and (as per
my response there) I'm not convinced.

That being said, similar to patch #3 if everything else thinks this is
great then I won't stand in the way.

-Doug
