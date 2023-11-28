Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C29BD7FAF42
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 01:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA9710E14C;
	Tue, 28 Nov 2023 00:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D790A10E14C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 00:47:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a04196fc957so707825766b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701132431; x=1701737231;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wo0vSPweV0gJ8MYIRlcQuXT/7Sqytc2uBehA7YwL1bs=;
 b=QDWnDQR0z6fFCeYHfqX6nLk0S+XLcy+N2uS61/2GnjIUPaElqe3C3MBN8S2wcIYUoc
 prtjBmN6cu/U3Qpf3nhf5VYh3uZZshDot/ITdLEl7tJBXE3//6Stx6sgWB0sJWda/Kpt
 fFGbIqWnMCQvXBaTEIhNbvsewhyzcIDKhqzDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701132431; x=1701737231;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wo0vSPweV0gJ8MYIRlcQuXT/7Sqytc2uBehA7YwL1bs=;
 b=lWJbCk10GP3esFV8PjxGnahEqxce5K6Q4yj7fZ8YXmpgM4ANHdNuKt7a8wV+SHFn/9
 1RBGQNFFCXqge2tdHIMkjS/AcPwDZTUsFzh1PW/nIUfyIQwTn5Mt4FdhPA5h/e2TWvV9
 DYJXEDjMoCbtD7tTkCC+5pcvg9DpVSXXCid+kYzejKMm34Xd+ctHeiNkBxP5G0mkgtKI
 wHVm1RspUjM5X7rAzWlbEw/g2ih9CYATLEIVzUXyDrXpfnX3XHQnUfgVz7L8KLMd2Bh2
 AZqdYu+AWsRfm2LzT9DAy6aVn6zKo6jZaJPxkCkG72PFJAT3YeCouxly2ANtyKL8MEyQ
 S1dA==
X-Gm-Message-State: AOJu0YxTbVf0bFQXuYfq7luETmRlAniwlW/1rQbevNzIDSoWUbCEeCMp
 Bd8VTZcfNLnqR5b4UQLPkcWPwoQL9Ui6yUGfJMqcJA==
X-Google-Smtp-Source: AGHT+IHf5iRupDZCiopx8xPCPBQ4ocs/25nqq5o1ivRh2jmq3rJ1JGRWfkpAHMRDKevWkSy3YGR3hA==
X-Received: by 2002:a17:906:b6c5:b0:a02:35d9:fbc3 with SMTP id
 ec5-20020a170906b6c500b00a0235d9fbc3mr8011737ejb.45.1701132431276; 
 Mon, 27 Nov 2023 16:47:11 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 me22-20020a170906aed600b009dd8473559dsm6193807ejb.110.2023.11.27.16.47.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 16:47:10 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40b367a0a12so3375e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:47:10 -0800 (PST)
X-Received: by 2002:a05:600c:4e0a:b0:40a:4c7d:f300 with SMTP id
 b10-20020a05600c4e0a00b0040a4c7df300mr745925wmq.6.1701132430281; Mon, 27 Nov
 2023 16:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20231127101547.734061-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231127101547.734061-2-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Nov 2023 16:46:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UPTLV1kRz76q9dUMwLOCQum3mjyJG4KPJgwFP5vM4ZGQ@mail.gmail.com>
Message-ID: <CAD=FV=UPTLV1kRz76q9dUMwLOCQum3mjyJG4KPJgwFP5vM4ZGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Associate PWM device to
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Bjorn Andersson <andersson@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 27, 2023 at 2:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
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
> As the PM runtime functions also handle parent devices this should work
> fine, too.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> this patch has an (easy to resolve) conflict with a patch I sent earlier
> "drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()"
> (https://lore.kernel.org/dri-devel/20231123175425.496956-2-u.kleine-koeni=
g@pengutronix.de).
> I was unsure if I should base this new patch on that older one.
>
> While I think the patch is fine, I'd have a better feeling about it if
> someone could give feedback that the PWM still works as intended with
> this change.
>
> Best regards
> Uwe
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

This looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

For now, I'll wait for Bjorn (or someone else who uses this PWM) to
give a Tested-by before applying.

-Doug
