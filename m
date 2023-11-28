Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4597FAF6C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 02:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC24F10E013;
	Tue, 28 Nov 2023 01:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD79910E013
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 01:13:34 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b4744d603so11014925e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701134012; x=1701738812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECwFtT/v6DPqWTabYJIPEihmTvVx/l31UYeHlHgxFkI=;
 b=JmxK10SN4vqR7x1YQeDl/Efzs33LJl2EgLlIs+b7YucXs8hXXPJMDE/CxOuftEUSfz
 b0R2jGi8j5s05cTYP8dDDVv7/RCee8NK91lCKORtwe3qX/5fEjLgy2dEao5cX+k0QB31
 7Id6ecK1a7SLynweb9TUOcWKsSNYFqG6YMh2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701134012; x=1701738812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECwFtT/v6DPqWTabYJIPEihmTvVx/l31UYeHlHgxFkI=;
 b=vPlXVch3g28slgYkgHfb0X/cy2CGyAQ6oHVQwj00TydCWKiR3CiTgLwDcSwBpoRTxR
 HerNns0dJiroWgTNjQszuhOK6d6wLZ18ca+gw1Z0mX3V3WXRUPCePIVNDztIkpyejl4s
 xVVlxCxJbGLx5bdsZKoU97w672FryFwKX9xebHcu22Y9p/H0Zg4Yj3ltMHagj1B8SzQn
 KvfyeU6bnoafE08tcWVOZjMiB+htLUdShp1bmLdtgPKVCor0xjCzD4+iHXzvYVGxN3Pv
 O+EHZ1yOPxyiOIXoHd3qeTXKpBBuADmAPvWBj06lsCDgwdD0wvc5JuMRxfODXX/SRtrc
 kNOA==
X-Gm-Message-State: AOJu0YwhIa6epWj/pLBhYIXdwfDeN3KKzIb7z5alPpu1rL6IQP/mb4xT
 i3e9hP0Zk/84vyK/UkFZTX1IxD31hTaEWYoXbgRTSO+U
X-Google-Smtp-Source: AGHT+IEnrpS+uVyBKBY46jYZkhdAOBX0u2dHr+NVzcwSU5x3mROyPfiozlU7Jig/aNuWYtACF4X30g==
X-Received: by 2002:a05:6000:247:b0:332:eaa7:569a with SMTP id
 m7-20020a056000024700b00332eaa7569amr8738636wrz.28.1701134011957; 
 Mon, 27 Nov 2023 17:13:31 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 b19-20020a056402279300b0054b5d5248easm1961504ede.86.2023.11.27.17.13.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 17:13:31 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40b35199f94so15605e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 17:13:31 -0800 (PST)
X-Received: by 2002:a05:600c:45cc:b0:40b:3d89:ba70 with SMTP id
 s12-20020a05600c45cc00b0040b3d89ba70mr382683wmo.7.1701134011085; Mon, 27 Nov
 2023 17:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Nov 2023 17:13:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZcAaKvioVo0TeuarigNmCAD3BL6GksaSz4WawCE1AxQ@mail.gmail.com>
Message-ID: <CAD=FV=XZcAaKvioVo0TeuarigNmCAD3BL6GksaSz4WawCE1AxQ@mail.gmail.com>
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>
