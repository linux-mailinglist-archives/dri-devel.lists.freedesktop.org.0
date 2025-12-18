Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE117CCBCF1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 13:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938BF10E04A;
	Thu, 18 Dec 2025 12:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ETaaGTSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8542A10E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766061510;
 bh=PbmbSGRTKNSlpkIMIcAeqY7irz7C8Mi8TAsByNoZXMM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ETaaGTSL6qR2F592lIRCNEvXi5wNXkJNBmV30CMka//yOkrC5lsKCu80cq0ZK2JRs
 daoXV8L59oPoiZrYjNLGu+uH1BdtZFJjHTzCdnvm/n2D8tw1KcMqN+lVNMq3vS88im
 6zjlSfrX2WM57TZpofluyheazYdEGzLqt1MRQrvR09z0/3EIMelsg/TC9aao8NycZN
 5LSFbTOlpqBzPIPoY+zrqFmNZnbSwmoUpNaI0Z9w34UGO7houQ1iyXvsqlNmXxb/As
 zO+H+QD2xwExMG4tkkbXUNIDr/uCfUDD28C9lZEuFrBhzGUD9uw+zCFtjqKNPttyw0
 djk8iRjFf4CmA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E57B17E0184;
 Thu, 18 Dec 2025 13:38:29 +0100 (CET)
Date: Thu, 18 Dec 2025 13:38:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chia-I Wu
 <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 1/3] drm/panthor: Add panthor_*_irq_mask_set helper
Message-ID: <20251218133825.64177ebf@fedora>
In-Reply-To: <20251217-panthor-tracepoints-v4-1-916186cb8d03@collabora.com>
References: <20251217-panthor-tracepoints-v4-0-916186cb8d03@collabora.com>
 <20251217-panthor-tracepoints-v4-1-916186cb8d03@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 17 Dec 2025 15:29:38 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> Add a function to modify an IRQ's mask. If the IRQ is currently active,
> it will write to the register, otherwise it will only set the struct
> member.
> 
> There's no locking done to guarantee exclusion with the other two
> functions that touch the IRQ mask, and it should only be called from a
> context where the circumstances guarantee no concurrent access is
> performed.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index f35e52b9546a..894d28b3eb02 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -470,6 +470,13 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
>  					 panthor_ ## __name ## _irq_threaded_handler,		\
>  					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
>  					 pirq);							\
> +}												\
> +												\
> +static inline void panthor_ ## __name ## _irq_mask_set(struct panthor_irq *pirq, u32 mask)	\
> +{												\
> +	pirq->mask = mask;									\
> +	if (!atomic_read(&pirq->suspended))							\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);			\

This is racy if called outside the (threaded) IRQ handler, which I
believe is the case since its called when a trace point is enabled:

1. _irq_raw_handler() sets INT_MASK to zero to avoid receiving
interrupts from this IRQ line until the threaded handler has processed
events

2. _irq_mask_set() sets INT_MASK to something non-zero, meaning the
interrupt will be re-enabled before events have been processed

this leads to at least one spurious interrupt being received before we
set INT_MASK to zero again. Probably not the end of the world, but if
we can avoid it, that'd be better.

Also, I'd like to see if we could re-purpose panthor_irq::mask to be
the mask of events the user wants to monitor instead of a pure proxy of
INT_MASK. If we do that, and we make panthor_irq::mask an atomic_t, we
can add panthor_xxx_irq_{enable,disable}_event() helpers that would do
the atomic_{or,and} on panthor_irq::mask, and write the new value to
_INT_MASK if:
- we're processing events in the threaded handler (we would need
  another field, or we'd need to turn suspended into a state that can
  encode more than just "suspended or not")
- the device is not suspended (that test you already have)

>  }
>  
>  extern struct workqueue_struct *panthor_cleanup_wq;
> 

