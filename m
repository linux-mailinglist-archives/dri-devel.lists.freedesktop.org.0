Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4118D7F69
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 11:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FBF10E063;
	Mon,  3 Jun 2024 09:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZJ1L2XYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CF310E063
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717408434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=svM+WwOI51MJN3hn795XF+RJF1vUmrqcHluGJP4ofyQ=;
 b=ZJ1L2XYa+Qy1z2V93vybq2lGb4KUZJVPas+sWWVLh69G31m2S+q5syP5OaE3y14QEOuN6O
 ovJUcQ6I69BVvAzCuZpliAvMslW2JYEcO5wwBxHVTNn5YxPwORDTBfTyFO0FSdZ3v/iQLk
 a56VRLSPWkmGoNbXG+2ooTM+tnqDE6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-A0oV989pNF6q3SSaRWpe-A-1; Mon, 03 Jun 2024 05:53:50 -0400
X-MC-Unique: A0oV989pNF6q3SSaRWpe-A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7149085A58C;
 Mon,  3 Jun 2024 09:53:50 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D813B40147E;
 Mon,  3 Jun 2024 09:53:47 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 0/3] drm/panic: Add a kmsg dump screen
Date: Mon,  3 Jun 2024 11:47:24 +0200
Message-ID: <20240603095343.39588-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Add a kmsg option, which will display the last lines of kmsg,
and should be similar to fbcon.
Add a drm.panic_screen module parameter, so you can choose between
the different panic screens available.
Two options currently, but more will be added later:
 * "user": a short message telling the user to reboot the machine.
 * "kmsg": fill the screen with the last lines of kmsg.

You can even change it at runtime by writing to
/sys/module/drm/parameters/panic_screen

Patch 1-2 are the same as https://patchwork.freedesktop.org/series/133963/
and are here to avoid conflicts.

v2:
 * use module parameter instead of Kconfig choice, so it can be changed at
   runtime. (Javier Martinez Canillas)
 * keep fg16/fg24/fg32 as variable name for the blit functions
   (Javier Martinez Canillas)
 * Add drm_panic_is_pixel_fg() to avoid code duplication.
   (Javier Martinez Canillas)

Jocelyn Falempe (3):
  drm/panic: only draw the foreground color in drm_panic_blit()
  drm/panic: Add a set_pixel() callback to drm_scanout_buffer
  drm/panic: Add a kmsg panic screen

 drivers/gpu/drm/Kconfig     |  11 ++
 drivers/gpu/drm/drm_panic.c | 283 +++++++++++++++++++++++++-----------
 include/drm/drm_panic.h     |   9 ++
 3 files changed, 219 insertions(+), 84 deletions(-)


base-commit: 86266829ea755f737762ebda614c59b136c8feac
-- 
2.45.1

