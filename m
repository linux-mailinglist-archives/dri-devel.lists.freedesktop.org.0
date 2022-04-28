Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9D751370A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 16:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889E910E55D;
	Thu, 28 Apr 2022 14:37:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D42910E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 14:37:50 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id i5so7038585wrc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CszHRjQoYJFbbrNoQtqtvbGaCDV1vUEycKzVbNvIqjk=;
 b=fBMw8NclvIzuE+Es+AxL0zToN3q31VCXNo3zDU9DKzOf4it9dT0zqAH6i1G6SdsUcf
 0W+cSE0C4wsAWmFJb8O89lc+4qtJMgmoqQPgoz4zrJWD9oq6CRVb7YBxnzBOEAeE2RDf
 2dubNsfA/m1pv1J+CWjLvgeq7wWHMhJTTDcAahwYIjUNrDjWDFfkBg17e+F9Tx3U7Nwt
 VjzukLTot7Ahl9RENFh3IbbO/Mq4Fb3gyNBizI4T38HkuJoWNwkTWr9MTJ+mU0VYBVBK
 m5Q0imWcsAZfWTzYZ48KOChv8TX6vb3HPM4BsF+MuCm02H45AmI7mGfCJy9M763GjbJk
 35Wg==
X-Gm-Message-State: AOAM532UFmrxxxbZArRVlrHzUIAlagsJjG9zC7apk76nID4azIj4OMOM
 SBb/XGYf8nmt2I/3GF5RGu7iBb3TeH8=
X-Google-Smtp-Source: ABdhPJzs5p+R/52J26Y4hNZlqsAqpuaqNSum/qnfJUJoomeoLuITL3BI/R01M0v0Da4gdkvXq3jXdA==
X-Received: by 2002:adf:eb12:0:b0:207:b333:5e7d with SMTP id
 s18-20020adfeb12000000b00207b3335e7dmr27573896wrn.585.1651156669059; 
 Thu, 28 Apr 2022 07:37:49 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b00393f143efd8sm4542105wms.16.2022.04.28.07.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:37:48 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:37:46 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB
 for Gen1
Message-ID: <20220428143746.sya775ro5zi3kgm3@liuwe-devbox-debian-v2>
References: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, haiyangz@microsoft.com,
 ssengar@microsoft.com, decui@microsoft.com, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, kys@microsoft.com, deller@gmx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 27, 2022 at 06:47:53AM -0700, Saurabh Sengar wrote:
> This patch fixes a bug where GEN1 VMs doesn't allow resolutions greater
> than 64 MB size (eg 7680x4320). Unnecessary PCI check limits Gen1 VRAM
> to legacy PCI BAR size only (ie 64MB). Thus any, resolution requesting
> greater then 64MB (eg 7680x4320) would fail. MMIO region assigning this
> memory shouldn't be limited by PCI bar size.
> 
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
>  drivers/video/fbdev/hyperv_fb.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index c8e0ea2..58c304a 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1009,7 +1009,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  	struct pci_dev *pdev  = NULL;
>  	void __iomem *fb_virt;
>  	int gen2vm = efi_enabled(EFI_BOOT);
> -	resource_size_t pot_start, pot_end;
>  	phys_addr_t paddr;
>  	int ret;
>  
> @@ -1060,23 +1059,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
>  	dio_fb_size =
>  		screen_width * screen_height * screen_depth / 8;
>  
> -	if (gen2vm) {
> -		pot_start = 0;
> -		pot_end = -1;
> -	} else {
> -		if (!(pci_resource_flags(pdev, 0) & IORESOURCE_MEM) ||
> -		    pci_resource_len(pdev, 0) < screen_fb_size) {
> -			pr_err("Resource not available or (0x%lx < 0x%lx)\n",
> -			       (unsigned long) pci_resource_len(pdev, 0),
> -			       (unsigned long) screen_fb_size);
> -			goto err1;

This restriction has been in place since day 1. Haiyang, you wrote this
driver. Can you comment on whether this change here is sensible?

Thanks,
Wei.

> -		}
> -
> -		pot_end = pci_resource_end(pdev, 0);
> -		pot_start = pot_end - screen_fb_size + 1;
> -	}
> -
> -	ret = vmbus_allocate_mmio(&par->mem, hdev, pot_start, pot_end,
> +	ret = vmbus_allocate_mmio(&par->mem, hdev, 0, -1,
>  				  screen_fb_size, 0x100000, true);
>  	if (ret != 0) {
>  		pr_err("Unable to allocate framebuffer memory\n");
> -- 
> 1.8.3.1
> 
