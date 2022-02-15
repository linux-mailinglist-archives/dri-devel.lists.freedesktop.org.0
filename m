Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4894B6BDD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 13:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02DE10E444;
	Tue, 15 Feb 2022 12:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF2DE10E444
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 12:17:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 913601480;
 Tue, 15 Feb 2022 04:17:29 -0800 (PST)
Received: from [10.57.70.89] (unknown [10.57.70.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9269D3F718;
 Tue, 15 Feb 2022 04:17:28 -0800 (PST)
Message-ID: <ecfe727c-e78f-1598-0366-f95d8ffd1007@arm.com>
Date: Tue, 15 Feb 2022 12:17:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/9] dt-bindings: Add arm,mali-valhall compatible
Content-Language: en-GB
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-2-alyssa.rosenzweig@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220211202728.6146-2-alyssa.rosenzweig@collabora.com>
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
Cc: airlied@linux.ie, devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-11 20:27, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
>  From the kernel's perspective, pre-CSF Valhall is more or less
> compatible with Bifrost, although they differ to userspace. Add a
> compatible for Valhall to the existing Bifrost bindings documentation.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: devicetree@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 63a08f3f321d..48aeabd2ed68 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -23,6 +23,7 @@ properties:
>             - rockchip,px30-mali
>             - rockchip,rk3568-mali
>         - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> +      - const: arm,mali-valhall # Mali Valhall GPU model/revision is fully discoverable

This requires all existing Bifrost users to add the Valhall compatible 
as well - I don't think that's what you want. From what we tossed about 
on IRC the other week, I'd imagined something more in the shape of:

   compatible:
     oneOf:
       - items:
           - enum:
               - vendor,soc-mali
               - ...
           - const: arm,mali-bifrost
       - items:
           - enum:
               - vendor,soc-mali
               - ...
           - const: arm,mali-valhall
           - const: arm,mali-bifrost #or not, depending on 
forward-compatibility preferences

Cheers,
Robin.
