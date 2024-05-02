Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB48B96FE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 10:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7F610E1C2;
	Thu,  2 May 2024 08:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB04E10E1C2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 08:58:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 699532F4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 01:59:18 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8908C3F71E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 01:58:52 -0700 (PDT)
Date: Thu, 2 May 2024 09:58:45 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Fix the FW reset logic
Message-ID: <ZjNVxW5LbbXmCvJU@e110455-lin.cambridge.arm.com>
References: <20240430113727.493155-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240430113727.493155-1-boris.brezillon@collabora.com>
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

On Tue, Apr 30, 2024 at 01:37:27PM +0200, Boris Brezillon wrote:
> In the post_reset function, if the fast reset didn't succeed, we
> are not clearing the fast_reset flag, which prevents firmware
> sections from being reloaded. While at it, use panthor_fw_stop()
> instead of manually writing DISABLE to the MCU_CONTROL register.
> 
> Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

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
> -- 
> 2.44.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
