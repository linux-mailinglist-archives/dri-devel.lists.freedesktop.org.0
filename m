Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AECACC3A4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2E10E13E;
	Tue,  3 Jun 2025 09:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6FD10E13E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 09:53:56 +0000 (UTC)
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bBQwM6P0wzYlSdQ;
 Tue,  3 Jun 2025 17:51:47 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 17:53:50 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 17:53:49 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <kraxel@redhat.com>, <vivek.kasireddy@intel.com>, <viro@zeniv.linux.org.uk>,
 <brauner@kernel.org>, <hughd@google.com>, <akpm@linux-foundation.org>,
 <amir73il@gmail.com>
CC: <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>, <jack@suse.cz>,
 <baolin.wang@linux.alibaba.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <bintian.wang@honor.com>, <yipengxiang@honor.com>,
 <liulu.liu@honor.com>, <feng.han@honor.com>, wangtao <tao.wangtao@honor.com>
Subject: [PATCH v4 0/4] Implement dmabuf direct I/O via copy_file_range
Date: Tue, 3 Jun 2025 17:52:41 +0800
Message-ID: <20250603095245.17478-1-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Main steps to load file data into dmabuf:
1. dmabuf_fd = dmabuf_alloc(len, heap_fd)
2. vaddr = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, dmabuf_fd, 0)
3. file_fd = open(file_path, O_RDONLY)
4. read(file_fd, vaddr, len)

dmabuf's attachment/map/fence model sets VM_PFNMAP for mmap, which lacks
direct I/O support[1]. Buffer IO causes latency when loading large AI model
files.

My previous patch added dmabuf ioctl for Direct IO file operations, showing
good performance on low-power CPUs[2][3]. Christian suggested using existing
uAPIs (read/sendfile/splice/c_f_r) instead of new ioctls.

sendfile/splice/c_f_r enable zero-copy via Direct IO for disk-disk/network:
sendfile(skt_fd, disk_fd): [DISK]-DMA->[pipe(buf)]-DMA->[NIC]
sendfile(dst_disk, src_disk): [DISK] -DMA-> [pipe(buf)] -DMA-> [DISK]

Analysis shows existing uAPIs can't achieve zero-copy disk-to-dmabuf.
Since dmabuf lacks file ops, using tmpfs for disk-to-tmpfs CPU analysis:
| Method            | CPU Copies | Key Overhead               |
|-------------------|------------|----------------------------|
| 1. Buffer R+W     | 2          | Alloc(cache) & 2 CPU copies|
| 2. Direct R+W     | 1          | GUP(usr_buf) & 1 CPU copy  |
| 3. Mmap+Buffer R  | 1          | Alloc(cache) & 1 CPU copy  |
| 4. Mmap+Direct R  | 0          | GUP(mem_buf) ~50% CPU      |
| 5. Buffer Sendfile| 1          | Alloc(cache) & 1 CPU copy  |
| 6. Direct Sendfile| 1          | Small pipe, high IRQ       |
| 7. Buffer Splice  | 1          | Alloc(cache) & 1 CPU copy  |
| 8. Direct Splice  | 1          | Larger pipe buffer         |
| 9. c_f_r          | N/A        | Cross-FS blocked           |

GUP: get_user_page
Alloc(cache): allocate page cache

Data flows:
1. [DISK] -DMA-> [Alloc(cache)] -COPY-> [usr_buf] -COPY-> [MEM]
2. [DISK] -DMA-> [GUP(usr_buf)] -COPY-> [MEM]
3. [DISK] -DMA-> [Alloc(cache)] -COPY-> [mem_buf]
4. [DISK] -DMA-> [GUP(mem_buf)]
5. [DISK] -DMA-> [pipe(Alloc(cache))] -COPY-> [tmpfs page]
6. [DISK] -DMA-> [pipe(buf)] -COPY-> [tmpfs page]
7. [DISK] -DMA-> [big_pipe(Alloc(cache))] -COPY-> [tmpfs page]
8. [DISK] -DMA-> [big_pipe(buf)] -COPY-> [tmpfs page]
9. [DISK] -DMA-> [tmpfs page] (blocked)

Key findings:
- Buffer I/O requires page cache allocation and at least one CPU copy
- Read+Write incurs excessive CPU copies and will no longer be analyzed.
  Future approaches will use Read instead of mmap+Read.
- Mmap+Direct has zero copies but 50% GUP overhead, and dmabuf doesn't support
- sendfile/splice require intermediate pipes, needing 1 CPU copy
- c_f_r limitations: Cross-FS blocks + missing memory FS support

Modifications:
1. Enable cross-FS c_f_r for memory file types
2. Add dmabuf c_f_r callbacks for [DISK]-DMA->[dmabuf]
3. Test tmpfs c_f_r locally only (no upstream) due to lock_page deadlock risks

