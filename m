Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A789BEEF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 14:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E264112528;
	Mon,  8 Apr 2024 12:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C4ED112527
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 12:27:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E09BEDA7;
 Mon,  8 Apr 2024 05:27:47 -0700 (PDT)
Received: from [10.57.73.196] (unknown [10.57.73.196])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF8923F64C;
 Mon,  8 Apr 2024 05:27:15 -0700 (PDT)
Message-ID: <effb8ca8-9d45-45d1-afab-467d0ac20fbd@arm.com>
Date: Mon, 8 Apr 2024 13:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: clean up some types in
 panthor_sched_suspend()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <85356b15-4840-4e64-8c75-922cdd6a5fef@moroto.mountain>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <85356b15-4840-4e64-8c75-922cdd6a5fef@moroto.mountain>
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

On 08/04/2024 08:36, Dan Carpenter wrote:
> These variables should be u32 instead of u64 because they're only
> storing u32 values.  Also static checkers complain when we do:
> 
> 	suspended_slots &= ~upd_ctx.timedout_mask;
> 
> In this code "suspended_slots" is a u64 and "upd_ctx.timedout_mask".  The
> mask clears out the top 32 bits which would likely be a bug if anything
> were stored there.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Steven Price <steven.price@arm.com>

If you fancy a bit more clean-up then I think faulty_slots is completely
redundant as a separate variable. In particular in the "if
(suspended_slots)" section it's updated but that updated value is never
used... otherwise I'll put it on my list for cleaning up later.

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index d4bc652b34d5..b3a51a6de523 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2546,7 +2546,7 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
>  {
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  	struct panthor_csg_slots_upd_ctx upd_ctx;
> -	u64 suspended_slots, faulty_slots;
> +	u32 suspended_slots, faulty_slots;
>  	struct panthor_group *group;
>  	u32 i;
>  

