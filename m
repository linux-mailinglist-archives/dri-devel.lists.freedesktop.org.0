Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF87C52407
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC2E10E0A7;
	Wed, 12 Nov 2025 12:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DukIzBAk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17EF10E0A7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z/oFAOOmMQ0/xmq4cK9tIn6jRgDAk04qzI7JFjovQ8Y=; b=DukIzBAkAnixVqORGlyaGIFYbr
 9LfCkYJjWBa0fqrwQlD10XNHtrgGUhDSLfFm2qbshu+LGjeA/Qba7Feevaeg7BiYuLnonba4ze239
 BEtNCNpv05WkadkaFVaheazB/h1jLyLCyfboNx7Ssvf+AMmRZwACOhYlyYL1TD66Qxz9gq9FkJayj
 eDnvxMYNCUgxQ+Dc9KKxF4PD+VFrWy1Soi4NvG2Nu5fT9FZEo8uZIKeklUTPkh8fftaOYYcpBvurx
 px2RiTrbk9xMv70d2r1G9Hoq3TQj/VZbyv9w8mU2papyZQuWb5Dp69fnf+Uil9+KRp1umohXASLbZ
 mxyIRUUQ==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.24.35.236])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vJ9xk-005YHq-29; Wed, 12 Nov 2025 13:28:36 +0100
Message-ID: <7d1df5ed-7119-4e59-b1e0-e54aa572282b@igalia.com>
Date: Wed, 12 Nov 2025 09:28:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: Replace lock/unlock pattern to use guard
To: Erick Karanja <karanja99erick@gmail.com>, mripard@kernel.org,
 dave.stevenson@raspberrypi.com
Cc: kernel-list@raspberrypi.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251112080220.223318-1-karanja99erick@gmail.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <20251112080220.223318-1-karanja99erick@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Erick,

On 12/11/25 05:02, Erick Karanja wrote:
> Replace manual lock/unlock patterns with guard.
> This simplifies the code.
> 
> Generated-by: Coccinelle SmPL
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>   drivers/gpu/drm/vc4/vc4_v3d.c | 45 ++++++++++++++---------------------
>   1 file changed, 18 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> index bb09df5000bd..8271a6610d6e 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -130,17 +130,15 @@ vc4_v3d_pm_get(struct vc4_dev *vc4)
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return -ENODEV;
>   
> -	mutex_lock(&vc4->power_lock);
> +	guard(mutex)(&vc4->power_lock);
>   	if (vc4->power_refcount++ == 0) {
>   		int ret = pm_runtime_get_sync(&vc4->v3d->pdev->dev);
>   
>   		if (ret < 0) {
>   			vc4->power_refcount--;
> -			mutex_unlock(&vc4->power_lock);
>   			return ret;
>   		}
>   	}
> -	mutex_unlock(&vc4->power_lock);
>   
>   	return 0;
>   }
> @@ -151,12 +149,11 @@ vc4_v3d_pm_put(struct vc4_dev *vc4)
>   	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
>   		return;
>   
> -	mutex_lock(&vc4->power_lock);
> +	guard(mutex)(&vc4->power_lock);
>   	if (--vc4->power_refcount == 0) {
>   		pm_runtime_mark_last_busy(&vc4->v3d->pdev->dev);
>   		pm_runtime_put_autosuspend(&vc4->v3d->pdev->dev);
>   	}
> -	mutex_unlock(&vc4->power_lock);
>   }
>   
>   static void vc4_v3d_init_hw(struct drm_device *dev)
> @@ -173,7 +170,6 @@ static void vc4_v3d_init_hw(struct drm_device *dev)
>   int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
>   {
>   	struct drm_device *dev = &vc4->base;
> -	unsigned long irqflags;
>   	int slot;
>   	uint64_t seqno = 0;
>   	struct vc4_exec_info *exec;
> @@ -182,23 +178,22 @@ int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
>   		return -ENODEV;
>   
>   try_again:
> -	spin_lock_irqsave(&vc4->job_lock, irqflags);
> -	slot = ffs(~vc4->bin_alloc_used);
> -	if (slot != 0) {
> -		/* Switch from ffs() bit index to a 0-based index. */
> -		slot--;
> -		vc4->bin_alloc_used |= BIT(slot);
> -		spin_unlock_irqrestore(&vc4->job_lock, irqflags);
> -		return slot;
> -	}
> +	scoped_guard (spinlock_irqsave, &vc4->job_lock) {
> +		slot = ffs(~vc4->bin_alloc_used);
> +		if (slot != 0) {
> +			/* Switch from ffs() bit index to a 0-based index. */
> +			slot--;
> +			vc4->bin_alloc_used |= BIT(slot);
> +			return slot;
> +		}
>   
> -	/* Couldn't find an open slot.  Wait for render to complete
> +		/* Couldn't find an open slot.  Wait for render to complete
>   	 * and try again.
>   	 */

Could you please align the rest of the comment?

Best Regards,
- Maíra
