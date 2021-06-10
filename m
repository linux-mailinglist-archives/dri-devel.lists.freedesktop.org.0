Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2153A3579
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781AE6EDF1;
	Thu, 10 Jun 2021 21:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CCB6E1EE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 21:09:43 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id t9so751657pgn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v3KIzaNkbMYB74rWQzqogC/s/5I4uLoZNzuaQckiBhY=;
 b=dLOOqBru/pWJ3Qjq58xfX/kUe2GPFju3DntrvUhuqG7dMi6bftGirFnnyCEGcU+YIo
 AoJOKAfQX0ASndlfC0WkMUXrrUvxwM/wH99EQ8Aq63O72ZDnTxXBFtLF1q/xVBvRR/Iq
 LwmsZQP+tyHDo5+V7I85uEDQy/fPpIBBoYG9I1j5G2JEUg0pl5ljM906igY4ToqNLww2
 iTd3fCFACvjvTCltnfk4U59NoZ1oYlhvAKUQIgsBgmws1z8Tw2F/11zW9MlJJTvCSeUF
 FcXv1FS1HPX6/+mbOV/KUtzFeTcqRuhcJyzXcx9i0BZhnhHNx1nLtIwOqYZqpPIsKkfO
 Sirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v3KIzaNkbMYB74rWQzqogC/s/5I4uLoZNzuaQckiBhY=;
 b=l/2s3Fivgv8tIXRrP8EOneeLC50zYjpePbIQ6ecx2nbd7YiFP82x6UPm5eqEiHaiUz
 q6YB8fI6C+FRbr16dlJsf6pJgstoslkyQ3UCEhNID8uHlc7UsW+MjK1TUFS99VvzUDx0
 jgtAaDk05xM7au6RSqn51QxzDa6zV7ROy2SYReiv2BpPIjhIyci8Y9IqinmlwpfAlHQz
 s+SfFxQ1NyCy0rbw/HLsVhggkLXNfINGvIc6+NH00ZOjoCzx4YKrlFJWmrG9ZuY586Re
 pSADH9ozON41sOcOy/D2TWp3VXVmonSbqczY4s9CJAz6dXeO3Z7BCuKviMGeiJi8zX++
 eQvA==
X-Gm-Message-State: AOAM533UK/KEJ84PrEu/3q/t1eAY+ACfT44doH8fmhQ9hzuqg5Kl1eff
 MsYZgWIOG+pkBfRn936yiRRJF6exJ/ZcEw==
X-Google-Smtp-Source: ABdhPJyG1fzQEWI0ASIw9LUpJ2VdbjxRtgpYLDPyiz7JScDz2dzsRGivSvDAYL5LMAbl/hgjIfmwEQ==
X-Received: by 2002:a65:5c4a:: with SMTP id v10mr336940pgr.142.1623359382273; 
 Thu, 10 Jun 2021 14:09:42 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id o16sm3145288pfu.75.2021.06.10.14.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:09:41 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] dma-buf: Add an API for exporting sync files (v12)
Date: Thu, 10 Jun 2021 16:09:19 -0500
Message-Id: <20210610210925.642582-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 wayland-devel@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, mesa-dev@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Modern userspace APIs like Vulkan are built on an explicit
synchronization model.  This doesn't always play nicely with the
implicit synchronization used in the kernel and assumed by X11 and
Wayland.  The client -> compositor half of the synchronization isn't too
bad, at least on intel, because we can control whether or not i915
synchronizes on the buffer and whether or not it's considered written.

The harder part is the compositor -> client synchronization when we get
the buffer back from the compositor.  We're required to be able to
provide the client with a VkSemaphore and VkFence representing the point
in time where the window system (compositor and/or display) finished
using the buffer.  With current APIs, it's very hard to do this in such
a way that we don't get confused by the Vulkan driver's access of the
buffer.  In particular, once we tell the kernel that we're rendering to
the buffer again, any CPU waits on the buffer or GPU dependencies will
wait on some of the client rendering and not just the compositor.

This new IOCTL solves this problem by allowing us to get a snapshot of
the implicit synchronization state of a given dma-buf in the form of a
sync file.  It's effectively the same as a poll() or I915_GEM_WAIT only,
instead of CPU waiting directly, it encapsulates the wait operation, at
the current moment in time, in a sync_file so we can check/wait on it
later.  As long as the Vulkan driver does the sync_file export from the
dma-buf before we re-introduce it for rendering, it will only contain
fences from the compositor or display.  This allows to accurately turn
it into a VkFence or VkSemaphore without any over- synchronization.

This patch series actually contains two new ioctls.  There is the export
one mentioned above as well as an RFC for an import ioctl which provides
the other half.  The intention is to land the export ioctl since it seems
like there's no real disagreement on that one.  The import ioctl, however,
has a lot of debate around it so it's intended to be RFC-only for now.

Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4037
IGT tests: https://patchwork.freedesktop.org/series/90490/

v10 (Jason Ekstrand, Daniel Vetter):
 - Add reviews/acks
 - Add a patch to rename _rcu to _unlocked
 - Split things better so import is clearly RFC status

v11 (Daniel Vetter):
 - Add more CCs to try and get maintainers
 - Add a patch to document DMA_BUF_IOCTL_SYNC
 - Generally better docs
 - Use separate structs for import/export (easier to document)
 - Fix an issue in the import patch

v12 (Daniel Vetter):
 - Better docs for DMA_BUF_IOCTL_SYNC

v12 (Christian König):
 - Drop the rename patch in favor of Christian's series
 - Add a comment to the commit message for the dma-buf sync_file export
   ioctl saying why we made it an ioctl on dma-buf

Cc: Christian König <christian.koenig@amd.com>
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: Daniel Stone <daniels@collabora.com>
Cc: mesa-dev@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org
Test-with: 20210524205225.872316-1-jason@jlekstrand.net

Christian König (1):
  dma-buf: Add dma_fence_array_for_each (v2)

Jason Ekstrand (5):
  dma-buf: Add dma_resv_get_singleton (v6)
  dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
  dma-buf: Add an API for exporting sync files (v12)
  RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_unlocked
  RFC: dma-buf: Add an API for importing sync files (v7)

 Documentation/driver-api/dma-buf.rst |   8 ++
 drivers/dma-buf/dma-buf.c            | 103 +++++++++++++++++++++++++
 drivers/dma-buf/dma-fence-array.c    |  27 +++++++
 drivers/dma-buf/dma-resv.c           | 110 +++++++++++++++++++++++++++
 include/linux/dma-fence-array.h      |  17 +++++
 include/linux/dma-resv.h             |   2 +
 include/uapi/linux/dma-buf.h         | 103 ++++++++++++++++++++++++-
 7 files changed, 369 insertions(+), 1 deletion(-)

-- 
2.31.1

