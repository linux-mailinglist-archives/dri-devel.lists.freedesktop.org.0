Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DE0B2F49C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB19310E904;
	Thu, 21 Aug 2025 09:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WAR2WjfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8435210E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755769962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5DmFAfFp7XkR2n6BZE4f39nm4ulY11AUKH7TKucR7yY=;
 b=WAR2WjfH6NamdbMH5iCwWgiX6hZLjJ4xSpaJysAu4y0gcuJgrkbQQS0antvtaeJlBA4bNL
 M/BwshgHFxwfr97VUcaZpC+hU0jMfgRsjM9qxPqvuOzvY3SyFpD32szYsoq2gGWDTs7p9l
 UuuHcbUubgYD8Na7bAn+c3LuNL2zjfc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-372-4q1CKKF9PESK6UVgb6UTsA-1; Thu,
 21 Aug 2025 05:52:37 -0400
X-MC-Unique: 4q1CKKF9PESK6UVgb6UTsA-1
X-Mimecast-MFC-AGG-ID: 4q1CKKF9PESK6UVgb6UTsA_1755769956
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CC17019560B0; Thu, 21 Aug 2025 09:52:35 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.33.118])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 82BE8197768C; Thu, 21 Aug 2025 09:52:32 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/panic: Add kunit tests for drm_panic
Date: Thu, 21 Aug 2025 11:49:04 +0200
Message-ID: <20250821095228.648156-1-jfalempe@redhat.com>
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

This series adds some kunit tests to drm_panic.

This tests draws the panic screens to different framebuffer size and
format, and ensure it doesn't crash or draw outside of the buffer.
However it doesn't check the resulting image, because it depends on
other Kconfig options, like logo, fonts, or panic colors.

The last patch is optional and a bit hacky.
It allows to dump the generated images to the logs, and then a python
script can convert it to .png files. It makes it handy to check how
the panic screen will look on different resolutions, without having
to crash a VM.
To not pollute the logs, it uses a monochrome framebuffer, compress
it with zlib, and base64 encode it.

Jocelyn Falempe (3):
  drm/panic: Rename draw_panic_static_* to draw_panic_screen_*
  drm/panic: Add kunit tests for drm_panic
  drm/panic: Add a kconfig option to dump kunits results to png

 MAINTAINERS                            |   1 +
 drivers/gpu/drm/Kconfig.debug          |  14 ++
 drivers/gpu/drm/drm_panic.c            |  33 +--
 drivers/gpu/drm/tests/drm_panic_test.c | 275 +++++++++++++++++++++++++
 scripts/kunitpanic2png.py              |  53 +++++
 5 files changed, 361 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c
 create mode 100755 scripts/kunitpanic2png.py


base-commit: 043d9c6928b010be7902a01b5cdfa7d754535b1a
-- 
2.50.1

