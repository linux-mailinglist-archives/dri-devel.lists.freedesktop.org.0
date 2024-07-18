Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521CD93455A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 02:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DBB10E445;
	Thu, 18 Jul 2024 00:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RjAdpMLa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153E010E445
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 00:21:29 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b5f2ac0fb9so1412616d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 17:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721262085; x=1721866885;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qfZaM8VI9ijVSJOyXMtAz+GFmiwxmMVRmm55/KX47Cw=;
 b=RjAdpMLa0G4GJZPVyWSsOVJmvvA8EKUk7TnMJoGAvsKjXuJdcX5YAClMKgkmstPTzO
 ZUEx9k4O8+xBYyNZCDfef7lTaJw0m/k1g5stYn/U3sxoe6bw7B7RxhHsIg6D4jsNYsfv
 aNZAJKOJfJjeYg2P58VZ/gH1BN0hCPTpMVJHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721262085; x=1721866885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qfZaM8VI9ijVSJOyXMtAz+GFmiwxmMVRmm55/KX47Cw=;
 b=D5SzLVRv/lm6kMC2MHd5NEhyqJQT6Mej7pwGC8krW6RNK8dTbX+/W5LuFMycvndY/t
 eCbygywX9sJAQTAcMC3ZWFl31sdDAhKIiKuemOMFhfl4+YlZesg7/AZ26LT8KMyYG6h/
 ffh80GjJdIlHajVGalaqo2iQfBVEkUfvVScqCB0QOSRz++A0wVhPTYTlH1E0OZvv04eY
 cSpwe7I3h/S3bOZc9aglzc4o4R8Qxh9BAGXNd+DvGvtwsVAX4MfIjjrBxdy+EQm1rtkc
 kMg00ia4Oj2Po3TqHKmdm/lhLawxt2e5w86a8RLlK4awE0tiLmky3xANv8ICbnEqdMyY
 7H3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIXvGBKl4u5GHiHU9PdXt/Y3wTgyrvhtQM/dNpjLSOkzDyFxQvF63xger5v2t8KPAY3KgpyiPfeu27TQFMvfHM2YZZf6xjioMVgkbKt9oN
X-Gm-Message-State: AOJu0YwssiFbGkx7UgwJ83OO3FOlmu2LI6PlLO0oKCktiEyXEnSdblMl
 mEb613XTfAz727+QNuySWzGkx+i/iCVXnmOfa/an3IlwlNYj2Vq7wbK1pQIMRnW7r1xdEJrXquE
 =
X-Google-Smtp-Source: AGHT+IH48iaxlhtOraxnFh5OKhKEM3kx4JUo83+b5gEgfK1tIOWcbY2cIB5r8ISwc4ly9NFZe1WLBQ==
X-Received: by 2002:a05:6214:2aa2:b0:6b7:9a67:64ff with SMTP id
 6a1803df08f44-6b79c64ac1cmr11475656d6.18.1721262084645; 
 Wed, 17 Jul 2024 17:21:24 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com.
 [209.85.160.179]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b79c4d6104sm3440026d6.27.2024.07.17.17.21.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 17:21:24 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-447df43324fso69161cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 17:21:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUNSYCEAH4xJfabpnuA+qiiFcRY2X8YGWBta+FagJwTI5O+iulY5948IJsyx0DIF4/TZpcLM/RkhmQsGaz5vIiZcj4rgs2Dd4caFqPfkFCF
X-Received: by 2002:a05:622a:a70c:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-44f92572a39mr538891cf.29.1721262082740; Wed, 17 Jul 2024
 17:21:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
 <20240715-scorn-canning-a7f23b9e2039@spud>
In-Reply-To: <20240715-scorn-canning-a7f23b9e2039@spud>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 17 Jul 2024 17:21:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
Message-ID: <CAD=FV=U-nOMu-JDQ3T=ZRJ-rZ0BTtyzFVfnzbtCJdbRzAq3YMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
To: Conor Dooley <conor@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Conor (and/or) Krzysztof and Rob,

On Mon, Jul 15, 2024 at 8:31=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Jul 15, 2024 at 02:15:37PM +0200, Stephan Gerhold wrote:
> > The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> > control over the DP AUX channel. While it works almost correctly with t=
he
> > generic "edp-panel" compatible, the backlight needs special handling to
> > work correctly. It is similar to the existing ATNA33XC20 panel, just wi=
th
> > a larger resolution and size.
> >
> > Add a new "samsung,atna45af01" compatible to describe this panel in the=
 DT.
> > Use the existing "samsung,atna33xc20" as fallback compatible since exis=
ting
> > drivers should work as-is, given that resolution and size are discovera=
ble
> > through the eDP link.
> >
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Can you comment on whether you would consider this bindings a "Fix"
since it's a dependency for later patches in this series (which are
"Fix"es) to pass dtbs_check? See:

https://lore.kernel.org/r/4bca316a-2334-425b-87a6-e1bb241d26b5@linaro.org

-Doug
