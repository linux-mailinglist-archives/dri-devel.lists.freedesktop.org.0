Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F99C3B8EDB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 10:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71F46E0CF;
	Thu,  1 Jul 2021 08:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51A56E0CF;
 Thu,  1 Jul 2021 08:32:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DC0D6148E;
 Thu,  1 Jul 2021 08:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625128367;
 bh=jeJo7YphenF8Dg8KYPz7nEazVfWUMoZvNuna2aAEVg8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=LZjaMP8QrJ6JKOUBckUbp7ZuMObXoKNSP43iQTNxorimi/8RANwU1LtjM9hJKGmr/
 0cWoFCKufK6527GwZO5prrsJls4/R3jeGEEWBn/U3GbALL3vVexlCHH+WimhccdIfd
 0gAzFamC8FBXUpcAU5a4miyqDLKa+YrUGo4IxU13vJA3OrddiHHHHAF1906S3QR4vj
 +26Uk7UvGyIOubYhuONMPQXikPKtUBVfI89YKpDo6IqpAScyFSvNqj67quMhUsCKz4
 UtwJzBWa5L6AJ6E7xmWnx6bZA8rRZGS1sldsAcw1yEjEOpHeEmJkoyNAiok/jp9lYF
 e7pCyKe+rqojQ==
Date: Thu, 1 Jul 2021 10:32:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] drm/amdgpu: Fix resource leak on probe error path
In-Reply-To: <nycvar.YFH.7.76.2106241319430.18969@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2107011030030.18969@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2106241319430.18969@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Vojtech Pavlik <vojtech@ucw.cz>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jun 2021, Jiri Kosina wrote:

> From: Jiri Kosina <jkosina@suse.cz>
> 
> This reverts commit 4192f7b5768912ceda82be2f83c87ea7181f9980.
> 
> It is not true (as stated in the reverted commit changelog) that we never 
> unmap the BAR on failure; it actually does happen properly on 
> amdgpu_driver_load_kms() -> amdgpu_driver_unload_kms() -> 
> amdgpu_device_fini() error path.
> 
> What's worse, this commit actually completely breaks resource freeing on 
> probe failure (like e.g. failure to load microcode), as 
> amdgpu_driver_unload_kms() notices adev->rmmio being NULL and bails too 
> early, leaving all the resources that'd normally be freed in 
> amdgpu_acpi_fini() and amdgpu_device_fini() still hanging around, leading 
> to all sorts of oopses when someone tries to, for example, access the 
> sysfs and procfs resources which are still around while the driver is 
> gone.
> 
> Fixes: 4192f7b57689 ("drm/amdgpu: unmap register bar on device init failure")
> Reported-by: Vojtech Pavlik <vojtech@ucw.cz>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>

Friendly ping on this one (as it's easily triggerable in the wild by just 
missing proper firwmare).

Thanks.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 57ec108b5972..0f1c0e17a587 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3414,13 +3414,13 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  	r = amdgpu_device_get_job_timeout_settings(adev);
>  	if (r) {
>  		dev_err(adev->dev, "invalid lockup_timeout parameter syntax\n");
> -		goto failed_unmap;
> +		return r;
>  	}
>  
>  	/* early init functions */
>  	r = amdgpu_device_ip_early_init(adev);
>  	if (r)
> -		goto failed_unmap;
> +		return r;
>  
>  	/* doorbell bar mapping and doorbell index init*/
>  	amdgpu_device_doorbell_init(adev);
> @@ -3646,10 +3646,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>  failed:
>  	amdgpu_vf_error_trans_all(adev);
>  
> -failed_unmap:
> -	iounmap(adev->rmmio);
> -	adev->rmmio = NULL;
> -
>  	return r;
>  }
>  
> -- 
> 2.12.3
> 
> 

-- 
Jiri Kosina
SUSE Labs

