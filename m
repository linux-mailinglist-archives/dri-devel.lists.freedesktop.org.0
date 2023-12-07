Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA612808FC9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 19:23:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A5110E92B;
	Thu,  7 Dec 2023 18:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F9710E92B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 18:23:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a1e116f2072so274148166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 10:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701973432; x=1702578232;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1yF2nbpTBS+jUEhedo6G2ntKnSSa7ydctF2qRUubWQ=;
 b=SBdTGQPhWHp9wVR0pchNxB/L0z6+mvIV4tRON/AOS6AEV4IaFsLDDcbQ5n7hUdkV2L
 icw0w0iMS0iR7Fux8PaxSxHjzcXc4Axs+W0TGaIqYMoPrNYnbACYwu4i6EFWBEL3wZeW
 ZI980HNkV4+jKbyGTeaMPiKmsCNaoheR2FCZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701973432; x=1702578232;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x1yF2nbpTBS+jUEhedo6G2ntKnSSa7ydctF2qRUubWQ=;
 b=QfzV44cWGHm1jIqXB6ieS28LphoGAkxEzECbGwT5zCuIYKIi9W9I8ifL/hjR2VsTp+
 dRYlLP9/KOzG00jqN6/vgNE664NvAJNA/+71Ld4PaGmNfJw2ci5JsmK+neh0/3FizwzQ
 tuGxOUcX8fc0txOXynVEmEVJgMBNZDPrWgR/ZKtjM8e32vqYB6WxP+TYC1ZVVvSwhDlP
 SN2SuTRLk69hIZJRORrqtXNNIY88rFvpN10iqrj8rWQkeecXEu6es8uvPOVp7D8EYWpl
 KmV6kFJYczw3D8ySfswz+eB4L54fldWPyyI5Ev3RCzBHxAPUmFSk/BOru5422tlpuFab
 fqdw==
X-Gm-Message-State: AOJu0YzcGvyBeT4asqUY3EPXd2qswrVW+AYWnOKljX097wfMaq8zX1Hz
 T3NpUXKVBhjk0UNWrjiRHrFobbmbo/vPoRre1kumZNhU
X-Google-Smtp-Source: AGHT+IGxrlIlswHkL7NMYZgQ7s073MBbKfVEo25ksPwH3AipSAOQD4zHnp/2K0oU8eiqQFys9vMwNQ==
X-Received: by 2002:a17:906:530b:b0:a1f:4d21:301a with SMTP id
 h11-20020a170906530b00b00a1f4d21301amr824586ejo.13.1701973432763; 
 Thu, 07 Dec 2023 10:23:52 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 sk15-20020a170906630f00b00a1b7f4c22a7sm56784ejc.82.2023.12.07.10.23.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 10:23:52 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40b422a274dso4725e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 10:23:52 -0800 (PST)
X-Received: by 2002:a05:600c:231a:b0:405:320a:44f9 with SMTP id
 26-20020a05600c231a00b00405320a44f9mr220940wmo.5.1701973431985; Thu, 07 Dec
 2023 10:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20231207081801.4049075-1-treapking@chromium.org>
 <20231207081801.4049075-3-treapking@chromium.org>
In-Reply-To: <20231207081801.4049075-3-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Dec 2023 10:23:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WdUXKmZZMnEDsGeSrAyM831zPUom9QLWbnm0nPieZv_A@mail.gmail.com>
Message-ID: <CAD=FV=WdUXKmZZMnEDsGeSrAyM831zPUom9QLWbnm0nPieZv_A@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/panel-edp: Add powered_on_to_enable delay
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

On Thu, Dec 7, 2023 at 12:18=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add the support of powered_on_to_enable delay as the minimum time that
> needs to have passed between the panel powered on and enable may begin.
>
> This delay is seen in BOE panels as the minimum delay of T3+T4+T5+T6+T8
> in the eDP timing diagrams.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-edp.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Should have carried my tag from v1 since there were no changes:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

As per my response in v1: This needs to bake a little while on the
lists (1-2 weeks) before I apply it in case others have opinions.
