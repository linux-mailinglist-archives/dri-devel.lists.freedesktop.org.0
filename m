Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D763D2F45
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 23:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DC96E97D;
	Thu, 22 Jul 2021 21:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D647B6E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 21:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=cqz9dZ4QLPxSn0JRt9eoqOLqstyCwONQpjDJJM2IK7g=; b=WxUAqH3G6MItpcb9wkt2/UBvxY
 Ns7Iux9KJGGf4mDkQ/nCQIjR3v2HjQUBpIaMIf5uTcoGxcXQBbKlty2GvTCpTz8vUjcEd4zSFmdzX
 Esd6WuImOXalk0p9njzgzac+JnswgRe/mZ2KBm0A9GhFXHaJSQRljMm7L+ZCblTgOzc6wH5HJZVoV
 coc6oG3VVvhSPrsiK685WvF3Pz/P3ktn3iOVQgR/bUH6PCJX+x+8LBJKNPFNirvZ536vKggLrwmVA
 p1ZhS4rR4n/13f1mOAe8u/fRcsZ7talwFTs6dGsNc0Y4rZQbwktWs07MjTjfXBaa3cEzJM/wD4RDv
 sED4myRQ==;
Received: from [2601:1c0:6280:3f0:7629:afff:fe72:e49d]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6gP0-002ovH-Bs; Thu, 22 Jul 2021 21:38:46 +0000
Subject: Re: [PATCH v2 1/9] PCI/VGA: Move vgaarb to drivers/pci
To: Bjorn Helgaas <helgaas@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
References: <20210722212920.347118-1-helgaas@kernel.org>
 <20210722212920.347118-2-helgaas@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7ae9d6b3-dce4-82f8-a315-56a0ecf657c0@infradead.org>
Date: Thu, 22 Jul 2021 14:38:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722212920.347118-2-helgaas@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/22/21 2:29 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> The VGA arbiter is really PCI-specific and doesn't depend on any GPU
> things.  Move it to the PCI subsystem.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/gpu/vga/Kconfig           | 19 -------------------
>  drivers/gpu/vga/Makefile          |  1 -
>  drivers/pci/Kconfig               | 19 +++++++++++++++++++
>  drivers/pci/Makefile              |  1 +
>  drivers/{gpu/vga => pci}/vgaarb.c |  0
>  5 files changed, 20 insertions(+), 20 deletions(-)
>  rename drivers/{gpu/vga => pci}/vgaarb.c (100%)
> 

> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 0c473d75e625..7c9e56d7b857 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -252,6 +252,25 @@ config PCIE_BUS_PEER2PEER
>  
>  endchoice
>  
> +config VGA_ARB
> +	bool "VGA Arbitration" if EXPERT
> +	default y
> +	depends on (PCI && !S390)

You can drop the PCI part above.

> +	help
> +	  Some "legacy" VGA devices implemented on PCI typically have the same
> +	  hard-decoded addresses as they did on ISA. When multiple PCI devices
> +	  are accessed at same time they need some kind of coordination. Please
> +	  see Documentation/gpu/vgaarbiter.rst for more details. Select this to

Move that Doc file also...

> +	  enable VGA arbiter.
> +


-- 
~Randy

