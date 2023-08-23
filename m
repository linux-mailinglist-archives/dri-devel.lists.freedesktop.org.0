Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0FD785A8A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 16:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37DF10E436;
	Wed, 23 Aug 2023 14:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A2C10E42E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 14:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692801121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzdoCs2Mn27/sh3oWYgFmEgOxiDPY2yxYeRmbUpWAOY=;
 b=Ul+fLz6cwzESlZIgU9/+1gAJ+F+pwvRic/ILmLJLMYcR4QKw6NL+KMlN3esdcbrCqBTRh9
 E1PednEjmHM0bNLJ22ybM90cR8hpygHHGTYIvYEXm2fLCwbrhP9dnsLXXHb2LUPrnXSNG+
 uhr+qGGr7LmL8TzC8Oa5ursfDVGK2S4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-3QPQYcItOJq4d3KYclRMrg-1; Wed, 23 Aug 2023 10:31:59 -0400
X-MC-Unique: 3QPQYcItOJq4d3KYclRMrg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a35b0d4ceso420405066b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 07:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692801118; x=1693405918;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GzdoCs2Mn27/sh3oWYgFmEgOxiDPY2yxYeRmbUpWAOY=;
 b=Es41x4FVO3Rm83Q5dPOq+3+J81A9Z927od2bkWiHT6u0uqDeXhwFQVYsfgfOxr7oq0
 ebXohuWndhn5PUBO5PiQfqnJeXpf8Gtx3f09WJoPS32FUTg3L/kjRLPLQIk1Cv3bQrqp
 sZ449uFnb3TpEKnQfe3z2q4gyPsuiKwnVrjteuo/6WCjaexhAUqAmbOZ1aT5mRvBmh2/
 iNUdAf40UGGzKKSEy2APePlA4549Gzo9HwnhRnx9leyRVzyRdBD+8bOYGFXuNgcdbv11
 ZSwUoNkEXs2ST7ltdd1v3YW//fhX0oIMrNlvzQrXXPFa1oRNATMLTHs7fZRpbDdS68wK
 OxdQ==
X-Gm-Message-State: AOJu0YxKabRPC0+LgQwrUoG9weoU4MF4jxr7meq5iThPHII/CVrMf4v3
 H3DbFmX7LLm1r7BOvTjmI2mjYqC96/VJr//sqaYX8PG06pRDuVNMed9YenIuUJMQP14JhaDf8lw
 OljbiRtrzleSpJHG351maEKBD9hl7
X-Received: by 2002:a17:907:b15:b0:99b:ddac:d9d9 with SMTP id
 h21-20020a1709070b1500b0099bddacd9d9mr9977997ejl.53.1692801118496; 
 Wed, 23 Aug 2023 07:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZe+M+2IV0Biir6gicbEcM3wtv1kibH9AhosiD4ierXNGvPNyLBv2sq9vftQipzU9U4NlSog==
X-Received: by 2002:a17:907:b15:b0:99b:ddac:d9d9 with SMTP id
 h21-20020a1709070b1500b0099bddacd9d9mr9977977ejl.53.1692801118169; 
 Wed, 23 Aug 2023 07:31:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 mj14-20020a170906af8e00b0099c53c4407dsm9835727ejb.78.2023.08.23.07.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 07:31:57 -0700 (PDT)
Message-ID: <19d68804-87f4-5f89-4a63-b85a9b204cd0@redhat.com>
Date: Wed, 23 Aug 2023 14:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next] drm/nouveau: uapi: don't pass NO_PREFETCH
 flag implicitly
To: Faith Ekstrand <faith@gfxstrand.net>
References: <20230822234139.11185-1-dakr@redhat.com>
 <CAOFGe978DoPqTqoFAMv84fcuyLR47fkGZ3NCn4dyD69i4QoobQ@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CAOFGe978DoPqTqoFAMv84fcuyLR47fkGZ3NCn4dyD69i4QoobQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/23/23 04:53, Faith Ekstrand wrote:
