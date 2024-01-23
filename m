Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF1838286
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 03:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921FC10F42C;
	Tue, 23 Jan 2024 02:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7F810F42C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 02:20:22 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-7RCL8IAjM8a5SQA6zX8sOQ-1; Mon, 22 Jan 2024 21:20:20 -0500
X-MC-Unique: 7RCL8IAjM8a5SQA6zX8sOQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFAAC185A780;
 Tue, 23 Jan 2024 02:20:19 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23754C0FDCA;
 Tue, 23 Jan 2024 02:20:17 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: pass a device into ttm init.
Date: Tue, 23 Jan 2024 12:20:15 +1000
Message-ID: <20240123022015.1288588-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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
Cc: Dave Airlie <airlied@redhat.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Steven Rostedt <rostedt@goodmis.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

ttm init was changed to look at numa node, but that needed a device.

Only qxl appears to not hand in a device, so just fix that.

Fixes: b0a7ce53d494 ("drm/ttm: Schedule delayed_delete worker closer")
Reported-by: Steven Rostedt <rostedt@goodmis.org>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 1a82629bce3f..1876419ea237 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -195,7 +195,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
 =09int num_io_pages; /* !=3D rom->num_io_pages, we include surface0 */
=20
 =09/* No others user of address space so set it to 0 */
-=09r =3D ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
+=09r =3D ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, qdev->ddev.dev,
 =09=09=09    qdev->ddev.anon_inode->i_mapping,
 =09=09=09    qdev->ddev.vma_offset_manager,
 =09=09=09    false, false);
--=20
2.43.0

