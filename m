Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF384C38FD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47AED10E8DF;
	Thu, 24 Feb 2022 22:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2290810E8EE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:48:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F42561B76;
 Thu, 24 Feb 2022 22:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05EAC340E9;
 Thu, 24 Feb 2022 22:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645742879;
 bh=7GVjZdt8jWnoINbadQgUAxYf5QWMGlUdkV2jOsP6HN4=;
 h=From:To:Cc:Subject:Date:From;
 b=J3uHZvyyd0e8lJq53oQvw1sHr6upV9/XivUeSEVIkBjDPzDN/imiJfEz3/5PdpqbX
 nzmw7DsxUeyHyVWf2OkQMcNLJRrotyHoFlKpzyv3nZ/zx0nsvFc/tR4Ylm8WdGqEyR
 u6ztZO7HYMU3dw905FdN1cfM+BxuyHMyTgZn04bAXm1V8Ob+mXd5t35BjcL8wRW3qY
 0AwpZWYaRHH208L3DGYwk9IJ/hQpJs5ks3KDvofMwsqlPcVvzuGZKJL6VCo+ZPDKsI
 idAY/AzV7nDP3hvXKuya9hYhCqgtE7oQ+dUJRrLh6O5cnyKcguA2HRtCawvGKikH7m
 4en7+JBFp4hag==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 00/11] vgaarb: Rework default VGA device selection
Date: Thu, 24 Feb 2022 16:47:42 -0600
Message-Id: <20220224224753.297579-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Current default VGA device selection fails in some cases because part of it
is done in the vga_arb_device_init() subsys_initcall, and some arches
enumerate PCI devices in pcibios_init(), which runs *after* that.

The big change from the v8 posting is that this moves vgaarb.c from
drivers/gpu/vga to drivers/pci because it really has nothing to do with
GPUs or DRM.

For example:

  - On BMC system, the AST2500 bridge [1a03:1150] does not implement
    PCI_BRIDGE_CTL_VGA.  This is perfectly legal but means the legacy VGA
    resources won't reach downstream devices unless they're included in the
    usual bridge windows.

  - vga_arb_select_default_device() will set a device below such a bridge
    as the default VGA device as long as it has PCI_COMMAND_IO and
    PCI_COMMAND_MEMORY enabled.

  - vga_arbiter_add_pci_device() is called for every VGA device, either at
    boot-time or at hot-add time, and it will also set the device as the
    default VGA device, but ONLY if all bridges leading to it implement
    PCI_BRIDGE_CTL_VGA.

  - This difference between vga_arb_select_default_device() and
    vga_arbiter_add_pci_device() means that a device below an AST2500 or
    similar bridge can only be set as the default if it is enumerated
    before vga_arb_device_init().

  - On ACPI-based systems, PCI devices are enumerated by acpi_init(), which
    runs before vga_arb_device_init().

  - On non-ACPI systems, like on MIPS system, they are enumerated by
    pcibios_init(), which typically runs *after* vga_arb_device_init().

This series consolidates all the default VGA device selection in
vga_arbiter_add_pci_device(), which is always called after enumerating a
PCI device.

Almost all the work here is Huacai's.  I restructured it a little bit and
added a few trivial patches on top.

Bjorn

Version history:
V0 original implementation as final quirk to set default device.
https://lore.kernel.org/r/20210514080025.1828197-6-chenhuacai@loongson.cn

V1 rework vgaarb to do all default device selection in
vga_arbiter_add_pci_device().
https://lore.kernel.org/r/20210705100503.1120643-1-chenhuacai@loongson.cn

V2 move arbiter to PCI subsystem, fix nits.
https://lore.kernel.org/r/20210722212920.347118-1-helgaas@kernel.org

V3 rewrite the commit log of the last patch (which is also summarized
by Bjorn).
https://lore.kernel.org/r/20210820100832.663931-1-chenhuacai@loongson.cn

V4 split the last patch to two steps.
https://lore.kernel.org/r/20210827083129.2781420-1-chenhuacai@loongson.cn

V5 split Patch-9 again and sort the patches.
https://lore.kernel.org/r/20210911093056.1555274-1-chenhuacai@loongson.cn

V6 split Patch-5 again and sort the patches again.
https://lore.kernel.org/r/20210916082941.3421838-1-chenhuacai@loongson.cn

V7 stop moving vgaarb to drivers/pci because of ordering issues with
misc_init().
https://lore.kernel.org/r/20211015061512.2941859-1-chenhuacai@loongson.cn
https://lore.kernel.org/r/CAAhV-H7FhAjM-Ha42Z1dLrE4PvC9frfyeU27KHWcyWKkMftEsA@mail.gmail.com

V8 expand commit logs, rework boot VGA device selection
https://lore.kernel.org/r/20220106000658.243509-1-helgaas@kernel.org

V9 (this posting) move to drivers/pci, resolve initcall ordering, rename
vga_is_framebuffer_device() to vga_is_firmware_default()

Bjorn Helgaas (5):
  PCI/VGA: Move vgaarb to drivers/pci
  PCI/VGA: Factor out vga_select_framebuffer_device()
  PCI/VGA: Remove empty vga_arb_device_card_gone()
  PCI/VGA: Use unsigned format string to print lock counts
  PCI/VGA: Replace full MIT license text with SPDX identifier

Huacai Chen (6):
  PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
  PCI/VGA: Factor out default VGA device selection
  PCI/VGA: Move firmware default device detection to ADD_DEVICE path
  PCI/VGA: Move non-legacy VGA detection to ADD_DEVICE path
  PCI/VGA: Move disabled VGA device detection to ADD_DEVICE path
  PCI/VGA: Log bridge control messages when adding devices

 drivers/gpu/vga/Kconfig           |  19 --
 drivers/gpu/vga/Makefile          |   1 -
 drivers/pci/Kconfig               |  19 ++
 drivers/pci/Makefile              |   1 +
 drivers/{gpu/vga => pci}/vgaarb.c | 313 +++++++++++++++---------------
 5 files changed, 175 insertions(+), 178 deletions(-)
 rename drivers/{gpu/vga => pci}/vgaarb.c (90%)

-- 
2.25.1

