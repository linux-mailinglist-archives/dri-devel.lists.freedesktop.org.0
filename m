Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E93D73137F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B709710E49A;
	Thu, 15 Jun 2023 09:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3005410E49A;
 Thu, 15 Jun 2023 09:20:50 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-559409cc490so1270677eaf.3; 
 Thu, 15 Jun 2023 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686820849; x=1689412849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgHjMHtSYZhN8oPF8HkKVvy8pzvG/i3unibysV2iWfY=;
 b=TMjM4qta/OUSEqmbNKxY0r1lvcaNSLhTCRfWO7Q1IF9z23Nyrooc0U3zjzXV6q6zkx
 35v6y7MG+GeEU02O/+UENZCidrPjExp6TBg11GxMqO6HVBbEdxSJpm663ey73ydRz6kM
 OS3Gw2KQAG/C+t7CqVTWEsRVJUJngKbQKUmKXNYdMWnQNeFoa43QRcbOdhXh8fK/SHsE
 GzIe9iMTMsnZn6250Vj9PHu5wy5rjElIQ5b++XNxWaH7Gigc1Y28e+gd03WFjy7jxBbt
 CZJtdsn/tNLwD3uEXr0V/S4MJ9zExD1x5m5gvdgZYmDBLUtE8trtj6sg5t92uaei0EIm
 vHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686820849; x=1689412849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YgHjMHtSYZhN8oPF8HkKVvy8pzvG/i3unibysV2iWfY=;
 b=bJXMV+LTICf7bYGoZIG3XRFyBV0n5l+t3Tq62rT8sJCn6b3oiqp6jOlYHLyDwj5SZV
 OnYAIZBpX8FA7Sj+AQMlykC5hrqOPNv90xO9YK8IcFDGBpYpUSUyELjW2RK2KWRj/Ohc
 hvAenYH3YEHIe+ZETvAnTOZx93+KgTWKOrUNBAtYvs4RFO9QT4m7WA7tj6ZSCH+/dPp7
 m55umtrVMzc3XRyak2NFfZAiGSwNST+7Ubkqa/WvJy2gMOtYhQBUmssC0l1JeOc9Dr1h
 SEk7hfEfj6qAZHkdM8kb+m5tq1481uN3HXcyAt/1vJK/LyAjEKp4MUlHAQ/x307MDQ4e
 c6Jg==
X-Gm-Message-State: AC+VfDyQjxCLxStTbNElZUmLt5EhofZWls6K6cEEhu1rOoCkPYBznmby
 iJGV+x2+cK+ekXjfPJw/GyGkmfN/K+kd0F1iLpg=
X-Google-Smtp-Source: ACHHUZ78ikd1zAkqBxk0UJW4n/5RahgKZcBPO/Micn0kDmkU5Exl094BedkHaGmgRkbuQ0f2GPFPjhSDPH1uQBePO0k=
X-Received: by 2002:a4a:ba0a:0:b0:55b:3a17:14eb with SMTP id
 b10-20020a4aba0a000000b0055b3a1714ebmr11875587oop.2.1686820848937; Thu, 15
 Jun 2023 02:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230607125932.3518547-1-l.stach@pengutronix.de>
 <8c36b8bc-5a0d-75f7-265c-b0191979165a@loongson.cn>
 <d17de4ebfd08faa23238ece2ad0b737bf271498b.camel@pengutronix.de>
 <36946504-45c3-f0bc-3e4a-9106d9f4a2dd@loongson.cn>
In-Reply-To: <36946504-45c3-f0bc-3e4a-9106d9f4a2dd@loongson.cn>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 15 Jun 2023 11:20:37 +0200
Message-ID: <CAH9NwWeB-MudNvuyuH1kUNiyWQTZ5Y4fuiB4uNKtutCKL3EZPg@mail.gmail.com>
Subject: Re: drm/etnaviv: slow down FE idle polling
To: Sui Jingfeng <suijingfeng@loongson.cn>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

