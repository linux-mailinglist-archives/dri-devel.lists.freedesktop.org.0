Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5D9EE256
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 10:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773CC10E0EB;
	Thu, 12 Dec 2024 09:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZrhC6KH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5913510E0EB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 09:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733994747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LzqRPciXYVZNr61lsEDxWhyTkYFjeUGoBdGD/quUZ+U=;
 b=ZrhC6KH0L4U+3SCdrWCnuEvuJWsUCcnESfW8HfeTQFRlZJXNzfFuiNEZm6UkvzqnmXJEfG
 CPPvJSHWR71OjwPY65wgyVYbc8ZGNLU+g6amJ/IbGE96J6Y4pHWO30g+/5dV8LRmr8zxxk
 Qdglaa2HtWYBWdb40JuAPl1kF5HHBYY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-148-gAuD937WN5GLG2-G_ZYUOQ-1; Thu,
 12 Dec 2024 04:12:24 -0500
X-MC-Unique: gAuD937WN5GLG2-G_ZYUOQ-1
X-Mimecast-MFC-AGG-ID: gAuD937WN5GLG2-G_ZYUOQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 384411955F65; Thu, 12 Dec 2024 09:12:21 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.39])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BF941195394B; Thu, 12 Dec 2024 09:12:15 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/client: Fix drm client endless Kconfig loop
Date: Thu, 12 Dec 2024 10:11:29 +0100
Message-ID: <20241212091153.1592096-1-jfalempe@redhat.com>
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

if DRM_CLIENT_SELECTION is enabled, and none of the client is, the
"Default DRM Client" choice is empty, and this makes Kconfig goes
into an infinite loop of:

  Default DRM Client
  choice[1-0?]: 0
  Default DRM Client
  choice[1-0?]: 0
  Default DRM Client
  choice[1-0?]: 0
  ....

So only allow the choice if at least one of the client is selected.

Fixes: f7b42442c4ac ("drm/log: Introduce a new boot logger to draw the kmsg on the screen")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/clients/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index c18decc90200..82a7d4e584dd 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -87,6 +87,7 @@ config DRM_CLIENT_LOG
 choice
 	prompt "Default DRM Client"
 	depends on DRM_CLIENT_SELECTION
+	depends on DRM_FBDEV_EMULATION || DRM_CLIENT_LOG
 	default DRM_CLIENT_DEFAULT_FBDEV
 	help
 	  Selects the default drm client.

base-commit: 19851fa2ba9824bede16f55234f63d9423897c3d
-- 
2.47.1

