Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22E091DAFF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 11:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3DD10E377;
	Mon,  1 Jul 2024 09:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 356E010E378
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 09:03:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8C3339;
 Mon,  1 Jul 2024 02:03:36 -0700 (PDT)
Received: from [10.57.44.170] (unknown [10.57.44.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DFE53F766;
 Mon,  1 Jul 2024 02:03:10 -0700 (PDT)
Message-ID: <bfc7f7f7-e25f-497c-9294-438315d3d647@arm.com>
Date: Mon, 1 Jul 2024 10:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panthor: Don't check the array stride on empty
 uobj arrays
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240628145536.778349-1-boris.brezillon@collabora.com>
 <20240628145536.778349-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240628145536.778349-2-boris.brezillon@collabora.com>
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

On 28/06/2024 15:55, Boris Brezillon wrote:
> The user is likely to leave all the drm_panthor_obj_array fields
> to zero when the array is empty, which will cause an EINVAL failure.
> 
> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index b8a84f26b3ef..b5e7b919f241 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -86,15 +86,15 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  	int ret = 0;
>  	void *out_alloc;
>  
> +	if (!in->count)
> +		return NULL;
> +
>  	/* User stride must be at least the minimum object size, otherwise it might
>  	 * lack useful information.
>  	 */
>  	if (in->stride < min_stride)
>  		return ERR_PTR(-EINVAL);
>  
> -	if (!in->count)
> -		return NULL;
> -
>  	out_alloc = kvmalloc_array(in->count, obj_size, GFP_KERNEL);
>  	if (!out_alloc)
>  		return ERR_PTR(-ENOMEM);

