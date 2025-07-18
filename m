Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B03B0AA1D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 20:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39D210E012;
	Fri, 18 Jul 2025 18:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYU0MQJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B0610E012;
 Fri, 18 Jul 2025 18:26:37 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-612a8e6f675so3450930a12.3; 
 Fri, 18 Jul 2025 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752863196; x=1753467996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdHUOW5vj3zq8m63yOQTUFaQxpwM82ALHsQENfQNICI=;
 b=cYU0MQJ4uFAxcg2Rk2kBkos7Q8jZhdAcIGrrfvRgGVdoZi5uUc41AsBZpJvlTno5k6
 FSDK6dzJli9OyJ1gcP+JfJhX0SykGpJsc6XexBYxhrp1Zqq9/oS66WOVErbZSLFYYdsF
 SSE3Ao4C+XHRFHYvIY54oharu3q19hVGHVUAoP9ka0BUDCc4wkaaP9mZ451M8F/hcobn
 qL5LsFbEP+5Im/833ndk+DsnnsY2Hf0q1oK6l0HXcXsnRvHX1heSpGS0ds2KqDdrTgtO
 CMfihy7LnTSE8jNqxTU28fytMaVGmKK46VaLHvHgpsnfQUSbSQ7/+jtYQzX3/vEkH3iF
 Cojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752863196; x=1753467996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdHUOW5vj3zq8m63yOQTUFaQxpwM82ALHsQENfQNICI=;
 b=CLte7VSqCfAicwBlvax0nmf2mYGDnE9YN832IQehdFwZ9j8nahv5XqbYB4A9ye+DAP
 fEWfMv728dSHfH9T3iZrJujwBMe4Iy7glDB+UPZt60mN3Fktmy6tMusSgdbQGpghu3OU
 G4RxkHzDRqNm/6J6aV6t+yMisEln6dupcEzHTDR0wze6gWdKw2sjWsI4YUJkuWW002bw
 CbEITn52fJL1u/bzfloMRoe0wrto97mpctcgpL7PSJoBIMqEzeVr90RQLPslrnH7Ze5o
 Pdw851c/b7ocABQabTsMbs2k67V2sEcn2g8g/tnD1ER7LBSxAHyJQf8qOOgWJ+8rmVc1
 9UgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6QkxZCbjkH911CLr0ThwHg423fxnYh3WjZFj14sdsIR9XELux6lr73vX7Ermk9LBwkt7c4LpFfUuF@lists.freedesktop.org,
 AJvYcCWKEtL8iW7erXEcukZgEOCOZqCE7BzUIQ+hBbbKeTrFRoafq7iLjuYNltkxKqRTtSl42DLjuPCDztE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKVzITYV8bep9/WuvhEMfuD/s75V89G1jIAyU4PxxK2Be3rta0
 pobLMZJMCPeMIfgilqrBqtRZj94NnXaXK700h4FYgEdUJ4CMVE58z0zhcT1NgffWsIiFHBDUhJa
 4kADX7PFmmwWnAmKwR2E4s1FZ+JeTMw==
X-Gm-Gg: ASbGncuaVNRCPXkQ4JaEP+sOn9j424yCubND06EpnINpJSv95D//Q1A4PXkl16/YRtG
 9jOTs+ze8BEYVFM2eSPP8mlkOrGidhjJuEMN88WjBVNls1jbhQ1Iei2BQTj+96ROVNtxJgwgLHQ
 SpIjOaWrrd+3mNlGvPHOR0FGRouhM43D99jj1zWF0ICx+aprX7s9POf2j61Pzu+2GVb60qyTVKr
 6e7DlqecPrIVvOOXwKLAJfCEwArBaitYitvjMPx1K9mzmpbyw==
