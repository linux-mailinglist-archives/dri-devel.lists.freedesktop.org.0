Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93453B7B44
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 03:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B289A6E05A;
	Wed, 30 Jun 2021 01:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA966E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 01:34:30 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id s14so984962pfg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 18:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FBEInOJoYqxwrlE52K6MZcC340XktufPlx9tQHJv3jk=;
 b=fpOTxwV4zxW4Q0vXTnzAdyWRKSNOkJ6Yt5nUdEs8+fAMn3XqRToSnVNet0pTIFnaQR
 cCMSSrzMa51N8/Ca9p8l+jqocYP7FxLde/JNiiOXRZpFjYvUZvmjGetBCLP3kAsvmSTu
 vPYFOQyaPT9Nc9Ch2RPF7gKN/31atj/e33ZaTm42GJBlu+dsply2TCWz1h9jDasglrK2
 lxd+aDaz4eznt1K2MTO1ZUdHwqjfof/Z0YadmFAefD1MZJ0VnjY/1G99vVC7naW8Orzn
 AsBMrloc8ZhRKOkpgR1aURI0ECgbQu8TPF0eYWu1KJ4Sq+UEo+4orwgB5DI31WQzdTTg
 N9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FBEInOJoYqxwrlE52K6MZcC340XktufPlx9tQHJv3jk=;
 b=kyFmk6GZhZ7bKU/xJdluPLUC8+re9U6GbymRNv5ww2GjKa7XJnIiWfWsLMEzeIblbx
 NxQICAryBQftbIz4bLbFL5QRydPc+3+lTy6Tj3ibrRfibdsJeYFTt+6Cfzt7JZB5LWSo
 Ply5CnSo3Skve+Bd5g9NobKk2cn1/49tJJ5CKmSLKP1Sd8zR6BgkigaKRU53GRR+x5zB
 GnP1MFlFgCaX2+QUA1xrBgqYnO8YhCLLhBzAqPclhcOveTlcRHgyJr1K+9aWVzt/NunV
 pR5vDcqfvb3YRdfha90x3BlozRM6NP1nlOHOQcPowuC9wqG1eTsBSDl4OJXXhb3s8US4
 7vZA==
X-Gm-Message-State: AOAM530Z8FtdOLVI5biAld0ig51tydiX5bj2TZXO9ZPDXBSJBb88EIqG
 HXkqp3gZa+li5CjAFkkrD27fCw==
X-Google-Smtp-Source: ABdhPJzSoY1EJeRDCOfTvywVVy/GFDhxptRl0SIl647lxALfT485QBgs8oQza+YKOuAOTR5gyn9Lag==
X-Received: by 2002:a63:5966:: with SMTP id j38mr30913446pgm.451.1625016870033; 
 Tue, 29 Jun 2021 18:34:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 g8sm20252901pja.14.2021.06.29.18.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 18:34:29 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/5] Generic page pool & deferred freeing for system dmabuf
 hea
Date: Wed, 30 Jun 2021 01:34:16 +0000
Message-Id: <20210630013421.735092-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After an unfortunately long pause (covid work-schedule burnout),
I wanted to revive and resubmit this series.

As before, the point of this series is trying to add both a page
pool as well as deferred-freeingto the DMA-BUF system heap to
improve allocation performance (so that it can match or beat the
old ION system heaps performance).

The combination of the page pool along with deferred freeing
allows us to offload page-zeroing out of the allocation hot
path. This was done originally with ION and this patch series
allows the DMA-BUF system heap to match ION's system heap
allocation performance in a simple microbenchmark [1] (ION
re-added to the kernel for comparision, running on an x86 vm
image):

./dmabuf-heap-bench -i 0 1 system
Testing dmabuf system vs ion heaptype 0 (flags: 0x1)
---------------------------------------------
dmabuf heap: alloc 4096 bytes 5000 times in 79314244 ns          15862 ns/call
ion heap:    alloc 4096 bytes 5000 times in 107390769 ns         21478 ns/call
dmabuf heap: alloc 1048576 bytes 5000 times in 259083419 ns      51816 ns/call
ion heap:    alloc 1048576 bytes 5000 times in 340497344 ns      68099 ns/call
dmabuf heap: alloc 8388608 bytes 5000 times in 2603105563 ns     520621 ns/call
ion heap:    alloc 8388608 bytes 5000 times in 3613592860 ns     722718 ns/call
dmabuf heap: alloc 33554432 bytes 5000 times in 12212492979 ns   2442498 ns/call
ion heap:    alloc 33554432 bytes 5000 times in 14584157792 ns   2916831 ns/call


Daniel didn't like earlier attempts to re-use the network
page-pool code to achieve this, and suggested the ttm_pool be
used instead, so this series pulls the page pool functionality
out of the ttm_pool logic and creates a generic page pool
that can be shared.

New in v9:
* Tried to address Christian König's feedback on the page pool
  changes (Kerneldoc, static functions, locking issues, duplicative
  order tracking)
* Fix up Kconfig dependency issue as Reported-by:
  kernel test robot <lkp@intel.com>
* Fix compiler warning Reported-by:
  kernel test robot <lkp@intel.com>

I know Christian had some less specific feedback on the deferred free
work that I'd like to revisit, but I wanted to restart the discussion
with this new series, rather then trying to dregdge up and reply to
a ~4mo old thread.

Input would be greatly appreciated. Testing as well, as I don't
have any development hardware that utilizes the ttm pool.

Thanks
-john

[1] https://android.googlesource.com/platform/system/memory/libdmabufheap/+/refs/heads/master/tests/dmabuf_heap_bench.c

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

John Stultz (5):
  drm: Add a sharable drm page-pool implementation
  drm: ttm_pool: Rework ttm_pool to use drm_page_pool
  dma-buf: system_heap: Add drm pagepool support to system heap
  dma-buf: heaps: Add deferred-free-helper library code
  dma-buf: system_heap: Add deferred freeing to the system heap

 drivers/dma-buf/heaps/Kconfig                |   5 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/deferred-free-helper.c | 138 +++++++++
 drivers/dma-buf/heaps/deferred-free-helper.h |  55 ++++
 drivers/dma-buf/heaps/system_heap.c          |  46 ++-
 drivers/gpu/drm/Kconfig                      |   4 +
 drivers/gpu/drm/Makefile                     |   2 +
 drivers/gpu/drm/page_pool.c                  | 297 +++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_pool.c               | 167 ++---------
 include/drm/page_pool.h                      |  68 +++++
 include/drm/ttm/ttm_pool.h                   |  14 +-
 11 files changed, 643 insertions(+), 154 deletions(-)
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h
 create mode 100644 drivers/gpu/drm/page_pool.c
 create mode 100644 include/drm/page_pool.h

-- 
2.25.1

