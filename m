Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CCF9FB153
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F3C10E569;
	Mon, 23 Dec 2024 16:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="D2j6CtMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C804E10E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:09 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125608euoutp01dd72f1c80599b7af8b6af56223b64723~Tz6A6SIN-0113001130euoutp01N
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241223125608euoutp01dd72f1c80599b7af8b6af56223b64723~Tz6A6SIN-0113001130euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958568;
 bh=ORrD+LcSMZNy/n7i2EH5n6WXPPq9/D5GJi5JKmU760Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D2j6CtMqJZh5e6i8NFkhMYflya4Ooffl23pBZlkF0kzCsvNaLpenYZtmmBp3J3RZf
 bI+Bzj1NKG3+XietXjAw3EctwjvU8Z4kofUVzqWcKSVdOiKJtI+Z+g222nvgOUua7M
 8FuTXUpKmAo4T9CBe7fIMRSFmueyTf7AGzqOz5Gk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241223125607eucas1p1a5cac5813443a4a2a37dfe0d99c95a5a~Tz6AW99w-2328723287eucas1p1Y;
 Mon, 23 Dec 2024 12:56:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 5D.0C.20409.7ED59676; Mon, 23
 Dec 2024 12:56:07 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241223125607eucas1p1eac1c05d699337f9af118c1885b14b1d~Tz5-5zB182402724027eucas1p1b;
 Mon, 23 Dec 2024 12:56:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125607eusmtrp1200c3ac6fb2bd2f08b17b215e4387a6a~Tz5-4z1i52059320593eusmtrp1h;
 Mon, 23 Dec 2024 12:56:07 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-c9-67695de75d46
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BA.73.19654.7ED59676; Mon, 23
 Dec 2024 12:56:07 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125606eusmtip265edc2547cb1cf3b132893f73b1a75dd~Tz5_j6kA-2641026410eusmtip2l;
 Mon, 23 Dec 2024 12:56:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: [RFC PATCH v2 05/19] firmware: thead: Add AON firmware protocol driver
