Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6025AEE834
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 22:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C6C10E4C6;
	Mon, 30 Jun 2025 20:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dD9xMOKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEB210E4C0;
 Mon, 30 Jun 2025 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751315119;
 bh=eERbzNwhG7UaUTzdqzXK+JXcWmE1zzz2PEjd3+pzzuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dD9xMOKLVG74d/crbP3dxiDb6RZTAjXM/mn1djW+JGs8rXKiE5WMHgooSho7iZ5IH
 d9L/yHGW6BKz63FVQtIdSPXzVAIjKmlSf5z+3vXnbRnoQ7jxZ5NP0gYJfHl37TOwnb
 QHM38xWi7sLGlnFg60xQrjQJg0PjybSojyb5yz3WVdaXuFtlNCYXheqfp7nRdcMx7u
 3c9vazGkh4piArrv+FWxdwjUy6ScsfFi8JqloKkcBCAYI+2nqnMOTPMBzzz4DaP05e
 WfOJAxE5rk/QJ4xZHSBJfz12mJLIs8wEblHf93kda2onHIaYpOcjJZdLUAQEK1gicP
 v6+NmBVYBnevw==
Received: from localhost.localdomain (unknown [92.206.120.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B8CFB17E0572;
 Mon, 30 Jun 2025 22:25:18 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gert Wollny <gert.wollny@collabora.com>
Subject: [PATCH v3 2/5] drm/etnaviv: move some functions to a header to be
 able to use them externally
Date: Mon, 30 Jun 2025 22:26:28 +0200
Message-ID: <20250630202703.13844-3-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630202703.13844-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250630202703.13844-1-gert.wollny@collabora.com>
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

Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 71 +-------------------
 drivers/gpu/drm/etnaviv/etnaviv_buffer.h | 85 ++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 70 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_buffer.h

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..9e007d977efe 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -9,6 +9,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
+#include "etnaviv_buffer.h"
 
 #include "common.xml.h"
 #include "state.xml.h"
@@ -17,76 +18,6 @@
 #include "state_3d.xml.h"
 #include "cmdstream.xml.h"
 
-/*
- * Command Buffer helper:
- */
-
-
-static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
-{
-	u32 *vaddr = (u32 *)buffer->vaddr;
-
-	BUG_ON(buffer->user_size >= buffer->size);
-
-	vaddr[buffer->user_size / 4] = data;
-	buffer->user_size += 4;
-}
-
-static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
-	u32 reg, u32 value)
-{
-	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
-
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	/* write a register via cmd stream */
-	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
-		    VIV_FE_LOAD_STATE_HEADER_COUNT(1) |
-		    VIV_FE_LOAD_STATE_HEADER_OFFSET(index));
-	OUT(buffer, value);
-}
-
-static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_END_HEADER_OP_END);
-}
-
-static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
-			    unsigned int waitcycles)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
-}
-
-static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
-	u16 prefetch, u32 address)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_LINK_HEADER_OP_LINK |
-		    VIV_FE_LINK_HEADER_PREFETCH(prefetch));
-	OUT(buffer, address);
-}
-
-static inline void CMD_STALL(struct etnaviv_cmdbuf *buffer,
-	u32 from, u32 to)
-{
-	buffer->user_size = ALIGN(buffer->user_size, 8);
-
-	OUT(buffer, VIV_FE_STALL_HEADER_OP_STALL);
-	OUT(buffer, VIV_FE_STALL_TOKEN_FROM(from) | VIV_FE_STALL_TOKEN_TO(to));
-}
-
-static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
-{
-	CMD_LOAD_STATE(buffer, VIVS_GL_SEMAPHORE_TOKEN,
-		       VIVS_GL_SEMAPHORE_TOKEN_FROM(from) |
-		       VIVS_GL_SEMAPHORE_TOKEN_TO(to));
-}
-
 static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
 	struct etnaviv_cmdbuf *buffer, u8 pipe)
 {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.h b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
new file mode 100644
index 000000000000..caf820d91ef5
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.h
@@ -0,0 +1,85 @@
+
+
+#ifndef etnaviv_buffer_h
+#define etnaviv_buffer_h
+
+#include "etnaviv_cmdbuf.h"
+#include "etnaviv_gpu.h"
+#include "etnaviv_gem.h"
+#include "etnaviv_mmu.h"
+
+#include "common.xml.h"
+#include "linux/printk.h"
+#include "state.xml.h"
+#include "state_blt.xml.h"
+#include "state_hi.xml.h"
+#include "state_3d.xml.h"
+#include "cmdstream.xml.h"
+
+static inline void OUT(struct etnaviv_cmdbuf *buffer, u32 data)
+{
+	u32 *vaddr = (u32 *)buffer->vaddr;
+
+	BUG_ON(buffer->user_size >= buffer->size);
+
+	vaddr[buffer->user_size / 4] = data;
+	buffer->user_size += 4;
+}
+
+static inline void CMD_LOAD_STATE(struct etnaviv_cmdbuf *buffer,
+	u32 reg, u32 value)
+{
+
+	u32 index = reg >> VIV_FE_LOAD_STATE_HEADER_OFFSET__SHR;
+
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	/* write a register via cmd stream */
+	OUT(buffer, VIV_FE_LOAD_STATE_HEADER_OP_LOAD_STATE |
+		    VIV_FE_LOAD_STATE_HEADER_COUNT(1) |
+		    VIV_FE_LOAD_STATE_HEADER_OFFSET(index));
+	OUT(buffer, value);
+}
+
+static inline void CMD_END(struct etnaviv_cmdbuf *buffer)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_END_HEADER_OP_END);
+}
+
+static inline void CMD_WAIT(struct etnaviv_cmdbuf *buffer,
+			    unsigned int waitcycles)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_WAIT_HEADER_OP_WAIT | waitcycles);
+}
+
+static inline void CMD_LINK(struct etnaviv_cmdbuf *buffer,
+	u16 prefetch, u32 address)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_LINK_HEADER_OP_LINK |
+		    VIV_FE_LINK_HEADER_PREFETCH(prefetch));
+	OUT(buffer, address);
+}
+
+static inline void CMD_STALL(struct etnaviv_cmdbuf *buffer,
+	u32 from, u32 to)
+{
+	buffer->user_size = ALIGN(buffer->user_size, 8);
+
+	OUT(buffer, VIV_FE_STALL_HEADER_OP_STALL);
+	OUT(buffer, VIV_FE_STALL_TOKEN_FROM(from) | VIV_FE_STALL_TOKEN_TO(to));
+}
+
+static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
+{
+	CMD_LOAD_STATE(buffer, VIVS_GL_SEMAPHORE_TOKEN,
+		       VIVS_GL_SEMAPHORE_TOKEN_FROM(from) |
+		       VIVS_GL_SEMAPHORE_TOKEN_TO(to));
+}
+
+#endif
-- 
2.49.0