> On Tue, Aug 22, 2023 at 6:41 PM Danilo Krummrich <dakr@redhat.com <mailto:dakr@redhat.com>> wrote:
> 
>     Currently, NO_PREFETCH is passed implicitly through
>     drm_nouveau_gem_pushbuf_push::length and drm_nouveau_exec_push::va_len.
> 
>     Since this is a direct representation of how the HW is programmed it
>     isn't really future proof for a uAPI. Hence, fix this up for the new
>     uAPI and split up the va_len field of struct drm_nouveau_exec_push,
>     such that we keep 32bit for va_len and 32bit for flags.
> 
>     For drm_nouveau_gem_pushbuf_push::length at least provide
>     NOUVEAU_GEM_PUSHBUF_NO_PREFETCH to indicate the bit shift.
> 
>     While at it, fix up nv50_dma_push() as well, such that the caller
>     doesn't need to encode the NO_PREFETCH flag into the length parameter.
> 
>     Signed-off-by: Danilo Krummrich <dakr@redhat.com <mailto:dakr@redhat.com>>
>     ---
>       drivers/gpu/drm/nouveau/nouveau_dma.c  |  7 +++++--
>       drivers/gpu/drm/nouveau/nouveau_dma.h  |  8 ++++++--
>       drivers/gpu/drm/nouveau/nouveau_exec.c | 15 ++++++++++++---
>       drivers/gpu/drm/nouveau/nouveau_gem.c  |  6 ++++--
>       include/uapi/drm/nouveau_drm.h         |  8 +++++++-
>       5 files changed, 34 insertions(+), 10 deletions(-)
> 
>     diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
>     index b90cac6d5772..059925e5db6a 100644
>     --- a/drivers/gpu/drm/nouveau/nouveau_dma.c
>     +++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
>     @@ -69,16 +69,19 @@ READ_GET(struct nouveau_channel *chan, uint64_t *prev_get, int *timeout)
>       }
> 
>       void
>     -nv50_dma_push(struct nouveau_channel *chan, u64 offset, int length)
>     +nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
>     +             bool prefetch)
>       {
>              struct nvif_user *user = &chan->drm->client.device.user;
>              struct nouveau_bo *pb = chan->push.buffer;
>              int ip = (chan->dma.ib_put * 2) + chan->dma.ib_base;
> 
>              BUG_ON(chan->dma.ib_free < 1);
>     +       WARN_ON(length > NV50_DMA_PUSH_MAX_LENGTH);
> 
>              nouveau_bo_wr32(pb, ip++, lower_32_bits(offset));
>     -       nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8);
>     +       nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8 |
>     +                       (prefetch ? 0 : (1 << 31)));
> 
> 
> It feels a bit weird to be inverting this bit twice. IDK that it matters, though.

I usually avoid negated argument names, in this case it kinda makes sense though.

