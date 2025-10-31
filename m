Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD5FC247A5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6326010EB01;
	Fri, 31 Oct 2025 10:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="MgQAUrWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5F010EAFF
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:35:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso1282831f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761906906; x=1762511706;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PdrymPQFa+0z7DHo2EakNjMe5XtHWaGvX1vPpLrRBxs=;
 b=MgQAUrWhtLtsLnGDlEJZ0w6b8b/VqkB+F1C8UGSHJcxxsqfqvxaJfyJn+KbkN2l6/r
 tr31BXj7lXqZ4fmx1CbgKp48EWvdsAm08mDsXkDQZYwm8pKlm4hnilDBHVN/svVjfrUj
 zX+4vLsyusKLd16vVPjhXg2cW9ZBF4HyX3BZHhKyVR8b4N7v7njLJtlEXkPoaDEJBb3G
 0otGfsqEsmwyfDu7HQntV6tp7fH03XswxnZQT42obMojwBxPybiS3AQrNG9iD11ssopS
 eCHHOl9CUYgpEn0J1NN4cxKxjCxl2/t6GNd86herjsnYxiE42aOGQ8JB/VJ/PcgDn/h3
 zAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906906; x=1762511706;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PdrymPQFa+0z7DHo2EakNjMe5XtHWaGvX1vPpLrRBxs=;
 b=eYiLloIG5C95xYFpPGGXlIoIvW9O0o54A0acIsqN2yoVFcCthtvvUpq8+KeVL27tKJ
 QGCPCMI783YjY3U3a9FBh/28OJETI1G4MywxXNhHIaIhZaQJOlNZX0PG0Yhe7Hhctc0g
 NF5o6KoBP3MsBrP04RVVeJHRHQSlIm0CfT5PNGMUulLmf2AcHV7+XpgVT4yB2ENfiykW
 NmudFsyZ3qXEMTmCQni+t5PJLWaArDJ49v5pG/n/1IJMgJJ/ngcF4gL5FIzrJGJ/Dogh
 XK93DeUxsdtpnwv8sImE0h5fak5/gHnmAV0QeJUHwqNNrcvhp9es64Nlg+g+anqpLC6L
 FnVQ==
X-Gm-Message-State: AOJu0Yz9+DJfT+71RfsnoK0GaeBQzlsSwxHH9QxX9ZuKowdyKXi5mQY1
 FGG5+eugUlNN1tT3O2wEjOIyFRo1XfzOr9Y/jiQQIIqxCxTeuP5dsJoOKRkywOztpYM=
X-Gm-Gg: ASbGncubZRCEKl8VwpwZrSRVEqKYkC+1TRBKveuWgttLTQao+SBQds2YHJfrv8xV5K1
 +lZSuOcsywkxNwp6bVV/7mVeJAlv55iQN82YJqYeL4pg1FXb4W7YS/QnaRLgeWwQCeexf1nR/QK
 dliWmBVeCD+FYrgoH89iM5hG0YQX0rnfU9HyJKK0VoRlYHWINecBnEEkiw0YMQJfRkImqexvxVt
 PHytPk8ttdwADSLI3G6J4XXeZKj/4PiKSD3jtb70e7c0uLOd4uYekSk4ffJAeUIjLYPUj+YzPqs
 cjcS+7BTH69yJQaL+RGmy1hcd4kVJAuoi3/aRPJKeDmF2uNPp4GPyfzWzkXDG2X0HxMwvw71A2M
 eEA3wtuks5CZowZ0pCbR9IkrB1LWcBZsqic3OIcgOVANpaNU21vw7EdSe7OiO1ym3lZAeg2JH9L
 +HAEgPOYq0/3EoBmUwiVOwdSHGU6g=
X-Google-Smtp-Source: AGHT+IEbXjZwVZ0BRz6eKPRreWtcxs3tBkrOmZ3nSlwbUYhE9YCNIcCaf2kqw06sBQspAX6iWIdKEw==
X-Received: by 2002:a05:6000:18a5:b0:427:a34:648c with SMTP id
 ffacd0b85a97d-429bd6efbbdmr2615765f8f.58.1761906906340; 
 Fri, 31 Oct 2025 03:35:06 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c1125ad0sm2882917f8f.13.2025.10.31.03.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 03:35:05 -0700 (PDT)
Message-ID: <332f1009-1371-4287-8726-f7b875cadd03@ursulin.net>
Date: Fri, 31 Oct 2025 10:35:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] dma-buf: protected fence ops by RCU
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-4-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251013143502.1655-4-christian.koenig@amd.com>
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


One additional comment on this patch:

On 13/10/2025 14:48, Christian König wrote:
> At first glance it is counter intuitive to protect a constant function
> pointer table by RCU, but this allows modules providing the function
> table to unload by waiting for an RCU grace period.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-fence.c | 65 +++++++++++++++++++++++++++----------
>   include/linux/dma-fence.h   | 18 ++++++++--
>   2 files changed, 62 insertions(+), 21 deletions(-)
> 

8><

> @@ -1104,11 +1127,14 @@ EXPORT_SYMBOL(dma_fence_init64);
>    */
>   const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>   			 "RCU protection is required for safe access to returned string");
>   
> +	ops = rcu_dereference(fence->ops);
>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return ops->get_driver_name(fence);
>   	else
>   		return "detached-driver";
>   }
> @@ -1136,11 +1162,14 @@ EXPORT_SYMBOL(dma_fence_driver_name);
>    */
>   const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>   {
> +	const struct dma_fence_ops *ops;
> +
>   	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>   			 "RCU protection is required for safe access to returned string");
>   
> +	ops = rcu_dereference(fence->ops);

For the above two functions, the RCU_LOCKDEP_WARN now becomes redundant 
to the one rcu_dererence() would emit. Maybe just move the string into a 
comment?

Regards,

Tvrtko

>   	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return ops->get_driver_name(fence);
>   	else
>   		return "signaled-timeline";
>   }
