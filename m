Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A10698A77
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 03:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238F510E0CA;
	Thu, 16 Feb 2023 02:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEF710E2BA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 02:22:25 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 139so612785ybe.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 18:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CM7+nbuu2JRbsspQMF7cJUrYUSFpszj5JfnwXasrm4A=;
 b=gigIXAI3bPveEUhfHtx570QVDRLxYX8xjSWbAgaaNJr8OHn4vARDGJsyhfgvBLcMDu
 L5wohJVj2YE+B1UmeMMEN6eX9hUlJGWCeWF7OnleAViT0ZiH0tFgvT5A3+q9q/yyljTw
 ak7eMAvbDlFACfYoveoHaq4Py9kkWFfouQrsr47NUWXPzKtEDokaedfZGbJwddAIDhrW
 Eq3AqzDzSq5H1b23lX6l7HL83+naDjPPRpreyReiWB+51yIxAmZAqD5QTlck2h48tnc9
 8p+PYJU9rmsSSUfVjun4M1wT54J5PfT0Xv86UY5+V0xApa7rXLzqYb1KL5FzmUKMWxw0
 FNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CM7+nbuu2JRbsspQMF7cJUrYUSFpszj5JfnwXasrm4A=;
 b=e4QVbRtWKWjaP0RpVuxbw+/OA8jUaxTqDVb8P87qbTjlGmjSxa0wbeKxrzAo+3fqzw
 E5M7EfXgMviTZ8zJoicBh7s109sp2Du33ctauIjAxJnsXLJRWZRRCL8eD4QXaz+p3hXF
 c4Domzf6+NoK37JaIeUplUmxdiYLbPodiPGHMG52TqzeHKrHbf38nJ9tGOoADeH8x5BB
 ZkcgNbt4gkkuKZBQP33Ju2MXCdBLU6x+Q+GxaVC3UJiw+86EfmZEE9dBZuEoZdbTqTqR
 TuijGc69/XRx3Mf9IPDxFzrAI8eThcmV/khBAotyahjfW/VuSbgGZPwvuebl6vqYer7G
 Ef/Q==
X-Gm-Message-State: AO0yUKVRxnwH6Kky1WOafhesSpdMrcrCnVqmypxC52nYg2Vpqq868ez4
 EAzze9Rs5uhD3URygEPT4oOiZW53jR4Q5JoVGV6zvw==
X-Google-Smtp-Source: AK7set/dOBv0noQbP2fgaIWTgCF1NkJvZ1c87YBke3v3Br/DUuhltjLJlt/oBAfG1FZOUEQf5yA2VgwloLnLwaQtJ/E=
X-Received: by 2002:a25:9c07:0:b0:905:d0a5:3ff6 with SMTP id
 c7-20020a259c07000000b00905d0a53ff6mr547394ybo.322.1676514144276; Wed, 15 Feb
 2023 18:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <20230215-sspp-scaler-version-v1-1-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-1-416b1500b85b@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Feb 2023 04:22:13 +0200
Message-ID: <CAA8EJpq1L32VQ1eQEk2YQWqCwHgdFQfuWPhQx=PmhzXvazLgPA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: Read previously-uninitialized SSPP
 scaler version from hw
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> DPU's catalog never assigned dpu_scaler_blk::version leading to
> initialization code in dpu_hw_setup_scaler3 to wander the wrong
> codepaths.  Instead of hardcoding the correct QSEED algorithm version,
> read it back from a hardware register.
>
> Note that this register is only available starting with QSEED3, where
> 0x1002 corresponds to QSEED3, 0x2004 to QSEED3LITE and 0x3000 to QSEED4.

This is not purely accurate. 0x1003 (sdm845) also corresponds to QSEED3.
I'd say instead that there are several variations of QSEED3 scalers,
where starting from 0x2004 it is called QSEED3LITE and starting from
0x3000 it is called QSEED4.

>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 8 +++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 3 +++
>  3 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index ddab9caebb18..96ce1766f4a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -324,11 +324,9 @@ struct dpu_src_blk {
>  /**
>   * struct dpu_scaler_blk: Scaler information
>   * @info:   HW register and features supported by this sub-blk
> - * @version: qseed block revision
>   */
>  struct dpu_scaler_blk {
>         DPU_HW_SUBBLK_INFO;
> -       u32 version;

No. Please keep the version in the scaler subblk.  It is a version of
the QSEED (scaler block), not the SSPP's version.

There is a block called DS (destination scaler), which can be used to
scale the resulting image after the LM. This block also uses the
QSEED3(,LITE,4) scaler block.

>  };
>
>  struct dpu_csc_blk {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 4246ab0b3bee..d4e181e1378c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -430,7 +430,7 @@ static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
>                 return;
>
>         dpu_hw_setup_scaler3(&ctx->hw, scaler3_cfg, idx,
> -                       ctx->cap->sblk->scaler_blk.version,
> +                       ctx->version,
>                         sspp->layout.format);
>  }
>
> @@ -807,6 +807,12 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
>         hw_pipe->mdp = &catalog->mdp[0];
>         hw_pipe->idx = idx;
>         hw_pipe->cap = cfg;
> +
> +       if (test_bit(DPU_SSPP_SCALER_QSEED3, &cfg->features) ||
> +                       test_bit(DPU_SSPP_SCALER_QSEED3LITE, &cfg->features) ||
> +                       test_bit(DPU_SSPP_SCALER_QSEED4, &cfg->features))
> +               hw_pipe->version = _dpu_hw_sspp_get_scaler3_ver(hw_pipe);
> +
>         _setup_layer_ops(hw_pipe, hw_pipe->cap->features);
>
>         return hw_pipe;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 0c95b7e64f6c..eeaf16c6af15 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -352,6 +352,7 @@ struct dpu_hw_sspp_ops {
>   * @hw: block hardware details
>   * @catalog: back pointer to catalog
>   * @mdp: pointer to associated mdp portion of the catalog
> + * @version: qseed block revision
>   * @idx: pipe index
>   * @cap: pointer to layer_cfg
>   * @ops: pointer to operations possible for this pipe
> @@ -362,6 +363,8 @@ struct dpu_hw_pipe {
>         const struct dpu_mdss_cfg *catalog;
>         const struct dpu_mdp_cfg *mdp;
>
> +       u32 version;
> +
>         /* Pipe */
>         enum dpu_sspp idx;
>         const struct dpu_sspp_cfg *cap;
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
