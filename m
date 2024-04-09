Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A2C89DA8C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDE710E5D3;
	Tue,  9 Apr 2024 13:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gz9+bP/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC1810E5D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:39:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3835BCE1F29;
 Tue,  9 Apr 2024 13:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B8DC43390;
 Tue,  9 Apr 2024 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712669990;
 bh=NlCnClFQH/uZ929V7ZbiGAE/v+SqP5ye30qi4yMGgT4=;
 h=From:To:Cc:Subject:Date:From;
 b=gz9+bP/NQQKA3q5/7+iA5EmQBknvdLRXCJqhSxDYKUnYOOXHQl7v4xCI76GZyaVPR
 t3S2pEJYWHinI58cNsT3RbjM7zqEdeMSSraZ7/BzG3u2l1743I34XsRFBPkVcGc3bC
 Y7rRjxR94vd0rmtvzFCEcdtkx8hcc3VS8t2j1eMJFVW/ENdMg4a3qudxJBQmr9KnYF
 d+DgY+UO7CK8zByRebkyddA+jIlCQ6zShKiVzMkZEsvb3j1WX2aR8WUkdrQAy2Cex0
 HLlA/grRpTLYL5J/AYgQySKUTm6gOcejwYoqjNJJsGnlP810MZsFlzkVtVIVbZiFV+
 sAwKfyMo5S0+g==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] accel/qaic: mark debugfs stub functions as static inline
Date: Tue,  9 Apr 2024 15:39:35 +0200
Message-Id: <20240409133945.2976190-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

The alternative stub functions are listed as global, which produces
a build failure in some configs:

In file included from drivers/accel/qaic/qaic_drv.c:31:
drivers/accel/qaic/qaic_debugfs.h:16:5: error: no previous prototype for 'qaic_bootlog_register' [-Werror=missing-prototypes]
   16 | int qaic_bootlog_register(void) { return 0; }
      |     ^~~~~~~~~~~~~~~~~~~~~
drivers/accel/qaic/qaic_debugfs.h:17:6: error: no previous prototype for 'qaic_bootlog_unregister' [-Werror=missing-prototypes]
   17 | void qaic_bootlog_unregister(void) {}
      |      ^~~~~~~~~~~~~~~~~~~~~~~
drivers/accel/qaic/qaic_debugfs.h:18:6: error: no previous prototype for 'qaic_debugfs_init' [-Werror=missing-prototypes]
   18 | void qaic_debugfs_init(struct qaic_drm_device *qddev) {}
      |      ^~~~~~~~~~~~~~~~~

Make them static inline as intended.

Fixes: 5f8df5c6def6 ("accel/qaic: Add bootlog debugfs")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/accel/qaic/qaic_debugfs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_debugfs.h b/drivers/accel/qaic/qaic_debugfs.h
index ea3fd1a88405..05e74f84cf9f 100644
--- a/drivers/accel/qaic/qaic_debugfs.h
+++ b/drivers/accel/qaic/qaic_debugfs.h
@@ -13,8 +13,8 @@ int qaic_bootlog_register(void);
 void qaic_bootlog_unregister(void);
 void qaic_debugfs_init(struct qaic_drm_device *qddev);
 #else
-int qaic_bootlog_register(void) { return 0; }
-void qaic_bootlog_unregister(void) {}
-void qaic_debugfs_init(struct qaic_drm_device *qddev) {}
+static inline int qaic_bootlog_register(void) { return 0; }
+static inline void qaic_bootlog_unregister(void) {}
+static inline void qaic_debugfs_init(struct qaic_drm_device *qddev) {}
 #endif /* CONFIG_DEBUG_FS */
 #endif /* __QAIC_DEBUGFS_H__ */
-- 
2.39.2

