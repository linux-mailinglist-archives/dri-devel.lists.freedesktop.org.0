Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220635A37C2
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 15:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBAA10ECA4;
	Sat, 27 Aug 2022 13:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CBB10EC98
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661605439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+EoogJmL1LdU4qsxdiA67NtSxsci+Hnk3sRJu9JBGyA=;
 b=NK/m4LBn1bBljjqV4RZrbsOwO2qt3XvtnZ1qgFKH4aub6qy2FyXwAwx/QKHLZPfKk78jEb
 VhReieLQlHgr1/cS2wQcj6hYo0O95w/ybDAbEAgZYnF8S+AxpCtgzgWjQspsjvsAYFSN41
 Pb5Lcz3f4xGfPA1KLG5HyU0YPm2tgo0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-bwYhGl34OsejDyeO-4MToA-1; Sat, 27 Aug 2022 09:03:50 -0400
X-MC-Unique: bwYhGl34OsejDyeO-4MToA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA5F6185A7BA;
 Sat, 27 Aug 2022 13:03:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E20AAC15BB3;
 Sat, 27 Aug 2022 13:03:46 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v3 0/3] Drivers: hv: Avoid allocating MMIO from framebuffer
 region for other passed through PCI devices
Date: Sat, 27 Aug 2022 15:03:42 +0200
Message-Id: <20220827130345.1320254-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 linux-pci@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v2:
- Add Michael's R-b tags to PATCHes1-3 and Bjorn's A-b tag to PATCH1.
- Commit messages tweaks [Michael].

Passed through PCI device sometimes misbehave on Gen1 VMs when Hyper-V
DRM driver is also loaded. Looking at IOMEM assignment, we can see e.g.

$ cat /proc/iomem
...
f8000000-fffbffff : PCI Bus 0000:00
  f8000000-fbffffff : 0000:00:08.0
    f8000000-f8001fff : bb8c4f33-2ba2-4808-9f7f-02f3b4da22fe
...
fe0000000-fffffffff : PCI Bus 0000:00
  fe0000000-fe07fffff : bb8c4f33-2ba2-4808-9f7f-02f3b4da22fe
    fe0000000-fe07fffff : 2ba2:00:02.0
      fe0000000-fe07fffff : mlx4_core

the interesting part is the 'f8000000' region as it is actually the
VM's framebuffer:

$ lspci -v
...
0000:00:08.0 VGA compatible controller: Microsoft Corporation Hyper-V virtual VGA (prog-if 00 [VGA controller])
	Flags: bus master, fast devsel, latency 0, IRQ 11
	Memory at f8000000 (32-bit, non-prefetchable) [size=64M]
...

Recently merged commit a0ab5abced55 ("drm/hyperv : Removing the restruction of
VRAM allocation with PCI bar size") improved the situation as resources,
reserved through vmbus_allocate_mmio() can't be allocated twice:

...
f8000000-fffbffff : PCI Bus 0000:00
  f8000000-fbffffff : 0000:00:08.0
    f8000000-f8001fff : bb8c4f33-2ba2-4808-9f7f-02f3b4da22fe
    f8100000-f88fffff : 5620e0c7-8062-4dce-aeb7-520c7ef76171
...

Always reserve FB region on Gen1 VMs (PATCH2) and make sure we never allocate
anything besides framebuffer from there (PATCH3).

Vitaly Kuznetsov (3):
  PCI: Move PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO
    definitions to pci_ids.h
  Drivers: hv: Always reserve framebuffer region for Gen1 VMs
  Drivers: hv: Never allocate anything besides framebuffer from
    framebuffer memory region

 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  3 -
 drivers/hv/vmbus_drv.c                        | 56 ++++++++++++++-----
 .../net/ethernet/microsoft/mana/gdma_main.c   |  4 --
 drivers/video/fbdev/hyperv_fb.c               |  4 --
 include/linux/pci_ids.h                       |  3 +
 5 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.37.1

