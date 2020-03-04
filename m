Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6991786DA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 01:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BA46E97E;
	Wed,  4 Mar 2020 00:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7962E6E97E;
 Wed,  4 Mar 2020 00:14:02 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e5ef2750001>; Tue, 03 Mar 2020 16:12:37 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 03 Mar 2020 16:14:01 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 03 Mar 2020 16:14:01 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Mar
 2020 00:14:01 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 4 Mar 2020 00:14:00 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e5ef2c80000>; Tue, 03 Mar 2020 16:14:00 -0800
From: Ralph Campbell <rcampbell@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 0/4] nouveau/hmm: map pages after migration
Date: Tue, 3 Mar 2020 16:13:35 -0800
Message-ID: <20200304001339.8248-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583280758; bh=FYjVStRU/xeHMRnemWwkqp+dmhmJHLFn+/QJlHVfHu0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Type:
 Content-Transfer-Encoding;
 b=UoN6Q/pll7N39wIzylmMBPDOzUsiVhIyTARm901XnFSsX3g+aihahQmxhbe9v417S
 L90e7XozmIEhBgONWZ37q8OkpnYQz0sKQfIOxhM97hPgsedh/sxkxKbxyMBNkiqPUH
 Zft5jwOFOREbtW5xdsf9SgAtxV4D8Zv67OXAb+F7XSgf9z+NP1mvTGJQ2hHbuIP/iS
 HC+uhpaeeftSpa96YS34lZ4LVQtqWMlUAWxVZdnPtfmWcMYP8t1mMUskM4MXVO5Iji
 UMfGgTlBktcOZHLz9jKqaUwY019y6+bw81Tp+0faCMygVoF0h/lBMXRQsXhfGZNUQa
 NV4SCCTOs41Fw==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally patch 4 was targeted for Jason's rdma tree since other HMM
related changes were queued there. Now that those have been merged,
these patches just contain changes to nouveau so they could go through
any tree. I guess Ben Skeggs' tree would be appropriate.

Changes since v2:
 Added patches 1-3 to fix some minor issues.
 Eliminated nouveau_find_svmm() since it is easily found.
 Applied Jason Gunthorpe's suggestions for nouveau_pfns_to_args().

Changes since v1:
 Rebase to linux-5.6.0-rc4
 Address Christoph Hellwig's comments


Ralph Campbell (4):
  nouveau/hmm: fix vma range check for migration
  nouveau/hmm: check for SVM initialized before migrating
  nouveau: remove useless SVM range check
  nouveau/hmm: map pages after migration

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 46 +++++++++++------
 drivers/gpu/drm/nouveau/nouveau_dmem.h |  2 +
 drivers/gpu/drm/nouveau/nouveau_svm.c  | 69 ++++++++++++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_svm.h  |  5 ++
 4 files changed, 102 insertions(+), 20 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
