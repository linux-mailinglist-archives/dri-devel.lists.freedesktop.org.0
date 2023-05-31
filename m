Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 979F6718873
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB0C10E1D5;
	Wed, 31 May 2023 17:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE3E10E1D5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 17:28:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81EDA61B68;
 Wed, 31 May 2023 17:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF8DC433EF;
 Wed, 31 May 2023 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685554086;
 bh=QUys/yTxIdSYTpQugTpVBvBDboSkoG+k/FTxlWRW0II=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=OmJ1ssTzhjT6CCXPr0dF/pbWm9TbHyxrH7iMFETRLmMIJZSDRpmCETKbi+hba0C2b
 dm9pVYYD6SmaWnkWw5LP9lbH0qS8UfWA6av3tKFTO0PLeoaPW907E335Cwn2rMgFLT
 GyuorTUazfiqACcAdF3OOoYOeCqdUHxrI3J1zmBXSRkglmr3kToLgIna8DzC3Vo1O4
 0hac1ipWWdsgPqZRCxsW7GOxnUr4URhdidQh0JNcy63x8T8LZrGixjOTRfP2z/raAj
 GCMf8clZ8F2nCj9zcEBdlmjLocOeYW6mqMIZ3+vstSTOgJKc4NQkyqTz03Hs6WhfdK
 +euCGNig9Eufw==
Date: Wed, 31 May 2023 12:28:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v2] PCI: Add dummy implement for pci_clear_master()
 function
Message-ID: <ZHeDpbtM3FFOPn6d@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531102744.2354313-1-suijingfeng@loongson.cn>
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
Cc: kernel test robot <lkp@intel.com>, Li Yi <liyi@loongson.cn>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jesse Barnes <jbarnes@virtuousgeek.org>, loongson-kernel@lists.loongnix.cn,
 Ben Hutchings <bhutchings@solarflare.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Matthew Wilcox <willy@infradead.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 31, 2023 at 06:27:44PM +0800, Sui Jingfeng wrote:
> As some arch(m68k for example) doesn't have config_pci enabled, drivers[1]
> call pci_clear_master() without config_pci guard can not pass compile test.
> 
>    drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:
>    In function 'etnaviv_gpu_pci_fini':
> >> drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c:32:9:
>    error: implicit declaration of function 'pci_clear_master';
>    did you mean 'pci_set_master'? [-Werror=implicit-function-declaration]
>       32 |         pci_clear_master(pdev);
>          |         ^~~~~~~~~~~~~~~~
>          |         pci_set_master
>    cc1: some warnings being treated as errors
> 
> [1] https://patchwork.freedesktop.org/patch/539977/?series=118522&rev=1
> 
> V2:
> 	* Adjust commit log style to meet the convention and add Fixes tag
> 
> Fixes: 6a479079c072 ("PCI: Add pci_clear_master() as opposite of pci_set_master()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305301659.4guSLavL-lkp@intel.com/
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Applied to pci/misc for v6.5 as follows:

  Author: Sui Jingfeng <suijingfeng@loongson.cn>
  Date:   Wed May 31 18:27:44 2023 +0800

    PCI: Add pci_clear_master() stub for non-CONFIG_PCI
    
    Add a pci_clear_master() stub when CONFIG_PCI is not set so drivers that
    support both PCI and platform devices don't need #ifdefs or extra Kconfig
    symbols for the PCI parts.
    
    [bhelgaas: commit log]
    Fixes: 6a479079c072 ("PCI: Add pci_clear_master() as opposite of pci_set_master()")
    Link: https://lore.kernel.org/r/20230531102744.2354313-1-suijingfeng@loongson.cn
    Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
>  include/linux/pci.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index d0c19ff0c958..71c85380676c 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1904,6 +1904,7 @@ static inline int pci_dev_present(const struct pci_device_id *ids)
>  #define pci_dev_put(dev)	do { } while (0)
>  
>  static inline void pci_set_master(struct pci_dev *dev) { }
> +static inline void pci_clear_master(struct pci_dev *dev) { }
>  static inline int pci_enable_device(struct pci_dev *dev) { return -EIO; }
>  static inline void pci_disable_device(struct pci_dev *dev) { }
>  static inline int pcim_enable_device(struct pci_dev *pdev) { return -EIO; }
> -- 
> 2.25.1
> 
