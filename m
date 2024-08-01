Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E22E9448FC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 12:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD1810E8E5;
	Thu,  1 Aug 2024 10:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FdmjFGuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A680C10E8E5
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722506821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=m+AcU6QzSb7rs1jXvTepEqbC5SaD+a0PmE71dwYSIWA=;
 b=FdmjFGuRL+fbUY5DNYv7lIuZ5L2x2RcOPzGQtrgqgRBPg6ROvLrQKQUogDHFRpfbVJngEZ
 /a8epxbZbmr1d0qyheESll2khaHymbb/uPFDQGTKnujrEh/3xO/143gTFupq5PyEOAhFdD
 fEGrDOBVMHjm6Y3bi6uWzDLxF3cGq+g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-635-VRl68sAXMaCzfFtezGHSrw-1; Thu,
 01 Aug 2024 06:06:58 -0400
X-MC-Unique: VRl68sAXMaCzfFtezGHSrw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A71E71955F45; Thu,  1 Aug 2024 10:06:56 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.214])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7C16A19560B2; Thu,  1 Aug 2024 10:06:52 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [RFC PATCH 0/3] drm/log: Introduce a new boot logger to draw the kmsg
 on the screen
Date: Thu,  1 Aug 2024 12:04:22 +0200
Message-ID: <20240801100640.462606-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
This is not a full replacement to fbcon, as it will only print the kmsg.
It will never handle user input, or a terminal because this is better done in userspace.

If you're curious on how it looks like, I've put a small demo here:
https://people.redhat.com/jfalempe/drm_log/drm_log_draft_preview.webm

Design decisions:
  * It uses the drm_client API, so it should work on all drm drivers from the start.
  * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
    It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
  * It uses a circular buffer so the console->write() callback is very quick, and will never stall.
  * Drawing is done asynchronously using a workqueue.
  * drm_log can only be built-in (and drm must be built-in too).
    The reason is that, if you build it as a module, then a userspace application will be more appropriate than this module.

TODO items:
 * It currently only handles the first drm_client hotplug event, I need a bit more time to fix that. 
 * I didn't find a way to know when drm_log loses focus, I would like to unregister it, so it won't waste CPU cycles in the background.
 * I copied the drm_client API usage from drm_fbdev_shmem, so there might be some adjustment to work on DMA GPU (I didn't try yet).
 * Flicker-free boot: I don't want drm_log to introduce new modeset during the boot, so it may need some adjustment.
 * I tried to use the new nbcon interface, but didn't get any message from the write_atomic() callback, but the goal is to use that when it's ready.
 * Add color support, to make timestamp, or error message, in different color for better visibility.
 * If built with VT_CONSOLE=n and FRAMEBUFFER_CONSOLE=y, fbcon is taking the focus, and you won't see the drm_log.
   It would be nice to have drm_log for boot logs, and still use fbcon for terminal, when userspace is started.
 
The first patch is not for review/merge, it's a squash of my pending drm_panic series:
https://patchwork.freedesktop.org/series/136377/
https://patchwork.freedesktop.org/series/135944/

The second patch, moves the drawing function from drm_panic.c, to drm_draw.c, so they can be re-used by drm_log.
The third patch is the actual drm_log implementation.

I want to get some feedbacks before spending more time on this, and make sure I'm heading in the right direction.

Thanks and best regards,

-- 

Jocelyn

Jocelyn Falempe (3):
  [NOT FOR REVIEW] drm/panic: Squash of pending series
  drm/panic: Move drawing functions to drm_draw
  drm/log: Introduce a new boot logger to draw the kmsg on the screen

 drivers/gpu/drm/Kconfig             |   47 ++
 drivers/gpu/drm/Makefile            |    4 +
 drivers/gpu/drm/drm_crtc_internal.h |    8 +
 drivers/gpu/drm/drm_draw.c          |  216 ++++++
 drivers/gpu/drm/drm_draw.h          |   56 ++
 drivers/gpu/drm/drm_drv.c           |    5 +
 drivers/gpu/drm/drm_log.c           |  477 +++++++++++++
 drivers/gpu/drm/drm_log.h           |    8 +
 drivers/gpu/drm/drm_panic.c         |  596 +++++++++-------
 drivers/gpu/drm/drm_panic_qr.rs     | 1003 +++++++++++++++++++++++++++
 include/drm/drm_panic.h             |   21 +-
 include/drm/drm_rect.h              |   15 +
 12 files changed, 2181 insertions(+), 275 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_draw.c
 create mode 100644 drivers/gpu/drm/drm_draw.h
 create mode 100644 drivers/gpu/drm/drm_log.c
 create mode 100644 drivers/gpu/drm/drm_log.h
 create mode 100644 drivers/gpu/drm/drm_panic_qr.rs


base-commit: bb99c51bdaa846bddb85a1e7acca3a3aa5e9f082
-- 
2.45.2

