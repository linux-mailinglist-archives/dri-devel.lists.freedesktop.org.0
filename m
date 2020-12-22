Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932022E0EF5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 20:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04718893CD;
	Tue, 22 Dec 2020 19:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A36E7893CD;
 Tue, 22 Dec 2020 19:27:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C19081FB;
 Tue, 22 Dec 2020 11:27:22 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D97A93F6CF;
 Tue, 22 Dec 2020 11:27:20 -0800 (PST)
Subject: Re: [PATCH v2 3/7] iommu/arm-smmu: Add dependency on io-pgtable
 format modules
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-4-git-send-email-isaacm@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3b0c191d-3fd0-73db-c1e3-4a80aa7953d7@arm.com>
Date: Tue, 22 Dec 2020 19:27:18 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1608597876-32367-4-git-send-email-isaacm@codeaurora.org>
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
Cc: pratikp@codeaurora.org, joro@8bytes.org, kernel-team@android.com,
 will@kernel.org, pdaly@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-22 00:44, Isaac J. Manjarres wrote:
> The SMMU driver depends on the availability of the ARM LPAE and
> ARM V7S io-pgtable format code to work properly. In preparation

Nit: we don't really depend on v7s - we *can* use it if it's available, 
address constraints are suitable, and the SMMU implementation actually 
supports it (many don't), but we can still quite happily not use it even 
so. LPAE is mandatory in the architecture so that's our only hard 
requirement, embodied in the kconfig select.

This does mean there may technically still be a corner case involving 
ARM_SMMU=y and IO_PGTABLE_ARM_V7S=m, but at worst it's now a runtime 
failure rather than a build error, so unless and until anyone 
demonstrates that it actually matters I don't feel particularly inclined 
to give it much thought.

Robin.

> for having the io-pgtable formats as modules, add a "pre"
> dependency with MODULE_SOFTDEP() to ensure that the io-pgtable
> format modules are loaded before loading the ARM SMMU driver module.
> 
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index d8c6bfd..a72649f 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2351,3 +2351,4 @@ MODULE_DESCRIPTION("IOMMU API for ARM architected SMMU implementations");
>   MODULE_AUTHOR("Will Deacon <will@kernel.org>");
>   MODULE_ALIAS("platform:arm-smmu");
>   MODULE_LICENSE("GPL v2");
> +MODULE_SOFTDEP("pre: io-pgtable-arm io-pgtable-arm-v7s");
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
