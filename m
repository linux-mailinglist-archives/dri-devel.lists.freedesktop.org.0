Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FAA16F922
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924FE6E21A;
	Wed, 26 Feb 2020 08:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534646EB46
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 16:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=YKyZV60LHUuQnl24YQ6e7CN9lTy1VXZjsH7/atkgKsQ=; b=lTpmZeZ1NeoF6dscoMg4qMMjFo
 glMYR+C65qyUo9XeiQnzabqMC7yYHKugSV9aEx4q2bfFnZyr60vQTPd8Kf/UhIZHUNcyam1POEBuV
 vc/XzzQPk9KxrdLDFtulgA59QtmYM/nSoKY4M8hCrdgHzDIvGeHtdBbx3djNmAjsMXAJZ/StGa7NN
 irttrCy8WbAwz9vC0ihJM9pKB+D4cUL66aIEflu+R+kwLj/fk2IJFu00pZUU9NXQWT7cfHRG6UqXl
 VI2pdKL1/UdqS7wLaZFULOlPOs3YIA62BCA2etGDwY1DXdGVw//V6KKMAQ/UJkqIljws5M5knWV93
 oUNXOZTA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6d9G-0007zL-Uv; Tue, 25 Feb 2020 16:33:31 +0000
Subject: Re: [PATCH] Initialize ATA before graphics
To: Paul Menzel <pmenzel@molgen.mpg.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 LKML <linux-kernel@vger.kernel.org>
References: <041f4abd-f894-b990-b320-bf0aab4242f2@molgen.mpg.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0da5bb70-2e55-0fa2-d950-3832f9ff7bcd@infradead.org>
Date: Tue, 25 Feb 2020 08:33:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <041f4abd-f894-b990-b320-bf0aab4242f2@molgen.mpg.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: linux-ide@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Arjan van de Ven <arjan@linux.intel.com>, linux-nvme@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,
You should have also Cc-ed Arjan on this email. [done]


On 2/24/20 6:09 AM, Paul Menzel wrote:
> From: Arjan van de Ven <arjan@linux.intel.com>
> Date: Thu, 2 Jun 2016 23:36:32 -0500
> 
> ATA init is the long pole in the boot process, and its asynchronous.
> Move the graphics init after it, so that ATA and graphics initialize
> in parallel.
> 
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
> 
> 1.  Taken from Clear Linux: https://github.com/clearlinux-pkgs/linux/commits/master/0110-Initialize-ata-before-graphics.patch
> 2.  Arjan, can you please add your Signed-off-by line?
> 
>  drivers/Makefile | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/Makefile b/drivers/Makefile
> index aaef17c..d08f3a3 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -58,15 +58,8 @@ obj-y                                += char/
>  # iommu/ comes before gpu as gpu are using iommu controllers
>  obj-y                          += iommu/
>  
> -# gpu/ comes after char for AGP vs DRM startup and after iommu
> -obj-y                          += gpu/
> -
>  obj-$(CONFIG_CONNECTOR)                += connector/
>  
> -# i810fb and intelfb depend on char/agp/
> -obj-$(CONFIG_FB_I810)           += video/fbdev/i810/
> -obj-$(CONFIG_FB_INTEL)          += video/fbdev/intelfb/
> -
>  obj-$(CONFIG_PARPORT)          += parport/
>  obj-$(CONFIG_NVM)              += lightnvm/
>  obj-y                          += base/ block/ misc/ mfd/ nfc/
> @@ -79,6 +72,14 @@ obj-$(CONFIG_IDE)            += ide/
>  obj-y                          += scsi/
>  obj-y                          += nvme/
>  obj-$(CONFIG_ATA)              += ata/
> +
> +# gpu/ comes after char for AGP vs DRM startup and after iommu
> +obj-y                          += gpu/
> +
> +# i810fb and intelfb depend on char/agp/
> +obj-$(CONFIG_FB_I810)           += video/fbdev/i810/
> +obj-$(CONFIG_FB_INTEL)          += video/fbdev/intelfb/
> +
>  obj-$(CONFIG_TARGET_CORE)      += target/
>  obj-$(CONFIG_MTD)              += mtd/
>  obj-$(CONFIG_SPI)              += spi/
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
