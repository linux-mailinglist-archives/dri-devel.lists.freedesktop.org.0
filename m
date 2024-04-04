Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3D89963B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 09:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6716C1139CA;
	Fri,  5 Apr 2024 07:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NDPjjHyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64A81133BD;
 Thu,  4 Apr 2024 18:15:15 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3438d7a05aaso820787f8f.0; 
 Thu, 04 Apr 2024 11:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712254514; x=1712859314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kY+E2shk9TTjvlmztMnEOs4NCqRmJnXfRKrkxZqUteg=;
 b=NDPjjHyzIaP6iqmfp77I79sR29FSW2EaDvWCZIBnjeUHc9FdX+M5Gv+/FW5IYFDVnL
 b3pOaNcP2gBDtAavwLzy2oH6GUt+sRlJ2I8gsmmY0CERNbswPGVFu4dt3YQhR0vs5HlQ
 e7a3tsSY+K0bT3FDFk+QNbeUshCOwPk1hvQnw0y8EtD3ENVegAn+3kxFlOlJ8LrdXgSM
 Yg1Ob+nNWjt+RcVZyI75NBLxbU5dOwL1TOg9QtmsdaoAsSuu5QnSxpm8tqApz+K+ZJYp
 BnvGlFZeNteyJlUjqgwUqsq6fqFmZjAGxrM3KrqeACEHimAAAOwst8Gdb42H/M9GZkiF
 OIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712254514; x=1712859314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kY+E2shk9TTjvlmztMnEOs4NCqRmJnXfRKrkxZqUteg=;
 b=NcX6WQPlJe4tmnRuBXSma76K+bXZTtdRfEnHhGgLRFHE3TCpr1iteilyN7HSg3odhs
 DBnBsSLHjavkf9tgMrYEtS8f6KG1P3rQ66QBzdho5PhExihpqmUzpfaRy2izqvwvyJCd
 Y7ikBngBShxkUIBxszWUGVZuKC/rgxOpIPwlvf/FwStdejsNfFVPxa96t8hhWOzCGULH
 9qBc3LcuzegnZsuxYEUzjwapFy4n7SnMwiM1QuVTCJHowQE8fDKJz0jAauWruMNtvuxn
 SlEYisF6zAokD8VcFPRXl2eUb4Q3kb+PgVy9cwRzhM9mwHNJed27e5LoPZ9G82HLhFFC
 2dOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8I6HZmFv+KPg1NpHphxVw4u4AQVGdViAF1/7SBpAj9tQ+dorL28cO1fF6mu7wk0X7BqyI6yL8fEkkjjUh+0khbX0dQKprIngqJYKYmbZEg0JcLLDsstReawjFjj9DXjObqg7orReSODDEyXpE6nLw3hU=
X-Gm-Message-State: AOJu0YwKeXipLywpLoDhjWUApFYcmygUkFL6nut9TFHGCrwKhxnutvB2
 iYtPV5lrAdks4uMiSh6vkDrwdExc4EiXJQpJGYLZqLHf7ChVM96j
X-Google-Smtp-Source: AGHT+IHey30qEJp/mXGAUejbX5U+sc9AsyKeLlyJm3AU7cl7lDPEg0sOe+zZaC4lHxBG8L9bfNGSWA==
X-Received: by 2002:a5d:56c2:0:b0:341:c473:2919 with SMTP id
 m2-20020a5d56c2000000b00341c4732919mr206426wrw.14.1712254513709; 
 Thu, 04 Apr 2024 11:15:13 -0700 (PDT)
Received: from localhost (ec2-18-175-17-34.eu-west-2.compute.amazonaws.com.
 [18.175.17.34]) by smtp.gmail.com with ESMTPSA id
 s14-20020a5d4ece000000b00343dc6a0019sm136463wrv.68.2024.04.04.11.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 11:15:13 -0700 (PDT)
