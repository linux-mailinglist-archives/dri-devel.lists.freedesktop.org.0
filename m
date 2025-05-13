Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC5AB641D
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 09:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4225C10E24A;
	Wed, 14 May 2025 07:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta20.hihonor.com (mta20.hihonor.com [81.70.206.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490C510E378
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 09:53:36 +0000 (UTC)
Received: from w012.hihonor.com (unknown [10.68.27.189])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4ZxWWL4RR0zYl4S7;
 Tue, 13 May 2025 17:33:50 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 17:35:53 +0800
Received: from localhost.localdomain (10.144.18.117) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 13 May
 2025 17:35:52 +0800
From: wangtao <tao.wangtao@honor.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <benjamin.gaignard@collabora.com>, <Brian.Starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>,
 <bintian.wang@honor.com>, <yipengxiang@honor.com>, <liulu.liu@honor.com>,
 <feng.han@honor.com>
Subject: [PATCH 0/2] dma-buf: Add direct I/O support via DMA_BUF_IOCTL_RW_FILE
Date: Tue, 13 May 2025 17:27:09 +0800
Message-ID: <20250513092709.1869-1-tao.wangtao@honor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.144.18.117]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a010.hihonor.com
 (10.68.16.52)
X-Mailman-Approved-At: Wed, 14 May 2025 07:23:32 +0000
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

CURRENT WORKFLOW:
1. Allocate dma-buf:
   dmabuf_fd = dmabuf_alloc(len, heap_fd)
2. Map memory:
   vaddr = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_SHARED, dmabuf_fd, 0)
3. File operations:
   file_fd = open(file_path, O_RDONLY)
   lseek(file_fd, pos)
   // 70% time spent on page cache management and memory copies
   read(file_fd, vaddr, len)

KEY OPTIMIZATIONS:
- Convert sg_table to bio_vec
- Enable IOCB_DIRECT flag
- Execute I/O via vfs_iocb_iter_read()

OPTIMIZED WORKFLOW:
   dmabuf_fd = dmabuf_alloc(len, heap_fd)
   file_fd = open(file_path, O_RDONLY)
   if (direct_io) arg.flags |= DMA_BUF_RW_FLAGS_DIRECT
   ioctl(dmabuf_fd, DMA_BUF_IOCTL_RW_FILE, &arg)

PERFORMANCE RESULTS:
- Throughput: 3776 MB/s (UFS 4.0 4GB/s limit)
- Page cache overhead eliminated
- Direct data path reduces memory copies

APPLICABLE SCENARIOS:
- AI model loading
- Real-time data acquisition
- Task snapshot persistence
