Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4981563404B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B6810E410;
	Tue, 22 Nov 2022 15:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6F310E40F;
 Tue, 22 Nov 2022 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669131314; x=1700667314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QhFQ1vvgWJPcpF58xWVY2cCZqGcl+FTrvlc1UL7N3w0=;
 b=CHLjHeLyOBf16PzlegSZLhz6GFJmOKXJZ4LiwRtCPHs4TUgdrcUCdCbW
 sFTfBfY/UmANp0V1uyFqlJg5ZMTjwV+/lBWfhqz/ysHM0hrGNd6wyJmF9
 b1mczFUYblZT3HK3+uNDSlFeW+KTjGMHZjuQ4YOb7v4qeVwLp9zJc+5Jm
 MHVXT9DGl+96kXz5X37kW1gMxdhh9uKNzIXfRzQKCyD2X8i1ueHivt5kF
 Ekj4S++f07XaJ9TDLkbnuup8e2b6Kj9GaBd9eqP6lBnXXK6QHMry1Xrhw
 KyQCLR8Nok9SqOHtLUkrj/CG6uPELkocXSQVqvp7SgEZtaLyhhVS08t9C Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315662393"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="315662393"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 07:35:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="747395669"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="747395669"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2022 07:35:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6623724A; Tue, 22 Nov 2022 17:35:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 4/4] xhci: Convert to use list_count()
Date: Tue, 22 Nov 2022 17:35:16 +0200
Message-Id: <20221122153516.52577-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122153516.52577-1-andriy.shevchenko@linux.intel.com>
References: <20221122153516.52577-1-andriy.shevchenko@linux.intel.com>
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
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The list API now provides the list_count() to help with counting
existing nodes in the list. Utilise it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: no change
v2: no change
 drivers/usb/host/xhci-ring.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ad81e9a508b1..817c31e3b0c8 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2532,7 +2532,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
-	struct list_head *tmp;
 	u32 trb_comp_code;
 	int td_num = 0;
 	bool handling_skipped_tds = false;
@@ -2580,10 +2579,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	}
 
 	/* Count current td numbers if ep->skip is set */
-	if (ep->skip) {
-		list_for_each(tmp, &ep_ring->td_list)
-			td_num++;
-	}
+	if (ep->skip)
+		td_num += list_count(&ep_ring->td_list);
 
 	/* Look for common error cases */
 	switch (trb_comp_code) {
-- 
2.35.1

