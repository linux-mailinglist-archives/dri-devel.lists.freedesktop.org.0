Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9506BD32EF1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E34110E8B3;
	Fri, 16 Jan 2026 14:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=schreibt.jetzt header.i=@schreibt.jetzt header.b="VaIjciaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 544 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jan 2026 12:09:41 UTC
Received: from sosiego.soundray.org (sosiego.soundray.org [116.203.207.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D56110E205
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:09:41 +0000 (UTC)
From: Linus Heckemann <linus@schreibt.jetzt>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schreibt.jetzt;
 s=sosiego; t=1768564835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fZpNl6qLmku+wDFFbX6PIZ6rmp6961Cg6/l5UNO/3aI=;
 b=VaIjciaP4wD7UHRzhPtd6F8AOMWXAvojghwS0p4Fk5ELCMWzlfPxkTCV/c/93kpZwPcOpR
 WCRg22Djr5wa9hnCC9EPeM8f9PLzaaK5Y3M8knoeuAnWG/rY2XcozJ+D+aO6IxE6oIjmQo
 0xgKjXdsMswvqqK+eNGQf+FQ+I6vXOA=
To: Jason Gunthorpe <jgg@nvidia.com>, Min Ma <min.ma@amd.com>, Lizhi Hou
 <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: amdxdna breaks suspend (was: Re: [PATCH v5 2/8] iommu: Remove
 IOMMU_DEV_FEAT_SVA)
In-Reply-To: <20251230011916.GB23056@nvidia.com>
References: <20250418080130.1844424-1-baolu.lu@linux.intel.com>
 <20250418080130.1844424-3-baolu.lu@linux.intel.com>
 <ygaqzsib7bc.fsf@localhost> <20251230011916.GB23056@nvidia.com>
Date: Fri, 16 Jan 2026 13:00:34 +0100
Message-ID: <yga3445n4wt.fsf@localhost>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 16 Jan 2026 14:55:55 +0000
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

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Thu, Dec 25, 2025 at 10:05:59PM +0100, Linus Heckemann wrote:
>> It appears the code removed here was not in fact entirely dead; my 2024
>> gpd win mini ("G1617-01", with a Ryzen 8840U) fails to suspend
>> correctly, and I bisected the issue to this commit.
>
> The only behavior change this patch had that could be relavent to a
> Ryzen was in drivers/accel/amdxdna/aie2_pci.c - are you using this
> driver?
>
> Prior to this patch amdxdna would have failed to load in configs
> without an iommu as iommu_dev_enable_feature() would have
> failed. After this patch it will load successfully.
>
> If so then that driver presmuably doesn't have working power
> management in your system.

You're right, blacklisting the amdxdna driver fixes suspend, thanks for
the pointer!

@Min Ma, Lizhi Hou, dri-devel: do you have any insight into why this
might be happening?

Cheers

Linus H