From: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
To: mripard@kernel.org
Cc: 1054514@bugs.debian.org, airlied@redhat.com, carnil@debian.org,
 daniel@ffwll.ch, dreaming.about.electric.sheep@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 regressions@lists.linux.dev, spice-devel@lists.freedesktop.org,
 timo.lindfors@iki.fi, tzimmermann@suse.de,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 1/1] Revert "drm/qxl: simplify qxl_fence_wait"
Date: Thu,  4 Apr 2024 19:14:48 +0100
Message-Id: <20240404181448.1643-2-dreaming.about.electric.sheep@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404181448.1643-1-dreaming.about.electric.sheep@gmail.com>
References: <20240327-cuddly-smooth-trogon-59c02d@houat>
 <20240404181448.1643-1-dreaming.about.electric.sheep@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Apr 2024 07:08:44 +0000
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

This reverts commit 5a838e5d5825c85556011478abde708251cc0776.

Changes from commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") would
result in a '[TTM] Buffer eviction failed' exception whenever it reached a
timeout.
Due to a dependency to DMA_FENCE_WARN this also restores some code deleted
by commit d72277b6c37d ("dma-buf: nuke DMA_FENCE_TRACE macros v2").

Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
Link: https://lore.kernel.org/regressions/ZTgydqRlK6WX_b29@eldamar.lan/
Reported-by: Timo Lindfors <timo.lindfors@iki.fi>
Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054514
Signed-off-by: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 50 +++++++++++++++++++++++++++----
 include/linux/dma-fence.h         |  7 +++++
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..9febc8b73f09 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -58,16 +58,56 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
 			   signed long timeout)
 {
 	struct qxl_device *qdev;
+	struct qxl_release *release;
+	int count = 0, sc = 0;
+	bool have_drawable_releases;
 	unsigned long cur, end = jiffies + timeout;
 
 	qdev = container_of(fence->lock, struct qxl_device, release_lock);
+	release = container_of(fence, struct qxl_release, base);
+	have_drawable_releases = release->type == QXL_RELEASE_DRAWABLE;
 
-	if (!wait_event_timeout(qdev->release_event,
-				(dma_fence_is_signaled(fence) ||
-				 (qxl_io_notify_oom(qdev), 0)),
-				timeout))
-		return 0;
+retry:
+	sc++;
+
+	if (dma_fence_is_signaled(fence))
+		goto signaled;
+
+	qxl_io_notify_oom(qdev);
+
+	for (count = 0; count < 11; count++) {
+		if (!qxl_queue_garbage_collect(qdev, true))
+			break;
+
+		if (dma_fence_is_signaled(fence))
+			goto signaled;
+	}
+
+	if (dma_fence_is_signaled(fence))
+		goto signaled;
+
+	if (have_drawable_releases || sc < 4) {
+		if (sc > 2)
+			/* back off */
+			usleep_range(500, 1000);
+
+		if (time_after(jiffies, end))
+			return 0;
+
+		if (have_drawable_releases && sc > 300) {
+			DMA_FENCE_WARN(fence,
+				       "failed to wait on release %llu after spincount %d\n",
+				       fence->context & ~0xf0000000, sc);
+			goto signaled;
+		}
+		goto retry;
+	}
+	/*
+	 * yeah, original sync_obj_wait gave up after 3 spins when
+	 * have_drawable_releases is not set.
+	 */
 
+signaled:
 	cur = jiffies;
 	if (time_after(cur, end))
 		return 0;
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e06bad467f55..c3f9bb6602ba 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -682,4 +682,11 @@ static inline bool dma_fence_is_container(struct dma_fence *fence)
 	return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
 }
 
+#define DMA_FENCE_WARN(f, fmt, args...) \
+	do {								\
+		struct dma_fence *__ff = (f);				\
+		pr_warn("f %llu#%llu: " fmt, __ff->context, __ff->seqno,\
+			 ##args);					\
+	} while (0)
+
 #endif /* __LINUX_DMA_FENCE_H */
-- 
2.39.2

