Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7264E956FFC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEAD10E302;
	Mon, 19 Aug 2024 16:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Bxi62ZYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9918710E313
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:14:51 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7a1dea79e1aso276379985a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724084088; x=1724688888;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIO91E6aNJoytIdsntCTP0hK3bjqHc3xM1HLhirFIT0=;
 b=Bxi62ZYNuTUuYoTd9J1BoGhQ19h4m/u31uePEu+P70Xh6xhOWFMQYCrT5aM9HsYrhr
 WRpKSsKv4+RB3SI/VIZTlBJezuAnKsyZRmf2+3jD3Os/UVMClp6AOvX1vcTVgLeEuHCo
 NsTTcElcEbyCOiFuyouuIIBV12vSqwxoEcjAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724084088; x=1724688888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIO91E6aNJoytIdsntCTP0hK3bjqHc3xM1HLhirFIT0=;
 b=MVo9LadBygJBHRwgPaehh9piZPzX315v0PrIs6rBuvNCf9k26SBGK97xU0K9gTiMgH
 vw9FNC/NMMV1CLziiBBXp74NHoaZP59UQZolDnbMNGwF9g9INJLY2AVxVOdoGF18g+HF
 GJdHT4dvG1Zp5oWKT7wMDHiN9R2oTh9ccOYi3GPVbZMJP9Kh6rbIVsqwrEPeH5UnwiLI
 jP/llsbyKoEfHYgSzvBYvcdvEt6DVdT8TvSFhMjP0SYXwDBp/PNHTkcxs0yqujRID2aM
 7G6/E1tVcDvZKvBp+4I+MzjQ/uX+1heBe/dT1kS5Wbs5ZtA/Kxl94wePV/osBGfkG2O4
 3Vug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN8IkoliDPlGAggXzvMb9wwIns8oYKOAisFkcIzPeb77N7cQz7fcLcGisI+Ao419mGUQUa5hbfzsixoGaAJkd/A9UF/GUKcffye/4R6DHU
X-Gm-Message-State: AOJu0YyLP8dHjBFEYnkkVa4+D+/WsWU9/xkp49rQRwRoxNyHkF3r16LQ
 ffDx4Xjou/0+KGxEvglUt/GU07cDGTOTj1lDEsGXnvp8mcTkZkIHtmDARLFSCehQvWo+An3C2W8
 =
X-Google-Smtp-Source: AGHT+IE+0j15lZ/X2xxCGBHOTFHcd0I0nWp52EAFU1Uhv+uwV83aIRznhOCtVnJc94lGulNIgbRdPw==
X-Received: by 2002:a05:620a:bcd:b0:79d:6d7d:e5b3 with SMTP id
 af79cd13be357-7a50696f956mr1398634985a.42.1724084087990; 
 Mon, 19 Aug 2024 09:14:47 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com.
 [209.85.219.53]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4ff02ae42sm445269185a.27.2024.08.19.09.14.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 09:14:46 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6bf7ad1ec3aso22907626d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:14:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTMiJ0TTm/s82FCXqSGx7KHBrnStaQ9RyP1o4gzcXxIsrPlLtofl1tokL+gOt1Tdos0H7IyfLMB0RDF3jOTg2ThCtC248R1MGl1gZHGcld
X-Received: by 2002:a05:6214:3a06:b0:6bf:836b:2c18 with SMTP id
 6a1803df08f44-6bf836b2d69mr91124376d6.14.1724084086193; Mon, 19 Aug 2024
 09:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240818072356.870465-1-tejasvipin76@gmail.com>
 <4be2f1d1-534c-4c99-a35e-f354c75c88b4@linaro.org>
In-Reply-To: <4be2f1d1-534c-4c99-a35e-f354c75c88b4@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 19 Aug 2024 09:14:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UaYCW3hDp-eV9Wio-3iB2-PViy5Jj9VZxPEK2j+PPLkA@mail.gmail.com>
Message-ID: <CAD=FV=UaYCW3hDp-eV9Wio-3iB2-PViy5Jj9VZxPEK2j+PPLkA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: mantix-mlaf057we51: transition to mipi_dsi
 wrapped functions
To: neil.armstrong@linaro.org
Cc: Tejas Vipin <tejasvipin76@gmail.com>, agx@sigxcpu.org, kernel@puri.sm, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
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

On Mon, Aug 19, 2024 at 8:36=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 18/08/2024 09:23, Tejas Vipin wrote:
> > Changes the mantix-mlaf057we51 panel to use multi style functions for
> > improved error handling.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >   .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 79 +++++++-----------=
-
> >   1 file changed, 27 insertions(+), 52 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers=
/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > index ea4a6bf6d35b..4db852ffb0f6 100644
> > --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> > @@ -23,7 +23,7 @@
> >
> >   /* Manufacturer specific Commands send via DSI */
> >   #define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
> > -#define MANTIX_CMD_INT_CANCEL           0x4C
> > +#define MANTIX_CMD_INT_CANCEL           0x4c
>
> Please move cleanups to separate patches

LOL, in a previous patch series I had the upper-to-lowercase in a
separate patch and someone yelled at me to do the opposite and squash
it together [1]. It doesn't really matter too much to me, but given
the previous feedback I've just been suggesting that Tejas squash it
together with his conversions. I'm OK either way, though.

[1] https://lore.kernel.org/r/CAA8EJpo4WzMPNjpnkHt-_GJe2TAF_i_G+eTaJrGipMEz=
ppc3rQ@mail.gmail.com

-Doug
