Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49847120184
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 10:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12E36E15E;
	Mon, 16 Dec 2019 09:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6C0F6E15E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 09:52:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789781FB;
 Mon, 16 Dec 2019 01:52:24 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1263A3F6CF;
 Mon, 16 Dec 2019 01:52:22 -0800 (PST)
Subject: Re: [PATCH v2] drm/panfrost: Prefix interrupt handlers' names
To: 20191213123942.22891-1-ezequiel@collabora.com,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20191214045952.9452-1-ezequiel@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <23c51097-298c-f620-3457-7f5158b3a267@arm.com>
Date: Mon, 16 Dec 2019 09:52:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191214045952.9452-1-ezequiel@collabora.com>
Content-Language: en-US
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
Cc: kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/12/2019 04:59, Ezequiel Garcia wrote:
> Currently, the interrupt lines requested by Panfrost
> use unmeaningful names, which adds some obscurity
> to interrupt introspection (i.e. any tool based
> on procfs' interrupts file).
> 
> In order to improve this, prefix each requested
> interrupt with the module name: panfrost-{gpu,job,mmu}.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

LGTM

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
> v2:
> * Use consistent naming, as suggested by Alyssa, Neil and Robin.
> 
>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 6 ++++--
>  3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index f67ed925c0ef..af2aa6b3bce3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -348,7 +348,7 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
>  		return -ENODEV;
>  
>  	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
> -			       IRQF_SHARED, "gpu", pfdev);
> +			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
>  	if (err) {
>  		dev_err(pfdev->dev, "failed to request gpu irq");
>  		return err;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 05c85f45a0de..3bd79ebb6c40 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -480,7 +480,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		return -ENODEV;
>  
>  	ret = devm_request_irq(pfdev->dev, irq, panfrost_job_irq_handler,
> -			       IRQF_SHARED, "job", pfdev);
> +			       IRQF_SHARED, KBUILD_MODNAME "-job", pfdev);
>  	if (ret) {
>  		dev_err(pfdev->dev, "failed to request job irq");
>  		return ret;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index 842bdd7cf6be..806958434726 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -612,9 +612,11 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
>  	if (irq <= 0)
>  		return -ENODEV;
>  
> -	err = devm_request_threaded_irq(pfdev->dev, irq, panfrost_mmu_irq_handler,
> +	err = devm_request_threaded_irq(pfdev->dev, irq,
> +					panfrost_mmu_irq_handler,
>  					panfrost_mmu_irq_handler_thread,
> -					IRQF_SHARED, "mmu", pfdev);
> +					IRQF_SHARED, KBUILD_MODNAME "-mmu",
> +					pfdev);
>  
>  	if (err) {
>  		dev_err(pfdev->dev, "failed to request mmu irq");
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
