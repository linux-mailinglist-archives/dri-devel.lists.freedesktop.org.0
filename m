Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA32A3B0319
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 13:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435E66E4AA;
	Tue, 22 Jun 2021 11:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0796E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 11:45:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id d7so23287580edx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 04:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0+CEPVf1HFOauapw66dGMiJ3ncGrsuSRV3Yn5C0OAWw=;
 b=e7MCQMvFouq9v1F57lrRMDZNcqBkpV2r+Xq/Lm7bMzsRRPTRsVubJ4ewQnlnfITyOt
 dqIEpxLDcc/z0/MQAXvKlgQaNFa6m0cQ+VuT6HyDrVkk7VdNOSC4qsFZVOjZ8Dy1FkO1
 +jOdXg9os4tQzgnBCjyodn3lf7ftveQ/neFXTijsE+HWGKf1EuQEC3zwtjx2Qv/DyCZx
 9M3SiWzBKR8FK7OGh5bJkPZrdKtu5g9KH9pX492dA7DFJUwEpDyoi1AMRrk0b4zyLjE8
 xAWRhnyOkJq8f47rrywsA88GWXEipZYKuP8ovBXp0szOnmlpy5rzSg44k1IzOowWmOQa
 De4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+CEPVf1HFOauapw66dGMiJ3ncGrsuSRV3Yn5C0OAWw=;
 b=AfktzK750pEIImXly8Pm5nGdpZbgxAt07dlicZqLmD2G717t/v108PDwISr5+/3DUW
 LbAVe8NRPgBMSLvdGdvGnYW+eQ6vf/viqj1566aUA0ZQ/aj6QaIo/7OddtfSN732CuDS
 0Nx7TCmC4xx99Bd3FX/Lzjr7rFVr/orO4iBdXRZowWDiL5oGXTbvAHw7YEja9uBWtEq2
 X0iBO9mJYpUyrMWWJ5DGJ30uy8IdHi6yyq+WgN7mtIRMuRdc7ZHRNuNqKXnbAGjq5sHX
 byj3i7URNoytebQW/vQfAVK5U0mbgfn2BcUEI4/9N+8f1sqxzDK0M5C8Rs/tTjMNsmhM
 /x8Q==
X-Gm-Message-State: AOAM530ulX8lNTMeoAYAX5M/v4RRJit4PpUuGcAMFT0CEo0fAqbjhwB9
 R/8AshcQrGnuLugvgwUWFeZ9thqZWOY=
X-Google-Smtp-Source: ABdhPJxYBDHU9bCdx2FR87JQlylphdwaaVltc/U46MIkHJwRg9cs4p8ChAymIzYm1vBjtqvGGZbgLg==
X-Received: by 2002:a50:fd1a:: with SMTP id i26mr4267859eds.181.1624362308941; 
 Tue, 22 Jun 2021 04:45:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:19f5:e310:467b:783d])
 by smtp.gmail.com with ESMTPSA id hg25sm5939086ejc.51.2021.06.22.04.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 04:45:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 2/3] drm/radeon: wait for moving fence after pinning
Date: Tue, 22 Jun 2021 13:45:05 +0200
Message-Id: <20210622114506.106349-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622114506.106349-1-christian.koenig@amd.com>
References: <20210622114506.106349-1-christian.koenig@amd.com>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
References: https://lore.kernel.org/dri-devel/20210621151758.2347474-1-daniel.vetter@ffwll.ch/
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

