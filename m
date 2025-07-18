Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCB8B0A7FB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 17:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD4210E9F1;
	Fri, 18 Jul 2025 15:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9DEEE10E9F1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:55:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057E116A3;
 Fri, 18 Jul 2025 08:55:11 -0700 (PDT)
Received: from [10.1.26.19] (e122027.cambridge.arm.com [10.1.26.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DE513F694;
 Fri, 18 Jul 2025 08:55:15 -0700 (PDT)
Message-ID: <0f542e8c-548f-41fd-9426-3a21afc9ea96@arm.com>
Date: Fri, 18 Jul 2025 16:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix memory leak in
 panthor_ioctl_group_create()
To: Jann Horn <jannh@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary.guillemard@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241113-panthor-fix-gcq-bailout-v1-1-654307254d68@google.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241113-panthor-fix-gcq-bailout-v1-1-654307254d68@google.com>
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

On 13/11/2024 21:03, Jann Horn wrote:
> When bailing out due to group_priority_permit() failure, the queue_args
> need to be freed. Fix it by rearranging the function to use the
> goto-on-error pattern, such that the success case flows straight without
> indentation while error cases jump forward to cleanup.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5f7762042f8a ("drm/panthor: Restrict high priorities on group_create")
> Signed-off-by: Jann Horn <jannh@google.com>

I've just discovered that this was never merged. Sorry for taking so
long, I've now applied this to drm-misc-next.

Thanks,
Steve

> ---
> testcase:
> ```
> #include <err.h>
> #include <fcntl.h>
> #include <stddef.h>
> #include <sys/ioctl.h>
> #include <drm/panthor_drm.h>
> 
> #define SYSCHK(x) ({          \
>   typeof(x) __res = (x);      \
>   if (__res == (typeof(x))-1) \
>     err(1, "SYSCHK(" #x ")"); \
>   __res;                      \
> })
> 
> #define GPU_PATH "/dev/dri/by-path/platform-fb000000.gpu-card"
> 
> int main(void) {
>   int fd = SYSCHK(open(GPU_PATH, O_RDWR));
> 
>   while (1) {
>     struct drm_panthor_queue_create qc[16] = {};
>     struct drm_panthor_group_create gc = {
>       .queues = {
>         .stride = sizeof(struct drm_panthor_queue_create),
>         .count = 16,
>         .array = (unsigned long)qc
>       },
>       .priority = PANTHOR_GROUP_PRIORITY_HIGH+1/*invalid*/
>     };
>     ioctl(fd, DRM_IOCTL_PANTHOR_GROUP_CREATE, &gc);
>   }
> }
> ```
> 
> I have tested that without this patch, after running the testcase for a
> few seconds and then manually killing it, 2G of RAM in kmalloc-128 have
> been leaked. With the patch applied, the memory leak is gone.
> 
> (By the way, get_maintainer.pl suggests that I also send this patch to
> the general DRM maintainers and the DRM-misc maintainers; looking at
> MAINTAINERS, it looks like it is normal that the general DRM maintainers
> are listed for everything under drivers/gpu/, but DRM-misc has exclusion
> rules for a bunch of drivers but not panthor. I don't know if that is
> intentional.)
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index c520f156e2d73f7e735f8bf2d6d8e8efacec9362..815c23cff25f305d884e8e3e263fa22888f7d5ce 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1032,14 +1032,15 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  
>  	ret = group_priority_permit(file, args->priority);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	ret = panthor_group_create(pfile, args, queue_args);
> -	if (ret >= 0) {
> -		args->group_handle = ret;
> -		ret = 0;
> -	}
> +	if (ret < 0)
> +		goto out;
> +	args->group_handle = ret;
> +	ret = 0;
>  
> +out:
>  	kvfree(queue_args);
>  	return ret;
>  }
> 
> ---
> base-commit: 9f8e716d46c68112484a23d1742d9ec725e082fc
> change-id: 20241113-panthor-fix-gcq-bailout-2d9ac36590ed
> 

