Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E86FC7E864
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B0E10E1AD;
	Sun, 23 Nov 2025 22:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UjVm27mR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA14C10E1A4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:52:00 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-429c7869704so3097077f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938319; x=1764543119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDOUZTVJgMkXOYK0w7myV3C8dq9FH3xgeb/1ORThyV0=;
 b=UjVm27mRaafnueGWcDbEoeuRov7ATvzenoNBxC+3LNk7I1eqM2W7+93aqNwSDd8OJ0
 hQNlFQSCuSF1ePQ00WF4jciqXLFwT7cGV8MDLQaxKqBF+ee6RyiThiCyrq7Lpsuw5o9P
 UMKh1dGD2D4zLeSJTn4u/9tDDnz4019FlVHCpHAJ5BrsDfPMiTgO3QrPMs4b0ZKtFLlz
 dYrwsDYxSKiTvmRAdRzjSHxYjAN3mSeLe/7b4VGArtiOej+YUAP3roKch980CygqE/Iv
 ftnifnyvnhGvUnZ5nbiOofxoSgVuzNYDnqtAQXxy/t+nHjB3aeD0sDzPUjAN9mbv7uWd
 NPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938319; x=1764543119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iDOUZTVJgMkXOYK0w7myV3C8dq9FH3xgeb/1ORThyV0=;
 b=miS2WwWxG63r9yF77JxhwbQ6i9CD6cC2RNs9/aVNhAra4H3DTigAcK3uispdvfxRpb
 uUdJ2bRjNoJ2KzToiO9rpKkrCAQIScY8t0GjK3IFgY4mkVMuUoDoqeVtY97bK0roVtjm
 2tLWggIVNDSosBqXTRaND1Ing31hSGDUPj5aMJvS/AeG+7dG34xcW/7DAkmtVO9yCWrE
 8qvpIVXjvNqlzC6ioQQthmfDBBwR1benj60Zi45MwHaXCcd5bFu/iYrXVkb7xhbjR+4a
 WEWmZbAQ7Uf1wMbmCxxS8H35p6mMVctK3eR2KvlbywNW0Oatft39AZUMqn1qKc18/pJd
 PHlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIerZ2R8ThrC/3OYs4L7EsI5HZUUsj9Z9SXlPQ3lRWlf3lt+1+Q6Ux+CvKZmO8LVtsm6/HaoTS+bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb6KlPwEDwRlf9VmkrniKTd2F7pi9L+rEuq0aWgTxhV4GN1Dxl
 LlFG1zNA9iJ9aTwNrXy3Ma3yZPOQpHYLm6wMxgfc8mHXhb3lHVWTiK8o
X-Gm-Gg: ASbGncvxEuNZGRxG0Ic5kyNSpJF8pG6RUC97dABT5GRHstopAo40IE0uWcj9aMBm7Cu
 IGv6TvKdqwg9SPBayP+kmmuUaNSnJOQt+fu7WBo3wD/H/J5FvnnjXxR2SruVbT7HZ19FaDbo0un
 vTBiEAueR6/+QJxDLaD6mIMsRl5JtmZy0XIcIoxELr9SlzJPFBgMZoj+C8EUcKKeZovdeMoRBwk
 iOlw77cVL9HJi6xI5JgIVkYdopzHyIAP+Z5MByEX/iIkbUM9nUpZdUepm4giYBPcqwtZwBQ9FU8
 Qv/sAyQiF8kuwGCsPyvGArPCmyQacYPFfXF9Yneg3AY1e9R6GmhAGUPa7r2DZXPx1LDuLKDd3Gr
 +twjnKKRbvSv8zq9WZPI3emUkTL5r0pkud0Me/s1PmLyTPJkAbbOvqafOFLlNlJ0w/8Glq83Z30
 SVOAeE31Zlbzympw==
