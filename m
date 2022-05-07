Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 079FE51E748
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 15:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13941132C0;
	Sat,  7 May 2022 13:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 957 seconds by postgrey-1.36 at gabe;
 Sat, 07 May 2022 10:26:12 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F121112A3A
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 10:26:11 +0000 (UTC)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KwNSd3tbvz1JBwq;
 Sat,  7 May 2022 18:09:05 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 18:10:12 +0800
Received: from [127.0.0.1] (10.67.111.83) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 7 May
 2022 18:10:12 +0800
Message-ID: <07b347c4-11dd-6f7f-7a3b-c9f9ed21bb84@huawei.com>
Date: Sat, 7 May 2022 18:10:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] drm/rockchip: Fix Kconfig dependencies
To: Andy Yan <andy.yan@rock-chips.com>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <airlied@linux.ie>, <daniel@ffwll.ch>, <lyude@redhat.com>, 
 <tzimmermann@suse.de>
References: <20220507010039.117310-1-renzhijie2@huawei.com>
 <45058759-13dd-aa43-ac88-2a7c60baa22b@rock-chips.com>
From: Ren Zhijie <renzhijie2@huawei.com>
In-Reply-To: <45058759-13dd-aa43-ac88-2a7c60baa22b@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 07 May 2022 13:18:19 +0000
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
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2022/5/7 14:39, Andy Yan 写道:
> Hi Zhijie:
>
> On 5/7/22 09:00, Ren Zhijie wrote:
>> If CONFIG_ROCKCHIP_ANALOGIX_DP is not set, the rockchip drm driver
>> will fail to link:
>>
>> drivers/gpu/drm/rockchip/cdn-dp-core.o: In function 
>> `cdn_dp_connector_mode_valid':
>> cdn-dp-core.c:(.text+0x1e1): undefined reference to 
>> `drm_dp_bw_code_to_link_rate'
>> cdn-dp-core.c:(.text+0x1f4): undefined reference to 
>> `drm_dp_bw_code_to_link_rate'
>> drivers/gpu/drm/rockchip/cdn-dp-core.o: In function 
>> `cdn_dp_pd_event_work':
>> cdn-dp-core.c:(.text+0x138e): undefined reference to 
>> `drm_dp_channel_eq_ok'
>> drivers/gpu/drm/rockchip/cdn-dp-reg.o: In function `cdn_dp_train_link':
>> cdn-dp-reg.c:(.text+0xd5a): undefined reference to 
>> `drm_dp_bw_code_to_link_rate'
>>
>> The problem is that the DP-helper module has been replaced by the 
>> display-helper module.
>> So the driver have to select it.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Fixes: 1e0f66420b13("drm/display: Introduce a DRM display-helper 
>> module")
>> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
>> ---
>>   drivers/gpu/drm/rockchip/Kconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig 
>> b/drivers/gpu/drm/rockchip/Kconfig
>> index 5afab49dc4f2..eb9ffa9e357d 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -47,6 +47,8 @@ config ROCKCHIP_ANALOGIX_DP
>>   config ROCKCHIP_CDN_DP
>>       bool "Rockchip cdn DP"
>>       depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
>> +    select DRM_DISPLAY_HELPER
>> +    select DRM_DISPLAY_DP_HELPER
>
>
> There are two dp(ANALOGIX_DP and CDN_DP) at rockchip drm mainline,
>
> for a totally cleanup and alignment, I think it's better to remove 
> "select DRM_DISPLAY_HELPER if ROCKCHIP_ANALOGIX_DP" under 
> DRM_ROCKCHIP  at the head,
>
> and separately add the select for ROCKCHIP_ANALOGIX_DP and 
> ROCKCHIP_CDN_DP.
>
Sure, will do that in v2.
>>       help
>>         This selects support for Rockchip SoC specific extensions
>>         for the cdn DP driver. If you want to enable Dp on
> .

