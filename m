Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D805529CAE
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 10:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7FE10E071;
	Tue, 17 May 2022 08:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E119F10E2C2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 08:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4VukSR4SHYzNRbj8Se/6nK2j2N2wZe6dlFD0wZxtWkE=; b=QpSNtWwev4f6WmROZ/65USyGPP
 7Vt3YD/nXn0k3AkUBRq9FsFnSnBqhooH+AK2Wa8ORFNFBcROwIfI4Uox/4C9aoh4DILVKVGju2WZr
 p6uKrQQd7eOtGvoszGNxryeBR6bJNcSc0B4EW4F3wLz5jyfymVPEUeETzM0KyqgeUVFBcsr0bN2u/
 6JTDFchqmUtdUTQ8Bv4ViCpEiZRmnwbQhBoPLUXJiSjXinnTAsPGm1umZ1T1xvaDW/CWBzoqaEbc4
 EcYfvflpLku30iKzmrO+jgHF1UatseYFsCWki0Bf3+L1efkJA1CORXg24Zx1EiGbT7qa5x4PoFX4M
 hjtvGVeA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqsjF-0007u3-KW; Tue, 17 May 2022 11:38:53 +0300
Message-ID: <1fccdfe8-d44c-2d56-e572-628998efc985@kapsi.fi>
Date: Tue, 17 May 2022 11:38:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v1 03/13] arm64: tegra: Add Host1x and VIC on Tegra234
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-4-cyndis@kapsi.fi>
 <424b02f3-eb53-68d0-bfee-5488dbcefa71@linaro.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <424b02f3-eb53-68d0-bfee-5488dbcefa71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/17/22 11:01, Krzysztof Kozlowski wrote:
> On 16/05/2022 12:02, cyndis@kapsi.fi wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Add device tree nodes for Host1x and VIC on Tegra234.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 46 ++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>> index cb3af539e477..cae68e59580c 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>> @@ -454,6 +454,52 @@ misc@100000 {
>>   			status = "okay";
>>   		};
>>   
>> +		host1x@13e00000 {
> 
> Generic node names, if that possible. Since the bindings do not exist in
> the next, I actually cannot figure out what's host1x...

Host1x is a hardware block that provides programmable DMA channels, HW 
synchronization primitives, and virtualization support for IP blocks 
connected to its "host1x bus". So far I haven't found a one or two word 
way to describe it despite efforts. In any case, considering all the 
existing documentation and device trees that use this name, I'd prefer 
not changing it (especially as I don't know what else it could be called).

> 
>> +			compatible = "nvidia,tegra234-host1x";
>> +			reg = <0x13e00000 0x10000>,
>> +			      <0x13e10000 0x10000>,
>> +			      <0x13e40000 0x10000>;
>> +			reg-names = "common", "hypervisor", "vm";
>> +			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
>> +			             <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "syncpt0", "syncpt1", "syncpt2", "syncpt3", "syncpt4",
>> +			                  "syncpt5", "syncpt6", "syncpt7", "host1x";
>> +			clocks = <&bpmp TEGRA234_CLK_HOST1X>;
>> +			clock-names = "host1x";
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			ranges = <0x15000000 0x15000000 0x01000000>;
>> +			interconnects = <&mc TEGRA234_MEMORY_CLIENT_HOST1XDMAR &emc>;
>> +			interconnect-names = "dma-mem";
>> +			iommus = <&smmu_niso1 TEGRA234_SID_HOST1X>;
>> +
>> +			vic@15340000 {
> 
> The same... vic is usually a vectored interrupt controller, so this
> should be interrupt-controller. Unless it is something entirely else, so
> then you need to come with a generic name.

VIC here is video image compositor (with various other 2d operations). I 
suppose I can invent some generic name. Any thoughts, Thierry?

Mikko

> 
> 
> Best regards,
> Krzysztof

