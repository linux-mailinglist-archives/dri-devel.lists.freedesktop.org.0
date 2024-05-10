Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D48C2C0C
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA3410E22C;
	Fri, 10 May 2024 21:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SPflKmMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA3310E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:46:19 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3c999556297so602559b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715377579; x=1715982379;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+1JGsreSo427bW6QsqRdAD0+mF6sAJc/uXEOuM+7wQ=;
 b=SPflKmMTJJDzSRC6UCL364pn7imyAIuZPQbwfU7vuyg/bhD23Y7o9tRxZKrXPQthYO
 ZUL/z702Q2XX7fB+giOum3m3Ql/zIRYPcTo5vXS6vyZT9J69eXv+aehkEa0z5vDZtrU2
 ogrh9VD4ovgZCrACt1oz1n5/k6fyDYyAV0LHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715377579; x=1715982379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T+1JGsreSo427bW6QsqRdAD0+mF6sAJc/uXEOuM+7wQ=;
 b=fk7L0G8u4Oz7JrMA+FkEATbvG8UJ5wAOugkfZIvy/ekaWSyrbB3s3JGqvR4OikYOOE
 QsMG6hCxC6truZG6GmnLEqu+kJQ6n8CWjW/piruwy1/wDgw7anOQxVoJjSTysDV5YAs5
 wvNvBwcLtc5stegRlH/xVu+Eys6UwtzUSleDHhJwNXCHz68W3M7keITKuDtOegS68hBQ
 yCEjKBQoU4gQgR6z3e/TnkmAzLZ9+K5HtojG1J+hNGTLAxtrhV0S6KTXG3UaNStwWExU
 NtU8SBaNCwuasoIjueoLDPoKvjzTbgAOIVeQG1hBQIZxPHq3qQyvpxbxME9gnZki5XZn
 tyqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfHmS+uwdJOmnaVATI3I0eP71xBl1uhE7u/8+E2NIUjZHrVZ2iTz5odsozbKtU7iFvg868s/cAac15YJWOPg0AFzHrSHkiOqiDRW8+ZHmE
X-Gm-Message-State: AOJu0Yy1HAEemjzkKPqgOzAoMFkoSigf0weGRM+p+UkU3ZfHqT39qz/o
 +KTOcCHMnPT3y/T81ohcJ7vz+w2PbPX3GlaG4C73pzX3Av/DjiPPu8Vj46/cZ+gB2SuX7b8FZhw
 =
X-Google-Smtp-Source: AGHT+IH4Gc2xTLs5IyiickVB79ACHZDVBvn67aAeL3RH0AIRX1VijGgImF1YJAVtMDO587WIR28W8g==
X-Received: by 2002:a05:6808:11:b0:3c5:f4fc:2f0 with SMTP id
 5614622812f47-3c9970d1994mr3920706b6e.53.1715377578881; 
 Fri, 10 May 2024 14:46:18 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1cd245sm20711196d6.77.2024.05.10.14.46.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 14:46:18 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-43dfa9a98d2so18111cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:46:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOheMlBhbdl1roT8kJkaShX+rb5NFGR+ZlwjwGtwJNbl1l432VBAlb/rnIlE3w2eyfABc7IqOmKIPKdZyxk9UeJ1J5xS2yZTmxLv8e895Z
X-Received: by 2002:a05:622a:1b1e:b0:43d:eeb1:fd4e with SMTP id
 d75a77b69052e-43e092249fdmr857681cf.0.1715377578083; Fri, 10 May 2024
 14:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-2-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-2-317c78a0dcc8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 14:46:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XkZqAu5RnQmE-2z3NoSgK1LJJCK9Jdkus2f2nSREFZ5A@mail.gmail.com>
Message-ID: <CAD=FV=XkZqAu5RnQmE-2z3NoSgK1LJJCK9Jdkus2f2nSREFZ5A@mail.gmail.com>
Subject: Re: [PATCH RFC 2/7] drm/panel: boe-tv101wum-nl6: use wrapped MIPI DCS
 functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 cong yang <yangcong5@huaqin.corp-partner.google.com>
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

On Thu, May 9, 2024 at 3:37=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Remove conditional code and always use mipi_dsi_dcs_*multi() wrappers to
> simplify driver's init/exit code.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 73 ++++++++------------=
------
>  1 file changed, 21 insertions(+), 52 deletions(-)

Please CC Cong Yang (CCed here) on your next version since he's also
touching this file and your changes will conflict with his.


> @@ -1508,20 +1483,14 @@ static inline struct boe_panel *to_boe_panel(stru=
ct drm_panel *panel)
>
>  static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
>  {
> -       struct mipi_dsi_device *dsi =3D boe->dsi;
> -       int ret;
> -
> -       dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D boe->dsi };
>
> -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> -       if (ret < 0)
> -               return ret;
> +       boe->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> -       ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> -       if (ret < 0)
> -               return ret;
> +       mipi_dsi_dcs_set_display_off_multi(&ctx);
> +       mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
>
> -       return 0;
> +       return ctx.accum_err;
>  }

nit: since the "multi" functions print errors for you, you can get rid
of the (now duplicate) error print in the caller. I guess if you
really wanted to you could actually just inline
boe_panel_enter_sleep_mode() into its one caller and that would make
it easy to use the "_multi" version of msleep() there...

In any case, I think this looks nice:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
