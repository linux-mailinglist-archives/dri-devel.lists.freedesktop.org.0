Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58EF86BCBB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 01:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128D310E140;
	Thu, 29 Feb 2024 00:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JNo3dJyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BA710E140
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 00:22:21 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56533e30887so481014a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709166137; x=1709770937;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mE5RQXDNdhEusYdLETG+sg8aAl7cMprUY6xe9cmq2GU=;
 b=JNo3dJyTHsePwiX+qfuzR9WWfYScxRbu26V+OYWWmDp+q8FmeYlswojevnJTu/ZuBE
 jB78WmzkK8u5E5Gq8noruMqr8GD9law3Sxdgf/m0uj63eH2FTUuJQDSsyUeK2/Xk2xqJ
 Zur4EFqYMbsUqyn4nBFdQuvHYksOoqqai/NMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709166137; x=1709770937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mE5RQXDNdhEusYdLETG+sg8aAl7cMprUY6xe9cmq2GU=;
 b=AQ4CiUHQDYr4CyqthmY4rc8Y0tGiEAMgNXX92eb5Hdco0CIMg3WwzRWwxFcRLmmSNm
 su5vU5WxlcydJ4N8r00FXrKfGtov014La2+FmPcnPo6Lfdfm6m5eWi72R/IzS7lT0NpW
 BnH7n2R6S1BmMxXTUo6tWmvC+G3cgoPI4rS+PpiGXy7rV9yT4jp1J5imJnjUKz7oaMyl
 zVvpNH3SdW6KJQE0CaF/kktyfrv1vSwv5297gVg3rTY8BHSUDwbL2BAg7opmvgJrheiv
 xZI/WQ/SUhVmAOk27Yi5ug0uaYyun+M58I4DIHmxMeMXkw6af8OmNCL8s1s35APr0KP7
 ZHKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnf9CMY2WBDjxShJmjMlyUUy6Nvyc1WeHHmuMloolb+C03eBkdYOnupORHQ+CVg90JnyDAU6+sdvIuE43agqW1PGhbF7OfzQmzH9Bwgkp3
X-Gm-Message-State: AOJu0YxfS8xvp8LTzTXO3VrB3mokKU0CxH+X+B4ZDEaqkLt+mP9LMKdB
 GJvUsiO/9P2y7DSNvrMaUoXQsI4IFN0cfmAfF6CzQotD3D3Bf/Mqq9kqG4VMztCV7qbmS9xOnmF
 28NOs
X-Google-Smtp-Source: AGHT+IEQ2fEOrvZTgunuqdsJO3Ru/9pmCZ7pcQPovsmxwZJPgjjgKxVk2Ixs4Y+bcwFRUozhWhqOZw==
X-Received: by 2002:a17:906:6d57:b0:a43:18a0:a1ab with SMTP id
 a23-20020a1709066d5700b00a4318a0a1abmr274109ejt.7.1709166137009; 
 Wed, 28 Feb 2024 16:22:17 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 br3-20020a170906d14300b00a3f3d0d30c8sm64630ejb.213.2024.02.28.16.22.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 16:22:16 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-412a2c2ce88so15695e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:22:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWeCWvpGcrCrbquKb5/L3tda46jdMF4/eWdDxlW+EEPEL205tq+xaQQCrDvYzkiKeIYf93CxmoTdRz5R3tD4nuJFr1/Hnz1tGqbpLLyO/Zo
X-Received: by 2002:a05:600c:5185:b0:412:a039:945b with SMTP id
 fa5-20020a05600c518500b00412a039945bmr43892wmb.0.1709166135473; Wed, 28 Feb
 2024 16:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-4-hsinyi@chromium.org>
In-Reply-To: <20240228011133.1238439-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 16:22:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VV6fprky=v9koiVGmWcXKL3V4F2LOu7FriPbT_zT6xyA@mail.gmail.com>
Message-ID: <CAD=FV=VV6fprky=v9koiVGmWcXKL3V4F2LOu7FriPbT_zT6xyA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: panel-edp: Fix AUO 0x405c panel naming
 and add a variant
To: Hsin-Yi Wang <hsinyi@chromium.org>
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

On Tue, Feb 27, 2024 at 5:11=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> There are 2 different AUO panels using the same panel id. One of the
> variants requires using overridden modes to resolve glitching issue as
> described in commit 70e0d5550f5c ("drm/panel-edp: Add auo_b116xa3_mode").
> Other variants should use the modes parsed from EDID.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2: new
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

The previous version of this patch that we reverted also had an
override for AUO 0x615c. Is that one no longer needed?


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
6XAN04.0 "),
> +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B1=
16XAK01.0 ",
> +                        &auo_b116xa3_mode),

The name string now has a space at the end of it. I _guess_ that's OK.
Hmmm, but I guess you should update the kernel doc for "struct
edp_panel_entry". The name field is described as "Name of this panel
(for printing to logs)". Now it should include that it's also used for
matching EDIDs in some cases too.
