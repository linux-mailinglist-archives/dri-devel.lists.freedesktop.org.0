Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DD0C49A98
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 23:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7BF89D60;
	Mon, 10 Nov 2025 22:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iYW7qlLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B6189D60;
 Mon, 10 Nov 2025 22:54:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 708A360195;
 Mon, 10 Nov 2025 22:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1462C113D0;
 Mon, 10 Nov 2025 22:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762815297;
 bh=JrMKdvGveORYut1YwylpofTm4t/bITD/8GFHc/v+mSw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=iYW7qlLh+3jJ2kVDJoqPJKkmUfizQ7aKJJ/v/Ts+DPOU/Z7SvLuwDQi52YTMYcQad
 2nS0a76zgWCKyPSTxSfpzbKkEre2+ZHRUxODkmgZdas2vQ5e26nFTSDGuzC1Il6SzZ
 ZQqJU+hZz+IwEWgKqtmefu0fC8yt5tOJW8eHsvE1dEjuxTMaZME0lnz6ITpCGFC4Vk
 QNOSOnQ7/LoR5CLeH6POBpdhPKTpkxF188iQr3Pn+URYU9KDFZUy9EF2KlFUJ24USC
 B2TBg3lCjaEz/FCHIWch4kGs2fHGYkNxQyaHs4PJqHjoUrHUp7DD6630mE2kXPPFpS
 4gpP3U7GkhotA==
Date: Mon, 10 Nov 2025 16:54:55 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 amd-gfx@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] drm/amdgpu: Remove driver side BAR release before
 resize
Message-ID: <20251110225455.GA2141964@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028173551.22578-9-ilpo.jarvinen@linux.intel.com>
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

amdgpu folks, any objection to this?

On Tue, Oct 28, 2025 at 07:35:50PM +0200, Ilpo Järvinen wrote:
> PCI core handles releasing device's resources and their rollback in
> case of failure of a BAR resizing operation. Releasing resource prior
> to calling pci_resize_resource() prevents PCI core from restoring the
> BARs as they were.
> 
> Remove driver-side release of BARs from the amdgpu driver.
> 
> Also remove the driver initiated assignment as pci_resize_resource()
> should try to assign as much as possible. If the driver side call
> manages to get more required resources assigned in some scenario, such
> a problem should be fixed inside pci_resize_resource() instead.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 7a899fb4de29..65474d365229 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1729,12 +1729,8 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>  	pci_write_config_word(adev->pdev, PCI_COMMAND,
>  			      cmd & ~PCI_COMMAND_MEMORY);
>  
> -	/* Free the VRAM and doorbell BAR, we most likely need to move both. */
> +	/* Tear down doorbell as resizing will release BARs */
>  	amdgpu_doorbell_fini(adev);
> -	if (adev->asic_type >= CHIP_BONAIRE)
> -		pci_release_resource(adev->pdev, 2);
> -
> -	pci_release_resource(adev->pdev, 0);
>  
>  	r = pci_resize_resource(adev->pdev, 0, rbar_size);
>  	if (r == -ENOSPC)
> @@ -1743,8 +1739,6 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>  	else if (r && r != -ENOTSUPP)
>  		dev_err(adev->dev, "Problem resizing BAR0 (%d).", r);
>  
> -	pci_assign_unassigned_bus_resources(adev->pdev->bus);
> -
>  	/* When the doorbell or fb BAR isn't available we have no chance of
>  	 * using the device.
>  	 */
> -- 
> 2.39.5
> 
