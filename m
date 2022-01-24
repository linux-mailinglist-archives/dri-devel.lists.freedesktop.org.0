Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C114985F0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 18:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943A510E32A;
	Mon, 24 Jan 2022 17:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 389D610E404
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 17:09:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D4F101E;
 Mon, 24 Jan 2022 09:09:58 -0800 (PST)
Received: from [192.168.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D12F3F7F5;
 Mon, 24 Jan 2022 09:09:58 -0800 (PST)
Message-ID: <5d7a6077-9a44-1f8b-9e65-3bb7ed94523e@foss.arm.com>
Date: Mon, 24 Jan 2022 17:09:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 01/60] drm/komeda: Add support for the nomodeset kernel
 parameter
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-2-javierm@redhat.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <20211215010008.2545520-2-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seems fine.

Reviewed-by: Carsten Haitzler <carsten.haitzler@arm.com>

On 12/15/21 00:59, Javier Martinez Canillas wrote:
> According to disable Documentation/admin-guide/kernel-parameters.txt, this
> parameter can be used to disable kernel modesetting.
> 
> DRM drivers will not perform display-mode changes or accelerated rendering
> and only the systewm system framebuffer will be available if it was set-up.
> 
> But only a few DRM drivers currently check for nomodeset, make this driver
> to also support the command line parameter.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>   drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> index e7933930a657..4f6d5c2103ec 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
> @@ -9,6 +9,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/component.h>
>   #include <linux/pm_runtime.h>
> +#include <drm/drm_drv.h>
>   #include <drm/drm_of.h>
>   #include "komeda_dev.h"
>   #include "komeda_kms.h"
> @@ -117,6 +118,9 @@ static int komeda_platform_probe(struct platform_device *pdev)
>   	struct component_match *match = NULL;
>   	struct device_node *child;
>   
> +	if (drm_firmware_drivers_only())
> +		return -EINVAL;
> +
>   	if (!dev->of_node)
>   		return -ENODEV;
>   
