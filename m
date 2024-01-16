Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3FC82EE04
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 12:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA40510E482;
	Tue, 16 Jan 2024 11:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05BE10E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 11:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705405395;
 bh=Kn8EISzRHZjy8xP1XBx7o0mFsxZriHl3rVzKRE01vzo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=s9ykoxOyKhxyiMZpC/Q8EMeZVZf41xqcaTOiSues1mrs/P2cKhaUrFicd8vH2fkOz
 mkPir1GALlh/NAFsPrGUxMW/b3KnyQGzboyIcaK07pGVnb2eb76obByg15AFyLrQrT
 9Qz1xHdjO2oQuJe9LsKrP2Xf935QHlCicIM731DFAEPxEKuQtKWcORqCmCjdxr9LtU
 k6L/emLR/KlvB90CzD3Q9ie0Jbcdqabu5U5DYUEygTc6pp1NNQaJ+BQi7qW7UhcGzi
 SwiEuhUZ0OguSwHvfXdoRmBQj3BwBoFGE1YuzMZyflbw3mxzusBw+SaiGHSLwNn1YD
 euVLoyejhrkQg==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 411A63782067;
 Tue, 16 Jan 2024 11:43:10 +0000 (UTC)
Message-ID: <490b1e71-d403-02f0-bfe3-04d9f3250d18@collabora.com>
Date: Tue, 16 Jan 2024 17:13:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] drm/ci: add tests on vkms
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
References: <20240102094129.1767591-1-vignesh.raman@collabora.com>
 <c06f3ca9-e588-4012-b864-102ad3e7ea8d@collabora.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <c06f3ca9-e588-4012-b864-102ad3e7ea8d@collabora.com>
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
Cc: hamohammed.sa@gmail.com, daniels@collabora.com,
 rodrigosiqueiramelo@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com, mairacanal@riseup.net,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helen,

On 15/01/24 20:54, Helen Koike wrote:
>> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml 
>> b/drivers/gpu/drm/ci/gitlab-ci.yml
>> index 084e3ff8e3f4..4b636d39734c 100644
>> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
>> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
>> @@ -108,6 +108,7 @@ stages:
>>     - rockchip
>>     - virtio-gpu
>>     - lint
>> +  - software-driver
> 
> I had created this new stage with the intention to also move virtio-gpu 
> to it, so we can patch all "non-real" hardware, what do you think?

Yes we can move virtio-gpu job also to software-driver stage.

>> diff --git a/drivers/gpu/drm/ci/x86_64.config 
>> b/drivers/gpu/drm/ci/x86_64.config
>> index 1cbd49a5b23a..ab4dcca749cc 100644
>> --- a/drivers/gpu/drm/ci/x86_64.config
>> +++ b/drivers/gpu/drm/ci/x86_64.config
>> @@ -24,6 +24,7 @@ CONFIG_DRM=y
>>   CONFIG_DRM_PANEL_SIMPLE=y
>>   CONFIG_PWM_CROS_EC=y
>>   CONFIG_BACKLIGHT_PWM=y
>> +CONFIG_DRM_VKMS=y
> 
> I was wondering if this wouldn't get in the way of other tests, but I 
> guess IGT_FORCE_DRIVER can handle, we just need to make sure it is set 
> and we are testing the correct one.

Yes, we need to skip the vkms tests for other drivers. I think we can go 
with your modprobe approach. We need kmod in debian/x86_64_test-gl 
container to get it working. I have created a MR in mesa for this.

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27088

Once this is merged, will uprev mesa in drm-ci and send updated vkms patch.

Thanks.

Regards,
Vignesh
