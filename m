Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C24C3A29AA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 12:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566C76ECCA;
	Thu, 10 Jun 2021 10:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B638E6ECCA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 10:52:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFEEBD6E;
 Thu, 10 Jun 2021 03:52:33 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C1283F694;
 Thu, 10 Jun 2021 03:52:32 -0700 (PDT)
Subject: Re: [PATCH] modified: gpu/drm/panfrost/panfrost_gpu.c
To: ChunyouTang <tangchunyou@163.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210609063850.2060-1-tangchunyou@163.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <78a2488a-71d5-548a-e221-7786f788509c@arm.com>
Date: Thu, 10 Jun 2021 11:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609063850.2060-1-tangchunyou@163.com>
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
Cc: tangchunyou@icubecorp.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tangchunyou <tangchunyou@163.icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The subject should have the prefix "drm/panfrost" and should mention
what the patch is changing (not just the filename).

On 09/06/2021 07:38, ChunyouTang wrote:
> From: tangchunyou <tangchunyou@163.icubecorp.cn>
> 
> The GPU exception fault status register(0x3C),the low 8 bit is the
> EXCEPTION_TYPE.We can see the description at P3-78 in spec.

Nit: When referring to a spec it's always good to mention the name - I'm
not sure which specification you found this in.

> 
> Signed-off-by: tangchunyou <tangchunyou@163.icubecorp.cn>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 2aae636f1cf5..1fffb6a0b24f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -33,7 +33,7 @@ static irqreturn_t panfrost_gpu_irq_handler(int irq, void *data)
>  		address |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO);
>  
>  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
> -			 fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status),
> +			 fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status & 0xFF),

However this change is correct - panfrost_exception_name() should be
taking only the lower 8 bits. Even better though would be to to report
the full raw fault information as well as the high bits can contain
useful information:

	dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
		 fault_status,
		 panfrost_exception_name(pfdev, fault_status & 0xFF),
		 address);

Thanks,

Steve

>  			 address);
>  
>  		if (state & GPU_IRQ_MULTIPLE_FAULT)
> 

