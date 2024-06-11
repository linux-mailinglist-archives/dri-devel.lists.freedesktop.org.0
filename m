Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F067904116
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 18:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68C210E69C;
	Tue, 11 Jun 2024 16:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NcSYwZpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2437010E6B5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 16:22:10 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6b07712207cso13705006d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718122928; x=1718727728;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQxvDf5UzR5oDkZoOHfjVzcIFa7H1tAgUbuPebpZYkA=;
 b=NcSYwZpH5v1yJ3NP0xC2NuTtEsXcbheANaTfgi13zLR0qFm5q1BbLtXRguRSkQZHKP
 6Y/Rg9w1bV8MSCVyRQfCeXb7HGaM0RdocsX1yO9mTHT1GWy/lKt1eJ3+GAUbKi985Q+S
 /0BWHG2WMzcKWUnx0UpRSVfmPyrPwp+dJI2/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718122928; x=1718727728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JQxvDf5UzR5oDkZoOHfjVzcIFa7H1tAgUbuPebpZYkA=;
 b=gCU2MBGC90mLNAh7V4G5cAYMrJzH8dNwSRxremzFb+JWu7Ynw2Za/SwrPWurE/+uOP
 ePW7zTdTXjrke8stbizveA8Bu76ZYwfA7bddErIvxKd3x40YipYFVOa5Uu8lu6V0yuh1
 F60X8dPgOU80tUgBdKyLVfoolJ3bTBQBL+BiCfzheIw7BqJzxlhwZeBt16ZNpKvAlLZc
 7se2KQIjuG+pw6YQjlEcg5Lh1zUw5TlBXxQVnqiLoeaIJ/qNSWJbOGeLoUXdRXBCECu1
 TUPskbUz4N4nvQ0kjoPcekSh7CzqMAYBsO93DU/9njMqA7RXLVOTf+qnBPxsemOpBv8O
 XqBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGfNU8A5xit2BUKos4Tu3iOu5BWNNj3Hl5rbAnlP7r5daFCHu/Ma4vDT+m7OS4umCtduy2RB4pD5V+IwRlMJKW6RNJX8UWGRIQwgMLXybK
X-Gm-Message-State: AOJu0Yz8carnI+Um8itgi/Lx0qb8XTDQUbNxamIVW7FFURaaEYLYk3DP
 v+tEC4+tYTGKAB8d9mmBoBYlR2SFROmzCUE55VcXM4bzS7eEwZhuufrBkjCk+lyr7p9B+86MdlQ
 =
X-Google-Smtp-Source: AGHT+IFs/tc7oEY1LQeHVfGHFgaXE1NLVL1SyIdFYCcOb5ndH3vDrGodKtZMKOaLXa8EkdnaA66d/A==
X-Received: by 2002:a05:6214:5503:b0:6b0:8eca:1664 with SMTP id
 6a1803df08f44-6b08eca17b0mr16123936d6.23.1718122927582; 
 Tue, 11 Jun 2024 09:22:07 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b04f7553c4sm58537346d6.74.2024.06.11.09.22.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 09:22:06 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-4400cc0dad1so554841cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 09:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXymH503ZHGGTgTnL3uFAmydMShPGeSGYxiIkFMDPYDv9GkUKdZQ7JRX++mdiI7fb0iwBQroryof2Fz/axZrYsTaUmaQIsxVQ0ZI4M3GTo5
X-Received: by 2002:a05:622a:2b47:b0:441:5420:6d3b with SMTP id
 d75a77b69052e-44154206e67mr2028121cf.2.1718122925584; Tue, 11 Jun 2024
 09:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <1b7c19ec-536f-4f28-a68f-b03c1b51b99b@gmail.com>
In-Reply-To: <1b7c19ec-536f-4f28-a68f-b03c1b51b99b@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Jun 2024 09:21:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPQWUy4n75sPSxnzFi9RMTR2THmsL+VOd1PPG5paZN_w@mail.gmail.com>
Message-ID: <CAD=FV=VPQWUy4n75sPSxnzFi9RMTR2THmsL+VOd1PPG5paZN_w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel : himax-hx83102: fix incorrect argument to
 mipi_dsi_msleep
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Tue, Jun 11, 2024 at 7:05=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> mipi_dsi_msleep expects struct mipi_dsi_multi_context to be passed as a
> value and not as a reference.
>
> Fixes: a2ab7cb169da ("drm/panel: himax-hx83102: use wrapped MIPI DCS func=
tions")
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>

Should be no blank line between "Fixes" and "Signed-off-by"

> ---
>
> Changes in v2:
>     - Add Fixes tag
>
> v1: https://lore.kernel.org/all/d9f4546f-c2f9-456d-ba75-85cc195dd9b8@gmai=
l.com/
>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I notice you didn't CC me, even though I authored the broken commit.
Presumably get_maintainer should have suggested you CC me?


> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/dr=
m/panel/panel-himax-hx83102.c
> index 6009a3fe1b8f..ab00fd92cce0 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -479,7 +479,7 @@ static int hx83102_disable(struct drm_panel *panel)
>         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>         mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>
> -       mipi_dsi_msleep(&dsi_ctx, 150);
> +       mipi_dsi_msleep(dsi_ctx, 150);

So while your fix is correct, it's not really enough. I swore that I
compile tested my change and, sure enough, the bad code compile tests
fine. This is because the macro mipi_dsi_msleep() fell into a macro
trap. :( Specifically, we have:

#define mipi_dsi_msleep(ctx, delay)        \
        do {                               \
                if (!ctx.accum_err)        \
                        msleep(delay);     \
        } while (0)

Let's look at "if (!ctx.accum_err)". Before your patch, that translated to:

if (!&dsi_ctx.accum_err)

...adding extra parentheses for order of operations, that is:

 if (!&(dsi_ctx.accum_err))

...in other words it's testing whether the address of the "accum_err"
is NULL. That's not a syntax error, but _really_ not what was meant.

We really need to fix the macro trap by changing it like this:

-               if (!ctx.accum_err)     \
+               if (!(ctx).accum_err)   \

When you do that, though, you find that half the users of the macro
were using it wrong since every other "_multi_" function passes the
address. IMO while fixing the macro trap we should just change this to
pass the address and then fix up all the callers.

This is a serious enough problem (thanks for noticing it) that I'm
happy to send out patches, but also I'm fine if you want to tackle it.
If I don't see anything from you in a day or two I'll send out
patches.

Thanks!

-Doug
