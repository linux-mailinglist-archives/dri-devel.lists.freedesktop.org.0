Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE697E80B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E9710E3AF;
	Mon, 23 Sep 2024 09:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="Hysf7U3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5425E10E3AF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1727082114;
 bh=dAioT3wyKoxKPb4pl0VnZgSZEzeLXfNhVBSyVYoz4/0=;
 b=Hysf7U3YxI865sEBGvagGJPqg9VNA7vSOUdbz38j0G0zewmPNLmQcjKVNDJ1SRJZPIPi9wl1c
 dhYHIkPcZ1qn57QVVtf8EN1UUw+BNowX2pQiKEQdP6sTRPJ1vGE2r/gryM2K58AiUzhfz+2hEhU
 NLYSkt2gxy9xILjjTjDYHW7fzNoBN9WZ3EjqQRQMF82erBbqaFQ4+3QgxKpqrGxnx/F7VffYvDv
 RyzPohNKSt9uOL6d6oDdVtCkqNGL3sfIqXCQEGoe504Qr+yORXR7gJR8kU+5k1GnI4QsTXRA8oY
 BE8nY9XTIZprU48arVZZKYZ+ZLTpDI+r5q1rringFy6g==
Message-ID: <26ed8563-b6d6-4e72-91a9-f4d5946cef8f@kwiboo.se>
Date: Mon, 23 Sep 2024 11:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/rockchip: vop: Split rk3288-vop into big and lit
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240921222007.2301868-1-jonas@kwiboo.se>
 <20240921222007.2301868-4-jonas@kwiboo.se>
 <c6821033-57be-4d10-9e37-935f7748570e@kernel.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <c6821033-57be-4d10-9e37-935f7748570e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66f12e7e53a7abd54c98a970
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

Hi Krzysztof,

On 2024-09-22 10:15, Krzysztof Kozlowski wrote:
> On 22/09/2024 00:20, Jonas Karlman wrote:
>> The Rockchip RK3288 SoC contain two different Visual Output Processor
>> (VOP) blocks, VOP_BIG and VOP_LIT. The VOP blocks support different max
>> output resolution, 3840x2160 and 2560x1600.
>>
>> Add support for the compatible used to differentiate between VOP_BIG and
>> VOP_LIT, support for the old compatible is kept for compatibility with
>> older device tree.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 27 +++++++++++++++------
>>  1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> index e2c6ba26f437..978db93cda33 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
>> @@ -762,7 +762,7 @@ static const struct vop_intr rk3288_vop_intr = {
>>  	.clear = VOP_REG(RK3288_INTR_CTRL0, 0xf, 8),
>>  };
>>  
>> -static const struct vop_data rk3288_vop = {
>> +static const struct vop_data rk3288_vop_big = {
>>  	.version = VOP_VERSION(3, 1),
>>  	.feature = VOP_FEATURE_OUTPUT_RGB10,
>>  	.intr = &rk3288_vop_intr,
>> @@ -772,14 +772,22 @@ static const struct vop_data rk3288_vop = {
>>  	.win = rk3288_vop_win_data,
>>  	.win_size = ARRAY_SIZE(rk3288_vop_win_data),
>>  	.lut_size = 1024,
>> -	/*
>> -	 * This is the maximum resolution for the VOPB, the VOPL can only do
>> -	 * 2560x1600, but we can't distinguish them as they have the same
>> -	 * compatible.
>> -	 */
>>  	.max_output = { 3840, 2160 },
>>  };
>>  
>> +static const struct vop_data rk3288_vop_lit = {
>> +	.version = VOP_VERSION(3, 1),
>> +	.feature = VOP_FEATURE_OUTPUT_RGB10,
>> +	.intr = &rk3288_vop_intr,
>> +	.common = &rk3288_common,
>> +	.modeset = &rk3288_modeset,
>> +	.output = &rk3288_output,
>> +	.win = rk3288_vop_win_data,
>> +	.win_size = ARRAY_SIZE(rk3288_vop_win_data),
>> +	.lut_size = 1024,
>> +	.max_output = { 2560, 1600 },
>> +};
>> +
>>  static const int rk3368_vop_intrs[] = {
>>  	FS_INTR,
>>  	0, 0,
>> @@ -1245,8 +1253,13 @@ static const struct of_device_id vop_driver_dt_match[] = {
>>  	  .data = &rk3066_vop },
>>  	{ .compatible = "rockchip,rk3188-vop",
>>  	  .data = &rk3188_vop },
>> +	{ .compatible = "rockchip,rk3288-vop-big",
>> +	  .data = &rk3288_vop_big },
> 
> Hm... that's not really needed. Instead of having three compatibles, you
> could keep "rk3288-vop" as big and then my comment on bindings patch
> could be ignored (you keep the compatible).

Thanks, I guess that just adding a new compatible for vop-lit should be
enough.

VOP_BIG: rockchip,rk3288-vop
VOP_LIT: rockchip,rk3288-vop-lit, rockchip,rk3288-vop

That should ensure backward/forward compatibility with any mix of
old/new boot-firmware, DTs and kernels.

Will change to use that in v2.

Regards,
Jonas

> 
> 
> 
> Best regards,
> Krzysztof
> 

