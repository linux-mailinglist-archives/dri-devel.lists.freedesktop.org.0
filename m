Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E65685A3D8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9FD10E434;
	Mon, 19 Feb 2024 12:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QSMVtvfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDDE10E434;
 Mon, 19 Feb 2024 12:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708347164;
 bh=RlJFnwC8vtKaCRSiqNBP6fs/G9L9iiOg4PIBPGdT9RU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QSMVtvfseBUsWHd8wUrB3Ibay4Sz6yDaBFlcdwRfZDu7OZb7dzMN2z0D228h83b6D
 PpHL+rGH/nqw5fLvRNk0jDlXSVOeD+27wus48q7YrBG5qxc76/KkCQDljqy1MsDZOg
 micgwVxeWwS1qrGtK/yRCjih5BWeqUr+rSoZhV0Z2LWmIXEhYqyR5UdWrHsBHxQ3hk
 3f8yGFskfV80sMOw1Ns3IAE1L+6rlsI+WFiFTnx1pnW2UyOPiW5fC1axJ0Sh5/7tR5
 dup+DkxrWG2e7wJVyBV3261jSKXDSlqC5EGojjeSlnX1DpYtub6lbmZX5ichLsNbwC
 RYVQj6nkYBqZA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9F4A437820C1;
 Mon, 19 Feb 2024 12:52:40 +0000 (UTC)
Message-ID: <e69a275c-4415-4f0c-bae4-af8112357ef6@collabora.com>
Date: Mon, 19 Feb 2024 09:52:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] drm/ci: mediatek: Add job to test panfrost and
 powervr GPU driver
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-4-vignesh.raman@collabora.com>
 <61575073-ce37-4027-8f95-f05290cc10c4@collabora.com>
 <2083520a-13f3-0ecd-45ce-ee4ba34d5bca@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <2083520a-13f3-0ecd-45ce-ee4ba34d5bca@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 19/02/2024 06:39, Vignesh Raman wrote:
> Hi Helen,
> 
> On 09/02/24 23:51, Helen Koike wrote:
>>
>>
>> On 30/01/2024 12:03, Vignesh Raman wrote:
>>> For mediatek mt8173, the GPU driver is powervr and for mediatek
>>> mt8183, the GPU driver is panfrost. So add support in drm-ci to
>>> test panfrost and powervr GPU driver for mediatek SOCs and update
>>> xfails. Powervr driver was merged in linux kernel, but there's no
>>> mediatek support yet. So disable the mt8173-gpu job which uses
>>> powervr driver.
>>>
>>> Add panfrost specific tests to testlist and skip KMS tests for
>>> panfrost driver since it is not a not a KMS driver. Also update
>>> the MAINTAINERS file to include xfails for panfrost driver.
>>>
>>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>>
>> Hi Vignesh, thanks for your work.
>>
>> I'm still wondering about a few things, please check below.
>>
>>> ---
>>>
>>> v2:
>>>    - Add panfrost and PVR GPU jobs for mediatek SOC with new xfails, 
>>> add xfail
>>>      entry to MAINTAINERS.
>>
>> Maybe we should review how the xfails failes are named. I think they 
>> should start with the DRIVER_NAME instead of GPU_VERSION.
>>
>> For instance, consider the following job:
>>
>> mediatek:mt8183-gpu:
>>    extends:
>>      - .mt8183
>>    variables:
>>      GPU_VERSION: mediatek-mt8183-gpu
>>      DRIVER_NAME: panfrost
>>
>> And we have mediatek-mt8183-gpu-skips.txt
>>
>> If there is an error, we want to notify the panfrost driver 
>> maintainers (and maybe not the mediatek driver maintainers), so 
>> MAINTAINERS file doesn't correspond to this.
> 
> Agree.
> 
>>
>> How about a naming <driver name>_<hardware/gpu>_<type: gpu/display> ?
>>
>> powervr_mediatek-mt8173_gpu-skipts.txt
>> mediatek_mediatek-mt8173_display-skipts.txt
>> panfrost_mediatek-mt8183_gpu-skips.txt
>> mediatek_mediatek-mt8183_display-skips.txt
>> ...
>>
>> What do you think?
> 
> Yes we can keep this naming. In this case do we still need gpu/display 
> in the xfails file name?

If you think this split is not required, then I'm fine dropping it.

Regards,
Helen

> 
> Regards,
> Vignesh
