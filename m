Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60C96F0E3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 12:04:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30FD10E9F0;
	Fri,  6 Sep 2024 10:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K44DzTs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F0310E9F0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 10:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725617092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RkckzlxdfjjN/kA5IYxa8i47ice8GQ1Zej2l2t2KMzI=;
 b=K44DzTs2eJguwl6+anDBnUCiQFus7dpx0TqFfY4mQwBOqOsOCDTmMz8lNUGfVCeAn3xNNh
 2n5233vJElnXu1gUk8XevKhxVxfYdc/5CGqxuSgFea/czaBiD6MgAVe57a5PSWMhqD4BbD
 MtmNE4yo7Wi4lsaAHMlZGl4uQ200o1U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-Hn7UWgQRNBKS8EGMHV8K6Q-1; Fri,
 06 Sep 2024 06:04:51 -0400
X-MC-Unique: Hn7UWgQRNBKS8EGMHV8K6Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8B00019560A3; Fri,  6 Sep 2024 10:04:49 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.228])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A4A501956086; Fri,  6 Sep 2024 10:04:45 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 0/3] drm/nouveau: Add drm_panic support for nv50+
Date: Fri,  6 Sep 2024 12:02:59 +0200
Message-ID: <20240906100434.1171093-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
Patches 1-2 Add missing bits in drm_panic (ABGR2101010, private data for set_pixel())
Patch 3 registers nouveau to drm_panic, and handle tiling.
I've tested on a GTX1650, while running Gnome/Wayland desktop.

It should work on other nv50+ cards, but I didn't test them.

To test it, you need to build your kernel with CONFIG_DRM_PANIC=y, and run:

echo c > /proc/sysrq-trigger

or you can enable CONFIG_DRM_PANIC_DEBUG and run:

echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

v2:
 * Rebase and drop already merged patches.
 * Rework the tiling algorithm, using "swizzle" to compute the offset
   inside the block.

Jocelyn Falempe (3):
  drm/panic: Add ABGR2101010 support
  drm/panic: add a private pointer to struct drm_scanout_buffer
  drm/nouveau: Add drm_panic support for nv50+

 drivers/gpu/drm/drm_panic.c             |  10 +++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 107 +++++++++++++++++++++++-
 include/drm/drm_panic.h                 |   7 ++
 3 files changed, 122 insertions(+), 2 deletions(-)


base-commit: e8653e63e834e4c7de60b81b8b24deb7bdd3bf56
-- 
2.46.0

