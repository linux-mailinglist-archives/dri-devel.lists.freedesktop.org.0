Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8408C77E0
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D9C10ECFF;
	Thu, 16 May 2024 13:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JyrF5WSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D5E10ECFF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:43:47 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-de5acdb3838so8240433276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715867024; x=1716471824;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vE+d7Cw90alIT6F0UkuVj3O7o7Oab4n1TKo1NXh8d0Y=;
 b=JyrF5WSZ8+ns2AevjFh1sVAgpVTZfLph6BesgYan4KX7J53bGIE+Qlg6UUys/fbhSz
 rzb7CH9MLrY0Whn0Ok5z4XPEXJ9C6uZk5kcVtigjYiNirtXa++GLhi/vU4E5fRwih/QA
 nHRHjkWPvcjc5YwG0q1MjEpFY6XY7PFEqnMCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715867024; x=1716471824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vE+d7Cw90alIT6F0UkuVj3O7o7Oab4n1TKo1NXh8d0Y=;
 b=SP+bG2raYg3JS7U2Kz7h5SAe3bHd5Z38Qs9mtFlgK6KSmYO3HNelj97nXSFcXMSE99
 Ip2WsBGvYvDjO/MquYnlVtsZ9Ae8U1qXVIHyzrqGOy0SB1QLTUg6F/Ciq1Dr1q4NOoSf
 qKD1pjcpcio5RebPO5kLIyoiX7Xw8gNmmvFBS6Q8yrLLdwk8Db9T7FdLI4cO0/o0ORDW
 vVDQ3jUMIO78a8cejZweVxgrzJJjARA4ZRZURmqdfksgjUTrsDd0HA7FYik6erLIueHD
 OL++9z96InmsxUoRpgsTKoqjF/BZm/T4EQ/ciCgvN9xVwERdsYPm5srJZ+x3OEhLNdR6
 Nk9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSgps0659ez46QGIGI1vkSmMgkJWjWLwMuESZJo6ZXmlqyw67ejS/ZtVqkXzvKODHEpErKHeM4gNx0gvwxPckZl1osydPABMVIQa8tBsz0
X-Gm-Message-State: AOJu0Yy+GiV5zHmm1AMwVTbuVJ8y4I/xdqz67GsKIeXUNu4aJqd68hTn
 rHDLhF99kIo4eBEAnX+2E9z5LGqxLOp0sT9ObSKkkzkCE8UVV645KMUyBhlF6SpITwg4hZbvtl4
 =
X-Google-Smtp-Source: AGHT+IFwaKcDSOboqy8DV1ITRKvOEKx5U7LstkBLsxXTlO29dkfXZ7clNg2m/PpH1nIXE1Ts3NDbvA==
X-Received: by 2002:a5b:904:0:b0:de8:9854:f8ca with SMTP id
 3f1490d57ef6-dee4f1c457amr18827301276.3.1715867024641; 
 Thu, 16 May 2024 06:43:44 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f194da1sm74703046d6.67.2024.05.16.06.43.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 06:43:43 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43df9ac3ebcso2669321cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 06:43:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVuI5Og/Caab4a596+UCIfQznUgJ0RrakT1WQpJPiMn8iZQJIVId3WQoxFlsuAY7kSUKKAMMlTqIBWu6gCmXnS8R7/ARQ2pC7OlXK4VzhaY
X-Received: by 2002:a05:622a:5a8c:b0:43e:398a:b0c0 with SMTP id
 d75a77b69052e-43e398ab190mr5529521cf.12.1715867022285; Thu, 16 May 2024
 06:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-4-yangcong5@huaqin.corp-partner.google.com>
 <0fcdb0ac-2e4a-44b2-a5d6-a67a1d747df8@linaro.org>
 <CAD=FV=XkBkQUN-93eQDKZcw_66uSeNBBhbiq2hRLcFN+Ck71RQ@mail.gmail.com>
 <CAHwB_N+foZpCjqUy0dJdS2wBbUjHVRQQP0p7S_eTG1Yrh0bgPw@mail.gmail.com>
 <7b488473-7fd1-4f4f-8c32-72e84420b478@linaro.org>