X-Google-Smtp-Source: AGHT+IEVGZmbP6f6xRHNG0YOhugv/nk9aBAFhUarY2FYYdxDanQ12tfVqCx9OnxuzVxk1JyVJaIagQ==
X-Received: by 2002:a5d:588c:0:b0:42b:4069:428a with SMTP id
 ffacd0b85a97d-42cc1cd5d0bmr10157686f8f.12.1763938319012; 
 Sun, 23 Nov 2025 14:51:59 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:51:58 -0800 (PST)
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
Subject: [RFC v2 09/11] io_uring/rsrc: extended reg buffer registration
Date: Sun, 23 Nov 2025 22:51:29 +0000
Message-ID: <f2f71704fd54b6063d66ff7da24630b3788e722e.1763725388.git.asml.silence@gmail.com>
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

We'll need to pass extra information for buffer registration apart from
iovec, add a flag to struct io_uring_rsrc_update2 that tells that its
data fields points to an extended registration structure, i.e.
struct io_uring_reg_buffer. To do normal registration the user has to
set target_fd and dmabuf_fd fields to -1, and any other combination is
currently rejected.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/uapi/linux/io_uring.h | 13 ++++++++-
 io_uring/rsrc.c               | 53 +++++++++++++++++++++++++++--------
 2 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index deb772222b6d..f64d1f246b93 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -765,15 +765,26 @@ struct io_uring_rsrc_update {
 	__aligned_u64 data;
 };
 
+/* struct io_uring_rsrc_update2::flags */
+enum io_uring_rsrc_reg_flags {
+	IORING_RSRC_F_EXTENDED_UPDATE		= 1,
+};
+
 struct io_uring_rsrc_update2 {
 	__u32 offset;
-	__u32 resv;
+	__u32 flags;
 	__aligned_u64 data;
 	__aligned_u64 tags;
 	__u32 nr;
 	__u32 resv2;
 };
 
+struct io_uring_reg_buffer {
+	__aligned_u64		iov_uaddr;
+	__s32			target_fd;
+	__s32			dmabuf_fd;
+};
+
 /* Skip updating fd indexes set to this value in the fd table */
 #define IORING_REGISTER_FILES_SKIP	(-2)
 
diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 21548942e80d..691f9645d04c 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -27,7 +27,8 @@ struct io_rsrc_update {
 	u32				offset;
 };
 
-static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
+static struct io_rsrc_node *
+io_sqe_buffer_register(struct io_ring_ctx *ctx, struct io_uring_reg_buffer *rb,
 			struct iovec *iov, struct page **last_hpage);
 
 /* only define max */
@@ -234,6 +235,8 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
 
 	if (!ctx->file_table.data.nr)
 		return -ENXIO;
+	if (up->flags)
+		return -EINVAL;
 	if (up->offset + nr_args > ctx->file_table.data.nr)
 		return -EINVAL;
 
@@ -288,10 +291,18 @@ static int __io_sqe_files_update(struct io_ring_ctx *ctx,
 	return done ? done : err;
 }
 