X-Google-Smtp-Source: AGHT+IHC3HLRJsvkFkVqSZ46AEBeJChjVPKxTA/BcSmvLs7WHhxz2lrBATceKFfQkZ14s/5J0Opa/ATwK9R+q41RVsY=
X-Received: by 2002:a05:6402:13c8:b0:612:b67f:d511 with SMTP id
 4fb4d7f45d1cf-612b67fd68amr5613405a12.0.1752863196347; Fri, 18 Jul 2025
 11:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
 <A9DB4AE061FD8BB9+3519a519-1a29-49c1-a07d-28a0577677cc@radxa.com>
 <CA+kEDGGaKrYO9Pu3un_Nq_6AOZC5L9sG+CEwh2ZEzWFeHGqtEA@mail.gmail.com>
 <eb0f5be5-3a6f-4969-affd-c01a6216ad0c@oss.qualcomm.com>
 <CA+kEDGE1kb12pW_OH1n4LmB9PVtgEsft563p9Cx_Mxev9Em3Ow@mail.gmail.com>
 <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
In-Reply-To: <jsynzhzzt4drqcrvbuprjnvu33go4gow3l3hxgafuczdn67uhm@2eq7c5rzflr5>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Fri, 18 Jul 2025 20:26:03 +0200
X-Gm-Features: Ac12FXw0jZDgjQifi0YDj_QD-wc9Vi5La0gySlLng6GYLLcXHYW4aWUZXrUKCds
Message-ID: <CA+kEDGGVimBZDq1sa0gOXB7Vi6U8AVgD2E8mG_iTUJDce=56PA@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>,
 Dale Whinham <daleyo@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Friday, Jul 18, 2025, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Jul 17, 2025 at 11:36:38PM +0200, J=C3=A9r=C3=B4me de Bretagne wr=
ote:
> > Le jeu. 17 juil. 2025 =C3=A0 23:10, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> a =C3=A9crit :
> > >
> > > On 7/17/25 10:27 PM, J=C3=A9r=C3=B4me de Bretagne wrote:
> > > > On 2025/7/17 04:21, Xilin Wu <sophon@radxa.com> wrote :
> > > >>
> > > >> On 2025/7/15 01:35:42, Dale Whinham wrote:
> > > >>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> > > >>>
> > > >>> The OLED display in the Surface Pro 11 reports a maximum link rat=
e of
> > > >>> zero in its DPCD, causing it to fail to probe correctly.
> > > >>>
> > > >>> The Surface Pro 11's DSDT table contains some XML with an
> > > >>> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1=
E
> > > >>> (8.1Gbps/HBR3).
> > > >>>
> > > >>> Add a quirk to conditionally override the max link rate if its va=
lue
> > > >>> is zero specifically for this model.
> > > >>>
> > > >>> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gm=
ail.com>
> > > >>> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> > > >>> ---
> > > >>>   drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
> > > >>>   1 file changed, 13 insertions(+)
> > > >>>
>
> [...]
>
> >
> > > >
> > > > Is it a feature planned in the short-medium term within the MSM dri=
ver?
> > > > If not, would a quirk like [4] be acceptable upstream in the meanwh=
ile?
> > >
> > > I'm not a display guy, but this looks like yet another block of code
> > > begging to be commonized across DP drivers,
> >
> > I agree 100% in principle, but the 3 implementations are different toda=
y.
> >
> > > so I wouldn't expect it to be a big blocker.
> >
> > Well, it is for me :)
> >
> > > Adding a panel quirk doesn't seem in order, as the panel is /probably=
/
> > > very much in spec, and it's the driver bit that's missing.
> >
> > I agree that a quirk shouldn't be needed. I guess we'll work on
> > upstreaming everything else and keep an out-of-tree patch for this
> > issue for the moment That's a bit sad as this will block regular
> > users from easily installing / testing via the Ubuntu Concept ISO
> > for instance.
> >
> > Or could the quirk be accepted temporarily with good comments
> > then reverted when the driver adds the missing support? I guess
> > it would depend on the time scale of this support landing.
>
> Unforutunately, there is more than that. We should also be writing the
> LINK_RATE_SET register. So, just setting the max_bw is not enough.

Maybe I've misunderstood. When you say max_bw is not enough,
are you talking about some future driver changes or about a potential
shorter-term fix?

I can confirm that this initial simple patch (and also the updated one
reusing the quirk list [4]) is enough to get the SP11 OLED display
working whereas it doesn't probe and remains off without such a fix.

Thanks,
J=C3=A9r=C3=B4me

[4] https://github.com/JeromeDeBretagne/linux-surface-pro-11/commit/d265cfb
> --
> With best wishes
> Dmitry
