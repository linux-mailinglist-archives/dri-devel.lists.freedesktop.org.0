Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6662628509
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 17:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747DF10E2F3;
	Mon, 14 Nov 2022 16:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C6C10E2EE;
 Mon, 14 Nov 2022 16:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668442929; x=1699978929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I1tXtGfpkBEDqmbmf0YyNkDOosbFpAcq/3pOL4dmk2w=;
 b=eW2MRL+FcTG7+pOBAsmI9VlQAvOQXkKCAzVzQQiVOWmNMtoEU5bOiLgj
 R5Oea0aF9ErWyeFtOYDer6Ryxi1zaPzKBIsRIAYHlB1JVt7IKCIUP+j1S
 UggxDoPBE+IjymF0L2klI8CK5Qpna4H1tXkndhTToJ6Faz0kh5UEa47FO
 NonBn/D+JWu/uuLtS0xSrBJ1hjG39m3gyf6vsLo8a+p8ZM3mJ22D1eycC
 4kre47KtkvwE6JYwkrSRgtQFsgiOQMvWb8JWo9NS/M2Okdh77JDUr8mmI
 RlEjXdMwAbjE6BQd+Atgc2qR4hk5HPq12igUqeFuo8smPgKdwGHB1A12L w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="299531495"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="299531495"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="616372367"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="616372367"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Nov 2022 08:21:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id BD50732E; Mon, 14 Nov 2022 18:22:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 3/4] usb: gadget: udc: bcm63xx: Convert to use list_count()
Date: Mon, 14 Nov 2022 18:22:06 +0200
Message-Id: <20221114162207.62559-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
References: <20221114162207.62559-1-andriy.shevchenko@linux.intel.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The list API now provides the list_count() to help with counting
existing nodes in the list. Uilise it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no change
 drivers/usb/gadget/udc/bcm63xx_udc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index 2cdb07905bde..0762e49e85f8 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -2172,7 +2172,6 @@ static int bcm63xx_iudma_dbg_show(struct seq_file *s, void *p)
 
 	for (ch_idx = 0; ch_idx < BCM63XX_NUM_IUDMA; ch_idx++) {
 		struct iudma_ch *iudma = &udc->iudma[ch_idx];
-		struct list_head *pos;
 
 		seq_printf(s, "IUDMA channel %d -- ", ch_idx);
 		switch (iudma_defaults[ch_idx].ep_type) {
@@ -2205,14 +2204,10 @@ static int bcm63xx_iudma_dbg_show(struct seq_file *s, void *p)
 		seq_printf(s, "  desc: %d/%d used", iudma->n_bds_used,
 			   iudma->n_bds);
 
-		if (iudma->bep) {
-			i = 0;
-			list_for_each(pos, &iudma->bep->queue)
-				i++;
-			seq_printf(s, "; %d queued\n", i);
-		} else {
+		if (iudma->bep)
+			seq_printf(s, "; %zu queued\n", list_count(&iudma->bep->queue));
+		else
 			seq_printf(s, "\n");
-		}
 
 		for (i = 0; i < iudma->n_bds; i++) {
 			struct bcm_enet_desc *d = &iudma->bd_ring[i];
-- 
2.35.1

