Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FB6A931A8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 07:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023E910E074;
	Fri, 18 Apr 2025 05:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dtVNp0qP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F34C10E074
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 05:52:38 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id 5edwul0TZtvMG5ee0uVAiY; Fri, 18 Apr 2025 07:52:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1744955531;
 bh=beKcvPKn4gWz14KY1u+Jl21S7uykusGB6oklth52zpc=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=dtVNp0qP4EdAppUn1VjXkQGHWgp1+kHydnwG6wE4eS1tejUL0hoAsq30zKK+mvZg9
 Uy6eMhS/xyu72Noti/dG3GzLqBx4bRtSyIdky0rw2qj4Tb1BfX6wh5iSScW1KurKcT
 JgWQzR7N1tLJH0b+O1TH0JC/OBBz+mpIfUNpLVdMjI8sHihgBhpg/kUCsSgsvPx0xp
 WchdA0ow1RLxSmJdHIMyGUeMWCyB4+V9rHxXtM4nhTI3Woz0bfWWykmw7tMxUminke
 LfqKcBmYOlDP76FAxHl+/fQYcXQJTJ0oNAKNpUWF1MXBkU/QPf7vDZfoAseI5G+7id
 nZ60afh9PqtnA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 18 Apr 2025 07:52:11 +0200
X-ME-IP: 90.11.132.44
Message-ID: <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
Date: Fri, 18 Apr 2025 07:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
To: linux@treblig.org, alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-3-linux@treblig.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250418002117.130612-3-linux@treblig.org>
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

Le 18/04/2025 à 02:21, linux@treblig.org a écrit :
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> radeon_doorbell_free() was added in 2013 by
> commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> allocator")
> but never used.

Hi,

I think than instead of being removed, it should be used in the error 
handling path of cik_init() and in cik_fini().

CJ

> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/gpu/drm/radeon/radeon.h        |  1 -
>   drivers/gpu/drm/radeon/radeon_device.c | 14 --------------
>   2 files changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index 8605c074d9f7..58111fdf520d 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -686,7 +686,6 @@ struct radeon_doorbell {
>   };
>   
>   int radeon_doorbell_get(struct radeon_device *rdev, u32 *page);
> -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell);
>   
>   /*
>    * IRQS.
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index bbd39348a7ab..4127ffb4bb6f 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -392,20 +392,6 @@ int radeon_doorbell_get(struct radeon_device *rdev, u32 *doorbell)
>   	}
>   }
>   
> -/**
> - * radeon_doorbell_free - Free a doorbell entry
> - *
> - * @rdev: radeon_device pointer
> - * @doorbell: doorbell index
> - *
> - * Free a doorbell allocated for use by the driver (all asics)
> - */
> -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
> -{
> -	if (doorbell < rdev->doorbell.num_doorbells)
> -		__clear_bit(doorbell, rdev->doorbell.used);
> -}
> -
>   /*
>    * radeon_wb_*()
>    * Writeback is the method by which the GPU updates special pages

