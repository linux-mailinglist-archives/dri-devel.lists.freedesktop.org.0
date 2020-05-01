Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7622A1C0EE9
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6536E03D;
	Fri,  1 May 2020 07:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23616E03D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 07:39:56 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 145so1262831pfw.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=7dbuQPhIsTcQHi6Sc8OBXbUFsIKd1Ghgu7yJHTjcrBA=;
 b=uSMKBOO6QIs4uLVfahwgnBUw2gO5QWpFhQb6F1MFxTptPMF+Z0o/WwC6bov2PX1B+z
 GpMi0QLlCm5bjeCQb1Ib4KAhIABJItLI42QmCZQZGMtFoAd5BloKynNn9kQq3/e29zu2
 9IyjzXDmbfN8mJesTXXH8vGo6U5pKfc97OK3wq90VHEBym+PgXw/vn++YmU/npiUaTr5
 EKndS27RG5ykIcMNfuIjRBSN+x85vpHDVdCcNP20vltiVGnPnJOhrLIPCacJWk+nw8H5
 h/1ZfEiY9PDJtMZv9WMs5aKqGIRak+Cy8hyL1nVn2z4TqrdRTnPu7SgigutOZnbMfMx7
 2gGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7dbuQPhIsTcQHi6Sc8OBXbUFsIKd1Ghgu7yJHTjcrBA=;
 b=hpCSGpZ8O9YK/iwmEge8Gbzvonl7r4eZqCz2yV6vNlRyd21Iikr31dU7ds1j57Q/YK
 0EOXMY88zNGzPUOTtrXVGvRmsroXAQkm77ZUR84LB1tZb+CL0b2xOGYc8DCuEA0mu5n2
 NuaaTVZbsz4drEFeIl/R8GPn6WuBGcNAP7GzS+kmVXIu0Bj6K5nx2k+DOQku0MYZ2sl3
 6nWXSw/3k1xHxiSjN8SJSwZc4T1+yKi2jCIWHqQDz8nGaAGqjgA1UQzpLoWGdzSX65mW
 NtTWI9Rj7VmFIOIdIIy/d59Pm23tyM7p4UpiiCcYQSoe9MYyWqHlw7igdKGg8HIyEY8u
 TBaA==
X-Gm-Message-State: AGi0PuYPiAgJ7bv9RByZgyvPTYcNB/o7UG3LrbZeJEumI1IlEWNET4Hl
 op5nGY/OvGMXI45ko5lfjLHVDg==
X-Google-Smtp-Source: APiQypJ4tRvRarVqfbdjkqTxsXvJvyOp8AuLCGCLRECI0h2PDJqsBBZbjfCR605Pbtspben2FOegvQ==
X-Received: by 2002:a62:7bcf:: with SMTP id w198mr2002566pfc.226.1588318796201; 
 Fri, 01 May 2020 00:39:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 w12sm1557841pfq.133.2020.05.01.00.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 00:39:55 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 0/4] Support non-default CMA regions to the dmabuf heaps
 interface
Date: Fri,  1 May 2020 07:39:45 +0000
Message-Id: <20200501073949.120396-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, Sandeep Patil <sspatil@google.com>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 Chenbo Feng <fengc@google.com>, Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F. Davis" <afd@ti.com>,
 linux-mm@kvack.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a much belated second stab at allowing non-default CMA
regions to be exposed via the dmabuf heaps interface.

Previous attempt was here:
 https://lore.kernel.org/lkml/20191025225009.50305-2-john.stultz@linaro.org/T/

This pass tried to take Rob's earlier suggestion to use a flag
property.

Feedback would be greatly welcome!

thanks
-john

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Andrew F. Davis" <afd@ti.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Pratik Patel <pratikp@codeaurora.org>
Cc: Laura Abbott <labbott@redhat.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Chenbo Feng <fengc@google.com>
Cc: Alistair Strachan <astrachan@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mm@kvack.org

John Stultz (4):
  devicetree: bindings: Add linux,cma-heap tag for reserved memory
  mm: cma: Add dma_heap flag to cma structure
  dma-buf: cma_heap: Extend logic to export CMA regions tagged with
    "linux,cma-heap"
  example: dts: hi3660-hikey960: Add dts entries to test cma heap
    binding

 .../reserved-memory/reserved-memory.txt        |  3 +++
 .../boot/dts/hisilicon/hi3660-hikey960.dts     |  7 +++++++
 drivers/dma-buf/heaps/cma_heap.c               | 18 +++++++++---------
 include/linux/cma.h                            |  3 +++
 kernel/dma/contiguous.c                        |  3 +++
 mm/cma.c                                       | 11 +++++++++++
 mm/cma.h                                       |  1 +
 7 files changed, 37 insertions(+), 9 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
