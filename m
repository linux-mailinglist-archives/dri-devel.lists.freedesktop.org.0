Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504287447D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 00:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979E510E1A2;
	Wed,  6 Mar 2024 23:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UDItBDlf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BE010E1A2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 23:38:51 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6e5c0be115aso245638b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709768330; x=1710373130;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9T8NOESVHEKZJ+Km+dtXiN45KTXenjEtsmbvdRzQv4=;
 b=UDItBDlfq30BDfMHxm4HJGRHB2CWPIV5/sA1BXf/oa9Gvga8XFYgZV19YBpy+3FoBn
 Qhkk9hAXygrVzURPqL6EzX7EIppoVIwyRSnVO2kgKk4bjCrE3E4KrQdGdqKl16l+o8NQ
 2dOQzq8405bxiUXBgKLOWR27anU1S7ZC0eF9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709768330; x=1710373130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9T8NOESVHEKZJ+Km+dtXiN45KTXenjEtsmbvdRzQv4=;
 b=FDiRgH8ti9fznYp2N1fHT13KG5TnwHiJkXa4+OwdKUF077tiwyHwTDyVIbHecka4ir
 gnfZR2HtprfnGqnctoLgYFaL2YWEpPUJ1+dOpxhUMOYg90R1En+ep46xn8tQbxbUClnF
 UuC1NnqZWxm823XN9wn9mnHN2SMTzNRdY11NnLqaW1mF47fQB+URP0AxKNHIYazGI+UG
 MLtSzNRDAWE2FNjmA6Gr872xyRYr89eLXvOGT4gQeib0Zm07P8nRvofQATX9L+Sm0B9z
 GVphg5GLqBBHQztRij2TYhStjWKSWpgCqJxjpJkdEs2zVPQOEqJVUaojatFBa876TFEE
 sc4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhPRUSopY4pbc1FfdSZFQXWeI9Duki0W1TNPDD8lgzXdO3HnqcRZFvNM+UF3v7dG6ZXn+puYkUF3k8MjcB+05cO6+mJ8HC8gyPLpx9Zux1
X-Gm-Message-State: AOJu0Yy6lJKtWdVWhAoWuKEB0f467TgaaBLP2koxM7eE5PSLtLhZnbSw
 sapVEpe61R6/5YEwMNl9PQFWOKZGMQ5o8oMy/RFlnKbDaXnFJDuGsvy4+WHyzs3e/6RpjYGRy75
 TEA==
X-Google-Smtp-Source: AGHT+IG8R/MV+mKnqwAnzy4y0Zl5389N67hz2si/ctYrXfkR18FS2k+S4zSHUsbAPYTVSkKA5X3xOA==
X-Received: by 2002:a05:6a20:3ca5:b0:1a1:72d2:1f4 with SMTP id
 b37-20020a056a203ca500b001a172d201f4mr2197pzj.22.1709768330177; 
 Wed, 06 Mar 2024 15:38:50 -0800 (PST)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com.
 [209.85.214.170]) by smtp.gmail.com with ESMTPSA id
 a30-20020a631a5e000000b005d30550f954sm11487473pgm.31.2024.03.06.15.38.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 15:38:49 -0800 (PST)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1dbe7e51f91so28705ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 15:38:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5r3bWA0ixZe8y85V2CTZMqJuFxY7h66kV19LT62nM8RO2YRsb2WRSIkA1s5qklnvPgtdZt3ixCtZqQHBisWPv6ZTfNVPUJsb2dCbrBVxQ
X-Received: by 2002:a05:622a:1190:b0:42f:a3c:2d4c with SMTP id
 m16-20020a05622a119000b0042f0a3c2d4cmr111258qtk.13.1709767832191; Wed, 06 Mar
 2024 15:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20240306200353.1436198-1-hsinyi@chromium.org>
 <20240306200353.1436198-7-hsinyi@chromium.org>
In-Reply-To: <20240306200353.1436198-7-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 6 Mar 2024 15:30:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VvhKZHVzHQdOO=_p0E5m7ig1LY2s5MZRojRynKHbF1xw@mail.gmail.com>
Message-ID: <CAD=FV=VvhKZHVzHQdOO=_p0E5m7ig1LY2s5MZRojRynKHbF1xw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel-edp: Fix AUO 0x405c panel naming and add
 a variant
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

On Wed, Mar 6, 2024 at 12:04=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> @@ -1009,6 +1009,19 @@ static const struct panel_desc auo_b101ean01 =3D {
>         },
>  };
>
> +static const struct drm_display_mode auo_b116xa3_mode =3D {
> +       .clock =3D 70589,
> +       .hdisplay =3D 1366,
> +       .hsync_start =3D 1366 + 40,
> +       .hsync_end =3D 1366 + 40 + 40,
> +       .htotal =3D 1366 + 40 + 40 + 32,
> +       .vdisplay =3D 768,
> +       .vsync_start =3D 768 + 10,
> +       .vsync_end =3D 768 + 10 + 12,
> +       .vtotal =3D 768 + 10 + 12 + 6,
> +       .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
>  static const struct drm_display_mode auo_b116xak01_mode =3D {
>         .clock =3D 69300,
>         .hdisplay =3D 1366,
> @@ -1990,7 +2003,9 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116X=
AN06.1"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116X=
TN02.5"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140H=
AN04.0"),
> -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B11=
6XAK01.0"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B11=
6XAN04.0"),
> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B1=
16XAK01.0 ",

Remove the trailing space from the string above now?

Aside from that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