In-Reply-To: <7b488473-7fd1-4f4f-8c32-72e84420b478@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 May 2024 06:43:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W6mkTwAp6qMVYbPFDYBroAW19-qgvct1dw11ksaW3cYw@mail.gmail.com>
Message-ID: <CAD=FV=W6mkTwAp6qMVYbPFDYBroAW19-qgvct1dw11ksaW3cYw@mail.gmail.com>
Subject: Re: [v7 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
To: neil.armstrong@linaro.org
Cc: cong yang <yangcong5@huaqin.corp-partner.google.com>, sam@ravnborg.org, 
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

On Wed, May 15, 2024 at 11:55=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>
> On 16/05/2024 08:43, cong yang wrote:
> > Hi:
> >
> > If it is determined that a separately patch needs to be sent, then I
> > will remove this patch in V8 series?
> >
> > Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=881=
6=E6=97=A5=E5=91=A8=E5=9B=9B 05:28=E5=86=99=E9=81=93=EF=BC=9A
> >
> >>
> >> Hi,
> >>
> >> On Wed, May 15, 2024 at 2:16=E2=80=AFPM <neil.armstrong@linaro.org> wr=
ote:
> >>>
> >>> Hi,
> >>>
> >>> On 15/05/2024 03:46, Cong Yang wrote:
> >>>> DRM_PANEL_HIMAX_HX83102 is being split out from DRM_PANEL_BOE_TV101W=
UM_NL6.
> >>>> Since the arm64 defconfig had the BOE panel driver enabled, let's al=
so
> >>>> enable the himax driver.
> >>>>
> >>>> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> >>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >>>> ---
> >>>>    arch/arm64/configs/defconfig | 1 +
> >>>>    1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defco=
nfig
> >>>> index 2c30d617e180..687c86ddaece 100644
> >>>> --- a/arch/arm64/configs/defconfig
> >>>> +++ b/arch/arm64/configs/defconfig
> >>>> @@ -864,6 +864,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=3Dm
> >>>>    CONFIG_DRM_PANEL_LVDS=3Dm
> >>>>    CONFIG_DRM_PANEL_SIMPLE=3Dm
> >>>>    CONFIG_DRM_PANEL_EDP=3Dm
> >>>> +CONFIG_DRM_PANEL_HIMAX_HX83102=3Dm
> >>>>    CONFIG_DRM_PANEL_ILITEK_ILI9882T=3Dm
> >>>>    CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=3Dm
> >>>>    CONFIG_DRM_PANEL_RAYDIUM_RM67191=3Dm
> >>>
> >>> You should probably sent this one separately since only an ARM SoC ma=
intainer
> >>> can apply this, probably via the qcom tree.
> >>
> >> Really? I always kinda figured that this was a bit like MAINTAINERS
> >> where it can come through a bunch of different trees. Certainly I've
> >> landed changes to it before through the drm-misc tree. If that was
> >> wrong then I'll certainly stop doing it, of course.
>
> Yeah we usually don't mess with arch specific defconfig from drm tree

In general I agree that makes sense. In this case, though, the new
config symbol was introduced in the previous patch and split off an
existing symbol. Updating "all" of the configs (AKA just arm64) that
had the old symbol to also have the new symbol seems like the nice
thing to do and it feels like it makes sense to land in the same tree
that did the "split" just to cause the least confusion to anyone
affected.

In any case, if it's going to land in some other tree then I guess the
question is whether it needs to wait a few revisions to land there or
if it should land right away. Nobody would get a compile error if it
landed in a different tree right away since unknown config symbols are
silently ignored, but it feels a little weird to me.

...of course, I'm also OK just dropping the config patch. I personally
don't use the upstream "defconfig". It just seemed courteous to update
it for those who do.

-Doug
