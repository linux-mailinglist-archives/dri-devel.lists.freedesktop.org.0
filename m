Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B66C7E842
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C5B10E162;
	Sun, 23 Nov 2025 22:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IP4rJwHU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D3610E162
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:51:40 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so31532015e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938298; x=1764543098; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QZk9sSNTwOxRpwZ/DRrF1dwGfvdtNtexBNm/jAu7ryY=;
 b=IP4rJwHUKWHDD32rCgv9hw/rZd/RTGOOE0BelbvEh/8QtsAnn9G2SQyegEKu8nysHG
 D1Z45DACPP6atzHG7+AV6xfKittKXYqvbjqrtWJCaNIz4993mkNqNzOBtUAAdklGuxe0
 EbeHKsNQe97NRVKjo4+kUf8igkFI8xxqo7ZHh965uLG2WvyjBlQDOaHtdV0qGL6Ed3iU
 hJN+MJeBqEbCvuphkdRP2Pfkmmf649GsQ7KXpHRSUsxKdPJyRAqtlmAoUyWVacNG8Pw7
 VhfcP+2feaoj5caskpGnPiur9FmAdaVdbflGyKuy/yAO2txNaR0DgR5GGVPNbxqVRK/v
 DaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938298; x=1764543098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZk9sSNTwOxRpwZ/DRrF1dwGfvdtNtexBNm/jAu7ryY=;
 b=EZBXH6PnQLth64+S/arzYlOM1VrozIugKR/H7A9lj6oW48cE+1/d/Nr0FPUZ3j6cbH
 naTpCgGwE0NdtoSZPDULoRIvU7nZvK5wcupckigPLw6Jt4utcJdWOT08RdL220DLLiar
 n5Db7z9DKkOVyP8XdO7HKEKhpQ6H64IFt0mLjbyIZ53h0zEmM0yicqhH2gfYcRaOFo6S
 +hJHKe4ecuxIHl5NngnKpM/q6/QIOo+gbIC66Rn7XyQCKBAxCejzNBml6g7DvGAqJkg9
 5jhEByqE5z2RSRtlrAfMP2KsAXhuxrF8FzlVsUZfohNPFykizwqszNRBeSMOfkqE0wH2
 yypg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfAUb9KvlkJCl8MrealPqu33pc4WCP/pMr3eklBAwcPS/gHU8NrR7RyssmebfPDdSe3zIOJoMitKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2J1c3POD4lS0rx/BFCd3HGVMI3+di/JLocJEzNbUvwPEWEFWq
 bNpIdqSBFXRSYjdN3dgjElh4hYG/olSRWKDi/S9fI0kn0wPXlhNVUhk+
X-Gm-Gg: ASbGnct8JhhQa4Ml6BFTROmFrUUw2exMJRyCgQai1LjMpkhzXO+afkl75NMmtz5NR6a
 nxMMRC6/OypVmPVjMJXiDOnEa3N5wTblH93OcdQNpWZXKWyHX5mDB4mV4TXPkI/ym41hj1a/159
 /iD8ug2PXBLjhLY304HJhfzoJDcOJ0im22qZfK87EO3Mhsl8wnrN0kgsaPeDA6rK3cA7v1LaPrf
 pXnUjkaJgR2RwCz+Z9+xWOwbSXH5fL5HaecTWNpaTFVlEFYcrkNQeIbivr7i1JgXY87qVoU6YWr
 lBlaWNZFXBKbu4S+ARbFb6BOyVLP1bUQEmjUam8Ksor+oZ2oYoGv7173EzBqY8pjm/SLm9jM98m
 YG4d5ZLJYCoe3LM0nn2lNatsnLX6KE6zA1hdi2spGS7tsnhO+8rs3UnS0bhRt47C//2mbZJTaFY
 BgA2XOrn4mJsj+vA==
