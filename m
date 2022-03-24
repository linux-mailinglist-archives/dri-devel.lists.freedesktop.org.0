Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D894E61BF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 11:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A1410E880;
	Thu, 24 Mar 2022 10:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD14D10E880
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 10:30:31 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a17so5069446edm.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 03:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qATJBRGZt70MHBeCBmN9PJu8Fg5hxZQ0jK4IY9wgqro=;
 b=W92XBWa6W8T3QlQ3Nll+QwSEssHfiEfPT2PeDmxwVc8RHFx5A1trXaZpzurUnHE9az
 V6IBvKMrGnYJRPyAXACt8aqI609tPHN/TilLpXNzLEj5wmxLPBpL3YzQwxqItDoGO1x3
 jwZmDaDISLCELJD5Vgb6DSBvRd0CDHHVaRG0LwJzhqPKxMK3qNL7/hLRfGwvrRrxVubN
 xAmJ40Td0uM+RtH39vlKrpD2QdCFGc+O8SFUC2NVkdpQjdhlgzQD3OcFmbf7+1yvKMWK
 eaomyqPIs+fYJVNOFVEBDL8BnOgvUczqeMwiOhl6+MaEzedXn8m4EQnSMjsiKrTTLiBy
 yLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qATJBRGZt70MHBeCBmN9PJu8Fg5hxZQ0jK4IY9wgqro=;
 b=Ae4Lpopi6d3b4Ule5qNCnotRmN57eh4M03+Q6aNC879zK3d0zQezjhPR99HJsynAAK
 eL9FTdAiJqd11SlzHWK1vxod/KGn8/NqbwJ4FvYnIiC3D8hlV+jvDgovCn0KGO1t6rCp
 eG42jSwwvPHMUeLiweR9/6hmvZi27qRzkXRtYdVqMsXNg0EoFrxlypLMYdxxweCMvpVV
 RHNe3zCtyNr+Bl96NF/BZPiZkhfGUjQOYDZgwo9tTkNzkMIfZ28Ye9vWztiBHeArPNzk
 7uMSf5vUxU6zm3J9GGuHmwmrpBKUyOsj+1Sj3cabqgDXoNN1XEdIpvr6wmEi1x4s6/i8
 6CWg==
X-Gm-Message-State: AOAM5309PPmOFiOtLSJOznJkj7eu9VbfhcnhkrN1ZH5I8aQEdhrB+biZ
 E3rtjX0N7EXs/p5FJWpHbmY=
X-Google-Smtp-Source: ABdhPJwMsYPaI5k1LQxBIxNMpx3TM4N0ZNqtvC6wqgGswojRco6agz9kV9FutvN8m2zX6kJEFT4OMQ==
X-Received: by 2002:a05:6402:5202:b0:419:2b9f:7dd3 with SMTP id
 s2-20020a056402520200b004192b9f7dd3mr5832177edd.224.1648117829965; 
 Thu, 24 Mar 2022 03:30:29 -0700 (PDT)
Received: from localhost ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170906274400b006da9456e802sm962013ejd.102.2022.03.24.03.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 03:30:29 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpu: host1x: Do not use mapping cache for job submissions
Date: Thu, 24 Mar 2022 11:30:25 +0100
Message-Id: <20220324103025.2660775-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Buffer mappings used in job submissions are usually small and not
rapidly reused as opposed to framebuffers (which are usually large and
rapidly reused, for example when page-flipping between double-buffered
framebuffers). Avoid going through the mapping cache for these buffers
since the cache would also lead to leaks if nobody is ever releasing
the cache's last reference. For DRM/KMS these last references are
dropped when the framebuffers are removed and therefore no longer
needed.

While at it, also add a note about the need to explicitly remove the
final reference to the mapping in the cache.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/job.c | 4 ++--
 include/linux/host1x.h   | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 9424b3c08ab2..f81f3b9f7510 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -176,7 +176,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		map = host1x_bo_pin(dev, bo, direction, &client->cache);
+		map = host1x_bo_pin(dev, bo, direction, NULL);
 		if (IS_ERR(map)) {
 			host1x_bo_put(bo);
 			err = PTR_ERR(map);
@@ -226,7 +226,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 			goto unpin;
 		}
 
-		map = host1x_bo_pin(host->dev, g->bo, DMA_TO_DEVICE, &host->cache);
+		map = host1x_bo_pin(host->dev, g->bo, DMA_TO_DEVICE, NULL);
 		if (IS_ERR(map)) {
 			host1x_bo_put(g->bo);
 			err = PTR_ERR(map);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index e8dc5bc41f79..46081afd0ca0 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -31,6 +31,11 @@ u64 host1x_get_dma_mask(struct host1x *host1x);
  * struct host1x_bo_cache - host1x buffer object cache
  * @mappings: list of mappings
  * @lock: synchronizes accesses to the list of mappings
+ *
+ * Note that entries are not periodically evicted from this cache and instead need to be
+ * explicitly released. This is used primarily for DRM/KMS where the cache's reference is
+ * released when the last reference to a buffer object represented by a mapping in this
+ * cache is dropped.
  */
 struct host1x_bo_cache {
 	struct list_head mappings;
-- 
2.35.1

