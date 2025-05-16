Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C9AAB98D7
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9B810EA0D;
	Fri, 16 May 2025 09:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E29410EA0D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:31:27 +0000 (UTC)
Received: from w003.hihonor.com (unknown [10.68.17.88])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4ZzMGZ02P2zYl3Ls;
 Fri, 16 May 2025 17:29:10 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:30:59 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 16 May
 2025 17:30:58 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <bintian.wang@honor.com>, <yipengxiang@honor.com>, <liulu.liu@honor.com>,
 <feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH v2 0/2] dma-buf: Add direct I/O support via
 DMA_BUF_IOCTL_RW_FILE
Date: Fri, 16 May 2025 17:21:46 +0800
Message-ID: <20250516092148.12778-1-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.18.117]
X-ClientProxiedBy: w002.hihonor.com (10.68.28.120) To a010.hihonor.com
 (10.68.16.52)
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

Introduce DMA_BUF_IOCTL_RW_FILE ioctl for direct file I/O on dma-buf objects.

Current flow:
1. Allocate dma-buf (buf_fd)       # Get buffer descriptor
2. Map memory (vaddr)              # Access via virtual address
3. File ops: open/lseek/read       # Read into mapped memory

Problem:
- No direct I/O support in dmabuf
- 70% read time spent on page cache & memcpy
- High latency/power with buffer I/O

Solution:
Add rw_file callback in exporter. When holding sgtable exclusively:
- Build bio_vec and set IOCB_DIRECT flag
- Use vfs_iocb_iter_read for direct I/O

Improved usage:
    dmabuf_fd = dmabuf_alloc(len, heap_fd)
    file_fd = open(file_path, O_RDONLY)
    if (direct_io) arg.flags |= DMA_BUF_RW_FLAGS_DIRECT
    ioctl(dmabuf_fd, DMA_BUF_IOCTL_RW_FILE, &arg)

Performance gains:
- Throughput: 1032MB/s -> 3776MB/s (UFS4.0 @4GB/s)
- Zero page cache overhead
- Direct path eliminates memory copies

Use cases:
- AI model loading
- Real-time data streaming
- Task snapshot storage

vs udmabuf:
- udmabuf creation slower
- udmabuf direct I/O slower than dmabuf direct I/O
- sendfile still has 1 copy vs dmabuf's zero-copy

Test (32x32MB buffer, 1GB file, UFS @4GB/s, CPU @1GHZ):
Metric                 | alloc (ms) | read (ms) | total (ms)
-----------------------|------------|-----------|-----------
udmabuf buffer read    | 539        | 2017      | 2555
udmabuf direct read    | 522        | 658       | 1179
udmabuf buffer sendfile| 505        | 1040      | 1546
udmabuf direct sendfile| 510        | 2269      | 2780
dmabuf buffer read     | 51         | 1068      | 1118
patch 1-2 direct read  | 52         | 297       | 349

v1: https://lore.kernel.org/all/20250513092803.2096-1-tao.wangtao@honor.com
v1 -> v2:
  Dma-buf exporter verify exclusive access to the dmabuf's sgtable.

wangtao (2):
  dmabuf: add DMA_BUF_IOCTL_RW_FILE
  dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for system_heap

 drivers/dma-buf/dma-buf.c           |   8 ++
 drivers/dma-buf/heaps/system_heap.c | 121 ++++++++++++++++++++++++++++
 include/linux/dma-buf.h             |  15 ++++
 include/uapi/linux/dma-buf.h        |  28 +++++++
 4 files changed, 172 insertions(+)

-- 
2.17.1

