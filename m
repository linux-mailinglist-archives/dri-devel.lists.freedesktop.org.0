Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69288939344
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 19:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D3810E23E;
	Mon, 22 Jul 2024 17:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lHu4Ijo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B88E10E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 17:39:25 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52efc89dbedso1979833e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 10:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721669961; x=1722274761;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ku6pNJoPik/cEYLloIWSNS5pM+cd3LpY0Ys/ukb76Ww=;
 b=lHu4Ijo/H4Dvv02wtoIByzedvz6Wpmyx3VK0E/OyLCDP5icQh2fuWggKLOBzl2Ie8V
 WByP4aK4IyCeuCNbXqi0VKfslHyHI8HEkTK2F2j8g3abw1Ai+3Af2DabZFfDJwrNKlM3
 kNi7B0TSp47yyKFuowMJS/ApzTP/wnUEhVA3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721669961; x=1722274761;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ku6pNJoPik/cEYLloIWSNS5pM+cd3LpY0Ys/ukb76Ww=;
 b=P45xR3LBFiuYqk/WWlAFywBfyexdVlgST+gHhhTmE3GIK2CPNnfFYsguPHAgey4fyx
 sQe/xDDgDqbU0naBZGuqQF3NHlR/O+ayqD7HAPzI6jx+414HLG3JAOxxpM1WVEsrxBry
 ybH5fw1KcExj6OedZYKQmonm4d8qSbg3gbep7bLsAm15j7gLzaVZVtFl26LV4x1ifVKV
 Oh5a7HuhcYTHfYxGvnMcfSIX6/kWU9IhepWHvBjMtCd4sHycmxiQEVzP4uSvfewHNlk4
 oICoJz5T8CkoEOaVMGCMp/w8WysRbvgq9j8+nrWRpCvDn4pJO3kk/FbgEKJAkZLkYX5t
 zTSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWObqgb2xYUV4UkErpPdSIoBk4H88qzonIAdVBOLMSeGi+gamNnjDXeuej4QgsBVxOIB9eSyD08aycgD7rZk+7x3VHGsw1bvrVoE6pGiCMf
X-Gm-Message-State: AOJu0Yx7wn4M8DdT3tjNR63kWPeLKIb/ln7dxWEC0Fwc3CLW/FfmnjeY
 iqJB5W4ecVUo1H+CdRq3Di9T6y/UVl6Oj2p2oBu0+LH6pUBeDZUM55wSahUCc4nIlOINFn3uOQh
 7wBOe
X-Google-Smtp-Source: AGHT+IGe+C1PGgzJsRy14TCWoKZBxDcOw9lTHAe39IHRUY0y9xrL2RyoFfoYcFKEyCvGsWR0XVTMcA==
X-Received: by 2002:a05:6512:3990:b0:52c:e112:4b0c with SMTP id
 2adb3069b0e04-52fc403db38mr424417e87.9.1721669960820; 
 Mon, 22 Jul 2024 10:39:20 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8bebe5sm444196866b.119.2024.07.22.10.39.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 10:39:20 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5a18a5dbb23so1104a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 10:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXijKHYkvx745/G2MilMh8dQYrbWns5VfrZ9O/5nKRSFHhwIL5aVmFy2GhMbtIKQzLs+7gEBhBkjz39Gr1XmsTCW1yVpHxeM9opI9c9TkLX
X-Received: by 2002:a05:6402:2547:b0:57c:c5e2:2c37 with SMTP id
 4fb4d7f45d1cf-5a4a842853dmr284928a12.3.1721669958715; Mon, 22 Jul 2024
 10:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240722092428.24499-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240722092428.24499-3-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240722092428.24499-3-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 10:39:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VZ8SuBnPjSTLeCjPUnzFxgTkxUb+BC5+nKs9ECiy3zsw@mail.gmail.com>
Message-ID: <CAD=FV=VZ8SuBnPjSTLeCjPUnzFxgTkxUb+BC5+nKs9ECiy3zsw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: boe-th101mb31ig002 : using
 drm_connector_helper_get_modes_fixed()
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 hsinyi@google.com, awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Mon, Jul 22, 2024 at 2:24=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> @@ -313,29 +314,15 @@ static int boe_th101mb31ig002_get_modes(struct drm_=
panel *panel,
>                                                       struct boe_th101mb3=
1ig002,
>                                                       panel);
>         const struct drm_display_mode *desc_mode =3D ctx->desc->modes;
> -       struct drm_display_mode *mode;
> -
> -       mode =3D drm_mode_duplicate(connector->dev, desc_mode);
> -       if (!mode) {
> -               dev_err(panel->dev, "Failed to add mode %ux%u@%u\n",
> -                       desc_mode->hdisplay, desc_mode->vdisplay,
> -                       drm_mode_vrefresh(desc_mode));
> -               return -ENOMEM;
> -       }
> -
> -       drm_mode_set_name(mode);
>
>         connector->display_info.bpc =3D 8;
> -       connector->display_info.width_mm =3D mode->width_mm;
> -       connector->display_info.height_mm =3D mode->height_mm;
> -
>         /*
>          * TODO: Remove once all drm drivers call
>          * drm_connector_set_orientation_from_panel()
>          */
>         drm_connector_set_panel_orientation(connector, ctx->orientation);
>
> -       drm_mode_probed_add(connector, mode);
> +       drm_connector_helper_get_modes_fixed(connector, desc_mode);
>
>         return 1;

Don't always return 1. This should be:

return drm_connector_helper_get_modes_fixed(connector, desc_mode);

...so if it fails to add a mode then you'll return 0.

-Doug
