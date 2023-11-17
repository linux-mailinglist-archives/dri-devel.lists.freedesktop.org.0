Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91F27EEC77
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 08:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB7010E717;
	Fri, 17 Nov 2023 07:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m12738.qiye.163.com (mail-m12738.qiye.163.com
 [115.236.127.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3D510E720
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 07:06:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Nu292DN2E6gfuHIj233Rh8Mdr+z5CJlMWHO8NWBfbI4ao9MCcWWM5VLf2BnX2BVH9c92Fx09CxiX4W8gRKqXwKDxiAREUGNt1I7x/DpyeAWDV6rYxLJjP9k4eRtbglzyPG0EIa1YuA5UhPKtrAj8LITcaYyVn1FdDw0padxAVRs=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=at1ne/rWq7oflyNTr5NsoIEOTljtkrgIcuWxm4pqXDc=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m12779.qiye.163.com (Hmail) with ESMTPA id 6C5477804C6;
 Fri, 17 Nov 2023 15:06:35 +0800 (CST)
Message-ID: <3e011d52-017e-4360-86b4-781535ef61ad@rock-chips.com>
Date: Fri, 17 Nov 2023 15:06:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] drm/rockchip: vop2: Add support for rk3588
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20231114112534.1770731-1-andyshrk@163.com>
 <20231114112855.1771372-1-andyshrk@163.com>
 <20231115090823.GY3359458@pengutronix.de>
 <8f2ebc81-51c5-44d5-b27b-633a6cc85d0d@rock-chips.com>
 <20231116134757.zu7axb6cvriqjm6y@mercury.elektranox.org>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20231116134757.zu7axb6cvriqjm6y@mercury.elektranox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5DGFYZTU8fSEIfSk5LHh1VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk5MSUpJVUpLS1VKQl
 kG
X-HM-Tid: 0a8bdc1a5771b24fkuuu6c5477804c6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxA6Dgw6KDw5MDhKPzJKLA0o
 DyIwFCFVSlVKTEtLSUtPTEJNSU5PVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSE5ISzcG
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chris.obbard@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian:

On 11/16/23 21:47, Sebastian Reichel wrote:
> Hi,
>
> On Thu, Nov 16, 2023 at 06:39:40PM +0800, Andy Yan wrote:
>>>>    	vop2->sys_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,grf");
>>> This already lacks an error check, shame on me...
>>>
>>>> +	vop2->vop_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,vop-grf");
>>>> +	vop2->vo1_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,vo1-grf");
>>>> +	vop2->sys_pmu = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,pmu");
>>> ... but please don't duplicate that.
>> It a little difficult to find a proper way to do the check, as not every soc need all these phandles.
>>
>> Do i need check it per soc?
> I suggest adding a u32 flags to struct vop2_data and then have
> something like this:
>
> if (vop2_data->flags & VOP2_HAS_VOP_GRF) {
>      vop2->vop_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,vop-grf");
>      if (IS_ERR(vop2->vop_grf))
>          return dev_err_probe(dev, PTR_ERR(vop2->vop_grf) "cannot get vop-grf");
> }
>
> if (vop2_data->flags & VOP2_HAS_VO1_GRF) {
>      vop2->vo1_grf = syscon_regmap_lookup_by_phandle(dev->of_node, "rockchip,vo1-grf");
>      if (IS_ERR(vop2->vo1_grf))
>          return dev_err_probe(dev, PTR_ERR(vop2->vo1_grf) "cannot get vo1-grf");
> }
>
> ...


I can do it like this if Sascha is also happy with it.

>
> Greetings,
>
> -- Sebastian
