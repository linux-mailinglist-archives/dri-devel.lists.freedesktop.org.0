Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6871D9CEAB4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B640A10E874;
	Fri, 15 Nov 2024 15:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BQTbBFiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB6D10E874;
 Fri, 15 Nov 2024 15:10:26 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53d8c08cfc4so1729357e87.3; 
 Fri, 15 Nov 2024 07:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731683425; x=1732288225; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUVjcB0sOga4/HfM/3eh0FFL6nDbEVfse0QAH2YWS2s=;
 b=BQTbBFiMnXrdqyUU8ZjEXmgpr9/motOOVg5Iep5I31GM5/Rpc8bUARiKlqmHfaSMkE
 1UsvGTjEHCVtEq0l4D1AKpIbsrroAN3huJ2p0oBKwKcGH7GpBybmyaRvEZ/b1W/AxG24
 4g3tgMw0KPTeatrF+fyzS+5uqy3DT2Q/dzCwjYRV8tKRaKssA0BdG6xL+inrCTfwl+1y
 9Lg1DYjMEDwa+2LHyzaNanJ2FgqDosGMeDJvWSve2ACtVavGJlo207LFUXV42s5fp82k
 k8tPjTRARopVnGOsRhLg3ME+WDZoR0T1x64USQRKC4bC3ycGz4VbUnACuv20NWNej46r
 PRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731683425; x=1732288225;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aUVjcB0sOga4/HfM/3eh0FFL6nDbEVfse0QAH2YWS2s=;
 b=XeyXbriiXhMif8DB1sWOhzzedcgnWZgeXW7qP7yfVUX4dc/xYQzYj69WGL+XJ62ghh
 mDdrgAVBF/IyGUEc7sM3mVplC0M6ZDFEcgt5m1qW7MZBCUwXRQv3A60RM7+EYtN32hCC
 hBOsEOErCj0l0FukkQsPdef0oPwLE2FU/XTVBigCBdgWN9yD5R8SX5lmSD+ubBsjmOq7
 q8lY8W8OxYB0Zf902NEd2qAxowge5Knrca6ZWDrV4yZqqdvw1V/6Qk6zt5w/oaoRwp3n
 C/3CHYjdl0UH7siF8AxHTzp2U5+HxHHuDpoOuQdvPeQdLkm1lVZaGMCANtCXhJRl5rfR
 pnCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmJbg9v/k8WtgmFgbs7xAsJ/l9wJ98sI/CR1gr8ryUrwV0Dj23+TAKbiG7iUn9yZQTYPrXmzq3oXjm@lists.freedesktop.org,
 AJvYcCVqTN6n+fEZyaRP2fDtTC8zcRm2mxc8KVyo8TkRvBy/0Ud8LFMlWtwOnI6fLtqZBuNCC4UnCFD/Tuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXbUPYe5kyKC75Mbo1vQtKuAhg4hmWX55DoX97y3zKQM8V2JJ5
 KwRyQGwm4EYWZRLV8repstl5cmWfOtlAH3QTsc+qUfBaeJKcHknQBhZOBiyBSL1py+CroPb8RcG
 Coss+h9pg/sz3ieVPmyss3HTwBWk=
X-Google-Smtp-Source: AGHT+IFSKvpcyw2QBM31REHWotzjXsDEflFMRHu0OtabMrDtzWscE1nvK6FbR8cj0/dESTLG8Of/bCGbaYf8tMdXAx8=
X-Received: by 2002:a05:6512:1190:b0:53d:a024:ddb2 with SMTP id
 2adb3069b0e04-53dab2a076amr1380484e87.24.1731683424294; Fri, 15 Nov 2024
 07:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-2-3b8d39737a9b@linaro.org>
 <sgz4h6rlmekiwypaisjbnej326wv4vaqt3mgspp4fs4tg3mdfx@cwmdqcu6gwbf>
 <63a2b391-8b71-41cb-bed2-3bc7fd2154ab@linaro.org>
 <CAA8EJpoFm8EjfBq70RTPtwR7Y7Rm24kHO20NukGiLGRYD0p9Tg@mail.gmail.com>
In-Reply-To: <CAA8EJpoFm8EjfBq70RTPtwR7Y7Rm24kHO20NukGiLGRYD0p9Tg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 15 Nov 2024 07:10:09 -0800
Message-ID: <CAF6AEGty1fcA13rDOOJQbhT4o=CTtBYtGFspowZbxD1c-VE9Bw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/8] drm/msm: adreno: add GMU_BW_VOTE quirk
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: neil.armstrong@linaro.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Fri, Nov 15, 2024 at 6:18=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 15 Nov 2024 at 11:21, Neil Armstrong <neil.armstrong@linaro.org> =
wrote:
> >
> > On 15/11/2024 08:07, Dmitry Baryshkov wrote:
> > > On Wed, Nov 13, 2024 at 04:48:28PM +0100, Neil Armstrong wrote:
> > >> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidt=
h
> > >> along the Frequency and Power Domain level, but by default we leave =
the
> > >> OPP core vote for the interconnect ddr path.
> > >>
> > >> While scaling via the interconnect path was sufficient, newer GPUs
> > >> like the A750 requires specific vote paremeters and bandwidth to
> > >> achieve full functionality.
> > >>
> > >> Add a new Quirk enabling DDR Bandwidth vote via GMU.
> > >
> > > Please describe, why this is defined as a quirk rather than a proper
> > > platform-level property. From my experience with 6xx and 7xx, all the
> > > platforms need to send some kind of BW data to the GMU.
> >
> > Well APRIV, CACHED_COHERENT & PREEMPTION are HW features, why this can'=
t be part of this ?
> >
> > Perhaps the "quirks" bitfield should be features instead ?
>
> Sounds like that.

But LMLOADKILL_DISABLE and TWO_PASS_USE_WFI are quirks.. so it is kind
of a mix of quirks and features.  So meh

BR,
-R

>
> --
> With best wishes
> Dmitry
