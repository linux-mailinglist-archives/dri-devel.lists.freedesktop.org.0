Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D133D1EDD4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 13:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C83610E604;
	Wed, 14 Jan 2026 12:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7742910E604
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 12:45:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10B0C1515;
 Wed, 14 Jan 2026 04:45:09 -0800 (PST)
Received: from [10.57.50.170] (unknown [10.57.50.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 482E43F632;
 Wed, 14 Jan 2026 04:45:14 -0800 (PST)
Message-ID: <abf8a1cd-488f-43d7-80f1-37ba8917b17b@arm.com>
Date: Wed, 14 Jan 2026 12:45:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Move RK3399 eDP pinctrl to
 boards
To: Dragan Simic <dsimic@manjaro.org>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org, jesszhan0024@gmail.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1767111804.git.robin.murphy@arm.com>
 <0b9488badb467ef83a0a464eeea921f59e32e6b0.1767111809.git.robin.murphy@arm.com>
 <81fcd769-d7a5-e909-7105-23cd3d09e473@manjaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <81fcd769-d7a5-e909-7105-23cd3d09e473@manjaro.org>
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

On 2026-01-14 11:49 am, Dragan Simic wrote:
> Hello Robin,
> 
> On Tuesday, December 30, 2025 18:20 CET, Robin Murphy <robin.murphy@arm.com> wrote:
>> The EDP_HOTPLUG pin is optional, and muxed with other functions (notably
>> HDMI CEC), so move its selection from the SoC DTSI to the boards which
>> apparently want it, namely those which enable eDP without "force-hpd".
>> By the same token we drop it from Pinebook Pro, which already uses
>> "force-hpd", and according to the schematics does not have the pin wired
>> at all.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi              | 2 --
>>   arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi    | 2 ++
>>   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts       | 2 --
>>   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts | 2 ++
>>   4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> index 4dcceb9136b7..19a312baa9f1 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
>> @@ -2145,8 +2145,6 @@ edp: dp@ff970000 {
>>   		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
>>   		clocks = <&cru PCLK_EDP>, <&cru PCLK_EDP_CTRL>, <&cru PCLK_VIO_GRF>;
>>   		clock-names = "dp", "pclk", "grf";
>> -		pinctrl-names = "default";
>> -		pinctrl-0 = <&edp_hpd>;
>>   		power-domains = <&power RK3399_PD_EDP>;
>>   		resets = <&cru SRST_P_EDP_CTRL>;
>>   		reset-names = "dp";
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
>> index 9d07353df52c..3f3cb0eb5809 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
>> @@ -241,6 +241,8 @@ &dmc {
>>   };
>>   
>>   &edp {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&edp_hpd>;
>>   	status = "okay";
>>   
>>   	/*
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> index eaaca08a7601..dcab04863d28 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
>> @@ -401,8 +401,6 @@ &cpu_l3 {
>>   
>>   &edp {
>>   	force-hpd;
>> -	pinctrl-names = "default";
>> -	pinctrl-0 = <&edp_hpd>;
>>   	status = "okay";
>>   };
>>   
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
>> index a4ceafe6dd7a..80d6ea0eda84 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dts
>> @@ -141,6 +141,8 @@ sdio_pwrseq: sdio-pwrseq {
>>   };
>>   
>>   &edp {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&edp_hpd>;
>>   	status = "okay";
>>   };
> 
> Thanks for this patch!  These changes are looking good to me, and the
> board dts files changed in this patch are the right ones, i.e. those that
> enable the "edp" node without specifying the "force-hpd" property.
> 
> Additionally,"/omit-if-no-ref/" should be added to the "edp" pinctrl node
> in rk3399-base.dtsi, to not include the "edp_hpd" pinctrl definition in
> the board dtb files where that actuually isn't used.

Ah, indeed - I can't think of a realistic good reason for the pinctrl to 
only be selected by an overlay rather than the base board, and even if 
anyone did conjure up some such crazy modular system, they could always 
change it back. Good thing I got distracted and didn't get round to 
sending v2 last night :)

> With the note above addressed, please feel free to include
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Thanks!

Robin.

