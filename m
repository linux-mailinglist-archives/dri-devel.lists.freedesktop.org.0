Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D13B0318
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 13:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FCB6E4A7;
	Tue, 22 Jun 2021 11:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722A86E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 11:45:09 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h17so13289779edw.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wnx8lDVkb1xvEHags0MQZ4JbyyaNbM2v7qeWypbjyqE=;
 b=t9G3r+on89JBtj4GRpljcwpLlZ7X01+QfRnoCmeHPSEMTKjGoHjcp/enp1iM877I9y
 tCXwanTd7X9rJxqv+JlslB6AqOkXY299UrGHT5HPDA84V6J8X9MuhJURWFHlrpUc7k9b
 hCtMXtG9kwMFrb9wZ1wa/IWg6km/GzVxAmzAhdxyTHz3ZK10mpI8JMaz8mp8TtRxZQYP
 ttay/Y7i9/kA49S5rZZDz6WNFnfUAuHWlvqJ76BgCtnjNx4g7SIGgKemF29L7Y0ESJPd
 QZvrNmI1vRDc7SqgkSpEyEZnU2/LeGWZiMuMUcJ3bSktSEssKe+IrcXBJQRLosbdQIwv
 3o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wnx8lDVkb1xvEHags0MQZ4JbyyaNbM2v7qeWypbjyqE=;
 b=gIrI+s+rpooItSS2xAhScDVYsv+LObnnCcaWVDF4gA8ESIF4yhqoiEjkuAlIGHgYKl
 w89Uwc86yQoDwptbbnSYoszb6yruIrmIFq7qhmFyHBpTUi8O1FjQFRWEUF4rjN/E0ndp
 tcMZPeT/oQOYyr7YNh6pfEKrskA31xxDOQuKSyBNk/Jyv98hRUBERMwAXI8qOZ9YaBxr
 1YpEYE9dFdpG7cE+h4om4wPHX/LrOFk2uFAnjvBGMuQodurV9RD0pJ0oTAxtG1yeo8z2
 6N2Xmuxqq70uZ7tOkgkYmXJq/ceh7ax7N7G52cqCcHBUiwrWhfDHjtVinE7wwErcEU+l
 xRwg==
X-Gm-Message-State: AOAM532lXoI7y88oVT2joY9gHjHcDJgWNB9dY9qAPZZ8T+ovn3K8o2Ol
 kgYZkIC/QWdprjrMnHOx/K4BRhp/ytU=
X-Google-Smtp-Source: ABdhPJyVCOCLrf/H4Vg3QuQ723B3R+S22MlmxbxGgoGiD6f7uZUttNDewURQ7D88tS+FWQBQwcTg/Q==
X-Received: by 2002:aa7:d9d3:: with SMTP id v19mr4374076eds.145.1624362308199; 
 Tue, 22 Jun 2021 04:45:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:19f5:e310:467b:783d])
 by smtp.gmail.com with ESMTPSA id hg25sm5939086ejc.51.2021.06.22.04.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 04:45:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 1/3] drm/nouveau: wait for moving fence after pinning v2
Date: Tue, 22 Jun 2021 13:45:04 +0200
Message-Id: <20210622114506.106349-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

We actually need to wait for the moving fence after pinning
the BO to make sure that the pin is completed.

v2: grab the lock while waiting

Signed-off-by: Christian König <christian.koenig@amd.com>
References: https://lore.kernel.org/dri-devel/20210621151758.2347474-1-daniel.vetter@ffwll.ch/
CC: stable@kernel.org
---
 drivers/gpu/drm/nouveau/nouveau_prime.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 347488685f74..60019d0532fc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -93,7 +93,22 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 	if (ret)
 		return -EINVAL;
 
-	return 0;
+	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
+	if (ret)
+		goto error;
+
+	if (nvbo->bo.moving)
+		ret = dma_fence_wait(nvbo->bo.moving, true);
+
+	ttm_bo_unreserve(&nvbo->bo);
+	if (ret)
+		goto error;
+
+	return ret;
+
+error:
+	nouveau_bo_unpin(nvbo);
+	return ret;
 }
 
 void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
-- 
2.25.1

