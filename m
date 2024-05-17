Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF788C890E
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 17:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D19D10EF01;
	Fri, 17 May 2024 15:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U4AdhIyc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57D810EEFC
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715958668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEY4yfA2nrcficnoW70RxOxjDjqZ/CcSkbpT2H5Dg1I=;
 b=U4AdhIycyJdUQ5IzR3/hZ/vWp2J/8nq15bv39H+Xe1E7TY4eD9clMm/PoI1jMyzMptHVKM
 xEuVfxNCKF+G+GRTJMOJPRswvWeGAFvObBhLIBPdHJKEQrucVgXGQngtRH/IIRKKb7voDC
 jl9nbKp2I3n8F0xEIz6OF1jgyB94sMc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-2-7pYWrtOn-T1YAxFrKFDQ-1; Fri, 17 May 2024 11:11:05 -0400
X-MC-Unique: 2-7pYWrtOn-T1YAxFrKFDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD54A81227E;
 Fri, 17 May 2024 15:11:04 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D45AA491034;
 Fri, 17 May 2024 15:11:03 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 2/2] drm/mgag200: Add an option to disable Write-Combine
Date: Fri, 17 May 2024 17:09:58 +0200
Message-ID: <20240517151050.624797-3-jfalempe@redhat.com>
In-Reply-To: <20240517151050.624797-1-jfalempe@redhat.com>
References: <20240517151050.624797-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

Unfortunately, the G200 ioburst workaround doesn't work on some
servers like Dell poweredge XR11, XR5610, or HPE XL260. In this case
completely disabling WC is the only option to achieve low-latency.
So this adds a new Kconfig option to disable WC mapping of the G200.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/Kconfig       | 10 ++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200/Kconfig
index b28c5e4828f47..3096944a8f0ab 100644
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
+	  The VRAM of the G200 is mapped with Write-Combine to improve
+	  performances. This can interfere with real-time tasks; even if they
+	  are running on other CPU cores than the graphics output.
+	  Enable this option only if you run realtime tasks on a server with a
+	  Matrox G200.
\ No newline at end of file
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 3883f25ca4d8b..62080cf0f2da4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -146,12 +146,18 @@ int mgag200_device_preinit(struct mga_device *mdev)
 	}
 	mdev->vram_res = res;
 
+#if defined(CONFIG_DRM_MGAG200_DISABLE_WRITECOMBINE)
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

