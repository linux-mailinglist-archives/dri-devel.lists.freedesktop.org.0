Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486279391FF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 17:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3242F10E071;
	Mon, 22 Jul 2024 15:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="LJDzoWf+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B582A10E071
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 15:45:18 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id
 46e09a7af769-7035c367c4cso2444984a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721663118; x=1722267918;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BDPtwwC5v8WJk5FRYY3avsIqqV6M4bWCFDqVrNinJ34=;
 b=LJDzoWf+ztWQsrNgf48ibMgrrCNaDt2/M9wq5H6s8B4BvZjgMVbBdv2CHl08riEPtk
 Le+9ea+JqTyUqBqZvb347uC+QZ4ATrqP3OxGYp17lmGwH/Gg876hALbbMXAbyR951bvl
 Kjy+nZsgkr3CFuK2WjEQp611W9uXePQAYOXSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721663118; x=1722267918;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDPtwwC5v8WJk5FRYY3avsIqqV6M4bWCFDqVrNinJ34=;
 b=UbK6bwVEgrp2xHtLRTxmJ97/63VU8spqDQ7Qhcj6x1nZOWAO218YoCHz9iydJ1RjWG
 U0fSRPXVEaPuoXRHm4LpElFuRGcRbmIP5446CGkTTwdBKwY/x5yJ695G/Bys1LLTPCVn
 MpyV8ok4i6aH3eWmtTYwj/o4IrjkuFKrDZd3nQxMiXgQf4qb173JfBZPCo1HdvYV2CsN
 VqBzR5XhnGNlqD+XMK9fgnhHWtMmmgsAWDPZPR5pjvuNRQRdltqJ5n6Jd0CA6l1pcUFS
 VKMFviWpenwLPYPtX00lzWugF2zi0jzXhDWHYtIhK0dF7cQs/RyME8wUlhgdsrLuayWV
 mvPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzGXXHQJfL2tr/Om5n5SQGVOQ8HycSAt6fGhMjlQxA3Vr9I+pdQfPepp3GCTz3RqaBB9V7mNgOqnOGTaIRJ4RAQzfXL72MNnmSlfVI4fl0
X-Gm-Message-State: AOJu0Yx/osa8iKKdI+ztRdNv805+cf22nBJr665ShA7QUkWGyYxnv2f+
 m5uQ2KP8eHMXmTJjo9kM+CXR6ehXF8Z/SQ7K5O7cIsAaUaNLIhdJk6cqPo3hn4aoRBJ+7rSGyxh
 zLg==
X-Google-Smtp-Source: AGHT+IEKpxlx3WEMK6zSdOQmbKCVLPKNyQyhWdxN8wolAkL/EbzTxClYcVSAh/Z1ceHSe5taoz6vJA==
X-Received: by 2002:a05:6830:6f81:b0:704:46da:5fa0 with SMTP id
 46e09a7af769-709008fb3cdmr10898292a34.10.1721663117755; 
 Mon, 22 Jul 2024 08:45:17 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com.
 [209.85.160.171]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44f9cd04062sm34614721cf.40.2024.07.22.08.45.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 08:45:17 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-447df43324fso891341cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:45:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUYt+5UyK6OLwIoITOGM6WDfG+UKXAnLDR0CPOag0roS9cOtQOMF2my6NKu8pfyjMLhotuoZXAc4fsb6YnPCtItmZrL7iziBlPKARaErNWg
X-Received: by 2002:ac8:5f46:0:b0:447:f44d:d0ed with SMTP id
 d75a77b69052e-44faa973763mr4370471cf.1.1721663116858; Mon, 22 Jul 2024
 08:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud>
 <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
 <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
 <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
 <20240718-frightful-naturist-a049ea7c0548@spud>
 <CAD=FV=VaGXMf6Srix6v=Me35BUN4B6ZHwebycka4Dbavqa5Vbw@mail.gmail.com>
 <CAD=FV=WyDF8LkPeHXTgsyDA74n+AjuHPQ1896ECDE17aYB9rtg@mail.gmail.com>
In-Reply-To: <CAD=FV=WyDF8LkPeHXTgsyDA74n+AjuHPQ1896ECDE17aYB9rtg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Jul 2024 08:45:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQRt2yVL4KZ0W3LWL2wybvL89NDb64fizMe42_vu=+7w@mail.gmail.com>
Message-ID: <CAD=FV=WQRt2yVL4KZ0W3LWL2wybvL89NDb64fizMe42_vu=+7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
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

