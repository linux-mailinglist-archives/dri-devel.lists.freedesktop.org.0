Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2392496969B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766CF10E43B;
	Tue,  3 Sep 2024 08:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LBGaXTAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B7E10E43A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:11:36 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-534366c1aa2so5189593e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725351094; x=1725955894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oK2N716Wf5zWuyGseX+K7OxwDsTjJt4KWsutUjuIEwg=;
 b=LBGaXTAWpyhH6Tw1+uhQh6ngaAZcjA0Wmt9CCxkIFXptO2hKqMYGHMavPQQksqsohe
 7tVUjMljdh5XGmYiawl9DFhSkAcF1Uo5XxxTrmJUeVJurXcmLJTP1xqKGfTZMlqjp3sp
 KYcFV6tUKZFBtFTdjDUHfewVgI6pQH2OakruEA2SP9HW5qWrFh1xOkaLnaMLhg2x7tTz
 ftmYhFv7vQPEdbTr9vpSAcwIWR2sl8QLCUgTim6Als1Oc8ECROT0WJPu92KRFUyfP/WU
 JO4JEPHN5dtjNGVRuF0Zjm1H+rO6GQJHBnh7/UN7BuQdcormKbM/pSLTWiLcCjRSsS2k
 EokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725351094; x=1725955894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oK2N716Wf5zWuyGseX+K7OxwDsTjJt4KWsutUjuIEwg=;
 b=LSkebBNG9dlTGR31VYdueGc6R7p4Mvqex3/nbK2djpwin01GdmN8+oqp6k5YxMlhXI
 bBEBhLf2iTl/9DhAgBtsa2L7UtweEKIrWTFBhRbrqkgV+wNSIyfDXnU2aCXcFtz5LKYz
 m+qCHbcWkt+fYjISIZVZMg5IBU5IL58k0SbZwfT6OuaZFPoAd1OqZfV/dZ2mBdHZSMn0
 gh7TGheWUKEC3QgjQpcyfqIAvWnJutfNZT4OyF7xkisAlhaQuAcCVLPHrLaxmnxqQf0N
 VIWizTv9G32Ofzt/4+3ob3fl0Vu8O4pb5a8AO+df+qgikgJXPmj50lK2xPF5nl9Z0VuB
 331Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0U0D0XxR9+mg4hNJ7jQmKV6XCZX7aVuB8RIXVeeFNBcqwd7WcL25BbjO3zIimP4Tat6QIhz3QSxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaQJE+QqmlPQSkuO0pUULemGZheH9E93rsToG4fc/bLrtPQtZ6
 nk7R1DdWvSEDudYAIUENQPHyZDK0kZoi/lssPSqgl3d9xxvvGbsDM7/MdDnfvI0xJAxBEJ3Dbkl
 /BLWhDe42DXvNew1jp4VYEylCU+SAhOkzvFdydw==
X-Google-Smtp-Source: AGHT+IFA+v/Lw2VM8YBLUxDrbigDTMftuBsPCXYDExzuRQnypmgUTiFnyFUrx8r3ouJS7IWB+TH+Av+oI+GuAY+0oHc=
X-Received: by 2002:a05:6512:1044:b0:52c:9e25:978d with SMTP id
 2adb3069b0e04-53546b691afmr8245078e87.45.1725351093898; Tue, 03 Sep 2024
 01:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
 <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
In-Reply-To: <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 16:11:22 +0800
Message-ID: <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Add support to DSI CTRL v2.8.0 with priority support
>
> Proper description is missing

Actually, there is no clear doc for this register. Any URL or
doc key word to search?
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> Several tags are missing here.

Co-develop and SoB tag, right?
>
> Also, how is this patch related to quadpipe?

It is a must per test. Maybe it is just related to dual-DSI.
We can have answer if 2:2:2 is enabled.

- Jun
