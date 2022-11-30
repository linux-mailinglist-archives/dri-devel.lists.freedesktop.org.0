Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BA63D71D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 14:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B6F10E456;
	Wed, 30 Nov 2022 13:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23F10E454;
 Wed, 30 Nov 2022 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669816101; x=1701352101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I2235I6+qL/ul/8hqTNNkG+zjnVNh7zDAoRuFikuV88=;
 b=LgvrD5zQb0ocysQASAYDCx17e3g9SqkHqFkwDP7cEfTaRxbauVpDeweM
 BuUmaZnXMGwRMZ1wuZOg8d1JuEx7YZ7kQkNLziPm9J1DHq0Ee9f4IWhw1
 ezNwsKMAaNu48Q5XtDMFO9AxZuJZDEagTrkS6azEcIetvZKcYZmBaxp9T
 IvEDPFns8Yg6ZSoJwE61E3ZwLJcxAep81bFW4UFk60n6bD5yIY5Bu6j8R
 THcliaLzmXdcv0NK9Y+pzZnyscCf4a/O3zThNQv5vKCLB7x9ByaMNFlEW
 LXnk9zIgcxVM4bFfNlu/aBGLlfKCA5M96AShL5frIIwREP9C6NIrASZsQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="317244865"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="317244865"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 05:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="973108894"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="973108894"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2022 05:48:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B1E6E184; Wed, 30 Nov 2022 15:48:39 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v5 4/4] xhci: Convert to use list_count_nodes()
Date: Wed, 30 Nov 2022 15:48:38 +0200
Message-Id: <20221130134838.23805-4-andriy.shevchenko@linux.intel.com>
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

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v5: used renamed API (LKP)
v4: added tag (Mathias)
v3: no change
v2: no change
 drivers/usb/host/xhci-ring.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ddc30037f9ce..aa4d34efecd2 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2528,7 +2528,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
-	struct list_head *tmp;
 	u32 trb_comp_code;
 	int td_num = 0;
 	bool handling_skipped_tds = false;
@@ -2582,10 +2581,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	}
 
 	/* Count current td numbers if ep->skip is set */
-	if (ep->skip) {
-		list_for_each(tmp, &ep_ring->td_list)
-			td_num++;
-	}
+	if (ep->skip)
+		td_num += list_count_nodes(&ep_ring->td_list);
 
 	/* Look for common error cases */
 	switch (trb_comp_code) {
-- 
2.35.1

