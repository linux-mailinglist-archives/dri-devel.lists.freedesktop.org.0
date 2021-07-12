Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715F3C4660
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 12:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D52089B70;
	Mon, 12 Jul 2021 10:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6589B70
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 10:02:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 919D21FB;
 Mon, 12 Jul 2021 03:02:47 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 765B13F694;
 Mon, 12 Jul 2021 03:02:46 -0700 (PDT)
Subject: Re: [PATCH v3] drm/panfrost:fix the exception name always "UNKNOWN"
To: ChunyouTang <tangchunyou@163.com>
References: <20210708073407.2015-1-tangchunyou@163.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <814ae174-a247-bcd8-b2d6-847982a9fc6b@arm.com>
Date: Mon, 12 Jul 2021 11:02:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708073407.2015-1-tangchunyou@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2021 08:34, ChunyouTang wrote:
> From: ChunyouTang <tangchunyou@icubecorp.cn>
> 
> The exception_code in register is only 8 bits,So if
> fault_status in panfrost_gpu_irq_handler() don't
> (& 0xFF),it can't get correct exception reason.
> 
> and it's better to show all of the register value
> to custom,so it's better fault_status don't (& 0xFF).
> 
> Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>

Reviewed-by: Steven Price <steven.price@arm.com>

Boris's change has actually modified panfrost_exception_name() to no
longer take pfdev in drm-misc-next. However, I'll just fix this up when
I apply it.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 1fffb6a0b24f..d2d287bbf4e7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -33,7 +33,7 @@ static irqreturn_t panfrost_gpu_irq_handler(int irq, void *data)
>  		address |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO);
>  
>  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
> -			 fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status & 0xFF),
> +			 fault_status, panfrost_exception_name(pfdev, fault_status & 0xFF),
>  			 address);
>  
>  		if (state & GPU_IRQ_MULTIPLE_FAULT)
> 

