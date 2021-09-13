Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E9408C66
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674926ECA3;
	Mon, 13 Sep 2021 13:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42196EB17;
 Mon, 13 Sep 2021 13:17:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6961545wmb.2; 
 Mon, 13 Sep 2021 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=eHafF1f4FLFyeSseJox98EKzdW/NnA3X0UYxAFaxI+XPciSSmj6wQ09p6tfWaRe9BA
 5oHi4ptPueYeEreNPjT6ULrzsv9VlMM/dwlG85SexbAhpY5IUXDZEJgPHeCgHoDbjcmX
 KcWw61VD0RFMAyW05WFocLI4jQHuj7VDcoQlnn8fSmtuM734OCej2gphI3Ix/mEOYTi5
 zdHT9TDf1lOb7GPGgl3whmL3TxWiql8plQ4swPhNVg2Tk+V0+OBVVj4E7GzFgQm0QlMc
 091Suem5M/RFy5c9Q1Uqr+7DEXvRXHa1Us9FP9CHOc1mUPXDtJI5Auxg4tkyGwfMyJc8
 BBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=P75jcbTjPWF5JQbyYAACXxj7oVSAL2vA3YHr04FBhiQhZKBI1RBb51Ln1w7MGVixhc
 vZlp50XaTHrPWdmhuWQZqIydsjgXpmsyNADwXur5f4fuNeWe1WA4fvH+pRQffMpudTac
 TZYCaJ8iRbezmXRHBYCogTH9ZFJ00eb+uoSg344IpBvnz8WsvjDGjw2EQ/E+vfmZF7K5
 1m7xKSuAYOhKu/pOTRug8gxgahy4VmT/DRbhN8Cw+ioe8Fgu1zJaRvqVgB77B9Mujp3F
 Ya3bX21Fyl0ql80ORfksOAb7nE2eWtJ2etN3g5DtL2S0m/t6Xpc6wniHSP34w785zRh1
 ryvQ==
X-Gm-Message-State: AOAM530/gRux+TsaQvnwBmMIQXqBL8jvE/WEWeL785yRSJVh8CcBncjw
 u4sCFulvecblhNIpimJW3m+VnZ+TPAGc1vjI
X-Google-Smtp-Source: ABdhPJzzX3f036I5MetbYr7KHLTBrIz3UM2p+tS9h5Jr8u0cPVGaEVuQyigmNaQb4tUhcP23EwO2xA==
X-Received: by 2002:a05:600c:4f53:: with SMTP id
 m19mr11110088wmq.2.1631539063899; 
 Mon, 13 Sep 2021 06:17:43 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Mon, 13 Sep 2021 15:17:06 +0200
Message-Id: <20210913131707.45639-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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

