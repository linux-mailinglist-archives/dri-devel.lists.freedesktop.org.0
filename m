Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8A730763
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 20:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F9E910E04D;
	Wed, 14 Jun 2023 18:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2B110E00A;
 Wed, 14 Jun 2023 18:37:58 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-558c8a109bdso628250eaf.1; 
 Wed, 14 Jun 2023 11:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686767878; x=1689359878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wyxIeqvssD9PEzBR+IEzweUsjRxU3ISh76M7GHj0Ybo=;
 b=b7X8tCgRCc0sFopp0uy0GM1mh0dfI8ykGqYY3f7Ga0lzhBi+fX8kjRZup70woaPx3W
 laYI6AA8AVCFKfe6YxPmzaMD9s1Ms+siVSbucSw6d+jWaaD3gOBe1NPB/fdegLweJHBi
 /xDNq4WCaxcO0Msufs5ULl+4Z5B91oFcUKciArUXGBU47M54ab++FJD2c5hqwAEgq4FJ
 eLfCJx0X+BwQvlVha5SNkLA6djLXDj5iaAesYFFRc4lBx6Udi0TH+HAKlCLunvZuTsmM
 MZIvAkX9+J4FlmbPq3qH04qVfg2pqkhN2kr8PWgVdSuT4h4EBMN+RVv+STKRRYsl0qYW
 CG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686767878; x=1689359878;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wyxIeqvssD9PEzBR+IEzweUsjRxU3ISh76M7GHj0Ybo=;
 b=LUyzCBSwXVKjDXelJzTDEC0BZmJPDEsexx5pXHvMUkyv/3Zi3PrOTj0nPidnblnzMn
 rRXD4LEzChbiE2yDfqcl76Fyh3YsOfN6ghui6LQV3t+WJSi9warYwUs4em04irWK71+F
 QhKNM/59n4xAgxMvK/uhqGChv71LzA2HP1dRNNFWqirFTOjT+W+HO5rsEfRFyq/X/Qob
 XAchet5f+j7AEk9iT73HcUHGHNKRpvyBEDem0LL4gJ2DEfElSsiLIn+DLPXk2FwqwbMC
 OdwN0Bys73pSb318Ye4BYRZrMps7SP/Zfd2e3xUH9TxOZg5L9xjKdGWAbvE0FGNlZSjv
 Rw7Q==
X-Gm-Message-State: AC+VfDxszAqxBq5J6Eq0rh5C/js+qHdNG63QJhXm37IPscSsUiIseonL
 l3HCUeUtfseCWQtlU3Bmsgc8v3GoyxjfUSyG9HkwChbLpBt1Uw==
X-Google-Smtp-Source: ACHHUZ6410bcdcG4Rd5YuiDLH4hTYSvoE5rXydBHuTz/0kpG4JDCEGmj1qlQnO0F5uwFnrU3NtPLlkPxxKLE9zmndRg=
X-Received: by 2002:aca:bdd6:0:b0:39c:ef68:fd10 with SMTP id
 n205-20020acabdd6000000b0039cef68fd10mr1342444oif.26.1686767877581; Wed, 14
 Jun 2023 11:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230607125932.3518547-1-l.stach@pengutronix.de>
In-Reply-To: <20230607125932.3518547-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 14 Jun 2023 20:37:46 +0200
Message-ID: <CAH9NwWchyC8i_5FXnpRLOUDJBvLAdaCZkC_AouiiiFizMqb_Qw@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: slow down FE idle polling
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

>
> Currently the FE is spinning way too fast when polling for new work in
> the FE idleloop. As each poll fetches 16 bytes from memory, a GPU running
> at 1GHz with the current setting of 200 wait cycle between fetches causes
> 80 MB/s of memory traffic just to check for new work when the GPU is
> otherwise idle, which is more FE traffic than in some GPU loaded cases.
>
> Significantly increase the number of wait cycles to slow down the poll
> interval to ~30=C2=B5s, limiting the FE idle memory traffic to 512 KB/s, =
while
> providing a max latency which should not hurt most use-cases. The FE WAIT
> command seems to have some unknown discrete steps in the wait cycles so
> we may over/undershoot the target a bit, but that should be harmless.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 11 ++++++-----
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c    |  7 +++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  1 +
>  3 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_buffer.c
> index cf741c5c82d2..384df1659be6 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -53,11 +53,12 @@ static inline void CMD_END(struct etnaviv_cmdbuf *buf=
fer)
>         OUT(buffer, VIV_FE_END_HEADER_OP_END);
>  }
>
> -static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer)
> +static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
> +                           unsigned int waitcycles)
>  {
>         buffer->user_size =3D ALIGN(buffer->user_size, 8);
>
> -       OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | 200);
> +       OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
>  }
>
>  static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
> @@ -168,7 +169,7 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
>         /* initialize buffer */
>         buffer->user_size =3D 0;
>
> -       CMD_WAIT(buffer);
> +       CMD_WAIT(buffer, gpu->fe_waitcycles);
>         CMD_LINK(buffer, 2,
>                  etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_=
mapping)
>                  + buffer->user_size - 4);
> @@ -320,7 +321,7 @@ void etnaviv_sync_point_queue(struct etnaviv_gpu *gpu=
, unsigned int event)
>         CMD_END(buffer);
>
>         /* Append waitlink */
> -       CMD_WAIT(buffer);
> +       CMD_WAIT(buffer, gpu->fe_waitcycles);
>         CMD_LINK(buffer, 2,
>                  etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_=
mapping)
>                  + buffer->user_size - 4);
> @@ -503,7 +504,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u3=
2 exec_state,
>
>         CMD_LOAD_STATE(buffer, VIVS_GL_EVENT, VIVS_GL_EVENT_EVENT_ID(even=
t) |
>                        VIVS_GL_EVENT_FROM_PE);
> -       CMD_WAIT(buffer);
> +       CMD_WAIT(buffer, gpu->fe_waitcycles);
>         CMD_LINK(buffer, 2,
>                  etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_=
mapping)
>                  + buffer->user_size - 4);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 41aab1aa330b..8c20dff32240 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -493,6 +493,13 @@ static void etnaviv_gpu_update_clock(struct etnaviv_=
gpu *gpu)
>                 clock |=3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
>                 etnaviv_gpu_load_clock(gpu, clock);
>         }
> +
> +       /*
> +        * Choose number of wait cycles to target a ~30us (1/32768) max l=
atency
> +        * until new work is picked up by the FE when it polls in the idl=
e loop.
> +        */
> +       gpu->fe_waitcycles =3D min(gpu->base_rate_core >> (15 - gpu->freq=
_scale),
> +                                0xffffUL);
>  }
>
>  static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 98c6f9c320fc..e1e1de59c38d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -150,6 +150,7 @@ struct etnaviv_gpu {
>         struct clk *clk_shader;
>
>         unsigned int freq_scale;
> +       unsigned int fe_waitcycles;
>         unsigned long base_rate_core;
>         unsigned long base_rate_shader;
>  };
> --
> 2.39.2
>


--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
