Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD5C63D726
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A9F10E45B;
	Wed, 30 Nov 2022 13:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580E310E455;
 Wed, 30 Nov 2022 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669816149; x=1701352149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IUyB0aYfzgdGPjnanaYtbllUXw0rFzNVl+2IWpnEV3s=;
 b=MYaysl11tfLfOGPwdsmDPAfwFvstdyP1eGKWX317Oyip8T7g1paqNNdw
 qd6qpImaAKOLRJyFAyedkSrJcto/t2vkDs7iV3D0tz6m6lLe1/z72bi9U
 vbwb2ogmnqsZG3Lhs3Deuag50Riba6YwjOcCK3fenXZTowF0A3F3tZRC6
 Ii6IM9omgLr6ZwBO8c7w3w9L2WHYzTIFgIUrwqEQv9Rl5D63c6nHr+PfT
 Ofj/Vknvji4YW269GNkNC7zPbpuAlRhfwOV6j8IxzTFWmojpNNr96Ulnl
 5zTLMhRJ3HTmoTLL5b/8Z/NSyfd9vOi5qubHCRWiLSwpX1vnutH3/yfC4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="298769768"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="298769768"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:48:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="676825894"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="676825894"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 30 Nov 2022 05:48:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 984BA10E; Wed, 30 Nov 2022 15:48:39 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 2/4] usb: gadget: hid: Convert to use list_count_nodes()
Date: Wed, 30 Nov 2022 15:48:36 +0200
Message-Id: <20221130134838.23805-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130134838.23805-1-andriy.shevchenko@linux.intel.com>
References: <20221130134838.23805-1-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kevin Cernekee <cernekee@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The list API provides the list_count_nodes() to help with counting
existing nodes in the list. Utilise it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v5: used renamed API (LKP)
v4: no change
v3: fixed typo in the commit message (Fabio)                                                                     
v2: no change
 drivers/usb/gadget/legacy/hid.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
index 1187ee4f316a..133daf88162e 100644
--- a/drivers/usb/gadget/legacy/hid.c
+++ b/drivers/usb/gadget/legacy/hid.c
@@ -133,14 +133,11 @@ static struct usb_configuration config_driver = {
 static int hid_bind(struct usb_composite_dev *cdev)
 {
 	struct usb_gadget *gadget = cdev->gadget;
-	struct list_head *tmp;
 	struct hidg_func_node *n = NULL, *m, *iter_n;
 	struct f_hid_opts *hid_opts;
-	int status, funcs = 0;
-
-	list_for_each(tmp, &hidg_func_list)
-		funcs++;
+	int status, funcs;
 
+	funcs = list_count_nodes(&hidg_func_list);
 	if (!funcs)
 		return -ENODEV;
 
-- 
2.35.1

