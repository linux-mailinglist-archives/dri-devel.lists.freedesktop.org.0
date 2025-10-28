Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A375C14C19
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293C210E3DF;
	Tue, 28 Oct 2025 13:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="QmTHE+1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at gabe;
 Tue, 28 Oct 2025 10:26:53 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E0210E370
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:26:53 +0000 (UTC)
Received: from [10.10.11.27] (business-24-134-105-141.pool2.vodafone-ip.de
 [24.134.105.141])
 (Authenticated sender: a.erhardt@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 16A932FC004D;
 Tue, 28 Oct 2025 11:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1761646613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMx59YWeliqF/lFY/+ujXIhGSvd8cbjYB40wlB1RYFA=;
 b=QmTHE+1zUU91L74zpwra1sUslqOLhjB8in8RHnroIZSWxQ6lBjrUjbIVH+zGHq++nET7u/
 yusdq9wdM0bxM+vKOVtS6z6N71IW27l7SXCBsr4YeMBySbCjoAmDKI2WWgUKx8bZgmaGrn
 YuJJXxhjlgqW5Vec8+nkonQBlBqJzLc=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=a.erhardt@tuxedocomputers.com
 smtp.mailfrom=aer@tuxedocomputers.com
Message-ID: <e172ebf2-4b65-4781-b9e7-eb7bd4fa956a@tuxedocomputers.com>
Date: Tue, 28 Oct 2025 11:16:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] fbcon: Use screen info to find primary device
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>
References: <20250811162606.587759-1-superm1@kernel.org>
 <20250811162606.587759-4-superm1@kernel.org>
Content-Language: en-US
From: Aaron Erhardt <aer@tuxedocomputers.com>
In-Reply-To: <20250811162606.587759-4-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 Oct 2025 13:06:26 +0000
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

I have a question regarding this change. To me, the function name 
video_is_primary_device() implies that there is only one primary GPU.
I would also expect that the 'boot_display' attribute added later in 
the patch series based on this function is only set for one GPU, but 
that is not necessarily the case. Since I'm working on a user-space
program that reads the 'boot_display' attribute, I need to know what
behavior is intended in order to do a correct implementation.

> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
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

This can mark a VGA device as primary GPU.

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

And then the new code can also choose a primary GPU.

> +
> +	return false;
>  }
>  EXPORT_SYMBOL(video_is_primary_device);
>  

In particular, I have hardware that has this exact configuration where
two GPUs are marked as primary and have a 'boot_display' attribute: the
first one through vga_default_device(), the second one through the new
detection method.

Is this intended?

Kind regards
Aaron

