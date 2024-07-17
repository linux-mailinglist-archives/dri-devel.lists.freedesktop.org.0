Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847EC933984
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 11:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EDB10EA1E;
	Wed, 17 Jul 2024 09:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z+obHz2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AE810EA1E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721206914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KrgDLQF/5OvH9cl5dgPPJLVwc5mVIqPT9oH+q0LK9fo=;
 b=Z+obHz2riE6qyKKq0Yzro+1WrO/HQ0B1glQ8LefPSVMorUmGZDJPcwDrti3xcmYKPtDIAe
 z7szbD14PW6043xohUSn0qVvHkAtuckWqAfiJ4bNbvfHuWnKUltDAVII6KAbABocbGaqJX
 zra5iDWrT2Xy1DxC0ySMxnANPugUbKc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-206-Xn3Sl3I1PIKCdwciIuVYUw-1; Wed,
 17 Jul 2024 05:01:52 -0400
X-MC-Unique: Xn3Sl3I1PIKCdwciIuVYUw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C52FB1955F08; Wed, 17 Jul 2024 09:01:43 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D379B1955F3B; Wed, 17 Jul 2024 09:01:38 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 0/3] drm/panic: Remove build time dependency with
 FRAMEBUFFER_CONSOLE
Date: Wed, 17 Jul 2024 10:48:38 +0200
Message-ID: <20240717090102.968152-1-jfalempe@redhat.com>
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

When proposing to enable DRM_PANIC on Fedora, some users raised concern about the need to disable VT_CONSOLE.
So this is my new attempt to avoid fbcon/vt_console to overwrite the panic screen.
This time it doesn't involve any locking, so it should be safe.
I added a skip_panic option in struct fb_info, and check if this option and the panic_cpu are set in fb_is_inactive(), to prevent any framebuffer operation.
Also skip_panic is only true if the drm driver supports drm_panic, so you will still get the VT panic info on drivers that don't have drm_panic support yet.

Jocelyn Falempe (3):
  drm/panic: Add drm_panic_is_enabled()
  fbcon: Add an option to disable fbcon in panic.
  drm/panic: Remove build time dependency with FRAMEBUFFER_CONSOLE

 drivers/gpu/drm/Kconfig          |  2 +-
 drivers/gpu/drm/drm_fb_helper.c  |  2 ++
 drivers/gpu/drm/drm_panic.c      | 20 ++++++++++++++++++++
 drivers/video/fbdev/core/fbcon.c |  7 ++++++-
 include/drm/drm_panic.h          |  2 ++
 include/linux/fb.h               |  1 +
 6 files changed, 32 insertions(+), 2 deletions(-)


base-commit: a237f217bad50c381773da5b00442710d1449098
-- 
2.45.2

