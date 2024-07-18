Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08F4934F4F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 16:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A6810E7EB;
	Thu, 18 Jul 2024 14:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="oEBk7gG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E439B10E7EB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 14:46:17 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-79f16c85da0so26490885a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 07:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721313975; x=1721918775;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ItEYfyU78HUDQ4/9fhXGu8NLyqmW1vdphw7TfYOCTU0=;
 b=oEBk7gG2ocyIdVxrO6tQftPEtscUhE0NosSQptb8ZN1A76agPqlk6d3PyXqVXeaHvT
 D5i6R9Rxcd03tJst6ft1WVnTajaVmhi0T5nSXMBsJ5mdKOVulwWnLu2uNa5+4NwGdX52
 DX3boSrfkHBV8SW/36fEOiQAHDcVUBhRkBicg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721313975; x=1721918775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ItEYfyU78HUDQ4/9fhXGu8NLyqmW1vdphw7TfYOCTU0=;
 b=A/Gfdr0gndoJPeKfReb9sNr6XML60vMtfh92HlCRzXSCiEGXiKWRJHX0jPYESbfChj
 Dm4O1MtJrhdjsKGfTgneEku/Wcs3zAOcU3ggqwXsAgCoBoHJd6Hwv9nFltreDbxsNjDF
 o0169w3dIN+GiXvkDxN0T6e9dMRL995OI5O04DQPw7NzJbPeS8vQ5cFTWJ0PjpPEOufW
 adiDqXIHwtyHCzbMQLqVl3/AM3ZegbC0PXE2sGGqQ+LxuVcQhBZCoxYCwKObfDxz6/Xl
 NSoAI5ydTVKgQIapl/l9ZHkPAdAY4C7c9W/xGYRXdC4nmvSUo7/sSUvn+GgZKXbb0fOr
 p++w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmKcEbzPdGYIig99VrRWxw4BX+yiCCy6Hbfw/yn/H/s/I+GUmT0QyBstvkPePIo4rAJ4J8zaJGVTK/1cRCZfi9xPH6Q744hn400ni2K92r
X-Gm-Message-State: AOJu0Ywh9ojQ4hsCDjG73WXxBWsbCwtVKCduTBis3khgaaLMWDhcszQZ
 N/DRnBqa21RNSF/6LTBR1REHA6fZgAe7Mm4RTXc3uJ41BqJ4j+1mgG6jC6UGZKDa1hbGCzE6sc4
 =
X-Google-Smtp-Source: AGHT+IHjVOL5dFa0pgmtXmbfipuRtxIFs7TF4D3opsoa+mV9Jqw0umLFYFK6VR5nXzcuhGPVzYC0NA==
X-Received: by 2002:a05:620a:1998:b0:7a1:44ce:649 with SMTP id
 af79cd13be357-7a193990138mr121279185a.67.1721313975291; 
 Thu, 18 Jul 2024 07:46:15 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a19396d3b4sm31119085a.112.2024.07.18.07.46.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 07:46:14 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-44e534a1fbeso105681cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 07:46:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4CNPEdcr5FLLd9TduL8FHqspPR9CHYU9I2AGPfAjeLzHeN1yRYfn/KuofELRvQCXzaYnA0F0Ex7P8VggxL4fzxaS3D8c1X1NntzEcl+h+
X-Received: by 2002:ac8:6d08:0:b0:447:e792:c797 with SMTP id
 d75a77b69052e-44f96af537emr962911cf.29.1721313973898; Thu, 18 Jul 2024
 07:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud>
 <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
 <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
In-Reply-To: <e017259b-bc62-4b57-9276-b834237225e1@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 07:45:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
Message-ID: <CAD=FV=VY5Ug3TfUo1RctiVQrHUjuod15HA8BxAyWdd_0bK8_Dw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
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

On Wed, Jul 17, 2024 at 11:19=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 18/07/2024 02:21, Doug Anderson wrote:
> > Conor (and/or) Krzysztof and Rob,
> >
> > On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> >>
> >> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> >>> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backligh=
t
> >>> control over the DP AUX channel. While it works almost correctly with=
 the
> >>> generic "edp-panel" compatible, the backlight needs special handling =
to
> >>> work correctly. It is similar to the existing ATNA33XC20 panel, just =
with
> >>> a larger resolution and size.
> >>>
> >>> Add a new "samsung,atna45af01" compatible to describe this panel in t=
he DT.
> >>> Use the existing "samsung,atna33xc20" as fallback compatible since ex=
isting
> >>> drivers should work as-is, given that resolution and size are discove=
rable
> >>> through the eDP link.
> >>>
> >>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> >>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Can you comment on whether you would consider this bindings a "Fix"
> > since it's a dependency for later patches in this series (which are
> > "Fix"es) to pass dtbs_check? See:
> >
> > https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.o=
rg
>
> The patch itself is not a fix, for sure, but it might be a dependency of
> a fix (which you wrote above), thus could be pulled to stable as a
> dependency.
>
> I do not care about dtbs_check warnings in stable kernels, mostly
> because dtbs_check warnings depend heavily on dtschema and dtschema
> follows mainline kernel. Basically if you had warnings-free v6.8 but try
> to run dtbs_check now with latest dtschema, your results will differ.
>
> At some point in the future, I could imagine "no new dtbs_check warnings
> in stable kernels" requirement or at least preference, but so far I
> don't think there is any benefit.

In this case it's not about whether it makes it to the stable kernel
but about which main kernel it goes through.

If we land the bindings in drm-misc-next right now then it'll be a
long time before it makes it into Linus's tree because of the way that
drm-misc-next merges. It will make it to Linus's tree at 6.12. You can
see the drm-misc merging strategy at:

https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html

If we land the dts change (a fix) through the Qualcomm tree as a fix
then it should target 6.11.

This means that the 6.11 tree will have a dtbs_check error because it
has the dts change (a fix) but not the bindings change (not a fix).

One way to resolve this would be to treat this bindings as a "fix" and
land it through "drm-misc-fixes". That would make the bindings and
device tree change meet up in Linux 6.11.

Did I get that all correct?

-Doug
