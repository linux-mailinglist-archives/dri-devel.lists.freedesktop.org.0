Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B76405C71
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 19:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1399F6E8E5;
	Thu,  9 Sep 2021 17:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96206E8E5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 17:59:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EF7A610C9;
 Thu,  9 Sep 2021 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631210368;
 bh=z5NEhjl9X/SyJ7TcBA8H1Fve7MQ1AuH2oEo/amGgEF8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ajZ/F7Y5hzcmqXQSLIME18FNxoRIUKycBKutHEBP+uQB9dMUvC0w+h3vOToVfXXBJ
 dBJfstZmGUvJfNF61ZxcPJ2th9Ee9gLLWD/pu56W6bICfjuFgKa0MrfBRjl9D6ZiBk
 8QCuqdyzCjzsjVuLgWGqSnROJkbYYPNSl6ve5VnTzEKd2t8JMvmcP2ZOeYfA0olc71
 23rkNb3R1FF/io8sgxFGeAtbdSjD49S4wmpTm14gt3MsNOCd+9U82+WTEXGArBh+BN
 tcl5dzbjWxqBj9VxV+PZqzJz6PuQX6cAETxSQjzRkA8zJ6WRjA46twBUktn4Fpibb/
 McBH37K3pQxTA==
Date: Thu, 9 Sep 2021 12:59:26 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH V4 00/10] PCI/VGA: Rework default VGA device selection
Message-ID: <20210909175926.GA996660@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827083129.2781420-1-chenhuacai@loongson.cn>
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

On Fri, Aug 27, 2021 at 04:31:19PM +0800, Huacai Chen wrote:
> My original work is at [1].
> 
> Bjorn do some rework and extension in V2. It moves the VGA arbiter to
> the PCI subsystem, fixes a few nits, and breaks a few pieces to make
> the main patch a little smaller.
> 
> V3 rewrite the commit log of the last patch (which is also summarized
> by Bjorn).
> 
> V4 split the last patch to two steps.
> 
> All comments welcome!

I'm hoping to apply something like this for v5.16.

BUT as I mentioned in [2], I want the very first patch to be the very
simple 2-line change to vga_arb_update_default_device() that actually
fixes your problem.

It makes no sense for that change to be at the very end, hidden in the
middle of a bigger restructuring patch.

[2] https://lore.kernel.org/r/20210825201704.GA3600046@bjorn-Precision-5520

> [1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/
> 
> Bjorn Helgaas (4):
>   PCI/VGA: Move vgaarb to drivers/pci
>   PCI/VGA: Replace full MIT license text with SPDX identifier
>   PCI/VGA: Use unsigned format string to print lock counts
>   PCI/VGA: Remove empty vga_arb_device_card_gone()
> 
> Huacai Chen (6):
>   PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
>   PCI/VGA: Prefer vga_default_device()
>   PCI/VGA: Split out vga_arb_update_default_device()
>   PCI/VGA: Log bridge control messages when adding devices
>   PCI/VGA: Rework default VGA device selection (Step 1)
>   PCI/VGA: Rework default VGA device selection (Step 2)
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com> 
> ---
>  drivers/gpu/vga/Kconfig           |  19 ---
>  drivers/gpu/vga/Makefile          |   1 -
>  drivers/pci/Kconfig               |  19 +++
>  drivers/pci/Makefile              |   1 +
>  drivers/{gpu/vga => pci}/vgaarb.c | 269 ++++++++++++------------------
>  5 files changed, 126 insertions(+), 183 deletions(-)
>  rename drivers/{gpu/vga => pci}/vgaarb.c (90%)
> --
> 2.27.0
> 
