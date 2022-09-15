Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865295BA042
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 19:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80E710EB92;
	Thu, 15 Sep 2022 17:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 855B310EB92
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 17:11:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C7671682;
 Thu, 15 Sep 2022 10:11:24 -0700 (PDT)
Received: from [10.57.18.118] (unknown [10.57.18.118])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCE083F73B;
 Thu, 15 Sep 2022 10:11:16 -0700 (PDT)
Message-ID: <4c4e5ab8-80eb-7b36-0489-a4e7ee346e4c@arm.com>
Date: Thu, 15 Sep 2022 18:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: enable gamma control on
 RK3399
Content-Language: en-GB
To: Hugh Cole-Baker <sigmaris@gmail.com>
References: <20211019215843.42718-1-sigmaris@gmail.com>
 <20211019215843.42718-4-sigmaris@gmail.com>
 <9196035b-273a-adca-2b87-c70bbab7f5c9@arm.com>
 <7B966E6B-1D3F-4975-AC44-1840951257F1@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <7B966E6B-1D3F-4975-AC44-1840951257F1@gmail.com>
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-15 17:53, Hugh Cole-Baker wrote:
> 
>> On 15 Sep 2022, at 15:40, Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2021-10-19 22:58, Hugh Cole-Baker wrote:
>>> Define the memory region on RK3399 VOPs containing the gamma LUT at
>>> base+0x2000.
>>> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
>>> ---
>>> Changes from v1: no changes in this patch
>>>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> index 3871c7fd83b0..9cbf6ccdd256 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
>>> @@ -1619,7 +1619,7 @@ i2s2: i2s@ff8a0000 {
>>>     	vopl: vop@ff8f0000 {
>>>   		compatible = "rockchip,rk3399-vop-lit";
>>> -		reg = <0x0 0xff8f0000 0x0 0x3efc>;
>>> +		reg = <0x0 0xff8f0000 0x0 0x2000>, <0x0 0xff8f2000 0x0 0x400>;
>>>   		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
>>>   		assigned-clocks = <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
>>>   		assigned-clock-rates = <400000000>, <100000000>;
>>> @@ -1676,7 +1676,7 @@ vopl_mmu: iommu@ff8f3f00 {
>>>     	vopb: vop@ff900000 {
>>>   		compatible = "rockchip,rk3399-vop-big";
>>> -		reg = <0x0 0xff900000 0x0 0x3efc>;
>>> +		reg = <0x0 0xff900000 0x0 0x2000>, <0x0 0xff902000 0x0 0x1000>;
>>
>> Doesn't the second range still need to be shorter than 0xf00 to avoid overlapping the IOMMU?
>>
>> Robin.
> 
> This should be OK, the other registers are in the range ff900000-ff902000, the
> gamma LUT occupies the range ff902000-ff903000, and then the IOMMU registers
> begin at ff903f00. I don't see any overlaps with the IOMMU unless I'm
> misreading the dts.

Oh dear, you're quite right, apparently I can't add up in hex today. 
Sorry for the noise!

Robin.
