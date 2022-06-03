Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FB53C8E4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 12:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120E710FB06;
	Fri,  3 Jun 2022 10:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE9510FB06
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 10:46:08 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 d5-20020a05600c34c500b0039776acee62so4624145wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 03:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WKIyW7WNcBU7mkeZ4KkRxp0TVKpsu/X8riRUjsLQwTk=;
 b=PS6AO5Ea5MKzI/PZaxKkFEhSjXLkdKwHWvtmvGLqabWuD0tXaKG8nx48Xt2ToCblcz
 Yp4sibRwaYBVj3TrYFgTF7ZKWzvdX7jaj7v4Mb2MfTLpztWS+pmAdazhI6TPN7NpS4CG
 zBPVSXAHq99bJVeXOytggxHbOa8bCURPZNe9D4r7C/ui2YzLfbzK+u0S4HyGTu1G+ZK4
 lwpHSyNg24sPmWACbsVVhqoMT0SLTIaebTrN1SBfxZqdIOXBMt4R4CH8n/pJeGRR9J7D
 VEe9gY3YKdsiu77h03pgkvs7eZ1AryowjQr0uNfIPTKndeTdM+wdqK7AGYmTuFKTp8fb
 gF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WKIyW7WNcBU7mkeZ4KkRxp0TVKpsu/X8riRUjsLQwTk=;
 b=0/V8xBpj4UPBN6jT6LEC5v/Gn+8CNiqKIMVjC1Et76kdiccRL4UZvsSldiIpEx64Ar
 QWioUv9C4E/z4/BtK0HcgoVac8k5Mdj8ryzNhDOVB9BW6+ZfIy24ikehHA2I750SZgti
 kcdyCUrruzrbW1mI5Nt8oSYEKGUnPDLaOAFu8YZ/j2cCT6DWJwwlsw9oxP1LdUzQRcET
 AIwUubmF91JULO9hzwGHAuZKSdNedsv0KsD2TNypQ2bRcNrTSpuG/O78FJvktIB27aaB
 EFzmFwL2m0aR3TzCr4zhBM3bXAn5zGA0lM5qT1HLbOCfCi7r0HTHx1JnChvyFqa8p8rN
 bS2g==
X-Gm-Message-State: AOAM533+Pvo5l9OjB2xmfn3rajoIkAJAMgK6kCTXuFpUT7vFz2M64TKw
 ku2niSajdYc8L1PcFt4sPg8+BaWAUZjJRw==
X-Google-Smtp-Source: ABdhPJxql2IIcMt2SbeSRfoh+F28LOXpaYK16oYm5lMEIfvi1SXEi7femX6V54PKVSMp7j95WNVoxA==
X-Received: by 2002:a05:600c:3cc:b0:397:337e:14ca with SMTP id
 z12-20020a05600c03cc00b00397337e14camr37730722wmd.10.1654253166665; 
 Fri, 03 Jun 2022 03:46:06 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a7bc246000000b0039732f1b4a3sm9664058wmj.14.2022.06.03.03.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 03:46:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: mike@fireburn.co.uk,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix missing NULL check in ttm_device_swapout
Date: Fri,  3 Jun 2022 12:46:04 +0200
Message-Id: <20220603104604.456991-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resources about to be destructed are not tied to BOs any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index a0562ab386f5..e7147e304637 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -156,8 +156,12 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 
 		ttm_resource_manager_for_each_res(man, &cursor, res) {
 			struct ttm_buffer_object *bo = res->bo;
-			uint32_t num_pages = PFN_UP(bo->base.size);
+			uint32_t num_pages;
 
+			if (!bo)
+				continue;
+
+			num_pages = PFN_UP(bo->base.size);
 			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
 			/* ttm_bo_swapout has dropped the lru_lock */
 			if (!ret)
-- 
2.25.1

