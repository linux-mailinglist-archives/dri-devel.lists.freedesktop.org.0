Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAB73D390C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 13:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730646FAD6;
	Fri, 23 Jul 2021 11:06:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E0286FAD6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 11:06:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B0C106F;
 Fri, 23 Jul 2021 04:06:13 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5D303F694;
 Fri, 23 Jul 2021 04:06:12 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: devfreq: Don't display error for
 EPROBE_DEFER
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210721214830.25690-1-macroalpha82@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f086f519-f8c3-0ba3-61ef-4a28dd7aa654@arm.com>
Date: Fri, 23 Jul 2021 12:06:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721214830.25690-1-macroalpha82@gmail.com>
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
Cc: airlied@linux.ie, alyssa.rosenzweig@collabora.com,
 Chris Morgan <macromorgan@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/07/2021 22:48, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Set a condition for the message of "Couldn't set OPP regulators" to not
> display if the error code is EPROBE_DEFER. Note that I used an if
> statement to capture the condition instead of the dev_err_probe
> function because I didn't want to change the DRM_DEV_ERROR usage.

Note that this file (panfost_devfreq.c) is actually the odd one out in
terms of using the DRM_DEV_xxx macros. The rest of the panfrost driver
uses the standard dev_xxx ones. So tidying this up to match the rest of
the driver would also allow us to use dev_err_probe(). But as a point
fix this patch is fine and correct. Thanks!

> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll apply this to drm-misc-next.

Thanks,

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 3644652f726f..194af7f607a6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -106,7 +106,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	if (ret) {
>  		/* Continue if the optional regulator is missing */
>  		if (ret != -ENODEV) {
> -			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> +			if (ret != -EPROBE_DEFER)
> +				DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
>  			return ret;
>  		}
>  	}
> 

