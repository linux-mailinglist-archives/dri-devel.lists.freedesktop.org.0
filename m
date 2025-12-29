Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43022CE6B89
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 13:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AD210E446;
	Mon, 29 Dec 2025 12:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lRTMVPBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E0510E447
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:38:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8CFBB44499
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52264C2BCB9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767011884;
 bh=rox7wvPh07+CLjjqPOBWQGkUlh+Gyo2uugHFZB5z0+s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lRTMVPBZDgcRwddGpzXgSGPzbz9RrE5n1iRQoOMioKMSCPyzyYX+7+3flfBtxtXDK
 dGvZoQ9kL4D68Vkb6jdaGrDuy5Z8dwHBxk4HHH1kVtuJrk6PFXuXssUvu36mETVGuK
 DOIApZ2r37rOrOh/JOokPGNoA52q9swj7IrOoxDsC+ExurzmULUUyP9S0e8aPpQU0h
 ZlMRIzgi/Qfg81ZCHrR1hUOC7mFdOmcb6FMI88S+DK6tmG/YIuW9Mfl2xdDNmxkRwj
 mg8M3Sk6rDjSjImPFQsmP4PicvLD3Jph7YoKMb3I40Ba1EFHlRgLoWH3j3cfGx5X+S
 AXgrM9Ri+6HwA==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-78a712cfbc0so82248277b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 04:38:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWNc09tkKScDhOeYyvGAc7HW9dfwuOrb7T+dwJV+4cBH02Lq9jTz00ynHBvbiqInO7dCykK2scxS+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0Z2V7qPpQkle/98ulDiMFyt2xn2uwcFcBmspspuv7vNHnvxtG
 TuszOqAOykRjIJAqakAut9A6aRtlkLakPvEZoq2GUQ5ni09hHVBAIt5j4oneftAXIRwtk9TfDxs
 JZ8PAflVOexfHO/uD4kFcZG88OOta5Ao=
X-Google-Smtp-Source: AGHT+IFsGOCuav1GJIi4G3BawSBpJOo6IwnfMUXLRMGmh8VUt++5hT+HtT5U+iVEJ9F2VpETfK2+Gh1JdS0tq7MWKRo=
X-Received: by 2002:a05:690e:3cd:b0:644:4f94:c530 with SMTP id
 956f58d0204a3-6466a84b02amr17388010d50.39.1767011883475; Mon, 29 Dec 2025
 04:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
 <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
 <aU6QxjOphoq9E1pL@SoMainline.org>
 <CAD++jL=HDRAcwDVUeYUKFbamqVnOADqz5qpbSr1XVsr3M1iNoQ@mail.gmail.com>
 <aVJpbJEymWWQLK6O@SoMainline.org>
In-Reply-To: <aVJpbJEymWWQLK6O@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 29 Dec 2025 13:37:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLkb7my6Dt4CkqRjKZAMM6iT8YvzHZb67TRLt1jOEU0qdg@mail.gmail.com>
X-Gm-Features: AQt7F2oGDXnIlk3K166SE_nBg82Dd1snbA2UqjpF4XmEvLq6o1P2w_E42qJ58c4
Message-ID: <CAD++jLkb7my6Dt4CkqRjKZAMM6iT8YvzHZb67TRLt1jOEU0qdg@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
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

On Mon, Dec 29, 2025 at 12:53=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> > Yes that's what I suspect.
>
> Do you still want me to drop it from the compatible, but definitely keep =
it in
> the driver filename unless we unify all of the drivers (hopefully in a la=
ter
> patch)?

The compatible should be as precise as possible, so indicate the
assembled display with display controller, typically
samsung,ams605dk01 etc, then the Linux driver is basically
a Linux intrinsic matter, but we would name that after the display
controller so as to make the basis of code sharing obvious between
the compatibles.

> > > Also, divergence of the driver commands got significant with the last=
 two panels
> > > / three phones, though that might be down to vendor configuration/cal=
ibration.
> >
> > That's kind of normal. The defaults suffice for a while, then engineers
> > want to start poking at different voltages to the display to improve
> > and tweak things.
>
> Makes one wonder if the changes are down to the panel used, or vendor tun=
ing
> when they started using these panels in their phones.  To note, I think I=
 booted
> all these phones on the "original" SOFEF01 driver without problems, befor=
e
> ultimately implementing all diverging commands because I don't know if th=
ey're
> defaults, related to color tuning, timings, thermals, manufacturer tolera=
nces or
> anything else.

Yeah a datasheet would really help :/

Samsung, if you're reading this, you know what to do: give us the
datasheets, pretty please with sugar on top.

Yours,
Linus Walleij
