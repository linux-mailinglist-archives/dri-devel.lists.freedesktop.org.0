Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ACC8C7845
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 16:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B97C10ED3D;
	Thu, 16 May 2024 14:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bl2PKrkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDF610ED3A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 14:10:10 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-43dfc9b9519so25418731cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715868607; x=1716473407;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EFjHqt7hZKMcQ8pOSR62lBmFQVRSCJX/1oVvs7X3b4=;
 b=bl2PKrkzQCJ76aF9aTwpPWgohRyfk+M/0594bQ5iRElL/vguDZunCa+NaILZ2Qy28W
 /u7gabcF6AlIY4eWYbdd3wc35jEI2VEX3zNFp89lzHaBOmB1RADtpCCKg6Jp8XAK2uw9
 PSTAO9kx/LJ+D0HBDbR8XCekF5SoNPivCTf60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715868607; x=1716473407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EFjHqt7hZKMcQ8pOSR62lBmFQVRSCJX/1oVvs7X3b4=;
 b=NnglDIeZ9pc84Ej/QHKG9bbkoYdy6TKqVTuWgkqvYKBh7Z7/EXJTYAhtzSXEOnSRCx
 rIpe11oC/uKfcU9jq0DUI5MdH6yve2s1f2NnierTn7pixgLinHbSQQ4crdNdcH91dyDP
 AXI9H3FgSSSL/e5uRUuK8dhMWalLBjF8sDlMSv+ovFGFgUnBd4kEFaWnNzkheo520mDk
 yKJOI2y/rDcEZclSDxelFJCdyXW9jsYa1ebkugcDNOHYEy+7pMcbP+bMc0BhABUMSVwy
 Q3+cNpiPSG/JvdLDJ8KpK0wG0lzWk6iI6sYontSd+HZpBvUIPnElXvcMySWzT+Q7Kt8B
 phyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkqXHZVaAgvxZInSPROp16TMpJBFS+C0rlbyDI4Sm0W6n53aoKFOGEvYLqLjAq+A6grKzJIxVC5259dahf8rp/en2cMWtobuO87/bxFUvr
X-Gm-Message-State: AOJu0YwXq2HxHUgXwjVVXNIqmVM4albDR0NbKlYEh8iGz1JEoPgIb8sO
 ic3vPcsvU+D7rq4klGS/oL9f7hK5d+na2wOoe3fsF6jK2OQkXOOSLE4sWP3M71QmcbLnk0qHTO0
 =
X-Google-Smtp-Source: AGHT+IG3fB9FH5CZ9tJiekJl1RSCUkBKSEv7OmqHozYuQlzTjcrsUIlgz+iZ89OiIEPPfyy7JzHmtw==
X-Received: by 2002:a05:622a:1b87:b0:43a:ffa8:4a99 with SMTP id
 d75a77b69052e-43dfdae7794mr219515351cf.38.1715868606536; 
 Thu, 16 May 2024 07:10:06 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e1e528399sm50013251cf.6.2024.05.16.07.10.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 07:10:05 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-43e14f0bd75so848201cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 07:10:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVKCXLzBs92mgq/BObj2GG8Et5b3uFKCrbQKkPOw0zZ5OV9f81ggl2Uno3lmOFjwi6baWA5HJy0hLfqjWkYsZ/s94v9m8xUhfWlSRTTDV6A
X-Received: by 2002:a05:622a:a14:b0:43b:6b6:8cad with SMTP id
 d75a77b69052e-43e094b2023mr16912951cf.10.1715868603433; Thu, 16 May 2024
 07:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240515014643.2715010-1-yangcong5@huaqin.corp-partner.google.com>
 <20240515014643.2715010-4-yangcong5@huaqin.corp-partner.google.com>
 <0fcdb0ac-2e4a-44b2-a5d6-a67a1d747df8@linaro.org>
 <CAD=FV=XkBkQUN-93eQDKZcw_66uSeNBBhbiq2hRLcFN+Ck71RQ@mail.gmail.com>
 <CAHwB_N+foZpCjqUy0dJdS2wBbUjHVRQQP0p7S_eTG1Yrh0bgPw@mail.gmail.com>
 <7b488473-7fd1-4f4f-8c32-72e84420b478@linaro.org>
 <CAD=FV=W6mkTwAp6qMVYbPFDYBroAW19-qgvct1dw11ksaW3cYw@mail.gmail.com>
