Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8180D193
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 17:26:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F1410E477;
	Mon, 11 Dec 2023 16:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E07B10E477
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 16:25:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54dcfca54e0so5954514a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702311956; x=1702916756;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aF489iTdqADqNEpAdlRL9qOQLYSMKm/pRE0lxsVR480=;
 b=EEOWuT1R/pwg/dt1sOa3BWQWAQcqXTOLcFVIeiAegHlR8uAyyewuxY8iyqrLB6Ch0/
 FeWQegt7v75TnKFDPBie75uWGJQYq5YxcwpcDwG20/PuzE0PTYCxefoTkk5zf4Yegsq1
 OaVFCWjq7izQZ+18NhoSrFK///fWND56HxNdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702311956; x=1702916756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aF489iTdqADqNEpAdlRL9qOQLYSMKm/pRE0lxsVR480=;
 b=wQeNg7ucR7s4V2D4H2WEBq3nP9pvSoAUr/j2SFH3q0hjovC80az5vpi6HX0QUfzzPn
 zgmC+7OiE4WZGLvGOprR0/PI5Ow/oa5ASHk7vhXv9q2xpYxDTgnZPeSC8kTA7WOwtJuO
 P5iStmKoZWiurSrVtNocvmKpksVeP8KYPqpMjPa5cepD3AHznKJZAxlMUmD+4wtBOgHw
 VIdHXPAE+MtDFx306YX39EBeQmMM9pEgywhDcv8MecKxbyevHt6z/mji9ZC/G63ZHGeo
 sHE8Wt68vWT8K5np1ZQ0PXyusuzhcN89t9ybuXZrAcoRZjzqD31wvvJIMzOeUfVBTYmm
 FTFQ==
X-Gm-Message-State: AOJu0YyoXMKwW3QHjUQFXd+F+263MmiHTFG43KJYQIp3u9Vzfchqb/jl
 Zb6yLBlP9TybfYzm/rxTNDgGsj5buKL+vM8KWF3Oo5Yq
X-Google-Smtp-Source: AGHT+IFuTUVL4U+3aV7V37pK+snoRwRxWsuv5lZ91IWFiK/k2pA0PomT8dojUCzhi+D9mI+XebdyKQ==
X-Received: by 2002:a50:a455:0:b0:54b:b32a:bc35 with SMTP id
 v21-20020a50a455000000b0054bb32abc35mr3111933edb.35.1702311955936; 
 Mon, 11 Dec 2023 08:25:55 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 s11-20020a508dcb000000b0054d360bdfd6sm3802322edh.73.2023.12.11.08.25.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 08:25:54 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40c32bea30dso110405e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:25:54 -0800 (PST)
X-Received: by 2002:a05:600c:b92:b0:40c:2399:d861 with SMTP id
 fl18-20020a05600c0b9200b0040c2399d861mr228954wmb.6.1702311954187; Mon, 11 Dec
 2023 08:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20231209153108.1988551-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231209153108.1988551-2-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Dec 2023 08:25:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UJ=TNuzy3Xcex_np1+tGaojV5z_Hpf_6ZT1nSoiXc4tw@mail.gmail.com>
Message-ID: <CAD=FV=UJ=TNuzy3Xcex_np1+tGaojV5z_Hpf_6ZT1nSoiXc4tw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Associate PWM device to
 auxiliary device
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Nikita Travkin <nikita@trvn.ru>,
 kernel@pengutronix.de, Steev Klimaszewski <steev@kali.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Dec 9, 2023 at 7:31=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> It's the ti_sn65dsi86.pwm auxiliary driver that creates the pwmchip, so
> let the auxiliary device be the parent of the pwm device.
>
> Note that getting a reference to the ti-sn65dsi86's pwm using pwm_get()
> isn't affected by this change as ti_sn65dsi86_add_aux_device() sets the
> auxiliary device's of_node to that of the main device.
>
> Also change PM runtime tracking and diagnostic messages to use that one.
> After enabling runtime PM operation for the auxiliary device, all works
> as expected as parent devices are handled just fine.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since v2
> (https://lore.kernel.org/dri-devel/20231209152520.1987483-2-u.kleine-koen=
ig@pengutronix.de):
>
>  - Make use of devm_pm_runtime_enable as suggested by Douglas Anderson
>    in reply to v1 already. (Sorry, missed that while preparing v2 :-\)
>
> Changes since (implicit) v1
> (https://lore.kernel.org/dri-devel/20231127101547.734061-2-u.kleine-koeni=
g@pengutronix.de):
>
>  - Add a call to pm_runtime_enable() for the aux device
>    (tested and diagnosed by Nikita Travkin).
>  - Rebased to yesterday's next, which required some (easy) conflict
>    resolution for commit c9d99c73940e ("drm/bridge: ti-sn65dsi86:
>    Simplify using pm_runtime_resume_and_get()").
>
> Best regards
> Uwe
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll also note that, via IRC, Steev also confirmed that "on the c630
with the devm_pm.... display works too"

Pushed to drm-misc-next:

eb3f7cbee294 drm/bridge: ti-sn65dsi86: Associate PWM device to auxiliary de=
vice
