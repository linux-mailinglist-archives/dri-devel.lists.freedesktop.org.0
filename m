Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801305B64BC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 02:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69C210E4B8;
	Tue, 13 Sep 2022 00:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2122C10E146;
 Tue, 13 Sep 2022 00:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663030680; x=1694566680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dSn5ENyM/L0bRTdqhMg5nc4FwQpC6jS9Ez8tZ0Ah7sM=;
 b=WK2GQT0mcr81yx+TeEarV3zKrHVReIDtGm8z07kYmsVW5Nj007OKTFao
 xUEYyTD757rvdlMDbp7JohVxg2ZeJVfaXuE8IrHF0BwS9Tldm66Smj5xT
 80/2aBbosvs9mY8OQH89jDwLyf9xu2v3pqsejaJn3rgIYpLZMtcPoTCQr
 fTsho3g4ZGFMG6Y+3Vm30ezojLixv0jehdbOcDaubYI7SHi1W1NOivof2
 caWQNKwhikZQA0BgVNXejQslDAPkgwDzLOx189uEeD9QrRIKdZL3lyxS3
 UzyYVAqn6BrunbiOisgHIadtQX9Xsb7tPXDSsle3zB6e/uxZ0JzPkKdor Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281024403"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="281024403"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:57:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="758593532"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:57:59 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 04/15] mei: bus: extend bus API to support command streamer
 API
Date: Mon, 12 Sep 2022 17:57:28 -0700
Message-Id: <20220913005739.798337-5-daniele.ceraolospurio@intel.com>
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

From: Vitaly Lubart <vitaly.lubart@intel.com>

Add mei bus API for sending gsc commands: mei_cldev_send_gsc_command()

The GSC commands are originated in the graphics stack
and are in form of SGL DMA buffers.
The GSC commands are synchronous, the response is received
in the same call on the out sg list buffers.
The function setups pointers for in and out sg lists in the
mei sgl extended header and sends it to the firmware.

Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V2:
 1. More detailed commit message
 2. Fix typo in the comments
V3-4:Rebase
V5:
1. Use forward declaration instead of
   #include <linux/scatterlist.h> in mei_cl_bus.h

 drivers/misc/mei/bus.c     | 126 +++++++++++++++++++++++++++++++++++++
 include/linux/mei_cl_bus.h |   6 ++
 2 files changed, 132 insertions(+)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 225f0b04c021..1fbe127ff633 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -13,6 +13,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/interrupt.h>
+#include <linux/scatterlist.h>
 #include <linux/mei_cl_bus.h>
 
 #include "mei_dev.h"
@@ -838,6 +839,131 @@ int mei_cldev_disable(struct mei_cl_device *cldev)
 }
 EXPORT_SYMBOL_GPL(mei_cldev_disable);
 
