Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA32C329F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 22:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690536E02E;
	Tue, 24 Nov 2020 21:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9038C6E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 21:24:57 +0000 (UTC)
IronPort-SDR: ZNsfUFzdUSp/5mv6In9GJHwSW85gOIuqz/GByK65awXXWuTMu4tlQW9WyB/2UR6Y+kqokPoUgL
 f/j2JSVX9Yhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151278750"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="151278750"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 13:24:57 -0800
IronPort-SDR: 1eod7JVgHIf1fqpcsM5IjySiBg5w+qVnb4tydiOUihbCWpNG71rhTuoRkyXoxt5XkqYRXaAewV
 c+parO6st4+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; d="scan'208";a="332701590"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by orsmga006.jf.intel.com with ESMTP; 24 Nov 2020 13:24:56 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v2 6/6] tests: Bug fix for get_access_flags()
Date: Tue, 24 Nov 2020 13:38:54 -0800
Message-Id: <1606253934-67181-7-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606253934-67181-1-git-send-email-jianxin.xiong@intel.com>
References: <1606253934-67181-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The filter definition is wrong and causes get_access_flags() always
returning empty list. As the result the MR tests using this function
are effectively skipped (but report success).

Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
---
 tests/utils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/utils.py b/tests/utils.py
index 0ad7110..9ff2603 100644
--- a/tests/utils.py
+++ b/tests/utils.py
@@ -55,8 +55,8 @@ def filter_illegal_access_flags(element):
     :param element: A list of access flags to check
     :return: True if this list is legal, else False
     """
-    if e.IBV_ACCESS_REMOTE_ATOMIC in element or e.IBV_ACCESS_REMOTE_WRITE:
-        if e.IBV_ACCESS_LOCAL_WRITE:
+    if e.IBV_ACCESS_REMOTE_ATOMIC in element or e.IBV_ACCESS_REMOTE_WRITE in element:
+        if not e.IBV_ACCESS_LOCAL_WRITE in element:
             return False
     return True
 
-- 
1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
