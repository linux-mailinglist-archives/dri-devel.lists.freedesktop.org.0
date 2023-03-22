Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA36C5816
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 21:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A5F10E28A;
	Wed, 22 Mar 2023 20:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8083210E14D;
 Wed, 22 Mar 2023 20:48:57 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id y184so14686589oiy.8;
 Wed, 22 Mar 2023 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679518136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPANpQo2pbBjv7bN+m6aSZeybQN0T9mXhbFUpa61TPQ=;
 b=fx9hdW6p0dQdtSIlZNZVy26SYG5ERPukARJpRq4EZ12B/ilaMyklpkLz3p7498u1ZP
 zkKaBNEiOwxxqaHEn0DdRQQwxjYO8fSCzYCpT1Q4hn26Ps1v4J55dK2f4sPtW61yf8Eo
 OLliIc20a9ml5L+Z6oQiuhKfLNvBmTpq51k+8V9lL/i64RxIutVo/LOaogcjkgNJYIZX
 kk60XrmYuDM/OimXwdTNdasE8+NlQAAhO9M9VU8QHJGL7nXcaKpXDrcaeHXEatPnDqKQ
 Z1btLvtCIdHOOk4yEmoY67WSIhz22y/Xm49IztnbYrLMkExi9Btd593xkfo+GFFOKTUJ
 9lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679518136;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MPANpQo2pbBjv7bN+m6aSZeybQN0T9mXhbFUpa61TPQ=;
 b=zRwu//WUemNTVJrZ3nWTd4kDxecBxSjq2M3DDceZYswLlncF8Eu6ks2MurrTrrUHZi
 H6xch4RV0SvCOGSHwxHn1/ZyIMFMIUV+xgZgF4vjo45kMca0+NYzFVbNbSd2Dcb1cVgq
 gKudS5g2wfyfzBE0RtVHuoqVDuQSNIK6n1nrvhLbhs46rCLSwjGYDuAyLc73sSTVSXry
 w/PPsINJvAP4Y5/ZUK0kdsvaLyn7ZAEpxvuNKMyLgiopG1QmiOW34CWyDvgIquONXdes
 6NyQVCIyZ3tfzfYodunQKga9zywfDksmM1eYRptV28Xy6ZSrgZ3r6b9WtgPigJER58qP
 Q81A==
X-Gm-Message-State: AO0yUKV5HCzf8+E4Uggh4m0Yd0p4ga5YiyNFeEcD6WDKJpH9Igdq/pSF
 Hp0NWZQ3OQA/ZXeQc//ujSiEpV80gvNzRB1dmKY=
X-Google-Smtp-Source: AK7set/ZbUQNbAR4aFIk7VnLqx7B6Seh+3ogULmXSVniL38EBZndSAX2MDpf7tdc0/FahMyfyYS6l4wNzt57YdsP8lY=
X-Received: by 2002:aca:1010:0:b0:384:6d14:c707 with SMTP id
 16-20020aca1010000000b003846d14c707mr1304761oiq.5.1679518136556; Wed, 22 Mar
 2023 13:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230306090633.65918-1-geert+renesas@glider.be>
 <f2ac0d80-fab1-8211-1dfe-cea078929e91@infradead.org>
In-Reply-To: <f2ac0d80-fab1-8211-1dfe-cea078929e91@infradead.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Mar 2023 13:48:45 -0700
Message-ID: <CAF6AEGvxOdqeK65fWOqqOvTO4fHS83U4orMG6GdQyx1tcSiK_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix bit-shifting UB in DPU_HW_VER() macro
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 8:08=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 3/6/23 01:06, Geert Uytterhoeven wrote:
> > With gcc-5 and CONFIG_UBSAN_SHIFT=3Dy:
> >
> >     drivers/gpu/drm/msm/msm_mdss.c: In function 'msm_mdss_enable':
> >     drivers/gpu/drm/msm/msm_mdss.c:296:2: error: case label does not re=
duce to an integer constant
> >       case DPU_HW_VER_800:
> >       ^
> >     drivers/gpu/drm/msm/msm_mdss.c:299:2: error: case label does not re=
duce to an integer constant
> >       case DPU_HW_VER_810:
> >       ^
> >     drivers/gpu/drm/msm/msm_mdss.c:300:2: error: case label does not re=
duce to an integer constant
> >       case DPU_HW_VER_900:
> >       ^
> >
> > This happens because for major revisions 8 or greather, the non-sign bi=
t
> > of the major revision number is shifted into bit 31 of a signed integer=
,
> > which is undefined behavior.
> >
> > Fix this by casting the major revision number to unsigned int.
> >
> > Fixes: efcd0107727c4f04 ("drm/msm/dpu: add support for SM8550")
> > Fixes: 4a352c2fc15aec1e ("drm/msm/dpu: Introduce SC8280XP")
> > Fixes: 100d7ef6995d1f86 ("drm/msm/dpu: add support for SM8450")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

>
> Thanks.
>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index ddab9caebb18c40d..bbd3cbdd77956c5d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -19,8 +19,9 @@
> >   */
> >  #define MAX_BLOCKS    12
> >
> > -#define DPU_HW_VER(MAJOR, MINOR, STEP) (((MAJOR & 0xF) << 28)    |\
> > -             ((MINOR & 0xFFF) << 16)  |\
> > +#define DPU_HW_VER(MAJOR, MINOR, STEP)                       \
> > +             ((((unsigned int)MAJOR & 0xF) << 28) |  \
> > +             ((MINOR & 0xFFF) << 16) |               \
> >               (STEP & 0xFFFF))
> >
> >  #define DPU_HW_MAJOR(rev)            ((rev) >> 28)
>
> --
> ~Randy
