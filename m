Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18C5A37C0
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 15:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD63510ECA3;
	Sat, 27 Aug 2022 13:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAA510ECA4
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Aug 2022 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661605442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eV+kdRpxYTUz3PfFvKpoINWKQ5Uenu3n1CiGeqxS4ok=;
 b=SiIrXIe9wbmWuUc4Ci61CqGzgimDIM/F2yKPG/naDa6/eNN0/DQLsUZKU/2pB2QV+xd1y7
 m+HHaU8AKlJ/HIsKr/I3y+O1bF3h2hmIJi9JfMwkmhkfOAey5pVH6YxWrcZRsJyPgr3kbI
 AOMiZR7FpJ8MXCt3F6fDtXIDGBkW8fY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-3ZFmWPFVMgmoSyaA1dHEsw-1; Sat, 27 Aug 2022 09:03:58 -0400
X-MC-Unique: 3ZFmWPFVMgmoSyaA1dHEsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B84A101A56D;
 Sat, 27 Aug 2022 13:03:58 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C75BDC15BB3;
 Sat, 27 Aug 2022 13:03:55 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v3 3/3] Drivers: hv: Never allocate anything besides
 framebuffer from framebuffer memory region
Date: Sat, 27 Aug 2022 15:03:45 +0200
Message-Id: <20220827130345.1320254-4-vkuznets@redhat.com>
In-Reply-To: <20220827130345.1320254-1-vkuznets@redhat.com>
References: <20220827130345.1320254-1-vkuznets@redhat.com>
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

 hv_vmbus: registering driver hyperv_drm
 hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] Synthvid Version major 3, minor 5
 hyperv_drm 0000:00:08.0: vgaarb: deactivate vga console
 hyperv_drm 0000:00:08.0: BAR 0: can't reserve [mem 0xf8000000-0xfbffffff]
 hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] Cannot request framebuffer, boot fb still active?

Note: "Cannot request framebuffer" is not a fatal error in
hyperv_setup_gen1() as the code assumes there's some other framebuffer
device there but we actually have some other PCI device (mlx4 in this
case) config space there!

The problem appears to be that vmbus_allocate_mmio() can use dedicated
framebuffer region to serve any MMIO request from any device. The
semantics one might assume of a parameter named "fb_overlap_ok"
aren't implemented because !fb_overlap_ok essentially has no effect.
The existing semantics are really "prefer_fb_overlap". This patch
implements the expected and needed semantics, which is to not allocate
from the frame buffer space when !fb_overlap_ok.

Note, Gen2 VMs are usually unaffected by the issue because
framebuffer region is already taken by EFI fb (in case kernel supports
it) but Gen1 VMs may have this region unclaimed by the time Hyper-V PCI
pass-through driver tries allocating MMIO space if Hyper-V DRM/FB drivers
load after it. Devices can be brought up in any sequence so let's
resolve the issue by always ignoring 'fb_mmio' region for non-FB
requests, even if the region is unclaimed.

Reviewed-by: Michael Kelley <mikelley@microsoft.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 drivers/hv/vmbus_drv.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 536f68e563c6..3c833ea60db6 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2331,7 +2331,7 @@ int vmbus_allocate_mmio(struct resource **new, struct hv_device *device_obj,
 			bool fb_overlap_ok)
 {
 	struct resource *iter, *shadow;
-	resource_size_t range_min, range_max, start;
+	resource_size_t range_min, range_max, start, end;
 	const char *dev_n = dev_name(&device_obj->device);
 	int retval;
 
@@ -2366,6 +2366,14 @@ int vmbus_allocate_mmio(struct resource **new, struct hv_device *device_obj,
 		range_max = iter->end;
 		start = (range_min + align - 1) & ~(align - 1);
 		for (; start + size - 1 <= range_max; start += align) {
+			end = start + size - 1;
+
+			/* Skip the whole fb_mmio region if not fb_overlap_ok */
+			if (!fb_overlap_ok && fb_mmio &&
+			    (((start >= fb_mmio->start) && (start <= fb_mmio->end)) ||
+			     ((end >= fb_mmio->start) && (end <= fb_mmio->end))))
+				continue;
+
 			shadow = __request_region(iter, start, size, NULL,
 						  IORESOURCE_BUSY);
 			if (!shadow)
-- 
2.37.1

