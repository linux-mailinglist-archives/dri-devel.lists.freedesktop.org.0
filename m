Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA0636257
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 15:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0B110E569;
	Wed, 23 Nov 2022 14:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB29F10E561;
 Wed, 23 Nov 2022 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669214951; x=1700750951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PZw/qx/VCBuHt8kLTtD2kAjtrp/ndgtSgsymsuc6HUA=;
 b=b94MSyV6Z3VbT8k4JYhSSkUqY7+WLa3Fth1u8DJFhCIB0Yl1ZDtJgzl7
 vkoosvAr/k4/0X7DTa0S7fnBy9s/PHtIwmyNu2u3mJfmh/ceN+GrFBN53
 84iq5BOEk4Cr/a/Do5s+wcVe6NwjddSUZ3YiREmiUR6oaaUB5LXi9WHfL
 hussW35TGAucXEty9DXmJvGJXux6q30N5BaOYpRooWycO5bI0XhKzUceP
 pXJhimV92n7JQbRbBBTW/gpyVImGvVMJfxLq4wm2V7s5tZt/ffaEVms5p
 C6JQ55osYLQZ1LAKnEmA09FIlYe3SsYcJVnIeTq9a7G5ZenIqFGYxPCaj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="376225199"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="376225199"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 06:48:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="635936969"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="635936969"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 23 Nov 2022 06:48:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9096CB7; Wed, 23 Nov 2022 16:49:03 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 2/4] usb: gadget: hid: Convert to use list_count()
Date: Wed, 23 Nov 2022 16:48:59 +0200
Message-Id: <20221123144901.40493-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123144901.40493-1-andriy.shevchenko@linux.intel.com>
References: <20221123144901.40493-1-andriy.shevchenko@linux.intel.com>
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
v4: no change
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

