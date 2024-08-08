Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F106994C4CC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 20:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6648F10E7DE;
	Thu,  8 Aug 2024 18:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XeY/h+cE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEA610E7DE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 18:45:30 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7a1e2ac1ee5so81498085a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723142726; x=1723747526;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNkhoqvKuiIgMp2Dxoqrfnd9iwX4pwdtbywMo2F68wE=;
 b=XeY/h+cEnTsvqe5eIVuCX4hGpL9VyR+nOVEgE53eEa4v2813VH/5YEwm9YDrRjoEUu
 rdfrWc6ELfwKZoRtkWBMrtaBWNc+eoWj1fHLTH3UN4H9teLTzMKn1nrG/54tCYXgJFqB
 oZ9KhwWfeel1ukme0mboJnLRUYMKwDXjwwuZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723142726; x=1723747526;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qNkhoqvKuiIgMp2Dxoqrfnd9iwX4pwdtbywMo2F68wE=;
 b=uMG+vkJAHvnjA9pYHE+dlpMcs96ZJutFc402p73OEzFzaUAB0ryubV4vTcp5+Oih7C
 UPFjte/VUwRL2SmGAcN1ZEwJROC94AncDCPjSQBuWxmeIw1I4sA8e2hm6ZwXJOFye1x2
 0LbNwgV+UX4XT5EuKZR6rNfMfl6eZElFS0v9t3Hm1G+2BWCBa0ArOtrxVhfW/AvwPGEs
 gfhRM/6C/1cOhDrKSVOc0pKqQIHwQLpApLeB6KtCRYKmiSX/5NmS2xqPFzveMFFs+9TH
 dFIfpQ3YHVGBtMtyTJOleGD1mptDBT1Xzw0hvbpFahr/Xwep1biUKCQm4LznAU7Wmb+b
 uy+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpljb0kNVcI+wEP/RdcMFhUhP7K2YtsjtUB74YuU54U+4qTyGMMISxEIwJXMcL5qd9pGglv+mFLu1hEBrz1jaJSx1OY4huzxOYumGqGxO4
X-Gm-Message-State: AOJu0YzwdCp89+fT7PAKUr0R4KLHopMLodgkD52AxrN8I/C7Px7cEw63
 HpEl/HaTJGPGGJdyIvdr1NCOp7p1MHW73xNaDXeeRdTj4aqRCjaZuqxAz3yM2DByc8Y+SedOI+4
 SxHc4
X-Google-Smtp-Source: AGHT+IGFF70Mth+WaxPyQm6PKyu03u7M3pHlT3IvLsflEjXroEb06rj+dygYXJExWYUmGC4C77VE/g==
X-Received: by 2002:a05:620a:470e:b0:79f:1869:11fe with SMTP id
 af79cd13be357-7a38189239emr313315285a.52.1723142726278; 
 Thu, 08 Aug 2024 11:45:26 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a3785d0d1asm186423485a.25.2024.08.08.11.45.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 11:45:25 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-44fdc70e695so44721cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 11:45:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6izP7N6pXXLZN2mZfzd8hlWFSPtJRBd8Krz9M07U71o+GaYAcJ/SAN8kOyc9FEpRrqPMu2ih/ZJmx2Prdiv7AhgFei9ZthB8+H1xJj51d
X-Received: by 2002:a05:622a:241:b0:444:dc22:fb1d with SMTP id
 d75a77b69052e-4530dcd66e9mr383971cf.12.1723142724490; Thu, 08 Aug 2024
 11:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com>
 <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
 <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com>
 <CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com>
In-Reply-To: <CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Aug 2024 11:45:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWAoQ3Njq14uwSrA2zA=Wx_Jm7F1c7gFyk4Jysut1Thg@mail.gmail.com>
Message-ID: <CAD=FV=XWAoQ3Njq14uwSrA2zA=Wx_Jm7F1c7gFyk4Jysut1Thg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Thu, Aug 8, 2024 at 11:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> > > > existing ATNA45AF01 and ATNA33XC20 panel but with a higher resoluti=
on.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 +++++=
+---
> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll plan to land this in drm-misc-fixes next week unless someone
> > > objects. "fixes" instead of "next" for the same reasons discussed
> > > previously [1] that the dts patch should probably be considered a fix
> > > and there's a chance that the dts patch could land in an earlier
> > > version of mainline than the bindings unless we consider the bindings
> > > a fix.
> > >
> > > [1] https://patchwork.freedesktop.org/patch/msgid/20240715-x1e80100-c=
rd-backlight-v2-1-31b7f2f658a3@linaro.org
> >
> > Landed in drm-misc-fixes.
> >
> > [1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45D=
C02
> >       commit: 1c4a057d01f4432704c4dc8842b6e888a91d95df
>
> And now warning in linux-next:
>
> ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml=
:21:9:
> [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml=
:23:11:
> [warning] wrong indentation: expected 12 but found 10 (indentation)
>
> Please send a fix.

Doh! I'm just about to hop out on vacation, but here's a fix. If
someone reviews in the next 30 minutes or so I'll land it. Otherwise
hopefully someone else can land...

https://lore.kernel.org/r/20240808114407.1.I099e8e9e36407a0785d846b953031d4=
0ea71e559@changeid
