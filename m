Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C19F2657
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 22:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E581210E035;
	Sun, 15 Dec 2024 21:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Q+oLF/Kz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD8410E035
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 21:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=cHBKF03U+jZMko8P8Q0VvvH1LhKjNSPqXhElrlL/24A=; b=Q+oLF/Kz0ZXyL/Ma
 D8lb9TCiSdsTRdc4cphsUJmWW1nLfRC/HsDrtogd8Q0N5olIj4B2DvUwzdkNOA8FA3dW+KFFmyR3M
 JBKo2v5ZIJIj5cxeiN1zyXL79vppwgd2l4oS+bEXRzf/nONqiU8gdohV14kn6yQRZ2ar8P3bf3jr2
 YMvg3x6ORhsd0SpIaXGWahVrPPLSB+gkrC7tHFrqOqGLNrT0sUlyugPICmGGZK1xLnmKinTCBT3Lb
 W60z1CCgQPGnaJ3CAGr3wjnIn31S8Ck30gXsRSqlsGNEUp1q9pz2A2R+2eNJJUeiGygyEzLBhBzvH
 mV8EP/3b2iWHrSWnkw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tMwSt-005UzH-1n;
 Sun, 15 Dec 2024 21:47:51 +0000
From: linux@treblig.org
To: thierry.reding@gmail.com, mperttunen@nvidia.com,
 linux-tegra@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] gpu: host1x: Remove unused host1x_debug_dump_syncpts
Date: Sun, 15 Dec 2024 21:47:50 +0000
Message-ID: <20241215214750.448209-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

host1x_debug_dump_syncpts() has been unused since
commit f0fb260a0cdb ("gpu: host1x: Implement syncpoint wait using DMA
fences")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/host1x/debug.c | 9 ---------
 drivers/gpu/host1x/debug.h | 1 -
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index a18cc8d8caf5..6433c00d5d7e 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -216,12 +216,3 @@ void host1x_debug_dump(struct host1x *host1x)
 
 	show_all(host1x, &o, true);
 }
-
-void host1x_debug_dump_syncpts(struct host1x *host1x)
-{
-	struct output o = {
-		.fn = write_to_printk
-	};
-
-	show_syncpts(host1x, &o, false);
-}
diff --git a/drivers/gpu/host1x/debug.h b/drivers/gpu/host1x/debug.h
index 62bd8a091fa7..c43c61d876a9 100644
--- a/drivers/gpu/host1x/debug.h
+++ b/drivers/gpu/host1x/debug.h
@@ -41,6 +41,5 @@ extern unsigned int host1x_debug_trace_cmdbuf;
 void host1x_debug_init(struct host1x *host1x);
 void host1x_debug_deinit(struct host1x *host1x);
 void host1x_debug_dump(struct host1x *host1x);
-void host1x_debug_dump_syncpts(struct host1x *host1x);
 
 #endif
-- 
2.47.1

