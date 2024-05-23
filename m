Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B878CD73C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 17:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404C910E898;
	Thu, 23 May 2024 15:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="O5MRwQ+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F01910E898
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 15:37:02 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-43fa6d92b4eso7790241cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716478619; x=1717083419;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6Yi5QsLgSFqxP/hYDl5gHS5x3eV0VrrWPeAD34sRDM=;
 b=O5MRwQ+oBpVaeiNuou4L8Uxu2xszQ/xh/d0q4lPs3yvH2HjLiPmbBtJ9fouFp6kjcM
 F6meU6n/eZPx8sQp98nzkroQO3h6bqIejrChtdGbL/d24H3FN855nP/wZaEJK9ZPH5F6
 RuZWgQIrdNss1BfLV54FZ+pPK/iXYkFB4NTso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716478619; x=1717083419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6Yi5QsLgSFqxP/hYDl5gHS5x3eV0VrrWPeAD34sRDM=;
 b=kSVKgZtPs0Z9f3xWIs4Hx7KNZX+qXjj1/vpB2bZ1uGxE0eJeRWxd3+q2PsvffeH+ar
 IulVOV4DaPfq4+1UklZB3dTpY4pv/wyy+qyPZTDbSnkpJe6lwJjRsUIPEVqp4kCMNTws
 dCarfG5Kl3evoreO4WiVsmwJ/Wss8eS/Ik/99FvXUv1z3zXyGjskh5XBNLr2UxpSYIYV
 pFZkjgnr1XyPCiK2EP8GkyEaLhqfdXXp1i4OSvX++38vFnnRVLrcb/PcehjZFmPvC+uY
 gM58WsXTSPXjAfjX7QNhlLSfbZC9yIk81IbZ2w54rvmMx0ycfDXos8xS7TYKY77bUoE8
 e+kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ/bUcOuk5RYymd9MKLHqwmkdgMz1W43MC+V+aEEaOPEWCBgCC0cCIA7kZ97buFQBjMXIMXGA1HznBbh3DJt6dnZu7whW8V1NCkiDKZ2lo
X-Gm-Message-State: AOJu0YwXePwtop/gqgulgvl9+L3jBxXFQ9Z/fkgXsZbUK/Z0OQeSTtHx
 uC9hWav+M686qfgK8t23kXHhSw2mdi8p2xN7F3GM9vNwQrh9gEAHbqJ2tEi9fFRLveA+hFhuMkQ
 =
X-Google-Smtp-Source: AGHT+IHuLPd9jwGZwb/EuCeBjAUCdE/GeifMzyzTDUuYxv7iLd4xUhFKweQShzCq80a835+T5N3Cvw==
X-Received: by 2002:a05:622a:50e:b0:43a:b8e2:5870 with SMTP id
 d75a77b69052e-43fa743d7fbmr49552921cf.3.1716478619372; 
 Thu, 23 May 2024 08:36:59 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e4a20dc0bsm79755241cf.53.2024.05.23.08.36.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 08:36:59 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-43e14f0bd75so324091cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 08:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/swBtYz0SP6vCUOvm5i1dYs6s/rkliGex/uxKG+0FvHves3euBmAkUscTLMuKumWkpkrZvDqRIfc7D5tpI0SfMrRcxkOQlOFcVtQxrZKh
X-Received: by 2002:a05:622a:6092:b0:43f:7ae1:7d1 with SMTP id
 d75a77b69052e-43fa7437f48mr2924771cf.4.1716478617614; Thu, 23 May 2024
 08:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org>
In-Reply-To: <20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 May 2024 08:36:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xz1VsF8jG0q-Ldk+p=NY-ChJkTk0iW8fq2bO=oRFvXRA@mail.gmail.com>
Message-ID: <CAD=FV=Xz1VsF8jG0q-Ldk+p=NY-ChJkTk0iW8fq2bO=oRFvXRA@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/panel-edp: add fat warning against adding new
 panel compatibles
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

Hi,

On Wed, May 22, 2024 at 3:07=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add a fat warning against adding new panel compatibles to the panel-edp
> driver. All new users of the eDP panels are supposed to use the generic
> "edp-panel" compatible device on the AUX bus. The remaining compatibles
> are either used by the existing DT or were used previously and are
> retained for backwards compatibility.
>
> Suggested-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> The following compatibles were never used by the devices supported by
> the upstream kernel and are a subject to possible removal:
>
> - auo,b133han05

Ack. Looks like this was added by Bjorn but by the time the dts for
the board (from context, sc8180x-primus) using it made it upstream it
was using "edp-panel".


> - auo,b140han06

Ack. Same as above, but this time the board was "sc8180x-lenovo-flex-5g".


> - ivo,m133nwf4-r0

Ack. Also added by Bjorn but not easy to tell from context which board
it was from. "m133nwf4" never shows up in the history of arm64 qcom
dts files.


> - lg,lp097qx1-spa1

Maybe. Added by Yakir at Rockchip. I don't think this was ChromeOS
related so I don't have any inside knowledge. Presumably this is for
some other hardware they were using. Probably worth CCing Rockchip
mailing list. It's entirely possible that they have downstream dts
files using this and there's no requirement to upstream dts files that
I'm aware of.


> - lg,lp129qe

NAK. See "arch/arm/boot/dts/nvidia/tegra124-venice2.dts"


> - samsung,lsn122dl01-c01

Maybe. Also by Yakir at Rockchip and also doesn't appear to be
ChromeOS, so you should ask them.


> - samsung,ltn140at29-301

NAK. arch/arm/boot/dts/nvidia/tegra124-nyan-blaze.dts


> - sharp,ld-d5116z01b

Added by Jeffrey Hugo. Maybe Cc him to make sure it's OK to delete?


> - sharp,lq140m1jw46

Ack. Feel free to delete. This was used in the sc7280 reference board
(hoglin/zoglin) and by the time the dts made it upstream it was
already using generic edp-panel.


> - starry,kr122ea0sra

Ack. From my previous notes: "starry,kr122ea0sra - rk3399-gru-gru
(reference board, not upstream)". Nobody needs this.


> I'm considering dropping them, unless there is a good reason not to do
> so.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 6db277efcbb7..95b25ec67168 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1776,7 +1776,23 @@ static const struct of_device_id platform_of_match=
[] =3D {
>         {
>                 /* Must be first */
>                 .compatible =3D "edp-panel",
> -       }, {
> +       },
> +       /*
> +        * Do not add panels to the list below unless they cannot be hand=
led by
> +        * the generic edp-panel compatible.
> +        *
> +        * The only two valid reasons are:
> +        * - because of the panel issues (e.g. broken EDID or broken
> +        *   identification),
> +        * - because the platform which uses the panel didn't wire up the=
 AUX
> +        *   bus properly.

You mean that they physically didn't wire up the AUX bus? I don't
think that's actually possible. I don't believe you can use an eDP
panel without this working. Conceivably a reason to add here is if
there's some old platform that hasn't coded up support for AUX bus.
...but it would be much preferred to update the platform driver to
support it.

-Doug
