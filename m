Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D557B0B10
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 19:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3133010E587;
	Wed, 27 Sep 2023 17:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A8510E585
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 17:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695835746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tSk7qfcSQedPk0IzcisEHWuFd2uRDtl11DSwzBRnSI4=;
 b=PM+WsaxCTXUSnoufiylbIAaCE3bvY39W+NGF3cGmYhu9q25ktCu4pMjQmBfNYUTKir8hIR
 8tR6EKl+ZwqGpu55OJGDaIvEd4lkMVwF4hGH58p7Jk9R5qebVjWD3XD0zsMAflaY8bUiil
 Xsx5PMfm562JyvFvyMsukyIv2XcfruM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-pbE2HrAtOt6BIwm2_n4ooA-1; Wed, 27 Sep 2023 13:29:03 -0400
X-MC-Unique: pbE2HrAtOt6BIwm2_n4ooA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A72858032F6;
 Wed, 27 Sep 2023 17:29:02 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ACBBC154CA;
 Wed, 27 Sep 2023 17:28:59 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [RFC][PATCH v3 0/3] drm/panic: Add a drm panic handler
Date: Wed, 27 Sep 2023 19:22:49 +0200
Message-ID: <20230927172849.193996-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This introduces a new drm panic handler, which displays a message when a panic occurs.
So when fbcon is disabled, you can still see a kernel panic.

This is one of the missing feature, when disabling VT/fbcon in the kernel:
https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.

This is a proof of concept, and works only with simpledrm, using a new get_scanout_buffer() api

To test it, make sure you're using the simpledrm driver, and trigger a panic:
echo c > /proc/sysrq-trigger

v2:
 * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
 * Add the panic reason to the panic message (Nerdopolis)
 * Add an exclamation mark (Nerdopolis)
 
v3:
 * Rework the drawing functions, to write the pixels line by line and
 to use the drm conversion helper to support other formats.
 (Thomas Zimmermann)

I only added RGB565 support to show how it would work.
Basically I have a buffer of 1 line in xrgb8888, and write the pixels to it.
Then I convert it to the destination format in-place (if needed), and finally 
copy it to the scanout-buffer.
So it's straigh forward, and reuse the drm conversion helpers.

A few more though:
 1) what about gpu with multiple monitor connected ?
maybe get_scanout_buffer() could return a list of scanout buffers ?
 2) I think for some GPU drivers, there might need a flush_scanout_buffer() function, that should be called after the scanout buffer has been filled ?

Best regards,


Jocelyn Falempe (3):
  drm/format-helper: Export drm_fb_xrgb8888_to_rgb565_line
  drm/panic: Add a drm panic handler
  drm/simpledrm: Add drm_panic support

 drivers/gpu/drm/Kconfig             |  11 +
 drivers/gpu/drm/Makefile            |   1 +
 drivers/gpu/drm/drm_drv.c           |   3 +
 drivers/gpu/drm/drm_format_helper.c |   3 +-
 drivers/gpu/drm/drm_panic.c         | 366 ++++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/simpledrm.c    |  17 ++
 include/drm/drm_drv.h               |  14 ++
 include/drm/drm_format_helper.h     |   2 +
 include/drm/drm_panic.h             |  41 ++++
 9 files changed, 457 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h


base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
-- 
2.41.0

