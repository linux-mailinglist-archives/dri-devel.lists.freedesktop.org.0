Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0274422559
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331C16EB70;
	Tue,  5 Oct 2021 11:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBC06F5C4;
 Tue,  5 Oct 2021 11:38:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u18so36801871wrg.5;
 Tue, 05 Oct 2021 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=L6QXQyheD0iBmll/6+c9+sMjS2UXeP6CZLR1N0Tr1p1DMvcTPcvrj/vKNkefQk6hSC
 XAX6j4T7WLIwelmGb3Vw7DLUWhezBvGs6oJ3tp31RGY4A+X0HaDNuHljSm35cqPZ0o7t
 QjEw8cbfgbfbfrG0xG80Z13SY25aLjgSqr4p04o5hntg/aaV0vvG/1PixW0ayo+SGnXJ
 bFD3lm4R1p4jMBoFZy9chDD/RdYUm8y5O3ncSTfdOnwBmi/Mxiqh1f9NXgEiYFTN6zb7
 0302neM0bN2wUiHC1/wncpvnSPz1YwKSZAGSg2az4zIvqkTWIv8EO2A860B80CR3DbjE
 l88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=gVQsSDQgU6s0tmcZKxDFDnjilwIC6v7JcV/7zsTLgtK4PLgWwQNfai3xDvhF2/4yZR
 InE8uwmhnqLRhEdYiqIwC09wpzVGXQq0+7sanNXRBtMxER2+Bqp7pTt8udMiSb2/yR0G
 Pf+38h5BAInNgTq8v6C8OI4dhkOeU70NwI5P5YgvnwR8l2vK/qpCyg5AHMawEoKn6m+6
 kgpqTpmuGYu5JBlU6JMGvB/bzJgd7My2pHDBbfIA3rDtvFTyR7HGnYKyZDjaLUjmDmEV
 VMUcLCqQt+h/Vyaj5Nu7TrEXH5wCDMTM5pU8RAFJje5zYMztd27EkwfeDVcFsuJtxa4v
 FJBw==
X-Gm-Message-State: AOAM530rgj6ld2v2swDyrO3VNEP4zvD6ZxIYnMhoiFhqfxf0eZ8wRZjk
 1yZY2NIzbkBTnDKDW/FGTTg=
X-Google-Smtp-Source: ABdhPJxGZxWVpSVFBiaJumxIFqfRiFL+GVcyqCPa5EfSRy4T9vy6Ac7sHOtq3cmmvYrRJTQvJN0d4w==
X-Received: by 2002:a5d:4cca:: with SMTP id c10mr17829743wrt.188.1633433890218; 
 Tue, 05 Oct 2021 04:38:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:38:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 28/28] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Tue,  5 Oct 2021 13:37:42 +0200
Message-Id: <20211005113742.1101-29-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