Date: Mon, 23 Dec 2024 13:55:39 +0100
Message-Id: <20241223125553.3527812-6-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUVRzH59x7uXdZW7guKAeiMAqbnGlF0+aMEVGEnalmyiat0QK2uC0g
 D91lFRoKGB4iLiBBmgvGa0ceQYzEbrCJG8+FFChIlgyQJmiB2XgjDxFjuVv53/f7+31+8/v+
 zhwBKdbRboKwqBhOHiWN8KSFlK59pftZ84dhMu+sM/tQh6mEQNp7agZVNXYTqLC12w4N99YR
 6NfFaRp9O/Yzg8YbkyjUX36ZQcntNTSaUA/TaFY1bIf69AU0ms9sBUg3n0Kj6tYhBtUsFhKo
 eFZLIU29HqC0s1fs0C8/BaCh4Q4KTfSpSJSmdkQPrtUzaL3/KoXypwwMqrPk2CFj9XsoxZBH
 +T2OpwdSGWyZmKBwS/oCgxvvFlG4QT3EYFXDTYBrK8/SeLD/Go2/7jyE75wzEvg7TQJOqW4n
 cPZ9bzx9/RaNs+oqAe5NNjFvi48KfUK4iLBTnHy3b7AwdLFBw5zoSAaxN78yg0Sg+yQDCASQ
 3QdbiuIzgFAgZssBVP0xQvBmAUDD+CrDm3kAyy9oN4z95sTUObOtUQZgT64F8MYCoL4mg7JS
 NLsXjpQV2lkbzmwqBVPbkjYpkjUDqBstoK2UE3sIfl9RvTlBsV5QP7dOWVOJ2Jdg2cxJfp0H
 NDR1kVZtz/rBqowBYNUidivsvDS6OUpuMMnafJLntUI41fMBr1+FjWvrtroTnDTW2U5whzdy
 VRSvo+GIds7GxMMGldGmX4CD3au0NQ7JPgNr9Lv58stwcKAL8G/nAAf+3soncIBf6C6SfFkE
 09PEPL0TfqnK/G9pd7mO4DWG93pXwHnwhPqhW9QP3aL+f28RICuBC6dURMo4xd4o7rREIY1U
 KKNkko+jI2vBxte+sW5cqAdlk7OSZkAIQDOAAtLTWdQsDpOJRSHSuE85eXSQXBnBKZrBowLK
 00XkFeLBiVmZNIY7znEnOPm/XUJg75ZIVEOXtdcjsuGpLbmupUfxndSkBE3ceZOPAW2/vsU9
 zvGYQ9tKyyu329md+4V/rSljDouX9mjrA/NP5okNQbcf+Jv9l++GKKWlxeWSDNHCsVx63vW5
 g3G+vrcOjO1Qxp3J0fY53i89fCTep3ZpbjjfYZvlqbzwCsm2wKofHsk/Eh4if6vx3U52qa2p
 k/P88UpPrOs3xZWm0fROtTHRFEtsX90/MX4xuiT1wFy430xAVoDX5PH+meBM/OIbml05Th6/
 Bz32p2756WZCro/1fucz82rZZbeEAI+ZNyV5Xb/RpTiwwNm9x9/p84/Ul4KyD5orntecHpsu
 eTK07v2rwUTTa8sX2h09KUWodM8uUq6Q/gN60vwcSQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7rPYzPTDT4cErI4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CX8XXnEvaCE82MFWdmPGdsYNyW1sXIySEhYCLxrvs5excjF4eQwFJGie7W
 iywQCRmJa90voWxhiT/Xutggil4xSmxav5YdJMEmYCTxYPl8VhBbRGAxi8TefZUgRcwCbxkl
 rs/cCNYtLOAvsW7GQbAiFgFViV2f/gHFOTh4Bewlln8ohFggL7H/4FlmEJtTwEFiTdcNRhBb
 CKjk36kPbCA2r4CgxMmZT8BGMgPVN2+dzTyBUWAWktQsJKkFjEyrGEVSS4tz03OLjfSKE3OL
 S/PS9ZLzczcxAhPMtmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8h4Qy04V4UxIrq1KL8uOLSnNS
 iw8xmgKdPZFZSjQ5H5ji8kriDc0MTA1NzCwNTC3NjJXEedmunE8TEkhPLEnNTk0tSC2C6WPi
 4JRqYHJPWyUSmd/ho3m5SdfGnHsq10/lB3dy396+Yu35RL4qfpeV05EVU3pmm+wQCvx9qjz6
 Us8Ev8BJAf2C7CtmFqX+zFXriVsTualgueqPD7Kbqr6ax1y6sYljR1MF1+O2EyX37CcmWK7O
 vTLzo45IBHuw9iMNW7vcqTNjLJxl730RSZk8T83j4vFXyR3Zb5mnrL559cn5KWF3+Bg1n3Ry
 Tb1UO+/n5d7vgt1q/StK9OWcBb4vTVrIFjd3BYfexg/Pbuw78qDX//6rZ9xS/A1RV22OOzzX
 XHTmpZBLt+f8sqvbpZm33q389a7v0/9NHKkKuhf75zotii/odpj56NDVv9zzl606+XTyrslX
 NoWxSDYqsRRnJBpqMRcVJwIAHwcVG7kDAAA=
X-CMS-MailID: 20241223125607eucas1p1eac1c05d699337f9af118c1885b14b1d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125607eucas1p1eac1c05d699337f9af118c1885b14b1d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125607eucas1p1eac1c05d699337f9af118c1885b14b1d
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125607eucas1p1eac1c05d699337f9af118c1885b14b1d@eucas1p1.samsung.com>
X-Mailman-Approved-At: Mon, 23 Dec 2024 16:04:53 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The T-Head TH1520 SoC uses an E902 co-processor running Always-On (AON)
firmware to manage power, clock, and other system resources [1]. This
patch introduces a driver implementing the AON firmware protocol,
allowing the Linux kernel to communicate with the firmware via mailbox
channels.  Through an RPC-based interface, the kernel can initiate power
state transitions, update resource configurations, and perform other
AON-related tasks.

Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS                                   |   2 +
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/thead,th1520-aon.c           | 203 ++++++++++++++++++
 .../linux/firmware/thead/thead,th1520-aon.h   | 186 ++++++++++++++++
 5 files changed, 401 insertions(+)
 create mode 100644 drivers/firmware/thead,th1520-aon.c
 create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7705d1b6dd7a..42aef66bd257 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20196,10 +20196,12 @@ F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/thead,th1520-power.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
