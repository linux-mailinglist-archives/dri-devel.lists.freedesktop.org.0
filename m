Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A238193221
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 21:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31DA6E7E5;
	Wed, 25 Mar 2020 20:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA4A6E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 20:48:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7bc32c0000>; Wed, 25 Mar 2020 13:46:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 25 Mar 2020 13:48:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 25 Mar 2020 13:48:08 -0700
Received: from [10.26.72.231] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Mar
 2020 20:48:07 +0000
Subject: Re: [PATCH 1/2] drm/tegra: Fix SMMU support on Tegra124 and Tegra210
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200325201604.833898-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <bf883fab-6c41-9e9e-f70d-d3493862529b@nvidia.com>
Date: Wed, 25 Mar 2020 20:48:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325201604.833898-1-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585169196; bh=fMy6HEa7QIELOqAL/AVjWo5vnyvkX2/ne4wG1GkCfrM=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=fl5E7W1QZe97DFqV6T4kAR6XAQ18Se0IbyTMtEgXr7d0Tkgs9klibYOv5XHE1tjaH
 SMcLCZ/hmhx1FHg1GrIATy+XKIM15FRsvBPVxQjErKxpN7BN2b6qq8lhxxEzlb7fRh
 4psSj+ZK7nFeNHCr7F+VMk+7O3GTViyttg7bIdp/7FAZ5BtjHGuFfclc/yIuc56Y/z
 n82KuHoaWTzA22ovx3s1etJ+aF1Lj3r4cFUkzE/OywJzvpcuX6cUe5I+e+7tyfLHL+
 s8XqFIijbKMbmX+YWd5kACExuu/TFqiHtJGek+JsTW5Seub89D024T6NFlyTMb3ahO
 J1AmF6EsObJYQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/03/2020 20:16, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> When testing whether or not to enable the use of the SMMU, consult the
> supported DMA mask rather than the actually configured DMA mask, since
> the latter might already have been restricted.
> 
> Fixes: 2d9384ff9177 ("drm/tegra: Relax IOMMU usage criteria on old Tegra")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c |  3 ++-
>  drivers/gpu/host1x/dev.c    | 13 +++++++++++++
>  include/linux/host1x.h      |  3 +++
>  3 files changed, 18 insertions(+), 1 deletion(-)


Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
