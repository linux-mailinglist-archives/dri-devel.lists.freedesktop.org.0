Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77EE3A94FB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F127A6E527;
	Wed, 16 Jun 2021 08:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750C16E523
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:27:03 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id t7so1550231edd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ND7KwC2J9bqQZCM3dXcypP939eYSZ8A7ifwwevA1684=;
 b=unqs/raZ1t5J4i0tVMb8sZRh9eQVDcU+0zh4oyD9beiUYRJFxM0B6pk7bdOaSRv6pz
 ALXYdvQLZ6aV6zWNTRTeW/y/XkFlFbPJ+A9EIeBHMK5zR760JaTihUqsgb8FecRjuHKc
 A2YBF7tB3TSkCzFPDmcwzeuZ9+OX1ZbomPk3SV/kzWe6/vS2HO3oOQGTTunKbCvELRoP
 K0cPNjiWbjaJHsNkgwAjFWGMGjoOoSQ+wfkoncM4ivOQWAqmL7fRrqMuWYYpVW+NvLKh
 daOem2XyiML/PNHiudTUm5y7hyCDxNpTx92LDOX7Yoxw6ingJzlFpSiPeDrHJOqSFQ+N
 40Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ND7KwC2J9bqQZCM3dXcypP939eYSZ8A7ifwwevA1684=;
 b=ICeIKBOrh9SPKPY5jUMKqOuKDA5AP1SdUuRtX8weDgY0/rFTf5hFW1dGLckD+kOQHC
 X39nnDyZHzHhqedpFv/qhprsKM/j8jOmsl8q32RUNPs4/M787XNraKzqcdoEYJ+uZH8y
 3xQxttHcHJHE2XupbpIHy0XvKeHVz3TTRvYT41GVGLN9E8fCIrVWq16Bq6S1Kp4VFNvX
 Bkp3kscIVAp+56Isib7XTlo8nRkw+KiCeroWj7E+o7nAeGtqxye3XwzjdtYfKJvp3CRZ
 cClCNVyJT8x+l4UMqn0JK6yDtrJzGMpYCrgwuJ7Q+f0KyhDUA71xwhUn3g5uruGCSNez
 W7CA==
X-Gm-Message-State: AOAM532NDgbiz/WkZWOHQzItE8bxYY6RDjU1/Ai1I987lwEX/GRHWkKy
 fcU7Cf8dZNeM76EvP2VCaLE=
X-Google-Smtp-Source: ABdhPJxW25RCxGgBd4Rp2bAkplsJ1rs8Gw3ttP6+9OZanazszl0LNYDwjaUxdetHpXeEzpHYeOcshQ==
X-Received: by 2002:a05:6402:520c:: with SMTP id
 s12mr2753961edd.304.1623832022213; 
 Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
 by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Subject: [PATCH 4/7] drm/nouveau: always wait for the exclusive fence
Date: Wed, 16 Jun 2021 10:26:52 +0200
Message-Id: <20210616082655.111001-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 6b43918035df..05d0b3eb3690 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -358,7 +358,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 	fobj = dma_resv_shared_list(resv);
 	fence = dma_resv_excl_fence(resv);
 
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
+	if (fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-- 
2.25.1

