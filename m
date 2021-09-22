Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567741480C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 13:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430D06EB83;
	Wed, 22 Sep 2021 11:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BD86EB80;
 Wed, 22 Sep 2021 11:41:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w29so5799546wra.8;
 Wed, 22 Sep 2021 04:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jla6r+nohO+kdZZK9D0vwGLTAVUrJek6Wz6v71QcvPs=;
 b=CD2aueE/QVJCGUUozlD1JLIbGnyhtNzT1fpfI+uANe+c1f2sYilSJrgCg+bqVAA6eh
 jVyQuqEL0Sjzf+CK15xY6VIaXUmoNzr1z/rYCr9fBsI4C//f7NwqJS88o8k3eBeV+g4M
 IVtIDAvI5hIWMmNEaAIxmnKd+NywUGw4X79ryWYIqdCY4x8nXAJyv0Oo2dgIRFTghLxD
 ZP3rUKdKiTGgmgNwJNi2Xjzb+V+yCGmQvPtL3UB9fZpiIFv5YWeCKn87xCCOYurR1UBX
 tvvTYrtITdw1711yODW0d9w/QuE3fMY/E0iQ7QwxO2vBLJ8prACaXiwi3amh+0QN+Xsf
 IGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jla6r+nohO+kdZZK9D0vwGLTAVUrJek6Wz6v71QcvPs=;
 b=FPHnGYD0YCAbckGyC0NEpaCzAFEeIcJYDteHkps50+CFIeNV46wDjn4dyGDuS9O3up
 J+5OW0rLrhe8BYjTRK860/ffAVYC+Mgy8HabTCu+GCfZVT0L2ROR0GIrAlSLmEKVCxVk
 eCRufYoMiRA5WejCTQ0VBVQqayh2nX2z57FLU/hvb/A95jKiqN/Q6XWJHERFeYYXVBYz
 RgTt3DihHd6ZcF3ixm6aFFh7ZovNiKFkJzom9rf95j2x8fmWdQ5qDE6wrnDjRmy558M6
 9XsZqvXRlLoiFYSMA4zCSvnz4DA2KQe2DjAkeVTejWv1IpTzruL0pDRZimQmjXptN+hS
 9ZgQ==
X-Gm-Message-State: AOAM533Ly0S7jlo2RNf7Eka2xsQOtSjpIWK9KaR/+0URISOErTZODfxp
 S3XOMcALd2L/kExGabBOWxo=
X-Google-Smtp-Source: ABdhPJx+W4P8hrjnXZ1EzOLnbI1L33Vrp0YTjyQB5NWQEBE7C3J9/063uO7M0/ituXLYhxbU6UzefQ==
X-Received: by 2002:a5d:6750:: with SMTP id l16mr40594248wrw.174.1632310909602; 
 Wed, 22 Sep 2021 04:41:49 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 o12sm1541745wms.15.2021.09.22.04.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 04:41:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: l.stach@pengutronix.de, daniel@ffwll.ch, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: fix another potential dma_resv DAG violation
Date: Wed, 22 Sep 2021 13:41:48 +0200
Message-Id: <20210922114148.107356-1-christian.koenig@amd.com>
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

Setting the exclusive fence without waiting for the shared
fences violates the DAG and is illegal.

We really need to get away from this ASAP and make the
driver interface more bullet prove.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 7e17bc2b5df1..4db40e88f67f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -185,19 +185,15 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 				return ret;
 		}
 
-		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
-			continue;
-
 		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
 			ret = dma_resv_get_fences(robj, &bo->excl,
 						  &bo->nr_shared,
 						  &bo->shared);
 			if (ret)
 				return ret;
-		} else {
+		} else if (!(submit->flags & ETNA_SUBMIT_NO_IMPLICIT)) {
 			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
 		}
-
 	}
 
 	return ret;
-- 
2.25.1

