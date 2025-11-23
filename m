Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10466C7E86F
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F02110E1AA;
	Sun, 23 Nov 2025 22:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CW6PvPu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDAC10E1A9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:51:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so2333317f8f.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938318; x=1764543118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cr1T3mHouFLI2INVVeu1NU8Ohycgb7ruAKm6sUveqNE=;
 b=CW6PvPu8162JyveUPoADTvLLqEYxpXybi++sIK1Tzc16FCLSkLk/YRnFGhdlrYaEaD
 +sf97WJeNFP/y9SNZnGEk8u3+qGotHL4mUPeG9sJk6bFZJtMCDujfrRd54b+iHRoeT/Y
 G9BO6XpGqudI6fzth0X4OuiK2e0vUUsLONxnVASD7B2fjkOZn20tr3m5KoFStYDxUDj5
 M8wBR8cmfiusEA1gscOY2/KpDBPDSps6hywAPAIc0DxXZRBg95cGjtIsSLTtqLx0HEv0
 I5ps2Nl3qsc7aGgh9QbAJno8GbLGoND62YYwUpRoNL3GQSNUN6n/ydu0YUQHayeLrI8Y
 exSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938318; x=1764543118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Cr1T3mHouFLI2INVVeu1NU8Ohycgb7ruAKm6sUveqNE=;
 b=vUh8gP8VdSkXBy4loYibZJq/o1yjnHXw5lB4ghH25vGqu8rR65zweNSz+NqFU7LuRG
 RRqRs9gygOp4ILrsLNihgnrZhGqRz/1or7dL16L86Wa6rV882+WH8kLB6GdL4xXcGdpL
 r27msJGO6QH1rdUntIvtG0dGev/yZBeUrdXxNEmUbhCSYdxhEX0tOPVfAhiVRBtJS92M
 sb7bioBEUIf57CudOb8hd31Gqr+GkQuFH4TMS6+Arrk51wBDecm6ywPXmsLQRyssA7jv
 XhzpyIDxg68CbLMYnjfgoZepVETdW712Pf+R+YZYRGUIaXBj/n0qH6Zhowvdcfh5A1if
 IxyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNAlOLqWL095dJ8C0lKRu5i7lLwpSmpFQLkl3mEkBTxzaKto//T0LuJeHs5IqvxManRQu33P9nGvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDBjzNnR5AmgCqwhbj7PH5ZVr/Af9aL+EIAYbuM8quNBilHuYx
 s/ptZ1dNHgv/8dx8bmJp8lHwod9AYd68cz+NQ6RLPeFZwAyeQzT7I1Da
X-Gm-Gg: ASbGncvq2yBYV8xjsx8NQTNjyeJk0Q4+wLGMUrj0jB7y53+Nl5SNR2XE26yBO6+csT0
 f206J9iDqNNtxRwj6Jp3naqMCfwfDZS4HLZ2uYpWgivECPyVeQfMWunQNHODfRdHQOXOWsgRHfa
 tXf5kTsXRqrAZ+LDJ5vcOviiIJZXtyjFmH3nCzeCuipjIGH9oIui9T+ko+F+MVQNaul2cqHbT8P
 8IAOUvq1GPO+lm9N5v0gMwX4OSjYZuUrr/f7pxhj/LyzbBLruZrFuQMlWDnoa4H4KXieysLfoFc
 88CHhfDmJnEs7HYKPjef4/0kpxBDUq7T+zayIPoDIm0grAUiXtsdJsi7go5Ap7TKnEsZLcpl54/
 UuEdAGrq1WgGG7lTX6F1Slsnr7MwRe3kDBbA5F/Nq10ijTJwVLJzBXZw3ejdFT1AP8G8xg9+pyG
 ofkRduIs8fUcsmkQ==
X-Google-Smtp-Source: AGHT+IFWQMi7JjnPU4iNqrFrw/2a7As2OTjK90JEPF3SEC3P6oOl1QIY7pfuaXnoytjEpQNeSrnvkg==
X-Received: by 2002:a05:6000:200c:b0:42b:4139:579e with SMTP id
 ffacd0b85a97d-42cc1d1983fmr10129976f8f.43.1763938317609; 
 Sun, 23 Nov 2025 14:51:57 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:51:56 -0800 (PST)
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
Subject: [RFC v2 08/11] io_uring/rsrc: add imu flags
Date: Sun, 23 Nov 2025 22:51:28 +0000
Message-ID: <25a416c7f2673d39ae31bfe8bddcfc7eef710e71.1763725388.git.asml.silence@gmail.com>
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

