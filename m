Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C58FAD2C51
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 05:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2C710E245;
	Tue, 10 Jun 2025 03:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Tue, 10 Jun 2025 03:52:49 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147A010E226;
 Tue, 10 Jun 2025 03:52:49 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id D8F322009D00;
 Tue, 10 Jun 2025 05:46:27 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id C1C6835A1DC; Tue, 10 Jun 2025 05:46:27 +0200 (CEST)
Date: Tue, 10 Jun 2025 05:46:27 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: semantic conflict  between  the drm-misc tree and
 Linus' tree
Message-ID: <aEeqkw670ZcuDdZO@wunner.de>
References: <20250610124809.1e1ff0cd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610124809.1e1ff0cd@canb.auug.org.au>
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

On Tue, Jun 10, 2025 at 12:48:09PM +1000, Stephen Rothwell wrote:
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/accel/qaic/qaic_ras.c: In function 'decode_ras_msg':
> drivers/accel/qaic/qaic_ras.c:325:17: error: implicit declaration of function 'pci_printk'; did you mean 'pci_intx'? [-Wimplicit-function-declaration]
>   325 |                 pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
>       |                 ^~~~~~~~~~
>       |                 pci_intx
> 
> Caused by commit
> 
>   c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
> 
> interacting with commit
> 
>   1c8a0ed2043c ("PCI: Remove unused pci_printk()")
> 
> from Linus' tree (in v6.16-rc1).
> 
> As a fix up patch would be a bit of a mess, I have used the drm-misc
> tree from next-20250606 for today.

The simplest fix is to use dev_printk() and replace qdev->pdev with
&qdev->pdev->dev.

The PCI core already contains one occurrence of dev_printk() in
drivers/pci/tlp.c (introduced this cycle - 82013ff394ea).

Additionally drivers/pci/aer.c goes so far as to define a custom
aer_printk() for lack of a pci_printk().

drivers/pci/controller/dwc/pcie-tegra194.c contains further
occurrences of dev_printk() which could use pci_printk() instead.

Those occurrences suggest that the removal of pci_printk() was
perhaps uncalled for.

Thanks,

Lukas
