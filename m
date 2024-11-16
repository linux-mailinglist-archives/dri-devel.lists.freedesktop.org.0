Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779819D016D
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 00:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC28F10E201;
	Sat, 16 Nov 2024 23:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="p36JVddU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBAA10E201
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 23:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731799334;
 bh=hlDAqD7B9xoSkBa/4eiClvoljR+dK557brn+9rmbF+s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p36JVddUrAA0pa+xJHFYYjoedQ+zcIHWixrC64AqnF/KpKTnJmUOBKZc7rohrvGe5
 HxXbbcfvTVeskRu7F9pDywq+bO1hW6F34lDDlahH/ptXmrbE0+PMXQd7+tGZnJUvOT
 DXiqwODd90KComjPo+Ah6bahP1WJYHhh89TaEGP8O1ZIuhXhJ3iQqhkez3HjcZ0Fgy
 ahPGszMl9tEI0d9x5HesZd8rmMc4/QgmY/CfFdFPZmPK+cXtNJKOH2z6UXirCxTxKl
 Ktx/M42KINi3bsXuqYafQXtRQCbxXsAZY9x8llkjtduURwfTgsiIOpzPpPHVBcL//d
 KskbCQkGKa5jg==
Received: from [192.168.1.90] (unknown [86.120.21.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B2A017E0CD2;
 Sun, 17 Nov 2024 00:22:14 +0100 (CET)
Message-ID: <3d330c00-cdf0-4103-ac4b-b3d4e5c81335@collabora.com>
Date: Sun, 17 Nov 2024 01:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/rockchip: vop2: Improve display modes handling on
 RK3588 HDMI0
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
 <20241116-vop2-hdmi0-disp-modes-v1-3-2bca51db4898@collabora.com>
 <c79c1878-370d-45fa-a802-1d175498bb1c@kwiboo.se>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <c79c1878-370d-45fa-a802-1d175498bb1c@kwiboo.se>
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

Hi Jonas,

On 11/16/24 9:12 PM, Jonas Karlman wrote:
> Hi Cristian,
> 
> On 2024-11-16 19:22, Cristian Ciocaltea wrote:
>> The RK3588 specific implementation is currently quite limited in terms
>> of handling the full range of display modes supported by the connected
>> screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are just a
>> few of them.
>>
>> Additionally, it doesn't cope well with non-integer refresh rates like
>> 59.94, 29.97, 23.98, etc.
>>
>> Make use of HDMI0 PHY PLL as a more accurate DCLK source to handle
>> all display modes up to 4K@60Hz.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 34 ++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 3e4c1cfd0bac6fa90f4cab85e27c2a69b86fc9aa..dfe1a50132d596f036430d7db3631398d0802972 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

[...]

>> +	/*
>> +	 * Switch to HDMI PHY PLL as DCLK source for display modes up
>> +	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
>> +	 */
>> +	if (vop2->pll_hdmiphy0 && mode->crtc_clock <= VOP2_MAX_DCLK_RATE) {
>> +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
>> +			struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
>> +
>> +			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
>> +				if (!vp->dclk_src)
>> +					vp->dclk_src = clk_get_parent(vp->dclk);
>> +
>> +				ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
>> +				if (ret < 0)
>> +					drm_warn(vop2->drm,
>> +						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
>> +				break;
>> +			}
>> +		}
>> +	}
> 
> Why do we need to do this dynamically here?
> 
> The device tree set PLL_HPLL as parent:
> 
> &vop {
> 	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> 	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
> 	status = "okay";
> };
> 
> Could this not just be changed to assign hdptxphy_hdmi0 as parent?
> 
> &vop {
> 	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> 	assigned-clock-parents = <&hdptxphy_hdmi0>, <&cru PLL_VPLL>;
> 	status = "okay";
> };
> 
> or something similar?
> 
> For RK3328 the vop dclk parent is assigned to hdmiphy using DT.

Yes, that would normally work.  The problem is that the PHY PLLs cannot
provide pixel clocks for resolutions above 4K@60Hz (hence limited to
HDMI 2.0), while VOP2 on RK3588 supports up to 8K@60Hz (making use of
HDMI 2.1).

On top of that, the 2 PLLs are shared between 3 out of the 4 video ports
of the display controller.  There is quite a bit of complexity in
downstream driver to handle all possible usecases - see [1] for a brief
description on how is that supposed to work.

Regards,
Cristian

[1] https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr4.1/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c#L4742

