Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056427FCC0D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C7F10E5CC;
	Wed, 29 Nov 2023 00:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C899110E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:51:34 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9bd3ec4f6so3547391fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701219092; x=1701823892;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbBlrfGSO/xQoxTcCm/pGg3z+WqlMkl6csJrstxDGRU=;
 b=RiNaYRIkJLcWJ27MxC/fnX5/gh1a4F54j4YL1GHamikTu4g9VdC5y9mx31G5pXkcnh
 A11ox1chvCaWZScweHNiSQOuabCTKb81BdOWGRkn74QuAc4jxwZnY4YWRfRSMoEwt9NB
 1cAApd9XedwZ+Qdq7owEKyj3oPt5xaFz+6ocA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701219092; x=1701823892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cbBlrfGSO/xQoxTcCm/pGg3z+WqlMkl6csJrstxDGRU=;
 b=j4afYmn9OXH7Qny/9dxYKlzKIpuL+v+W6v6xzIB6uc6kQxSTbZOSIbRn455jFZmVzB
 uQy1jLqS1ktK0p0vl8EvX1HvglKccCeT7nn+kmJNN9iCLPRstvDjgp7oVGldnWjbUKqg
 q8R0/Tb8ThjJDFag0SMWXOdGSIOIrAyISHvQwL+ouJLMVNEN93nyqEGFh/v1amCoyLMd
 PhpcYmy7vQ7qYJBd5YlhqSvoWn36LgIhPJtq6Jxmpng/umHRO3pqMN84PYhCpMzmwf6k
 W9lTny5GvvYFPzTjZWpaO98HALq//FRQP/tAllK/xFUE4ovxAH0eWueMRo5IBacyo/5Y
 M2Xg==
X-Gm-Message-State: AOJu0YzHUqP1UwYNWbIF+YwWG6MDrXuw5xrfccw3HEixRgV3IOPuBGLu
 FurKBCzPd1yJOkUbod8v6uIpkO/b4lxYz0Hv1NoXepJr
X-Google-Smtp-Source: AGHT+IE54hIe7SByWV3VNf1Vaivtm17GMDltkotEdoUO8lpRk7ICOwjUrAg7UBg6RKXnP7tqqr3Zfw==
X-Received: by 2002:a2e:8813:0:b0:2c9:b7c1:a57 with SMTP id
 x19-20020a2e8813000000b002c9b7c10a57mr1881930ljh.13.1701219091731; 
 Tue, 28 Nov 2023 16:51:31 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 t11-20020a2e9d0b000000b002c99895d8c7sm1164107lji.5.2023.11.28.16.51.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 16:51:31 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-50ba8177c9fso832e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 16:51:31 -0800 (PST)
X-Received: by 2002:a05:6512:6ce:b0:4fe:ffbc:ac98 with SMTP id
 u14-20020a05651206ce00b004feffbcac98mr774517lff.4.1701219090872; Tue, 28 Nov
 2023 16:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Nov 2023 16:51:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VxtJH2y=n1tdGpz=nCqZtcHWn7hN0_Xw-bFs_rVBtLxg@mail.gmail.com>
Message-ID: <CAD=FV=VxtJH2y=n1tdGpz=nCqZtcHWn7hN0_Xw-bFs_rVBtLxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify using
 pm_runtime_resume_and_get()
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
> pm_runtime_resume_and_get() already drops the runtime PM usage counter
> in the error case. So a call to pm_runtime_put_sync() can be dropped.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Pushed this patch to drm-misc-next:

c9d99c73940e drm/bridge: ti-sn65dsi86: Simplify using
pm_runtime_resume_and_get()
