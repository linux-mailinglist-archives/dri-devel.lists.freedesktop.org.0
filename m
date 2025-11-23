Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89976C7E85D
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D0710E1A8;
	Sun, 23 Nov 2025 22:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mOqGSiuK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA2710E1A7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:51:50 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so31532455e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938309; x=1764543109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zxuKr9/wD0hv1o+9Q16IeSgRkNQrWSlYyRysfxG3AMc=;
 b=mOqGSiuKf2ghxEowz6r0i0GGEAHDEK1F4hTZ9e9Rx7p6LDXleQzAFly4YAGs9i1fC9
 ZlxEFr7i+i/yPwtLczxDVtEXlEvsIowVtKWF7ffHkMIYuwoplM9nflOTasF5iiLbahXZ
 oKFHDmQEaHZKzwtnBtSUsX6d9q4vt0bZI0JdGV1tp+0GyuasWMxO3JLKkMGzAFwA9DnS
 jNgxmGF07BLBlDhsG1L6CLaM+ltvM+wWSR9YYkOY4RaR2oSPH8KUQ01UC43k9uF737M9
 laii1vF9L0h1TDyuBzTMZ6vOh+b9Y0iFVhm+REt60MaltlU8ojnVCGOUbinf76EBunny
 gmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938309; x=1764543109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zxuKr9/wD0hv1o+9Q16IeSgRkNQrWSlYyRysfxG3AMc=;
 b=gmjxPBrj9LOPveXCopKOv8+5XiGVTByUNiVObABf3S+ji0LGHsR4Xx+00Y0gIaTkk+
 saOrWQ9crlB6G8DKIS4x1M8sATF2vGVV9q+SkDE29rRLV9l4MCCjn6gc9XwPQ+GNVWXX
 imG7CAuX4MrWUpPspjsFtGQ/vApXgwQPXYpISKFZTTedSsq4h/3nTPEvgiLdJ95KZ5aA
 3TzV/OaUda/jE8jlAuVTZlutSp6Oc4mcTArKKn5TogtSNgZLhbXSFdXLTyE6BotbDhkj
 SpUVxkvFWm1swJ9fF6VsVGAJDuEei/cdTfPtS/ylykZcoen38m1wn9uD0IkCNCPmPp7C
 wxFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVulKX6JWGhRfKGYjrpRViqtb3jE6gDYQpQ/bycW4/GYTa6suQqWe26tJRWBfxx/1aS5cm1DTXwNUg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymVlqBIFzQuZPa0vh1kJKVRKGSj7CAWbPU49tmdu3j4LPv+tan
 4phlpM+ZdrlO9F7L043IEutKoFah/pNRpbKzOo4vC5aqoAh9/ih3/0xx
X-Gm-Gg: ASbGncvjrqgSIxRZJAaKGHiEPC0FDbn1ljc4wPil1FL2curkxD0LnOnqhreZsMIq+eV
 XV3yxPdsN4NvBCCPQZggmZRJCK7d2O0KA/ysZypfXkMyE7SNFleEtx+Ynww8+ajiIDH9Wax4Kw5
 +g+p67dhdny6vlUvOn6xMVL/O6aZnoL0Uuj0hGpZiSNjlUtcPkBp49WeH9mGkE7haaVW54CzmGt
 78VtGnxIb+mcl+VA2cWVPuV7VPKqRv4JSONxdYZ+BlNwgG3onsPyV8zQIiAULWsMdorqhGtqgZ7
 D4W19YmjWsqD03cbiARdj3sX8wO022+rbSGiMty3DbY61Y/X2veC4ho8Hgna+KpAeRd9lJDO0RR
 kNurRf/3bqH5eZU1/eLurHN1gDMGyFISkZAe4CSb2zRQxRDcpPuZxCck2hgX2B+FmZ2td+FrXio
 4r09hsBa7vll6Sdtb6L+h2zz5s
X-Google-Smtp-Source: AGHT+IF9Tqh/ORJZEo3R5Xg7ZJWy7sWzF8MjqLc9q+tvrWwYorpVbwyCo218uq/Fj/Pad8uOgoxn1g==
X-Received: by 2002:a05:600c:840f:b0:477:7479:f081 with SMTP id
 5b1f17b1804b1-477c0181443mr112383465e9.12.1763938308511; 
 Sun, 23 Nov 2025 14:51:48 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:51:47 -0800 (PST)
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
Subject: [RFC v2 04/11] block: introduce dma token backed bio type
Date: Sun, 23 Nov 2025 22:51:24 +0000
Message-ID: <12530de6d1907afb44be3e76e7668b935f1fd441.1763725387.git.asml.silence@gmail.com>
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

