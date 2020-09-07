Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF75725F334
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 08:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039416E0D8;
	Mon,  7 Sep 2020 06:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1A86E0B6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 06:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599460433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T1DfbXG3uMzAfK/eb+0itP5R9WbnAHyoA6h1iZkA6s0=;
 b=SYn+x4bX2edkunbhu0zG6daKW0WmMbAPnaiMnvPKzHbX+e9T+KzoDLjB5pNgLY3glje1Cw
 qv1InVIktVGIhIo5zcA93vUYs66ustywILtjDhckPHkq6MpP1PCG5iw+7blM8o/FWioXBH
 bPazgNqv5hyZZ8FtGwEt3bWLTWXLlt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-ixy_W_MjP0OfpCaTlZnm5Q-1; Mon, 07 Sep 2020 02:33:48 -0400
X-MC-Unique: ixy_W_MjP0OfpCaTlZnm5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8DBA800FFF;
 Mon,  7 Sep 2020 06:33:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB8715C230;
 Mon,  7 Sep 2020 06:33:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D0BC89D77; Mon,  7 Sep 2020 08:33:43 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm: fix virtio-gpu + sev
Date: Mon,  7 Sep 2020 08:33:41 +0200
Message-Id: <20200907063343.18097-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
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
Cc: christian.koenig@amd.com, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

virtio-gpu must make sure scatter list segments are not too big.

Gerd Hoffmann (2):
  drm: allow limiting the scatter list size.
  drm/virtio: set max_segment

 include/drm/drm_device.h                    |  8 ++++++++
 include/drm/drm_prime.h                     |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  3 ++-
 drivers/gpu/drm/drm_gem_shmem_helper.c      |  3 ++-
 drivers/gpu/drm/drm_prime.c                 | 10 +++++++---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  3 ++-
 drivers/gpu/drm/msm/msm_gem.c               |  3 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c         |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_prime.c     |  3 ++-
 drivers/gpu/drm/radeon/radeon_prime.c       |  3 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  6 ++++--
 drivers/gpu/drm/tegra/gem.c                 |  3 ++-
 drivers/gpu/drm/vgem/vgem_drv.c             |  3 ++-
 drivers/gpu/drm/virtio/virtgpu_kms.c        |  1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  3 ++-
 16 files changed, 44 insertions(+), 17 deletions(-)

-- 
2.27.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
