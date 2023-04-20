Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C86E8B13
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052918924F;
	Thu, 20 Apr 2023 07:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4401A10EB76
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:08:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id c9so4237417ejz.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681974533; x=1684566533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bvojUsR5pwErXxzLqJHjlEXoz6gI0576CmK0oCJxdpc=;
 b=EAo2Ow3XS1RZ8Q6tdvY+KMv4wd4ak0f8BPocMInIOOFHNFIvuNFzOPCuf90+iwfEgQ
 ZHspYHA6cUYNt5Wgy8/DALjenpgaoNsZVVnOeFM4wbnG+KcFyqLnPb4Rhq/O0yweYnl7
 CYMo+WGq2i8VlcfntymZq6LjZZfDAUQbqMNQcVueagYpplsjB/G9itlTHLHsRArA2mzy
 Y7cpIE39ZVutrHQ/bwm3Ya6cScf537u6tSqFC7ssXf6QLH2GRKojshXPUAMFzyF2fG8H
 FwVgOBTnypFAHXr2yXHmpJz+FOoQQeqpZWXF6PzlTiIoWGkYu8toSbCAON6nc2xY+5xS
 5uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681974533; x=1684566533;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bvojUsR5pwErXxzLqJHjlEXoz6gI0576CmK0oCJxdpc=;
 b=BgP1m/rcZZ2avwVqxBDcp01FWfSa8qr/kHL9sHZ/OlIXG/o7gEG7dTOGPd8PUcaOsm
 egyEsKZPQNWFyFP+5mOICuEfwTzBuk1hBbuXsdLi1YLjNXsBUTKNKj9R6Gl0SHNIKrOa
 zpi1IQ6YVW+BArtxCDYljo86wTfJ1o/+iWTrJKLA4dgUDe2yoWd7GIymn+s7l006lP/W
 L8cM3yAAo4BgUUmtCodQLuMSBarLZWp+GyAXwahR9uX3BJbmBWLRDaclbSVrbUiw1xgW
 8vxWM9WAmZHu6J9282Irzh2zGzv/pknumKh3BxBECuv3LoK3x4f+zXuC1/NlO/aQHTwI
 RjpQ==
X-Gm-Message-State: AAQBX9cEKOsOxK+rE4FyLvQjFhktE/la62TzxHiM8lAbwPpPuiaw8geO
 3Uf3KjB2WKWJwxJAWFTON4rHgCjKoyA9v8pUPPgO
X-Google-Smtp-Source: AKy350YkIRiL6/g0txyPQcEysULNj8gjrNyWWXcoEDSMWOaKX/YTC+6vqefm8B56QsKbeEQmmG9BwMkojEpTRumRSyg=
X-Received: by 2002:a17:907:980a:b0:94f:c1f:6d09 with SMTP id
 ji10-20020a170907980a00b0094f0c1f6d09mr214789ejc.7.1681974533034; Thu, 20 Apr
 2023 00:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-11-d1bac46db075@freebox.fr>
 <08e79278-ad30-73e3-a56c-f569b3fea407@linaro.org>
In-Reply-To: <08e79278-ad30-73e3-a56c-f569b3fea407@linaro.org>
From: Arnaud Vrac <avrac@freebox.fr>
Date: Thu, 20 Apr 2023 09:08:42 +0200
Message-ID: <CAG9NU68AqX3P1MrrLvfSKMyw+OsfZ7tyk9F9zU7qvA-QzzqO5g@mail.gmail.com>
Subject: Re: [PATCH 11/11] drm/msm/dpu: do not use mixer that supports dspp
 when not required
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le jeu. 20 avr. 2023 =C3=A0 01:18, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> a =C3=A9crit :
>
> On 19/04/2023 17:41, Arnaud Vrac wrote:
> > This avoids using lm blocks that support DSPP when not needed, to
> > keep those resources available.
>
> This will break some of the platforms. Consider qcm2290 which has a
> single LM with DSPP. So, _dpu_rm_check_lm_and_get_connected_blks should
> be performed in two steps: first skip non-DSPP-enabled LMs when DSPP is
> not required. Then, if the LM (pair) is not found, look for any suitable
> LM(pair).

Good point, I'll add the change.

>
> >
> > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/m=
sm/disp/dpu1/dpu_rm.c
> > index f4dda88a73f7d..4b393d46c743f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -362,7 +362,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks=
(struct dpu_rm *rm,
> >       *pp_idx =3D idx;
> >
> >       if (!reqs->topology.num_dspp)
> > -             return true;
> > +             return !lm_cfg->dspp;
> >
> >       idx =3D lm_cfg->dspp - DSPP_0;
> >       if (idx < 0 || idx >=3D ARRAY_SIZE(rm->dspp_blks)) {
> >
>
> --
> With best wishes
> Dmitry
>
