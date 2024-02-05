Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38898849F64
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 17:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9558311221F;
	Mon,  5 Feb 2024 16:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WxMBUs5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFE611221F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707150144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFSkqsfDKWBtn86ITk4OANp1ap0oClrKRbCvFvcm3V0=;
 b=WxMBUs5RPpbk3EEAj8hE9mnrNyaHJOzKJv21yHdUHHkpduS8WmLhSIRBrCs1j1+Xc5NCV8
 1hZP4HeKLWNdDXPBzsVDYv61RlqzB+MZO9ScSSGPPm9nYHEnCIx6pRnYj2kvaBuw4NX4QK
 8aid45UmLAoTCNf0MgDV8abz0NfCVgM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-REk4I_6KP6CWhjFcv3to9A-1; Mon, 05 Feb 2024 11:22:22 -0500
X-MC-Unique: REk4I_6KP6CWhjFcv3to9A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33b0c264adbso2575206f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 08:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707150141; x=1707754941;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aFSkqsfDKWBtn86ITk4OANp1ap0oClrKRbCvFvcm3V0=;
 b=lV/CnLxTDbsLB528nUCj4+sqkdFsVKJz/tyAkxA2uMaAnQ1inkPvq6mN51hh/5/rnW
 UjMkDyqrFZ8WVgd8OLqC6XWVXSXRF4h3Udtvje9qTdBILcjw/h/M+Ki51WE/al1GeoV/
 3NRXNXq3fZi3cL5HRzIKvyDRSHW9J0AVe0eXOiDYifEdomVhHOzIV1Q+NWGy5YjaIe02
 3zGyK9EPUivsglNYUHJGdTSRAskMsrlixmx8rXzIs4QeiOyoeFOsewSHvKa3fSBb0JAn
 fxruCF32m2kKggVMxgiU4nFfmrCo0jDRAVBCU0sC0N03oHn+rbLrY2iCEXBZjW82M5z/
 BaSA==
X-Gm-Message-State: AOJu0Yyzj1dbVbH9mg/ZAM0YqORl0TE2hNwlZN6jOCVAQ99Qv6ImBfac
 +Souzd98UjpaOEbW44oUx96T/oMMZ07AJSGjW11yokRi3DtfZklk5ktNKqQuneFDeyLRw+eN6XD
 P3TrDUjMT0+asX/rueXod/db06EoZjE74XaDFusaPkyqggLjEHOLRP1MuY2s6NLh32A==
X-Received: by 2002:a5d:410f:0:b0:33b:1b4f:e54 with SMTP id
 l15-20020a5d410f000000b0033b1b4f0e54mr6571wrp.34.1707150141590; 
 Mon, 05 Feb 2024 08:22:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEesCh+Gt9x87aXUHQ2p9uIQnEKqnPayczL5b/+lL3NNUZUX0zkCF6FtjPbxtGmbDUBWFxAhg==
X-Received: by 2002:a5d:410f:0:b0:33b:1b4f:e54 with SMTP id
 l15-20020a5d410f000000b0033b1b4f0e54mr6559wrp.34.1707150141261; 
 Mon, 05 Feb 2024 08:22:21 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUZcl5twdVOgesW8D5cVm+rsHhmwrsgihALHMwJQwHfTZE4LAQDTS5y2vDz9P0AXbB2rNMl0X5lGb9vR9l25F9wTKnRkr5IFUHaSJhFghhV
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a056000004200b0033b08b9cd9dsm8386302wrx.79.2024.02.05.08.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 08:22:20 -0800 (PST)
Message-ID: <133266ac-7239-4233-a19d-cdc7563d401c@redhat.com>
Date: Mon, 5 Feb 2024 17:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: offload fence uevents work to workqueue
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240129015053.1687418-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240129015053.1687418-1-airlied@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/29/24 02:50, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This should break the deadlock between the fctx lock and the irq lock.
> 
> This offloads the processing off the work from the irq into a workqueue.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Nouveau's scheduler uses a dedicated wq, hence from this perspective it's
safe deferring fence signalling to the kernel global wq. However, I wonder
if we could create deadlocks by building dependency chains into other
drivers / kernel code that, by chance, makes use of the kernel global wq as
well.

Admittedly, even if, it's gonna be extremely unlikely given that
WQ_MAX_ACTIVE == 512. But maybe it'd be safer to use a dedicated wq.

Also, do we need to CC stable?

> ---
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 24 ++++++++++++++++++------
>   drivers/gpu/drm/nouveau/nouveau_fence.h |  1 +
>   2 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index ca762ea55413..93f08f9479d8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -103,6 +103,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
>   void
>   nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
>   {
> +	cancel_work_sync(&fctx->uevent_work);
>   	nouveau_fence_context_kill(fctx, 0);
>   	nvif_event_dtor(&fctx->event);
>   	fctx->dead = 1;
> @@ -145,12 +146,13 @@ nouveau_fence_update(struct nouveau_channel *chan, struct nouveau_fence_chan *fc
>   	return drop;
>   }
>   
> -static int
> -nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc)
> +static void
> +nouveau_fence_uevent_work(struct work_struct *work)
>   {
> -	struct nouveau_fence_chan *fctx = container_of(event, typeof(*fctx), event);
> +	struct nouveau_fence_chan *fctx = container_of(work, struct nouveau_fence_chan,
> +						       uevent_work);
>   	unsigned long flags;
> -	int ret = NVIF_EVENT_KEEP;
> +	int drop = 0;
>   
>   	spin_lock_irqsave(&fctx->lock, flags);
>   	if (!list_empty(&fctx->pending)) {
> @@ -160,11 +162,20 @@ nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc
>   		fence = list_entry(fctx->pending.next, typeof(*fence), head);
>   		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
>   		if (nouveau_fence_update(chan, fctx))
> -			ret = NVIF_EVENT_DROP;
> +			drop = 1;
>   	}
> +	if (drop)
> +		nvif_event_block(&fctx->event);
> +
>   	spin_unlock_irqrestore(&fctx->lock, flags);
> +}
>   
> -	return ret;
> +static int
> +nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc)
> +{
> +	struct nouveau_fence_chan *fctx = container_of(event, typeof(*fctx), event);
> +	schedule_work(&fctx->uevent_work);
> +	return NVIF_EVENT_KEEP;
>   }
>   
>   void
> @@ -178,6 +189,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
>   	} args;
>   	int ret;
>   
> +	INIT_WORK(&fctx->uevent_work, nouveau_fence_uevent_work);
>   	INIT_LIST_HEAD(&fctx->flip);
>   	INIT_LIST_HEAD(&fctx->pending);
>   	spin_lock_init(&fctx->lock);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index 64d33ae7f356..8bc065acfe35 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -44,6 +44,7 @@ struct nouveau_fence_chan {
>   	u32 context;
>   	char name[32];
>   
> +	struct work_struct uevent_work;
>   	struct nvif_event event;
>   	int notify_ref, dead, killed;
>   };

