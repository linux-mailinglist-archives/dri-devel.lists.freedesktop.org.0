Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920873F2FFF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6CF6EAB7;
	Fri, 20 Aug 2021 15:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEA36EA54
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 10:08:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D0E0610F9;
 Fri, 20 Aug 2021 10:08:46 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V3 0/9] PCI/VGA: Rework default VGA device selection
Date: Fri, 20 Aug 2021 18:08:23 +0800
Message-Id: <20210820100832.663931-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 15:47:16 +0000
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

Bjorn do some rework and extension in V2. It moves the VGA arbiter to
the PCI subsystem, fixes a few nits, and breaks a few pieces to make
the main patch a little smaller.

V3 rewrite the commit log of the last patch (which is also summarized
by Bjorn).

All comments welcome!

[1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/

Bjorn Helgaas (4):
  PCI/VGA: Move vgaarb to drivers/pci
  PCI/VGA: Replace full MIT license text with SPDX identifier
  PCI/VGA: Use unsigned format string to print lock counts
  PCI/VGA: Remove empty vga_arb_device_card_gone()

Huacai Chen (5):
  PCI/VGA: Move vga_arb_integrated_gpu() earlier in file
  PCI/VGA: Prefer vga_default_device()
  PCI/VGA: Split out vga_arb_update_default_device()
  PCI/VGA: Log bridge control messages when adding devices
  PCI/VGA: Rework default VGA device selection

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