+/**
+ * mei_cldev_send_gsc_command - sends a gsc command, by sending
+ * a gsl mei message to gsc and receiving reply from gsc
+ *
+ * @cldev: me client device
+ * @client_id: client id to send the command to
+ * @fence_id: fence id to send the command to
+ * @sg_in: scatter gather list containing addresses for rx message buffer
+ * @total_in_len: total length of data in 'in' sg, can be less than the sum of buffers sizes
+ * @sg_out: scatter gather list containing addresses for tx message buffer
+ *
+ * Return:
+ *  * written size in bytes
+ *  * < 0 on error
+ */
+ssize_t mei_cldev_send_gsc_command(struct mei_cl_device *cldev,
+				   u8 client_id, u32 fence_id,
+				   struct scatterlist *sg_in,
+				   size_t total_in_len,
+				   struct scatterlist *sg_out)
+{
+	struct mei_cl *cl;
+	struct mei_device *bus;
+	ssize_t ret = 0;
+
+	struct mei_ext_hdr_gsc_h2f *ext_hdr;
+	size_t buf_sz = sizeof(struct mei_ext_hdr_gsc_h2f);
+	int sg_out_nents, sg_in_nents;
+	int i;
+	struct scatterlist *sg;
+	struct mei_ext_hdr_gsc_f2h rx_msg;
+	unsigned int sg_len;
+
+	if (!cldev || !sg_in || !sg_out)
+		return -EINVAL;
+
+	cl = cldev->cl;
+	bus = cldev->bus;
+
+	dev_dbg(bus->dev, "client_id %u, fence_id %u\n", client_id, fence_id);
+
+	if (!bus->hbm_f_gsc_supported)
+		return -EOPNOTSUPP;
+
+	sg_out_nents = sg_nents(sg_out);
+	sg_in_nents = sg_nents(sg_in);
+	/* at least one entry in tx and rx sgls must be present */
+	if (sg_out_nents <= 0 || sg_in_nents <= 0)
+		return -EINVAL;
+
+	buf_sz += (sg_out_nents + sg_in_nents) * sizeof(struct mei_gsc_sgl);
+	ext_hdr = kzalloc(buf_sz, GFP_KERNEL);
+	if (!ext_hdr)
+		return -ENOMEM;
+
+	/* construct the GSC message */
+	ext_hdr->hdr.type = MEI_EXT_HDR_GSC;
+	ext_hdr->hdr.length = buf_sz / sizeof(u32); /* length is in dw */
+
+	ext_hdr->client_id = client_id;
+	ext_hdr->addr_type = GSC_ADDRESS_TYPE_PHYSICAL_SGL;
+	ext_hdr->fence_id = fence_id;
+	ext_hdr->input_address_count = sg_in_nents;
+	ext_hdr->output_address_count = sg_out_nents;
+	ext_hdr->reserved[0] = 0;
+	ext_hdr->reserved[1] = 0;
+
+	/* copy in-sgl to the message */
+	for (i = 0, sg = sg_in; i < sg_in_nents; i++, sg++) {
+		ext_hdr->sgl[i].low = lower_32_bits(sg_dma_address(sg));
+		ext_hdr->sgl[i].high = upper_32_bits(sg_dma_address(sg));
+		sg_len = min_t(unsigned int, sg_dma_len(sg), PAGE_SIZE);
+		ext_hdr->sgl[i].length = (sg_len <= total_in_len) ? sg_len : total_in_len;
+		total_in_len -= ext_hdr->sgl[i].length;
+	}
+
+	/* copy out-sgl to the message */
+	for (i = sg_in_nents, sg = sg_out; i < sg_in_nents + sg_out_nents; i++, sg++) {
+		ext_hdr->sgl[i].low = lower_32_bits(sg_dma_address(sg));
+		ext_hdr->sgl[i].high = upper_32_bits(sg_dma_address(sg));
+		sg_len = min_t(unsigned int, sg_dma_len(sg), PAGE_SIZE);
+		ext_hdr->sgl[i].length = sg_len;
+	}
+
+	/* send the message to GSC */
+	ret = __mei_cl_send(cl, (u8 *)ext_hdr, buf_sz, 0, MEI_CL_IO_SGL);
+	if (ret < 0) {
+		dev_err(bus->dev, "__mei_cl_send failed, returned %zd\n", ret);
+		goto end;
+	}
+	if (ret != buf_sz) {
+		dev_err(bus->dev, "__mei_cl_send returned %zd instead of expected %zd\n",
+			ret, buf_sz);
+		ret = -EIO;
+		goto end;
+	}
+
+	/* receive the reply from GSC, note that at this point sg_in should contain the reply */
+	ret = __mei_cl_recv(cl, (u8 *)&rx_msg, sizeof(rx_msg), NULL, MEI_CL_IO_SGL, 0);
+
+	if (ret != sizeof(rx_msg)) {
+		dev_err(bus->dev, "__mei_cl_recv returned %zd instead of expected %zd\n",
+			ret, sizeof(rx_msg));
+		if (ret >= 0)
+			ret = -EIO;
+		goto end;
+	}
+
+	/* check rx_msg.client_id and rx_msg.fence_id match the ones we send */
+	if (rx_msg.client_id != client_id || rx_msg.fence_id != fence_id) {
+		dev_err(bus->dev, "received client_id/fence_id  %u/%u  instead of %u/%u sent\n",
+			rx_msg.client_id, rx_msg.fence_id, client_id, fence_id);
+		ret = -EFAULT;
+		goto end;
+	}
+
+	dev_dbg(bus->dev, "gsc command: successfully written %u bytes\n",  rx_msg.written);
+	ret = rx_msg.written;
+
+end:
+	kfree(ext_hdr);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mei_cldev_send_gsc_command);
+
 /**
  * mei_cl_device_find - find matching entry in the driver id table
  *
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index df1fab44ea5c..fd6e0620658d 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -11,6 +11,7 @@
 
 struct mei_cl_device;
 struct mei_device;
+struct scatterlist;
 
 typedef void (*mei_cldev_cb_t)(struct mei_cl_device *cldev);
 
@@ -116,6 +117,11 @@ void mei_cldev_set_drvdata(struct mei_cl_device *cldev, void *data);
 int mei_cldev_enable(struct mei_cl_device *cldev);
 int mei_cldev_disable(struct mei_cl_device *cldev);
 bool mei_cldev_enabled(const struct mei_cl_device *cldev);
+ssize_t mei_cldev_send_gsc_command(struct mei_cl_device *cldev,
+				   u8 client_id, u32 fence_id,
+				   struct scatterlist *sg_in,
+				   size_t total_in_len,
+				   struct scatterlist *sg_out);
 
 void *mei_cldev_dma_map(struct mei_cl_device *cldev, u8 buffer_id, size_t size);
 int mei_cldev_dma_unmap(struct mei_cl_device *cldev);
-- 
2.37.2

