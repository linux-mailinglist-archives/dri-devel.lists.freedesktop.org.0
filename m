Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D513D2F23
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 23:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A506EA61;
	Thu, 22 Jul 2021 21:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDEC6E979
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 21:29:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B40960EB4;
 Thu, 22 Jul 2021 21:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626989370;
 bh=q0q9WK4g/B6cKPYyX/d5wqbHOQimFcJZ61rQEwrqEmI=;
 h=From:To:Cc:Subject:Date:From;
 b=FJKpQYBGDN12sFW2C4PlbNks+qtG5Ax8aF8nsjC4DvKsNzc4LXFxb3RkXIv6MM3pk
 VZAsnFkyJ9Kf3i3x+w6JmNQcvmfUztWCM9SOLgE7KAac9x2YCH/BW6nYsuMl044ZrJ
 gx0h86mZDsDZCWwlHBmNI4zY/gXQloEIyVpThGsIzPsC7jVC9sgdm1B/beZKZnQDXD
 KHxaC4oNxm/k8xq/U6yz0GmgZ8ZMKyHjg1k7pNZy8KxAVnOhQ84JW42fXh8O8i41GW
 FeYg5hZqc2hU78vF1ZShymUVI3/E4xVgdqmz7L/qW1e/+kIZaSXLnLcZ38aPB6i1Un
 ygAox1jAr19Vw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v2 0/9] PCI/VGA: Rework default VGA device selection
Date: Thu, 22 Jul 2021 16:29:11 -0500
Message-Id: <20210722212920.347118-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Xuefeng Li <lixuefeng@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

This is a little bit of rework and extension of Huacai's nice work at [1].

It moves the VGA arbiter to the PCI subsystem, fixes a few nits, and breaks
a few pieces off Huacai's patch to make the main patch a little smaller.

That last patch is still not very small, and it needs a commit log, as I
mentioned at [2].

All comments welcome!

[1] https://lore.kernel.org/dri-devel/20210705100503.1120643-1-chenhuacai@loongson.cn/
[2] https://lore.kernel.org/r/20210720221923.GA43331@bjorn-Precision-5520


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

 drivers/gpu/vga/Kconfig           |  19 ---
 drivers/gpu/vga/Makefile          |   1 -
 drivers/pci/Kconfig               |  19 +++
 drivers/pci/Makefile              |   1 +
 drivers/{gpu/vga => pci}/vgaarb.c | 269 ++++++++++++------------------
 5 files changed, 126 insertions(+), 183 deletions(-)
 rename drivers/{gpu/vga => pci}/vgaarb.c (90%)

-- 
2.25.1

