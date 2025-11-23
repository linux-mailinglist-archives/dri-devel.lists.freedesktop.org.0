Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F84C7E854
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC67F10E1A6;
	Sun, 23 Nov 2025 22:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hq5cVK8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3677E10E1A2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:51:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42b31507ed8so3157895f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938306; x=1764543106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g6fykkTkHS7qppZkkxaQlxQiAfIqxjHL5zv+seY74S0=;
 b=Hq5cVK8HcuSjGmC+iWzEug/EngYnj0oElEultCon96DsySmcmXdTu+1UiMJcOQ4LTM
 woQhfZR74AUDt0FsvbNl9TmoHolO1eyt0xS3XWWXeWppBrUZ0xjXbZGPygxzuBD0oQ8p
 gj9ry/pEPbIX8wEw+Fso0HT5r0ocKdX9l+YmvrmxF2wBs+b+DMuP3ExSLCCR0FgTHqVX
 kbFP8XeNuaqFEUa0ggnJ/45O4FDHdhtwZXFexDtipsXUveyQWwYOOolV65XSOMDWk4RW
 I8NN2gDygNwagKUQ5x7b2VGKZhj13+Phfjy9vFmAhD/WstG3gGKuf6mfVCq1KW+uRlL6
 fGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938306; x=1764543106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g6fykkTkHS7qppZkkxaQlxQiAfIqxjHL5zv+seY74S0=;
 b=YOkK4At+GU7Cvi1ltCzbq5Wbl5oUKJKwSFeW98sYpPWy5wN/Pt6B2WbfXbQMp/+3sz
 OOkHcnfgF8X9kutt2sxzWu4SIT14wXKrq2Z01A2B6RdDi/E5Q2NUI71UK0U2qYiW1ozq
 O0pkHNy8DqybtrmqoOUG5bXCqN52bjK9/hz97kToDkbXi4WGlV/h3UB1VFp/xXKpUo/c
 FjM07mIsXWDgU/cIiC5hPI80GXc+oiI22RSJ/69TvZsyaudicTF0n24jRaEXIdP3XqRk
 zGKNNujTI+Q6C4OQu8KwJjB7av/0+5FIynv1gCupCtjqRbMeT03z9DwzeFV4Ayo/ztVg
 BEsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwTI8KIKUqHcTEMqFj86Vp5EmmdBRawYVb/LAqcU9EQRc3NhErzn1Fa80CyIO34dmMtNkT3y/MaR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1mjT4KkjWw0Vc5BmmrPy2mvjmQP5GvFMn6GZiKJdq8+a3qr8V
 R6iW1VJztPt1VN6WniIqcE820Yo3Jtp/eyFSJn24OQtyCv1w3aC1naEj
X-Gm-Gg: ASbGncs45hZIofad4axwwGt5E7ddsJRlhVZGhx9vAGA2b0gPXyRNLT1vmnzv4vnpnyY
 jhX3+Rjzxj9+Zui7paLoJcZtVVivqckA1LGJMRoc7yjU2rP6mq3zuIRq/8oKJxLkQi3qm8lv83W
 vNPy0SEZfTs54PlzAVQPcv3Bn9ThkfM15ygUKTkjVtZgSsOO0By9PmDoY7k+YT6iqzcQM3iIyHE
 079ytvyNUEW9o0BHtYX2DkjY4VWjX9LOK8BIysXQ7OctarUIj/dbGBExLmMKF3GToBhb3IsDQ9s
 PVIHShyo/ke7trZ278w9WnKBmQsJLIwlx0rCBCgoqlcwFplFMAcuYVjmNjrAPcSnXaDbjNNFWE2
 CIzkReIlNy1pOwu1huTctbhhXHj8x8wbHmTWTSkhn0zo8tf4zO8w8/C0Msfv18UYJKhVRnrczqL
 iCZT2TX9xlp/FVJg==
X-Google-Smtp-Source: AGHT+IG6zETWdv1uNEXL1H7qlBK8rzCntcx0G5cI2YCnUx99f9VimwWWKVBIKAVqjQPLH9huSPPJwA==
X-Received: by 2002:a05:6000:1448:b0:429:d3e9:65b with SMTP id
 ffacd0b85a97d-42cc1d23c3emr9659226f8f.59.1763938305625; 
 Sun, 23 Nov 2025 14:51:45 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:51:44 -0800 (PST)
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
Subject: [RFC v2 03/11] block: move around bio flagging helpers
Date: Sun, 23 Nov 2025 22:51:23 +0000
Message-ID: <6cb3193d3249ab5ca54e8aecbfc24086db09b753.1763725387.git.asml.silence@gmail.com>
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

We'll need bio_flagged() earlier in bio.h in the next patch, move it
together with all related helpers, and mark the bio_flagged()'s bio
argument as const.

Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 include/linux/bio.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/bio.h b/include/linux/bio.h
index ad2d57908c1c..c75a9b3672aa 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -46,6 +46,21 @@ static inline unsigned int bio_max_segs(unsigned int nr_segs)
 #define bio_data_dir(bio) \
 	(op_is_write(bio_op(bio)) ? WRITE : READ)
 
+static inline bool bio_flagged(const struct bio *bio, unsigned int bit)
+{
+	return bio->bi_flags & (1U << bit);
+}
+
+static inline void bio_set_flag(struct bio *bio, unsigned int bit)
+{
+	bio->bi_flags |= (1U << bit);
+}
+
+static inline void bio_clear_flag(struct bio *bio, unsigned int bit)
+{
+	bio->bi_flags &= ~(1U << bit);
+}
+
 /*
  * Check whether this bio carries any data or not. A NULL bio is allowed.
  */
@@ -225,21 +240,6 @@ static inline void bio_cnt_set(struct bio *bio, unsigned int count)
 	atomic_set(&bio->__bi_cnt, count);
 }
 
-static inline bool bio_flagged(struct bio *bio, unsigned int bit)
-{
-	return bio->bi_flags & (1U << bit);
-}
-
-static inline void bio_set_flag(struct bio *bio, unsigned int bit)
-{
-	bio->bi_flags |= (1U << bit);
-}
-
-static inline void bio_clear_flag(struct bio *bio, unsigned int bit)
-{
-	bio->bi_flags &= ~(1U << bit);
-}
-
 static inline struct bio_vec *bio_first_bvec_all(struct bio *bio)
 {
 	WARN_ON_ONCE(bio_flagged(bio, BIO_CLONED));
-- 
2.52.0

