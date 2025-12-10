Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E4CCB3637
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 16:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532E610E067;
	Wed, 10 Dec 2025 15:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B30A210E067
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 15:56:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2203153B;
 Wed, 10 Dec 2025 07:55:57 -0800 (PST)
Received: from [10.57.45.72] (unknown [10.57.45.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39B923F73B;
 Wed, 10 Dec 2025 07:56:01 -0800 (PST)
Message-ID: <6b49886e-2290-4d27-b85a-3cccd65441b2@arm.com>
Date: Wed, 10 Dec 2025 15:55:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/panthor: Add panthor_*_irq_mask_set helper
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com>
 <20251210-panthor-tracepoints-v2-1-ace2e29bad0f@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251210-panthor-tracepoints-v2-1-ace2e29bad0f@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 10/12/2025 14:30, Nicolas Frattaroli wrote:
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

Usually it's best to add the helper at the same time as the first user
(especially if it's small like this), otherwise it's really difficult to
see whether the helper is the right shape.

The comment about no locking is worrying without the context to check if
this is reasonable.

Thanks,
Steve

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
>  }
>  
>  extern struct workqueue_struct *panthor_cleanup_wq;
> 