Performance (1GHz CPU, UFS4@4GB):
1. tmpfs(memfd) direct c_f_r(1197 MB/s): +15% vs mmap&read(1014)
2. udmabuf+memfd(2318 MB/s): +50% vs mmap&read(1457 MB/s)
3. dmabuf direct c_f_r(3405 MB/s): 260% faster than buffer IO(918 MB/s)
   40% faster than udmabuf(2318 MB/s)

|    32x32MB Read 1024MB  |Creat-ms|Close-ms|  I/O-ms|I/O-MB/s| I/O%
|-------------------------|--------|--------|--------|--------|-----
| 1)Beg  dmabuf buffer R/W|     52 |      5 |   1170 |    918 | 100%
| 2)    udmabuf buffer R/W|    591 |    326 |   1281 |    838 |  91%
| 3)      memfd buffer R/W|      1 |    323 |   2370 |    453 |  49%
| 4)      memfd direct R/W|      1 |    321 |   1058 |   1014 | 110%
| 5) memfd buffer sendfile|      1 |    329 |   1577 |    681 |  74%
| 6) memfd direct sendfile|      1 |    327 |   2672 |    401 |  43%
| 7)   memfd buffer splice|      2 |    321 |   1729 |    621 |  67%
| 8)   memfd direct splice|      2 |    324 |   1528 |    702 |  76%
| 9)    memfd buffer c_f_r|      1 |    325 |   1586 |    677 |  73%
|10)    memfd direct c_f_r|      1 |    323 |    897 |   1197 | 130%
|11)      u+mfd buffer R/W|    609 |    344 |   2207 |    486 |  52%
|12)      u+mfd direct R/W|    580 |    342 |    737 |   1457 | 158%
|13) u+mfd buffer sendfile|    582 |    343 |   1270 |    845 |  92%
|14) u+mfd direct sendfile|    573 |    344 |   2254 |    476 |  51%
|15)   u+mfd buffer splice|    584 |    341 |   1202 |    893 |  97%
|16)   u+mfd direct splice|    564 |    340 |    851 |   1263 | 137%
|17)    u+mfd buffer c_f_r|    585 |    344 |   1244 |    863 |  94%
|18)    u+mfd direct c_f_r|    578 |    341 |    581 |   1848 | 201%
|19)  udmabuf buffer c_f_r|    585 |    328 |   1163 |    923 | 100%
|20)  udmabuf direct c_f_r|    579 |    328 |    464 |   2318 | 252%
|21)   dmabuf buffer c_f_r|     48 |      5 |   1058 |   1015 | 110%
|22)   dmabuf direct c_f_r|     48 |      5 |    316 |   3405 | 370%
|23)End  dmabuf buffer R/W|     48 |      5 |   1173 |    915 |  99%

u+mfd = udma+memfd = udmabuf + pre-allocated memfd combo.
Cache cleared during tests to simulate real-world large file loading.

dmabuf file Use Cases:
- Loading large AI models using dmabuf
- Real-time data capture and storage with dmabuf
- Persisting task snapshots in Android

v3 -> v4:
 Add memory_copy_file_fops to simplify code and add FMODE_ODIRECT check
 Explicitly add dependency headers for udmabuf
 Simplify rw_file implementation in udmabuf/system_heaps
 Set FMODE_ODIRECT for dmabuf supporting Direct I/O
v2 -> v3: [4]
 copy_file_range supports copying from disk files to memory files.
 Implement the copy_file_range callback functions for dmabuf/udmabuf.
v1 -> v2: [3]
 Dma-buf exporter verify exclusive access to the dmabuf's sgtable.
v1: [2]

Reference:
[1] https://lore.kernel.org/all/0393cf47-3fa2-4e32-8b3d-d5d5bdece298@amd.com
[2] https://lore.kernel.org/all/20250513092803.2096-1-tao.wangtao@honor.com
[3] https://lore.kernel.org/all/20250516092148.12778-1-tao.wangtao@honor.com
[4] https://lore.kernel.org/all/20250530103941.11092-1-tao.wangtao@honor.com

wangtao (4):
  fs: allow cross-FS copy_file_range for memory file with direct I/O
  dmabuf: Implement copy_file_range callback for dmabuf direct I/O prep
  udmabuf: Implement udmabuf direct I/O
  dmabuf:system_heap Implement system_heap dmabuf direct I/O

 drivers/dma-buf/dma-buf.c           | 32 +++++++++++++
 drivers/dma-buf/heaps/system_heap.c | 69 +++++++++++++++++++++++++++++
 drivers/dma-buf/udmabuf.c           | 54 ++++++++++++++++++++++
 fs/read_write.c                     | 64 +++++++++++++++++++++-----
 include/linux/dma-buf.h             | 16 +++++++
 include/linux/fs.h                  |  2 +
 6 files changed, 225 insertions(+), 12 deletions(-)

-- 
2.17.1

