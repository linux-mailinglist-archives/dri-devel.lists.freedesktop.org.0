Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4DE41EA8F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD80E6EDFE;
	Fri,  1 Oct 2021 10:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B1C6EDD1;
 Fri,  1 Oct 2021 10:06:39 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so6345450wmb.4; 
 Fri, 01 Oct 2021 03:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=PXH8tk9DNBtLaZwDDHnKup32VEbpBQdrjnSXIPz0PW/dyKbkTSjIKHVTAC+gmlyDuj
 wOAsN80WpUYrWHZo1ChOZ5tQC/9V7NFyqsQvdfIhpUyYSYzeOGDWq2Ab9U2HzyPAQOmb
 lT2BL5MBr+q3BTqhoCKyW1GTdauzxNRnK9dr3J8fFlHFxp1kh1vJLBaeaB6cc2ba1Et9
 32HQ5EfNMdB/gf9+hKRYIQxYReupUwsW70EDr32L6Np0ef8uBgpmnH18fmZva2PhJ9f5
 1iddLO3Wz1BxBZ+fc9dpTP2RwYIcZb2YV9BnvM8ASO30hzVRAqXskgB6BkfF7bx/+XHt
 v7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=kGIJkUv/RU9qkGnTSLoJqKU9IKy1NDnDXVEXrqNAOvaNzFwRm2DfPzTkaow72Afly+
 AkZ80NajvGfYt/6E/1R1uZfdNKpzhb1TpPSxCYj86uilip/Sl2FdMFVWPsGZhF8l0q44
 jgjREatWohtRpFQQsKue6vEAgcMB19wjYxsHG/BIQW7Jw6S+203vSYhAL2oLGIYy1uwt
 DcpkdiTeQQRoZtm4Gecyu+CfmQMYN7YSIHXe/xFyqcStWIclTgcoPcmivCvDpNAr7KNf
 sTv4LDLpFskd8XY7lIENLJnqML6oaNwNvh2ZYMXKWxDQ2Z4tI3VcuhQaq9z3jMqUYOTg
 yc0A==
X-Gm-Message-State: AOAM5303In7QH40JmwVwVkPS0XdCQL0l5dcFpgNzcfXpa6q2Qsz1oOGr
 S80uLYZFp55xO0hVq7gGaHM=
X-Google-Smtp-Source: ABdhPJx7qiKtQqciPHO0by0iLKqUhwG5jjzzHPN8NAGU+x7I7V5LqtDnXG25PcpZlk3SIHVxGLVmAQ==
X-Received: by 2002:a05:600c:35c6:: with SMTP id
 r6mr3635692wmq.24.1633082797663; 
 Fri, 01 Oct 2021 03:06:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 28/28] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Fri,  1 Oct 2021 12:06:10 +0200
Message-Id: <20211001100610.2899-29-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

