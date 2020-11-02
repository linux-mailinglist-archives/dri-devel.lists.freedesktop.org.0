Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49A2A26B6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F1B6E0D9;
	Mon,  2 Nov 2020 09:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7D046E0D9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:11:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78F84101E;
 Mon,  2 Nov 2020 01:11:45 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4083C3F718;
 Mon,  2 Nov 2020 01:11:44 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Add support for non-existent reset node
To: Yejune Deng <yejune.deng@gmail.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 airlied@linux.ie, daniel@ffwll.ch, p.zabel@pengutronix.de
References: <1604307289-32110-1-git-send-email-yejune.deng@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <64fb3d99-d42b-6135-0670-ab50205714ad@arm.com>
Date: Mon, 2 Nov 2020 09:11:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1604307289-32110-1-git-send-email-yejune.deng@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2020 08:54, Yejune Deng wrote:
> Some dts hasn't no reset node, is should ok.
> 
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_device.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index ea8d318..a982878 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -18,7 +18,12 @@
>   
>   static int panfrost_reset_init(struct panfrost_device *pfdev)
>   {
> -	pfdev->rstc = devm_reset_control_array_get(pfdev->dev, false, true);
> +	pfdev->rstc = devm_reset_control_array_get_optional_exclusive(pfdev->dev);

This change is fine - it should have no functional change and makes the 
code more readable.

> +	if (!pfdev->rstc) {
> +		dev_info(pfdev->dev, "reset does not exist\n");

I don't think this output is particularly useful.

> +		return 0;

The early return isn't necessary. IS_ERR(NULL) is false, and 
reset_control_deassert() deals fine with NULL, so the path below would 
be fine.

> +	}
> +
>   	if (IS_ERR(pfdev->rstc)) {
>   		dev_err(pfdev->dev, "get reset failed %ld\n", PTR_ERR(pfdev->rstc));
>   		return PTR_ERR(pfdev->rstc);
> @@ -29,7 +34,8 @@ static int panfrost_reset_init(struct panfrost_device *pfdev)
>   
>   static void panfrost_reset_fini(struct panfrost_device *pfdev)
>   {
> -	reset_control_assert(pfdev->rstc);
> +	if (pfdev->rstc)
> +		reset_control_assert(pfdev->rstc);

reset_control_assert() deals fine with a NULL input, so this is unneeded.

>   }
>   
>   static int panfrost_clk_init(struct panfrost_device *pfdev)
> 

Have you actually seen a problem on a platform without a reset node - it 
works fine for me and I can't see any functional change with this patch.

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
