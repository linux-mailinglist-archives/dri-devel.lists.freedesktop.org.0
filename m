Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10C2248002
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E397489CC9;
	Tue, 18 Aug 2020 07:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC5689E5A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 01:37:52 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t11so8455555plr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 18:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKh9IL3wAtvMWfoyCMPIJCvNUxcYwDemhkEsAUpJ8lo=;
 b=PpDkXzwwJnQbFULXuaCZmFAzHkMYds94xj9YOEbRQIDZP94f5AIguahC9HLAqMzfqe
 HZo+oLLrI8WjWPoEUYBDKMzFALzRY0smgK2z8FhA0gTW6+15QKk+sBnRoiloCW4HD1Tg
 /lbl1EzXVpT9Bbqf4asPikFMaMTCUurQjIIik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKh9IL3wAtvMWfoyCMPIJCvNUxcYwDemhkEsAUpJ8lo=;
 b=hM96PgCbzMeCOwrywIidgh/fDi0JEo9ve4KJ6Tpfd5M8/sDG8lxoPkIAmeUhQC0MK7
 CdIx/P/AlZ9HpwI2vARgDl4U7IK5iilhybto2EDj+SbSNk6Qtiu2g91zB1+/4ICWQ8Ez
 tM6AnE38GLAozT8B8XdJtp+QwWtjZw6foQPLYA1Xm1InvvXaqMpI3fdaL7d21g2TwIZf
 oLttFHJ5/lqhLkY8FvsOGppYskTaYIVSs0RaFysyysI2T6jnm1fA43Pwn0sUZrFLfFrz
 FmIutPb5G+JtVyQvdJmPYD3a8PyKJYxMR4JRRQC24pttADit7XURJL4BgrtZ4P4otUb8
 Q6aQ==
X-Gm-Message-State: AOAM533iLnLl47sjCrv52tTsqr5qO6n76NKc1y7kHdy1irejyuWdj+3A
 Uu8kI6EQEcMYBaC/YK/QSOOmz2NRUUqSlg==
X-Google-Smtp-Source: ABdhPJwBgf3Py2LgsmCVLyQWvxnS2N46UEoOPZjDMDI6aKwBwSdp/Daf1fAgtWB28KQKG/yQd4XxNg==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr14032262pjb.182.1597714671684; 
 Mon, 17 Aug 2020 18:37:51 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:f693:9fff:fef4:a930])
 by smtp.gmail.com with ESMTPSA id e8sm21616835pfd.34.2020.08.17.18.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 18:37:50 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v6 0/3] Support virtio cross-device resources
Date: Tue, 18 Aug 2020 10:37:41 +0900
Message-Id: <20200818013744.3327271-1-stevensd@chromium.org>
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

v5 -> v6 changes:
 - Fix >80 character comment

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
2.28.0.220.ged08abb693-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
