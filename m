Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13187CC39
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 12:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885A110E817;
	Fri, 15 Mar 2024 11:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MsfFOs2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9B310E817
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 11:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710501840;
 bh=uABvPXOqq/Tla+Cl257JwPcyrRf1VhVmEZ2NakP1f7Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MsfFOs2ZYu+BQgQDviu0tZEHVVU8he4yCSLf2PFK5ZcEkAh9y/w+V0kUvefrTlE+i
 BVQO+/8MmT/ZloAKZNC9kOl74Ju83Uk9kybn/K8qLVeA2yu8NI7/3IVTB1E14OMBGt
 FefOx23cfRZ1N095xm64zGX3ddp6IBx6j1MSebmoYWc1SKYt1T6izxYd2QuVNrk3JV
 Kblz3U7J4V9jPqFD9czrxC8wJkOP9ltogw5DLsG64OPzF/HEyM/qEWGUQyqB1Pgok/
 N9iXEeK15XZ7mmQibOUFVX66F18q1/X6yQMV5orY/j9oz7xsdZM53cW2Rj3qXnfbLS
 FWtHAJlrROiXg==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D1575378105A;
 Fri, 15 Mar 2024 11:23:56 +0000 (UTC)
Message-ID: <1cbe364d-465a-ccba-a446-5f98b9e0efc4@collabora.com>
Date: Fri, 15 Mar 2024 16:53:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/11] drm/ci: Add support for GPU and display testing
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <5559672d-4f62-4ad1-95b7-94f69b8bb9ac@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <5559672d-4f62-4ad1-95b7-94f69b8bb9ac@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Helen,

On 07/03/24 19:32, Helen Koike wrote:
> 
> 
> On 06/03/2024 00:06, Vignesh Raman wrote:
>> Some ARM SOCs have a separate display controller and GPU, each with
>> different drivers. For mediatek mt8173, the GPU driver is powervr,
>> and the display driver is mediatek. In the case of mediatek mt8183,
>> the GPU driver is panfrost, and the display driver is mediatek.
>> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
>> display driver is rockchip. For amlogic meson, the GPU driver is
>> panfrost, and the display driver is meson.
>>
>> IGT tests run various tests with different xfails and can test both
>> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
>> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
>> This leads to incomplete coverage since the display is never tested on
>> these platforms. This commit series adds support in drm-ci to run tests
>> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
>> Meson platforms.
>>
>> Uprev mesa and IGT in drm-ci and add amd, v3d, vc4 and vgem specific
>> tests to testlist. Have testlist.txt per driver and include a base
>> testlist so that the driver specific tests will run only on those 
>> hardware
>> and add testlists to the MAINTAINERS file.
>>
>> This series also includes patch to add vkms testing to drm-ci.
>>
>> Working pipeline link,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1119859
> 
> Hi Vignesh, thanks for this patchset.
> 
> Just to confirm, the new convention is:
> 
> stages are named per DRIVER_NAME

Yes correct.

> jobs are named DRIVER_NAME:GPU_VERSION

Yes

> xfails files and testlist files are named DRIVER_NAME-<xfails-suffix>.txt

Base testlist is named as testlist.txt
driver specific testlist is named as testlist-$DRIVER_NAME.txt

xfails files are named as $DRIVER_NAME-$GPU_VERSION-<xfails-suffix>.txt 
(mediatek-mt8183-fails.txt)

> 
> Looks good.
> 
> I just have some minor comments/questions in the series, please check.

Will address those and send v5.

Regards,
Vignesh

