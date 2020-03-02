Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED8E17711A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0604E6EA0F;
	Tue,  3 Mar 2020 08:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62A86E25E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 12:15:34 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id cx7so1180369pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 04:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZGpFs/2Hpvp5EBjhtEPYFMiCDK4EwWNSDCEw0ZF9yM=;
 b=YdktfZqsllSe62wYX660jiqDRS+EalzZnMQ1BeqTSt6UePbz+K0FicX2SsE/V0cujA
 5xWBPQ/CoyG8cCbk0OYdp++ETje+/Zb3758uFx7Qekbu/aW/7Z9P7O5b1yiYOpyhmqGv
 lokSV/Y8mwFqiA+CYWGVKLnJYUt+R77uSUoac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lZGpFs/2Hpvp5EBjhtEPYFMiCDK4EwWNSDCEw0ZF9yM=;
 b=ByCNST3iibQAwT1+kgunRUA48H9UTC2xBP5DLZDNsQ1vvbz4noRlh8tD7Uj43ENDfY
 0rbOOSaLueYq/5g3zhPvAesE6mTLFwkMc98aNvZ/iYNWfKJnwxfgyBOJjz4WoaZYS6a2
 Z1egyevn4gRQKXpao9a7TjrAJcKdTwu5Mx85rz/H9a2jV4jsPZeoN/apoOJ6QVgcDfAN
 hhTzvTSVVrGAuUS7WujjYxJK4U7gjRH3fjQtIWeqFSV5bifbcaa8Au4LHJDt1PE4fWrg
 GjM4+LPnZoCt6gthVb3MQf1W8m5pjL0DvwwtCLKZOFbY9lCIKfkSMfGNmo7hSzr6o/WP
 pnyQ==
X-Gm-Message-State: APjAAAX31aV2P/d++8AMssx6TY7V6oIiFYuDaScc9Z0wEHvTAhzN5ZpA
 Q08Y3Nr57kDJHxZMUz1tIt2qhQ==
X-Google-Smtp-Source: APXvYqwRMn3OTkeHmnSwspvfRaPVPBDR27JwwVPH2eKLlGUxm3/qGiUC5qrtz1TVnCC2dlGf61Hqxg==
X-Received: by 2002:a17:902:c203:: with SMTP id
 3mr18521523pll.261.1583151334258; 
 Mon, 02 Mar 2020 04:15:34 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id g4sm2291857pgk.24.2020.03.02.04.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 04:15:33 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 0/4] Support virtio cross-device resources
Date: Mon,  2 Mar 2020 21:15:20 +0900
Message-Id: <20200302121524.7543-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, David Stevens <stevensd@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset implements the current proposal for virtio cross-device
resource sharing [1], with minor changes based on recent comments. It
is expected that this will be used to import virtio resources into the
virtio-video driver currently under discussion [2].

This patchset adds a new hook to dma-buf, for querying the dma-buf's
underlying virtio UUID. This hook is then plumbed through DRM PRIME
buffers, and finally implemented in virtgpu.

[1] https://markmail.org/thread/jsaoqy7phrqdcpqu
[2] https://markmail.org/thread/p5d3k566srtdtute

v1 -> v2 changes:
 - Move get_uuid callback into main dma-buf ops (instead of placing it
   in a new flavor of dma-buf).
 - Rename new virtio commands and feature flag, and pull uapi changes
   into their own patch.

David Stevens (4):
  dma-buf: add support for virtio exported objects
  drm/prime: add support for virtio exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/dma-buf/dma-buf.c              | 14 ++++++
 drivers/gpu/drm/drm_prime.c            | 27 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 19 ++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 48 ++++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 62 ++++++++++++++++++++++++++
 include/drm/drm_drv.h                  | 15 +++++++
 include/linux/dma-buf.h                | 22 +++++++++
 include/uapi/linux/virtio_gpu.h        | 19 ++++++++
 10 files changed, 230 insertions(+), 3 deletions(-)

-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
