Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6C7581764
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 18:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A3B93315;
	Tue, 26 Jul 2022 16:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAA193328;
 Tue, 26 Jul 2022 16:25:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m17so20602708wrw.7;
 Tue, 26 Jul 2022 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8LcVDs8RvZGnf91eTJED60DiX0yf8UGdRli/z4R9ww=;
 b=KOAeoyBm7wwBLORTMOBcTE7Nn6Uh+DlNDpeypqWgO3iRo3tTNM3ST5PjirqDA0SNJd
 2l8tM5Fj8bIosSVBQsNPXU16f9vBj/jxTLV1nUXBRaz958Ponsgt4MKJhTr/4P5C+ob8
 md49wVvLWNFB5WIcMqUydukfJrGCaC3zNFOc4r9JAlEwuq376EAb1KN9TGJAiGaS18CG
 pHW1lv0nYtqFya/3QGUA0ljw77iue/nXuR0nGJvpPMrGKGEDLJs/tHDRj6EjA6Mb7ZdR
 76rNBUZTj8S4pvcPutDbd37L1F7Da4v1+THmyE+fq8vsqR1TLx/hBtGU89MS78ZkXDIt
 fYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8LcVDs8RvZGnf91eTJED60DiX0yf8UGdRli/z4R9ww=;
 b=I1dDVQEZoNiL941GAJrk3ll0xT0pGlfvJYxeauM49UIThwb7vIrQg7siU1CuOkQuWT
 /tpRCgntB1KcbzprGLcSNw5QHuhYbcvaV8VOSvWe8ZI+uHrxjg/vg5LShPMffX2dLdwg
 Pj50gJYhBdqUTuM0wd4jUVJF2pWf7JF9P4GATrWbHtGLKjYHlNHEikkUZ0pwJP0wIuvk
 BoPFs403nMgeMlcnqZpqpakRL+fSOSRIzvk3G8GsVkgYydOlYhWLOfw4JkLZc3HSF2ci
 kNlLz09Z4w1A1iYRAPlX0PHqJujUBAPkZdOugpmXOLlZUjKbJYXlISgKybY8MqjiEv34
 lWuw==
X-Gm-Message-State: AJIora+H/3NNwviQzjIZvhFv7Svv9rlCvL8nNPon54CSggVhfLs1U6/p
 k6o0F967L4Rs2Cd5CW8WFJd02EGecXub6NTUOkQ=
X-Google-Smtp-Source: AGRyM1vYA93JRusWt3hwGYo+dbJpfk0guI4CLJFR6iKYSfUwTVlqD4Bn4DScV0Cy1Y1E4ZJY93/GUDJxhAakmjQSbgI=
X-Received: by 2002:adf:e187:0:b0:21d:64c6:74f0 with SMTP id
 az7-20020adfe187000000b0021d64c674f0mr10806915wrb.221.1658852726467; Tue, 26
 Jul 2022 09:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220726044446.21102-1-quic_ddhamara@quicinc.com>
 <20220726044446.21102-2-quic_ddhamara@quicinc.com>
In-Reply-To: <20220726044446.21102-2-quic_ddhamara@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 26 Jul 2022 09:25:50 -0700
Message-ID: <CAF6AEGvd+nS+hiypoVAZ-kag1xHHBMO=e=aGPrVr-+asUmFXBw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 1/1] drm/msm/a6xx: Fix null pointer access
 in a6xx_get_indexed_registers
To: quic_ddhamara@quicinc.com
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
Cc: quic_akhilpo@quicinc.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 robclark@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 25, 2022 at 9:46 PM <quic_ddhamara@quicinc.com> wrote:
>
> From: Akhil P Oommen <quic_akhilpo@quicinc.com>
>
> Fix a null pointer access when memory allocation fails in
> a6xx_get_indexed_registers().
>
> Change-Id: I33e13745cd8e5841d2f377f48a199af98be2ed02
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Devi prasad Dhamarasingi <quic_ddhamara@quicinc.com>
> ---
>
> Changes in v2:
> - Corrected the signoff name and email id.
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 55f443328d8e..507074f6222c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -952,6 +952,12 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
>         a6xx_get_indexed_regs(gpu, a6xx_state, &a6xx_cp_mempool_indexed,
>                 &a6xx_state->indexed_regs[i]);
>
> +       if (!a6xx_state->indexed_regs[i].data) {
> +               gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, mempool_size);
> +               a6xx_state->nr_indexed_regs = count - 1;
> +               return;
> +       }

Hmm, I don't see us adjusting nr_indexed_regs if any of the earlier
sections fails, so I don't think we need to do that here either.  So I
think you could just:

if (a6xx_state->indexed_regs[i].data)
   a6xx_state->indexed_regs[i].data[0x2000] = mempool_size;

And I kinda expect if there was an allocation failure we'd just end up
dereferencing a null ptr later in the show path.

But, I think in general you can assume small GFP_KERNEL allocations
will never fail.  If necessary they will block for reclaim/shrinker to
free up some memory or evict some pages to swap.  If you've gotten to
the point where even that isn't possible, then a null ptr deref is
really the least of your problems ;-)

BR,
-R

> +
>         /*
>          * Offset 0x2000 in the mempool is the size - copy the saved size over
>          * so the data is consistent
> --
> 2.37.0
>
