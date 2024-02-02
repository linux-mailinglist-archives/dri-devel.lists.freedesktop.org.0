Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D0847C65
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 23:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E3110EF47;
	Fri,  2 Feb 2024 22:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C0BT3gKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CAC810EEFD;
 Fri,  2 Feb 2024 22:41:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 627DD628CE;
 Fri,  2 Feb 2024 22:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09AFC433F1;
 Fri,  2 Feb 2024 22:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706913664;
 bh=exAcKdkKTYBbj02//ly4ATQZUG2yWNQEYrX161BJntQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=C0BT3gKqwpPjY19LTrjlAry5YR+7VFmLrXnqBKSxsPdigLPMyFBx1J8fLuBgr6+Lm
 SlOqNOr5Ox2iiPD8FwnoRna1dURYlqzetiDJ68DVSJKAlQWGXM5rBcBu91MeSbgsjn
 FSnTpRo7EFNyAoBUtXWrjpuSQQvoSWnAKFGfGA4afTAkdDkrBPMjn5W3bDvsG8cIRq
 CSXLOS+4bWNuRPtFrlrAQrrcf+vsjyX+BBnZPKKN43iy0nD2+DJDIva9KxjUIxRTPB
 ax9ObTb5QHrm7ecQsHgyoNM6FgVNee0xu7OxCAwTzZfNui7WbRUtlVBSNXAqkRvUyc
 3kOV+bOjZbkvQ==
Date: Fri, 2 Feb 2024 16:41:02 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Le Ma <le.ma@amd.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 James Zhu <James.Zhu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Shi <alexs@kernel.org>, Jerry Snitselaar <jsnitsel@redhat.com>,
 Wei Liu <wei.liu@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 3/3] drm/amdgpu: wire up the can_remove() callback
Message-ID: <20240202224102.GA732304@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202222603.141240-3-hamza.mahfooz@amd.com>
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

[+cc Bartosz]

On Fri, Feb 02, 2024 at 05:25:56PM -0500, Hamza Mahfooz wrote:
> Removing an amdgpu device that still has user space references allocated
> to it causes undefined behaviour. So, implement amdgpu_pci_can_remove()
> and disallow devices that still have files allocated to them from being
> unbound.

Maybe this would help for things that are completely built-in or
soldered down, but nothing can prevent a user from physically pulling
a card or cable, so I don't think this is a generic solution to the
problem of dangling user space references.

Maybe Bartosz's recent LPC talk is relevant:
https://lpc.events/event/17/contributions/1627/

> Cc: stable@vger.kernel.org
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index cc69005f5b46..cfa64f3c5be5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2323,6 +2323,22 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	return ret;
>  }
>  
> +static bool amdgpu_pci_can_remove(struct pci_dev *pdev)
> +{
> +	struct drm_device *dev = pci_get_drvdata(pdev);
> +
> +	mutex_lock(&dev->filelist_mutex);
> +
> +	if (!list_empty(&dev->filelist)) {
> +		mutex_unlock(&dev->filelist_mutex);
> +		return false;
> +	}
> +
> +	mutex_unlock(&dev->filelist_mutex);
> +
> +	return true;
> +}
> +
>  static void
>  amdgpu_pci_remove(struct pci_dev *pdev)
>  {
> @@ -2929,6 +2945,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
>  	.probe = amdgpu_pci_probe,
> +	.can_remove = amdgpu_pci_can_remove,
>  	.remove = amdgpu_pci_remove,
>  	.shutdown = amdgpu_pci_shutdown,
>  	.driver.pm = &amdgpu_pm_ops,
> -- 
> 2.43.0
> 
