Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E7711EED
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 06:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4029610E1A8;
	Fri, 26 May 2023 04:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BD510E1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 04:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mk1hz+aR0+S5nMP4NKFg1YnAMY5/a5jNMR1UmgjUkFA=; b=u4EZZQgeKpbZjOBjlg0b/8jhey
 NTZsii8TCpgvrsYM2u30CSuUVl+O8HCftHnF+kfPi0AlXS2pP9jSvdtuSoFBewytIBtqJpx2oiDGF
 7LWBx0iWdbtngjSaO7naPKp7DBlUfBvyH56+SJV8W2Ie4VB//t8g1URg1ZMKiBwdADc7MBjXb7GLY
 lOuyj91gtG3nRKw4mNu328PY7IeyO1fgpR9YvEyHilD6AAzF1wf5Sujvs8MEp0q7vizytfhNqhBey
 N8CWE8CY6WrLIoo0MGa1ojoBsXPeURBB+o5n4YKMWkW0lvm+v1bGBOvsT1qtKn3mVDYGLZeAlhO/R
 08UpR0Xw==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q2PKL-0010aD-0T; Fri, 26 May 2023 04:45:21 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] accel/ivpu: ivpu_ipc needs GENERIC_ALLOCATOR
Date: Thu, 25 May 2023 21:45:19 -0700
Message-Id: <20230526044519.13441-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, kernel test robot <lkp@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers that use the gen_pool*() family of functions should
select GENERIC_ALLOCATOR to prevent build errors like these:

ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_free':
include/linux/genalloc.h:172: undefined reference to `gen_pool_free_owner'
ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_alloc_algo':
include/linux/genalloc.h:138: undefined reference to `gen_pool_alloc_algo_owner'
ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_free':
include/linux/genalloc.h:172: undefined reference to `gen_pool_free_owner'
ld: drivers/accel/ivpu/ivpu_ipc.o: in function `ivpu_ipc_init':
drivers/accel/ivpu/ivpu_ipc.c:441: undefined reference to `devm_gen_pool_create'
ld: drivers/accel/ivpu/ivpu_ipc.o: in function `gen_pool_add_virt':
include/linux/genalloc.h:104: undefined reference to `gen_pool_add_owner'

Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202305221206.1TaugDKP-lkp@intel.com/
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/accel/ivpu/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/accel/ivpu/Kconfig b/drivers/accel/ivpu/Kconfig
--- a/drivers/accel/ivpu/Kconfig
+++ b/drivers/accel/ivpu/Kconfig
@@ -7,6 +7,7 @@ config DRM_ACCEL_IVPU
 	depends on PCI && PCI_MSI
 	select FW_LOADER
 	select SHMEM
+	select GENERIC_ALLOCATOR
 	help
 	  Choose this option if you have a system that has an 14th generation Intel CPU
 	  or newer. VPU stands for Versatile Processing Unit and it's a CPU-integrated
