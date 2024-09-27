Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36121988B54
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 22:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164B910ED1A;
	Fri, 27 Sep 2024 20:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cgrUPueo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B2610ED1A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727469611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yRSI0RXAYJUqZWDNqYmjtNLAHKeav7N5jvF/NFDhhMM=;
 b=cgrUPueoWa+qsXH5jNRo3U8f0tKX5yD29TmmAGTnE6aiqmJY0FE/GLLJhyXumnwrUpDKU4
 xbjTOdSmi+yZJNJ9MQbR2IMPvdCXPF8D3ATguZxrh319Nf1MyuTALoAYwgiYSo2DKIe4uV
 X65LboOCKX4ODyC2HvJtg8PNREbMg60=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-IDD_XYF6N_OKUqGWhIqPIw-1; Fri,
 27 Sep 2024 16:40:10 -0400
X-MC-Unique: IDD_XYF6N_OKUqGWhIqPIw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9D83C1934C81; Fri, 27 Sep 2024 20:40:08 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.32.36])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6C21219560A3; Fri, 27 Sep 2024 20:40:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: Stefan Agner <stefan@agner.ch>, Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/vblank: Require a driver register vblank support for 0 or
 all CRTCs
Date: Fri, 27 Sep 2024 16:39:47 -0400
Message-ID: <20240927203946.695934-2-lyude@redhat.com>
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

Currently, there's nothing actually stopping a driver from only registering
vblank support for some of it's CRTCs and not for others. As far as I can
tell, this isn't really defined behavior on the C side of things - as the
documentation explicitly mentions to not use drm_vblank_init() if you don't
have vblank support - since DRM then steps in and adds its own vblank
emulation implementation.

So, let's fix this edge case and check to make sure it's all or none.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: 3ed4351a83ca ("drm: Extract drm_vblank.[hc]")
Cc: Stefan Agner <stefan@agner.ch>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.13+
---
 drivers/gpu/drm/drm_vblank.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 94e45ed6869d0..4d00937e8ca2e 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -525,9 +525,19 @@ static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
  */
 int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 {
+	struct drm_crtc *crtc;
 	int ret;
 	unsigned int i;
 
+	// Confirm that the required vblank functions have been filled out for all CRTCS
+	drm_for_each_crtc(crtc, dev) {
+		if (!crtc->funcs->enable_vblank || !crtc->funcs->disable_vblank) {
+			drm_err(dev, "CRTC vblank functions not initialized for %s, abort\n",
+				crtc->name);
+			return -EINVAL;
+		}
+	}
+
 	spin_lock_init(&dev->vbl_lock);
 	spin_lock_init(&dev->vblank_time_lock);
 

base-commit: 22512c3ee0f47faab5def71c4453638923c62522
-- 
2.46.1

