Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35703F7D11
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 22:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A1756E419;
	Wed, 25 Aug 2021 20:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85406E419
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 20:17:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CBEA610C8;
 Wed, 25 Aug 2021 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629922625;
 bh=EZPFfQbDto68Ua94olD0+1in8qBix3rwrJyR6OeOm98=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=mF4nzC4H678dwyj3HngroYxVltjkGD/nCkncneWrdKMIJDIh8Kjg4qvsiCGxnyZhB
 WvT+e+w0crgYkYkodXIUVIpr7nTXZe7hGL5eclEyZmiyhYZj/aX0gebgYbuWRO1Y7p
 ck2+gAa6yo7FAnhCVMkhTKyywWXV5XYvAisb+z2d9zDnk+V18r644Nr1Xy/+IX4c4f
 1CbCZPxHcLxYeeZUDq/xLt+ljsx/dvxcrZA/U/OAMyF03SzT0aFz/US/ZJdOKiCUp+
 abnIMWWn7oJqtzQ0BB5nURbeiG6lGO5aFot+jMH95JEaqqN4KHkqCz/uSZz5rpXs8v
 buEpjwic+Qsyg==
Date: Wed, 25 Aug 2021 15:17:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@gmail.com>
Subject: Re: [PATCH V3 0/9] PCI/VGA: Rework default VGA device selection
Message-ID: <20210825201704.GA3600046@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820100832.663931-1-chenhuacai@loongson.cn>
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

On Fri, Aug 20, 2021 at 06:08:23PM +0800, Huacai Chen wrote:
> My original work is at [1].
> 
> Bjorn do some rework and extension in V2. It moves the VGA arbiter to
> the PCI subsystem, fixes a few nits, and breaks a few pieces to make
> the main patch a little smaller.
> 
> V3 rewrite the commit log of the last patch (which is also summarized
> by Bjorn).
> 
> All comments welcome!
> 
> [1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/
> 
> Bjorn Helgaas (4):
>   PCI/VGA: Move vgaarb to drivers/pci
>   PCI/VGA: Replace full MIT license text with SPDX identifier
>   PCI/VGA: Use unsigned format string to print lock counts
>   PCI/VGA: Remove empty vga_arb_device_card_gone()
> 
> Huacai Chen (5):
>   PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
>   PCI/VGA: Prefer vga_default_device()
>   PCI/VGA: Split out vga_arb_update_default_device()
>   PCI/VGA: Log bridge control messages when adding devices
>   PCI/VGA: Rework default VGA device selection
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

I'm open to merging this series but the v5.15 merge window will
probably open on Sunday, and that's too close for a series of this
size.

Moreover, the critical change is still buried in the middle of the
last patch ("PCI/VGA: Rework default VGA device selection").  There's
way too much going on in that single patch.

As I mentioned in [1], I think you can make a 1- or 2-line patch that
will fix your problem, and I think *that's* the first thing we should
do.

That would be a patch against drivers/gpu/vga/vgaarb.c, so it would be
up to the DRM folks to decide whether to take it for v5.15, but at
least it would be small enough to review it easily.

Bjorn

[1] https://lore.kernel.org/r/20210724001043.GA448782@bjorn-Precision-5520
