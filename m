Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA19B289270
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 21:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55666EDAA;
	Fri,  9 Oct 2020 19:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7156EDA8;
 Fri,  9 Oct 2020 19:51:16 +0000 (UTC)
IronPort-SDR: SYnGyhvNB2crZYO8D333ZubaboFjEX+R/L6h45a/6oU5Q013nFCGwu1tcr8UOwXUq+j+nyBxe/
 1saUh3z1Kpdg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="182976098"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="182976098"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:16 -0700
IronPort-SDR: JrRKqLJV6Da/4fMbj+O46I413eP5nzJr39umbL7Y1s6mKMem5hJdGDAmJBrAS4XWsKikzHiU+3
 eSwE6XBZdj5A==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="518800998"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:15 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 08/58] drivers/firmware_loader: Utilize new
 kmap_thread()
Date: Fri,  9 Oct 2020 12:49:43 -0700
Message-Id: <20201009195033.3208459-9-ira.weiny@intel.com>
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
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this driver are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Cc: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/base/firmware_loader/fallback.c | 4 ++--
 drivers/base/firmware_loader/main.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index 283ca2de76d4..22dea9ba7a37 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -322,14 +322,14 @@ static void firmware_rw(struct fw_priv *fw_priv, char *buffer,
 		int page_ofs = offset & (PAGE_SIZE-1);
 		int page_cnt = min_t(size_t, PAGE_SIZE - page_ofs, count);
 
-		page_data = kmap(fw_priv->pages[page_nr]);
+		page_data = kmap_thread(fw_priv->pages[page_nr]);
 
 		if (read)
 			memcpy(buffer, page_data + page_ofs, page_cnt);
 		else
 			memcpy(page_data + page_ofs, buffer, page_cnt);
 
-		kunmap(fw_priv->pages[page_nr]);
+		kunmap_thread(fw_priv->pages[page_nr]);
 		buffer += page_cnt;
 		offset += page_cnt;
 		count -= page_cnt;
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 63b9714a0154..cc884c9f8742 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -409,11 +409,11 @@ static int fw_decompress_xz_pages(struct device *dev, struct fw_priv *fw_priv,
 
 		/* decompress onto the new allocated page */
 		page = fw_priv->pages[fw_priv->nr_pages - 1];
-		xz_buf.out = kmap(page);
+		xz_buf.out = kmap_thread(page);
 		xz_buf.out_pos = 0;
 		xz_buf.out_size = PAGE_SIZE;
 		xz_ret = xz_dec_run(xz_dec, &xz_buf);
-		kunmap(page);
+		kunmap_thread(page);
 		fw_priv->size += xz_buf.out_pos;
 		/* partial decompression means either end or error */
 		if (xz_buf.out_pos != PAGE_SIZE)
-- 
2.28.0.rc0.12.gb6a658bd00c9

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
