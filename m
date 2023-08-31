Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC7978E3E7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 02:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA8010E63F;
	Thu, 31 Aug 2023 00:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ED410E63D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 00:24:55 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d77ad095e5cso127053276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693441495; x=1694046295; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wE7oiFJoR9KfWY52ArAEgPG+Y/Fo2kX4EkxDGcD8QAY=;
 b=mK1qWsHXFjrvDjnlKQFN0TaYX3csoBDLVJFwNg5wi3Mh2C0Xri5Lc6onW/mkXB82fU
 N1LRP+8Ac+MFCUGYnFZVdQQKatyXsspGCHNr2cTpJQfyjEB5eRsP5yd2h1K1F7fpfiUG
 2TsjSFOrtFGII3YvaV/zdq4yRKGCVPdtlQhXgRlfVEEOy7Yy4GoRfpSKjOU83Zo3qLRu
 BmdBa8Nhb3amriDAGU8F+PkqZK0lFv0gL7z5dNSbqpUZTg8Y2czoIPqnm6JwdFu2Zt7d
 SVxAKvYSwFqJKLdPcz/wo7R3CuJncFSjmHXlLLPP7+eFl92C2T6nAcXkoYPK1h8ou1i7
 MfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693441495; x=1694046295;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wE7oiFJoR9KfWY52ArAEgPG+Y/Fo2kX4EkxDGcD8QAY=;
 b=OinoDLymI83jcDQUNOsYmMaL63gru6g9O4q+92G91Q8JrOfp3suib9t3G9VJxMcjVI
 9+F+08k+PONPrw4QxWfWrbawEtPz5RBPzRlYHrAXR0MfzKLG/Pb0UPD8I77SBNlPJbUM
 0W9FaZOrD7TfzFKdv7gOHGLdWHXxnIQGEobRSbAkpLTztbHWywoO75oOotzqaoLBf4AB
 frAD4wjmm9wXss94hkYm/SIExxKKIBzhzHoQphV/gY5qVpeha/db6SVJpUvjf6EsfJIL
 E7SndphsmWWDsqDPraI9PafBlJujEeJcHRDhAOJeySZqoEShGLI2F4gy4TZ++3KWYbqX
 Yyew==
X-Gm-Message-State: AOJu0Yym4ic4s3zBZBZaI2G3vwm1KrpkeuS1afskFJ5mJ+6KV01pbdv0
 e8GD8n6Bx2Pp93n+kP5byxTheZHucp1qnBZMdCkFHQ==
X-Google-Smtp-Source: AGHT+IGDrpoIANqhoS8W6TCVcYzFB0D2zfRP/P4a1pikuoYb3lQsJ+AISYlrnw9s5BBfQK3HzdDbQ+iuUI75raDCxew=
X-Received: by 2002:a25:b9c6:0:b0:d7b:8c90:ce5b with SMTP id
 y6-20020a25b9c6000000b00d7b8c90ce5bmr3238476ybj.63.1693441495006; Wed, 30 Aug
 2023 17:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-15-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-15-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:24:44 +0300
Message-ID: <CAA8EJprZma-e=zbtDuGKfcHK7zTaSykACt+=rh7W92iEpif=Ug@mail.gmail.com>
Subject: Re: [PATCH 14/16] drm/msm/dpu: do not allow YUV formats if no CDM
 block is present
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> On chipsets where CDM block is not available OR where support has
> not been added yet do not allow YUV formats for writeback block.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 7fc174b33ae2..d8edca9bc964 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -406,6 +406,12 @@ static int dpu_encoder_phys_wb_atomic_check(
>                 return ret;
>         }
>
> +       if (DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))) &&
> +           !phys_enc->dpu_kms->catalog->cdm) {
> +               DPU_ERROR("cannot support YUV formats without CDM block\n");
> +               return -EINVAL;
> +       }

Can we have YUV formats in wb_formats if we do not support CDM? That
would be an error.

> +
>         return 0;
>  }
>
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
