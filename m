Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A61950828
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 16:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5A010E00B;
	Tue, 13 Aug 2024 14:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="hZabVRNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FEF10E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 14:49:32 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723560555; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=T7k15fzR6ZeRas0Yws11RUsu/Wmry+zxDI8dDDUpMt6uIXhI4Dm5BdHluSIP5n9ucncwQrMpEe11BIQ6iamc+2ld0Q+wj6APeZoVS1yMKVLJPvhbEj0oDBHes7BO1qpxgQe+sK7CsqL9Ofpo8jDgSbB7v5URQsbhfsyzb2AbbYQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723560555;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9A8PfA0lD2m3WJCSallRUQuWCv07fL5sTjlZMRnm8cE=; 
 b=acrygEnLK2dju+kCdrgd+KXQpuhTfuWEkzj6AE1WIxltzT2Or4BNuk17I/GeyC4od5LImQ2oSLCE1a+aAIwu548TRJ90ckgHiMu9jyqyJbf0dBbnPAuHsw8RE3UMl6cM/rReV/4NRfFzWIcA72lja6yJ8r6aDmKlZcUEs6Gg1zE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723560555; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9A8PfA0lD2m3WJCSallRUQuWCv07fL5sTjlZMRnm8cE=;
 b=hZabVRNGAAs7o4UBRDD+FaffzLp2vM5Om2YbqE0tOUMSwyN7yioHL4IiXmoehtp/
 lv4l5yX3nQSrIsQNmMHeF9dCMTC5hM4gznjBXqSwSt9sVIgYFTXoXMEzzgb9ZQw7yXb
 PWf0MxhjGZSsg/lGzKPTZ8AaOt5Uj+JdQN+HZ0HU=
Received: by mx.zohomail.com with SMTPS id 1723560553528681.1259506022782;
 Tue, 13 Aug 2024 07:49:13 -0700 (PDT)
Message-ID: <05d1af7a-0bea-464f-a551-3fd8bf5ea9d5@collabora.com>
Date: Tue, 13 Aug 2024 17:49:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Add initial support for the Rockchip RK3588 HDMI
 TX Controller
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240807-b4-rk3588-bridge-upstream-v3-0-60d6bab0dc7c@collabora.com>
 <2006431.fxN4lLDhpz@diego>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <2006431.fxN4lLDhpz@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

On 8/13/24 4:17 PM, Heiko Stübner wrote:
> Am Mittwoch, 7. August 2024, 13:07:22 CEST schrieb Cristian Ciocaltea:
>> The Rockchip RK3588 SoC family integrates the Synopsys DesignWare HDMI
>> 2.1 Quad-Pixel (QP) TX controller, which is a new IP block, quite
>> different from those used in the previous generations of Rockchip SoCs.
>>
>> The controller supports the following features, among others:
>>
>> * Fixed Rate Link (FRL)
>> * Display Stream Compression (DSC)
>> * 4K@120Hz and 8K@60Hz video modes
>> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
>> * Fast Vactive (FVA)
>> * SCDC I2C DDC access
>> * Multi-stream audio
>> * Enhanced Audio Return Channel (EARC)
>>
>> This is the last component that needs to be supported in order to enable
>> the HDMI output functionality on the RK3588 based SBCs, such as the
>> RADXA Rock 5B.  The other components are the Video Output Processor
>> (VOP2) and the Samsung IP based HDMI/eDP TX Combo PHY, for which basic
>> support has been already made available via [1] and [2], respectively.
>>
>> Please note this is a reworked version of the original series, which
>> relied on a commonized dw-hdmi approach.  Since the general consensus
>> was to handle it as an entirely new IP, I dropped all patches related to
>> the old dw-hdmi and Rockchip glue code - a few of them might still make
>> sense as general improvements and will be submitted separately.
>>
>> It's worth mentioning the HDMI output support is currently limited to
>> RGB output up to 4K@60Hz, without audio, CEC or any of the HDMI 2.1
>> specific features.  Moreover, the VOP2 driver is not able to properly
>> handle all display modes supported by the connected screens, e.g. it
>> doesn't cope with non-integer refresh rates.
>>
>> A possible workaround consists of enabling the display controller to
>> make use of the clock provided by the HDMI PHY PLL.  This is still work
>> in progress and will be submitted later, as well as the required DTS
>> updates.
>>
>> To facilitate testing and experimentation, all HDMI output related
>> patches, including those part of this series, are available at [3].
>>
>> So far I could only verify this on the RADXA Rock 5B board.
> 
> On a rk3588-tiger-haikou (including its DSI hat and my preliminary DSI
> driver) it also works.
> 
> Even with both DSI and HDMI at the same time. Both hdmi plugged in on
> boot and also plugging it in during runtime of the board, generates a
> clean image on my 1080p display.
> 
> So, series
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Thanks for checking this out!

Regards,
Cristian
