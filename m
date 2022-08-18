Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9985990DD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E436510EA49;
	Thu, 18 Aug 2022 23:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F132510E230;
 Thu, 18 Aug 2022 23:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660863795; x=1692399795;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ww8r+H8UI5TF9H8lorB/wHDJFcQK322x30v8gdjs3Bc=;
 b=iA5IXREm/wEpqUo1CiFgbBhLJ497MGHhHEqeGeIEJYgpGZq9DxDczGs/
 ck2uFPq4Ir6WmrkP6HeXWGc8KA+KFljHaSUaH6aqf5aPJ6ZyK0ALd6PUs
 qHCbAyNMWzwH/Us3Gs5MPpdwj06AoJm1AjxtZ86VBkBaITKZ9GhhAgpTi
 sTIVXuK6QqZciv1iWkZkI2YBL3f1Qt5/94i+rmBrpL9RkJ6A8Tw0im2YX
 /TvHi5Q/pNrChEAhZVySFOuSQTnpk2mo7csG3mjqVEbEFT3k/QoBkJy5a
 3ME+0S3Zlp2OKCFuyNj6ZuhmzDrIjLULiTW5bTemnRdh8Gff6CLWjiN+0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293677532"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="293677532"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="641042831"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:03:14 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/15] mei: bus: enable sending gsc commands
Date: Thu, 18 Aug 2022 16:02:31 -0700
Message-Id: <20220818230243.3921066-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
References: <20220818230243.3921066-1-daniele.ceraolospurio@intel.com>
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomas Winkler <tomas.winkler@intel.com>

GSC command is and extended header containing a scatter gather
list and without a data buffer. Using MEI_CL_IO_SGL flag,
the caller send the GSC command as a data and the function internally
moves it to the extended header.

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Vitaly Lubart <vitaly.lubart@intel.com>
---
 drivers/misc/mei/bus.c     | 20 ++++++++++++++++++--
 drivers/misc/mei/mei_dev.h |  4 ++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 46aa3554e97b..225f0b04c021 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -100,9 +100,18 @@ ssize_t __mei_cl_send(struct mei_cl *cl, const u8 *buf, size_t length, u8 vtag,
 	cb->internal = !!(mode & MEI_CL_IO_TX_INTERNAL);
 	cb->blocking = !!(mode & MEI_CL_IO_TX_BLOCKING);
 	memcpy(cb->buf.data, buf, length);
+	/* hack we point data to header */
+	if (mode & MEI_CL_IO_SGL) {
+		cb->ext_hdr = (struct mei_ext_hdr *)cb->buf.data;
+		cb->buf.data = NULL;
+		cb->buf.size = 0;
+	}
 
 	rets = mei_cl_write(cl, cb);
 
+	if (mode & MEI_CL_IO_SGL && rets == 0)
+		rets = length;
+
 out:
 	mutex_unlock(&bus->device_lock);
 
@@ -205,9 +214,16 @@ ssize_t __mei_cl_recv(struct mei_cl *cl, u8 *buf, size_t length, u8 *vtag,
 		goto free;
 	}
 
-	r_length = min_t(size_t, length, cb->buf_idx);
-	memcpy(buf, cb->buf.data, r_length);
+	/* for the GSC type - copy the extended header to the buffer */
+	if (cb->ext_hdr && cb->ext_hdr->type == MEI_EXT_HDR_GSC) {
+		r_length = min_t(size_t, length, cb->ext_hdr->length * sizeof(u32));
+		memcpy(buf, cb->ext_hdr, r_length);
+	} else {
+		r_length = min_t(size_t, length, cb->buf_idx);
+		memcpy(buf, cb->buf.data, r_length);
+	}
 	rets = r_length;
+
 	if (vtag)
 		*vtag = cb->vtag;
 
diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
index 862190b297aa..5e28294d5dca 100644
--- a/drivers/misc/mei/mei_dev.h
+++ b/drivers/misc/mei/mei_dev.h
@@ -109,12 +109,16 @@ enum mei_cb_file_ops {
  * @MEI_CL_IO_TX_INTERNAL: internal communication between driver and FW
  *
  * @MEI_CL_IO_RX_NONBLOCK: recv is non-blocking
+ *
+ * @MEI_CL_IO_SGL: send command with sgl list.
  */
 enum mei_cl_io_mode {
 	MEI_CL_IO_TX_BLOCKING = BIT(0),
 	MEI_CL_IO_TX_INTERNAL = BIT(1),
 
 	MEI_CL_IO_RX_NONBLOCK = BIT(2),
+
+	MEI_CL_IO_SGL         = BIT(3),
 };
 
 /*
-- 
2.37.2

