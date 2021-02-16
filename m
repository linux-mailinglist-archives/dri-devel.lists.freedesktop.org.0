Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1B331C9DA
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 12:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36866E877;
	Tue, 16 Feb 2021 11:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77216E416
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613475450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LddbWRXDOdoIRx26pBviJhLeOTNZA/vNgqOHA0L1BFU=;
 b=hGS64kua1FJlsUU7JKuz0ACST+iiCAILMEwmX0RCzKmi9CRlsOOtvcE1QNomt3MUMXjAIn
 4oXCk45dc2nprGgKlCXkENI3xtUcrEDgdljKiE8WMftqHhxaE4vFW9JPPcPtcZ9ZqtReU3
 8bur0oeOtU/guSlxzKpvjdSI5dLm1QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-f_YqtW_wO-iKbDjaR3aryA-1; Tue, 16 Feb 2021 06:37:27 -0500
X-MC-Unique: f_YqtW_wO-iKbDjaR3aryA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6713835E22;
 Tue, 16 Feb 2021 11:37:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D3EA5B698;
 Tue, 16 Feb 2021 11:37:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A492A1800870; Tue, 16 Feb 2021 12:37:18 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] drm/qxl: add lock asserts to qxl_bo_kmap_locked +
 qxl_bo_kunmap_locked
Date: Tue, 16 Feb 2021 12:37:16 +0100
Message-Id: <20210216113716.716996-11-kraxel@redhat.com>
In-Reply-To: <20210216113716.716996-1-kraxel@redhat.com>
References: <20210216113716.716996-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Try avoid re-introducing locking bugs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_object.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 22748b9566af..90d5e5b7f927 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -162,6 +162,8 @@ int qxl_bo_kmap_locked(struct qxl_bo *bo, struct dma_buf_map *map)
 {
 	int r;
 
+	dma_resv_assert_held(bo->tbo.base.resv);
+
 	if (bo->kptr) {
 		bo->map_count++;
 		goto out;
@@ -236,6 +238,8 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
 
 void qxl_bo_kunmap_locked(struct qxl_bo *bo)
 {
+	dma_resv_assert_held(bo->tbo.base.resv);
+
 	if (bo->kptr == NULL)
 		return;
 	bo->map_count--;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
