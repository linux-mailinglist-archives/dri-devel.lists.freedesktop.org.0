Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C8930F591
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 15:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063B16EDB9;
	Thu,  4 Feb 2021 14:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3B76EDA6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612450641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1oIZf7f/oo6PVRncKORJAVfkEWNMyNF7ALcrFfX4auY=;
 b=SkD/ZAyy7A9Ij5uTU3rnoe1cUwRtSA1hQno/DKv8AHIvag/Ldc1YTqaV4BeXsc/M7HdGNh
 CfHpZ++6Z06Up6T18c4lhzZn3OWYxN+fJhnxNw8+VTSqdAyB6nFlaNe5uH7I6mCVM4jLeO
 ICp0T5RpY85EA1n4A6Y8/3TFjte2Vag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-HDIoRp0sOXSDapPAloOOkw-1; Thu, 04 Feb 2021 09:57:19 -0500
X-MC-Unique: HDIoRp0sOXSDapPAloOOkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B5AC801960;
 Thu,  4 Feb 2021 14:57:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0421760C15;
 Thu,  4 Feb 2021 14:57:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 69894180101F; Thu,  4 Feb 2021 15:57:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/10] drm/qxl: use drmm_mode_config_init
Date: Thu,  4 Feb 2021 15:57:04 +0100
Message-Id: <20210204145712.1531203-4-kraxel@redhat.com>
In-Reply-To: <20210204145712.1531203-1-kraxel@redhat.com>
References: <20210204145712.1531203-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 012bce0cdb65..38d6b596094d 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1195,7 +1195,9 @@ int qxl_modeset_init(struct qxl_device *qdev)
 	int i;
 	int ret;
 
-	drm_mode_config_init(&qdev->ddev);
+	ret = drmm_mode_config_init(&qdev->ddev);
+	if (ret)
+		return ret;
 
 	ret = qxl_create_monitors_object(qdev);
 	if (ret)
@@ -1228,5 +1230,4 @@ int qxl_modeset_init(struct qxl_device *qdev)
 void qxl_modeset_fini(struct qxl_device *qdev)
 {
 	qxl_destroy_monitors_object(qdev);
-	drm_mode_config_cleanup(&qdev->ddev);
 }
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
