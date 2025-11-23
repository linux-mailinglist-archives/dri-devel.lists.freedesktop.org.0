Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93429C7E869
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0FA10E1A4;
	Sun, 23 Nov 2025 22:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fQgBxlq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2602810E1A4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:52:06 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so21273245e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938325; x=1764543125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IjKpkoDBMFXqwI53pRDJnxFi7xwhurS0a3ahU0JbCgI=;
 b=fQgBxlq76rzxBzuUoWL0N7qZcTTpkUhdLBLyxYlv4wP8OBt0VxygbrEd2yIg6V4aZg
 2uIpU7potje7QlGa2gABztxw++ZzvqGv7Pe3DiyPgW1gmrpjb9liw9Mesibe+UukZLBG
 prlMiA6OcBIhEUh0CYg7YL9PNXSJSlDi7PVss+xM+j77J0u+liB55acSO0DJhFkFBKkS
 evMxQrg6jwedg/LVSrqNyAMoAaymquuWtabm92Mq2D3naKsieiCF+WlJZH/hefHsFEwA
 uqgWvd2YEqkB1yT3j2oPyILuhM/WiJwR0XhXamIKc25nPDoijgEjzKhTV4ibyfDpy0zJ
 a/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938325; x=1764543125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IjKpkoDBMFXqwI53pRDJnxFi7xwhurS0a3ahU0JbCgI=;
 b=A4KaJtrJJY+xKj9cP1Yd7Ex1XJqe8uYGVIa3uWxMnqgOVmX8gD7IAsl3yCqWqIispH
 cIf4qr5LkGNoyxX3yWHh54SAYxv2rD84BtN6Pf8Vzs3tArhehlBUO8gfYwHVRTmwoDPS
 DLoidqLkdwALgs0WJJzLLcmfAFVYzaueFnsLxJzUQVIIUoFws4ZO1sphe6QoLZRt2eOY
 1LEkEOKNCmoI3xrdAFFDtTH/njisTRFVT6KdqlmDCW5ivX5xMZn1GntkL3lokwzADCTO
 xuBkd58K5R71M09hfQDyaN2+kBG2kuRp8k4F8BWNRx0r9zyq/yhYFHJzWEvZv7uX6wBF
 wETA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6FFkNh1M5NqNi3BQSuhAlmdjYJEd1AI/LaSeasVMge268kq4Ovfi2og3WinuehGeazfpry4fN/pY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhxLDvuqIKGVQ+QFbUDVF7dCbyAy+8pA930hOR1yQUNuczoZby
 2GBX0C3nLj/R2iJkogSpvCbz1CAh88j0G3EHMZjqhowXRRP4H+BR2JqN
X-Gm-Gg: ASbGncttoY23IqyPVVVVPvRAvlOlUJVuDai8E2uAcGH13mi1T0zsoFXKoAMZ8xBTrj6
 AinsyY4e3NcfOZH7CITb4/KTSMaMPLa0UDxXUN+OyTpbsMa6XiMTdd53T+FjBXXZs2vU3kCLzQf
 toam10OZhece5j30Mt3rRnwRKiTM3r5GRCsjIXDpnOeovdUarFEM6nezUxVe2GCbqFIq9NVbWUQ
 0WsEErzYD/1q2IPJGNBxRzaSSGWbF1AdMCQAa/NvFpjeU2koB+f/CypMCcgFl06JATemCYp++4z
 oEQf40oLFMUZWfTRyrqaN5kRjS6Tn+gVdFo2dQGhUkeq6nqcH++jx52L9nCgYDGBewZS3jWXPrN
 HNrn4R5lQ3eNMr8umcdCHielK4TmSnlmdLrb+7oNq6YNV3+1qGSXe/t2A7Sln83NmNm5+POCFcd
 pME54CNdVlidbx8A==
X-Google-Smtp-Source: AGHT+IG0SGMWMdVe66Rksvn6v5FBe6opsohs/EM0p8y743GggDbgal5u09Oo75v6mEVGyS+Z85JlHQ==
X-Received: by 2002:a05:600c:8b35:b0:477:832c:86ae with SMTP id
 5b1f17b1804b1-477c111b94fmr113406075e9.12.1763938324588; 
 Sun, 23 Nov 2025 14:52:04 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:52:03 -0800 (PST)
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
 linaro-mm-sig@lists.linaro.org, David Wei <dw@davidwei.uk>
Subject: [RFC v2 11/11] io_uring/rsrc: implement dmabuf regbuf import
Date: Sun, 23 Nov 2025 22:51:31 +0000
Message-ID: <44e4ad8c4bd72856379c368e4303090c44c9e98e.1763725388.git.asml.silence@gmail.com>
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

