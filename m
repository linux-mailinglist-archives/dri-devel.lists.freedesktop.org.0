Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0140863404A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF1D10E40E;
	Tue, 22 Nov 2022 15:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6110110E40E;
 Tue, 22 Nov 2022 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669131314; x=1700667314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S4XpqXdqGWk1whCKjTw1Tbea2OWWldUyTEhirb3Ex2I=;
 b=hdBl0KQ4mTAxxerylUlNQeKjhUwcHWzUw4BK4eNCnFOBHoCQmHS6N2BA
 KF56gyPkOEVJ0TA3KmEar06KRG8zJ7r/zsCGRnPGcpAUyLVxOqTtMPQgY
 vXRP9PhtodF1uDWIpz8keGoysVZ3c2xQglQjrUtRI/rTptMb3uVh41XY3
 vMoEk2o1uII+1l0R43Do9GT68n25y3sClGK9sHkW37axpOJ/b7iCrg9XT
 6YXSPqAVebhq8DqcWqnodfoRD1lubLObfYsj506OI6tRaNJZkaSGHoTpF
 FMdQwHaLRfsYBY/IEDurV09+ecDzeHe9sVcET81Dig9M9vGgCufc80Jmu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315662397"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="315662397"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 07:35:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="747395673"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="747395673"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2022 07:35:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4E543F7; Tue, 22 Nov 2022 17:35:26 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 2/4] usb: gadget: hid: Convert to use list_count()
Date: Tue, 22 Nov 2022 17:35:14 +0200
Message-Id: <20221122153516.52577-2-andriy.shevchenko@linux.intel.com>
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
v3: fixed typo in the commit message (Fabio)
v2: no change
 drivers/usb/gadget/legacy/hid.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/legacy/hid.c b/drivers/usb/gadget/legacy/hid.c
index 1187ee4f316a..6196c3456e0b 100644
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
 
+	funcs = list_count(&hidg_func_list);
 	if (!funcs)
 		return -ENODEV;
 
-- 
2.35.1

