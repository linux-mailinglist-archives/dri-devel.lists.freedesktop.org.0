Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D41E3A1C
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1607A6E28B;
	Wed, 27 May 2020 07:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD15E89CBA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 10:59:26 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id w20so4902077pga.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 03:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Ou0qlu1mCa7PnwmjPJaB3DW9DwrRU3q8YGJo9GcDus=;
 b=K3VhsR5LEfuu1zhCWSX8ZDiZ3ZxIlG7BA/03u2JIL4mG0pKb21JzuhyouVbtkkWOxd
 zJS6OCY+FQ6P+e3aeiFTRfUQmzH3/gsnFD50DgO5tGr1qoja2y1HvgRC2Pw7TqGI63LP
 4TJzSsDw/kvWPaVNrvmgbUvep6sybaicYksX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Ou0qlu1mCa7PnwmjPJaB3DW9DwrRU3q8YGJo9GcDus=;
 b=GokLXFW4Tg0zbgZXsjZlE/OExG96qenwVYd1meUXGh6Kv0rkC/oVZsiSyivUqatGy1
 sN/GC+5lvs2w6N7sv56BduAXw1HYPjqRzPbPT/cOgOThjspfbbCYR09c43Eq2tTLSWCK
 ru/JqHYUjG33UTYYmaSSFlZM7xuika/InikW5Avizkm4gLFjcA3eCJ6uUnO0BRyUs4r/
 UeEzicelf/y3d4oeix1dHr/UjRaO3QJkeaV4C4QFcj1P1vMEpLU+Y6MkU3w5q1LZvz/n
 JxnSLY5bWMeCblDKkk27DEBpxnMH0wW9FvpAyschKSwJShQzvyYyM5AR7MOnYKCMCfd4
 cgAw==
X-Gm-Message-State: AOAM531dskHJLKFEpLnwmwqny40uuQAiKBy7A9uhEHY/q49sFFPhjJek
 81y2AW3r2R7cgRHABu4ydotNPw==
X-Google-Smtp-Source: ABdhPJxwt+9IRBaAm+bRoOfanDBMpGRNfprsaYldgxiuYvSUYxg+AZzdBZXgODn2wqRHGF504ZOpYQ==
X-Received: by 2002:a63:2246:: with SMTP id t6mr502754pgm.211.1590490766229;
 Tue, 26 May 2020 03:59:26 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id x13sm14637864pjr.20.2020.05.26.03.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2020 03:59:25 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v4 0/3] Support virtio cross-device resources
Date: Tue, 26 May 2020 19:58:08 +0900
Message-Id: <20200526105811.30784-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 May 2020 07:15:42 +0000
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
Cc: virtio-dev@lists.oasis-open.org, dri-devel@lists.freedesktop.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, David Stevens <stevensd@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset implements the current proposal for virtio cross-device
resource sharing [1]. It will be used to import virtio resources into
the virtio-video driver currently under discussion [2]. The patch
under consideration to add support in the virtio-video driver is [3].
It uses the APIs from v3 of this series, but the changes to update it
are relatively minor.

This patchset adds a new flavor of dma-bufs that supports querying the
underlying virtio object UUID, as well as adding support for exporting
resources from virtgpu.

[1] https://markmail.org/thread/2ypjt5cfeu3m6lxu
[2] https://markmail.org/thread/p5d3k566srtdtute
[3] https://markmail.org/thread/j4xlqaaim266qpks

v3 -> v4 changes:
 - Replace dma-buf hooks with virtio dma-buf from v1.
 - Remove virtio_attach callback, as the work that had been done
   in that callback is now done on dma-buf export. The documented
   requirement that get_uuid only be called on attached virtio
   dma-bufs is also removed.
 - Rebase and add call to virtio_gpu_notify for ASSIGN_UUID.

David Stevens (3):
  virtio: add dma-buf support for exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 98 +++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
 drivers/virtio/Makefile                |  2 +-
 drivers/virtio/virtio.c                |  6 ++
 drivers/virtio/virtio_dma_buf.c        | 91 ++++++++++++++++++++++++
 include/linux/virtio.h                 |  1 +
 include/linux/virtio_dma_buf.h         | 58 +++++++++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++
 11 files changed, 353 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

-- 
2.27.0.rc0.183.gde8f92d652-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
