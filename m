Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E50439058
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69CF89C69;
	Mon, 25 Oct 2021 07:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE48589C69
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 07:28:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k7so6397228wrd.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 00:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/KnA63M6s12GSIiSZQ+VKmCZZ5SYH2ewEjUZZjZe3Dc=;
 b=V9/H9rFq07ZWu9X7sZOr17KADFhWpONR9njdMHofDF0MAqTMBCHW22mgtNzDxQhppi
 JeEgcN00e/tjSoNtG7GKCavuwnUBcnbWrOiFi1DBgtDVeN67I3wJ2MonlmSrpzP9ZwTZ
 D+TfK/WwHVI71NvelC6iPIVHS95hRwMTnLCT17HxyOAsRdb22H84VnvrhDwDR+m+h20L
 0IT99fXL7kzAWBguwncJzftbcai/TWcs/qsy7T1Hcpj1VmGcqff3PvnhtU/bHbeU3/tD
 xq+Kvn9EfIOp5e8bJF7GggSi+CPgDJoMnvgmnRDyJrQY81wOwwj9kURPziUJc+Xu0Aec
 blSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/KnA63M6s12GSIiSZQ+VKmCZZ5SYH2ewEjUZZjZe3Dc=;
 b=MhYlkt9WBcAleVTkV2nvFQQ620EQvSrZC3kakMiAvbYCDBEMuaooQEGLDwVTuCnBQQ
 2k68wNWzm7QqH2YruCy9XIztaI88vpkq4hfQyiqECH4FogFxVd0+glvXKeVwGVZ6bDVd
 oGt1oGhuHXD17ZEMJQhvvlKJyG7h+13DurcpAN28w1dJFw9oolxpffmDZJPeCDNMH1a0
 B7PR/S6bywRnoBFLE54nHCXlEWmw7vKmDBjwQjJRkEH9P4xJIvVSxgiB/2/hOONrT854
 P9mxUGirYs8M9Y7bt0krPYuUdu5njRggKmPdsjcHt+m3cMIBCoz5c7T8NaTlVo003ncO
 Gn3w==
X-Gm-Message-State: AOAM5330XOcG4KPpSvPtSC67IpUmFXABflM+lv/LLquQSGdB9Ww6WWOr
 a95Jz4KdUuBjFlf6zW7Gg6SP4aqUqXU=
X-Google-Smtp-Source: ABdhPJwD5z0c2YhOxWRJbhrUSUEniMr4DJ/fSnDBawSJsXVSVYbSDIwE/IICnKlX4m6YPSo9VC48Hw==
X-Received: by 2002:adf:8b41:: with SMTP id v1mr21337216wra.255.1635146917527; 
 Mon, 25 Oct 2021 00:28:37 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 f7sm14089322wmg.14.2021.10.25.00.28.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 00:28:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: fix uninitialized variable usage in selftests
Date: Mon, 25 Oct 2021 09:28:35 +0200
Message-Id: <20211025072835.176805-1-christian.koenig@amd.com>
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

"i" can be used uninitialized in one of the error branches. Fix this.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/dma-buf/st-dma-resv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index 6f3ba756da3e..bc2265807f6c 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -295,7 +295,7 @@ static int test_get_fences(void *arg, bool shared)
 		if (r) {
 			pr_err("Resv shared slot allocation failed\n");
 			dma_resv_unlock(&resv);
-			goto err_free;
+			goto err_fini;
 		}
 
 		dma_resv_add_shared_fence(&resv, f);
@@ -336,6 +336,7 @@ static int test_get_fences(void *arg, bool shared)
 	while (i--)
 		dma_fence_put(fences[i]);
 	kfree(fences);
+err_fini:
 	dma_resv_fini(&resv);
 	dma_fence_put(f);
 	return r;
-- 
2.25.1

