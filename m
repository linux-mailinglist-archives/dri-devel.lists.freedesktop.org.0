Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C1A734BA6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 08:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0DD89151;
	Mon, 19 Jun 2023 06:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDF410E0AB;
 Mon, 19 Jun 2023 06:18:27 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-55e341f880bso946933eaf.0; 
 Sun, 18 Jun 2023 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687155506; x=1689747506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JjxMa+uuy2NgQFtk6AcBMTsACb1aY8WcgEoL+1VkVzY=;
 b=X/SBn4cuIA1ZyNrAMiXcAPrNpHpm0t2+GQ8vDpNLGYvwkiVGnRv6tQk6s0+EEtKT7K
 hgKe5SQtVku5LxiqQGND4t0PyqMcbxj6rDz9aANpZAu+mbwN4Kh9lftcU35CWCwFPcD6
 o+mQLSh1xViOCght2QjXak/UBlP9BZzaPYgUT6CBJbMhK663u+YJlO2KyyNGHPh+SLK2
 Y2JGi9QIFls1e4HLxXvzrpjm2l/iliTM4t0UncO22X3V/P+0mDsOIzSqxoUY0eha9Spv
 8aSvOQUHNKAzhP4vh/BptgnFYgVTDs99by8nHEQ2GLih8YmHit2cFADpzj804fh8Te9n
 Hw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687155506; x=1689747506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JjxMa+uuy2NgQFtk6AcBMTsACb1aY8WcgEoL+1VkVzY=;
 b=hqQovlf3ZtDTiuWx13v6Xj135ZwHOZSvgOlxXjSWw3JN+LUA4OcLJNcTSIxcFGQs1c
 39XMTeO9sno7FA/mG8VP1LIOYKjjeRQpRIIXtco7JwMKAHFWlZzG6ofZSM5MBB+Pq2GX
 4e0/sAuw8P60zuPwco9FiAFhz141LOprnjnYkb/mfB1adFBkcXmjsFoRrgMHMEpAx77Y
 4PuBjead/pNVnIOH2mNk7cnYWaqsh3BKfUEhx/VptY19n6e2FHPHOtWBlrgswMn82ohX
 wWxL3CM7PyCN3RkLercBQwbbNaKVJ+l7LhYsZ7LFbVS27FVsPXe7Qufgv7ngTAny7YY9
 cQEw==
X-Gm-Message-State: AC+VfDxJVsmx36nmK0CWKcCi55Qsf6kmXEIZAqAwoyjXO/robtA0Q0fu
 oWirEtUCfSi77uKAHvtEkBg3m4j6rFo5x5Y30FIpXRzumhKk1A==
X-Google-Smtp-Source: ACHHUZ4k6DhVTwtmIaRoikHlRZ1jVoKON6tGo5/fOd7JvKncdLV3wM3QlJyygQe+KAUeJRZuRhcHRNacHUjyEapqiS4=
X-Received: by 2002:a05:6808:15a0:b0:39e:ca2b:7246 with SMTP id
 t32-20020a05680815a000b0039eca2b7246mr2670582oiw.8.1687155506333; Sun, 18 Jun
 2023 23:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230616110257.2262744-1-l.stach@pengutronix.de>
In-Reply-To: <20230616110257.2262744-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 19 Jun 2023 08:18:15 +0200
Message-ID: <CAH9NwWcNCCghDqrHqr9GK2UwrLcCJTCKRu+deBVEHSE8N1RjNg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: slow down FE idle polling
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
> If the GPU core base frequency is unknown keep the 200 wait cycles as
> a sane default.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> v2: Don't speed up when the GPU core frequency is unknown.
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 11 ++++++-----
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c    |  8 ++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  1 +
>  3 files changed, 15 insertions(+), 5 deletions(-)
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
> index de8c9894967c..63b929b1e5d1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -493,6 +493,14 @@ static void etnaviv_gpu_update_clock(struct etnaviv_=
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
> +        * If the GPU base frequency is unknown use 200 wait cycles.
> +        */
> +       gpu->fe_waitcycles =3D clamp(gpu->base_rate_core >> (15 - gpu->fr=
eq_scale),
> +                                  200UL, 0xffffUL);
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
