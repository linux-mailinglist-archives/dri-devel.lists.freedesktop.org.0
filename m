Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870487768AE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 21:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689C710E0F1;
	Wed,  9 Aug 2023 19:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27F110E0EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 19:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691609144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r2gKgWtVl62Ey761SAZIvYll9bt5HZQ30nZNnIuOJtI=;
 b=UjzJif9q4AOiEphnlUOp7rJf9UuUMy9g3ReABCcuS3Kt91pb0102st6zK676opvfmRj776
 vbShRI0OE+3+LEYXaMwEIm5CxQKeD06RU8B7YddlPVW20AHvFasb5p6zTfKfcVfkF91DXq
 8JFbIcU/4ivixQ2R5NYbvT8oyI3Fnec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-yBmRVbIvPxiJimvoR-Uheg-1; Wed, 09 Aug 2023 15:25:38 -0400
X-MC-Unique: yBmRVbIvPxiJimvoR-Uheg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58A6985CBE2;
 Wed,  9 Aug 2023 19:25:38 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8A67492C13;
 Wed,  9 Aug 2023 19:25:36 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [RFC][PATCH 0/2] drm/panic: Add a drm panic handler
Date: Wed,  9 Aug 2023 21:17:27 +0200
Message-ID: <20230809192514.158062-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This introduces a new drm panic handler, which displays a message when a panic occurs.
So when fbcon is disabled, you can still see a kernel panic.

This is one of the missing feature, when disabling VT/fbcon in the kernel:
https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.

This is a proof of concept, and works only with simpledrm, using the drm_client API.
This implementation with the drm client API, allocates new framebuffers, and looks a bit too complex to run in a panic handler.
Maybe we should add an API to "steal" the current framebuffer instead, because in a panic handler user-space is already stopped.

To test it, make sure you're using the simpledrm driver, and trigger a panic:
echo c > /proc/sysrq-trigger

There is one thing I don't know how to do, is to unregister the drm_panic when the graphic driver is unloaded.
drm_client_register() says it will automatically unregister on driver unload. But then I don't know how to remove it from my linked list, and free the drm_client_dev struct.

This is a first draft, so let me know what do you think about it.

Best regards,




Jocelyn Falempe (2):
  drm/panic: Add a drm panic handler
  drm/simpledrm: Add drm_panic support

 drivers/gpu/drm/Kconfig          |  11 ++
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/drm_drv.c        |   3 +
 drivers/gpu/drm/drm_panic.c      | 286 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/simpledrm.c |   2 +
 include/drm/drm_panic.h          |  26 +++
 6 files changed, 329 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h


base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
-- 
2.41.0

