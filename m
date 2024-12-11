Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704FA9EC9B3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 10:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D072B10E0B8;
	Wed, 11 Dec 2024 09:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pyixXY4y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2031F10E0B8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 09:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733910727;
 bh=KQa0YljSDyn4f2yMLEHD4sXJuIGsikdtCBRivJW4u+8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pyixXY4yVLNRRp7l8Dm2uhUoxDDMaLYCUO/5v86h/IyllVT8vjBOMCX7DXuOpUAUV
 0DiTqMQFUF2iKae6huS8FOqPbSGjvqbXXSYXEpNoF74EpubmiSiAFF0tDOXL+Pzy64
 hjPHIg8LQgSXNytwthlq5gegWpuD04K6LxjhrAm5xxN8VmSzXc3osGt3F9arUiVWXn
 TDf7tlcvO/ehpOBt0tcB4n+szHA9ZC8FtmPBe5AbwafWyKSBz1SRmxSnsNfdWnzapp
 nOqs6NXyz7v9TzFul8L1vc7qt8e+D/vNUXds0ggK1usjzDbbao1yzT1M9wJvU3Ogku
 lMCUxeCWJYozA==
Received: from [192.168.1.90] (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 228AB17E35EA;
 Wed, 11 Dec 2024 10:52:07 +0100 (CET)
Message-ID: <a0cf9b40-8ac2-4d6a-a26c-bafa85096440@collabora.com>
Date: Wed, 11 Dec 2024 11:52:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for HDMI1 output on RK3588 SoC
To: Alexandre ARNOUD <aarnoud@me.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com>
 <BC29D61C-317D-4F82-AF42-EA3D705B0632@me.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <BC29D61C-317D-4F82-AF42-EA3D705B0632@me.com>
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

Hi Alex,

On 12/11/24 11:42 AM, Alexandre ARNOUD wrote:
> Hello Cristian,
> 
>> On 11 Dec 2024, at 12:06 AM, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
>>
>> Changes in v2:
>> - Override hdmi1 pinctrl-0 on rock-5b as it requires hdmim0_tx1_cec
>>  instead of hdmim2_tx1_cec (fixes a pin conflict when enabling
>>  CONFIG_SPI_ROCKCHIP_SFC)
>> - Link to v1: https://lore.kernel.org/r/20241207-rk3588-hdmi1-v1-0-ca3a99b46a40@collabora.com
>>
>> ---
>> Cristian Ciocaltea (4):
>>      drm/rockchip: dw_hdmi_qp: Add support for RK3588 HDMI1 output
>>      arm64: dts: rockchip: Add PHY node for HDMI1 TX port on RK3588
>>      arm64: dts: rockchip: Add HDMI1 node on RK3588
>>      arm64: dts: rockchip: Enable HDMI1 on rock-5b
>>
>> arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi  |  62 ++++++++++++
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts |  44 ++++++++-
>> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c  | 119 +++++++++++++++++++-----
>> 3 files changed, 200 insertions(+), 25 deletions(-)
>> ---
>> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
>> change-id: 20241207-rk3588-hdmi1-704cbb7cd75f
> 
> Tested-by: Alexandre ARNOUD <aarnoud@me.com>
> 
> Works perfectly on Rock-5B, thanks for your work.

Thanks for your quick test report on the series, which helped
identifying the pin conflict issue which I missed initially.

Regards,
Cristian
