Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909C28C2C0E
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BAC10E25C;
	Fri, 10 May 2024 21:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="j9nJ/xMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D83510E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:46:37 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43df44ef2f9so13070141cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715377592; x=1715982392;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Svr4jT9bdrpFXgOEkVqTf+8fIAlHYmRmltVZYBHBIQc=;
 b=j9nJ/xMR1WJ1+cmL8I/NEv3RYHqUXAP9Xdv86KsL05qCYHqZqXS59CnRiLzrzaF+oO
 K4/HtmZRlSUL3ChRMNoDKKcq2Ix6e93QBltFmONw/VA7w7kjgL+/400ZFYQD0+IXzjJa
 aYobTb0KNgDYTP0N6rOFrDMFNMkat4EY6Ma3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715377592; x=1715982392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Svr4jT9bdrpFXgOEkVqTf+8fIAlHYmRmltVZYBHBIQc=;
 b=mnQ81pEtCMCYinm45YL8Lu0R5qdxD4AJH4n6NkHF//cICp3Bj57tycFpDxArDbxRON
 cVmqmVaEyLsNKAX9eoxacoXudHzyHfFuZBQNwljv98zBTxRaaEEYMN2wm96h1VzItoZS
 VNHGRxMtHrF1BE+i44KebbTlJBgpVBhotn/FZPA2Bq9eB0Z0hAbEeMF8ThXLqn6QzN5/
 HpDDiZwDKDZ2X7RBmnEPYuxOmzyHsGFs3qnJcHuSZZJxQqiEAUUYMhqLkC7991KDKNLA
 vKfXX+G8JGkTipjtNMixy3uUDVgjFPZnQbbq1lApsd0fZV1NbRTePNagSNq6zipaZFcu
 wF2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYPG2OYjppkh6Qhr9K+m0A6clgg/I/RSOkwqzJXziW1CjjbpRQn6Jm2q3b/3xbWezkfiHeNrYp3VWG5OhImJYXJLHA5au98Ek6e51gLvYu
X-Gm-Message-State: AOJu0Ywsy8OXGi6C3JRWqj5eRmhalHwERflIoTtLU3McMztO9RU2q8dd
 sAMGYeZhH7qag0W8JIcx8FVYd6Ou71nJ4l3NBqorOjWax/mjmwihPO9mGNcCugPbbm4ErEzX7gw
 =
X-Google-Smtp-Source: AGHT+IEkI63QG1rcXY8KGrglMXySh+WxIHvDWjV+grbsGmXdC1fcDUEoC9S4wmn17aOYPr+2+C4ndw==
X-Received: by 2002:a05:622a:1f19:b0:43a:3857:fbcc with SMTP id
 d75a77b69052e-43dfde98f4bmr48620161cf.68.1715377592064; 
 Fri, 10 May 2024 14:46:32 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e069a24basm6247701cf.67.2024.05.10.14.46.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 14:46:31 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-43df9ac3ebcso97311cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:46:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWJPpsfYHu4XqycQlkBCvOEUtKpPxWIRjnBZ/iAgd4nWRIeiI3g5xLrjc19JybGbYM/Bh3ux0NhmnV7lkUG/lFVGse3jz1tHcpdY8Ew1o9E
X-Received: by 2002:a05:622a:510e:b0:437:b572:6d with SMTP id
 d75a77b69052e-43e0a2240ccmr150251cf.21.1715377589421; Fri, 10 May 2024
 14:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-3-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-3-317c78a0dcc8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 14:46:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkCr62jBtvTmYASxEBT8oOv7yZq=XjDCtEsOxgyQwV4Q@mail.gmail.com>
Message-ID: <CAD=FV=UkCr62jBtvTmYASxEBT8oOv7yZq=XjDCtEsOxgyQwV4Q@mail.gmail.com>
Subject: Re: [PATCH RFC 3/7] drm/panel: ilitek-ili9882t: use wrapped MIPI DCS
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
 linux-kernel@vger.kernel.org
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
> @@ -424,20 +420,14 @@ static inline struct ili9882t *to_ili9882t(struct d=
rm_panel *panel)
>
>  static int ili9882t_enter_sleep_mode(struct ili9882t *ili)
>  {
> -       struct mipi_dsi_device *dsi =3D ili->dsi;
> -       int ret;
> -
> -       dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
> +       struct mipi_dsi_multi_context ctx =3D { .dsi =3D ili->dsi };
>
> -       ret =3D mipi_dsi_dcs_set_display_off(dsi);
> -       if (ret < 0)
> -               return ret;
> +       ili->dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
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

nit: Same comments I had on patch #2 (boe-tv101wum-nl6) about inlining
this to the caller. Here it's even better since the caller already has
a multi_context...

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