> 
> 
>              chan->dma.ib_put = (chan->dma.ib_put + 1) & chan->dma.ib_max;
> 
>     diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
>     index 035a709c7be1..fb471c357336 100644
>     --- a/drivers/gpu/drm/nouveau/nouveau_dma.h
>     +++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
>     @@ -31,7 +31,8 @@
>       #include "nouveau_chan.h"
> 
>       int nouveau_dma_wait(struct nouveau_channel *, int slots, int size);
>     -void nv50_dma_push(struct nouveau_channel *, u64 addr, int length);
>     +void nv50_dma_push(struct nouveau_channel *, u64 addr, u32 length,
>     +                  bool prefetch);
> 
>       /*
>        * There's a hw race condition where you can't jump to your PUT offset,
>     @@ -45,6 +46,9 @@ void nv50_dma_push(struct nouveau_channel *, u64 addr, int length);
>        */
>       #define NOUVEAU_DMA_SKIPS (128 / 4)
> 
>     +/* Maximum push buffer size. */
>     +#define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
>     +
>       /* Object handles - for stuff that's doesn't use handle == oclass. */
>       enum {
>              NvDmaFB         = 0x80000002,
>     @@ -89,7 +93,7 @@ FIRE_RING(struct nouveau_channel *chan)
> 
>              if (chan->dma.ib_max) {
>                      nv50_dma_push(chan, chan->push.addr + (chan->dma.put << 2),
>     -                             (chan->dma.cur - chan->dma.put) << 2);
>     +                             (chan->dma.cur - chan->dma.put) << 2, true);
>              } else {
>                      WRITE_PUT(chan->dma.cur);
>              }
>     diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
>     index 0f927adda4ed..a123b07b2adf 100644
>     --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
>     +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
>     @@ -164,8 +164,10 @@ nouveau_exec_job_run(struct nouveau_job *job)
>              }
> 
>              for (i = 0; i < exec_job->push.count; i++) {
>     -               nv50_dma_push(chan, exec_job->push.s[i].va,
>     -                             exec_job->push.s[i].va_len);
>     +               struct drm_nouveau_exec_push *p = &exec_job->push.s[i];
>     +               bool prefetch = !(p->flags & DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH);
>     +
>     +               nv50_dma_push(chan, p->va, p->va_len, prefetch);
>              }
> 
>              ret = nouveau_fence_emit(fence, chan);
>     @@ -223,7 +225,14 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,
>       {
>              struct nouveau_exec_job *job;
>              struct nouveau_job_args args = {};
>     -       int ret;
>     +       int i, ret;
>     +
>     +       for (i = 0; i < __args->push.count; i++) {
>     +               struct drm_nouveau_exec_push *p = &__args->push.s[i];
>     +
>     +               if (p->va_len > NV50_DMA_PUSH_MAX_LENGTH)
>     +                       return -EINVAL;
> 
> 
> This can probably be wrapped in unlikely().  Also, it'd be nice if we printed an error message like we do if you try to push too many things.

Yep, will do.

> 
> Looks good. Thanks!
> 
> Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com <mailto:faith.ekstrand@collabora.com>>
> 
>     +       }
> 
>              job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
>              if (!job)
>     diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>     index f39360870c70..2f3dc4d71657 100644
>     --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>     +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>     @@ -856,9 +856,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>                      for (i = 0; i < req->nr_push; i++) {
>                              struct nouveau_vma *vma = (void *)(unsigned long)
>                                      bo[push[i].bo_index].user_priv;
>     +                       u64 addr = vma->addr + push[i].offset;
>     +                       u32 length = push[i].length & ~NOUVEAU_GEM_PUSHBUF_NO_PREFETCH;
>     +                       bool prefetch = !(push[i].length & NOUVEAU_GEM_PUSHBUF_NO_PREFETCH);
> 
>     -                       nv50_dma_push(chan, vma->addr + push[i].offset,
>     -                                     push[i].length);
>     +                       nv50_dma_push(chan, addr, length, prefetch);
>                      }
>              } else
>              if (drm->client.device.info <http://client.device.info>.chipset >= 0x25) {
>     diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
>     index b1ad9d5ffce8..8f16724b5d05 100644
>     --- a/include/uapi/drm/nouveau_drm.h
>     +++ b/include/uapi/drm/nouveau_drm.h
>     @@ -138,6 +138,7 @@ struct drm_nouveau_gem_pushbuf_push {
>              __u32 pad;
>              __u64 offset;
>              __u64 length;
>     +#define NOUVEAU_GEM_PUSHBUF_NO_PREFETCH (1 << 23)
>       };
> 
>       struct drm_nouveau_gem_pushbuf {
>     @@ -338,7 +339,12 @@ struct drm_nouveau_exec_push {
>              /**
>               * @va_len: the length of the push buffer mapping
>               */
>     -       __u64 va_len;
>     +       __u32 va_len;
>     +       /**
>     +        * flags: the flags for this push buffer mapping
>     +        */
>     +       __u32 flags;
>     +#define DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH 0x1
>       };
> 
>       /**
> 
>     base-commit: ad1367f831f8743746a1f49705c28e36a7c95525
>     -- 
>     2.41.0
> 