Am Do., 15. Juni 2023 um 11:16 Uhr schrieb Sui Jingfeng
<suijingfeng@loongson.cn>:
>
> Hi,
>
> On 2023/6/15 17:04, Lucas Stach wrote:
> > Am Donnerstag, dem 15.06.2023 um 12:09 +0800 schrieb Sui Jingfeng:
> >> Hi,
> >>
> >> On 2023/6/7 20:59, Lucas Stach wrote:
> >>> Currently the FE is spinning way too fast when polling for new work i=
n
> >> 'way' -> 'away'
> >>> the FE idleloop.
> >> 'idleloop' -> 'idle loop'
> >>>    As each poll fetches 16 bytes from memory, a GPU running
> >>> at 1GHz with the current setting of 200 wait cycle between fetches ca=
uses
> >>> 80 MB/s of memory traffic just to check for new work when the GPU is
> >>> otherwise idle, which is more FE traffic than in some GPU loaded case=
s.
> >>>
> >>> Significantly increase the number of wait cycles to slow down the pol=
l
> >>> interval to ~30=C2=B5s, limiting the FE idle memory traffic to 512 KB=
/s, while
> >>> providing a max latency which should not hurt most use-cases. The FE =
WAIT
> >>> command seems to have some unknown discrete steps in the wait cycles
> >> add a comma here.
> >>>    so
> >>> we may over/undershoot the target a bit, but that should be harmless.
> >> overshoot or undershoot
> >>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> >>> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
> >>> ---
> >>>    drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 11 ++++++-----
> >>>    drivers/gpu/drm/etnaviv/etnaviv_gpu.c    |  7 +++++++
> >>>    drivers/gpu/drm/etnaviv/etnaviv_gpu.h    |  1 +
> >>>    3 files changed, 14 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/d=
rm/etnaviv/etnaviv_buffer.c
> >>> index cf741c5c82d2..384df1659be6 100644
> >>> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> >>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> >>> @@ -53,11 +53,12 @@ static inline void CMD_END(struct etnaviv_cmdbuf =
*buffer)
> >>>     OUT(buffer, VIV_FE_END_HEADER_OP_END);
> >>>    }
> >>>
> >>> -static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer)
> >>> +static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
> >>> +                       unsigned int waitcycles)
> >>>    {
> >>>     buffer->user_size =3D ALIGN(buffer->user_size, 8);
> >>>
> >>> -   OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | 200);
> >>> +   OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
> >>>    }
> >>>
> >>>    static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
> >>> @@ -168,7 +169,7 @@ u16 etnaviv_buffer_init(struct etnaviv_gpu *gpu)
> >>>     /* initialize buffer */
> >>>     buffer->user_size =3D 0;
> >>>
> >>> -   CMD_WAIT(buffer);
> >>> +   CMD_WAIT(buffer, gpu->fe_waitcycles);
> >>>     CMD_LINK(buffer, 2,
> >>>              etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_=
mapping)
> >>>              + buffer->user_size - 4);
> >>> @@ -320,7 +321,7 @@ void etnaviv_sync_point_queue(struct etnaviv_gpu =
*gpu, unsigned int event)
> >>>     CMD_END(buffer);
> >>>
> >>>     /* Append waitlink */
> >>> -   CMD_WAIT(buffer);
> >>> +   CMD_WAIT(buffer, gpu->fe_waitcycles);
> >>>     CMD_LINK(buffer, 2,
> >>>              etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_=
mapping)
> >>>              + buffer->user_size - 4);
> >>> @@ -503,7 +504,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu=
, u32 exec_state,
> >>>
> >>>     CMD_LOAD_STATE(buffer, VIVS_GL_EVENT, VIVS_GL_EVENT_EVENT_ID(even=
t) |
> >>>                    VIVS_GL_EVENT_FROM_PE);
> >>> -   CMD_WAIT(buffer);
> >>> +   CMD_WAIT(buffer, gpu->fe_waitcycles);
> >>>     CMD_LINK(buffer, 2,
> >>>              etnaviv_cmdbuf_get_va(buffer, &gpu->mmu_context->cmdbuf_=
mapping)
> >>>              + buffer->user_size - 4);
> >>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/=
etnaviv/etnaviv_gpu.c
> >>> index 41aab1aa330b..8c20dff32240 100644
> >>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >>> @@ -493,6 +493,13 @@ static void etnaviv_gpu_update_clock(struct etna=
viv_gpu *gpu)
> >>>             clock |=3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
> >>>             etnaviv_gpu_load_clock(gpu, clock);
> >>>     }
> >>> +
> >>> +   /*
> >>> +    * Choose number of wait cycles to target a ~30us (1/32768) max l=
atency
> >>> +    * until new work is picked up by the FE when it polls in the idl=
e loop.
> >>> +    */
> >>> +   gpu->fe_waitcycles =3D min(gpu->base_rate_core >> (15 - gpu->freq=
_scale),
> >>> +                            0xffffUL);
> >> This patch is NOT effective on our hardware GC1000 v5037 (ls7a1000 +
> >> ls3a5000).
> >>
> >> As the gpu->base_rate_core is 0,  so, in the end gpu->fe_waitcycles is
> >> also zero.
> >>
> > Uh, that's a problem, as the patch will then have the opposite effect
> > on your platform by speeding up the idle loop. Thanks for catching
> > this! I'll improve the patch to keep a reasonable amount of wait cycles
> > in this case.
>
> It's OK, no big problem as far as I can see. (it my platform's problem,
> not your problem)
>

It will become a problem as it eats up the bandwidth that you want to
spend for real graphic work.

>
> Merge it is also OK, if we found something wrong we could fix it with a
> another patch.
>

Hmm.. I think that the fix for this problem is more or less an extra
if so I would love to see a proper fix
before this patch gets merged.

> > Regards,
> > Lucas
> >
> >> But after apply this path, the glmark2 still run happily, no influence=
. So
> >>
> >>
> >> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >>
> >>>    }
> >>>
> >>>    static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
> >>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/=
etnaviv/etnaviv_gpu.h
> >>> index 98c6f9c320fc..e1e1de59c38d 100644
> >>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> >>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> >>> @@ -150,6 +150,7 @@ struct etnaviv_gpu {
> >>>     struct clk *clk_shader;
> >>>
> >>>     unsigned int freq_scale;
> >>> +   unsigned int fe_waitcycles;
> >>>     unsigned long base_rate_core;
> >>>     unsigned long base_rate_shader;
> >>>    };
>
> --
> Jingfeng
>


--=20
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
