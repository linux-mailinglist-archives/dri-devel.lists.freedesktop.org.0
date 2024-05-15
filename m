Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FE8C6DCC
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E79B10E14F;
	Wed, 15 May 2024 21:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="c9iINENk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C3310E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 21:28:45 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6a077a861e7so52177386d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715808519; x=1716413319;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UmNEhsA1PVQGVB4IPr+WxtggKmtowmQmNLiJoenwI8=;
 b=c9iINENkvvwEQ3tD6MQ9t09zjuc3S7dSkfzBimgJyRD2UwUlzdmrq+DEEFVA+h7oAx
 wFdKs/SwV5262eE3KxUP46rX0ROHxiIdQCrzXlbjqEb38VsAIQzbApgkxlCAXnXDcZvE
 6iTNonyAIav0Qw1TjYyFAY0q3korPZlPBC4t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715808519; x=1716413319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UmNEhsA1PVQGVB4IPr+WxtggKmtowmQmNLiJoenwI8=;
 b=jjp5Kuh6sx5y8omi9v2XD3AiyKjg1DREGKeTj6ZFSmp2pCVxwcL9L8qJlImUyc7tNp
 UlxMtOIsHTMXC6yF29H4CCVRjuIzdIXiY1mEEXg3vwPPHznUJ1iXr7qAsPPmeHdxAXZK
 vJCXfSxACIlBdmubvP+b8vqDIvBb2b8le9QeuDP8sNYQR+l5y+LXYL6aRjugVTkBg0is
 I+hUNH1UP9pzuMpUwte7doD11CqYX7H6n6+KZgjCEmieA6ShXzdMW7ioMjJBVlyrpDGR
 rYOWvU4P/1SYmZZxaXLSZwOKQ1heo/477R+4rYNMbty02bdkPJ6yDEYBmXV6eLLZdLYZ
 NQ+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxIHCXmIo2bQZJkAqSIwyPUR2xBh1z70aJx/g4b7UrsJ1uh26xIUIpx3aBt59XdD4SYGxtvy3cugH4NaGY5AGtZvmUB+fVYXWPcOSNmxvy
X-Gm-Message-State: AOJu0YwMtqd/A4g5tEZxLm52AqYkJZUyAchIMgxjY4zak0fDDI+hPjUG
 n/HuY/JHJzLHwcIgmQruI78/aatHztrWZHG9pnKPRTe5Yg+nKb1UAju+X/dCz88SFfLLxZo9z90
 =
X-Google-Smtp-Source: AGHT+IGQ/drhmz+RiZL0K/2ZBJvce/jaIzcwCWw7fDkIEue/28NV1hWrUT17LW7KJ2F4vaz+wBUgYw==
X-Received: by 2002:a05:6214:2c02:b0:6a0:af22:e2b with SMTP id
 6a1803df08f44-6a168167b76mr188620446d6.24.1715808518988; 
 Wed, 15 May 2024 14:28:38 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e0ec47bf0sm56810251cf.3.2024.05.15.14.28.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 14:28:37 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43dfe020675so2312261cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:28:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGkIBgNkOdynKMkSa0b52pxZP0L/mS9vedBTPk2uHU6GUMnJQS5d1ATn0Eco8LAmDO9+/AaPZzfzaLtIgxCj5CZwEvZu3XButBsnxRkoQ5
X-Received: by 2002:a05:622a:1928:b0:43e:1124:3c4c with SMTP id
 d75a77b69052e-43e11243d95mr12242171cf.28.1715808517355; Wed, 15 May 2024
 14:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-4-yangcong5@huaqin.corp-partner.google.com>
 <0fcdb0ac-2e4a-44b2-a5d6-a67a1d747df8@linaro.org>
In-Reply-To: <0fcdb0ac-2e4a-44b2-a5d6-a67a1d747df8@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 May 2024 14:28:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XkBkQUN-93eQDKZcw_66uSeNBBhbiq2hRLcFN+Ck71RQ@mail.gmail.com>
Message-ID: <CAD=FV=XkBkQUN-93eQDKZcw_66uSeNBBhbiq2hRLcFN+Ck71RQ@mail.gmail.com>
Subject: Re: [v7 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
To: neil.armstrong@linaro.org
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org, 
 daniel@ffwll.ch, linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
 robh+dt@kernel.org, conor+dt@kernel.org, airlied@gmail.com, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 xuxinxiong@huaqin.corp-partner.google.com
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

On Wed, May 15, 2024 at 2:16=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 15/05/2024 03:46, Cong Yang wrote:
> > DRM_PANEL_HIMAX_HX83102 is being split out from DRM_PANEL_BOE_TV101WUM_=
NL6.
> > Since the arm64 defconfig had the BOE panel driver enabled, let's also
> > enable the himax driver.
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >   arch/arm64/configs/defconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
> > index 2c30d617e180..687c86ddaece 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -864,6 +864,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=3Dm
> >   CONFIG_DRM_PANEL_LVDS=3Dm
> >   CONFIG_DRM_PANEL_SIMPLE=3Dm
> >   CONFIG_DRM_PANEL_EDP=3Dm
> > +CONFIG_DRM_PANEL_HIMAX_HX83102=3Dm
> >   CONFIG_DRM_PANEL_ILITEK_ILI9882T=3Dm
> >   CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=3Dm
> >   CONFIG_DRM_PANEL_RAYDIUM_RM67191=3Dm
>
> You should probably sent this one separately since only an ARM SoC mainta=
iner
> can apply this, probably via the qcom tree.

Really? I always kinda figured that this was a bit like MAINTAINERS
where it can come through a bunch of different trees. Certainly I've
landed changes to it before through the drm-misc tree. If that was
wrong then I'll certainly stop doing it, of course.

-Doug
