Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35727D406C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 21:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAF610E209;
	Mon, 23 Oct 2023 19:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466ED10E237;
 Mon, 23 Oct 2023 19:42:15 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507973f3b65so5824516e87.3; 
 Mon, 23 Oct 2023 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698090133; x=1698694933; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H2ftM92OKCvSHhh6kb+Glq3Mcgd9kOqth29i32E6zLk=;
 b=aQ03YU1DM+x8NGQEDXSZaET+H4u/usYiXWf8S/obKjz4oz54+QrresES7GH9c4dmKm
 o+edTqyIAvYf0koBygKLcBL+/9kTVB1FoaqWl/lRMaY6OjltkdeEYpqIdzhuI9m9p6Q/
 OGWvHw5mSp9pfewDscmlqEDMAvnmDFKcbLEnTv9qE7z9QvjSN8Kl/OFBIMCfFgZ3WxW6
 dtlcYlQTCWMxhQCZWY+xxXZ5liPFINzfXqlIC0Qw0lMyBDC24jTh0KV8d/vuBXmQodNV
 KmGUs++mmh93EarlV9z4jI2rLVc/OpV955luBoZUTja34pBpUNYvOp3Q+wocf1JWcsfs
 3pwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698090133; x=1698694933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H2ftM92OKCvSHhh6kb+Glq3Mcgd9kOqth29i32E6zLk=;
 b=vbDp52qrHjsqvY7TACtFfUL15Dmu9Y8IiUSYft74BZiCaVBHr4CX/h28oAB22idrLf
 Syo4vmxvqLUNPUYnqaIs+bwYk7jzz5DNIMe4IZmZMd74tXeVo7Jq3pqbCxeUBPQNhmHm
 iAQdOY4m2SVICaahx9PKqoDQZy9dx/UR2u+AGEq5cgARI1cNEgmQNLZM3b++R9onvrQz
 UYjyIQaOijMecUuuN8bjxCjKCbNfvC7B0/ECiUfCtg9R27Cc3vhAw25UHH/6i12NHlHk
 8xYIc+36onFxDOdmMCuay3fJpVjpxxibF6YDp2PObs7jZh1d09pzvozanxPdBEMERB/x
 hoiQ==
X-Gm-Message-State: AOJu0Yw0ovot+fORyse6Jz6yYMNdICzvsvynAjY8m9CYcEe+uY5O+LfG
 82NhlD/OmMJ4UULJd7VNL+YB9UVaP4jXr58KNYk=
X-Google-Smtp-Source: AGHT+IF4lDMnNBYukqzCpYss3e4EVRZ5jF5bIM8cAJMJ+yDp9VG5fMNFAGPBIuG0X89cUrHMw6pPpByRVz55Skj4vcA=
X-Received: by 2002:ac2:5edb:0:b0:500:aed0:cb1b with SMTP id
 d27-20020ac25edb000000b00500aed0cb1bmr7346416lfq.24.1698090133099; Mon, 23
 Oct 2023 12:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
In-Reply-To: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 23 Oct 2023 12:42:01 -0700
Message-ID: <CAF6AEGuS3PhNbh9Gmu1g9YpUcr3LOh1gZK-XBE+urdb5jRjorg@mail.gmail.com>
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

On Mon, Oct 23, 2023 at 7:29=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> New GPUs still use the lower 2 bytes of the chip id (in whatever form
> it comes) to signify silicon revision. Drop the warning that makes it
> sound as if that was unintended.
>
> Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying G=
PU")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 80b3f6312116..9a1ec42155fd 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -203,11 +203,6 @@ struct adreno_platform_config {
>
>  static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
>  {
> -       /* It is probably ok to assume legacy "adreno_rev" format
> -        * for all a6xx devices, but probably best to limit this
> -        * to older things.
> -        */
> -       WARN_ON_ONCE(gpu->info->family >=3D ADRENO_6XX_GEN1);

Maybe just change it to ADRENO_6XX_GEN4?

BR,
-R

>         return gpu->chip_id & 0xff;
>  }
>
>
> ---
> base-commit: e8361b005d7c92997d12f2b85a9e4a525738bd9d
> change-id: 20231023-topic-adreno_warn-42a09bb4bf64
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>
