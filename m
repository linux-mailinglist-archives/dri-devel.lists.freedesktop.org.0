Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA9247FDB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2396989CF4;
	Tue, 18 Aug 2020 07:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BB68915F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 07:13:50 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g7so7659731plq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 00:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgH1OQJe0vDcind90faXlTgA3YjOyLHfHtqyBUp1Czc=;
 b=jBhQriRwN1E1G4yJ7yJ5QVDbR3yI60qfxFdNsiw1JCtEbsa6GBtVj3rXYqfrkw1aRi
 BBFDqgJ42hRBKauGzagAsCP9lo2zL3e6eFXcUOdjV3WZq3DzR1tibyoqkNwHzvl0SAos
 v5Yv2iK3XSVROgT7Y2Z9jT9El0Eh8HaHTb83E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BgH1OQJe0vDcind90faXlTgA3YjOyLHfHtqyBUp1Czc=;
 b=bGcC1244KAGMblhx85giBcvUrV3PouQvT26XrNU/bTeY9TFoKwMx1ZpMVu9jZ8e25G
 UYCGi9Pfh3Zq+qTAgaD4U/+g+cp8arm78mkMzkdpAigEjtiMVUR4xOmyOh+/naG9slxq
 IsLHLSGWJnuqIIuxNQdEC0eOmzXbxVYvR9kGvEYwr5MubfTU+KvQvhu4rfFbO9koKcPf
 fWv/v1IZIyYb1758tr/7FOOOkOeGFflU4PPv2CUMSyLGans/k1Lw4064lCR3R1Kyp4mc
 +gbV+T4aWs1Gw1zjf5S5WEmKl1NeW6zUPIYUIggEdzLHtO+7bHZI/ubG9/Rmk+z9AkWd
 QOng==
X-Gm-Message-State: AOAM533r3rPhWNLtgRNKqAXCLIQmAdgfYH7EUIKz7npS34rvPWXn/IEA
 U5uwSXKW8QK2oWR9NIk2jcfnqg==
X-Google-Smtp-Source: ABdhPJxuueydVbd6bk9DsX+V9TjGBCXpTewyWvogJZRb7m1T+Taz+F9x0MJK+8gr+vU6zEAzQBkJ7Q==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr14823420pjb.182.1597734829705; 
 Tue, 18 Aug 2020 00:13:49 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
 by smtp.gmail.com with ESMTPSA id g33sm15709005pgg.46.2020.08.18.00.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 00:13:49 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v7 0/3] Support virtio cross-device resources
Date: Tue, 18 Aug 2020 16:13:40 +0900
Message-Id: <20200818071343.3461203-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 David Stevens <stevensd@chromium.org>, linux-media@vger.kernel.org
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

v6 -> v7 changes:
 - Fix most strict checkpatch comments

David Stevens (3):
  virtio: add dma-buf support for exported objects
  virtio-gpu: add VIRTIO_GPU_F_RESOURCE_UUID feature
  drm/virtio: Support virtgpu exported resources

 drivers/gpu/drm/virtio/virtgpu_drv.c   |  3 +
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 21 ++++++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  4 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 96 +++++++++++++++++++++++++-
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 55 +++++++++++++++
 drivers/virtio/Makefile                |  2 +-
 drivers/virtio/virtio.c                |  6 ++
 drivers/virtio/virtio_dma_buf.c        | 85 +++++++++++++++++++++++
 include/linux/virtio.h                 |  1 +
 include/linux/virtio_dma_buf.h         | 37 ++++++++++
 include/uapi/linux/virtio_gpu.h        | 19 +++++
 11 files changed, 325 insertions(+), 4 deletions(-)
 create mode 100644 drivers/virtio/virtio_dma_buf.c
 create mode 100644 include/linux/virtio_dma_buf.h

-- 
2.28.0.220.ged08abb693-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
