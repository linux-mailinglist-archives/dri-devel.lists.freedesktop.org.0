Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C91F8C2C0A
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D72810E1EB;
	Fri, 10 May 2024 21:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ygdfs0NC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0633710E1EB
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:46:03 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43df44ef3e3so10046021cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715377562; x=1715982362;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bvvrDFDvWHbWDsL+5kPsJMRg9ZQU9jFtg6oP+9eLyU=;
 b=Ygdfs0NCjmzTv0AdpVAiI3AtKw7I+orY8djAEz3B67WwtzuLGEjpukExvZsH6kL/ep
 TPz10PX6lB4HTxoU5LgyNmHPPoVGD47Wl65Nj7vru82BbGSu1jg+lK81VLYVuJjlPBWc
 EKStxnNL9Xwm9j2tA9wGfLg2BbFxF7oBnDg/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715377562; x=1715982362;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2bvvrDFDvWHbWDsL+5kPsJMRg9ZQU9jFtg6oP+9eLyU=;
 b=kulhBuqCTK0+hGR5Ws1s5eXtACdsdraua2xSTWVuaizJQ2hnGT/m/ycyQlXAKQNn9s
 Ufx+qoC7RyQyeYQJP1U3nX1cyhqTIp5s7h39tMGnrmjmhCcCTBzAgp+hO4GLKQ+vxaRd
 XUxgzpN3baLRUUDKF1ExaoHrcjwQDL5bWH51eQln8UHCWvnFsy+hKoXGkzT8PaqYat4X
 mTdIA5vv+5S1Z/cGd2uGkUnGGfC0WdwhIYnDVMyPhdfyuCqzC02KAcTLAEsHmsbfHsUS
 v4jpNQrF/ZQixwJhDSReaQfcE4om/ykXYz/x2mFMqNlIt9lWt+HM4uxFeGjLqhpZEqc5
 wdOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnL0wWi18aM8kEqRal05ijpe76XfkSR4W4SuuXfKs+4VInRHuR+0BIzIP4I78xeYxEav2dyoofSHiHXoU6LvxemZ3tFV/pVsQgMzcZuwVe
X-Gm-Message-State: AOJu0YwxnoEbjtfZM4d3URqvJTwXSYg+aMxISsXNHn+UIFL4FVtiyPjw
 gC5+6iJHDvS7amwM6asPAWYibJoXcQchRBPJl5RBTZjFjjZqW6BeBJ1d2f0a/TAfLybhTvpGTT4
 =
X-Google-Smtp-Source: AGHT+IESHSO1J6TFMDyRDMG+LHbHHxiLE0iiDQWqPANK5DxSEBCl5/vgwoEKp8z/pyGpazZMC93new==
X-Received: by 2002:ac8:5a8c:0:b0:439:f51a:2c1 with SMTP id
 d75a77b69052e-43dfda9664bmr44188081cf.1.1715377562400; 
 Fri, 10 May 2024 14:46:02 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54f216esm25666021cf.31.2024.05.10.14.46.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 14:46:02 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-439b1c72676so41621cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 14:46:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVuaNQzEJBo7oluivfDJbdD+I4NyTRO7BJBuYH+ZorVhtMnlMNLUi69vF9nb6Rd08cr39Lga7uvo0AP0VRaw3uFxrVvPxbGDRaRpJgtViui
X-Received: by 2002:a05:622a:5407:b0:43d:e9ce:63ad with SMTP id
 d75a77b69052e-43e09222ee6mr1021081cf.0.1715377561384; Fri, 10 May 2024
 14:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-1-317c78a0dcc8@linaro.org>
In-Reply-To: <20240510-dsi-panels-upd-api-v1-1-317c78a0dcc8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 14:45:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UuJF5Nv6qLzH8SK8NPfHa6Qwp4XOwkLUYt2Rv8ACjfeQ@mail.gmail.com>
Message-ID: <CAD=FV=UuJF5Nv6qLzH8SK8NPfHa6Qwp4XOwkLUYt2Rv8ACjfeQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/7] drm/mipi-dsi: wrap more functions for streamline
 handling
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
> +/**
> + * mipi_dsi_compression_mode_ext() - enable/disable DSC on the periphera=
l
> + * @ctx: Context for multiple DSI transactions
> + * @enable: Whether to enable or disable the DSC
> + * @algo: Selected compression algorithm
> + * @pps_selector: Select PPS from the table of pre-stored or uploaded PP=
S entries
> + *
> + * Like mipi_dsi_compression_mode_ext_multi() but deals with errors in a=
 way that
> + * makes it convenient to make several calls in a row.

Your comment is backward. The name of the function is
mipi_dsi_compression_mode_ext_multi() not
mipi_dsi_compression_mode_ext(). ...and it's like
mipi_dsi_compression_mode_ext() not like
mipi_dsi_compression_mode_ext_multi().


> @@ -338,6 +345,18 @@ int mipi_dsi_dcs_set_display_brightness_large(struct=
 mipi_dsi_device *dsi,
>  int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *ds=
i,
>                                              u16 *brightness);
>
> +void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx);
> +void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *=
ctx);
> +void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *c=
tx);
> +void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *c=
tx);
> +void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ct=
x);
> +void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
> +                                   enum mipi_dsi_dcs_tear_mode mode);
> +
> +#define mipi_dsi_msleep(ctx, delay)    \
> +       if (!ctx.accum_err)             \
> +               msleep(delay)           \

Please enclose the above in a "do { ... } while (0)" as typical for
macros. Otherwise you could possibly get some very surprising
behavior:

if (needs_big_delay)
  mipi_dsi_msleep(ctx, 50)
else
  mipi_dsi_msleep(ctx, 10)

...with your macro as it is I think the "else" will match up against
the "if !(ctx.accum_err)" inside the macro and not against the "if
(needs_big_delay)"

Also: nit that the mipi_dsi_msleep() should probably be defined above
the "mipi_dsi_dcs" section.


-Doug
