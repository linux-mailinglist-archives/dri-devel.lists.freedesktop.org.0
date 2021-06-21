Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 619283AE99F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF7489F06;
	Mon, 21 Jun 2021 13:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BC189F06;
 Mon, 21 Jun 2021 13:03:31 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id dm5so16300546ejc.9;
 Mon, 21 Jun 2021 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4p25a67hv/sYt/qONCDrOmoXp4la0F1iN+aDrKvwRL8=;
 b=Rd4UayQUe5dWMay6byaPSeqOtP95DbsJLw4WSFGk/fk0yWrsqZ0/t/Oyk3X53a+f3p
 obCmiA5Wzmu6tv0wT+/F9w3jsldvrqkOj+gkzwTVAAz3xN1505ev017+2iZlcszV7Xy4
 6NUJp/kQ9fKlrBkzH0bQGTy0BU0vh0iNRdJbPpbe21NzGv170N66YSd4CN2p9LyV6cH2
 vHkc7Y6SLuhVtFfCBsct4lWD1S6X1Yq+PDI/QkQHNqRr7XsZwJhm42Fs6QR/CMcewcsB
 /p7Uznyz0sca+65syH+Mel29MLoClxdYCNPYyuC+VC9aTrF1EcyYlRqV7za2oKAhsCK8
 O6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4p25a67hv/sYt/qONCDrOmoXp4la0F1iN+aDrKvwRL8=;
 b=s4PXa1AkXrVhUG4p7CSYOYSTK5cbPeePDMeJC9NDGXmwR7WZjnXWtoY+DbpOWiIHgU
 ARckFAKY8hIvfN0pBl1cxf7aBtKGmOkURn+ncWkrLiHkVq2eJH4NaFhKNgbkGKjsgFLO
 ZS3T7XJavVEL3IYoTDjt6OI+MiAhtu0Hx6SCwOjp2PYoBi4sI1aI0R1d1SBs+u+b7Kqp
 dErT6jUVEh26+fgmDCONaKIxd7/YxdOeBM4jHmmYPLAOlBhFQNk9X9T5Uh7STQ8h3YpF
 Cc1wyyfD2DOBTlvgxurFHPRGD9+a7uzxQJ5uFEeqtAHybbIgLsUNf+BY4Cafx5PIA5Jr
 MiUA==
X-Gm-Message-State: AOAM530j6gye8c+vgnSI2qYCiM+hnQycr6d//HRvBz8hNFdZYGiJuc4+
 ilLIyMibpn3XGsO3/ZBJ7fpny6VTT8g=
X-Google-Smtp-Source: ABdhPJxEa7d4/1EgRIKp9U0VFA7UCLamb5nKdt9865OW3nouO1X2sTRL8UDXS43qwSqQ1XOqhSnipA==
X-Received: by 2002:a17:907:7201:: with SMTP id
 dr1mr25038295ejc.19.1624280610372; 
 Mon, 21 Jun 2021 06:03:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bd92:da7:4d23:8910])
 by smtp.gmail.com with ESMTPSA id w10sm5322375edv.34.2021.06.21.06.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:03:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/radeon: wait for moving fence after pinning
Date: Mon, 21 Jun 2021 15:03:27 +0200
Message-Id: <20210621130328.11070-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621130328.11070-1-christian.koenig@amd.com>
References: <20210621130328.11070-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@kernel.org
---
 drivers/gpu/drm/radeon/radeon_prime.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index 42a87948e28c..4a90807351e7 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -77,9 +77,19 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
 
 	/* pin buffer into GTT */
 	ret = radeon_bo_pin(bo, RADEON_GEM_DOMAIN_GTT, NULL);
-	if (likely(ret == 0))
-		bo->prime_shared_count++;
-
+	if (unlikely(ret))
+		goto error;
+
+	if (bo->tbo.moving) {
+		ret = dma_fence_wait(bo->tbo.moving, false);
+		if (unlikely(ret)) {
+			radeon_bo_unpin(bo);
+			goto error;
+		}
+	}
+
+	bo->prime_shared_count++;
+error:
 	radeon_bo_unreserve(bo);
 	return ret;
 }
-- 
2.25.1