Premapped buffers don't require a generic bio_vec since these have
already been dma mapped. Repurpose the bi_io_vec space for the dma
token as they are mutually exclusive, and provide setup to support
dma tokens.

In order to use this, a driver must implement the dma_map blk-mq op,
in which case it must be aware that any given bio may be using a
dma_tag instead of a bio_vec.

Suggested-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/bio.c               | 21 +++++++++++++++++++++
 block/blk-merge.c         | 23 +++++++++++++++++++++++
 block/blk.h               |  3 ++-
 block/fops.c              |  2 ++
 include/linux/bio.h       | 19 ++++++++++++++++---
 include/linux/blk_types.h |  8 +++++++-
 6 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 7b13bdf72de0..8793f1ee559d 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -843,6 +843,11 @@ static int __bio_clone(struct bio *bio, struct bio *bio_src, gfp_t gfp)
 		bio_clone_blkg_association(bio, bio_src);
 	}
 
+	if (bio_flagged(bio_src, BIO_DMA_TOKEN)) {
+		bio->dma_token = bio_src->dma_token;
+		bio_set_flag(bio, BIO_DMA_TOKEN);
+	}
+
 	if (bio_crypt_clone(bio, bio_src, gfp) < 0)
 		return -ENOMEM;
 	if (bio_integrity(bio_src) &&
@@ -1167,6 +1172,18 @@ void bio_iov_bvec_set(struct bio *bio, const struct iov_iter *iter)
 	bio_set_flag(bio, BIO_CLONED);
 }
 
+void bio_iov_dma_token_set(struct bio *bio, struct iov_iter *iter)
+{
+	WARN_ON_ONCE(bio->bi_max_vecs);
+
+	bio->dma_token = iter->dma_token;
+	bio->bi_vcnt = 0;
+	bio->bi_iter.bi_bvec_done = iter->iov_offset;
+	bio->bi_iter.bi_size = iov_iter_count(iter);
+	bio->bi_opf |= REQ_NOMERGE;
+	bio_set_flag(bio, BIO_DMA_TOKEN);
+}
+
 static unsigned int get_contig_folio_len(unsigned int *num_pages,
 					 struct page **pages, unsigned int i,
 					 struct folio *folio, size_t left,
@@ -1349,6 +1366,10 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
 		bio_iov_bvec_set(bio, iter);
 		iov_iter_advance(iter, bio->bi_iter.bi_size);
 		return 0;
+	} else if (iov_iter_is_dma_token(iter)) {
+		bio_iov_dma_token_set(bio, iter);
+		iov_iter_advance(iter, bio->bi_iter.bi_size);
+		return 0;
 	}
 
 	if (iov_iter_extract_will_pin(iter))
