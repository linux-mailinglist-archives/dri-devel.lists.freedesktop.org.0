Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB294717BAF
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D569110E49B;
	Wed, 31 May 2023 09:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0490310E499
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685524877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Lro3sfJCykdHlU3fwxB0TBWEj9F22/3kc3fePWbSoVM=;
 b=azucY9glXF7yE+2bAo3OePkdQG6fNm9vq7DgV1UpTdWorsLlKcf9JoWQwxDF1QRr0Kl7+I
 tty3ND37iGk8irXUF9wcArDolSLR0nO2xMZN1DU0cXt9HIMzUdV1xGQnBjtY7+dkTKx/ZB
 6GudHMF6nhiUgxvmSkVWanapHJWZNsg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-TsMuqh8BMum0bY14anqq2A-1; Wed, 31 May 2023 05:21:16 -0400
X-MC-Unique: TsMuqh8BMum0bY14anqq2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DEAD185A792;
 Wed, 31 May 2023 09:21:16 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBFE248205E;
 Wed, 31 May 2023 09:21:14 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 javierm@redhat.com, lyude@redhat.com
Subject: [RFC PATCH v2 0/4] drm/mgag200: Use DMA to copy the framebuffer to
 the VRAM
Date: Wed, 31 May 2023 11:21:06 +0200
Message-Id: <20230531092110.140564-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
On my test machine (x86_64), I can't allocate more than 4MB of DMA coherent memory, and the framebuffer is 5MB.
So the driver has to cut it into small chunks when the full framebuffer is refreshed.
My implementation tries to allocate 4MB, and then smaller allocation until it succeeds.
The DMA GEM framework tries to allocate the whole framebuffer at once, so it fails for resolutions higher than 1024x768x32.
So I stick with SHMEM, and that extra memcpy.

Pixel width:
I tested this in 16 bits per pixels RGB565 and 32 bits per pixels (XRGB8888).
I didn't find a userspace able to use 24 bits (RGB888), Xorg uses XRGB8888 when specifying
"DefaultDepth" to 24.

I think the added complexity is low, as it only adds ~400 lines, less than 10% of the whole mgag200 driver (~5000 lines).

 drivers/gpu/drm/mgag200/Makefile          |   3 +-
 drivers/gpu/drm/mgag200/mgag200_dma.c     | 237 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c     |  40 +++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h     |  29 +++++
 drivers/gpu/drm/mgag200/mgag200_g200.c    |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  |   4 +
 drivers/gpu/drm/mgag200/mgag200_mode.c    |  84 ++++----------
 drivers/gpu/drm/mgag200/mgag200_reg.h     |  30 ++++-
 14 files changed, 393 insertions(+), 62 deletions(-)

v2:
 - Better explain scale and offset simplifications.
 - Move all damage handling to mgag200_dma.c
 - Move all dma-related variables to struct mga_dma.
 - Remove the fallback, DMA should always work.
 - Fix the warning reported by the kernel test bot.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>


