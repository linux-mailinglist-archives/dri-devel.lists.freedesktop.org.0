Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3409CE13B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FA310E6F3;
	Fri, 15 Nov 2024 14:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fANtPcLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631A510E6F3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731681019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=OvtPXxty+lBiIu+d8PKhi1VvrOz5bTL6Lsn1BlsAdUs=;
 b=fANtPcLZqVhWH5fJ7onsLJDcTG2tdawhbchNgnRTODAdfpNSU2UNESGBllr/lBlThvajYc
 tDFMSSpeTOi12MCHlycmeRVVYGRMgrtNx/K8dpPR1Qi8WM7Kd3Ko8wvf3YaVPGJwtvCE6b
 Zq2t1gj1OWDNvY4KKzmAr5o1oGNGrRQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-ZtjEYbcbPOmy2TRldpfsKw-1; Fri,
 15 Nov 2024 09:30:15 -0500
X-MC-Unique: ZtjEYbcbPOmy2TRldpfsKw-1
X-Mimecast-MFC-AGG-ID: ZtjEYbcbPOmy2TRldpfsKw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0085919560A1; Fri, 15 Nov 2024 14:30:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.181])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8F8C0196BC05; Fri, 15 Nov 2024 14:30:08 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v8 0/6] drm/log: Introduce a new boot logger to draw the kmsg
 on the screen
Date: Fri, 15 Nov 2024 14:40:37 +0100
Message-ID: <20241115142950.1758007-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
  * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
 
v2:
 * Use vmap_local() api, with that change, I've tested it successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
 * Stop drawing when the drm_master is taken. This avoid wasting CPU cycle if the buffer is not visible.
 * Use deferred probe. Only do the probe the first time there is a log to draw. With this, if you boot with quiet, drm_log won't do any modeset.
 * Add color support for the timestamp prefix, like what dmesg does.
 * Add build dependency on  disabling the fbdev emulation, as they are both drm_client, and there is no way to choose which one gets the focus.

v3:
 * Remove the work thread and circular buffer, and use the new write_thread() console API.
 * Register a console for each drm driver.

v4:
 * Can be built as a module, even if that's not really useful.
 * Rebased on top of "drm: Introduce DRM client library" series from Thomas Zimmermann.
 * Add a Kconfig menu to choose between drm client.
 * Add suspend/resume callbacks.
 * Add integer scaling support.
 
v5:
 * Build drm_log in drm_client_lib module, to avoid circular dependency.
 * Export drm_draw symbols, so they can be used if drm_client_lib is built as module.
 * Change scale parameter to unsigned int (Jani Nikula)

v6:
 * Use console_stop() and console_start() in the suspend/resume callback (Petr Mladek).
 * rebase and solve conflict with "drm/panic: Add ABGR2101010 support"

v7:
 * Add a patch fix a build issue due to missing DRM_CLIENT_LIB, reported by kernel test bot.

v8:
 * Rebased after drm client moved to drivers/gpu/drm/clients/
 * Rename DRM_LOG to DRM_CLIENT_LOG (Thomas Zimmermann)
 * Drop "Always select DRM_CLIENT_LIB", and select only if DRM_CLIENT_LOG is set
 * Add an info message if no clients are initialized in drm_client_setup()

Jocelyn Falempe (6):
  drm/panic: Move drawing functions to drm_draw
  drm/log: Introduce a new boot logger to draw the kmsg on the screen
  drm/log: Do not draw if drm_master is taken
  drm/log: Color the timestamp, to improve readability
  drm/log: Implement suspend/resume
  drm/log: Add integer scaling support

 drivers/gpu/drm/Kconfig                       |   5 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/clients/Kconfig               |  48 ++
 drivers/gpu/drm/clients/Makefile              |   1 +
 drivers/gpu/drm/clients/drm_client_internal.h |   6 +
 drivers/gpu/drm/clients/drm_client_setup.c    |  29 +-
 drivers/gpu/drm/clients/drm_log.c             | 420 ++++++++++++++++++
 drivers/gpu/drm/drm_draw.c                    | 233 ++++++++++
 drivers/gpu/drm/drm_draw.h                    |  56 +++
 drivers/gpu/drm/drm_panic.c                   | 257 +----------
 10 files changed, 818 insertions(+), 238 deletions(-)
 create mode 100644 drivers/gpu/drm/clients/drm_log.c
 create mode 100644 drivers/gpu/drm/drm_draw.c
 create mode 100644 drivers/gpu/drm/drm_draw.h


base-commit: 7d2faa8dbb7055a115fe0cd6068d7090094a573d
-- 
2.47.0

