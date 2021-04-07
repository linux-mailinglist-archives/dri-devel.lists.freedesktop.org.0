Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B505356762
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 10:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C5E6E8D9;
	Wed,  7 Apr 2021 08:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A5C4C6E8D9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 08:59:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFC631063
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 01:59:06 -0700 (PDT)
Received: from [10.99.99.12] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E4AE3F694
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 01:59:06 -0700 (PDT)
Subject: Re: [PATCH] drm/komeda: Convert sysfs sprintf/snprintf family to
 sysfs_emit
To: dri-devel@lists.freedesktop.org
References: <1617067518-31091-1-git-send-email-tiantao6@hisilicon.com>
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
Message-ID: <4868a149-fefe-469b-2054-3e4e52d15450@foss.arm.com>
Date: Wed, 7 Apr 2021 09:59:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617067518-31091-1-git-send-email-tiantao6@hisilicon.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/21 2:25 AM, Tian Tao wrote:
> Fix the following coccicheck warning:
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:97:8-16: WARNING:
> use scnprintf or sprintf
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:88:8-16: WARNING:
> use scnprintf or sprintf
> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:65:8-16: WARNING:
> use scnprintf or sprintf
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>   drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> index ca891ae..cc7664c 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> @@ -62,7 +62,7 @@ core_id_show(struct device *dev, struct device_attribute *attr, char *buf)
>   {
>   	struct komeda_dev *mdev = dev_to_mdev(dev);
>   
> -	return snprintf(buf, PAGE_SIZE, "0x%08x\n", mdev->chip.core_id);
> +	return sysfs_emit(buf, "0x%08x\n", mdev->chip.core_id);
>   }
>   static DEVICE_ATTR_RO(core_id);
>   
> @@ -85,7 +85,7 @@ config_id_show(struct device *dev, struct device_attribute *attr, char *buf)
>   		if (pipe->layers[i]->layer_type == KOMEDA_FMT_RICH_LAYER)
>   			config_id.n_richs++;
>   	}
> -	return snprintf(buf, PAGE_SIZE, "0x%08x\n", config_id.value);
> +	return sysfs_emit(buf, "0x%08x\n", config_id.value);
>   }
>   static DEVICE_ATTR_RO(config_id);
>   
> @@ -94,7 +94,7 @@ aclk_hz_show(struct device *dev, struct device_attribute *attr, char *buf)
>   {
>   	struct komeda_dev *mdev = dev_to_mdev(dev);
>   
> -	return snprintf(buf, PAGE_SIZE, "%lu\n", clk_get_rate(mdev->aclk));
> +	return sysfs_emit(buf, "%lu\n", clk_get_rate(mdev->aclk));
>   }
>   static DEVICE_ATTR_RO(aclk_hz);
>   
> 

Looks OK to me.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
