Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197B26F8330
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 14:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3CA10E5E7;
	Fri,  5 May 2023 12:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AD810E5E5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683290641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z85IsE0ddY7p3M41WqHGnCkDNjFd7YAXTIwVs8ItWGI=;
 b=Y84HhMJ6xh9TdvEQV7FKkzPso1GRKJmrxLBqA8zOiBb4jNVPm/q+Anz3F443xzYQNo4SuF
 BFmJOQP71NWyMsVViMm1rrU1JsLHwrEOGY6aKSp2DaiF/0+u7UC0L0AcIIiv+lWu+IALIc
 Giwb6LJBaC6V5qCJV0cmkXzSa694jvI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-O8xwj3xpPamxiMy2PXVE7w-1; Fri, 05 May 2023 08:43:51 -0400
X-MC-Unique: O8xwj3xpPamxiMy2PXVE7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06FA73804513;
 Fri,  5 May 2023 12:43:51 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB7A72166B31;
 Fri,  5 May 2023 12:43:49 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [RFC PATCH 0/4] drm/mgag200: Use DMA to copy the framebuffer to the
 VRAM
Date: Fri,  5 May 2023 14:43:33 +0200
Message-Id: <20230505124337.854845-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This series adds DMA and IRQ for the mgag200 driver.
Unfortunately the DMA doesn't make the driver faster.
But it's still a big improvement regarding CPU usage and latency.

CPU usage goes from 100% of 1 CPU to 3% (using top and refreshing the screen continuously).

top without DMA, and a bash script to refresh the screen continuously
    PID S  %CPU     TIME+ COMMAND
   1536 R 100.0   4:02.78 kworker/1:0+events
   1612 S   3.0   0:03.82 bash
     16 I   0.3   0:01.56 rcu_preempt
   1467 I   0.3   0:00.11 kworker/u64:1-events_unbound
   3650 R   0.3   0:00.02 top

top with DMA, and the same bash script:
    PID S  %CPU     TIME+ COMMAND
   1335 D   3.0   0:01.26 kworker/2:0+events
   1486 S   0.3   0:00.14 bash
   1846 R   0.3   0:00.03 top
      1 S   0.0   0:01.87 systemd
      2 S   0.0   0:00.00 kthreadd

Latency, measured with cyclictest -s -l 10000:
Without DMA:
# /dev/cpu_dma_latency set to 0us
policy: other/other: loadavg: 1.52 0.52 0.33 3/358 2025          
T: 0 ( 1977) P: 0 I:1000 C:  10000 Min:      7 Act:   56 Avg:   85 Max:    2542

With DMA:
# /dev/cpu_dma_latency set to 0us
policy: other/other: loadavg: 1.27 0.48 0.18 2/363 2498          
T: 0 ( 2403) P: 0 I:1000 C:  10000 Min:      8 Act:   62 Avg:   59 Max:     339

Last benchmark is glxgears. It's still software rendering, but on my 2 core CPU,
freeing one CPU constantly doing memcpy(), allows it to draw more frames.
Without DMA:
415 frames in 5.0 seconds = 82.973 FPS
356 frames in 5.0 seconds = 71.167 FPS
with DMA:
717 frames in 5.0 seconds = 143.343 FPS
720 frames in 5.0 seconds = 143.993 FPS

Regarding the implementation:
The driver uses primary DMA to send drawing engine commands, and secondary DMA to send the pixels to an ILOAD command.
You can directly program the ILOAD command, and use Primary DMA to send the pixels, but in this case, you can't use the softrap interrupt to wait for the DMA completion.
The pixels are copied from the gem framebuffer to the DMA buffer, but as system memory is much faster than VRAM, it has a negligible impact.

DMA buffer size:
On my test machine, I can allocate only 4MB of dma coherent memory, and the framebuffer is 5MB.
So the driver has to cut it into small chunks when the full framebuffer is refreshed.
My implementation tries to allocate 4MB, and then smaller allocation until it succeeds.
If it fails to allocate, DMA will be disabled. That's probably not perfect, but at least it's simple.
It's also possible to do some kind of scatter gather DMA, by sending multiple ILOAD/SECDMA, but that increases the complexity a bit.

Adding a module parameter to disable DMA:
I think before merging this work, I will add a module parameter to disable DMA, so that if
something goes wrong it's easy to turn it off.

Pixel width:
I tested this in 16 bits per pixels RGB565 and 32 bits per pixels (XRGB8888).
I didn't find a userspace able to use 24 bits (RGB888), Xorg uses XRGB8888 when specifying
"DefaultDepth" to 24.

Big endian:
The DMA can be configured to handle the be->le conversion, but I can't test it, so it's not done yet.
As I don't know if there are still big endian systems with mgag200, maybe disabling DMA for big endian is the safest option ?

I think the complexity is low, as it only adds ~350 lines, less than 10% of the whole mgag200 driver (~5000 lines).

 drivers/gpu/drm/mgag200/Makefile       |   3 +-
 drivers/gpu/drm/mgag200/mgag200_dma.c  | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c  |  43 +++++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  28 ++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 200 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------
 drivers/gpu/drm/mgag200/mgag200_reg.h  |  30 ++++++++++++++++++-
 6 files changed, 362 insertions(+), 56 deletions(-)

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

base-commit: 457391b0380335d5 (tag: v6.3)


