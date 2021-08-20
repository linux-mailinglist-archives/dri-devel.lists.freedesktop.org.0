Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAED3F2BB4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 14:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A1C6EA71;
	Fri, 20 Aug 2021 12:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4746EA77
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 12:05:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q11so13933906wrr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BtXcf9FL13vBQthhiu8Y8vov1I2qGZsDTLj1riCK8W0=;
 b=nsYA0t/i1ulkccI3aYea7NpYamopYOEHZl4M5oFCLVmTQNEcl3q2EqxnMbAjNLFCaG
 r0xAptm1Qj4LCtvftSDik3GIOr51YtU0BQriuuSgOvhvcJobnt6u9XGAK8/ZnFLAam7X
 H8AYW12aZSGQzsJn3z/0ahvgxlwyF9OK7qQ0AIkuFDDpSbHIjN/oPzCyFLbiJK49IeY8
 o9qW/d8LMR8m+IemlusvsUqgWUV2CN+Kpo1JmzFAO+DiF+5vCFCzsW/MHD4M3IK47CBz
 tW7/JIbS/KO8WUAHyuAXYCpKWhsZd39J208qOTzreDJPulwe2i+U5G4kA2qGXHVbFBth
 mCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BtXcf9FL13vBQthhiu8Y8vov1I2qGZsDTLj1riCK8W0=;
 b=QA+g78Vq/mz7RFfwj/VclRiEYExLo7p7Sid64UBx3kHr/rpA69ag0xbijaMgjbevA+
 aKpIaXAvMOIEI4nORwCED5f8Anh/8X53rsefwuAbRA6Mr9qfeBg5XNrnoo+rI7FLvw6J
 JBgTOHrTVxFlhNgbtRag6WFyFv9nVBaBlSCVz5iQK4jkYUd2cV7Cs1fvwoY7ZeiYowUl
 Qv7ek9DooBL70WpjwAX+N8dTUudoiWQpjg/R8D09u3LwKRTKH2nBdSjC20/wMxlrzMHk
 nPKMdLlxuBJjHsV+mCuPzbUuauLp3B4f76hCkpA+J4jjuhyQrTf/NbxvRPsyF6wYwNjf
 Wj0A==
X-Gm-Message-State: AOAM531XF/ydpuQFEdmRXLBVYpfTuF+dJyixu02oa37UU6XVJKyfxj3O
 lj2BsFI0tUEbg5+P7x8DyGA=
X-Google-Smtp-Source: ABdhPJxNkQ1vMfrqVGgsAL1XDHA2/wR/SRXcMrpFDx60+D1EGxFatPZ/nmwFtL6YRCIw3ltv5Dz7Dg==
X-Received: by 2002:adf:9084:: with SMTP id i4mr9965529wri.23.1629461132894;
 Fri, 20 Aug 2021 05:05:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r12sm6139818wrv.96.2021.08.20.05.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 05:05:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: [PATCH 1/2] mm/vmscan: add sync_shrinkers function v2
Date: Fri, 20 Aug 2021 14:05:27 +0200
Message-Id: <20210820120528.81114-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820120528.81114-1-christian.koenig@amd.com>
References: <20210820120528.81114-1-christian.koenig@amd.com>
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

From: Christian König <ckoenig.leichtzumerken@gmail.com>

While unplugging a device the TTM shrinker implementation
needs a barrier to make sure that all concurrent shrink
operations are done and no other CPU is referring to a
device specific pool any more.

Taking and releasing the shrinker semaphore on the write
side after unmapping and freeing all pages from the device
pool should make sure that no shrinker is running in
paralell.

This allows us to avoid the contented mutex in the TTM pool
implementation for every alloc/free operation.

v2: rework the commit message to make clear why we need this

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/linux/shrinker.h |  1 +
 mm/vmscan.c              | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 9814fff58a69..1de17f53cdbc 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -93,4 +93,5 @@ extern void register_shrinker_prepared(struct shrinker *shrinker);
 extern int register_shrinker(struct shrinker *shrinker);
 extern void unregister_shrinker(struct shrinker *shrinker);
 extern void free_prealloced_shrinker(struct shrinker *shrinker);
+extern void sync_shrinkers(void);
 #endif
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 4620df62f0ff..fde1aabcfa7f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -638,6 +638,16 @@ void unregister_shrinker(struct shrinker *shrinker)
 }
 EXPORT_SYMBOL(unregister_shrinker);
 
+/**
+ * sync_shrinker - Wait for all running shrinkers to complete.
+ */
+void sync_shrinkers(void)
+{
+	down_write(&shrinker_rwsem);
+	up_write(&shrinker_rwsem);
+}
+EXPORT_SYMBOL(sync_shrinkers);
+
 #define SHRINK_BATCH 128
 
 static unsigned long do_shrink_slab(struct shrink_control *shrinkctl,
-- 
2.25.1

