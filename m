Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31069B487B7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF29A10E49D;
	Mon,  8 Sep 2025 09:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NLNdEks9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4769C10E49D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 09:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757322232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=E1L27fu/GuWlv6Jzyt75q3LH9kLQjRWe7G+gC8fIBX4=;
 b=NLNdEks9CzJamgEyoVJsaNMriGMcoDtqAbszRJN3Al3bGFIa1u0cycyhIwKJJE/buRrS3R
 mSRxnEhezWiXV+hx2tKRD3kHfbz0TEmzkd3pa6aIiVR5mPgZJFimRkdQfPgSc2TIebj+cl
 49+fIcVQUXKvYGPD1Qazrq952wWlhIA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-0v0PWv-7ODCbfY6WCWtdgw-1; Mon,
 08 Sep 2025 05:03:51 -0400
X-MC-Unique: 0v0PWv-7ODCbfY6WCWtdgw-1
X-Mimecast-MFC-AGG-ID: 0v0PWv-7ODCbfY6WCWtdgw_1757322230
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C5ACA19560A7; Mon,  8 Sep 2025 09:03:49 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.33.69])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 67B851800452; Mon,  8 Sep 2025 09:03:45 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/panic: Add kunit tests for drm_panic
Date: Mon,  8 Sep 2025 11:00:28 +0200
Message-ID: <20250908090341.762049-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

Jocelyn Falempe (3):
  drm/panic: Rename draw_panic_static_* to draw_panic_screen_*
  drm/panic: Add kunit tests for drm_panic
  drm/panic: Add a drm_panic/draw_test in debugfs

 MAINTAINERS                            |   1 +
 drivers/gpu/drm/Kconfig                |   2 +
 drivers/gpu/drm/drm_panic.c            | 150 +++++++++++++++++--
 drivers/gpu/drm/tests/drm_panic_test.c | 198 +++++++++++++++++++++++++
 4 files changed, 336 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c


base-commit: 685e8dae19df73d5400734ee5ad9e96470f9c0b4
-- 
2.51.0

