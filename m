Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD783F604D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 16:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE465899E6;
	Tue, 24 Aug 2021 14:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A90899DB;
 Tue, 24 Aug 2021 14:26:04 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so36777654otc.4; 
 Tue, 24 Aug 2021 07:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cLmu7zgJaXKzK4Rf3xZy8rbXQ8G9iiiCS2AqbbVSdr4=;
 b=W/vnTArXnkUTeAWPhVsCsNx9G1AaqqjMh7JGGCeKMkNnaOWP3sAbf+15/nLoCNmR3g
 q5YdGS8A1cXpAtJlYg19EzxhKY4ftiJkULVtdpcPrc3JdAsQuBkyHELZ+nm35chlenyd
 B1EUk7sT/qRPK4Ufw9SGcQJoAGqm8fBuCmyUjLn+ofRgVfuPflWOJHcCCZEENzbQUeyQ
 VmavwAVWpqeeI9XEBe9u66mgOWxsXHJm3RTYGIcz6konO25IcoN22AqYojFn8mbqHxKg
 qRzCfRvKs4A+5DaC8fRnZWJa7UOCRmoYWPgWVuJeEHetkAAVaEkEKj7Ut9tMesrOQeKz
 uFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=cLmu7zgJaXKzK4Rf3xZy8rbXQ8G9iiiCS2AqbbVSdr4=;
 b=A0gT77J741JIwgNTw+qJxlcbvO1Mg3AF9kT152SE9Rxfb0kai9HMdDeZBXZNyAVIzq
 Y9/z3q8kQPt3L8myCv7e2G3PVD9Yp+wWDX6gBty33+EQx5Y7CQAFb9IU9yzEVPxLvX7u
 PlAW99+3ckYI3eGDvLhp4dtsH6xfRDZWbI9Uz+d7cLDRTKnO5mEW1BO+DmI+5ASp2gy7
 f0H1aoMSq8J0ElW4N9sZD5oMaIhTwp0XvB6JgrwzOYE6cHzQuFIcack8Eh7W1H52jk1o
 O/LSQUJqwe4z2t3NQnrulexbhCkqxdjbyx5yUh9fTbkcKx1PCUGWx5hi3L5FwRFYInvi
 GJ1Q==
X-Gm-Message-State: AOAM531VHlDeRxotHhfWh5rIATcuIdXtHyQmH0Ty+qffIpgPSGNkVnHO
 6HF6rsIY1kDEESc1PpLasmg=
X-Google-Smtp-Source: ABdhPJwwcoIM6BcsOG2f+J3p/MRlA0Dk0tp13V1qbyu4iB7WMMjh+hei/xpqfoPCtwiA6Z7Inf6E6w==
X-Received: by 2002:a54:4513:: with SMTP id l19mr3045512oil.143.1629815163193; 
 Tue, 24 Aug 2021 07:26:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w23sm4515362otk.56.2021.08.24.07.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:26:02 -0700 (PDT)
Date: Tue, 24 Aug 2021 07:26:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 boris.ostrovsky@oracle.com, jgross@suse.com,
 Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 benh@kernel.crashing.org, paulus@samba.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>,
 grant.likely@arm.com, xypron.glpk@gmx.de,
 Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
 bauerman@linux.ibm.com, peterz@infradead.org,
 Greg KH <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 heikki.krogerus@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 xen-devel@lists.xenproject.org, Nicolas Boichat <drinkcat@chromium.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
 bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
 daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 jxgao@google.com, joonas.lahtinen@linux.intel.com,
 linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matthew.auld@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, thomas.lendacky@amd.com,
 quic_qiancai@quicinc.com
Subject: Re: [PATCH v15 10/12] swiotlb: Add restricted DMA pool initialization
Message-ID: <20210824142601.GA3393158@roeck-us.net>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-11-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624155526.2775863-11-tientzu@chromium.org>
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

Hi Claire,

On Thu, Jun 24, 2021 at 11:55:24PM +0800, Claire Chang wrote:
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes.
> 
> Regardless of swiotlb setting, the restricted DMA pool is preferred if
> available.
> 
> The restricted DMA pools provide a basic level of protection against the
> DMA overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system
> needs to provide a way to lock down the memory access, e.g., MPU.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>
> ---
>  include/linux/swiotlb.h |  3 +-
>  kernel/dma/Kconfig      | 14 ++++++++
>  kernel/dma/swiotlb.c    | 76 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3b9454d1e498..39284ff2a6cd 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -73,7 +73,8 @@ extern enum swiotlb_force swiotlb_force;
>   *		range check to see if the memory was in fact allocated by this
>   *		API.
>   * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
> - *		@end. This is command line adjustable via setup_io_tlb_npages.
> + *		@end. For default swiotlb, this is command line adjustable via
> + *		setup_io_tlb_npages.
>   * @used:	The number of used IO TLB block.
>   * @list:	The free list describing the number of free entries available
>   *		from each index.
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 77b405508743..3e961dc39634 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -80,6 +80,20 @@ config SWIOTLB
>  	bool
>  	select NEED_DMA_MAP_STATE
>  
> +config DMA_RESTRICTED_POOL
> +	bool "DMA Restricted Pool"
> +	depends on OF && OF_RESERVED_MEM
> +	select SWIOTLB

This makes SWIOTLB user configurable, which in turn results in

mips64-linux-ld: arch/mips/kernel/setup.o: in function `arch_mem_init':
setup.c:(.init.text+0x19c8): undefined reference to `plat_swiotlb_setup'
make[1]: *** [Makefile:1280: vmlinux] Error 1

when building mips:allmodconfig.

Should this possibly be "depends on SWIOTLB" ?

Thanks,
Guenter
