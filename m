Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6416A4AA9AA
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 16:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CC410F587;
	Sat,  5 Feb 2022 15:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F3E10F582
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644074855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pjmtgD9hDbE2eSozwnUFT0OXCz+k5OPkUk+zbtWjpnw=;
 b=NAQOEHHkFIuQDliZ+7qz0nBN7mE2qEzGS0ZzondHgoBu/wieUa4HU2HmjwvXASr5vq/aZ/
 0W5KERL1yuwdVUhfhLMA6rs4ZlTYP3w+4oQhU0mVt+0eCdFlUPsg3gJt4oXYFLX5BLIjYo
 sWEB9oq6S0aJgyGF+HSuwiIkUXGpWak=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-hIfdHluXM3CwaZfJH_wSFQ-1; Sat, 05 Feb 2022 10:27:32 -0500
X-MC-Unique: hIfdHluXM3CwaZfJH_wSFQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d14-20020adfa34e000000b001e306be1ec8so781251wrb.17
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Feb 2022 07:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pjmtgD9hDbE2eSozwnUFT0OXCz+k5OPkUk+zbtWjpnw=;
 b=tZ3bxAb7PycpTJfI8bZrqp6SWNcQ9TpUmUNAGTdoSJx9sDcdRV5hJGzX0EcanTz3pm
 JX2wOQ4xv83xBr1UWkXrn+1czde9WoDGLxJiL/ejjJirA4wJJZokA0jvSpWoIGg/Xq5o
 S7BOmFuLvdXd0hskJ88mRf3HhbBqr1fwrR0MJq5TcVPmzCG1Q67n+0xLidn6l+SS/xMk
 ZQt7h8iZrPaqArTU4w0PRyYp6rxgCIC/2Jbw7dRFV3yQXdwBkLRw1zs/MypvtKexQ/eq
 FHJaQlBbhn5le18CHmgt+oh+VWwRzJauflCVzaN9xjZEQ0wLFHdD6GTpi+B4uy3dSCaR
 Q0CQ==
X-Gm-Message-State: AOAM531dy4GWsRHhi5IftJm9Oc6r1JMhITO53lpvLEfhFiDxvKjsODAK
 anUlOEijzlSAPB6HISxQFKhmZZmEqUuVpU4Xv9xtD+eJ55//FYwTSlxVE1qhxGUFvCDQ5FXjRHa
 Sh9aiqyPBTuca0OVN93HwlIwXTDnr
X-Received: by 2002:a5d:5052:: with SMTP id h18mr3552912wrt.350.1644074851204; 
 Sat, 05 Feb 2022 07:27:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDXyrn2KzxrERhgoIpos43hCirk58UMQ3nCsqWFJ5g7LBqTHNLGaT6w0HYpj+eI+7jWIu5gw==
X-Received: by 2002:a5d:5052:: with SMTP id h18mr3552891wrt.350.1644074850965; 
 Sat, 05 Feb 2022 07:27:30 -0800 (PST)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id j5sm4635019wrq.31.2022.02.05.07.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 07:27:30 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "drm/nouveau/pmu/gm200-: avoid touching PMU outside of
 DEVINIT/PREOS/ACR"
Date: Sat,  5 Feb 2022 16:27:28 +0100
Message-Id: <20220205152729.2609837-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 1d2271d2fb85e54bfc9630a6c30ac0feb9ffb983.

This fix actually causes regressions, which I could verify on my systems
as well. So let's revert it and figure out a proper fix for the original
problem.

Cc: Ben Skeggs <bskeggs@redhat.com>
Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/149
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/pmu/base.c    | 37 ++++++++-----------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
index 455e95a89259..24382875fb4f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
@@ -94,13 +94,20 @@ nvkm_pmu_fini(struct nvkm_subdev *subdev, bool suspend)
 	return 0;
 }
 
-static void
+static int
 nvkm_pmu_reset(struct nvkm_pmu *pmu)
 {
 	struct nvkm_device *device = pmu->subdev.device;
 
 	if (!pmu->func->enabled(pmu))
-		return;
+		return 0;
+
+	/* Inhibit interrupts, and wait for idle. */
+	nvkm_wr32(device, 0x10a014, 0x0000ffff);
+	nvkm_msec(device, 2000,
+		if (!nvkm_rd32(device, 0x10a04c))
+			break;
+	);
 
 	/* Reset. */
 	if (pmu->func->reset)
@@ -111,37 +118,25 @@ nvkm_pmu_reset(struct nvkm_pmu *pmu)
 		if (!(nvkm_rd32(device, 0x10a10c) & 0x00000006))
 			break;
 	);
+
+	return 0;
 }
 
 static int
 nvkm_pmu_preinit(struct nvkm_subdev *subdev)
 {
 	struct nvkm_pmu *pmu = nvkm_pmu(subdev);
-	nvkm_pmu_reset(pmu);
-	return 0;
+	return nvkm_pmu_reset(pmu);
 }
 
 static int
 nvkm_pmu_init(struct nvkm_subdev *subdev)
 {
 	struct nvkm_pmu *pmu = nvkm_pmu(subdev);
-	struct nvkm_device *device = pmu->subdev.device;
-
-	if (!pmu->func->init)
-		return 0;
-
-	if (pmu->func->enabled(pmu)) {
-		/* Inhibit interrupts, and wait for idle. */
-		nvkm_wr32(device, 0x10a014, 0x0000ffff);
-		nvkm_msec(device, 2000,
-			if (!nvkm_rd32(device, 0x10a04c))
-				break;
-		);
-
-		nvkm_pmu_reset(pmu);
-	}
-
-	return pmu->func->init(pmu);
+	int ret = nvkm_pmu_reset(pmu);
+	if (ret == 0 && pmu->func->init)
+		ret = pmu->func->init(pmu);
+	return ret;
 }
 
 static void *
-- 
2.34.1

