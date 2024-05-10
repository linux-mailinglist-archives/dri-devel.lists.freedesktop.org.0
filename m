Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E08C2113
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 11:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1BB10E7C6;
	Fri, 10 May 2024 09:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9216B10E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 09:36:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99F46106F;
 Fri, 10 May 2024 02:37:09 -0700 (PDT)
Received: from [10.1.33.24] (e122027.cambridge.arm.com [10.1.33.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04A953F762;
 Fri, 10 May 2024 02:36:43 -0700 (PDT)
Message-ID: <1106270e-056a-44be-868d-fc3a17fc35f1@arm.com>
Date: Fri, 10 May 2024 10:36:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: use "0" instead of "" for deprecated driver date
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <20240510090951.3398882-1-jani.nikula@intel.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240510090951.3398882-1-jani.nikula@intel.com>
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

On 10/05/2024 10:09, Jani Nikula wrote:
> libdrm does not like the empty string for driver date. Use "0" instead,
> which has been used by virtio previously.
> 
> Reported-by: Steven Price <steven.price@arm.com>
> Closes: https://lore.kernel.org/r/9d0cff47-308e-4b11-a9f3-4157dc26b6fa@arm.com
> Fixes: 7fb8af6798e8 ("drm: deprecate driver date")
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Tested-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
>  drivers/gpu/drm/drm_ioctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 89feb7306e47..51f39912866f 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -530,9 +530,9 @@ int drm_version(struct drm_device *dev, void *data,
>  	err = drm_copy_field(version->name, &version->name_len,
>  			dev->driver->name);
>  
> -	/* Driver date is deprecated. Return the empty string. */
> +	/* Driver date is deprecated. Userspace expects a non-empty string. */
>  	if (!err)
> -		err = drm_copy_field(version->date, &version->date_len, "");
> +		err = drm_copy_field(version->date, &version->date_len, "0");
>  	if (!err)
>  		err = drm_copy_field(version->desc, &version->desc_len,
>  				dev->driver->desc);

