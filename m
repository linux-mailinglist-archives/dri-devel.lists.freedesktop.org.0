Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EEAC7E848
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E0410E1A5;
	Sun, 23 Nov 2025 22:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dtsFp3MQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C70810E1A4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:51:43 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-42b32a3e78bso3096880f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938301; x=1764543101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PR8DhyhbmfM3XR45v/DX3VtwAUQ7pza2V3aAfSC4t8o=;
 b=dtsFp3MQdSbM+hyl7KPDGDkPwUs+ppvW0JB3yW+XaOFdtqtGRPgJ3tDNofHiDRUkqK
 hqaueIYifPrA/l3DVa3rZySNVBt6e6s/x9hiz8+0KCICyyd6CKX4rWZ/hFO8Dp1dWvZP
 IsbpKL5xI+HcQhleWTFYKcXC7GNSUGiWyUmttt0F4SdBTfTxtCdYh6oVq1JunLyEErX7
 NTza3kuFmOYgB/PuOT5BymyUbrREWn2qICX0IqXKb6iBxxH8xJ8BJcEJbDWZ3X2LKhys
 Y3HVsbWSxVVtgK22SAoFMbU3ULNTGbbhlFXdxwUMH9QrUJk26PxnXTPXlaMZzkKyW8iQ
 0bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938301; x=1764543101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PR8DhyhbmfM3XR45v/DX3VtwAUQ7pza2V3aAfSC4t8o=;
 b=Xqmd0hhxeKRN0R4L2fcf20h1P6ZbwjparvxvHJiWyrwvmWISGBvkc7jT2lWYgfQ6U8
 bj12uMxfrm2BlbqOUstvbQ1UYUxbTtgZid4bzkOG3DqPjFf/yZw4i8/QNt+BSdt3aFiz
 u3ehCi7YmT9CowIS8pyaQrA4R/pxXYwqvIZ4agmpGKFIpdoRVAOrg12GYyCSOIJ30qQN
 eh9kvQTQtF3BIF7/2mXgsccru627dIw6KyBDwFAscy7FazUzedrUvqutpCHy8QPur9Fn
 Ea/6piOYfC7hCuIPBtV8Hb4NwDrW+16cM/73UU9RdRGpOWSiDB/lDKNbwaPhCharbMkh
 bnTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzagKPX2D2cBI3zqDP+ouQYZ744YI2M3KPC/ZIoetaT7nJTnYE+tMu5WmS3VXuLh6U13OUMStNwPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8zCGwDCPPZdCHEU5s/TSlLIPCd10toYaFiIuZmV9LAGvoz0U5
 cmeFV2lenkwkWVtWmgaev2Qp0qh8L9b2RXiU/yBPQjxFzcBaCgTOboZg
X-Gm-Gg: ASbGnctYJuZ5sTXUmuHwPTtEJ3kRqRLVSO+nsID9swmbsHrW1mP/iUES0f/sD+oPBW2
 X7M7Vj2tmrOQcmk9tCfzDStlcGedmENh49s8KVUirt0VAu+QfnUoLaupbpQGjkPvnevPrpt390V
 oQifUXECIhR9F8nFnxPhfrZW/W8/VHnlJDyQ7yX7A9qT8X2UG6DTzKtZw98BEbjCBP/bC+ZZGrD
 igbBHWZ3JPYRpnrFbQJfcIDmB+77wjeXTpboYFhB6NKW1XGg5zGW/ZwIEn+9Pg4cd1Mmi6cKW7W
 hOqxoVfr+y06I9rctX26RTNxBXoCVcjhDCrOmSQl1MGVyClU4QZyJAhOlBWBl3w/MpcqtaESEuI
 F2j9XpdWkosTiDIiT3ZZlz/7OyBAJuhXR9Do7IepLWRQQg/UXaZOv4813394PQh4m02JWolAjH6
 8VjCEmkuQUXPXRZA==
X-Google-Smtp-Source: AGHT+IF2fkOx1psmIiI8t6n1UVP6WxxL86e2rgF4bc5zvWBkXEsJkKhYvtgfzcrreOJ89mrZR3pH7Q==
X-Received: by 2002:a05:6000:40da:b0:42b:47da:c316 with SMTP id
 ffacd0b85a97d-42cc1cc30c2mr10114899f8f.26.1763938301503; 
 Sun, 23 Nov 2025 14:51:41 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:51:40 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [RFC v2 01/11] file: add callback for pre-mapping dmabuf
Date: Sun, 23 Nov 2025 22:51:21 +0000
Message-ID: <74d689540fa200fe37f1a930165357a92fe9e68c.1763725387.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
References: <cover.1763725387.git.asml.silence@gmail.com>
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

Add a file callback that maps a dmabuf for the given file and returns
an opaque token of type struct dma_token representing the mapping. The
implementation details are hidden from the caller, and the implementors
are normally expected to extend the structure.

The callback callers will be able to pass the token with an IO request,
which implemented in following patches as a new iterator type. The user
should release the token once it's not needed by calling the provided
release callback via appropriate helpers.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/dma_token.h | 35 +++++++++++++++++++++++++++++++++++
 include/linux/fs.h        |  4 ++++
 2 files changed, 39 insertions(+)
 create mode 100644 include/linux/dma_token.h

diff --git a/include/linux/dma_token.h b/include/linux/dma_token.h
new file mode 100644
index 000000000000..9194b34282c2
--- /dev/null
+++ b/include/linux/dma_token.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_DMA_TOKEN_H
+#define _LINUX_DMA_TOKEN_H
+
+#include <linux/dma-buf.h>
+
+struct dma_token_params {
+	struct dma_buf			*dmabuf;
+	enum dma_data_direction		dir;
+};
+
+struct dma_token {
+	void (*release)(struct dma_token *);
+};
+
+static inline void dma_token_release(struct dma_token *token)
+{
+	token->release(token);
+}
+
+static inline struct dma_token *
+dma_token_create(struct file *file, struct dma_token_params *params)
+{
+	struct dma_token *res;
+
+	if (!file->f_op->dma_map)
+		return ERR_PTR(-EOPNOTSUPP);
+	res = file->f_op->dma_map(file, params);
+
+	WARN_ON_ONCE(!IS_ERR(res) && !res->release);
+
+	return res;
+}
+
+#endif
diff --git a/include/linux/fs.h b/include/linux/fs.h
index c895146c1444..0ce9a53fabec 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2262,6 +2262,8 @@ struct dir_context {
 struct iov_iter;
 struct io_uring_cmd;
 struct offset_ctx;
+struct dma_token;
+struct dma_token_params;
 
 typedef unsigned int __bitwise fop_flags_t;
 
@@ -2309,6 +2311,8 @@ struct file_operations {
 	int (*uring_cmd_iopoll)(struct io_uring_cmd *, struct io_comp_batch *,
 				unsigned int poll_flags);
 	int (*mmap_prepare)(struct vm_area_desc *);
+	struct dma_token *(*dma_map)(struct file *,
+				     struct dma_token_params *);
 } __randomize_layout;
 
 /* Supports async buffered reads */
-- 
2.52.0

