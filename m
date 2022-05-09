Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACE151FDA2
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFB810F19A;
	Mon,  9 May 2022 13:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F2410F18C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:10:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u3so19395975wrg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9P3zYs6bGaCRflL6U752X074Zpse7jskvqxYho/Uxf4=;
 b=PhaPvBFDjqrfxAXaL3NKsf2oKmOh5OyrYY2c2SzeZyVmyQc2iIN03zVVQh9XdFQOWS
 3BOc4KT5YPnVFSzKtucCHHSw8sbhX3VZYt4vSRqBHj8J52ppE+IHddb3mCUDzIE5DDbN
 VK2BTZES6dTyMSZq/8KFCf3In7Eer6tOZf6pLu5MLANYjQeje7lnESKiUD2r+pWHlnT8
 Qh7UK3CsyDV8KSwsxUZacQRWuGxcBnaKYVI1OaWM+sBCpuvXT3Dj9DtOA4KWiTDLb8Va
 pBBcFwRjDYRZryTOIhobebumrfnOVXtIezlwAOEpfaHgrUD7VC/w5dbNrDv2rze59A4v
 LyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9P3zYs6bGaCRflL6U752X074Zpse7jskvqxYho/Uxf4=;
 b=EEvpIDtmfyn2pf0vFyQv4yvQyIAebE4C7D7KDeQq/F8PGm568428BPHTsmKB462lJO
 K17RAk1Fsg1Bnec/XuPHABF8USHqmQW/mgU9/tIl9+vCaXGiBO5KSXE1qvHPYjB4gLGk
 4FqVO1iCs6MSKCeBIBEzkz9ia2NCw+uXqrZUxZCvBl+tcxTYP/7ftrt+QRc0IQOq+hZL
 4qw+BNdJCRIUzC/MlPXKdIy2u/nzUab1AEz9BGV/Xa9NG4qLoc6csL4cFvwP0G2RwRfL
 oMeyghKJImp+94olBy2ZNo27AdmpPwn++CGSCGTgOjNotYQADGi3ZiaAfzwW9LgUkO/J
 tDKg==
X-Gm-Message-State: AOAM533S+HcVJIt1IF71jdSEiiDbtCpnB99nlv45ApX5ZBfarChUujTX
 q1mXQurguF8m1dfWwUOiQgHQR6sSkmc=
X-Google-Smtp-Source: ABdhPJwDcONGsj3cPEgM8h7iSl0bxSwtttM3LNztZYgPXTef5f9KBZD9EZ3gpXQUjtq3DJDlHpAw/w==
X-Received: by 2002:adf:ec08:0:b0:20a:d39d:6ab6 with SMTP id
 x8-20020adfec08000000b0020ad39d6ab6mr13733364wrn.442.1652101803381; 
 Mon, 09 May 2022 06:10:03 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:10:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 08/11] drm/nouveau: audit bo->resource usage
Date: Mon,  9 May 2022 15:09:48 +0200
Message-Id: <20220509130951.486344-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
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

Make sure we can at least move and release BOs without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 666941804297..fb903c62d322 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1010,7 +1010,8 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* Fake bo copy. */
-	if (old_reg->mem_type == TTM_PL_SYSTEM && !bo->ttm) {
+	if (!old_reg || (old_reg->mem_type == TTM_PL_SYSTEM &&
+			 !bo->ttm)) {
 		ttm_bo_move_null(bo, new_reg);
 		goto out;
 	}
-- 
2.25.1