+static inline void io_default_reg_buf(struct io_uring_reg_buffer *rb)
+{
+	memset(rb, 0, sizeof(*rb));
+	rb->target_fd = -1;
+	rb->dmabuf_fd = -1;
+}
+
 static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 				   struct io_uring_rsrc_update2 *up,
 				   unsigned int nr_args)
 {
+	bool extended_entry = up->flags & IORING_RSRC_F_EXTENDED_UPDATE;
 	u64 __user *tags = u64_to_user_ptr(up->tags);
 	struct iovec fast_iov, *iov;
 	struct page *last_hpage = NULL;
@@ -302,14 +313,32 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 
 	if (!ctx->buf_table.nr)
 		return -ENXIO;
+	if (up->flags & ~IORING_RSRC_F_EXTENDED_UPDATE)
+		return -EINVAL;
 	if (up->offset + nr_args > ctx->buf_table.nr)
 		return -EINVAL;
 
 	for (done = 0; done < nr_args; done++) {
+		struct io_uring_reg_buffer rb;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
-		uvec = u64_to_user_ptr(user_data);
+		if (extended_entry) {
+			if (copy_from_user(&rb, u64_to_user_ptr(user_data),
+					   sizeof(rb)))
+				return -EFAULT;
+			user_data += sizeof(rb);
+		} else {
+			io_default_reg_buf(&rb);
+			rb.iov_uaddr = user_data;
+
+			if (ctx->compat)
+				user_data += sizeof(struct compat_iovec);
+			else
+				user_data += sizeof(struct iovec);
+		}
+
+		uvec = u64_to_user_ptr(rb.iov_uaddr);
 		iov = iovec_from_user(uvec, 1, 1, &fast_iov, ctx->compat);
 		if (IS_ERR(iov)) {
 			err = PTR_ERR(iov);
@@ -322,7 +351,7 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 		err = io_buffer_validate(iov);
 		if (err)
 			break;
-		node = io_sqe_buffer_register(ctx, iov, &last_hpage);
+		node = io_sqe_buffer_register(ctx, &rb, iov, &last_hpage);
 		if (IS_ERR(node)) {
 			err = PTR_ERR(node);
 			break;
@@ -337,10 +366,6 @@ static int __io_sqe_buffers_update(struct io_ring_ctx *ctx,
 		i = array_index_nospec(up->offset + done, ctx->buf_table.nr);
 		io_reset_rsrc_node(ctx, &ctx->buf_table, i);
 		ctx->buf_table.nodes[i] = node;
-		if (ctx->compat)
-			user_data += sizeof(struct compat_iovec);
-		else
-			user_data += sizeof(struct iovec);
 	}
 	return done ? done : err;
 }
@@ -375,7 +400,7 @@ int io_register_files_update(struct io_ring_ctx *ctx, void __user *arg,
 	memset(&up, 0, sizeof(up));
 	if (copy_from_user(&up, arg, sizeof(struct io_uring_rsrc_update)))
 		return -EFAULT;
-	if (up.resv || up.resv2)
+	if (up.resv2)
 		return -EINVAL;
 	return __io_register_rsrc_update(ctx, IORING_RSRC_FILE, &up, nr_args);
 }
@@ -389,7 +414,7 @@ int io_register_rsrc_update(struct io_ring_ctx *ctx, void __user *arg,
 		return -EINVAL;
 	if (copy_from_user(&up, arg, sizeof(up)))
 		return -EFAULT;
-	if (!up.nr || up.resv || up.resv2)
+	if (!up.nr || up.resv2)
 		return -EINVAL;
 	return __io_register_rsrc_update(ctx, type, &up, up.nr);
 }
@@ -493,7 +518,7 @@ int io_files_update(struct io_kiocb *req, unsigned int issue_flags)
 	up2.data = up->arg;
 	up2.nr = 0;
 	up2.tags = 0;
-	up2.resv = 0;
+	up2.flags = 0;
 	up2.resv2 = 0;
 
 	if (up->offset == IORING_FILE_INDEX_ALLOC) {
@@ -778,6 +803,7 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
 }
 
 static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
+						   struct io_uring_reg_buffer *rb,
 						   struct iovec *iov,
 						   struct page **last_hpage)
 {
@@ -790,6 +816,9 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	struct io_imu_folio_data data;
 	bool coalesced = false;
 
+	if (rb->dmabuf_fd != -1 || rb->target_fd != -1)
+		return NULL;
+
 	if (!iov->iov_base)
 		return NULL;
 
@@ -887,6 +916,7 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 		memset(iov, 0, sizeof(*iov));
 
 	for (i = 0; i < nr_args; i++) {
+		struct io_uring_reg_buffer rb;
 		struct io_rsrc_node *node;
 		u64 tag = 0;
 
@@ -913,7 +943,8 @@ int io_sqe_buffers_register(struct io_ring_ctx *ctx, void __user *arg,
 			}
 		}
 
-		node = io_sqe_buffer_register(ctx, iov, &last_hpage);
+		io_default_reg_buf(&rb);
+		node = io_sqe_buffer_register(ctx, &rb, iov, &last_hpage);
 		if (IS_ERR(node)) {
 			ret = PTR_ERR(node);
 			break;
-- 
2.52.0

