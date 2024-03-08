Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D5B875F63
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71C110F4A1;
	Fri,  8 Mar 2024 08:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EahIp2B3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07EB10F411;
 Fri,  8 Mar 2024 01:12:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-33d38c9ca5bso916503f8f.2; 
 Thu, 07 Mar 2024 17:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709860345; x=1710465145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Owx6jt72g5QT/V0uQHGstO9uCqzU46h0v31gh/DzxSw=;
 b=EahIp2B3uHgDLtwfNw3YxKWrpiQsStSs3gn9gSCl0fQuwMxPEhSe+4QD2+Ghui/7mf
 3D20cyNuZeijjHV/7FllvFnZemygN6loQXZaJYhqEGQgQfOg6p6E9gjgimM55SaHDG2z
 T2kISG4AHCh1icTsrlz/wmVFYwFoC2S2pc2oX8TgimhZ/qVCfNw5mlZZUeZT+0f+O8hO
 L9u8pIO4/CjMxJRLjWkuYB6ZiC6ztTaMbjPsi3YGQziXLdrXkxK7MmVq+oZ9CX8jO5IT
 AdN+jYUPuPQgQ3jTW95kMnBnrJvcUPWnu0LGaFH4+LwhhuWrLHefZlx0n5Yd10MphFUC
 XpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709860345; x=1710465145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Owx6jt72g5QT/V0uQHGstO9uCqzU46h0v31gh/DzxSw=;
 b=cMiLRHvG8XSUqu4lbpze6lo5lyIqk13apSwbD7Q8l4aCYtOORbDlhPeGTE+tdlyEqL
 PAr1LAUVOml3x8ThoG1hnfbE1qUK4q6wvoQyVknINaJiiYkVlkFbNu7EV+Q4w6kA1e8+
 MQO7rc8kAbd+T2DOmHbjq/JMKi3U4aCbaztawkZKmmo2zC5sWDkVXinLA2QP1T/62Cah
 6f7aB2eKEju5nzQQsyZY6s3vBn63X+D5CZJrmD/AJcxjhiQiCcby26San50j3j71U2uP
 JpGHvpGsXgt+cN+zIJO9Gs/vDyS6aonhs144wdpRsgTpbn2BzzdpRkKftLy2fkDYqiGS
 Ic4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN6gcPcMZyXuY+qtB7qnOxTSt1L5CZxmPx0g18ngW79V5p9ftUl6HJGnnY17MgyQ7ZQL7de64Tf7UTRGoBmyzY3ogbNveCnpq3t78/oSVKwqTNSNqEpYPI81y16HObNj97OF0dTnofNe/Ngh9RjeRwQG0=
X-Gm-Message-State: AOJu0Yxx8ZkdT4Pd+lvFiWaf2CFq8g6vBIgjN1t/6PKZRLwnbUVZqwEV
 hE8AoSkKGMCq6QI1jNnnyVGokJUUMk5M+bIPx/x81E6ZBu6b/WQ/
X-Google-Smtp-Source: AGHT+IGyFK85fLcK62sC298qj//c9CgMsC5e3P8Va0z/mRDqMFtCe0XGX8iOSmZnzWnJeMlfMP112A==
X-Received: by 2002:a5d:554d:0:b0:33e:6760:6def with SMTP id
 g13-20020a5d554d000000b0033e67606defmr2195331wrw.56.1709860344707; 
 Thu, 07 Mar 2024 17:12:24 -0800 (PST)
Received: from localhost (ec2-18-169-47-158.eu-west-2.compute.amazonaws.com.
 [18.169.47.158]) by smtp.gmail.com with ESMTPSA id
 f14-20020a5d50ce000000b0033b66c2d61esm21450770wrt.48.2024.03.07.17.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 17:12:24 -0800 (PST)
From: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
To: regressions@leemhuis.info
Cc: 1054514@bugs.debian.org, airlied@redhat.com, carnil@debian.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 spice-devel@lists.freedesktop.org, timo.lindfors@iki.fi,
 tzimmermann@suse.de, virtualization@lists.linux-foundation.org,
 Alex Constantino <dreaming.about.electric.sheep@gmail.com>
Subject: [PATCH 1/1] drm/qxl: fixes qxl_fence_wait
Date: Fri,  8 Mar 2024 01:08:51 +0000
Message-Id: <20240308010851.17104-2-dreaming.about.electric.sheep@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240308010851.17104-1-dreaming.about.electric.sheep@gmail.com>
References: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
 <20240308010851.17104-1-dreaming.about.electric.sheep@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Mar 2024 08:24:25 +0000
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

Fix OOM scenario by doing multiple notifications to the OOM handler through
a busy wait logic.
Changes from commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") would
result in a '[TTM] Buffer eviction failed' exception whenever it reached a
timeout.

Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
Link: https://lore.kernel.org/regressions/fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info
Reported-by: Timo Lindfors <timo.lindfors@iki.fi>
Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054514
Signed-off-by: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..51c22e7f9647 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -20,8 +20,6 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <linux/delay.h>
-
 #include <trace/events/dma_fence.h>
 
 #include "qxl_drv.h"
@@ -59,14 +57,24 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
 {
 	struct qxl_device *qdev;
 	unsigned long cur, end = jiffies + timeout;
+	signed long iterations = 1;
+	signed long timeout_fraction = timeout;
 
 	qdev = container_of(fence->lock, struct qxl_device, release_lock);
 
-	if (!wait_event_timeout(qdev->release_event,
+	// using HZ as a factor since it is used in ttm_bo_wait_ctx too
+	if (timeout_fraction > HZ) {
+		iterations = timeout_fraction / HZ;
+		timeout_fraction = HZ;
+	}
+	for (int i = 0; i < iterations; i++) {
+		if (wait_event_timeout(
+				qdev->release_event,
 				(dma_fence_is_signaled(fence) ||
-				 (qxl_io_notify_oom(qdev), 0)),
-				timeout))
-		return 0;
+					(qxl_io_notify_oom(qdev), 0)),
+				timeout_fraction))
+			break;
+	}
 
 	cur = jiffies;
 	if (time_after(cur, end))
-- 
2.39.2

