Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F277170D24
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 01:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C256E32E;
	Thu, 27 Feb 2020 00:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5DF6E32E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 00:26:06 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id i19so650594pfa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AS43pUpXSRGzOTOzoLRX9i5f6JnqbgZ1rU3Shx1jgpw=;
 b=eM8uJ8TdkAXzJP/MvTmZ+ozaRzETNlH8sBtgUuFAv0NxooMsly3I5Wlptv6huifk8D
 MTdXGtJxQ6Q6E3SxyGQoHU+ATyvEqKEWunDY6PXu5U06zALCURINhk1kx5W1/wFcq6Oo
 TDZO1xyaAkQPJKYB9NUNWH4HfP4Hfb1J6mnlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AS43pUpXSRGzOTOzoLRX9i5f6JnqbgZ1rU3Shx1jgpw=;
 b=R0viNh87xxT8lfPKVNMHIpQ/TT613VC5yluWL40uwFcldpFk7afGtqkl5oqAa2hVmn
 iv0nkL/u8H0rMgv6SYIRYUgGVaz9DJt9K5zQQ+DNx6iaTx9S8FW/8DsdXXi4f6wML1w1
 GdotyKP8/0pwJa3htzxUCnlhCzi29rdPIWEIVVSjLGDgTqzx9VQSh2YuG9BVcPY+mlDZ
 IFBPAIP4nI7bMbwqkX/mAu2b6C+OzFNtLzwW0CQepqsEXKPGPXGd1h77LiduuioZUJKX
 4ka7y7Qfv8CJnuRjAYYJRvDAjkoBsc6lQ6cd1AdzmCa/xlxIATDLKVwPQe6gclK1KN5R
 OUVw==
X-Gm-Message-State: APjAAAVIq2aLdwrWHv+o37unQIIUpfmC/Lo8CmTATjJ3KKXtSD7npQIL
 +6dz/e8BuQWDOACwsiANakKKnhHa8fA=
X-Google-Smtp-Source: APXvYqwdcBqcvjl/EK4/wbzAc9dbFQwRBLnj7OcUY//N3V/YzmlES5fxkDmnlEExAglgS1V5U9gvsg==
X-Received: by 2002:a62:f247:: with SMTP id y7mr1318682pfl.5.1582763165896;
 Wed, 26 Feb 2020 16:26:05 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id d14sm4522237pfq.117.2020.02.26.16.26.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 16:26:05 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/8] *** Refactor struct virtgpu_object ***
Date: Wed, 26 Feb 2020 16:25:53 -0800
Message-Id: <20200227002601.745-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: multipart/mixed; boundary="===============1083828535=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1083828535==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

The main motivation behind this is to have eventually have something like this:

struct virtio_gpu_shmem {
    struct drm_gem_shmem_object base;
    uint32_t hw_res_handle;
    struct sg_table *pages;
    (...)
};

struct virtio_gpu_vram {
    struct drm_gem_object base;  // or *drm_gem_vram_object
    uint32_t hw_res_handle;
    {offset, range};
    (...)
};

Sending this out to solicit feedback on this approach.  Whichever approach
we decide, landing incremental changes to internal structures is reduces
rebasing costs and avoids mega-changes.

Gurchetan Singh (8):
  drm/virtio: make mmap callback consistent with callbacks
  drm/virtio: add virtio_gpu_is_shmem helper
  drm/virtio: add virtio_gpu_get_handle function
  drm/virtio: make RESOURCE_UNREF use virtio_gpu_get_handle(..)
  drm/virtio: make {ATTACH_RESOURCE, DETACH_RESOURCE} use
    virtio_gpu_get_handle(..)
  drm/virtio: rename virtio_gpu_object_array to virtio_gpu_gem_array
  drm/virtio: rename virtio_gpu_object_params to
    virtio_gpu_create_params
  drm/virtio: rename virtio_gpu_object to virtio_gpu_shmem

 drivers/gpu/drm/virtio/virtgpu_drv.h    |  72 ++++++------
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 132 ++++++++++-----------
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  |  50 ++++----
 drivers/gpu/drm/virtio/virtgpu_object.c | 148 +++++++++++++-----------
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  52 ++++-----
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 113 +++++++++---------
 6 files changed, 298 insertions(+), 269 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog


--===============1083828535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1083828535==--
