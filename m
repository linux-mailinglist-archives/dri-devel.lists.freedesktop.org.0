Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B43302BCE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4652A6E0CA;
	Mon, 25 Jan 2021 19:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748DD6E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 19:42:00 +0000 (UTC)
IronPort-SDR: ZMK0xKJK2ht2c2SgrILvgf0cgSjFSGYHcvJ5LLPdUUFa81UXcmOzfJevHUANgqYypC3i+2Zj8s
 dcxxCAwRLQCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198570245"
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="198570245"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2021 11:41:59 -0800
IronPort-SDR: 2GeBmKcADVG0ofST3+fLqVnmy7Uc44MaTcO5OE9YHqHojY5cfKHSHFxB5lISXW3/kfwEhCK7Hp
 LeJF8ZHAepTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,374,1602572400"; d="scan'208";a="402468971"
Received: from cst-dev.jf.intel.com ([10.23.221.69])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2021 11:41:59 -0800
From: Jianxin Xiong <jianxin.xiong@intel.com>
To: linux-rdma@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH rdma-core v7 6/6] tests: Bug fix for get_access_flags()
Date: Mon, 25 Jan 2021 11:57:02 -0800
Message-Id: <1611604622-86968-7-git-send-email-jianxin.xiong@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Edward Srouji <edwards@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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
index 8546329..c41cb3b 100644
--- a/tests/utils.py
+++ b/tests/utils.py
@@ -58,8 +58,8 @@ def filter_illegal_access_flags(element):
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
