Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0A68C7A29
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 18:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9630E10E1F5;
	Thu, 16 May 2024 16:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="USiiBaaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2567510E087
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715876284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWaeVOfwE0fr39xqL//c2f0kx8ZFG7CtxouQHfFiX54=;
 b=USiiBaaZTBgzOCouGSe2B1Kx00MPURcfMaMTe+wtqJZAOGxhzV4Q3bAYGP8iScCbf2aHeR
 KAP2jXUBECIKmlzG2L/0LOrdJk2oMXYF8DCWLh+mCI7Qu7eXXyaEJZsFyVbgzsepEqDUAI
 8IWoaEPdKxvTIhV5hvfl/cL44Vh2ZW0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-z21-8vc6OtqadHJjsqImhQ-1; Thu,
 16 May 2024 12:18:01 -0400
X-MC-Unique: z21-8vc6OtqadHJjsqImhQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7198B29AB3FB;
 Thu, 16 May 2024 16:18:01 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6637EC15BB1;
 Thu, 16 May 2024 16:18:00 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 2/2] drm/mgag200: Add an option to disable Write-Combine
Date: Thu, 16 May 2024 18:17:10 +0200
Message-ID: <20240516161751.479558-3-jfalempe@redhat.com>
In-Reply-To: <20240516161751.479558-1-jfalempe@redhat.com>
References: <20240516161751.479558-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Unfortunately, the G200 ioburst workaround doesn't work on some servers
like Dell poweredge XR11, XR5610, or HPE XL260
In this case completely disabling WC is the only option to achieve
low-latency.
So this adds a new Kconfig option, to disable WC mapping of the G200

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/Kconfig       | 10 ++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index b28c5e4828f47..73ab5730b74d9 100644
--- a/drivers/gpu/drm/mgag200/Kconfig
+++ b/drivers/gpu/drm/mgag200/Kconfig
@@ -11,3 +11,13 @@ config DRM_MGAG200
 	 MGA G200 desktop chips and the server variants. It requires 0.3.0
 	 of the modesetting userspace driver, and a version of mga driver
 	 that will fail on KMS enabled devices.
+
+config DRM_MGAG200_DISABLE_WRITECOMBINE
+	bool "Disable Write Combine mapping of VRAM"
+	depends on DRM_MGAG200 && PREEMPT_RT
+	help
+	  The VRAM of the G200 is mapped with Write-Combine, to improve
+	  performances. However this increases the system latency a lot, even
+	  for realtime tasks running on other CPU cores. Typically 40us-80us
+	  latencies are measured with hwlat when Write Combine is enabled.
+	  Recommended if you run realtime tasks on a server with a Matrox G200.
\ No newline at end of file
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 3883f25ca4d8b..7461e3f984eff 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -146,12 +146,19 @@ int mgag200_device_preinit(struct mga_device *mdev)
 	}
 	mdev->vram_res = res;
 
+#if defined(CONFIG_DRM_MGAG200_DISABLE_WRITECOMBINE)
+	drm_info(dev, "Disable Write Combine\n");
+	mdev->vram = devm_ioremap(dev->dev, res->start, resource_size(res));
+	if (!mdev->vram)
+		return -ENOMEM;
+#else
 	mdev->vram = devm_ioremap_wc(dev->dev, res->start, resource_size(res));
 	if (!mdev->vram)
 		return -ENOMEM;
 
 	/* Don't fail on errors, but performance might be reduced. */
 	devm_arch_phys_wc_add(dev->dev, res->start, resource_size(res));
+#endif
 
 	return 0;
 }
-- 
2.45.0

