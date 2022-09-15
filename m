Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1125B9D82
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 16:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8224310EB55;
	Thu, 15 Sep 2022 14:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BA6510EB4E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 14:40:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A7DC1682;
 Thu, 15 Sep 2022 07:40:54 -0700 (PDT)
Received: from [10.57.18.118] (unknown [10.57.18.118])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA45B3F73D;
 Thu, 15 Sep 2022 07:40:46 -0700 (PDT)
Message-ID: <9196035b-273a-adca-2b87-c70bbab7f5c9@arm.com>
Date: Thu, 15 Sep 2022 15:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: enable gamma control on
 RK3399
Content-Language: en-GB
To: Hugh Cole-Baker <sigmaris@gmail.com>, heiko@sntech.de, hjc@rock-chips.com
References: <20211019215843.42718-1-sigmaris@gmail.com>
 <20211019215843.42718-4-sigmaris@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211019215843.42718-4-sigmaris@gmail.com>
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
Cc: linux-rockchip@lists.infradead.org, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-10-19 22:58, Hugh Cole-Baker wrote:
> Define the memory region on RK3399 VOPs containing the gamma LUT at
> base+0x2000.
> 
> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
> ---
> 
> Changes from v1: no changes in this patch
> 
>   arch/arm64/boot/dts/rockchip/rk3399.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> index 3871c7fd83b0..9cbf6ccdd256 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
> @@ -1619,7 +1619,7 @@ i2s2: i2s@ff8a0000 {
>   
>   	vopl: vop@ff8f0000 {
>   		compatible = "rockchip,rk3399-vop-lit";
> -		reg = <0x0 0xff8f0000 0x0 0x3efc>;
> +		reg = <0x0 0xff8f0000 0x0 0x2000>, <0x0 0xff8f2000 0x0 0x400>;
>   		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
>   		assigned-clocks = <&cru ACLK_VOP1>, <&cru HCLK_VOP1>;
>   		assigned-clock-rates = <400000000>, <100000000>;
> @@ -1676,7 +1676,7 @@ vopl_mmu: iommu@ff8f3f00 {
>   
>   	vopb: vop@ff900000 {
>   		compatible = "rockchip,rk3399-vop-big";
> -		reg = <0x0 0xff900000 0x0 0x3efc>;
> +		reg = <0x0 0xff900000 0x0 0x2000>, <0x0 0xff902000 0x0 0x1000>;

Doesn't the second range still need to be shorter than 0xf00 to avoid 
overlapping the IOMMU?

Robin.

>   		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
>   		assigned-clocks = <&cru ACLK_VOP0>, <&cru HCLK_VOP0>;
>   		assigned-clock-rates = <400000000>, <100000000>;
