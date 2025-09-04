Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A736BB44040
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0811510E264;
	Thu,  4 Sep 2025 15:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D93DC10E264
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:16:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A94D339;
 Thu,  4 Sep 2025 08:16:48 -0700 (PDT)
Received: from [10.1.25.55] (e122027.cambridge.arm.com [10.1.25.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D57A3F6A8;
 Thu,  4 Sep 2025 08:16:54 -0700 (PDT)
Message-ID: <7a5be556-89ee-420c-96d7-129be6808137@arm.com>
Date: Thu, 4 Sep 2025 16:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: validate group queue count
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250903192133.288477-1-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250903192133.288477-1-olvaffe@gmail.com>
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

On 03/09/2025 20:21, Chia-I Wu wrote:
> A panthor group can have at most MAX_CS_PER_CSG panthor queues.
> 
> Fixes: 4bdca11507928 ("drm/panthor: Add the driver frontend block")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # v1
> Reviewed-by: Steven Price <steven.price@arm.com>

Pushed to drm-misc-fixes.

Thanks,
Steve

> 
> ---
> v2:
>  - move validation up to panthor_ioctl_group_create
>  - add Fixes tag
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 9256806eb6623..4c202fc5ce050 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1094,7 +1094,7 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  	struct drm_panthor_queue_create *queue_args;
>  	int ret;
>  
> -	if (!args->queues.count)
> +	if (!args->queues.count || args->queues.count > MAX_CS_PER_CSG)
>  		return -EINVAL;
>  
>  	ret = PANTHOR_UOBJ_GET_ARRAY(queue_args, &args->queues);

