Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8DBECA3D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 10:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEBF10E372;
	Sat, 18 Oct 2025 08:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.b="j40xlnNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com
 (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com
 [52.42.203.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E00C10EB84;
 Fri, 17 Oct 2025 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1760691972; x=1792227972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LUfhSEtyrzlTvFjtMARdG8e1ebgK9JT+esac/DH/XMI=;
 b=j40xlnNqiZF4YGP9xI7yXh1U46qPj7tY/Qtz+bGvYP8a7y0upjUSdvcW
 /1w4bMMYIbXVK3Eyl++jeO0UXACSMxS1mzb4AyKoeHgCVr9lVywuUs8l3
 u19OCgLzVk7SRxY8gIt4kOWHojSdx0AXDto9YChkz3qTYpQaz9MS/taL4
 rb1Egi8muWueEOmHlRQDiU8mm4KTezJDi0+1pLG3vgRWnkW+ADlJHR9v/
 2mQtoyd7H3dBd9VFuvrLaXpteN9mp8dq5OY9dwIqXDa4bxknAzu9LV837
 Blxof+fAet8y6PGmZqqJDH/rDJIjtQIfNx06QcdcDroZw0GVMJyAdh5Dr w==;
X-CSE-ConnectionGUID: enesJP57TPGNCxKTMYzCNQ==
X-CSE-MsgGUID: Ip79uzQWRJCjVSqut+I56A==
X-IronPort-AV: E=Sophos;i="6.19,236,1754956800"; 
   d="scan'208";a="5064204"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO
 smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
 by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 09:06:10 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:20862]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.18.50:2525]
 with esmtp (Farcaster)
 id 8166205d-ccd0-42f5-b377-b6e5ff420d67; Fri, 17 Oct 2025 09:06:09 +0000 (UTC)
X-Farcaster-Flow-ID: 8166205d-ccd0-42f5-b377-b6e5ff420d67
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 17 Oct 2025 09:06:09 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Fri, 17 Oct 2025
 09:05:54 +0000
From: Eliav Farber <farbere@amazon.com>
To: <gregkh@linuxfoundation.org>, <stable@vger.kernel.org>,
 <linux@armlinux.org.uk>, <jdike@addtoit.com>, <richard@nod.at>,
 <anton.ivanov@cambridgegreys.com>, <dave.hansen@linux.intel.com>,
 <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>,
 <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <mchehab@kernel.org>,
 <james.morse@arm.com>, <rric@kernel.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <evan.quan@amd.com>, <james.qian.wang@arm.com>, <liviu.dudau@arm.com>,
 <mihail.atanassov@arm.com>, <brian.starkey@arm.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robdclark@gmail.com>, <sean@poorly.run>,
 <jdelvare@suse.com>, <linux@roeck-us.net>, <fery@cypress.com>,
 <dmitry.torokhov@gmail.com>, <agk@redhat.com>, <snitzer@redhat.com>,
 <dm-devel@redhat.com>, <rajur@chelsio.com>, <davem@davemloft.net>,
 <kuba@kernel.org>, <peppe.cavallaro@st.com>, <alexandre.torgue@st.com>,
 <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <malattia@linux.it>,
 <hdegoede@redhat.com>, <mgross@linux.intel.com>, <intel-linux-scu@intel.com>, 
 <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>, <clm@fb.com>,
 <josef@toxicpanda.com>, <dsterba@suse.com>, <xiang@kernel.org>,
 <chao@kernel.org>, <jack@suse.com>, <tytso@mit.edu>,
 <adilger.kernel@dilger.ca>, <dushistov@mail.ru>,
 <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <pmladek@suse.com>,
 <sergey.senozhatsky@gmail.com>, <andriy.shevchenko@linux.intel.com>,
 <linux@rasmusvillemoes.dk>, <minchan@kernel.org>, <ngupta@vflare.org>,
 <akpm@linux-foundation.org>, <kuznet@ms2.inr.ac.ru>,
 <yoshfuji@linux-ipv6.org>, <pablo@netfilter.org>, <kadlec@netfilter.org>,
 <fw@strlen.de>, <jmaloy@redhat.com>, <ying.xue@windriver.com>,
 <willy@infradead.org>, <farbere@amazon.com>, <sashal@kernel.org>,
 <ruanjinjie@huawei.com>, <David.Laight@ACULAB.COM>,
 <herve.codina@bootlin.com>, <Jason@zx2c4.com>, <keescook@chromium.org>,
 <kbusch@kernel.org>, <nathan@kernel.org>, <bvanassche@acm.org>,
 <ndesaulniers@google.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-um@lists.infradead.org>,
 <linux-edac@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-erofs@lists.ozlabs.org>, <linux-ext4@vger.kernel.org>,
 <linux-sparse@vger.kernel.org>, <linux-mm@kvack.org>,
 <netfilter-devel@vger.kernel.org>, <coreteam@netfilter.org>,
 <tipc-discussion@lists.sourceforge.net>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [PATCH v2 02/27 5.10.y] btrfs: remove duplicated in_range() macro
