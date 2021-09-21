Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983594138AD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32DB6E9FE;
	Tue, 21 Sep 2021 17:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4965A6E9D6;
 Tue, 21 Sep 2021 17:37:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u15so41555592wru.6;
 Tue, 21 Sep 2021 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=ZbGWfdMXL2oZ3jJfLUlEKjlo5sciwCxCL/Zz3DA2kRjAKpBRXeZFEAo/lnXVSt2FAP
 OnoiaNvIXwD7e7pHubQV3zrtjaTWlLwxLZp81p5ngZ0AMIVVwwTCyYc8GE8qjWfXwihC
 fr+cqGceSprO//VxFGPKwiUo4hDePgfQZpncMi4ev1Ex7IItQKhL0ni14i+xSz5DdJBL
 ha3DD3EFeXbEd8ZXDidrY0m1DmP4TwVkcEgSpSopE91BtAmOw9asi25rhmtl+XG2w/DL
 2PV7C0uXXTwLo9Y/ulHZYNFChEImVADkT4Y7WQHviWZEWlBTxyPxBECbfxyQup2lOt4+
 4J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDNZbZcYoW7IFr6lQi88QIbXjkbY+ZD5EoDTFjlvddA=;
 b=yS4CrAqUcGnMUsQM3MrIQJsryX7HhAsw++bBrkv7K644LSLNW0yqV5BgxeuM5xXRP5
 kiRrYYKlnKh+gvRWAMd0peQ1uceHsqsYLJlXrOPqLGHa6Kl1ttCPwRHAw5BhTJJy88cQ
 HEdoyKHy0MOITHEVfdj0jU6elOo8SC+LR/3KB8hAK6NRIlleeX68uIq1qIU2SX+7MoEP
 r1kEmdsSd8Lqc3JGNRKPFHgi3bySnog7sDUp4HI4iFPfPpC7Z/Xt8UOCehp3A6zB/9/C
 qx94tDoPVOUUBR9uqNVozigE0csDrpg0+cn+Y9q8SvNfestmyRhtks31K6TL6vQSQ0F7
 uDHQ==
X-Gm-Message-State: AOAM533LB8Ufx8lMPgy/oFN2jH3WEaHrfeETNVKYicqsXIkLv1xU9HSW
 P2Ds5ux8fxFfjBehI1ne03o=
X-Google-Smtp-Source: ABdhPJyWkM8K/gJ6bhFn7K8e+c1a6QlrTv1uAdG0zR3KN2txs1/j18y5D9GJnziqvsqC4k6zxzli8A==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr6028803wmb.125.1632245845783; 
 Tue, 21 Sep 2021 10:37:25 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/26] drm/etnaviv: replace dma_resv_get_excl_unlocked
Date: Tue, 21 Sep 2021 19:36:58 +0200
Message-Id: <20210921173659.246165-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