X-Google-Smtp-Source: AGHT+IEIzt6XAqBENWHKeltpmV3b1E5pfBhghZPeIUxjN0aB1YgGqF8Sp/+lNyxIs5uZ/0aP6PM4yA==
X-Received: by 2002:a05:600c:5491:b0:477:fcb:226b with SMTP id
 5b1f17b1804b1-477c016e60cmr94038575e9.2.1763938298240; 
 Sun, 23 Nov 2025 14:51:38 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:51:36 -0800 (PST)
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
Subject: [RFC v2 00/11] Add dmabuf read/write via io_uring
Date: Sun, 23 Nov 2025 22:51:20 +0000
Message-ID: <cover.1763725387.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
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

Picking up the work on supporting dmabuf in the read/write path. There
are two main changes. First, it doesn't pass a dma addresss directly by
rather wraps it into an opaque structure, which is extended and
understood by the target driver.

The second big change is support for dynamic attachments, which added a
good part of complexity (see Patch 5). I kept the main machinery in nvme
at first, but move_notify can ask to kill the dma mapping asynchronously,
and any new IO would need to wait during submission, thus it was moved
to blk-mq. That also introduced an extra callback layer b/w driver and
blk-mq.

There are some rough corners, and I'm not perfectly happy about the
complexity and layering. For v3 I'll try to move the waiting up in the
stack to io_uring wrapped into library helpers.

For now, I'm interested what is the best way to test move_notify? And
how dma_resv_reserve_fences() errors should be handled in move_notify?

The uapi didn't change, after registration it looks like a normal
io_uring registered buffer and can be used as such. Only non-vectored
fixed reads/writes are allowed. Pseudo code:

// registration
reg_buf_idx = 0;
io_uring_update_buffer(ring, reg_buf_idx, { dma_buf_fd, file_fd });

// request creation
io_uring_prep_read_fixed(sqe, file_fd, buffer_offset,
                         buffer_size, file_offset, reg_buf_idx);

And as previously, a good bunch of code was taken from Keith's series [1].

liburing based example:

git: https://github.com/isilence/liburing.git dmabuf-rw
link: https://github.com/isilence/liburing/tree/dmabuf-rw

[1] https://lore.kernel.org/io-uring/20220805162444.3985535-1-kbusch@fb.com/

Pavel Begunkov (11):
  file: add callback for pre-mapping dmabuf
  iov_iter: introduce iter type for pre-registered dma
  block: move around bio flagging helpers
  block: introduce dma token backed bio type
  block: add infra to handle dmabuf tokens
  nvme-pci: add support for dmabuf reggistration
  nvme-pci: implement dma_token backed requests
  io_uring/rsrc: add imu flags
  io_uring/rsrc: extended reg buffer registration
  io_uring/rsrc: add dmabuf-backed buffer registeration
  io_uring/rsrc: implement dmabuf regbuf import

 block/Makefile                   |   1 +
 block/bdev.c                     |  14 ++
 block/bio.c                      |  21 +++
 block/blk-merge.c                |  23 +++
 block/blk-mq-dma-token.c         | 236 +++++++++++++++++++++++++++++++
 block/blk-mq.c                   |  20 +++
 block/blk.h                      |   3 +-
 block/fops.c                     |   3 +
 drivers/nvme/host/pci.c          | 217 ++++++++++++++++++++++++++++
 include/linux/bio.h              |  49 ++++---
 include/linux/blk-mq-dma-token.h |  60 ++++++++
 include/linux/blk-mq.h           |  21 +++
 include/linux/blk_types.h        |   8 +-
 include/linux/blkdev.h           |   3 +
 include/linux/dma_token.h        |  35 +++++
 include/linux/fs.h               |   4 +
 include/linux/uio.h              |  10 ++
 include/uapi/linux/io_uring.h    |  13 +-
 io_uring/rsrc.c                  | 201 +++++++++++++++++++++++---
 io_uring/rsrc.h                  |  23 ++-
 io_uring/rw.c                    |   7 +-
 lib/iov_iter.c                   |  30 +++-
 22 files changed, 948 insertions(+), 54 deletions(-)
 create mode 100644 block/blk-mq-dma-token.c
 create mode 100644 include/linux/blk-mq-dma-token.h
 create mode 100644 include/linux/dma_token.h

-- 
2.52.0

