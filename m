Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC527D40CB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 22:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF8610E24F;
	Mon, 23 Oct 2023 20:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A4310E242;
 Mon, 23 Oct 2023 20:20:41 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so6009071a12.1; 
 Mon, 23 Oct 2023 13:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698092439; x=1698697239; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcJOgJNcS2p4NFz4YEARd6CEH2tDggIHToe8d/lsPVQ=;
 b=c93EfLdJKLzdoBFBByZZfCTqA2h99WRUeI0TFGCE4RJdJJv1M8XkVaYTGTj9BoC+BM
 9CCDMkt2Rae6CYCNUAbLNRaa2cGqxCDHtJW1qzdZ4KoxZcm9/h15jSb+YEYo5SuwiTQA
 T65v/uxK3NwoACg/s28Ns/mIHYS91ERsnGHrDfjyA27XbsW23e9o76336/rPTpJUn7n/
 UvTyL6D607iysyKlhxFoLKYANzYU//rRr0P6YK7xptY31AB8ILtQ8opoU/y83jcBy5e/
 VxMCTFvr0F9+WRpFhJwq9nRj3h3G1iOJgzvJncGnk4KCCVQtJMs+13oRsMAlGBpn/+Zv
 eLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698092439; x=1698697239;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WcJOgJNcS2p4NFz4YEARd6CEH2tDggIHToe8d/lsPVQ=;
 b=Q8urQLWvKM9p3vc8lYaNnddKenxQjg60vw3+KFMgo0iR6FKrwLU04b85dQowiAawIm
 MxyLOlRn6r5li/T7CBk1uhfQKrN7ud5KgFs8qx7cbi9c/CRA74opMuBdq07WCf3Bwxj0
 ywvu1KhC+b0CkJ0vymEAvz6YHgJVksRwk/mJdfS0dFR4AxK6ZSV6PppwLdz5kcFsuk7j
 UcqOCJLBSpJzrw6uHi5eTQapxHbttm20IkiJm6FhEkZjjsaBbGlOgg8AfU7Z02PgpbzL
 JhRXvk8DJUwqbxEO5YI3f9gIiRB4AfBztp51YPHsEwY1tRFV7HSppLrLQYCuU8aazu4C
 qn/A==
X-Gm-Message-State: AOJu0YyMfpGWVRoXwsqF63/m+yUNsM2tVphlYLQ8Af7/n1uXmCdu7jNl
 +QqHIbYkg/3uklmcIcdK5iryNZ0tHPrzJx2fdO0=
X-Google-Smtp-Source: AGHT+IF0i4FCIEXJ5r+guzxgVZMg1LSWXPnTpOmpFJCUd+vzCdlua9+QP4fW2ZNfi7FYylAMHYWi/IN+X3DEJykeEoI=
X-Received: by 2002:a50:d593:0:b0:53d:a0c9:dbd4 with SMTP id
 v19-20020a50d593000000b0053da0c9dbd4mr6379285edi.21.1698092439310; Mon, 23
 Oct 2023 13:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
 <CAF6AEGuS3PhNbh9Gmu1g9YpUcr3LOh1gZK-XBE+urdb5jRjorg@mail.gmail.com>
 <6a0398d1-22f4-4eb7-ba43-c448055be323@linaro.org>
In-Reply-To: <6a0398d1-22f4-4eb7-ba43-c448055be323@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 23 Oct 2023 13:20:27 -0700
Message-ID: <CAF6AEGuqrm0pssjRDa9DK=NppU4Qq5cPZicbGfxKH2czJmjK2A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Drop WARN_ON from patchid lookup for new
 GPUs
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 23, 2023 at 12:56=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
>
>
>
> On 10/23/23 21:42, Rob Clark wrote:
> > On Mon, Oct 23, 2023 at 7:29=E2=80=AFAM Konrad Dybcio <konrad.dybcio@li=
naro.org> wrote:
> >>
> >> New GPUs still use the lower 2 bytes of the chip id (in whatever form
> >> it comes) to signify silicon revision. Drop the warning that makes it
> >> sound as if that was unintended.
> >>
> >> Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifyin=
g GPU")
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
> >>   1 file changed, 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.h
> >> index 80b3f6312116..9a1ec42155fd 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -203,11 +203,6 @@ struct adreno_platform_config {
> >>
> >>   static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
> >>   {
> >> -       /* It is probably ok to assume legacy "adreno_rev" format
> >> -        * for all a6xx devices, but probably best to limit this
> >> -        * to older things.
> >> -        */
> >> -       WARN_ON_ONCE(gpu->info->family >=3D ADRENO_6XX_GEN1);
> >
> > Maybe just change it to ADRENO_6XX_GEN4?
> That also applies to 700

Then the warn is warning about what it is supposed to ;-)

I guess this is coming from a6xx_gmu_fw_start()?  I think we need a
different way to construct the gmu chipid, since the point of this was
to not depend on the low 8b having any particular meaning.  Perhaps we
should just get the gmu chipid from the device table.

BR,
-R
