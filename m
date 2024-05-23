Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7418CD345
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1347310E1C5;
	Thu, 23 May 2024 13:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JBiBZZ98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C6410E405
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716469816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=R96fGo+DfZH9hA5gwNm1TzRqcm2JevVUUaq1h5oS1uA=;
 b=JBiBZZ98OnNPhxtLRKpu/8JZ88hwbfpEUq8grC7soOPa9KtFBrdAZ8V6qX3FXDu1D/B/g1
 N05UZuHHC+Y0DNLBLUArj0+MR2mHJRjNvEZWAAvmzwaa1L5FNQwi+tLS021kyrR4XoET6A
 gx0W9gDwdLxnYW24TZZlXemxkJLpzCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-li_6ucXwMqOWtV-kl5VNMA-1; Thu, 23 May 2024 09:10:12 -0400
X-MC-Unique: li_6ucXwMqOWtV-kl5VNMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3A3D8025FC;
 Thu, 23 May 2024 13:10:10 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A96CFC15BF3;
 Thu, 23 May 2024 13:10:08 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 0/5] drm/nouveau: Add drm_panic support for nv50+
Date: Thu, 23 May 2024 15:00:33 +0200
Message-ID: <20240523130955.428233-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds basic drm_panic support for nouveau.
Patches 1-4 Add missing bits in drm_panic (ABGR2101010, set_pixel() for tiling, ...)
Patch 5 registers nouveau to drm_panic, and handle tiling.
I've tested on a GTX1650, while running Gnome/Wayland desktop.

I didn't find documentation about nVidia tiling, so it may not
work on other GPU than GTX1650.

To test it, you need to build your kernel with CONFIG_DRM_PANIC=y, and run

echo c > /proc/sysrq-trigger

or you can enable CONFIG_DRM_PANIC_DEBUG and run

echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

Best regards,

-- 

Jocelyn

Jocelyn Falempe (5):
  drm/panic: Add ABGR2101010 support
  drm/panic: only draw the foreground color in drm_panic_blit()
  drm/panic: Add a set_pixel() callback to drm_scanout_buffer
  drm/panic: add a private pointer to drm_scanout_buffer
  drm/nouveau: Add drm_panic support for nv50+

 drivers/gpu/drm/drm_panic.c             | 183 ++++++++++++++----------
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 127 +++++++++++++++-
 include/drm/drm_panic.h                 |  15 ++
 3 files changed, 247 insertions(+), 78 deletions(-)


base-commit: 484436ec5c2bffe8f346a09ae1cbc4cbf5e50005
-- 
2.45.0

