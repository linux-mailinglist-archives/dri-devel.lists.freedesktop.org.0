Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD6804E3C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0CE10E242;
	Tue,  5 Dec 2023 09:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m127105.qiye.163.com (mail-m127105.qiye.163.com
 [115.236.127.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A256410E242
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:44:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=dGZ4BWZty1d0oIWgBZ6X8FBIyGDPCj743XxLuAfNp+xa34p6BSXVPPWnrai2cFtu/MHaXQF1gs5x6htnfVWl192MLEzMqyi5frolErK8Uhb06vt8nQrgBdjNV6XOr4AZV9ICA09I88dZL2kgtm/Es/DqW6YWSYfL+Qc52ZB/YV8=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=Qwe7/iDLwPEEdgYbXXnkzwx2HO9asx5VCXEH67b0F/w=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 59D887801C1;
 Tue,  5 Dec 2023 17:44:03 +0800 (CST)
Message-ID: <87831dc3-2554-4b53-a9f8-6b61cf67732e@rock-chips.com>
Date: Tue, 5 Dec 2023 17:44:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] drm/rockchip: vop2: Add support for rk3588
Content-Language: en-US
To: Sascha Hauer <sha@pengutronix.de>, Andy Yan <andyshrk@163.com>
References: <20231130122001.12474-1-andyshrk@163.com>
 <20231130122439.13374-1-andyshrk@163.com>
 <20231205092936.GW1057032@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20231205092936.GW1057032@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1DS1ZMGkpCGUoZGEgZTkxVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c395cf962b24fkuuu59d887801c1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRQ6PQw6PDw0FgMVDBpKIykY
 GQxPCRZVSlVKTEtKTE1CT09PSUJIVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSElNTjcG
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha:

On 12/5/23 17:29, Sascha Hauer wrote:
> On Thu, Nov 30, 2023 at 08:24:39PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> VOP2 on rk3588:
>>
>> Four video ports:
>> VP0 Max 4096x2160
>> VP1 Max 4096x2160
>> VP2 Max 4096x2160
>> VP3 Max 2048x1080
>>
>> 4 4K Cluster windows with AFBC/line RGB and AFBC-only YUV support
>> 4 4K Esmart windows with line RGB/YUV support
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> With the two nits below feel free to add my:
> 
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Thanks for working on this.
> 
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>> index 8d7ff52523fb..8b16031eda52 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
>> @@ -13,9 +13,16 @@
>>   
>>   #define VOP_FEATURE_OUTPUT_10BIT        BIT(0)
> 
> You could rename this to include "VP" for Video Port so it's not so
> easily mixed up with the defines below.

Yes, I have the same idea, maybe it's better to do the rename in a separate ?
> 
>>   
>> +#define VOP2_FEATURE_HAS_SYS_GRF	BIT(0)
>> +#define VOP2_FEATURE_HAS_VO0_GRF	BIT(1)
>> +#define VOP2_FEATURE_HAS_VO1_GRF	BIT(2)
>> +#define VOP2_FEATURE_HAS_VOP_GRF	BIT(3)
>> +#define VOP2_FEATURE_HAS_SYS_PMU	BIT(5)
> 
> Should be BIT(4)

Thanks for catching this, will fix in next version.
> 
> Sascha
> 
