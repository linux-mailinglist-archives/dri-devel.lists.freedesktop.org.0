Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C523B9FA0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F626E14C;
	Fri,  2 Jul 2021 11:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740706E116
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:16:48 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id i20so15229621ejw.4
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 04:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5WMQmwGHbFSsJZWDXuAJvQZzGWBWH2W4bsFT3at8Zrc=;
 b=PD2UA12mJPkBkUa3lwwbC865phJeS+GpzwQc8F3qw390Ql6RX0tB/hQhve9o/BsX6M
 O5qK5KguUm2PYBNd1ZNL60FKqEbC7mLOQ5UZvM+Kce2ZN0vJD0ouDT71ZYTK4pFnLzzM
 HJWA7BLX0dJXet2tBrjsSUOUQxLmBVqtdM8V5Xthup5/svkzGwoCEry4ZdLA6i7yUdHg
 vlKje/p9EG7HmBL0BX3m35+yfQltle0Ub9mPA1sQq/QSqIc5ufUQnIsm7PtAdO1G+b8T
 LmUIBXiqHM9yCFPzutSMjchKZ4uyD7eKhZ8L0CNbooKE6lFf9zXrong29ucptU+Ckv+A
 RYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5WMQmwGHbFSsJZWDXuAJvQZzGWBWH2W4bsFT3at8Zrc=;
 b=q4y/wt3T7DQ+UEuvsONtLs4N3w52KEZOzmRNoEe2oAt9AGYzdEjALeM+i9NKoMKjPK
 ULFE/zJNQQ0Locq9MKHut4AkEBq1Caka4Ok3e6S9mKTTPHtjS8/qOnKdBV3l/g7uYp+F
 6Bp/Ika+sxU8L9hw/CfDPgjwujsG8Tq0ed4Tu2ewl8vMSHsPN9dCX1C16eWplGdWm9rj
 yCkkHNd+INt5RoinrRXkzRhjG8UopmqumsYSYOnPtivl1ZoTHh7ztXVZQXjOpj2WrZkw
 8j5AKvCoCsmk/IyaUROVWgUX1NfPsCKGidRjhFDNlt1v8EtzdHjCS4d4eahI/s6W6FTp
 ZD/Q==
X-Gm-Message-State: AOAM531o4gHhxrQkbRjK9ukOS0wv9SSOL9k40IxvHDfb/+sY0243YuwF
 H00DEzNQ6Urxuna04u7extVUx+Z3CqY=
X-Google-Smtp-Source: ABdhPJyXBENjMhcM3dGW/+8jFC58E7xornoyh30UcLyKPTroxIgQ4NpCtgaO0cJaXK4YlR4RnwL7cw==
X-Received: by 2002:a17:906:1486:: with SMTP id
 x6mr4795196ejc.69.1625224607138; 
 Fri, 02 Jul 2021 04:16:47 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9bc7:a922:a595:15bd])
 by smtp.gmail.com with ESMTPSA id g21sm937286ejf.25.2021.07.02.04.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 04:16:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 4/4] drm/msm: always wait for the exclusive fence
Date: Fri,  2 Jul 2021 13:16:42 +0200
Message-Id: <20210702111642.17259-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702111642.17259-1-christian.koenig@amd.com>
References: <20210702111642.17259-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Drivers also need to to sync to the exclusive fence when
a shared one is present.

Completely untested since the driver won't even compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index a94a43de95ef..72a07e311de3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -817,17 +817,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	struct dma_fence *fence;
 	int i, ret;
 
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_excl_fence(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
+	fence = dma_resv_excl_fence(obj->resv);
+	/* don't need to wait on our own fences, since ring is fifo */
+	if (fence && (fence->context != fctx->context)) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
 	}
 
+	fobj = dma_resv_shared_list(obj->resv);
 	if (!exclusive || !fobj)
 		return 0;
 
-- 
2.25.1

