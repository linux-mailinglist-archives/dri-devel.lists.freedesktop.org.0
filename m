Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985F3182ACB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979866EA94;
	Thu, 12 Mar 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFF96E57E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:20:18 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t3so1041631pgn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KxW/JHv7DCd6LJdHZguy7LpVn/rmry23ZMXy1XI084k=;
 b=fBOA7Z4/VSkvDegFBNVqp2pLUAlgBxRv5RhOTNT8p2xHiAPXkjWsHMTxUl1BPV00zJ
 vMY5dhyEKkfjXmFfYLzpD5a73p+KDdMSaC4nhV9dQ1R32BqiNxXeCSXBpA7Ii2Wer4pC
 VDfF4BA+tuEYJwFmE32LvvNq/AN2GVAmGN3hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KxW/JHv7DCd6LJdHZguy7LpVn/rmry23ZMXy1XI084k=;
 b=V7Lb5Hty7U/8xLZVwUeHfxXR6Mtgx+wdVb30uHVKPTjbRCvQxH4TgwLEwmss7zMWX7
 HHUNwHbb8nJDUWtMTNmmAQz9eCPTCSh62G3KkI65nNyuINLTqdAfN0X+IETVIvWvOL8r
 +fkcHERN2hDz/yl86pJ2JkTE8W9dSUJwacDTdr83GR68XybyTrpzei6S5r34HbhoblPP
 7wVQjX74ItkacYzP/Vr3xr7H9rqCjz2vRCmASnTweJVGm7MBjwrx7aNTU5ovcotkHWry
 J0yrfe3Mi0YzewMdRPVnTdaPkembN/NCAjmSgTMoz0DTiQnz1/ihl43djIJ3wno55p77
 PYgg==
X-Gm-Message-State: ANhLgQ2PeWFCUR8oO6rJMA5O3jmq34hIBnrrL+kcfPhYSdK5IqjhrvXW
 CH1BuTdgunWANEOaX9nnHlgiYg==
X-Google-Smtp-Source: ADFU+vvUUJsm4mKY+53aHHx0GkxoPfHJ2XfB3hmp2HvE1iN3ACnAA15TuK1aSNIfg+893OuM9NF9eQ==
X-Received: by 2002:a63:4d6:: with SMTP id 205mr2392870pge.10.1583925617855;
 Wed, 11 Mar 2020 04:20:17 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
 by smtp.gmail.com with ESMTPSA id e12sm35842384pff.168.2020.03.11.04.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 04:20:17 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v3 0/4] Support virtio cross-device resources
Date: Wed, 11 Mar 2020 20:20:00 +0900
Message-Id: <20200311112004.47138-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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

v2 -> v3 changes:
 - Remove ifdefs.
 - Simplify virtgpu_gem_prime_export as it can only be called once.
 - Use virtio_gpu_vbuffer's objs field instead of abusing data_buf.

David Stevens (4):
  dma-buf: add support for virtio exported objects
  drm/prime: add support for virtio exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/dma-buf/dma-buf.c              | 12 ++++++
 drivers/gpu/drm/drm_prime.c            | 23 +++++++++++
 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 18 +++++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 41 +++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 ++++++++++++++++++++++++++
 include/drm/drm_drv.h                  | 10 +++++
 include/linux/dma-buf.h                | 18 +++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++++++
 10 files changed, 200 insertions(+), 3 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
