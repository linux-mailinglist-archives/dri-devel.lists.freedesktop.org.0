Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAC8A4ABC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 10:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F471123A9;
	Mon, 15 Apr 2024 08:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 29A7E1123AB
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 08:47:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 032DD2F;
 Mon, 15 Apr 2024 01:47:28 -0700 (PDT)
Received: from [10.57.76.98] (unknown [10.57.76.98])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 036033F64C;
 Mon, 15 Apr 2024 01:46:57 -0700 (PDT)
Message-ID: <54e4a174-dea7-4588-b8a6-0310c210ffce@arm.com>
Date: Mon, 15 Apr 2024 09:46:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Add defer probe for firmware load
To: Andy Yan <andyshrk@163.com>, boris.brezillon@collabora.com
Cc: daniel@ffwll.ch, airlied@gmail.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
References: <20240413114938.740631-1-andyshrk@163.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240413114938.740631-1-andyshrk@163.com>
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

On 13/04/2024 12:49, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The firmware in the rootfs will not be accessible until we
> are in the SYSTEM_RUNNING state, so return EPROBE_DEFER until
> that point.
> This let the driver can load firmware when it is builtin.

The usual solution is that the firmware should be placed in the
initrd/initramfs if the module is included there (or built-in). The same
issue was brought up regarding the powervr driver:

https://lore.kernel.org/dri-devel/20240109120604.603700-1-javierm@redhat.com/T/

I'm not sure if that ever actually reached a conclusion though. The
question was deferred to Greg KH but I didn't see Greg actually getting
involved in the thread.

> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  drivers/gpu/drm/panthor/panthor_fw.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 33c87a59834e..25e375f8333c 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1336,8 +1336,17 @@ int panthor_fw_init(struct panthor_device *ptdev)
>  	}
>  
>  	ret = panthor_fw_load(ptdev);
> -	if (ret)
> +	if (ret) {
> +		/*
> +		 * The firmware in the rootfs will not be accessible until we
> +		 * are in the SYSTEM_RUNNING state, so return EPROBE_DEFER until
> +		 * that point.
> +		 */
> +		if (system_state < SYSTEM_RUNNING)

This should really only be in the case where ret == -ENOENT - any other
error and the firmware is apparently present but broken in some way, so
there's no point deferring.

I also suspect we'd need some change in panthor_fw_load() to quieten
error messages if we're going to defer on this, in which case it might
make more sense to move this logic into that function.

Steve

> +			ret = -EPROBE_DEFER;
> +
>  		goto err_unplug_fw;
> +	}
>  
>  	ret = panthor_vm_active(fw->vm);
>  	if (ret)

