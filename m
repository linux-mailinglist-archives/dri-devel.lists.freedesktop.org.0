Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACE5288D65
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4605B6ECF6;
	Fri,  9 Oct 2020 15:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A7B5A6ECF6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:54:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A42ADD6E;
 Fri,  9 Oct 2020 08:54:29 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CD013F66B;
 Fri,  9 Oct 2020 08:54:28 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: increase readl_relaxed_poll_timeout values
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20201008141738.13560-1-christianshewitt@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b0b90550-6138-7dac-fbbf-ea037cb28dd1@arm.com>
Date: Fri, 9 Oct 2020 16:54:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008141738.13560-1-christianshewitt@gmail.com>
Content-Language: en-GB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/10/2020 15:17, Christian Hewitt wrote:
> Amlogic SoC devices report the following errors frequently causing excessive
> dmesg log spam and early log rotataion, although the errors appear to be
> harmless as everything works fine:
> 
> [    7.202702] panfrost ffe40000.gpu: error powering up gpu L2
> [    7.203760] panfrost ffe40000.gpu: error powering up gpu shader
> 
> ARM staff have advised increasing the timeout values to eliminate the errors
> in most normal scenarios, and testing with several different G31/G52 devices
> shows 20000 to be a reliable value.
> 
> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> Suggested-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next-fixes so it should coincide with the 
Bifrost support already in drm-misc-next.

Steve

> ---
>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index e1b2a3376624..2aae636f1cf5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -325,13 +325,13 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
>   	/* Just turn on everything for now */
>   	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
> -		val, val == pfdev->features.l2_present, 100, 1000);
> +		val, val == pfdev->features.l2_present, 100, 20000);
>   	if (ret)
>   		dev_err(pfdev->dev, "error powering up gpu L2");
>   
>   	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
>   	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
> -		val, val == pfdev->features.shader_present, 100, 1000);
> +		val, val == pfdev->features.shader_present, 100, 20000);
>   	if (ret)
>   		dev_err(pfdev->dev, "error powering up gpu shader");
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
