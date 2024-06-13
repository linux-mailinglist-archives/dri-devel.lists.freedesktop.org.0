Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A7907709
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 17:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1193910EACF;
	Thu, 13 Jun 2024 15:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UUUhkQ88";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE7A10EACF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718293252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iCISzHO8qhMmTne4ENiL79S9gge7uKtgabydUnsGYdc=;
 b=UUUhkQ88xmS04yPVYs2McXk9x8rQvILb+E9Bl1x0uZaBxRXtygSmZ0FEJRqVuS3V16R/oA
 SBBE4flUYyMxL1WcmODoVvifX7seMjOuPf7MjU3Ml143gQ5BZ0rHr4vYjrRfXbj0OSbbYb
 wr6Nrg1RRknW6XOfcc3kT0xbfZ4lgVU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-0fnkbDlnOTeIvKOkLIt0Og-1; Thu,
 13 Jun 2024 11:40:51 -0400
X-MC-Unique: 0fnkbDlnOTeIvKOkLIt0Og-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B45AA19560AB; Thu, 13 Jun 2024 15:40:49 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.162])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B491F1955E91; Thu, 13 Jun 2024 15:40:46 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/panic: depends on !VT_CONSOLE
Date: Thu, 13 Jun 2024 17:40:16 +0200
Message-ID: <20240613154041.325964-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

The race condition between fbcon and drm_panic can only occurs if
VT_CONSOLE is set. So update drm_panic dependency accordingly.
This will make it easier for Linux distributions to enable drm_panic
by disabling VT_CONSOLE, and keeping fbcon terminal.
The only drawback is that fbcon won't display the boot kmsg, so it
should rely on userspace to do that.
At least plymouth already handle this case with
https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224

Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index a9df94291622..f5c989aed7e9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -107,7 +107,7 @@ config DRM_KMS_HELPER
 
 config DRM_PANIC
 	bool "Display a user-friendly message when a kernel panic occurs"
-	depends on DRM && !FRAMEBUFFER_CONSOLE
+	depends on DRM && !(FRAMEBUFFER_CONSOLE && VT_CONSOLE)
 	select DRM_KMS_HELPER
 	select FONT_SUPPORT
 	help

base-commit: 2bae076f3e35234e42bd7c90acd8caae8368ba90
-- 
2.45.1