Date: Fri, 17 Oct 2025 09:04:54 +0000
Message-ID: <20251017090519.46992-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017090519.46992-1-farbere@amazon.com>
References: <20251017090519.46992-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D045UWA003.ant.amazon.com (10.13.139.46) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Mailman-Approved-At: Sat, 18 Oct 2025 08:38:36 +0000
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

From: Johannes Thumshirn <johannes.thumshirn@wdc.com>

[ Upstream commit cea628008fc8c6c9c7b53902f6659e040f33c790 ]

The in_range() macro is defined twice in btrfs' source, once in ctree.h
and once in misc.h.

Remove the definition in ctree.h and include misc.h in the files depending
on it.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Signed-off-by: David Sterba <dsterba@suse.com>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 fs/btrfs/ctree.h     | 2 --
 fs/btrfs/extent_io.c | 1 +
 fs/btrfs/file-item.c | 1 +
 fs/btrfs/raid56.c    | 1 +
 4 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/ctree.h b/fs/btrfs/ctree.h
index d9d6a57acafe..a9926fb10c49 100644
--- a/fs/btrfs/ctree.h
+++ b/fs/btrfs/ctree.h
@@ -3597,8 +3597,6 @@ static inline int btrfs_defrag_cancelled(struct btrfs_fs_info *fs_info)
 	return signal_pending(current);
 }
 
-#define in_range(b, first, len) ((b) >= (first) && (b) < (first) + (len))
-
 /* Sanity test specific functions */
 #ifdef CONFIG_BTRFS_FS_RUN_SANITY_TESTS
 void btrfs_test_destroy_inode(struct inode *inode);
diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 8498994ef5c6..489d370ddd60 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -13,6 +13,7 @@
 #include <linux/pagevec.h>
 #include <linux/prefetch.h>
 #include <linux/cleancache.h>
+#include "misc.h"
 #include "extent_io.h"
 #include "extent-io-tree.h"
 #include "extent_map.h"
diff --git a/fs/btrfs/file-item.c b/fs/btrfs/file-item.c
index cbea4f572155..6e46da3ee433 100644
--- a/fs/btrfs/file-item.c
+++ b/fs/btrfs/file-item.c
@@ -9,6 +9,7 @@
 #include <linux/highmem.h>
 #include <linux/sched/mm.h>
 #include <crypto/hash.h>
+#include "misc.h"
 #include "ctree.h"
 #include "disk-io.h"
 #include "transaction.h"
diff --git a/fs/btrfs/raid56.c b/fs/btrfs/raid56.c
index 9678d7fa4dcc..ed3e40a4a3cb 100644
--- a/fs/btrfs/raid56.c
+++ b/fs/btrfs/raid56.c
@@ -13,6 +13,7 @@
 #include <linux/list_sort.h>
 #include <linux/raid/xor.h>
 #include <linux/mm.h>
+#include "misc.h"
 #include "ctree.h"
 #include "disk-io.h"
 #include "volumes.h"
-- 
2.47.3