Allow importing dmabuf backed registered buffers. It's an opt-in feature
for requests and they need to pass a flag allowing it. Furthermore,
the import will fail if the request's file doesn't match the file for
which the buffer for registered. This way, it's also limited to files
that support the feature by implementing the corresponding file op.
Enable it for read/write requests.

Suggested-by: David Wei <dw@davidwei.uk>
Suggested-by: Vishal Verma <vishal1.verma@intel.com>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 36 +++++++++++++++++++++++++++++-------
 io_uring/rsrc.h | 16 +++++++++++++++-
 io_uring/rw.c   |  4 ++--
 3 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 7dfebf459dd0..a5d88dae536e 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1201,9 +1201,27 @@ static int io_import_kbuf(int ddir, struct iov_iter *iter,
 	return 0;
 }
 
-static int io_import_fixed(int ddir, struct iov_iter *iter,
+static int io_import_dmabuf(struct io_kiocb *req,
+			   int ddir, struct iov_iter *iter,
 			   struct io_mapped_ubuf *imu,
-			   u64 buf_addr, size_t len)
+			   size_t len, size_t offset)
+{
+	struct io_regbuf_dma *db = imu->priv;
+
+	if (!len)
+		return -EFAULT;
+	if (req->file != db->target_file)
+		return -EBADF;
+
+	iov_iter_dma_token(iter, ddir, db->token, offset, len);
+	return 0;
+}
+
+static int io_import_fixed(struct io_kiocb *req,
+			   int ddir, struct iov_iter *iter,
+			   struct io_mapped_ubuf *imu,
+			   u64 buf_addr, size_t len,
+			   unsigned import_flags)
 {
 	const struct bio_vec *bvec;
 	size_t folio_mask;
@@ -1219,8 +1237,11 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 
 	offset = buf_addr - imu->ubuf;
 
-	if (imu->flags & IO_IMU_F_DMA)
-		return -EOPNOTSUPP;
+	if (imu->flags & IO_IMU_F_DMA) {
+		if (!(import_flags & IO_REGBUF_IMPORT_ALLOW_DMA))
+			return -EFAULT;
+		return io_import_dmabuf(req, ddir, iter, imu, len, offset);
+	}
 	if (imu->flags & IO_IMU_F_KBUF)
 		return io_import_kbuf(ddir, iter, imu, len, offset);
 
@@ -1274,16 +1295,17 @@ inline struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 	return NULL;
 }
 
-int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags)
+			unsigned issue_flags, unsigned import_flags)
 {
 	struct io_rsrc_node *node;
 
 	node = io_find_buf_node(req, issue_flags);
 	if (!node)
 		return -EFAULT;
-	return io_import_fixed(ddir, iter, node->buf, buf_addr, len);
+	return io_import_fixed(req, ddir, iter, node->buf, buf_addr, len,
+				import_flags);
 }
 
 /* Lock two rings at once. The rings must be different! */
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 280d3988abf3..e0eafce976f3 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -33,6 +33,10 @@ enum {
 	IO_IMU_F_DMA			= 2,
 };
 
+enum {
+	IO_REGBUF_IMPORT_ALLOW_DMA		= 1,
+};
+
 struct io_mapped_ubuf {
 	u64		ubuf;
 	unsigned int	len;
@@ -66,9 +70,19 @@ int io_rsrc_data_alloc(struct io_rsrc_data *data, unsigned nr);
 
 struct io_rsrc_node *io_find_buf_node(struct io_kiocb *req,
 				      unsigned issue_flags);
+int __io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
+			u64 buf_addr, size_t len, int ddir,
+			unsigned issue_flags, unsigned import_flags);
+
+static inline
 int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
 			u64 buf_addr, size_t len, int ddir,
-			unsigned issue_flags);
+			unsigned issue_flags)
+{
+	return __io_import_reg_buf(req, iter, buf_addr, len, ddir,
+				   issue_flags, 0);
+}
+
 int io_import_reg_vec(int ddir, struct iov_iter *iter,
 			struct io_kiocb *req, struct iou_vec *vec,
 			unsigned nr_iovs, unsigned issue_flags);
diff --git a/io_uring/rw.c b/io_uring/rw.c
index a3eb4e7bf992..0d9d99695801 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -374,8 +374,8 @@ static int io_init_rw_fixed(struct io_kiocb *req, unsigned int issue_flags,
 	if (io->bytes_done)
 		return 0;
 
-	ret = io_import_reg_buf(req, &io->iter, rw->addr, rw->len, ddir,
-				issue_flags);
+	ret = __io_import_reg_buf(req, &io->iter, rw->addr, rw->len, ddir,
+				  issue_flags, IO_REGBUF_IMPORT_ALLOW_DMA);
 	iov_iter_save_state(&io->iter, &io->iter_state);
 	return ret;
 }
-- 
2.52.0

