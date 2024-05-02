Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D538B9799
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 11:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D19310E42B;
	Thu,  2 May 2024 09:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4653310E186
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 09:24:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FA862F4;
 Thu,  2 May 2024 02:25:08 -0700 (PDT)
Received: from [10.1.36.41] (e122027.cambridge.arm.com [10.1.36.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA0C63F71E;
 Thu,  2 May 2024 02:24:41 -0700 (PDT)
Message-ID: <a5fd1d76-fc6a-4383-b5ed-b1484b393b03@arm.com>
Date: Thu, 2 May 2024 10:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix the FW reset logic
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240430113727.493155-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240430113727.493155-1-boris.brezillon@collabora.com>
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

On 30/04/2024 12:37, Boris Brezillon wrote:
> In the post_reset function, if the fast reset didn't succeed, we
> are not clearing the fast_reset flag, which prevents firmware
> sections from being reloaded. While at it, use panthor_fw_stop()
> instead of manually writing DISABLE to the MCU_CONTROL register.
> 
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 181395e2859a..fedf9627453f 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1083,10 +1083,11 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
>  		if (!ret)
>  			goto out;
>  
> -		/* Force a disable, so we get a fresh boot on the next
> -		 * panthor_fw_start() call.
> +		/* Forcibly reset the MCU and force a slow reset, so we get a
> +		 * fresh boot on the next panthor_fw_start() call.
>  		 */
> -		gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
> +		panthor_fw_stop(ptdev);
> +		ptdev->fw->fast_reset = false;
>  		drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
>  	}
>  

