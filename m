Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3CAA5949F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26E891AA;
	Mon, 10 Mar 2025 12:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="nzFN2P0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (unknown [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EEC10E476
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 12:34:52 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 87D63600302B;
 Mon, 10 Mar 2025 12:34:41 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id WKBhROGT4aPH; Mon, 10 Mar 2025 12:34:38 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 5C2506000230;
 Mon, 10 Mar 2025 12:34:38 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1741610078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nm9bV3SCT7LdcvOrvp1YJMQOgiJT5opS8tBpLu2IzIw=;
 b=nzFN2P0qNrK3M1M7HF/Fw6LYlMHSE5FIdkCtc5prG+gsIvEO9b9ZJAFuO4ItDYXiGOlW8D
 C4yUwhxMJkt13OZx9r6JOXE4lY+K8M6ndjpO8x1UBNVkC+ZZHvgAyLS2yBQe+Ipc+19KVy
 OMGsGXWRyldKgtfTQd8aLim7EQQqiB8=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 89AC73600D1;
 Mon, 10 Mar 2025 12:34:37 +0000 (WET)
Message-ID: <19478509-5007-4a20-9512-b965126b7026@tecnico.ulisboa.pt>
Date: Mon, 10 Mar 2025 12:34:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rc] gpu: host1x: Do not assume that a NULL domain means no
 DMA IOMMU
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>,
 Jerry Snitselaar <jsnitsel@redhat.com>, patches@lists.linux.dev,
 regressions@lists.linux.dev
References: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <0-v1-10dcc8ce3869+3a7-host1x_identity_jgg@nvidia.com>
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


Hello again,

On 2/4/25 7:18 PM, Jason Gunthorpe wrote:
> Previously with tegra-smmu, even with CONFIG_IOMMU_DMA, the default domain
> could have been left as NULL. The NULL domain is specially recognized by
> host1x_iommu_attach() as meaning it is not the DMA domain and
> should be replaced with the special shared domain.
> 
> This happened prior to the below commit because tegra-smmu was using the
> NULL domain to mean IDENTITY.
> 
> Now that the domain is properly labled the test in DRM doesn't see NULL.
> Check for IDENTITY as well to enable the special domains.
> 
> This is the same issue and basic fix as seen in
> commit fae6e669cdc5 ("drm/tegra: Do not assume that a NULL domain means no
> DMA IOMMU").
> 
> Fixes: c8cc2655cc6c ("iommu/tegra-smmu: Implement an IDENTITY domain")
> Reported-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Closes: https://lore.kernel.org/all/c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt/
> Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Any news on this patch or any other solutions for this regression? It's
not great if this falls through the cracks, especially when there is a
solution for the problem.

Thanks,
Diogo
