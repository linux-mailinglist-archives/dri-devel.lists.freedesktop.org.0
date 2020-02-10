Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4319157390
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 12:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AA76E22E;
	Mon, 10 Feb 2020 11:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E986E200
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581334680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=2ZushtPj0Mf6FOFUwvlbWGwy1n8DO8RBRToVDjY41Ks=;
 b=AgKtBnK8yszwvl0J6YlHLu1qK2P9xNFtCiH55dfCvDto8UmtvpKCY6FS1i9x4laMz19Ls7
 koCvWag0ZF5vwmx2ds4/gjiUV8KWjSh7RrzpFyH84Qr9sahDVmw6Zj7FFTiwfJodGKv/bc
 ZN1EoE/19+6RslQjdGylHcWvD0jtwqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-2_OboHYZMlyNc_yP1VF34w-1; Mon, 10 Feb 2020 06:37:58 -0500
X-MC-Unique: 2_OboHYZMlyNc_yP1VF34w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B62477;
 Mon, 10 Feb 2020 11:37:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B29495D9C9;
 Mon, 10 Feb 2020 11:37:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 265949D1E; Mon, 10 Feb 2020 12:37:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/qxl: reorder calls in qxl_device_fini().
Date: Mon, 10 Feb 2020 12:37:51 +0100
Message-Id: <20200210113753.5614-2-kraxel@redhat.com>
In-Reply-To: <20200210113753.5614-1-kraxel@redhat.com>
References: <20200210113753.5614-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorder calls in qxl_device_fini().  Cleaning up gem & ttm
might trigger qxl commands, so we should do that before
releaseing command rings.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index bfc1631093e9..70b20ee4741a 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -299,12 +299,12 @@ void qxl_device_fini(struct qxl_device *qdev)
 {
 	qxl_bo_unref(&qdev->current_release_bo[0]);
 	qxl_bo_unref(&qdev->current_release_bo[1]);
-	flush_work(&qdev->gc_work);
-	qxl_ring_free(qdev->command_ring);
-	qxl_ring_free(qdev->cursor_ring);
-	qxl_ring_free(qdev->release_ring);
 	qxl_gem_fini(qdev);
 	qxl_bo_fini(qdev);
+	flush_work(&qdev->gc_work);
+	qxl_ring_free(qdev->command_ring);
+	qxl_ring_free(qdev->cursor_ring);
+	qxl_ring_free(qdev->release_ring);
 	io_mapping_free(qdev->surface_mapping);
 	io_mapping_free(qdev->vram_mapping);
 	iounmap(qdev->ram_header);
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
