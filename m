Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D842A3F5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 14:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50AC892CD;
	Tue, 12 Oct 2021 12:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882B6892CD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 12:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1634040568; x=1665576568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Cu9aT9PKxubFeRU3gw1Gjtc6Ldb5NRA5s/4pefgZcj0=;
 b=QRa8JGzONRKvpfdfZGJxZ+Zljhht969ejd/GrHt3qSmtov5LQIJG9M9r
 KhWp5Y0VQ+n3j2IGRspJ1+DxIT3CenxA2gwTgYhMzACNL+zfUuq3HfI1a
 QkrC9VcDp52rPSRGAenripZUM0XG9Q2SngxAgm7cG29C7aYUXR2s5u0rK 4=;
X-IronPort-AV: E=Sophos;i="5.85,367,1624320000"; d="scan'208";a="147112800"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-1c682de1.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 12 Oct 2021 12:09:19 +0000
Received: from EX13D13EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1d-1c682de1.us-east-1.amazon.com (Postfix) with
 ESMTPS id 98058A20F0; Tue, 12 Oct 2021 12:09:16 +0000 (UTC)
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D13EUA004.ant.amazon.com (10.43.165.22) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Tue, 12 Oct 2021 12:09:15 +0000
Received: from 8c85908914bf.ant.amazon.com.com (10.1.212.21) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1497.23 via Frontend Transport; Tue, 12 Oct 2021 12:09:11 +0000
From: Gal Pressman <galpress@amazon.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Doug Ledford <dledford@redhat.com>, Jason
 Gunthorpe <jgg@ziepe.ca>
CC: <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>, Oded Gabbay
 <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich
 <sleybo@amazon.com>, Alexander Matushevsky <matua@amazon.com>, Leon
 Romanovsky <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>,
 Firas Jahjah <firasj@amazon.com>, Gal Pressman <galpress@amazon.com>
Subject: [PATCH for-next 0/3] EFA dmabuf memory regions
Date: Tue, 12 Oct 2021 15:09:00 +0300
Message-ID: <20211012120903.96933-1-galpress@amazon.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Hey all,

This is a followup to my previous RFCs [1][2], which now adds a new api
to the RDMA subsystem that allows drivers to get a pinned dmabuf memory
region without requiring an implementation of the move_notify callback.
The new api makes use of the dynamic attachment api implemented in the
RDMA subsystem, but calls dma_buf_pin() in order to make sure that the
callback will not be called, as suggested by Christian.

As explained in the previous RFC, move_notify requires the RDMA device
to support on-demand-paging (ODP) which is not common on most devices
(only supported by mlx5).

While the dynamic requirement makes sense for certain GPUs, some devices
(such as habanalabs) have device memory that is always "pinned" and do
not need/use the move_notify operation.

Patch #1 changes the dmabuf documentation to make it clear that pinning
does not necessarily mean the memory must be moved to system memory, it
is up to the exporter to decide.
Patch #2 adds the RDMA api that allows drivers to get pinned dmabuf
memory regions.
Patch #3 adds the EFA implementation of the dmabuf importer.

The motivation of this submission is to use habanalabs as the dmabuf
exporter, and EFA as the importer to allow for peer2peer access through
libibverbs.

[1] https://lore.kernel.org/linux-rdma/20210818074352.29950-1-galpress@amazon.com/
[2] https://lore.kernel.org/linux-rdma/20211007104301.76693-1-galpress@amazon.com/

Thanks

Gal Pressman (3):
  dma-buf: Fix pin callback comment
  RDMA/umem: Allow pinned dmabuf umem usage
  RDMA/efa: Add support for dmabuf memory regions

 drivers/infiniband/core/umem_dmabuf.c |  51 +++++++++++
 drivers/infiniband/hw/efa/efa.h       |   4 +
 drivers/infiniband/hw/efa/efa_main.c  |   1 +
 drivers/infiniband/hw/efa/efa_verbs.c | 127 +++++++++++++++++++-------
 include/linux/dma-buf.h               |   4 +-
 include/rdma/ib_umem.h                |  12 +++
 6 files changed, 166 insertions(+), 33 deletions(-)

-- 
2.33.0

