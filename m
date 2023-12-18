Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F081799D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5522710E2B0;
	Mon, 18 Dec 2023 18:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8726B10E290
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:25:51 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a233a60f8feso234358466b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702923950; x=1703528750;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NG2qZG/XdvJUEvAVYY7hNHtIGwP/B3fi4Ki1iIxEYOI=;
 b=aqd8mDKmB3+v3zwQaUG4Q22vtZW1DNVCk88v3JsYGdgqt378+jGpYKBYZcxTI6sZqm
 04NAeFcP6X6o+fI2f8AFToEYadtEXma458vOoeReyLhk3FicXhmKRoZ3XtghzZEs3T0t
 I++d2ZjU5Yo9ZTDQPkxmOmZJIY1vswOh7b1DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702923950; x=1703528750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NG2qZG/XdvJUEvAVYY7hNHtIGwP/B3fi4Ki1iIxEYOI=;
 b=YVVPYsT5r8/9+lw+2VUpPXKiKim3ymcyw2YjkXuq+zZQq9eFIFWMH/KZGSF7lE23y0
 sS0ujxDAOgM3fnMw1o66O6tI9YeffszgI0FTomCYpGcybSB5k41vErcae+9f2ujiK3bp
 0Gto5BN+PAwJMCmUpJ0hK0nRpr1QkiZwr7GAJbQVXBpSbp4uZKex9WEc76wwNeffs8lZ
 HZzaNBAkGKlZXRccwJgUilJr7NRlZ7I6a5fEoSRu7bsCp4YGl1/EHyK0t1pg52Ne7AIE
 YMcofb4uf/WjCfzd6BngmipDkMZmL5DfpAkdZDXhnnnEciVG5jwPbZmRQV/0KaqIILki
 1bqA==
X-Gm-Message-State: AOJu0YwmCC6kKJuWRpZxwOvKJobdbDVSHWDCA3RnS0LDKAd0yI/G7CxP
 LirUA7Yd/pRf6ETOQHAO0kKHdv5zDls90Ji6fBl89i8/
X-Google-Smtp-Source: AGHT+IELCvjVBR93ODgx9+flmyr5uMzXWiyGSg7mq51xU2HRTg5hHy9HRRTlyHNLVZyoXyIUpzP7Fw==
X-Received: by 2002:a17:906:c14b:b0:a1d:182:efcc with SMTP id
 dp11-20020a170906c14b00b00a1d0182efccmr9893305ejc.65.1702917753410; 
 Mon, 18 Dec 2023 08:42:33 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 wb13-20020a170907d50d00b00a1d4be88019sm14278060ejc.43.2023.12.18.08.42.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:42:33 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-552eaf800abso20518a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 08:42:32 -0800 (PST)
X-Received: by 2002:a05:6402:5216:b0:553:6de7:43d7 with SMTP id
 s22-20020a056402521600b005536de743d7mr111830edd.6.1702917752681; Mon, 18 Dec
 2023 08:42:32 -0800 (PST)
MIME-Version: 1.0
References: <20231214152817.2766280-1-treapking@chromium.org>
 <20231214152817.2766280-4-treapking@chromium.org>
In-Reply-To: <20231214152817.2766280-4-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Dec 2023 08:42:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xd3TJNBSzUQ=4td9t6Nqnbd3QAt7fmnn_aT0QXSkRn0Q@mail.gmail.com>
Message-ID: <CAD=FV=Xd3TJNBSzUQ=4td9t6Nqnbd3QAt7fmnn_aT0QXSkRn0Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel-edp: Add some panels with conservative
 timings
To: Pin-yen Lin <treapking@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <groeck@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Dec 14, 2023 at 7:28=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> These panels are used by Mediatek MT8173 Chromebooks, and they used to
> work with the downstream v4.19 kernel without any specified delay.
> Back in the v4.19 kernel, they used the "little white lie" approach,
> which is making the devicetree claim a specific panel's compatible
> string for many different panels. That was a common solution before the
> generic edp-panel driver.
>
> After we uprevved the device to a newer kernel and used the edp-panel
> driver, we saw multiple devices reporting warnings of using an unknown
> panel and falling back to the conservative timings, which means that
> they turn on/off much more slowly than they should. We tried to fill in
> the timings for those panels, but we failed to find all the data sheets
> for them.
>
> Therefore, instead of having them use the default conservative timings,
> update them with less-conservative timings from other panels of the same
> vendor. The panels should still work under those timings, and we can
> save some delays and suppress the warnings.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v3:
> - Update the commit message.
> - Collect review tag.
>
>  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Pushed to drm-misc-next:

7c8690d8fc80 drm/panel-edp: Add some panels with conservative timings