On Fri, Jul 19, 2024 at 10:07=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Thu, Jul 18, 2024 at 7:59=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Thu, Jul 18, 2024 at 7:56=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Thu, Jul 18, 2024 at 07:45:57AM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > > > >
> > > > > On 18/07/2024 02:21, Doug Anderson wrote:
> > > > > > Conor (and/or) Krzysztof and Rob,
> > > > > >
> > > > > > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@ker=
nel.org> wrote:
> > > > > >>
> > > > > >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrot=
e:
> > > > > >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has =
backlight
> > > > > >>> control over the DP AUX channel. While it works almost correc=
tly with the
> > > > > >>> generic "edp-panel" compatible, the backlight needs special h=
andling to
> > > > > >>> work correctly. It is similar to the existing ATNA33XC20 pane=
l, just with
> > > > > >>> a larger resolution and size.
> > > > > >>>
> > > > > >>> Add a new "samsung,atna45af01" compatible to describe this pa=
nel in the DT.
> > > > > >>> Use the existing "samsung,atna33xc20" as fallback compatible =
since existing
> > > > > >>> drivers should work as-is, given that resolution and size are=
 discoverable
> > > > > >>> through the eDP link.
> > > > > >>>
> > > > > >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > > >>
> > > > > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > >
> > > > > > Can you comment on whether you would consider this bindings a "=
Fix"
> > > > > > since it's a dependency for later patches in this series (which=
 are
> > > > > > "Fix"es) to pass dtbs_check? See:
> > > > > >
> > > > > > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@=
linaro.org
> > > > >
> > > > > The patch itself is not a fix, for sure, but it might be a depend=
ency of
> > > > > a fix (which you wrote above), thus could be pulled to stable as =
a
> > > > > dependency.
> > > > >
> > > > > I do not care about dtbs_check warnings in stable kernels, mostly
> > > > > because dtbs_check warnings depend heavily on dtschema and dtsche=
ma
> > > > > follows mainline kernel. Basically if you had warnings-free v6.8 =
but try
> > > > > to run dtbs_check now with latest dtschema, your results will dif=
fer.
> > > > >
> > > > > At some point in the future, I could imagine "no new dtbs_check w=
arnings
> > > > > in stable kernels" requirement or at least preference, but so far=
 I
> > > > > don't think there is any benefit.
> > > >
> > > > In this case it's not about whether it makes it to the stable kerne=
l
> > > > but about which main kernel it goes through.
> > > >
> > > > If we land the bindings in drm-misc-next right now then it'll be a
> > > > long time before it makes it into Linus's tree because of the way t=
hat
> > > > drm-misc-next merges. It will make it to Linus's tree at 6.12. You =
can
> > > > see the drm-misc merging strategy at:
> > > >
> > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> > > >
> > > > If we land the dts change (a fix) through the Qualcomm tree as a fi=
x
> > > > then it should target 6.11.
> > > >
> > > > This means that the 6.11 tree will have a dtbs_check error because =
it
> > > > has the dts change (a fix) but not the bindings change (not a fix).
> > > >
> > > > One way to resolve this would be to treat this bindings as a "fix" =
and
> > > > land it through "drm-misc-fixes". That would make the bindings and
> > > > device tree change meet up in Linux 6.11.
> > > >
> > > > Did I get that all correct?
> > >
> > > Is not not fairly established that a dependency for a fix can go onto=
 a
> > > fixes branch even if it is not a fix in and of itself?
> >
> > That would certainly be my take on it, but DT folks confirmation was
> > requested by Neil in:
> >
> > https://lore.kernel.org/all/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro=
.org/
>
> FWIW, I'd rather not let this stagnate too long. I'm fairly confident
> in my assertion that this should go into drm-misc-fixes. I'll give it
> until Monday and then I'm just going to land this bindings change in
> drm-misc-fixes. Shout soon if you feel strongly that I shouldn't do
> this. If someone wants to flame me after the fact then so be it.

Landed in drm-misc-next fixes as per the flow chart [1] since the
"samsung,atna33xc20.yaml" split from "panel-simple.yaml" is in
mainline linux but not in any "rc" candidates yet.

[1/4] dt-bindings: display: panel: samsung,atna33xc20: Document ATNA45AF01
      commit: b6f7d984ebf826069d3dc6fa187b4d1cfb90f965

[1] https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.h=
tml#where-do-i-apply-my-patch

-Doug
