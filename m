Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B666174869B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 16:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFF510E381;
	Wed,  5 Jul 2023 14:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A7710E381;
 Wed,  5 Jul 2023 14:43:11 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3a36b309524so5394609b6e.3; 
 Wed, 05 Jul 2023 07:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688568190; x=1691160190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A14fZKmtNXyFXPY9J+wKEhzDJ4Yasz3lPL7wl3xXT9o=;
 b=FIi4zGZzJBDn8pZYMtFbQmJtUX0w1mBSjt1CFCfchGzflvfxL8Wc4DBsmeLraczciA
 c9iMzPtumc7Xwtwy2kxuNtLi8CN/ZTHn6+yoFE2fLEt/S2pr4x8KiX0ZE8vsEy6atGZh
 nQOJqfMtd1ISqII0qF6v6HwxnxRPyfEjtPKfSrLXcRJUCTheyMsYzTDWLnFXKu1IiGHc
 RrYKuSULFzNBEjUS1BX/8p66q7y2EKq34iA0HkSwjamLEyAfT1ehovgrDTS6tXrYWaK9
 vxPzZxEg2GmESH4tLOX8DUX/tYf9P+VGYcDH9R5iOcJYalbTup24ABetIf9ghr2PGPPV
 gGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688568190; x=1691160190;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A14fZKmtNXyFXPY9J+wKEhzDJ4Yasz3lPL7wl3xXT9o=;
 b=RhuzhdIsos5+CuONM4G/67GPFYo5vYHnnyIztFC5qM/JhKsu2F+1+05yee/30AmhnB
 WRkzYVSEp59XXONCaoCZQfwfTNcayGR63a/dx8oWJbKsprcs6W7CunDdc2gk1z+Ad0A6
 T7x29tmcFK/j72FXTUi4o5nPEiKYiYDJ0IT0LG0QE+BcAtulK+WqtmjE4Lrma6w/KCgF
 SxrWvpEpFIIZMRxTlfhSh2epIt6JesvmzMdae81mkO+4n1MX4wv1lKJeCZSGQM+Qw7w0
 l08UqcOgismO4pnFsVVizfsq+vcCULMqg5bWGj9csqrW9hd+KWfDSoeK3ZT+2lrDnp1j
 62Wg==
X-Gm-Message-State: AC+VfDyUaHnnclJPvXu3cPpHOZs/KQ6WCwFkEFwvifk0YEJL3M1WOvZm
 FcsvXSIjVFc75RIbba6g2tjyzYO+/PfJ0KxOoPC8vY7Q
X-Google-Smtp-Source: ACHHUZ7wimCD6cHiqgUUi7EIyKNS4Oju/YJSxp80yq2fiPDdvKbbukpLa9lMbEkKnQdf8CYYXHcb5acmpO4Y3of/RI0=
X-Received: by 2002:a05:6808:164e:b0:39d:adbe:fa29 with SMTP id
 az14-20020a056808164e00b0039dadbefa29mr17369355oib.4.1688568190086; Wed, 05
 Jul 2023 07:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230704163640.6162-1-robdclark@gmail.com>
 <CAA8EJpoAZ7z2aURWHs1ouEuTzj2c0O-CypCHmocXO62EpuffsQ@mail.gmail.com>
In-Reply-To: <CAA8EJpoAZ7z2aURWHs1ouEuTzj2c0O-CypCHmocXO62EpuffsQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Jul 2023 07:42:58 -0700
Message-ID: <CAF6AEGtUq3Y3YjTt1qazWcP4NcH2q_k4p2pfzEcrJMP34n_L+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/adreno: Fix warn splat for devices without
 revn
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 4, 2023 at 10:20=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 4 Jul 2023 at 19:36, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Recently, a WARN_ON() was introduced to ensure that revn is filled befo=
re
> > adreno_is_aXYZ is called. This however doesn't work very well when revn=
 is
> > 0 by design (such as for A635).
> >
> > Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified bef=
ore being set")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index 65379e4824d9..ef1bcb6b624e 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -149,7 +149,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct =
adreno_rev rev2);
> >
> >  static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32=
_t revn)
> >  {
> > -       WARN_ON_ONCE(!gpu->revn);
> > +       /* revn can be zero, but if not is set at same time as info */
> > +       WARN_ON_ONCE(!gpu->info);
> >
> >         return gpu->revn =3D=3D revn;
> >  }
> > @@ -161,14 +162,16 @@ static inline bool adreno_has_gmu_wrapper(const s=
truct adreno_gpu *gpu)
> >
> >  static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
> >  {
> > -       WARN_ON_ONCE(!gpu->revn);
> > +       /* revn can be zero, but if not is set at same time as info */
> > +       WARN_ON_ONCE(!gpu->info);
> >
> >         return (gpu->revn < 300);
>
> This is then incorrect for a635 / a690 if they have revn at 0.

Fortunately not any more broken that it has ever been.  But as long as
sc7280/sc8280 have GPU OPP tables, you'd never hit this.  I'm working
on a better solution for next merge window.

BR,
-R

> >  }
> >
> >  static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
> >  {
> > -       WARN_ON_ONCE(!gpu->revn);
> > +       /* revn can be zero, but if not is set at same time as info */
> > +       WARN_ON_ONCE(!gpu->info);
> >
> >         return (gpu->revn < 210);
>
> And this too.
>
> >  }
> > --
> > 2.41.0
> >
>
>
> --
> With best wishes
> Dmitry
