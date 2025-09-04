Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8658EB44795
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3909310EAD9;
	Thu,  4 Sep 2025 20:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jCZ7Bgh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74E610EAD9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:42:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BFC366028B;
 Thu,  4 Sep 2025 20:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F1EC4CEF0;
 Thu,  4 Sep 2025 20:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757018578;
 bh=gl6feTJt/B+TOZvG57z5VrXnOhVpynrQD6B5PUvbN1Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=jCZ7Bgh6T2k6NL9SXYmBR+3vZgQiykuOeKOay4XKp5Ym9hPplZwgMUqiO6utxiUhH
 BTUYEmBS5yzuMUpLe7p0j6vIealxoJE7ENcLCSZVh7JNuIa+xGaxMeZREnwHs/muLO
 Kwz7f0WpcDpzwhzaGojx8Dwi67YZP7utHWrec3YEfoEM2UtuOnkx3gGhY7ntvHwNHi
 1+YFt5oIHK//Dc9QVJEOoPXMgwWyHMNYMSLByyGh4VSeZQp/ghZfTF3YvlcdsyHkPF
 tEeVXPWs1JhaNXWuE1W+FPydbcF5m67/7Gg2vZsQfHI5qroM7hsXxrqMy1kiJ079lf
 QhMltA3H3mmhA==
Date: Thu, 4 Sep 2025 15:42:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
Subject: Re: [PATCH v10 3/4] fbcon: Use screen info to find primary device
Message-ID: <20250904204256.GA1277756@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811162606.587759-4-superm1@kernel.org>
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

On Mon, Aug 11, 2025 at 11:26:05AM -0500, Mario Limonciello (AMD) wrote:
> On systems with non VGA GPUs fbcon can't find the primary GPU because
> video_is_primary_device() only checks the VGA arbiter.
> 
> Add a screen info check to video_is_primary_device() so that callers
> can get accurate data on such systems.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

I don't think you need my ack for this, but it does look fine to me.

I wish __screen_info_pci_dev() didn't have to use pci_get_base_class()
to iterate through all the devices, but you didn't change that and
maybe somebody will dream up a more efficient way someday.

Let me know if you need anything more from me.  Thanks for persevering
with this!

> ---
> v10:
>  * Rebase on 6.17-rc1
>  * Squash 'fbcon: Stop using screen_info_pci_dev()'
> ---
>  arch/x86/video/video-common.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/video/video-common.c b/arch/x86/video/video-common.c
> index 81fc97a2a837a..e0aeee99bc99e 100644
> --- a/arch/x86/video/video-common.c
> +++ b/arch/x86/video/video-common.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/screen_info.h>
>  #include <linux/vgaarb.h>
>  
>  #include <asm/video.h>
> @@ -27,6 +28,11 @@ EXPORT_SYMBOL(pgprot_framebuffer);
>  
>  bool video_is_primary_device(struct device *dev)
>  {
> +#ifdef CONFIG_SCREEN_INFO
> +	struct screen_info *si = &screen_info;
> +	struct resource res[SCREEN_INFO_MAX_RESOURCES];
> +	ssize_t i, numres;
> +#endif
>  	struct pci_dev *pdev;
>  
>  	if (!dev_is_pci(dev))
> @@ -34,7 +40,24 @@ bool video_is_primary_device(struct device *dev)
>  
>  	pdev = to_pci_dev(dev);
>  
> -	return (pdev == vga_default_device());
> +	if (!pci_is_display(pdev))
> +		return false;
> +
> +	if (pdev == vga_default_device())
> +		return true;
> +
> +#ifdef CONFIG_SCREEN_INFO
> +	numres = screen_info_resources(si, res, ARRAY_SIZE(res));
> +	for (i = 0; i < numres; ++i) {
> +		if (!(res[i].flags & IORESOURCE_MEM))
> +			continue;
> +
> +		if (pci_find_resource(pdev, &res[i]))
> +			return true;
> +	}
> +#endif
> +
> +	return false;
>  }
>  EXPORT_SYMBOL(video_is_primary_device);
>  
> -- 
> 2.43.0
> 
