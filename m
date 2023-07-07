Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D871374B072
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9044710E56A;
	Fri,  7 Jul 2023 12:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7967610E56A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 12:08:29 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98e39784a85so564801166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 05:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688731707; x=1691323707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AoEurJjmNnNb5UObdayRaYQAwGnop1n7UfIpgxXDVf8=;
 b=XVO4vovgoLBPW/xRcEpgna7HtOXoCcaQbNWmcivG/d8BU9pxwZyeN6h4lirqrF14WE
 eGBG7Wao9FT6Wy1wgcf3ac0hiYLGdiuw/exlch/7nflwDRby5lhm78vAn+sYTGM8IfGr
 josCApzdrD94UEwEcmuuVvFEuUMm5fle5PyOYbhl65BTAniBKGVS7VNHBz/3FKSNV+3L
 dipGXEhKX8DmSigt3BqigUHl+MSWaKX6/jJ7zX8G4Y/kVRF7/5cw7nK8pXQgcKzf33w1
 5bwjcbIOMrs44sYCGG2C40g2tVO6kpLjcz71i5FqNNrzjTnPrsmUBNyNpw1gLRwvT3y7
 n+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688731707; x=1691323707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AoEurJjmNnNb5UObdayRaYQAwGnop1n7UfIpgxXDVf8=;
 b=LSY4M99/CU/yL071kd2Ecj5VPWxkwVF9LoZ3ldchOTHwNkeJmbs28sOAP4vheowUZh
 AnbnUecQO6bhg8/oZMerXNQ7mv8zEHT81x3FLvpAHMXW2KEHINiu+n7QBxXZ600Ck359
 PU3GZFRIUjATrNmMuhH7+56rdQDN7okmKPNLEIydlfWYbQ4/l4a5HjD6I4IihE5+jnc7
 G9w1xRWh41Opys0AgFtAo+cPCQ1o0sT4tBB3WaiRP21AyW4Hu/v85afOU533MLSuoi+6
 CYG1vmj0FRaIKDcyS2maTxJC0klcLEqUHD6SGLY+MCygaZZO2YDvPaLFmI4ZAffawxp/
 GBfA==
X-Gm-Message-State: ABy/qLYHLgYPZe9kT5NoFy7wGKXf99Bn1GGu2L+GIa7YMxV/jRYRLGIO
 GWbYQexKth2m5jYmlT7yLcponcZzbDo=
X-Google-Smtp-Source: APBJJlFBJlsHSm8CGpyNAsHxwtmkPWwR1H1ZLfnh5hLoP/L4kBvXEqpNudVBCNXsB0ph0Vq4laFRHQ==
X-Received: by 2002:a17:907:7d89:b0:988:b204:66b0 with SMTP id
 oz9-20020a1709077d8900b00988b20466b0mr7748831ejc.33.1688731707377; 
 Fri, 07 Jul 2023 05:08:27 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151d:fd00:3caf:b59:7cda:ab79])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a170906125100b0098e422d6758sm2100371eja.219.2023.07.07.05.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 05:08:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: never consider pinned BOs for eviction&swap
Date: Fri,  7 Jul 2023 14:08:26 +0200
Message-Id: <20230707120826.3701-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Pierre-eric.Pelloux-prayer@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a small window where we have already incremented the pin count
but not yet moved the bo from the lru to the pinned list.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 1a1cfd675cc4..7139a522b2f3 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -517,6 +517,12 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
 {
 	bool ret = false;
 
+	if (bo->pin_count) {
+		*locked = false;
+		*busy = false;
+		return false;
+	}
+
 	if (bo->base.resv == ctx->resv) {
 		dma_resv_assert_held(bo->base.resv);
 		if (ctx->allow_res_evict)
-- 
2.34.1

