Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BA78D586
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EB010E4FB;
	Wed, 30 Aug 2023 11:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 525 seconds by postgrey-1.36 at gabe;
 Wed, 30 Aug 2023 11:24:31 UTC
Received: from out-251.mta0.migadu.com (out-251.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::fb])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E008A10E4F1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 11:24:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693394142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UVeRm0Qrmz75iUlOftz3q81yqnv4xdH4SnIPvu/ykCw=;
 b=W95kqu/ASc4Qs/CReJBbbTSbzo/SKUxrTDVGenwuNHcHC+YPzK6nTL0dE/FnvhvVGL+EVL
 +o9jXFnzfT8tqzMePgE++xHgB8Eq67I/GHwxgL897XP063iC3VO/n4sPzSqCd3vNip2tnA
 CWEzxYinutWzWIQ+Y/V+XdejXsahLUg=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [-next 0/5] Add the pci_is_vga() helper and use it
Date: Wed, 30 Aug 2023 19:15:27 +0800
Message-Id: <20230830111532.444535-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-pci@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

The PCI code and ID assignment specification defined four types of
display controllers for the display base class(03h), and the devices
with 0x00h sub-class code are VGA devices. VGA devices with programming
interface 0x00 is VGA-compatible, VGA devices with programming interface
0x01 are 8514-compatible controllers. Besides, PCI_CLASS_NOT_DEFINED_VGA
is defined to provide backward compatibility for devices that were built
before the class code field was defined. Thus, PCI(e) device with the
PCI_CLASS_NOT_DEFINED_VGA class code should also be handled as the normal
VGA-compatible devices.

Compared with the "if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)" code,
the newly implemented pci_is_vga() is shorter and straightforward. So it
is more easy to use. It is designed as a inline function, the more common
case "if ((pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA))" is put before the
less common case "if ((pdev->class >> 8) == PCI_CLASS_NOT_DEFINED_VGA)",
so there should no performance penalty.

Sui Jingfeng (5):
  PCI: Add the pci_is_vga() helper
  PCI/VGA: Deal with VGA devices
  PCI/sysfs: Use pci_is_vga() helper
  drm/virgpu: Switch to pci_is_vga()
  drm/qxl: Switch to pci_is_vga()

 drivers/gpu/drm/qxl/qxl_drv.c        | 11 +++--------
 drivers/gpu/drm/virtio/virtgpu_drv.c |  2 +-
 drivers/pci/pci-sysfs.c              |  6 +++---
 drivers/pci/vgaarb.c                 | 19 +++++++++----------
 include/linux/pci.h                  | 27 +++++++++++++++++++++++++++
 5 files changed, 43 insertions(+), 22 deletions(-)


base-commit: 43cc31da9146f9ce60e4a03d96ef0807c2cdac94
-- 
2.34.1

