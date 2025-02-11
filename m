Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052DBA30234
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 04:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DA610E2D5;
	Tue, 11 Feb 2025 03:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="PIdjPFq+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6AAB010E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:33:26 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id 0C0AD2107A95; Mon, 10 Feb 2025 19:33:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0C0AD2107A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1739244806;
 bh=fYmFPt08g7qIRdQl9Ec+nj2WGXi6+K9OaWfn1ft+sPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PIdjPFq+YuFtU6QY0NiTugcEB+UE+PvEwaFXsOTcuFRsot15F+tSSeEztLO/rp+pE
 86ogmfontfdrJ7nwSogcFQOZ/T8DEoToy0MIeFolDYEBEXlgOTFJ13w5I/bZBP4Ren
 kFgWbEs4ccM1IxxMJZfMOOwXxsR+YyRP+1RgXSws=
Date: Mon, 10 Feb 2025 19:33:26 -0800
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: mhklinux@outlook.com
Cc: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, christophe.jaillet@wanadoo.fr, wei.liu@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/hyperv: Fix address space leak when Hyper-V DRM
 device is removed
Message-ID: <20250211033326.GA17799@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250210193441.2414-1-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210193441.2414-1-mhklinux@outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Mon, Feb 10, 2025 at 11:34:41AM -0800, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> When a Hyper-V DRM device is probed, the driver allocates MMIO space for
> the vram, and maps it cacheable. If the device removed, or in the error
> path for device probing, the MMIO space is released but no unmap is done.
> Consequently the kernel address space for the mapping is leaked.
> 
> Fix this by adding iounmap() calls in the device removal path, and in the
> error path during device probing.
> 
> Fixes: f1f63cbb705d ("drm/hyperv: Fix an error handling path in hyperv_vmbus_probe()")
> Fixes: a0ab5abced55 ("drm/hyperv : Removing the restruction of VRAM allocation with PCI bar size")
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index e0953777a206..b491827941f1 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -156,6 +156,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>  	return 0;
>  
>  err_free_mmio:
> +	iounmap(hv->vram);
>  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
>  err_vmbus_close:
>  	vmbus_close(hdev->channel);
> @@ -174,6 +175,7 @@ static void hyperv_vmbus_remove(struct hv_device *hdev)
>  	vmbus_close(hdev->channel);
>  	hv_set_drvdata(hdev, NULL);
>  
> +	iounmap(hv->vram);
>  	vmbus_free_mmio(hv->mem->start, hv->fb_size);
>  }
>  
> -- 
> 2.25.1
> 

Thanks for the fix. May I know how do you find such issues ?

Reviewed-by: Saurabh Sengar <ssengar@linux.microsoft.com>
Tested-by: Saurabh Sengar <ssengar@linux.microsoft.com>

- Saurabh