In-Reply-To: <CAD=FV=W6mkTwAp6qMVYbPFDYBroAW19-qgvct1dw11ksaW3cYw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 May 2024 07:09:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0Gq8mkdbF_94=H=G9k6UwjUa43eaxCjU-vZwMxSg+8g@mail.gmail.com>
Message-ID: <CAD=FV=W0Gq8mkdbF_94=H=G9k6UwjUa43eaxCjU-vZwMxSg+8g@mail.gmail.com>
Subject: Re: [v7 3/7] arm64: defconfig: Enable HIMAX_HX83102 panel
To: neil.armstrong@linaro.org, Arnd Bergmann <arnd@arndb.de>
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

On Thu, May 16, 2024 at 6:43=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Wed, May 15, 2024 at 11:55=E2=80=AFPM <neil.armstrong@linaro.org> wrot=
e:
> >
> > On 16/05/2024 08:43, cong yang wrote:
> > > Hi:
> > >
> > > If it is determined that a separately patch needs to be sent, then I
> > > will remove this patch in V8 series?
> > >
> > > Doug Anderson <dianders@chromium.org> =E4=BA=8E2024=E5=B9=B45=E6=9C=
=8816=E6=97=A5=E5=91=A8=E5=9B=9B 05:28=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > >>
> > >> Hi,
> > >>
> > >> On Wed, May 15, 2024 at 2:16=E2=80=AFPM <neil.armstrong@linaro.org> =
wrote:
> > >>>
> > >>> Hi,
> > >>>
> > >>> On 15/05/2024 03:46, Cong Yang wrote:
> > >>>> DRM_PANEL_HIMAX_HX83102 is being split out from DRM_PANEL_BOE_TV10=
1WUM_NL6.
> > >>>> Since the arm64 defconfig had the BOE panel driver enabled, let's =
also
> > >>>> enable the himax driver.
> > >>>>
> > >>>> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com=
>
> > >>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >>>> ---
> > >>>>    arch/arm64/configs/defconfig | 1 +
> > >>>>    1 file changed, 1 insertion(+)
> > >>>>
> > >>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/def=
config
> > >>>> index 2c30d617e180..687c86ddaece 100644
> > >>>> --- a/arch/arm64/configs/defconfig
> > >>>> +++ b/arch/arm64/configs/defconfig
> > >>>> @@ -864,6 +864,7 @@ CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=3Dm
> > >>>>    CONFIG_DRM_PANEL_LVDS=3Dm
> > >>>>    CONFIG_DRM_PANEL_SIMPLE=3Dm
> > >>>>    CONFIG_DRM_PANEL_EDP=3Dm
> > >>>> +CONFIG_DRM_PANEL_HIMAX_HX83102=3Dm
> > >>>>    CONFIG_DRM_PANEL_ILITEK_ILI9882T=3Dm
> > >>>>    CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=3Dm
> > >>>>    CONFIG_DRM_PANEL_RAYDIUM_RM67191=3Dm
> > >>>
> > >>> You should probably sent this one separately since only an ARM SoC =
maintainer
> > >>> can apply this, probably via the qcom tree.
> > >>
> > >> Really? I always kinda figured that this was a bit like MAINTAINERS
> > >> where it can come through a bunch of different trees. Certainly I've
> > >> landed changes to it before through the drm-misc tree. If that was
> > >> wrong then I'll certainly stop doing it, of course.
> >
> > Yeah we usually don't mess with arch specific defconfig from drm tree
>
> In general I agree that makes sense. In this case, though, the new
> config symbol was introduced in the previous patch and split off an
> existing symbol. Updating "all" of the configs (AKA just arm64) that
> had the old symbol to also have the new symbol seems like the nice
> thing to do and it feels like it makes sense to land in the same tree
> that did the "split" just to cause the least confusion to anyone
> affected.
>
> In any case, if it's going to land in some other tree then I guess the
> question is whether it needs to wait a few revisions to land there or
> if it should land right away. Nobody would get a compile error if it
> landed in a different tree right away since unknown config symbols are
> silently ignored, but it feels a little weird to me.
>
> ...of course, I'm also OK just dropping the config patch. I personally
> don't use the upstream "defconfig". It just seemed courteous to update
> it for those who do.

Hmmm, probably should have put Arnd on this thread. Added now in case
he has any opinions. I also did manage to find when this last came up
where I was involved. At that time Will Deacon (who get_maintainer.pl
reports is the official maintainer of this file) said [1]:

> But yes, although there are a few things I really care about
> in defconfig (e.g. things like page size!), generally speaking we don't
> need to Ack everything that changes in there.

[1] https://lore.kernel.org/linux-arm-kernel/20201112004130.17290-1-diander=
s@chromium.org/T/
