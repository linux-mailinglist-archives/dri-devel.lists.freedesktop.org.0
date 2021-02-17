Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB29E31D98C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 13:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AC76E528;
	Wed, 17 Feb 2021 12:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F076E50E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613565147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PyW7/aPT/CmxAFFjwwcxZ8Yi1YDWx8y+ATOQUU199Ts=;
 b=eZkNdaVaP3o+jWCZ5b1EvshL96KwqkuArojFlh5kGhui9lA7xs7wVAd3rnGSF+8KBhsZV5
 sjZPKC+VqJNfBsipXrB7PwAsWtZ6ahvREjWNt+cKwppJx07fxIFVYeFnW2tEI5KBKNsH6e
 DUOT4HSTEfxvLh+it5vCZTBxXQ2/qGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-YbH5p-s2MeqaL7ox8w8tjg-1; Wed, 17 Feb 2021 07:32:24 -0500
X-MC-Unique: YbH5p-s2MeqaL7ox8w8tjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4653874982;
 Wed, 17 Feb 2021 12:32:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAE4060C5F;
 Wed, 17 Feb 2021 12:32:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CAF5A18003BC; Wed, 17 Feb 2021 13:32:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/11] drm/qxl: fix monitors object vmap
Date: Wed, 17 Feb 2021 13:32:10 +0100
Message-Id: <20210217123213.2199186-9-kraxel@redhat.com>
In-Reply-To: <20210217123213.2199186-1-kraxel@redhat.com>
References: <20210217123213.2199186-1-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the correct vmap variant.  We don't hold a reservation here,
so we can't use the _locked variant.  We can drop the pin because
qxl_bo_vmap will do that for us.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index bfcc93089a94..f106da917863 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1159,12 +1159,10 @@ int qxl_create_monitors_object(struct qxl_device *qdev)
 	}
 	qdev->monitors_config_bo = gem_to_qxl_bo(gobj);
 
-	ret = qxl_bo_pin(qdev->monitors_config_bo);
+	ret = qxl_bo_vmap(qdev->monitors_config_bo, &map);
 	if (ret)
 		return ret;
 
-	qxl_bo_vmap_locked(qdev->monitors_config_bo, &map);
-
 	qdev->monitors_config = qdev->monitors_config_bo->kptr;
 	qdev->ram_header->monitors_config =
 		qxl_bo_physical_address(qdev, qdev->monitors_config_bo, 0);
@@ -1189,8 +1187,7 @@ int qxl_destroy_monitors_object(struct qxl_device *qdev)
 	qdev->monitors_config = NULL;
 	qdev->ram_header->monitors_config = 0;
 
-	qxl_bo_vunmap_locked(qdev->monitors_config_bo);
-	ret = qxl_bo_unpin(qdev->monitors_config_bo);
+	ret = qxl_bo_vunmap(qdev->monitors_config_bo);
 	if (ret)
 		return ret;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
