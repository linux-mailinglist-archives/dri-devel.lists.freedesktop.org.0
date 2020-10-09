Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D22289468
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 21:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8538C6EE0C;
	Fri,  9 Oct 2020 19:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45196EE13;
 Fri,  9 Oct 2020 19:54:01 +0000 (UTC)
IronPort-SDR: adwSTjsOkTW/2gAqjXMq2PZEyxFcS5mIrWUb6UC34CBj8gkKpjY3vUjk4BMC8v00HVASZY7tTG
 LJy56JN+Vesw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="227179215"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="227179215"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:54:01 -0700
IronPort-SDR: vscQ8/PPGEHFzlszF4epup1/yO0Zdiea6PUky2hcTMxo6TNU67DufPr1A76ntRogBKZEHAEf8L
 bsjRzl3g/9bQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="529054196"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:54:00 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 55/58] samples: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:30 -0700
Message-Id: <20201009195033.3208459-56-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, kexec@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, io-uring@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

These kmap() calls are localized to a single thread.  To avoid the over
head of global PKRS updates use the new kmap_thread() call.

Cc: Kirti Wankhede <kwankhede@nvidia.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 samples/vfio-mdev/mbochs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 3cc5e5921682..6d95422c0b46 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -479,12 +479,12 @@ static ssize_t mdev_access(struct mdev_device *mdev, char *buf, size_t count,
 		pos -= MBOCHS_MMIO_BAR_OFFSET;
 		poff = pos & ~PAGE_MASK;
 		pg = __mbochs_get_page(mdev_state, pos >> PAGE_SHIFT);
-		map = kmap(pg);
+		map = kmap_thread(pg);
 		if (is_write)
 			memcpy(map + poff, buf, count);
 		else
 			memcpy(buf, map + poff, count);
-		kunmap(pg);
+		kunmap_thread(pg);
 		put_page(pg);
 
 	} else {
-- 
2.28.0.rc0.12.gb6a658bd00c9

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