+F:	drivers/firmware/thead,th1520-aon.c
 F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
+F:	include/linux/firmware/thead/thead,th1520-aon.h
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 71d8b26c4103..e08e01de3ee3 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -212,6 +212,15 @@ config SYSFB_SIMPLEFB
 
 	  If unsure, say Y.
 
+config TH1520_AON_PROTOCOL
+	tristate "Always-On firmware protocol"
+	depends on THEAD_TH1520_MBOX
+	help
+	  Power, clock, and resource management capabilities on the TH1520 SoC are
+	  managed by the E902 core. Firmware running on this core communicates with
+	  the kernel through the Always-On protocol, using hardware mailbox as a medium.
+	  Say yes if you need such capabilities.
+
 config TI_SCI_PROTOCOL
 	tristate "TI System Control Interface (TISCI) Message Protocol"
 	depends on TI_MESSAGE_MANAGER
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 7a8d486e718f..5db9c042430c 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_SYSFB)		+= sysfb.o
 obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
+obj-$(CONFIG_TH1520_AON_PROTOCOL) += thead,th1520-aon.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/thead,th1520-aon.c b/drivers/firmware/thead,th1520-aon.c
new file mode 100644
index 000000000000..82198bcfc3a8
--- /dev/null
+++ b/drivers/firmware/thead,th1520-aon.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/firmware/thead/thead,th1520-aon.h>
+
+#define MAX_RX_TIMEOUT (msecs_to_jiffies(3000))
+#define MAX_TX_TIMEOUT 500
+
+struct th1520_aon_chan {
+	struct mbox_chan *ch;
+	struct th1520_aon_rpc_ack_common ack_msg;
+	struct mbox_client cl;
+	struct completion done;
+
+	/* make sure only one RPC is perfomed at a time */
+	struct mutex transaction_lock;
+};
+
+struct th1520_aon_msg_req_set_resource_power_mode {
+	struct th1520_aon_rpc_msg_hdr hdr;
+	u16 resource;
+	u16 mode;
+	u16 reserved[10];
+} __packed __aligned(1);
+
+/*
+ * This type is used to indicate error response for most functions.
+ */
+enum th1520_aon_error_codes {
+	LIGHT_AON_ERR_NONE = 0, /* Success */
+	LIGHT_AON_ERR_VERSION = 1, /* Incompatible API version */
+	LIGHT_AON_ERR_CONFIG = 2, /* Configuration error */
+	LIGHT_AON_ERR_PARM = 3, /* Bad parameter */
+	LIGHT_AON_ERR_NOACCESS = 4, /* Permission error (no access) */
+	LIGHT_AON_ERR_LOCKED = 5, /* Permission error (locked) */
+	LIGHT_AON_ERR_UNAVAILABLE = 6, /* Unavailable (out of resources) */
+	LIGHT_AON_ERR_NOTFOUND = 7, /* Not found */
+	LIGHT_AON_ERR_NOPOWER = 8, /* No power */
+	LIGHT_AON_ERR_IPC = 9, /* Generic IPC error */
+	LIGHT_AON_ERR_BUSY = 10, /* Resource is currently busy/active */
+	LIGHT_AON_ERR_FAIL = 11, /* General I/O failure */
+	LIGHT_AON_ERR_LAST
+};
+
+static int th1520_aon_linux_errmap[LIGHT_AON_ERR_LAST] = {
+	0, /* LIGHT_AON_ERR_NONE */
+	-EINVAL, /* LIGHT_AON_ERR_VERSION */
+	-EINVAL, /* LIGHT_AON_ERR_CONFIG */
+	-EINVAL, /* LIGHT_AON_ERR_PARM */
+	-EACCES, /* LIGHT_AON_ERR_NOACCESS */
+	-EACCES, /* LIGHT_AON_ERR_LOCKED */
+	-ERANGE, /* LIGHT_AON_ERR_UNAVAILABLE */
+	-EEXIST, /* LIGHT_AON_ERR_NOTFOUND */
+	-EPERM, /* LIGHT_AON_ERR_NOPOWER */
+	-EPIPE, /* LIGHT_AON_ERR_IPC */
+	-EBUSY, /* LIGHT_AON_ERR_BUSY */
+	-EIO, /* LIGHT_AON_ERR_FAIL */
+};
+
+static inline int th1520_aon_to_linux_errno(int errno)
+{
+	if (errno >= LIGHT_AON_ERR_NONE && errno < LIGHT_AON_ERR_LAST)
+		return th1520_aon_linux_errmap[errno];
+
+	return -EIO;
+}
+
+static void th1520_aon_rx_callback(struct mbox_client *c, void *rx_msg)
+{
+	struct th1520_aon_chan *aon_chan =
+		container_of(c, struct th1520_aon_chan, cl);
+	struct th1520_aon_rpc_msg_hdr *hdr =
+		(struct th1520_aon_rpc_msg_hdr *)rx_msg;
+	u8 recv_size = sizeof(struct th1520_aon_rpc_msg_hdr) + hdr->size;
+
+	if (recv_size != sizeof(struct th1520_aon_rpc_ack_common)) {
+		dev_err(c->dev, "Invalid ack size, not completing\n");
+		return;
+	}
+
+	memcpy(&aon_chan->ack_msg, rx_msg, recv_size);
+	complete(&aon_chan->done);
+}
+
+int th1520_aon_call_rpc(struct th1520_aon_chan *aon_chan, void *msg)
+{
+	struct th1520_aon_rpc_msg_hdr *hdr = msg;
+	int ret;
+
+	mutex_lock(&aon_chan->transaction_lock);
+	reinit_completion(&aon_chan->done);
+
+	RPC_SET_VER(hdr, TH1520_AON_RPC_VERSION);
+	RPC_SET_SVC_ID(hdr, hdr->svc);
+	RPC_SET_SVC_FLAG_MSG_TYPE(hdr, RPC_SVC_MSG_TYPE_DATA);
+	RPC_SET_SVC_FLAG_ACK_TYPE(hdr, RPC_SVC_MSG_NEED_ACK);
+
+	ret = mbox_send_message(aon_chan->ch, msg);
+	if (ret < 0) {
+		dev_err(aon_chan->cl.dev, "RPC send msg failed: %d\n", ret);
+		goto out;
+	}
+
+	if (!wait_for_completion_timeout(&aon_chan->done, MAX_RX_TIMEOUT)) {
+		dev_err(aon_chan->cl.dev, "RPC send msg timeout\n");
+		mutex_unlock(&aon_chan->transaction_lock);
+		return -ETIMEDOUT;
+	}
+
+	ret = aon_chan->ack_msg.err_code;
+
+out:
+	mutex_unlock(&aon_chan->transaction_lock);
+
+	return th1520_aon_to_linux_errno(ret);
+}
+EXPORT_SYMBOL_GPL(th1520_aon_call_rpc);
+
+int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
+			    bool power_on)
+{
+	struct th1520_aon_msg_req_set_resource_power_mode msg = {};
+	struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
+	int ret;
+
+	hdr->svc = TH1520_AON_RPC_SVC_PM;
+	hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
+	hdr->size = TH1520_AON_RPC_MSG_NUM;
+
+	RPC_SET_BE16(&msg.resource, 0, rsrc);
+	RPC_SET_BE16(&msg.resource, 2,
+		     (power_on ? TH1520_AON_PM_PW_MODE_ON :
+				 TH1520_AON_PM_PW_MODE_OFF));
+
+	ret = th1520_aon_call_rpc(aon_chan, &msg);
+	if (ret)
+		dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
+			power_on ? "up" : "off", rsrc, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(th1520_aon_power_update);
+
+static int th1520_aon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct th1520_aon_chan *aon_chan;
+	struct mbox_client *cl;
+	int ret;
+
+	aon_chan = devm_kzalloc(dev, sizeof(*aon_chan), GFP_KERNEL);
+	if (!aon_chan)
+		return -ENOMEM;
+
+	cl = &aon_chan->cl;
+	cl->dev = dev;
+	cl->tx_block = true;
+	cl->tx_tout = MAX_TX_TIMEOUT;
+	cl->rx_callback = th1520_aon_rx_callback;
+
+	aon_chan->ch = mbox_request_channel_byname(cl, "aon");
+	if (IS_ERR(aon_chan->ch)) {
+		ret = PTR_ERR(aon_chan->ch);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request aon mbox chan ret %d\n",
+				ret);
+		return ret;
+	}
+
+	mutex_init(&aon_chan->transaction_lock);
+	init_completion(&aon_chan->done);
+
+	platform_set_drvdata(pdev, aon_chan);
+
+	return devm_of_platform_populate(dev);
+}
+
+static const struct of_device_id th1520_aon_match[] = {
+	{ .compatible = "thead,th1520-aon" },
+	{ /* Sentinel */ }
+};
+
+static struct platform_driver th1520_aon_driver = {
+	.driver = {
+		.name = "th1520-aon",
+		.of_match_table = th1520_aon_match,
+	},
+	.probe = th1520_aon_probe,
+};
+module_platform_driver(th1520_aon_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("T-HEAD TH1520 Always-On firmware driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/thead/thead,th1520-aon.h b/include/linux/firmware/thead/thead,th1520-aon.h
new file mode 100644
index 000000000000..3daa17c01d17
--- /dev/null
+++ b/include/linux/firmware/thead/thead,th1520-aon.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ */
+
+#ifndef _THEAD_AON_H
+#define _THEAD_AON_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+#define AON_RPC_MSG_MAGIC (0xef)
+#define TH1520_AON_RPC_VERSION 2
+#define TH1520_AON_RPC_MSG_NUM 7
+
+extern struct th1520_aon_chan *aon_chan;
+
+enum th1520_aon_rpc_svc {
+	TH1520_AON_RPC_SVC_UNKNOWN = 0,
+	TH1520_AON_RPC_SVC_PM = 1,
+	TH1520_AON_RPC_SVC_MISC = 2,
+	TH1520_AON_RPC_SVC_AVFS = 3,
+	TH1520_AON_RPC_SVC_SYS = 4,
+	TH1520_AON_RPC_SVC_WDG = 5,
+	TH1520_AON_RPC_SVC_LPM = 6,
+	TH1520_AON_RPC_SVC_MAX = 0x3F,
+};
+
+enum th1520_aon_misc_func {
+	TH1520_AON_MISC_FUNC_UNKNOWN = 0,
+	TH1520_AON_MISC_FUNC_SET_CONTROL = 1,
+	TH1520_AON_MISC_FUNC_GET_CONTROL = 2,
+	TH1520_AON_MISC_FUNC_REGDUMP_CFG = 3,
+};
+
+enum th1520_aon_wdg_func {
+	TH1520_AON_WDG_FUNC_UNKNOWN = 0,
+	TH1520_AON_WDG_FUNC_START = 1,
+	TH1520_AON_WDG_FUNC_STOP = 2,
+	TH1520_AON_WDG_FUNC_PING = 3,
+	TH1520_AON_WDG_FUNC_TIMEOUTSET = 4,
+	TH1520_AON_WDG_FUNC_RESTART = 5,
+	TH1520_AON_WDG_FUNC_GET_STATE = 6,
+	TH1520_AON_WDG_FUNC_POWER_OFF = 7,
+	TH1520_AON_WDG_FUNC_AON_WDT_ON = 8,
+	TH1520_AON_WDG_FUNC_AON_WDT_OFF = 9,
+};
+
+enum th1520_aon_sys_func {
+	TH1520_AON_SYS_FUNC_UNKNOWN = 0,
+	TH1520_AON_SYS_FUNC_AON_RESERVE_MEM = 1,
+};
+
+enum th1520_aon_lpm_func {
+	TH1520_AON_LPM_FUNC_UNKNOWN = 0,
+	TH1520_AON_LPM_FUNC_REQUIRE_STR = 1,
+	TH1520_AON_LPM_FUNC_RESUME_STR = 2,
+	TH1520_AON_LPM_FUNC_REQUIRE_STD = 3,
+	TH1520_AON_LPM_FUNC_CPUHP = 4,
+	TH1520_AON_LPM_FUNC_REGDUMP_CFG = 5,
+};
+
+enum th1520_aon_pm_func {
+	TH1520_AON_PM_FUNC_UNKNOWN = 0,
+	TH1520_AON_PM_FUNC_SET_RESOURCE_REGULATOR = 1,
+	TH1520_AON_PM_FUNC_GET_RESOURCE_REGULATOR = 2,
+	TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE = 3,
+	TH1520_AON_PM_FUNC_PWR_SET = 4,
+	TH1520_AON_PM_FUNC_PWR_GET = 5,
+	TH1520_AON_PM_FUNC_CHECK_FAULT = 6,
+	TH1520_AON_PM_FUNC_GET_TEMPERATURE = 7,
+};
+
+struct th1520_aon_rpc_msg_hdr {
+	u8 ver; /* version of msg hdr */
+	u8 size; /*  msg size ,uinit in bytes,the size includes rpc msg header self */
+	u8 svc; /* rpc main service id */
+	u8 func; /* rpc sub func id of specific service, sent by caller */
+} __packed __aligned(1);
+
+struct th1520_aon_rpc_ack_common {
+	struct th1520_aon_rpc_msg_hdr hdr;
+	u8 err_code;
+} __packed __aligned(1);
+
+#define RPC_SVC_MSG_TYPE_DATA 0
+#define RPC_SVC_MSG_TYPE_ACK 1
+#define RPC_SVC_MSG_NEED_ACK 0
+#define RPC_SVC_MSG_NO_NEED_ACK 1
+
+#define RPC_GET_VER(MESG) ((MESG)->ver)
+#define RPC_SET_VER(MESG, VER) ((MESG)->ver = (VER))
+#define RPC_GET_SVC_ID(MESG) ((MESG)->svc & 0x3F)
+#define RPC_SET_SVC_ID(MESG, ID) ((MESG)->svc |= 0x3F & (ID))
+#define RPC_GET_SVC_FLAG_MSG_TYPE(MESG) (((MESG)->svc & 0x80) >> 7)
+#define RPC_SET_SVC_FLAG_MSG_TYPE(MESG, TYPE) ((MESG)->svc |= (TYPE) << 7)
+#define RPC_GET_SVC_FLAG_ACK_TYPE(MESG) (((MESG)->svc & 0x40) >> 6)
+#define RPC_SET_SVC_FLAG_ACK_TYPE(MESG, ACK) ((MESG)->svc |= (ACK) << 6)
+
+#define RPC_SET_BE64(MESG, OFFSET, SET_DATA)                                \
+	do {                                                                \
+		u8 *data = (u8 *)(MESG);                                    \
+		u64 _offset = (OFFSET);                                     \
+		u64 _set_data = (SET_DATA);                                 \
+		data[_offset + 7] = _set_data & 0xFF;                       \
+		data[_offset + 6] = (_set_data & 0xFF00) >> 8;              \
+		data[_offset + 5] = (_set_data & 0xFF0000) >> 16;           \
+		data[_offset + 4] = (_set_data & 0xFF000000) >> 24;         \
+		data[_offset + 3] = (_set_data & 0xFF00000000) >> 32;       \
+		data[_offset + 2] = (_set_data & 0xFF0000000000) >> 40;     \
+		data[_offset + 1] = (_set_data & 0xFF000000000000) >> 48;   \
+		data[_offset + 0] = (_set_data & 0xFF00000000000000) >> 56; \
+	} while (0)
+
+#define RPC_SET_BE32(MESG, OFFSET, SET_DATA)			    \
+	do {							    \
+		u8 *data = (u8 *)(MESG);			    \
+		u64 _offset = (OFFSET);				    \
+		u64 _set_data = (SET_DATA);			    \
+		data[_offset + 3] = (_set_data) & 0xFF;		    \
+		data[_offset + 2] = (_set_data & 0xFF00) >> 8;	    \
+		data[_offset + 1] = (_set_data & 0xFF0000) >> 16;   \
+		data[_offset + 0] = (_set_data & 0xFF000000) >> 24; \
+	} while (0)
+
+#define RPC_SET_BE16(MESG, OFFSET, SET_DATA)		       \
+	do {						       \
+		u8 *data = (u8 *)(MESG);		       \
+		u64 _offset = (OFFSET);			       \
+		u64 _set_data = (SET_DATA);		       \
+		data[_offset + 1] = (_set_data) & 0xFF;	       \
+		data[_offset + 0] = (_set_data & 0xFF00) >> 8; \
+	} while (0)
+
+#define RPC_SET_U8(MESG, OFFSET, SET_DATA)	  \
+	do {					  \
+		u8 *data = (u8 *)(MESG);	  \
+		data[OFFSET] = (SET_DATA) & 0xFF; \
+	} while (0)
+
+#define RPC_GET_BE64(MESG, OFFSET, PTR)                                      \
+	do {                                                                 \
+		u8 *data = (u8 *)(MESG);                                     \
+		u64 _offset = (OFFSET);                                      \
+		*(u32 *)(PTR) =                                              \
+			(data[_offset + 7] | data[_offset + 6] << 8 |        \
+			 data[_offset + 5] << 16 | data[_offset + 4] << 24 | \
+			 data[_offset + 3] << 32 | data[_offset + 2] << 40 | \
+			 data[_offset + 1] << 48 | data[_offset + 0] << 56); \
+	} while (0)
+
+#define RPC_GET_BE32(MESG, OFFSET, PTR)                                      \
+	do {                                                                 \
+		u8 *data = (u8 *)(MESG);                                     \
+		u64 _offset = (OFFSET);                                      \
+		*(u32 *)(PTR) =                                              \
+			(data[_offset + 3] | data[_offset + 2] << 8 |        \
+			 data[_offset + 1] << 16 | data[_offset + 0] << 24); \
+	} while (0)
+
+#define RPC_GET_BE16(MESG, OFFSET, PTR)                                       \
+	do {                                                                  \
+		u8 *data = (u8 *)(MESG);                                      \
+		u64 _offset = (OFFSET);                                       \
+		*(u16 *)(PTR) = (data[_offset + 1] | data[_offset + 0] << 8); \
+	} while (0)
+
+#define RPC_GET_U8(MESG, OFFSET, PTR)          \
+	do {                                   \
+		u8 *data = (u8 *)(MESG);       \
+		*(u8 *)(PTR) = (data[OFFSET]); \
+	} while (0)
+
+/*
+ * Defines for SC PM Power Mode
+ */
+#define TH1520_AON_PM_PW_MODE_OFF 0 /* Power off */
+#define TH1520_AON_PM_PW_MODE_STBY 1 /* Power in standby */
+#define TH1520_AON_PM_PW_MODE_LP 2 /* Power in low-power */
+#define TH1520_AON_PM_PW_MODE_ON 3 /* Power on */
+
+int th1520_aon_call_rpc(struct th1520_aon_chan *aon_chan, void *msg);
+int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
+			    bool power_on);
+
+#endif /* _THEAD_AON_H */
-- 
2.34.1

