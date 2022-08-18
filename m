Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B377E5985BD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 16:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507E89260E;
	Thu, 18 Aug 2022 14:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC30D8A6A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660832715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o2twgcO7kyyQ5GRIT1qf5wdXWWnxfVjo4QZ0qXqFFvc=;
 b=hk+avXZDjTGtShaIbectUWlPpkXnBb5cChhGsmZtdW+C6PYoRRcmhmH2DJFfq7Hh1VreRO
 KacSczm+rPM9oxy6l+9TEi367Y4WryBOQE90rWWKoH6L60MUyfEmTJFaArftL+rfY33rYX
 3fFwXoRAMkG48gcgzA0wuo5tmhA32ig=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-592iOU5SO5eYB8KSxfAbbw-1; Thu, 18 Aug 2022 10:25:11 -0400
X-MC-Unique: 592iOU5SO5eYB8KSxfAbbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 144973817A64;
 Thu, 18 Aug 2022 14:25:11 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60A7CC15BB8;
 Thu, 18 Aug 2022 14:25:09 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: linux-hyperv@vger.kernel.org
Subject: [PATCH v1 0/4] Drivers: hv: Avoid allocating MMIO from framebuffer
 region for other passed through PCI devices
Date: Thu, 18 Aug 2022 16:25:04 +0200
Message-Id: <20220818142508.402273-1-vkuznets@redhat.com>
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
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Deepak Rawat <drawat.floss@gmail.com>,
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

Resolve the issue by always reserving FB region on Gen1 VMs (PATCH3) and making
sure we never allocate anything besides framebuffer from there (PATCH4). PATCH1
is a preparatory change, PATCH2 fixes a loosely related issue in Hyper-V DRM
driver.

Vitaly Kuznetsov (4):
  Drivers: hv: Move legacy Hyper-V PCI video device's ids to
    linux/hyperv.h
  drm/hyperv: Don't forget to put PCI device when removing conflicting
    FB fails
  Drivers: hv: Always reserve framebuffer region for Gen1 VMs
  Drivers: hv: Never allocate anything besides framebuffer from
    framebuffer memory region

 drivers/gpu/drm/hyperv/hyperv_drm_drv.c |  5 +--
 drivers/hv/vmbus_drv.c                  | 57 ++++++++++++++++++-------
 drivers/video/fbdev/hyperv_fb.c         |  4 --
 include/linux/hyperv.h                  |  4 ++
 4 files changed, 47 insertions(+), 23 deletions(-)

-- 
2.37.1

