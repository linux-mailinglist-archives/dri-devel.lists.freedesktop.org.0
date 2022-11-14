Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC86284FC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 17:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C235510E0E7;
	Mon, 14 Nov 2022 16:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEDF10E0E7;
 Mon, 14 Nov 2022 16:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668442911; x=1699978911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFMpj8pIeak4KWo5LltVRHbs15ezgzFEsmtc9On8Ais=;
 b=XZ7nwpTxZUmXJdQtTc4tQEqBZabumuvCiLmx4lAnY7VbKmMt8xsmC1Xd
 b8MQDvadWk/WWtyzuT8cmBvvBITqXW9gxZZOUBpYsbapak27vxVA9OlcT
 nDZKMnnzrybyp52ZRqyh8If/1fX0YkS7RHGLit4RshiEdNoPt8wOXgXE6
 K7Zc7+CRKWTBh1y43gaK0IseX6924svEHFDgbXhMRJHjCRrouEHnaPlTI
 lBKFnQPPA/drfs+NSWYnRCgIaBf4rPO7XSYfuogQQxckqZ6KoP3pcLhbF
 O2crqbe6EWv1UgcDwj97yBF4qTLSsyT7DobBdltyCEKt0QOGcL8TaotY2 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="313159564"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="313159564"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 08:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="632861255"
X-IronPort-AV: E=Sophos;i="5.96,164,1665471600"; d="scan'208";a="632861255"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2022 08:21:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B76F6B7; Mon, 14 Nov 2022 18:22:10 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/4] usb: gadget: hid: Convert to use list_count()
Date: Mon, 14 Nov 2022 18:22:05 +0200
Message-Id: <20221114162207.62559-2-andriy.shevchenko@linux.intel.com>
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

