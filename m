Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DE82892A8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 21:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC196EDA7;
	Fri,  9 Oct 2020 19:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E846EDAE;
 Fri,  9 Oct 2020 19:51:27 +0000 (UTC)
IronPort-SDR: jAooXMFwxD/aW27DbRPWkRJ7nyvWg449IpvKBI/WSmSxCSK2nmmGBrS169HLCTCNO7wl8ssN8K
 UEW3GXZXkGWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="165642902"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="165642902"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:27 -0700
IronPort-SDR: zNYl6viNpTmcuoOUFeW6ebDlF6mcWw7xHrLDRpkX9eSJEFyww70EqY5cZFdXSl9ODsqjoVqJW/
 EpbiFUFW5goQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="329006240"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:25 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 11/58] drivers/net: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:49:46 -0700
Message-Id: <20201009195033.3208459-12-ira.weiny@intel.com>
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
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in these drivers are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/net/ethernet/intel/igb/igb_ethtool.c     | 4 ++--
 drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_ethtool.c b/drivers/net/ethernet/intel/igb/igb_ethtool.c
index 6e8231c1ddf0..ac9189752012 100644
--- a/drivers/net/ethernet/intel/igb/igb_ethtool.c
+++ b/drivers/net/ethernet/intel/igb/igb_ethtool.c
@@ -1794,14 +1794,14 @@ static int igb_check_lbtest_frame(struct igb_rx_buffer *rx_buffer,
 
 	frame_size >>= 1;
 
-	data = kmap(rx_buffer->page);
+	data = kmap_thread(rx_buffer->page);
 
 	if (data[3] != 0xFF ||
 	    data[frame_size + 10] != 0xBE ||
 	    data[frame_size + 12] != 0xAF)
 		match = false;
 
-	kunmap(rx_buffer->page);
+	kunmap_thread(rx_buffer->page);
 
 	return match;
 }
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
index 71ec908266a6..7d469425f8b4 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
@@ -1963,14 +1963,14 @@ static bool ixgbe_check_lbtest_frame(struct ixgbe_rx_buffer *rx_buffer,
 
 	frame_size >>= 1;
 
-	data = kmap(rx_buffer->page) + rx_buffer->page_offset;
+	data = kmap_thread(rx_buffer->page) + rx_buffer->page_offset;
 
 	if (data[3] != 0xFF ||
 	    data[frame_size + 10] != 0xBE ||
 	    data[frame_size + 12] != 0xAF)
 		match = false;
 
-	kunmap(rx_buffer->page);
+	kunmap_thread(rx_buffer->page);
 
 	return match;
 }
-- 
2.28.0.rc0.12.gb6a658bd00c9

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
