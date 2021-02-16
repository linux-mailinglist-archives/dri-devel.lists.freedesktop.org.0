Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F7731CDDB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 17:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7836389BA9;
	Tue, 16 Feb 2021 16:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E0989BA9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 16:20:16 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id z32so7401812qtd.8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 08:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0icCT5ApM7LeprOgl2f4wAWSG1VmMUQ3gNso94fT43o=;
 b=mqWp9dSbEn01YNx52E7+PStvmW8EtfqaziS2vz5FTEcwEa/RmONY3tRY5FPJc83+QS
 okRRzYlHTubrtbTDGjqCIJfFpqBcNnu54ZNprIOMeNenO2w2K3b4sqVNSZHFGLmve0Na
 lOOZkUo8OBB7vEdsor0mDx0w3g8fdGaT8QNhIr4YhaaB0nCMyUoMMRb8spSL6E8jgSYR
 5tsUw88RF+BXGs7tqQSX247pHLs1NjbJ9BCZVVgWY8qvPWcBLme0xsHXtEmMqAyko7F3
 ABw5m3QlyLsR6dK90mQ/LQy2W/vk+8ioZsPrANon7gowXiWGtB2a7fQZW8J8VFgy5q7L
 pXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0icCT5ApM7LeprOgl2f4wAWSG1VmMUQ3gNso94fT43o=;
 b=jo75854+LBGoP+QHWP4t9IE+CxHdK7JLLuMqyFH9wvMYzXt4Q1SzVceD2hF3v8Zmwo
 aH42zd5+L8CFhL8zZJ3US6foRmRri6IoD8eDtR6HzyskpKmZyDfp5TGKhAI+IV1o2o7/
 iJ3sqMLrE7ife8Rd5bWfiGqgJ/vCLLdO6wOWFdYXQW7ESW6Z8n8cL4qdVb4UqrmfVwKz
 0Hzc1pzVoFN96j0teqgoQOsd0PyXNy3iQs3aKhBV9MoLsMH16nR8avkIeMusQjn8G6/V
 qPG6l4BlSRr0LaZuAvbdSVHg5+OpTzXC9daL/q+N5KzBukkMGU450xGBe/bXeXN2MB1s
 R1Og==
X-Gm-Message-State: AOAM530rIzgK4Uol03hyn4Y7KTeBRWI2+pbs4TOtOR9iwg2sCbJqiKl0
 iHKrdcj315Tu5xnVanwrwCA=
X-Google-Smtp-Source: ABdhPJzzehrU64QYRiOPi5nqmjSpjmBI/BbsVnX+xybj20LQmtNLshZ47CRqMcK2ZIcM4ElN6snqRA==
X-Received: by 2002:ac8:1c8a:: with SMTP id f10mr19237800qtl.4.1613492415041; 
 Tue, 16 Feb 2021 08:20:15 -0800 (PST)
Received: from localhost.localdomain ([187.39.20.240])
 by smtp.gmail.com with ESMTPSA id d22sm13508855qtp.34.2021.02.16.08.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:20:14 -0800 (PST)
From: Diego Viola <diego.viola@gmail.com>
To: bskeggs@redhat.com
Subject: [PATCH v2] drm/nouveau/pmu: fix timeout on GP108
Date: Tue, 16 Feb 2021 13:19:24 -0300
Message-Id: <20210216161924.1687-1-diego.viola@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
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
Cc: gnurou@gmail.com, nouveau@spliet.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Diego Viola <diego.viola@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code times out on GP108, probably because the BIOS puts it into a
bad state.

Since we reset the PMU on driver load anyway, we are at no risk from
missing a response from it since we are not waiting for one to begin
with.

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
index a0fe607c9c07..5c802f2d00cb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c
@@ -102,12 +102,8 @@ nvkm_pmu_reset(struct nvkm_pmu *pmu)
 	if (!pmu->func->enabled(pmu))
 		return 0;
 
-	/* Inhibit interrupts, and wait for idle. */
+	/* Inhibit interrupts. */
 	nvkm_wr32(device, 0x10a014, 0x0000ffff);
-	nvkm_msec(device, 2000,
-		if (!nvkm_rd32(device, 0x10a04c))
-			break;
-	);
 
 	/* Reset. */
 	if (pmu->func->reset)
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