Replace is_kbuf with a flags field in io_mapped_ubuf. There will be new
flags shortly, and bit fields are often not as convenient to work with.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 12 ++++++------
 io_uring/rsrc.h |  6 +++++-
 io_uring/rw.c   |  3 ++-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 3765a50329a8..21548942e80d 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -828,7 +828,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	imu->folio_shift = PAGE_SHIFT;
 	imu->release = io_release_ubuf;
 	imu->priv = imu;
-	imu->is_kbuf = false;
+	imu->flags = 0;
 	imu->dir = IO_IMU_DEST | IO_IMU_SOURCE;
 	if (coalesced)
 		imu->folio_shift = data.folio_shift;
@@ -985,7 +985,7 @@ int io_buffer_register_bvec(struct io_uring_cmd *cmd, struct request *rq,
 	refcount_set(&imu->refs, 1);
 	imu->release = release;
 	imu->priv = rq;
-	imu->is_kbuf = true;
+	imu->flags = IO_IMU_F_KBUF;
 	imu->dir = 1 << rq_data_dir(rq);
 
 	rq_for_each_bvec(bv, rq, rq_iter)
@@ -1020,7 +1020,7 @@ int io_buffer_unregister_bvec(struct io_uring_cmd *cmd, unsigned int index,
 		ret = -EINVAL;
 		goto unlock;
 	}
-	if (!node->buf->is_kbuf) {
+	if (!(node->buf->flags & IO_IMU_F_KBUF)) {
 		ret = -EBUSY;
 		goto unlock;
 	}
@@ -1086,7 +1086,7 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 
 	offset = buf_addr - imu->ubuf;
 
-	if (imu->is_kbuf)
+	if (imu->flags & IO_IMU_F_KBUF)
 		return io_import_kbuf(ddir, iter, imu, len, offset);
 
 	/*
@@ -1511,7 +1511,7 @@ int io_import_reg_vec(int ddir, struct iov_iter *iter,
 	iovec_off = vec->nr - nr_iovs;
 	iov = vec->iovec + iovec_off;
 
-	if (imu->is_kbuf) {
+	if (imu->flags & IO_IMU_F_KBUF) {
 		int ret = io_kern_bvec_size(iov, nr_iovs, imu, &nr_segs);
 
 		if (unlikely(ret))
@@ -1549,7 +1549,7 @@ int io_import_reg_vec(int ddir, struct iov_iter *iter,
 		req->flags |= REQ_F_NEED_CLEANUP;
 	}
 
-	if (imu->is_kbuf)
+	if (imu->flags & IO_IMU_F_KBUF)
 		return io_vec_fill_kern_bvec(ddir, iter, imu, iov, nr_iovs, vec);
 
 	return io_vec_fill_bvec(ddir, iter, imu, iov, nr_iovs, vec);
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index d603f6a47f5e..7c1128a856ec 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -28,6 +28,10 @@ enum {
 	IO_IMU_SOURCE	= 1 << ITER_SOURCE,
 };
 
+enum {
+	IO_IMU_F_KBUF			= 1,
+};
+
 struct io_mapped_ubuf {
 	u64		ubuf;
 	unsigned int	len;
@@ -37,7 +41,7 @@ struct io_mapped_ubuf {
 	unsigned long	acct_pages;
 	void		(*release)(void *);
 	void		*priv;
-	bool		is_kbuf;
+	u8		flags;
 	u8		dir;
 	struct bio_vec	bvec[] __counted_by(nr_bvecs);
 };
diff --git a/io_uring/rw.c b/io_uring/rw.c
index a7b568c3dfe8..a3eb4e7bf992 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -706,7 +706,8 @@ static ssize_t loop_rw_iter(int ddir, struct io_rw *rw, struct iov_iter *iter)
 	if ((kiocb->ki_flags & IOCB_NOWAIT) &&
 	    !(kiocb->ki_filp->f_flags & O_NONBLOCK))
 		return -EAGAIN;
-	if ((req->flags & REQ_F_BUF_NODE) && req->buf_node->buf->is_kbuf)
+	if ((req->flags & REQ_F_BUF_NODE) &&
+	    (req->buf_node->buf->flags & IO_IMU_F_KBUF))
 		return -EFAULT;
 
 	ppos = io_kiocb_ppos(kiocb);
-- 
2.52.0

