Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18066CC1887
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5890410E772;
	Tue, 16 Dec 2025 08:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NmprSLvW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359A310E772
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765873547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mI0vKOCPWPHjewJMSoLhgC3xnRJuy70Zi8RIvmWLjmw=;
 b=NmprSLvWW9rklf8Qrwh0KaFm6vJA2Hf/lfxo83FEO9skuHEKqrV1tb50Hd7DsxoQkjiwd+
 RXfnzQDms39K/qig/HbUZVnZY9Sguk/+8No2MQ1lwc5PxOCxU5UeKeu/kgRMKa2ModhVTg
 e1eyWS/jZ600p0EqUxJ+/78JPMlD1Xc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-546-TNoInskoOKCEbjmjWJ5_iA-1; Tue,
 16 Dec 2025 03:25:44 -0500
X-MC-Unique: TNoInskoOKCEbjmjWJ5_iA-1
X-Mimecast-MFC-AGG-ID: TNoInskoOKCEbjmjWJ5_iA_1765873543
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D7C561800342; Tue, 16 Dec 2025 08:25:42 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.224.146])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CAD5C18004D8; Tue, 16 Dec 2025 08:25:39 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/2] drm/panic: Add kunit tests for drm_panic
Date: Tue, 16 Dec 2025 09:20:37 +0100
Message-ID: <20251216082524.115980-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

v4:
 * Run QR code test only if QR code panic screen is built.
 * Drop the last patch to add a draw_test debugfs.

Jocelyn Falempe (2):
  drm/panic: Rename draw_panic_static_* to draw_panic_screen_*
  drm/panic: Add kunit tests for drm_panic

 MAINTAINERS                            |   1 +
 drivers/gpu/drm/drm_panic.c            |  22 ++-
 drivers/gpu/drm/tests/drm_panic_test.c | 220 +++++++++++++++++++++++++
 3 files changed, 234 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/tests/drm_panic_test.c


base-commit: 20de1b0080b9889094d703927871da8f21fb624e
-- 
2.52.0

