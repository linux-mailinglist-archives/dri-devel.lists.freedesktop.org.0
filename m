Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D3C3D5CB
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 21:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6382989798;
	Thu,  6 Nov 2025 20:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="br2jkCpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C4589798;
 Thu,  6 Nov 2025 20:32:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B8D6440772;
 Thu,  6 Nov 2025 20:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C3DC113D0;
 Thu,  6 Nov 2025 20:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762461126;
 bh=ru1GhP+q0Wpwu435I6x2PEDaBttoa2Fc8XVDF4pZDGw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=br2jkCpVobbIq7GQy2orrEc9TtqqtCK5bbitkvMFd4+oqz0QNh4ovJ7Sa3ofK6qHd
 Pl8c6l6RRkrb1mwAtU+Ph36smLv2eYvu+O6rNtMNY28Lu6BsRAhnIRti3KWl6gmOTW
 WoJe+xrHek+02api/pPyMLcgLV/GJECmoREuWmp6RTBgwdsyEQ4vtDMd2ZW/g22zXx
 W+bvvIFGhkD+P66dgH99PL7T8sq6sfvQhQKRoW8L08qFHACuRPkBP8Yg67NIYO47xY
 jlLd9rmSGOhLh9N+fmcjb4xn+gpNgto28lffRp+Vx2ukE41BlD2M7C40UAKVfdeX6B
 jYjZYcv02zhQg==
Date: Thu, 6 Nov 2025 14:32:05 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: dri-devel@lists.freedesktop.org,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 linux-pci@vger.kernel.org, Alex Williamson <alex@shazbot.org>
Subject: Re: Unreachable cards in vgaarb
Message-ID: <20251106203205.GA1967804@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9594cc3-031b-43cc-9268-85c32f98ba49@hogyros.de>
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

[+cc Alex]

On Thu, Nov 06, 2025 at 12:16:24PM +0900, Simon Richter wrote:
> Hi,
> 
> I have a card whose VGA registers are not actually reachable, for multiple
> reasons:
> 
> 1. the system in question has multiple PCI domains
> 2. the system in question does not support IO access
> 3. one of the bridges involved does not support VGA register forwarding
> 
> Obviously, the "works for me" solution would be to teach vgaarb to check if
> the VGA bit actually got set in the bridge control register (because
> apparently, that is how a bridge indicates missing support), and return an
> error. I plan to do that, but that doesn't solve the others.
> 
> The specific actual problem I'm trying to solve here is that there is a
> workaround in the i915 and xe drivers that pokes the VGA register space on
> the same card after changing power states, and this falls over on my system.
> Skipping this is safe if we can guarantee that vgacon will not generate
> accesses later, so I think having vgaarb recognize that the card is
> unreachable and returning an error is sufficient here.
> 
> I have no idea whether this will break other systems though -- can we
> reasonably assume that any PCI or PCIe bridge that is capable of forwarding
> VGA accesses will proudly display the VGA bit set in the bridge control
> register, or is a quirk needed here?

I think we can assume that a bridge with PCI_BRIDGE_CTL_VGA set
forwards VGA accesses, and bridges without it do not.

> For multiple PCI domains, I have no clue how to determine where accesses end
> up. My feeling is that it's supposed to be "all of them, mediated by VGA
> bits on root bridges", but I don't know if this is actually true. Is anyone
> actually building machines with a CPU architecture that has a separate IO
> range, and multiple PCI domains?

Multiple PCI domains were supported on ia64, and I think multiple VGA
devices were also supported, but I don't remember the details about
how.  That code has all been removed but should still be in the git
history.

> For "no IO access", it is even more complex -- it appears that the approach
> on POWER is to define inb/outb as MMIO, offset from a global variable that
> points at a PCI range, which means this access will only show up in one of
> the PCI(e) controllers.
> 
> What is unclear to me is
> 
> 1. whether there is supposed to be a mechanism to generate IO accesses from
> those,
> 2. whether this range should be excluded from MMIO to not accidentally
> create conflicts
> 3. whether vgaarb needs to adjust this variable too
> 4. if this variable should instead be maintained by vgaarb
> 5. if we should have dedicated vga_inb/vga_outb macros or if we can assume
> that any inb/outb on machines that don't have an IO range will be VGA
> accesses anyway
> 6. whether it is interesting to create special handling for cards that have
> VGA registers at the beginning of their non-prefetchable MMIO range (AFAIK,
> some Intel cards do, and you can address them either via IO or via MMIO to
> their non-prefetchable mapping).
> 7. whether this affects more than two users.
> 
>    Simon
