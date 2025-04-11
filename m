Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D186A86BE8
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 11:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA9710E1A7;
	Sat, 12 Apr 2025 09:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="j5HVNjpf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B848D10EB6E;
 Fri, 11 Apr 2025 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1744369181;
 bh=X0ufIEoNyj3oR0IYewqEF9lLAz1QUMF0bHnORwk+1hQ=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=j5HVNjpf90bmooKk83INdYQOdJKdDSkPAYfCmcG6vfbH9c5oQxpy9WSnVzLLmHqEl
 ve3Fne/aStqqrFCWp2qn1YD9P+56dZpYIV3YhJVavfmodSeTkjR7NMY85U8IWtejzu
 IQ7b4x1EpC/S8gU1SZzSSqK4+7IY+1vyI6SlFclc=
X-QQ-mid: izesmtp88t1744368758t32cfd97f
X-QQ-Originating-IP: tKvnF/gmZ4DIpXdx6u7S98Ombl0e/s4+gqgyAGenmmg=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 11 Apr 2025 18:52:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5811992715279106274
EX-QQ-RecipientCnt: 39
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Peter Huewe <peterhuewe@gmx.de>,
 Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Chengchang Tang <tangchengchang@huawei.com>,
 Junxian Huang <huangjunxian6@hisilicon.com>,
 Leon Romanovsky <leon@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Chen Linxuan <chenlinxuan@uniontech.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-integrity@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-nvme@lists.infradead.org, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: [RFC PATCH 0/7] kernel-hacking: introduce CONFIG_NO_AUTO_INLINE
Date: Fri, 11 Apr 2025 18:51:35 +0800
Message-ID: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NwIS3Zdzte8wWTnEglnxV6NmQOrA3xVcszhydQMobOYj+MElYDTPHZoj
 6UMQ91nqXewk7IR5v2WQVRZ0K+7whsYG12XRBZVvXrGuZFXr41Hqg/2auelOTad0O8SuTWX
 +IlWrt23x9+BPEM1hLrsqAafG1DC1M/iaPMr44LLC2viiYMNy6nrlu3vgy68uKR+Izsxf3T
 DQ9wT8UtYNe0dQEk2SEfrUYj9ozqkKbsNxtZGBYT1mBBn68cXmK2E59LzpPaShvJ8agAJNs
 N6jrV45xRkVlFeGP8MSifcPOTAXL+AgCcmdXiW9IWhvCFRiZEuHQaOwkvIoQJVTnYTG4w2Z
 NJQGJhbNNkVW0aaXiIKwVopEjmJ6ONiuurUu33k2N5FShQzbJiN+G0kYeYl183HM5nGgwVv
 iJ1RFtrPz1RnCkvme5VLe76jmD/Mk+pCCLfsH0SbsaDvEDCtGw20HGlbjzyMN0BwTuGcIIq
 EPxj5JL/IvMYBnuzjN+G8q8L1PAJWAR1Mxxwxj2wgViBkFA0qXPk1LM3gzfshDW1jpMwXtk
 qRGGj1sLIRhyIAUd/rbEV979Pvijy9IXofEMFN2Mu0CdqPrW2q96HSgka8SIwSXBN4IztHn
 LJvHAm/4ij+wsYtzPT+CfUlOH9zgQdpzmQKYfVer5/AVVIKiud/cjx7/g2gSOdjLpU/7gum
 FKaTpDTHlLp7NJXTJZFSOiLgkHLwxjLorxz2FU2iZtu30FAmVc4FIgC8RABqM9EmUNqkwyE
 Rln0OvTRn1fYJqtsP0KbbV7q+9pxqnE/lS7yySanJ34/KCcDGzkPRRbRWQM5hblH4D0K5OU
 0qqnut0ZHNNmRnZ298ruuHr4INWdB0dfkRt4WD0UtPom3FtLYgfgfDqahovZAuLDcb6AQPf
 TNTfugb9xBM89ThBLgIofJC0vCVmGc0xuugoSdwsfRl6fhqyNKQJuDMR3hQyAZDf4JRHMqj
 NSUQIQu1y76S0SLAV3+Dw0l9zKIRbcoyn56mx6cjKy0+eCuMCjCkvexIx2erB3mdFUGI=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Sat, 12 Apr 2025 09:08:43 +0000
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

This series introduces a new kernel configuration option NO_AUTO_INLINE,
which can be used to disable the automatic inlining of functions.

This will allow the function tracer to trace more functions
because it only traces functions that the compiler has not inlined.

Previous discussions can be found here:
Link: https://lore.kernel.org/all/20181028130945.23581-3-changbin.du@gmail.com/

Chen Linxuan (2):
  drm/i915/pxp: fix undefined reference to
    `intel_pxp_gsccs_is_ready_for_sessions'
  RDMA/hns: initialize db in update_srq_db()

Winston Wen (5):
  nvme: add __always_inline for nvme_pci_npages_prp
  mm: add __always_inline for page_contains_unaccepted
  vfio/virtio: add __always_inline for virtiovf_get_device_config_size
  tpm: add __always_inline for tpm_is_hwrng_enabled
  lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE

 Makefile                                   |  6 ++++++
 drivers/char/tpm/tpm-chip.c                |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h |  8 ++++++--
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c |  2 +-
 drivers/nvme/host/pci.c                    |  2 +-
 drivers/vfio/pci/virtio/legacy_io.c        |  2 +-
 lib/Kconfig.debug                          | 15 +++++++++++++++
 mm/page_alloc.c                            |  2 +-
 8 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.48.1

