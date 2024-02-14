Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81E85545C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 21:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833CD10E128;
	Wed, 14 Feb 2024 20:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Dd0ywmso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E5E10E128
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 20:51:41 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5638447af43so243413a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 12:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707943900; x=1708548700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eyCSWtxgPuL2OfFY3ZzcZyBxJluRQFv9i6WqBwPxYWU=;
 b=Dd0ywmsok2qxNkGAHiSHhf17BKDELteK9x9pdw93vnT/kNjq2F6Vmv4ouCdLcbUI0T
 GrM7/liQPEH+/XHIqU5Wu+oml6YJGjwbKvyMutUYMv3KsLzVW1CxaZyyZNnJE2nV0yHz
 H1g0xJb21aO24qRSC+2Q6Yeq3rkN9jvnUS45A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707943900; x=1708548700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eyCSWtxgPuL2OfFY3ZzcZyBxJluRQFv9i6WqBwPxYWU=;
 b=iF4xplF3qAlLCyjwe3YPqsKRv/AJm+kRS8i8xM3NpffWbJ4aO90gENYjXV6rUNiLXR
 pMSkswhvGXzdzxMPyeOXpkEozQ+NDK1nLXimJsWJtb1rrKgb2+REvHm8fFx7VhWTGTA4
 pkRY83jh7Ky2wvqGxWj7B0JQ2SA2+4u7a+MlKXlMoyF7jIZ8QrmxEBv97M9AENJ/BBvb
 6vfi3m9ULt1E3wSInFLLzSXUWvFH7HfoDvrJqyt1nylY7UQKIcnyBWvHKsOMQFvaspa4
 QHFgt8WgMnahaQ2nGK4z4CuZffJCTc7mHH5zt7jy+gEsVAq0IhVkVJTTxRpdLsktaG8m
 aDhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnPmU+++SxYegeoy8ygM4G28oBIqCecOL6GTZgu8pG/7XLJdUqXCKWvFcJGjNWm3R9suLHaNT5t/7I4ElaN50rpppiUEEtyJ6ZFAVVh/OY
X-Gm-Message-State: AOJu0YzCteYzUFn0VDnJ68kXUq0Z607k6MYnXXIl8vn9Gn8fTmK9pGOs
 PS1KyT0Ag6WzAg2PxiLplmHFlsul48C3M4ntAvThMw9XRu1gG04KxEzoatgCGwO0O6+M4eWEMK1
 hpRp8
X-Google-Smtp-Source: AGHT+IFrqf/PDRT+3/CscjSCOWyV6WHnM5lf76oaANcHFa/FX1syDvGIRkg/8rGh5Wnhfd+SWTrRHw==
X-Received: by 2002:a05:6402:1c92:b0:562:6185:af13 with SMTP id
 cy18-20020a0564021c9200b005626185af13mr2113024edb.6.1707943899954; 
 Wed, 14 Feb 2024 12:51:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/58W2cQ3VIMBM07/n0qdYgo1q7ScDJ9Vsg5gJd8S+Y5vLPgoJh09WAe7h1LUQuK1/sM0iZsoBv1KCYKslbo2hYqsgI4dm3rE8z1RoX+tF
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 a22-20020aa7d756000000b0056140d51b7asm4984740eds.83.2024.02.14.12.51.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 12:51:39 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-410c9f17c9eso1845e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 12:51:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ086IwbWMRZwMtXsUepW+nOww+CSNRLOjt91qEQuOnGRWcNbTKWMK0PhUTEMreKAZUE5tdVzixQGCL1Yy7UMjnyPA49NGDDB+BfYC8O8e
X-Received: by 2002:a05:600c:1d84:b0:411:d4df:761 with SMTP id
 p4-20020a05600c1d8400b00411d4df0761mr329588wms.0.1707943479685; Wed, 14 Feb
 2024 12:44:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <10a8d55110fc48a4759e65cc19556858587e94cc.1707900770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <10a8d55110fc48a4759e65cc19556858587e94cc.1707900770.git.u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 Feb 2024 12:44:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WkJOd6P4f=j0BHfm+ZeHnCtMBXALDWVeypdcirSTQp1A@mail.gmail.com>
Message-ID: <CAD=FV=WkJOd6P4f=j0BHfm+ZeHnCtMBXALDWVeypdcirSTQp1A@mail.gmail.com>
Subject: Re: [PATCH v6 152/164] drm/bridge: ti-sn65dsi86: Make use of
 pwmchip_parent() accessor
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de
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

On Wed, Feb 14, 2024 at 1:34=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> struct pwm_chip::dev is about to change. To not have to touch this
> driver in the same commit as struct pwm_chip::dev, use the accessor
> function provided for exactly this purpose.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

I don't see any differences from v5, so not sure why you didn't carry
forward my Ack [1] on this one. Maybe because of the questions I
asked? Your answers from v5 seemed fine to me. In any case:

Acked-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DVqPCbfTP86Wewf+-o9_v5oLsQUu1Dqb5EM=
LZZEsqGmRw@mail.gmail.com
