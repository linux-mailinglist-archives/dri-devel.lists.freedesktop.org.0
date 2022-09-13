Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA245B64B9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 02:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530E510E4B6;
	Tue, 13 Sep 2022 00:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAE810E26F;
 Tue, 13 Sep 2022 00:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663030678; x=1694566678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eLf3qCIp/P20E0ySTskkgJfR251VHQVxMiy8Lrv9NLQ=;
 b=SQAvVfnmsOFtNANlQEDgm7+ub/vK7HFGkqbRFN8xhO4DeYVHbaqtNFk1
 AVT58avnXrntZYRJTLKZNIFEClG7Y40Td3zpVwmb64u4YHHlZ2s110Eja
 YCvKqJoxX0wPAkxEUR3g6Q0G5qNqnWb2sD0nK7r0ahe3uJxr9aNQAkH5/
 ujDcYiWo+xNlnV5PLhGesbwjLql1mMz1wsDY/7MkO+g10mahCxsCKYtKT
 pLwOPhsTgw3BYOSg5jPe20jdw9afEVenlhPdLb9FLWGmjhpz03BKF/93I
 ecBb5eVEUiqd81xF3TpWBAohTeZwmBfsjBFFBg2MGVdUKJZ0rrGPoMN2e Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281024397"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="281024397"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:57:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="758593516"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:57:57 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 02/15] mei: bus: enable sending gsc commands
Date: Mon, 12 Sep 2022 17:57:26 -0700
Message-Id: <20220913005739.798337-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomas Winkler <tomas.winkler@intel.com>,
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V2-5: Rebase

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
index 31784bbc2d2a..8d8018428d9d 100644
--- a/drivers/misc/mei/mei_dev.h
+++ b/drivers/misc/mei/mei_dev.h
@@ -116,12 +116,16 @@ enum mei_cb_file_ops {
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

