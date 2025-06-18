Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF04ADEEC8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EA010E854;
	Wed, 18 Jun 2025 14:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="RbLS+nEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915AD10E854
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 14:06:15 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5C180256DF;
 Wed, 18 Jun 2025 16:06:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id arg8hl3w8vFY; Wed, 18 Jun 2025 16:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750255573; bh=F+z3MjGV4TaCyb77dWy2XEtcmuTfBFweoyGTmfosw2k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=RbLS+nELQwq7MsUtGmmRxWu4zbFot/+uRZZvrKaZLQ2Ez/1Gb9qDwHVa0JeTCahLF
 o5Febd3cxIBcuMPLbfuK4nFyHvLCUwmz3t1Kv1FMMzuP2LNyblLKtQATP4cbGjnnDZ
 FJpBk9XORLf8RjbSESf8+PAsDlsrUoU/2PmmZ2+2z1ePDEcgbNl5VPsG9FQQQagyfF
 GHJxnlOMEg4vnk0Y6dPBGNjkK94ewGVXCTt+F0bBZJYdnmw0pG3OHpNDImRdjSl6lE
 q7822OQ7EXXZC0kOadB3uWjYJcWUC3jR1LCm/jDapcRclTrbvKvnVPsBPlmh3ALApG
 ojLQGnYGVPDsg==
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 14:06:13 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: iommu@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: Help: Samsung Exynos 7870 DECON SYSMMU panic
In-Reply-To: <544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org>
References: <544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org>
Message-ID: <919fce023f7b8137dc69d0d55ed7edde@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

On 2025-06-18 14:02, Kaustabh Chakraborty wrote:
> Since bcb81ac6ae3c (iommu: Get DT/ACPI parsing into the proper probe 
> path),
> The Samsung Exynos 7870 DECON device (with patches [1], [2], and [3]) 
> seems
> to not work anymore. Upon closer inspection, I observe that there is an
> IOMMU crash.
> 
> [...]
> 
> -		dev->bus->dma_configure(dev);
> +		if (!strcmp(dev_name(dev), "14830000.decon"))
s/!//
