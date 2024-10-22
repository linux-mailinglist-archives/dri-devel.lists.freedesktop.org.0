Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C699AB645
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 20:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCEF10E0BC;
	Tue, 22 Oct 2024 18:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cE1A8yol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA0910E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729623370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xDYoUKvD6VkEAurfnQZFF6qlSC2gE01lKl6+WARzsy4=;
 b=cE1A8yoljFtNuxf/qIH10jluu3Un49fMstCO1QVDww+es5iNjIPnP5MCgX7kB+l27z9drw
 X+hu3DH0wqxLDxVmY8d9mJAT5dOxDykG+Kczcbf1jRGQyClSWcOnI2vJtLKmJGlH+jdc5u
 wabG3F+MCPt8qJeZPIDV3Nd14pVwpXw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-A52GdyPDOi-Yop92AKyMkQ-1; Tue,
 22 Oct 2024 14:56:07 -0400
X-MC-Unique: A52GdyPDOi-Yop92AKyMkQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EC0DE1956077; Tue, 22 Oct 2024 18:56:05 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.145])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7A2811956056; Tue, 22 Oct 2024 18:56:02 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v4 0/3] drm/nouveau: Add drm_panic support for nv50+
Date: Tue, 22 Oct 2024 20:39:46 +0200
Message-ID: <20241022185553.1103384-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
I've tested on GTX1650 (Turing), GeForce GT 1030 (Pascal) and
Geforce 8800 GTS (Tesla), running Gnome/Wayland desktop, and in VT.

It should work on other nv50+ cards, but I didn't test them.

To test it, you need to build your kernel with CONFIG_DRM_PANIC=y, and run:

echo c > /proc/sysrq-trigger

or you can enable CONFIG_DRM_PANIC_DEBUG and run:

echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

v2:
 * Rebase and drop already merged patches.
 * Rework the tiling algorithm, using "swizzle" to compute the offset
   inside the block.
   
v3:
 * Fix support for Tesla GPU, which have simpler tiling.
 * Drop "add a private pointer to struct drm_scanout_buffer".
 * Use nouveau_framebuffer_get_layout() to get the tiling parameters.
 * Have 2 set_pixel() functions, depending on GPU family.
 
v4:
 * Refactor and move the tiling code from nouveau_display.c to dispnv50/tile.h, so that
 in can be re-used by drm_panic. (Lyude)
 * Refactor get_scanout_buffer() to use the new dispnv50/tile.h
 * use drm_warn() instead of pr_warn() in get_scanout_buffer
 
Jocelyn Falempe (3):
  drm/panic: Add ABGR2101010 support
  drm/nouveau/disp: Move tiling functions to dispnv50/tile.h
  drm/nouveau: Add drm_panic support for nv50+

 drivers/gpu/drm/drm_panic.c               |  10 ++
 drivers/gpu/drm/nouveau/dispnv50/tile.h   |  63 +++++++++++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 129 +++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_display.c |  59 ++--------
 4 files changed, 210 insertions(+), 51 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/tile.h


base-commit: 2320c9e6a768d135c7b0039995182bb1a4e4fd22
-- 
2.47.0

