Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0683F1C5FB4
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 20:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405276E7F1;
	Tue,  5 May 2020 18:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 062A76E7F1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 18:10:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 727811FB;
 Tue,  5 May 2020 11:10:26 -0700 (PDT)
Received: from [10.57.39.240] (unknown [10.57.39.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A450F3F305;
 Tue,  5 May 2020 11:10:24 -0700 (PDT)
Subject: Re: [PATCH 00/16] dts/dt-bindings: Fix Arm Ltd. ARMv8 "boards"
To: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20200505165212.76466-1-andre.przywara@arm.com>
 <20200505165212.76466-2-andre.przywara@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a96c83b3-dc58-e1da-de52-d36bdfc0533f@arm.com>
Date: Tue, 5 May 2020 19:10:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505165212.76466-2-andre.przywara@arm.com>
Content-Language: en-GB
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-05 5:51 pm, Andre Przywara wrote:
> Date: Mon, 4 May 2020 12:41:55 +0100
> Subject: [PATCH 01/16] dt-bindings: mali-midgard: Allow dma-coherent
> 
> Add the boolean dma-coherent property to the list of allowed properties,
> since some boards (Arm Juno) integrate the GPU this way.

The same comment as for "iommus" applies to some degree here too. 
There's a bit more likelihood that the device itself does want to know 
whether it's integrated coherently, so that it can choose what memory 
attributes to use (as is the case here), but with protocols like 
ACE-lite it's possible to hard-wire any old dumb device to behave 
coherently without even realising. Thus this is another property that 
could legitimately turn up more or less anywhere.

Robin.

> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> index 0407e45eb8c4..5d7165385e1f 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> @@ -87,6 +87,8 @@ properties:
>     "#cooling-cells":
>       const: 2
>   
> +  dma-coherent: true
> +
>   required:
>     - compatible
>     - reg
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
