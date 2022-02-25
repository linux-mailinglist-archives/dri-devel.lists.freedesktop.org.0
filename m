Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6DB4C5158
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 23:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BA310EA62;
	Fri, 25 Feb 2022 22:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2489610EA62
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 22:15:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 96372CE27F0;
 Fri, 25 Feb 2022 22:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A876FC340E7;
 Fri, 25 Feb 2022 22:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645827324;
 bh=tk3VRDpANFYB8NRJhQeUoW4hJrY3AMcDY0PFavgHSlM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=GcEMYWBJDy+GrVvgWXw9G6tgkduT4RiIH8V+ghG8kiqsvZ4gRRBqx9oRhgORLK9JL
 UwD+8MuHddaL4r6piLp1I5iDQF8pmPhxfeFFkFMnVPgrq3IvLr4y4ViLUyuwvvx/79
 eJopq66hUBHEs8nno/mlqTNJZ1TlXD/iMbmN2e5MxkW4NmOkU0x5RmtmWrUARpbrv2
 CZbBV9jFd5gIaIhIGmgdII9kByJyeiYCGkBwfremIbecTfz5TBlngGjl4/k91/ExzL
 2DY4rluykLyO6tF0BGSdMisRk2jDyc2UhEljCtOJg4AaVCCBYdAeVyeBm/Rvt14M56
 lJACkQE/x0ASg==
Date: Fri, 25 Feb 2022 16:15:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v9 00/11] vgaarb: Rework default VGA device selection
Message-ID: <20220225221523.GA385757@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224224753.297579-1-helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 04:47:42PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Current default VGA device selection fails in some cases because part of it
> is done in the vga_arb_device_init() subsys_initcall, and some arches
> enumerate PCI devices in pcibios_init(), which runs *after* that.
> 
> The big change from the v8 posting is that this moves vgaarb.c from
> drivers/gpu/vga to drivers/pci because it really has nothing to do with
> GPUs or DRM.

I provisionally applied this to pci/vga and put it into -next just
to get a little runtime on it.

But I'd prefer not to unilaterally yank this out of drivers/gpu
without a consensus from the GPU folks that this is the right thing to
do.

Any thoughts?  If it seems OK to you, I think patch 1/11 (the move
itself) is all you would need to look at, although of course I would
still be grateful for any review and feedback on the rest.

After it's in drivers/pci, all the blame for any issues would come my
way.

Bjorn
