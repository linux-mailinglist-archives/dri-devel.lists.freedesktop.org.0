Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43D48D3892
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A7610E1C9;
	Wed, 29 May 2024 14:03:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ioooeFAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A24F10E1C9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:02:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A71EFCE1684
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F156C116B1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716991373;
 bh=ClKliciffLvAYOJd0zEs/omJQhLpuiCBv2RFdMFaVkg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ioooeFAHqJUVENw/TxzwW2AKwslsUnB5913QU+BV3I+cHtjiY4574Ez/5pKv2nlor
 h75rqS+IhFWufHIL/DbPKdvwh2XU+LAbvIY7lhEDeELB/bFpiKdGcpqiJC40gVY3S7
 U1SklR0qELVmyMoWpx/FTGrWloxKD35OUTxIYiejGk/4KkwxjSialuWmsnRgeGXtw3
 gjeDfSQimxVUyZ78Pn0FcKT5tWnhdZkHfrKGn/1V8xmMXIIIf8tDfmhoU+hmRHIuqr
 p6ULJwweJc7LrT3EbkYQaJjSPepzAIJip7BX2bF4UzWpLiJhMLwMu8XKvqP+DbUKDu
 SHdfThbgsaXyA==
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-627f3265898so22231977b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtJ82ktjwQKbF4j9/Du0mJxxDr6QAN5UJYaSgwFkib5AqmwxxR3KvKYRJRIUzJzlz2tz8JMLA8g2gmGIid6u+twy8wR38NOWdnzkaYnGng
X-Gm-Message-State: AOJu0YwdUpFBVolcuiqWapkhie+rRKR97f6/Ei4yNcO81yxkSpzE0j5c
 baNebiCx5KP/OrndMj3ktiiGTv/5tFujk7diVO2FD7QPMgU+Uf16dnZVq56JUdmiJYEDdEed+2E
 qmelc4jeMDuikqzBFWk0St6CPtgyh5pCcrZsv9Q==
X-Google-Smtp-Source: AGHT+IEQfAx4JIxkU4lwhsuOXXdkyjbqTK/TzbD39b2JjThMlG91WmwmEdm1flu1c5ds/ZRYMrcp6sgaL0vcye4/joQ=
X-Received: by 2002:a81:840c:0:b0:620:255a:a5c5 with SMTP id
 00721157ae682-62a08ea7e3fmr150098277b3.32.1716991372687; Wed, 29 May 2024
 07:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240516062455.106266-1-alexander.stein@ew.tq-group.com>
 <20240516062455.106266-3-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240516062455.106266-3-alexander.stein@ew.tq-group.com>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 29 May 2024 16:02:41 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6k3Fv5oQaWbDakaq6_=f-gmVY21OsQ5vxAdepUvU5VBQ@mail.gmail.com>
Message-ID: <CAN6tsi6k3Fv5oQaWbDakaq6_=f-gmVY21OsQ5vxAdepUvU5VBQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: tc358767: Only print GPIO debug output
 if they actually occur
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, May 16, 2024 at 8:25=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Currently the output the following output is printed upon each interrupt:
>  tc358767 1-000f: GPIO0:
> This spams the kernel log while debugging an IRQ storm from the bridge.
> Only print the debug output if the GPIO hotplug event actually happened.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index de62a7e2eafec..8874713bdd4a4 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2146,11 +2146,11 @@ static irqreturn_t tc_irq_handler(int irq, void *=
arg)
>                 bool h =3D val & INT_GPIO_H(tc->hpd_pin);
>                 bool lc =3D val & INT_GPIO_LC(tc->hpd_pin);
>
> -               dev_dbg(tc->dev, "GPIO%d: %s %s\n", tc->hpd_pin,
> -                       h ? "H" : "", lc ? "LC" : "");
> -
> -               if (h || lc)
> +               if (h || lc) {
> +                       dev_dbg(tc->dev, "GPIO%d: %s %s\n", tc->hpd_pin,
> +                               h ? "H" : "", lc ? "LC" : "");
>                         drm_kms_helper_hotplug_event(tc->bridge.dev);
> +               }
>         }
>
>         regmap_write(tc->regmap, INTSTS_G, val);
> --
> 2.34.1
>
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