diff --git a/block/blk-merge.c b/block/blk-merge.c
index d3115d7469df..c02a5f9c99e6 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -328,6 +328,29 @@ int bio_split_io_at(struct bio *bio, const struct queue_limits *lim,
 	unsigned nsegs = 0, bytes = 0, gaps = 0;
 	struct bvec_iter iter;
 
+	if (bio_flagged(bio, BIO_DMA_TOKEN)) {
+		int offset = offset_in_page(bio->bi_iter.bi_bvec_done);
+
+		nsegs = ALIGN(bio->bi_iter.bi_size + offset, PAGE_SIZE);
+		nsegs >>= PAGE_SHIFT;
+
+		if (offset & lim->dma_alignment || bytes & len_align_mask)
+			return -EINVAL;
+
+		if (bio->bi_iter.bi_size > max_bytes) {
+			bytes = max_bytes;
+			nsegs = (bytes + offset) >> PAGE_SHIFT;
+			goto split;
+		} else if (nsegs > lim->max_segments) {
+			nsegs = lim->max_segments;
+			bytes = PAGE_SIZE * nsegs - offset;
+			goto split;
+		}
+
+		*segs = nsegs;
+		return 0;
+	}
+
 	bio_for_each_bvec(bv, bio, iter) {
 		if (bv.bv_offset & lim->dma_alignment ||
 		    bv.bv_len & len_align_mask)
diff --git a/block/blk.h b/block/blk.h
index e4c433f62dfc..2c72f2630faf 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -398,7 +398,8 @@ static inline struct bio *__bio_split_to_limits(struct bio *bio,
 	switch (bio_op(bio)) {
 	case REQ_OP_READ:
 	case REQ_OP_WRITE:
-		if (bio_may_need_split(bio, lim))
+		if (bio_may_need_split(bio, lim) ||
+		    bio_flagged(bio, BIO_DMA_TOKEN))
 			return bio_split_rw(bio, lim, nr_segs);
 		*nr_segs = 1;
 		return bio;
diff --git a/block/fops.c b/block/fops.c
index 5e3db9fead77..41f8795874a9 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -354,6 +354,8 @@ static ssize_t __blkdev_direct_IO_async(struct kiocb *iocb,
 		 * bio_iov_iter_get_pages() and set the bvec directly.
 		 */
 		bio_iov_bvec_set(bio, iter);
+	} else if (iov_iter_is_dma_token(iter)) {
+		bio_iov_dma_token_set(bio, iter);
 	} else {
 		ret = blkdev_iov_iter_get_pages(bio, iter, bdev);
 		if (unlikely(ret))
diff --git a/include/linux/bio.h b/include/linux/bio.h
index c75a9b3672aa..f83342640e71 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -108,16 +108,26 @@ static inline bool bio_next_segment(const struct bio *bio,
 #define bio_for_each_segment_all(bvl, bio, iter) \
 	for (bvl = bvec_init_iter_all(&iter); bio_next_segment((bio), &iter); )
 
+static inline void bio_advance_iter_dma_token(struct bvec_iter *iter,
+						unsigned int bytes)
+{
+	iter->bi_bvec_done += bytes;
+	iter->bi_size -= bytes;
+}
+
 static inline void bio_advance_iter(const struct bio *bio,
 				    struct bvec_iter *iter, unsigned int bytes)
 {
 	iter->bi_sector += bytes >> 9;
 
-	if (bio_no_advance_iter(bio))
+	if (bio_no_advance_iter(bio)) {
 		iter->bi_size -= bytes;
-	else
+	} else if (bio_flagged(bio, BIO_DMA_TOKEN)) {
+		bio_advance_iter_dma_token(iter, bytes);
+	} else {
 		bvec_iter_advance(bio->bi_io_vec, iter, bytes);
 		/* TODO: It is reasonable to complete bio with error here. */
+	}
 }
 
 /* @bytes should be less or equal to bvec[i->bi_idx].bv_len */
@@ -129,6 +139,8 @@ static inline void bio_advance_iter_single(const struct bio *bio,
 
 	if (bio_no_advance_iter(bio))
 		iter->bi_size -= bytes;
+	else if (bio_flagged(bio, BIO_DMA_TOKEN))
+		bio_advance_iter_dma_token(iter, bytes);
 	else
 		bvec_iter_advance_single(bio->bi_io_vec, iter, bytes);
 }
@@ -398,7 +410,7 @@ static inline void bio_wouldblock_error(struct bio *bio)
  */
 static inline int bio_iov_vecs_to_alloc(struct iov_iter *iter, int max_segs)
 {
-	if (iov_iter_is_bvec(iter))
+	if (iov_iter_is_bvec(iter) || iov_iter_is_dma_token(iter))
 		return 0;
 	return iov_iter_npages(iter, max_segs);
 }
@@ -452,6 +464,7 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter,
 		unsigned len_align_mask);
 
 void bio_iov_bvec_set(struct bio *bio, const struct iov_iter *iter);
+void bio_iov_dma_token_set(struct bio *bio, struct iov_iter *iter);
 void __bio_release_pages(struct bio *bio, bool mark_dirty);
 extern void bio_set_pages_dirty(struct bio *bio);
 extern void bio_check_pages_dirty(struct bio *bio);
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index cbbcb9051ec3..3bc7f89d4e66 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -275,7 +275,12 @@ struct bio {
 
 	atomic_t		__bi_cnt;	/* pin count */
 
-	struct bio_vec		*bi_io_vec;	/* the actual vec list */
+	union {
+		struct bio_vec		*bi_io_vec;	/* the actual vec list */
+		/* Driver specific dma map, present only with BIO_DMA_TOKEN */
+		struct dma_token	*dma_token;
+	};
+
 
 	struct bio_set		*bi_pool;
 };
@@ -315,6 +320,7 @@ enum {
 	BIO_REMAPPED,
 	BIO_ZONE_WRITE_PLUGGING, /* bio handled through zone write plugging */
 	BIO_EMULATES_ZONE_APPEND, /* bio emulates a zone append operation */
+	BIO_DMA_TOKEN, /* Using premmaped dma buffers */
 	BIO_FLAG_LAST
 };
 
-- 
2.52.0

