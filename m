Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F440F7DD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3F96EC5B;
	Fri, 17 Sep 2021 12:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68FD6EC4F;
 Fri, 17 Sep 2021 12:35:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id i23so14967796wrb.2;
 Fri, 17 Sep 2021 05:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=ClzefoT8ZJqdUhLiTrPyn/tYDsZAUMp22rU6KvROHSGBst/72K19MsNlgZgPwNO7TW
 AzzYRDpFMvki1AWIpcB3SZIsVtHNlefi2C0rzgvLNY2ea7LGm7pyCHeorIzpd6z/PhVs
 Yg3bacdCLixtAitXPrJanpP7YNVwgDDRW+BjgRpPr2dluoppn1Anx7C2CpiYPQdRWBOx
 YhpsSFuvu0fHEtr9Io9x3aaRelwNL0ds1HpVg6Jwo/i2bglZSrqyknWPgpVo+NJ8siwr
 IheZXKe8bubdnLwaZiIbyC9G055EWnN2K3oamY6NP8jStkHOeNyf+cBn8KYiJgOBvGV6
 OAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=lrNGmPbDVt4GrTWKVI9qTcePGhZiCOE7srH028MQs5RRJ3Lfr4JQZfd32UDBzI0ME+
 xPZEqQp8J8nqtmguArctk9Q1Qox+pvfrzbyowp5gWR25HUS37BJ7Ds9MFLlzv9Muiupt
 de8N3HCPmo9+Oz0BIP1+tOOP8LRWKNzZvz7qnK36Oa4YEcN5Az89BuxwObbONuD0d22/
 wz4YbjqsLB/hEDEl96M5wkW+RMh5yCJYeCDivxAG6hEWIHuiZom6dGPAPKwdVf88DHGu
 vTsHEkpZsPiwkjMgNcd4+s2z8JkFAXzCnsVJaglJPhS+ADc7aZ15kDhFZDU+Dc19n7Tc
 zqcg==
X-Gm-Message-State: AOAM530xWSpQLmywWZX3108BRBZfk5qavUmvOqqkX/iDQN+EENZsiduv
 4oZ/s1ROJ48jpJC5NoSObXg=
X-Google-Smtp-Source: ABdhPJzNtLWcjUTMHGl/9GN0PRbPfq18kIpBmMBWkzWXF+U+Lc7iVK6lvLbnj7xd/dMsUoLsX6t9Qg==
X-Received: by 2002:a5d:5981:: with SMTP id n1mr11976979wri.82.1631882137364; 
 Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Fri, 17 Sep 2021 14:35:12 +0200
Message-Id: <20210917123513.1106-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

We certainly hold the reservation lock here, no need for the RCU dance.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 4dd7d9d541c0..7e17bc2b5df1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -195,7 +195,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			if (ret)
 				return ret;
 		} else {
-			bo->excl = dma_resv_get_excl_unlocked(robj);
+			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
 		}
 
 	}
-- 
2.25.1

