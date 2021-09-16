Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F17240D485
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975AC6EADA;
	Thu, 16 Sep 2021 08:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D836EADA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:30:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C25A16113E;
 Thu, 16 Sep 2021 08:30:44 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V6 00/12] PCI/VGA: Rework default VGA device selection
Date: Thu, 16 Sep 2021 16:29:29 +0800
Message-Id: <20210916082941.3421838-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

My original work is at [1].

Current default VGA device selection fails in some cases:

  - On BMC system, the AST2500 bridge [1a03:1150] does not implement
    PCI_BRIDGE_CTL_VGA [1].  This is perfectly legal but means the
    legacy VGA resources won't reach downstream devices unless they're
    included in the usual bridge windows.

  - vga_arb_select_default_device() will set a device below such a
    bridge as the default VGA device as long as it has PCI_COMMAND_IO
    and PCI_COMMAND_MEMORY enabled.

  - vga_arbiter_add_pci_device() is called for every VGA device,
    either at boot-time or at hot-add time, and it will also set the
    device as the default VGA device, but ONLY if all bridges leading
    to it implement PCI_BRIDGE_CTL_VGA.

  - This difference between vga_arb_select_default_device() and
    vga_arbiter_add_pci_device() means that a device below an AST2500
    or similar bridge can only be set as the default if it is
    enumerated before vga_arb_device_init().

  - On ACPI-based systems, PCI devices are enumerated by acpi_init(),
    which runs before vga_arb_device_init().

  - On non-ACPI systems, like on MIPS system, they are enumerated by
    pcibios_init(), which typically runs *after*
    vga_arb_device_init().

So I made vga_arb_update_default_device() to replace the current vga_
arb_select_default_device(), which will be call from vga_arbiter_add_
pci_device(), set the default device even if it does not own the VGA
resources because an upstream bridge doesn't implement PCI_BRIDGE_CTL_
VGA. And the default VGA device is updated if a better one is found
(device with legacy resources enabled is better, device owns the
firmware framebuffer is even better).

Bjorn do some rework and extension in V2. It moves the VGA arbiter to
the PCI subsystem, fixes a few nits, and breaks a few pieces to make
the main patch a little smaller.

V3 rewrite the commit log of the last patch (which is also summarized
by Bjorn).

V4 split the last patch to two steps.

V5 split Patch-9 again and sort the patches.

V5 split Patch-5 again and sort the patches again.

All comments welcome!

[1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/

Huacai Chen (8):
  PCI/VGA: Prefer vga_default_device()
  PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
  PCI/VGA: Split out vga_arb_update_default_device()
  PCI/VGA: Prefer VGA device with legacy I/O enabled
  PCI/VGA: Prefer VGA device belongs to integrated GPU
  PCI/VGA: Prefer VGA device owns the firmware framebuffer
  PCI/VGA: Remove vga_arb_select_default_device()
  PCI/VGA: Log bridge control messages when adding devices

Bjorn Helgaas (4):
  PCI/VGA: Remove empty vga_arb_device_card_gone()
  PCI/VGA: Use unsigned format string to print lock counts
  PCI/VGA: Replace full MIT license text with SPDX identifier
  PCI/VGA: Move vgaarb to drivers/pci

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com> 
---
 drivers/gpu/vga/Kconfig           |  19 ---
 drivers/gpu/vga/Makefile          |   1 -
 drivers/pci/Kconfig               |  19 +++
 drivers/pci/Makefile              |   1 +
 drivers/{gpu/vga => pci}/vgaarb.c | 269 ++++++++++++------------------
 5 files changed, 126 insertions(+), 183 deletions(-)
 rename drivers/{gpu/vga => pci}/vgaarb.c (90%)
--
2.27.0

