Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1167B954A95
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 14:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351CE10E61C;
	Fri, 16 Aug 2024 12:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gFH7adOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC5510E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723813003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=PbvZorZrTLiJIcsIRreQJ4q0L+3ldT0TNULndS/qqPA=;
 b=gFH7adOwmhAlRAIk9AkST3yZP1J1Z5I477p/PnQUIJvgQbiyR9gLQZkVWqBlu7LBYEIWW2
 cdc/Y5khUmsceJyFCKcKFrjtlo+gNUsMyaFu7XoOnKPvwC9FP4RU1/y+Y+Da+YTP2iHM2J
 I0zyzvTGGfAYVEgIpfBHe/W9ItwgzO0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-595-L73TajsFPAivaDBHb4TVDg-1; Fri,
 16 Aug 2024 08:56:38 -0400
X-MC-Unique: L73TajsFPAivaDBHb4TVDg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D50BB1955BF1; Fri, 16 Aug 2024 12:56:36 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.28])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9F71719560A3; Fri, 16 Aug 2024 12:56:32 +0000 (UTC)
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
Subject: [RFC PATCH v2 0/5] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Date: Fri, 16 Aug 2024 14:52:32 +0200
Message-ID: <20240816125612.1003295-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4

Design decisions:
  * It uses the drm_client API, so it should work on all drm drivers from the start.
  * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
    It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
  * It uses a circular buffer so the console->write() callback is very quick, and will never stall.
  * Drawing is done asynchronously using a workqueue.
  * drm_log can only be built-in (and drm must be built-in too).
    The reason is that, if you build it as a module, then a userspace application will be more appropriate than this module.
  * When nbcon will be ready, I will use it. It should simplify this a lot, but I prefer not to depend on it yet.
 
The first patch is not for review/merge, it's a squash of my pending drm_panic series:
https://patchwork.freedesktop.org/series/135944/

The second patch, moves the drawing function from drm_panic.c, to drm_draw.c, so they can be re-used by drm_log.
The next patches are the actual drm_log implementation.

v2:
 * Use vmap_local() api, with that change, I've tested it successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
 * Stop drawing when the drm_master is taken. This avoid wasting CPU cycle if the buffer is not visible.
 * Use deferred probe. Only do the probe the first time there is a log to draw. With this, if you boot with quiet, drm_log won't do any modeset.
 * Add color support for the timestamp prefix, like what dmesg does.
 * Add build dependency on  disabling the fbdev emulation, as they are both drm_client, and there is no way to choose which one gets the focus.

Thanks and best regards,

-- 

Jocelyn

Jocelyn Falempe (5):
  [NOT FOR REVIEW] drm/panic: Squash of pending series
  drm/panic: Move drawing functions to drm_draw
  drm/log: Introduce a new boot logger to draw the kmsg on the screen
  drm/log: Do not draw if drm_master is taken
  drm/log: Color the timestamp, to improve readability

 drivers/gpu/drm/Kconfig             |   50 ++
 drivers/gpu/drm/Makefile            |    4 +
 drivers/gpu/drm/drm_crtc_internal.h |    4 +
 drivers/gpu/drm/drm_draw.c          |  216 ++++++
 drivers/gpu/drm/drm_draw.h          |   56 ++
 drivers/gpu/drm/drm_drv.c           |    5 +
 drivers/gpu/drm/drm_log.c           |  515 ++++++++++++++
 drivers/gpu/drm/drm_log.h           |   11 +
 drivers/gpu/drm/drm_panic.c         |  569 ++++++++-------
 drivers/gpu/drm/drm_panic_qr.rs     | 1003 +++++++++++++++++++++++++++
 include/drm/drm_rect.h              |   15 +
 11 files changed, 2193 insertions(+), 255 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_draw.c
 create mode 100644 drivers/gpu/drm/drm_draw.h
 create mode 100644 drivers/gpu/drm/drm_log.c
 create mode 100644 drivers/gpu/drm/drm_log.h
 create mode 100644 drivers/gpu/drm/drm_panic_qr.rs


base-commit: 8befe8fa5a4e4b30787b17e078d9d7b5cb92ea19
-- 
2.46.0

