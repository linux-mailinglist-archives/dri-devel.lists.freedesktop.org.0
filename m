Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005E77BBFE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 16:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8050310E21E;
	Mon, 14 Aug 2023 14:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9E910E219
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692024578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lLr1fKQOmjiaD4LHyCW/7ka5sjk7zv0No4ICWghVhgc=;
 b=KI7unKWdFqfYTJWMolbMq6dy5VbFQJyN/0e9YjB/BfHxTxnJdbEZwExK/r5FWax1OdmgdD
 xTSJchDpSKYP+Tm1rGlQaONrs+y6fWYOwpQsCB6nxAxGZc2cWnyb5pK1dq+uZGY6eLzFlR
 HpbNxCD96cV7qsXX1y6+OnrdLSboJQI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44--AMP35jfMjOomsd1JIjsHw-1; Mon, 14 Aug 2023 10:49:36 -0400
X-MC-Unique: -AMP35jfMjOomsd1JIjsHw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fe4f8a557dso11724375e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 07:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692024575; x=1692629375;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lLr1fKQOmjiaD4LHyCW/7ka5sjk7zv0No4ICWghVhgc=;
 b=WGHPoMZEQ0MY+8d8q/NK6sB14UdBaApsQxbCbDZJ7V35wfQk3SAf1pyRAzZqdlS1/1
 FzY3036aYKRUhyRs08lHlwg+gRVpVllM8RbljUtcDkX847tnTgqdHMIQXExCbMGDdy0C
 SJfInmRYhWozQSR7b4m3iD1jJLEWdAHwJns82S1T376sT1dRMwRyFmmPKCKFzBBS6vUJ
 /zoQkA31D6/tFV3cqNVa/s9QqKh0tYggU7a35i0sqgyy7Mw3IdMMVfn5IMsqn6UwwgPg
 pcnWxJ073Y9kNvhVe8QUbHnYo1MKDyni7SIJ0Zk77+Gx8HMFOqJTqp4TvXkP2hURNrjq
 2VLg==
X-Gm-Message-State: AOJu0YxtuqSNw+BVXBfx35jlPaPO5t6eSJlnxz7Zs3RRf4zePokyCegZ
 X7aKt+BW3zOFPhhAbCij9ecOnP4diddMmwH0uXIRr20vjD6toDjr5CSPGp1L+bC+ezGua73Taog
 HsP0dsfcPBxRuzcdf8BYQX9Yni7TR
X-Received: by 2002:a05:600c:5111:b0:3fe:5228:b78c with SMTP id
 o17-20020a05600c511100b003fe5228b78cmr9591555wms.1.1692024575518; 
 Mon, 14 Aug 2023 07:49:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1tdiW9HZTOV/fGkyYi3rJqI/IoMOtWccUH8Xg17/48IA+MNHERlSrq0NBJk1Sk2qPt4rsUA==
X-Received: by 2002:a05:600c:5111:b0:3fe:5228:b78c with SMTP id
 o17-20020a05600c511100b003fe5228b78cmr9591538wms.1.1692024575076; 
 Mon, 14 Aug 2023 07:49:35 -0700 (PDT)
Received: from kherbst.pingu.com ([31.17.16.107])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c210a00b003fc02e8ea68sm17373094wml.13.2023.08.14.07.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 07:49:34 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/disp: fix use-after-free in error handling of
 nouveau_connector_create
Date: Mon, 14 Aug 2023 16:49:32 +0200
Message-ID: <20230814144933.3956959-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can't simply free the connector after calling drm_connector_init on it.
We need to clean up the drm side first.

It might not fix all regressions from 2b5d1c29f6c4 ("drm/nouveau/disp:
PIOR DP uses GPIO for HPD, not PMGR AUX interrupts"), but at least it
fixes a memory corruption in error handling related to that commit.

Link: https://lore.kernel.org/lkml/20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local/
Fixes: 95983aea8003 ("drm/nouveau/disp: add connector class")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index a2e0033e8a260..622f6eb9a8bfd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1408,8 +1408,7 @@ nouveau_connector_create(struct drm_device *dev,
 		ret = nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_connector->index,
 				     &nv_connector->conn);
 		if (ret) {
-			kfree(nv_connector);
-			return ERR_PTR(ret);
+			goto drm_conn_err;
 		}
 
 		ret = nvif_conn_event_ctor(&nv_connector->conn, "kmsHotplug",
@@ -1426,8 +1425,7 @@ nouveau_connector_create(struct drm_device *dev,
 			if (ret) {
 				nvif_event_dtor(&nv_connector->hpd);
 				nvif_conn_dtor(&nv_connector->conn);
-				kfree(nv_connector);
-				return ERR_PTR(ret);
+				goto drm_conn_err;
 			}
 		}
 	}
@@ -1475,4 +1473,9 @@ nouveau_connector_create(struct drm_device *dev,
 
 	drm_connector_register(connector);
 	return connector;
+
+drm_conn_err:
+	drm_connector_cleanup(connector);
+	kfree(nv_connector);
+	return ERR_PTR(ret);
 }
-- 
2.41.0

