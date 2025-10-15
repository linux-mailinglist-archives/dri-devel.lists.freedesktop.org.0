Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073EBDD8E9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1710E102;
	Wed, 15 Oct 2025 08:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hkdGxG1+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F5710E102
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760518679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4Al+vcUND1Ajs7LGCdp9zEqy1MvGg9aMNHO/XejgA98=;
 b=hkdGxG1+WF0DLUJGyebwPw0oa/RcXHtBYQxOyYKDdoscfQYaztBU00j1Lgbc0r33RxdJ9l
 Dr5/eN0BN/yE2RG4qQmfLqO2lDXz9LeghW3VOH2blEjalMU5NS00xEeeeHLMHJmtmSHZVJ
 6uK88q+7dL12nnfIFfi2xS7+9Tj29AI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-625-G6CJbBwFMnii1lzF0oR6TQ-1; Wed,
 15 Oct 2025 04:57:53 -0400
X-MC-Unique: G6CJbBwFMnii1lzF0oR6TQ-1
X-Mimecast-MFC-AGG-ID: G6CJbBwFMnii1lzF0oR6TQ_1760518672
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 19B10180035A; Wed, 15 Oct 2025 08:57:52 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.133])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E2C6B19560B0; Wed, 15 Oct 2025 08:57:48 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/panic: Add kunit tests for drm_panic
Date: Wed, 15 Oct 2025 10:51:41 +0200
Message-ID: <20251015085733.227684-1-jfalempe@redhat.com>
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

This series adds some kunit tests to drm_panic, and a debugfs interface to easily test the panic screen rendering at different resolutions/pixel format.

The kunit tests draws the panic screens to different framebuffer size and format, and ensure it doesn't crash or draw outside of the buffer.
However it doesn't check the resulting image, because it depends on other Kconfig options, like logo, fonts, or panic colors.

v2:
 * Use debugfs instead of sending the framebuffer through the kunit logs. (Thomas Zimmermann).
 * Add a few checks, and more comments in the kunit tests. (Maxime Ripard).

v3:
 * Check the framebuffer content in drm_test_panic_screen_user_page().
 * Fix memory leaks, when the test fails (Maxime Ripard).

Jocelyn Falempe (3):
  drm/panic: Rename draw_panic_static_* to draw_panic_screen_*
  drm/panic: Add kunit tests for drm_panic
  drm/panic: Add a drm_panic/draw_test in debugfs

 MAINTAINERS                            |   1 +
 drivers/gpu/drm/Kconfig                |   2 +
 drivers/gpu/drm/drm_panic.c            | 150 +++++++++++++++--
 drivers/gpu/drm/tests/drm_panic_test.c | 218 +++++++++++++++++++++++++
 4 files changed, 356 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c


base-commit: 8e944ab8196e421f20386f51c5ffc43baa145932
-- 
2.51.0

