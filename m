Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643091F34F7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB596E293;
	Tue,  9 Jun 2020 07:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1CC6E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 01:25:47 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id q24so643731pjd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 18:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=COw8MsymzwRUQaCcvby30uu+ORzSh+2s4CK8yqEnGk0=;
 b=m4U6w8Hj6efLuU2XJFCP8IPM+30vKQRX8BKy4OU/D+DUTmyH9XKbfEELFpSz42f7a/
 a3V6e3lrKLFyYc13GVhfa4CdVD7sYJf2xvK5y5RWC823y9VUiUO/9hdCrABpETL9VLNp
 ypI6smgxA7gnRqgf3Gf8k99kM728ZEUHZIKPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=COw8MsymzwRUQaCcvby30uu+ORzSh+2s4CK8yqEnGk0=;
 b=o5hNQDCCPvdkxCYXRBzFa0UbCYFoYXgl5km/UwyTFro8jKu6otyosCAnrvTTI7/zI5
 oy/OUj1XMREhGeJo8xuGwbwlPcisyhclTblvbQTNWub3RKc5nZeIXRwbpCC7w0HE+Zu+
 DWAcuT38cUttNfouEqtIOvKjyA/IfHuI37TTU5vqcmUdOpY+dyujX7UanXusgF+kJMxY
 cmzo89OH/hlu6dgt5nHsoJuHKsA1f5NCyRg3JYxMGMxNSU6vHrWbnjjQB+HGVwaxtbw6
 4KF6rPbc4yqCq/YvnKutnnbJrAUIEnhKLR1Jhacom6OwD4mpMjXmwUHIrHN8wp6uKRUh
 a1Ag==
X-Gm-Message-State: AOAM530ZhvI5rRTPEISQE0HB4TYl8INrjturDJrgcXlxaEL5D5uebUkn
 fPBoveAL52coM/MmoK5NstgYAw==
X-Google-Smtp-Source: ABdhPJxxp3CZRZ++LaDq5ouPDTw2c1q5JXibsFXECAvthEk/ewMP/5LQ+XhXru1zBYVm40/rZfIFZw==
X-Received: by 2002:a17:902:9043:: with SMTP id
 w3mr1170254plz.250.1591665946907; 
 Mon, 08 Jun 2020 18:25:46 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id z23sm6716617pga.86.2020.06.08.18.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 18:25:46 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v5 0/3] Support virtio cross-device resources
Date: Tue,  9 Jun 2020 10:25:15 +0900
Message-Id: <20200609012518.198908-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-media@vger.kernel.org
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

v4 -> v5 changes:
 - Remove virtio_dma_buf_export_info.

David Stevens (3):
  virtio: add dma-buf support for exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 20 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
 drivers/virtio/Makefile                |  2 +-
 drivers/virtio/virtio.c                |  6 ++
 drivers/virtio/virtio_dma_buf.c        | 82 ++++++++++++++++++++++
 include/linux/virtio.h                 |  1 +
 include/linux/virtio_dma_buf.h         | 37 ++++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++
 11 files changed, 321 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

-- 
2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
