Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8366C5ED06
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 19:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51AA10E254;
	Fri, 14 Nov 2025 18:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uM0NFKeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BC110E254;
 Fri, 14 Nov 2025 18:20:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C38D160188;
 Fri, 14 Nov 2025 18:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1CAC4CEF5;
 Fri, 14 Nov 2025 18:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763144427;
 bh=fyyv/5dYz+olt2A/AtaVxpkvtC9klfScZeacl49Zk74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uM0NFKeFvpOfvmFEGmZuwbb08xgBBse25Ll8tr53AN/aPTPIs7pD2ajHW+hVL1oT2
 QtYysfb2/snyB8jqmbz41ffFkbeo2ZGKp2pVaDku7vUCSliT9WhAWoTXoac+3INPJU
 ofEYpnV+uyxHo2RUvxQxnH62fi9hri6x9dtLq3Mnzhq+KAsMVSOCZ28YZqPfA9oqQI
 UCD13c0kHYF9o74exSCV6zl8O2kxezcBvDrft5ak+3L5nqjZY3z+MLVLkBA7I9UOGJ
 aieASlzwg5HwmfBtMDBAULwgP82P9XfqF5gse3BU5GZgG8fyU49nJCXlfqzkSpHxHj
 k6/LAJ59DvcBw==
Date: Fri, 14 Nov 2025 12:20:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-pci@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] PCI (& drm/amdgpu): BAR to be excluded depends on HW
 generation
Message-ID: <20251114182026.GA2332245@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114103053.13778-1-ilpo.jarvinen@linux.intel.com>
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

On Fri, Nov 14, 2025 at 12:30:53PM +0200, Ilpo Järvinen wrote:
> Depending on HW generation, BAR that needs to be excluded from
> pci_resize_resource() is either 2 or 5.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
> 
> This change should be be folded into the commit 73cd7ee85e78 ("PCI: Fix
> restoring BARs on BAR resize rollback path") in the pci/resource branch.
> 
> Also the changelog should be changed: "(BAR 5)" -> "(BAR 2 or 5)".
> 
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Squashed into 73cd7ee85e78, thanks:

  https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=40a8789930e2

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 4e241836ae68..bf0bc38e1c47 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1736,7 +1736,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>  
>  	pci_release_resource(adev->pdev, 0);
>  
> -	r = pci_resize_resource(adev->pdev, 0, rbar_size, 1 << 5);
> +	r = pci_resize_resource(adev->pdev, 0, rbar_size,
> +				(adev->asic_type >= CHIP_BONAIRE) ? 1 << 5
> +								  : 1 << 2);
>  	if (r == -ENOSPC)
>  		dev_info(adev->dev,
>  			 "Not enough PCI address space for a large BAR.");
> 
> base-commit: 73cd7ee85e788bc2541bfce2500e3587cf79f081
> -- 
> 2.39.5
> 
