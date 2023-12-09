Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38280B162
	for <lists+dri-devel@lfdr.de>; Sat,  9 Dec 2023 02:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4798910E16F;
	Sat,  9 Dec 2023 01:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17241.xmail.ntesmail.com (mail-m17241.xmail.ntesmail.com
 [45.195.17.241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7673F10E166
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 01:22:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=e6kBuiHhF1GSlWML17rFKSqfGmnDq09ZaTAXaNvDKGygV9wCypiD0zyU2rZ19qnZEESh1ECRd0f9rEmwc4eA7S82D25mjAh9PaECbir6pix8wv8WZVufu31Gs6s85KgVI5ZBeDO6MDB14RXomdIy7nOV4/mPnz1eMjvC/uDMYHA=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
 bh=Ksw/7IywGMYWf1AJ9p0S1CUhJTrJL9FdKIXVss4Vfu8=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 5AAFB780194;
 Sat,  9 Dec 2023 09:21:54 +0800 (CST)
Message-ID: <3b35ebad-c951-49a1-bfff-da79b3492ce1@rock-chips.com>
Date: Sat, 9 Dec 2023 09:21:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] Add VOP2 support on rk3588
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andyshrk@163.com>
References: <20231207075906.651771-1-andyshrk@163.com>
 <8765245.NyiUUSuA9g@diego>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <8765245.NyiUUSuA9g@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkMdSVZDTh9IGhhMQk1JQxpVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
 kG
X-HM-Tid: 0a8c4c2aade8b24fkuuu5aafb780194
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OiI6Fjo6DTw3PE4fSx0WSz4h
 HygaCwxVSlVKTEtJS0NPQkpOSUlNVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSE1NSTcG
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko:

On 12/9/23 00:07, Heiko Stübner wrote:
> Hi Andy,
> 
> Am Donnerstag, 7. Dezember 2023, 08:59:06 CET schrieb Andy Yan:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> This patch sets aims at enable the VOP2 support on rk3588.
>>
>> Main feature of VOP2 on rk3588:
>> Four video ports:
>> VP0 Max 4096x2160
>> VP1 Max 4096x2160
>> VP2 Max 4096x2160
>> VP3 Max 2048x1080
>>
>> 4 4K Cluster windows with AFBC/line RGB and AFBC-only YUV support
>> 4 4K Esmart windows with line RGB/YUV support
>>
>> The current version support all the 8 windows with all the suppported
>> plane format.
>>
>> And we don't have a upstreamed encoder/connector(HDMI/DP) for rk3588
>> yet, Cristian from collabora is working on adding upstream support for
>> HDMI on rk3588.
>>
>> My current test(1080P/4KP60) is runing with a HDMI driver pick from
>> downstream bsp kernel.
>>
>> A branch based on linux-6.7 rc4 containing all the series and
>> HDMI driver(not compatible with mainline rk3568 hdmi) picked
>> from downstream bsp kernel is available [0].
>>
>> [0]https://github.com/andyshrk/linux/commits/rk3588-vop2-upstream-linux-6.7-rc4-2023-12-07
>>
>> Changes in v4:
>> - fix the POST_BUF_EMPTY irq when set mode
>> - use full stop at all the description's end.
>> - address Krzysztof's review about dt-binding in v3
>> - keep all VOP2_FEATURE_HAS_xxx macros increase in order.
>> - address Sascha's review about debugfs
>> - Add const for rockchip,rk3588-iommu compatible
> 
> very nice, the error messages on "mode changes" are gone now.
> Display and even combination with panthor still work of my rk3588-board
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Thanks for your honorable work on this platform, and thanks for you test and review.

So can I add your Tested-by for all this series form PATCH 1~16 in next version?
> 
> 
> 
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
