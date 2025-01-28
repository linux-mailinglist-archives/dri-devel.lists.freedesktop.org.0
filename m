Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB7EA2126D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2315010E70C;
	Tue, 28 Jan 2025 19:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="kTvcS8ND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD46210E6F7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194832euoutp01bcd0ca507e26574e9b35587b99006089~e8wW6RPZ60285702857euoutp01D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250128194832euoutp01bcd0ca507e26574e9b35587b99006089~e8wW6RPZ60285702857euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093712;
 bh=F42ge0cWpEA2ZEP7rKprcnbQ7Nej3sdZbnZzfM3rzsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kTvcS8NDfmNg/DomThXryHVqax5dkX5iz/ue6fPcmYMLK+XyiMYZ56JDCicAfQfR5
 TUnTbz4MnSvApj9ddqX4xqOoMZunrZwVn9WKqRDp1kMYzH6VJR2MmAj+QSQy2w0ITl
 bDFVDRi6mU1bzRjKGrEMMv1lhB50k/VKz1IqVCeU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194831eucas1p180f3e2354851060b945e48a875964c5e~e8wWeP30y1988619886eucas1p1r;
 Tue, 28 Jan 2025 19:48:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id E5.B2.20409.F8439976; Tue, 28
 Jan 2025 19:48:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194830eucas1p134d566631b5622c85d843f5d811c3c00~e8wVRHGR71987819878eucas1p1i;
 Tue, 28 Jan 2025 19:48:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194830eusmtrp2a9743f9095304aadca93ec23374dfb95~e8wVQXF_x3008430084eusmtrp2X;
 Tue, 28 Jan 2025 19:48:30 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-0b-6799348fa49a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 20.BB.19654.E8439976; Tue, 28
 Jan 2025 19:48:30 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194829eusmtip1b56509fd0aa0051027ab69a29a6ef41a~e8wT-bR8T0291602916eusmtip1Z;
 Tue, 28 Jan 2025 19:48:28 +0000 (GMT)
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
Subject: [PATCH v4 04/18] firmware: thead: Add AON firmware protocol driver
Date: Tue, 28 Jan 2025 20:48:02 +0100
Message-Id: <20250128194816.2185326-5-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128194816.2185326-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se1BUdRTud+/de5fNhetC8gsZhU3LbAJidppfQyElzty0tCZncizKLe4s
 ECzMXvARlTLABguCmrTLCoIMr7CNgVheiau8VsFdlQ0wA2KKlKXluaxFDBjLpfK/75zv++Y7
 58wR4hIj6SeMVSazKqU8XkqKiMbuhZvP58sKFSFftUrRtcEyDBkX9RT6ts2KoZJOqwCN9DVg
 6EfXNIm++/0Whcbb0gg0UF1MofTuWhLZ9SMkms0dESBbaxGJnCc7AWp0ZpDI0DlMoVpXCYYu
 zBoJVN7cCpA6u1KAbvfsQsMj1whkt+XiSK33Qg8vNVNoeaCOQOemTBRqcJwWILPhXZRhOktE
 bGKm72RSjMNuJ5iOrHmKaXtQSjAt+mGKyW25AZj6mmySGRq4RDLnr7/N/JJjxpjvy48zGYZu
 jMlfCmGmL/eTTF5DDWD60geptyQHRS9Hs/Gxh1lVcPghUcxwulOQtKQDR/vrA0+AiSMaIBRC
 Wgbt8/s1QCSU0NUA1tcskhrgsVLMA1h+NZInnAAuWyzATbgNtzq+ATxRBeCVkvMEXzgALOit
 w90qkg6Fo1UlAjfhQ2cSMLMrbdWC0/cBbBwrWg3xpvfA32Ycqw6C3grL/uim3FhM74BaW5OA
 z9sMTVctqxoPOgLWL1UTvGY9vF44torxFU268RzuDoC0QQTzmmbWho2Ep5Y1GI+94YS5geKx
 P3zYUrLWT4Sjxjmcx5/BllzzGg6DQ9a/SfeVcPpZWNsazLdfhbqvfwL88Tzhncn1/Aie8Eyj
 FufbYpillvDqp2FB7sn/Qq3VjRgvYWCXRXYKBOof2UX/yC76/2NLAV4DfNkULkHBcqFK9kgQ
 J0/gUpSKoI8TE+rBymf3Lpvnm0HVxGxQO8CEoB1AIS71EUdZdQqJOFp+7FNWlfihKiWe5drB
 RiEh9RWXmTIVElohT2Y/YdkkVvUviwk9/E5gxWcLZi5qU4ONh+8VP3gn0r8D9wqKW+fytrZH
 bB568aMDUanbSneqw2xev7p2b1A4KjLGufCugHubvFySg0MBU2bDa2nmiEM9o/3q5ucGsrYd
 j52ci0RGny0ZFfv+ahuv23E/vDzOL+pnrWdRcsWVzsstlbUfbHjKnDO02PvF45h9QabVMfu7
 ppp0++iUtJ0v9URz0Wf0dTecTx7102bbAufGXlk3G1Bp67C039z63mmZ6829iaFBksLbk3/m
 h1zs0+zxNeSlyraTygNfhnGqu+bSHwKapd0ecXr/QA6/UL1wzDdpeP516eDAG+8XVj4zQe3+
 /Im75MaY1NG9j40Fj+dsMemkBBcjf2E7ruLk/wBQLHN7SAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xu7p9JjPTDW6cF7A4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CXcbf5M2vB3xmMFVc3KTYwvirvYuTkkBAwkbhweCVjFyMXh5DAUkaJzUcX
 MkMkZCSudb9kgbCFJf5c62KDKHrFKPHu83awBJuAkcSD5fNZQWwRgcUsEnv3VYIUMQu8ZZS4
 PnMjWJGwgLfE4w9vwKayCKhKLHp9jB3E5hWwl5h+eTsrxAZ5if0Hz4LVcAo4SGz6uwKsVwio
 5tHbGWwQ9YISJ2c+AYszA9U3b53NPIFRYBaS1CwkqQWMTKsYRVJLi3PTc4uN9IoTc4tL89L1
 kvNzNzECE8y2Yz+37GBc+eqj3iFGJg7GQ4wSHMxKIryx52akC/GmJFZWpRblxxeV5qQWH2I0
 Bbp7IrOUaHI+MMXllcQbmhmYGpqYWRqYWpoZK4nzsl05nyYkkJ5YkpqdmlqQWgTTx8TBKdXA
 FBNRxbPLtOC6xfH8d0bqZ/hlX9yemCt5rb9lcmC0zaeeMyzTpz4pfyxufdkiT/b8Xe/ZblEb
 XNky7F6clresfnJPblmagBjf7d3t0hUSQd/XXH6x4FP94gB11fm8ZYvMxN+u7JO97elq2i/x
 /pfD9Z0dz9XZJ2R+WVMa8XGbltz3tEmLrufOmd2uZNs8pTmsOaT9am/ZOlW5X/73c7KUhab1
 7YrhYXqWZOHhc6Sc5aKFoP8Ono2du3IUX7LEuTx/Irvz5d+b626t/3E93Sn6+sONcn97LLPv
 ddW6XV009WDUlMBPp1p0FZWyD9peVfIPmcsYs6/lUcL5DA69QqNSrae8s1KLDlty35S4+j9O
 iaU4I9FQi7moOBEARPFKA7kDAAA=
X-CMS-MailID: 20250128194830eucas1p134d566631b5622c85d843f5d811c3c00
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194830eucas1p134d566631b5622c85d843f5d811c3c00
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194830eucas1p134d566631b5622c85d843f5d811c3c00
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194830eucas1p134d566631b5622c85d843f5d811c3c00@eucas1p1.samsung.com>
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
 drivers/firmware/thead,th1520-aon.c           | 268 ++++++++++++++++++
 .../linux/firmware/thead/thead,th1520-aon.h   | 197 +++++++++++++
 5 files changed, 477 insertions(+)
 create mode 100644 drivers/firmware/thead,th1520-aon.c
 create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 002eaae363aa..9a98b52fffdc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20346,10 +20346,12 @@ F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
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
index 71d8b26c4103..4d84288cc290 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -212,6 +212,15 @@ config SYSFB_SIMPLEFB
 
 	  If unsure, say Y.
 
+config TH1520_AON_PROTOCOL
+	tristate "Always-On firmware protocol"
+	depends on ARCH_THEAD || COMPILE_TEST
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
index 000000000000..fc2fe32c8a54
--- /dev/null
+++ b/drivers/firmware/thead,th1520-aon.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Alibaba Group Holding Limited.
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ */
+
+#include <linux/firmware/thead/thead,th1520-aon.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#define MAX_RX_TIMEOUT (msecs_to_jiffies(3000))
+#define MAX_TX_TIMEOUT 500
+
+struct th1520_aon_chan {
+	struct platform_device *pd;
+	struct mbox_chan *ch;
+	struct th1520_aon_rpc_ack_common ack_msg;
+	struct mbox_client cl;
+	struct completion done;
+
+	/* make sure only one RPC is performed at a time */
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
+/**
+ * th1520_aon_call_rpc() - Send an RPC request to the TH1520 AON subsystem
+ * @aon_chan: Pointer to the AON channel structure
+ * @msg: Pointer to the message (RPC payload) that will be sent
+ *
+ * This function sends an RPC message to the TH1520 AON subsystem via mailbox.
+ * It takes the provided @msg buffer, formats it with version and service flags,
+ * then blocks until the RPC completes or times out. The completion is signaled
+ * by the `aon_chan->done` completion, which is waited upon for a duration
+ * defined by `MAX_RX_TIMEOUT`.
+ *
+ * Return:
+ * * 0 on success
+ * * -ETIMEDOUT if the RPC call times out
+ * * A negative error code if the mailbox send fails or if AON responds with
+ *   a non-zero error code (converted via th1520_aon_to_linux_errno()).
+ */
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
+/**
+ * th1520_aon_power_update() - Change power state of a resource via TH1520 AON
+ * @aon_chan: Pointer to the AON channel structure
+ * @rsrc: Resource ID whose power state needs to be updated
+ * @power_on: Boolean indicating whether the resource should be powered on (true)
+ *            or powered off (false)
+ *
+ * This function requests the TH1520 AON subsystem to set the power mode of the
+ * given resource (@rsrc) to either on or off. It constructs the message in
+ * `struct th1520_aon_msg_req_set_resource_power_mode` and then invokes
+ * th1520_aon_call_rpc() to make the request. If the AON call fails, an error
+ * message is logged along with the specific return code.
+ *
+ * Return:
+ * * 0 on success
+ * * A negative error code in case of failures (propagated from
+ *   th1520_aon_call_rpc()).
+ */
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
+	struct platform_device_info pdevinfo = {
+		.name = "th1520-pd",
+		.id = PLATFORM_DEVID_AUTO,
+		.parent = dev,
+	};
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
+	if (IS_ERR(aon_chan->ch))
+		return dev_err_probe(dev, PTR_ERR(aon_chan->ch),
+				     "Failed to request aon mbox chan\n");
+
+	mutex_init(&aon_chan->transaction_lock);
+	init_completion(&aon_chan->done);
+
+	platform_set_drvdata(pdev, aon_chan);
+
+	aon_chan->pd = platform_device_register_full(&pdevinfo);
+	ret = PTR_ERR_OR_ZERO(aon_chan->pd);
+	if (ret) {
+		dev_err(dev, "Failed to register child device 'th1520-pd': %d\n", ret);
+		goto free_mbox_chan;
+	}
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		goto unregister_pd;
+
+	return 0;
+
+unregister_pd:
+	platform_device_unregister(aon_chan->pd);
+free_mbox_chan:
+	mbox_free_channel(aon_chan->ch);
+
+	return ret;
+}
+
+static void th1520_aon_remove(struct platform_device *pdev)
+{
+	struct th1520_aon_chan *aon_chan = platform_get_drvdata(pdev);
+
+	platform_device_unregister(aon_chan->pd);
+	mbox_free_channel(aon_chan->ch);
+}
+
+static const struct of_device_id th1520_aon_match[] = {
+	{ .compatible = "thead,th1520-aon" },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, th1520_aon_match);
+
+static struct platform_driver th1520_aon_driver = {
+	.driver = {
+		.name = "th1520-aon",
+		.of_match_table = th1520_aon_match,
+	},
+	.probe = th1520_aon_probe,
+	.remove = th1520_aon_remove,
+};
+module_platform_driver(th1520_aon_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("T-HEAD TH1520 Always-On firmware driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/thead/thead,th1520-aon.h b/include/linux/firmware/thead/thead,th1520-aon.h
new file mode 100644
index 000000000000..c7272599ea08
--- /dev/null
+++ b/include/linux/firmware/thead/thead,th1520-aon.h
@@ -0,0 +1,197 @@
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
+/*
+ * Defines for AON power islands
+ */
+#define TH1520_AON_AUDIO_PD 0
+#define TH1520_AON_VDEC_PD 1
+#define TH1520_AON_NPU_PD 2
+#define TH1520_AON_VENC_PD 3
+#define TH1520_AON_GPU_PD 4
+#define TH1520_AON_DSP0_PD 5
+#define TH1520_AON_DSP1_PD 6
+
+int th1520_aon_call_rpc(struct th1520_aon_chan *aon_chan, void *msg);
+int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
+			    bool power_on);
+
+#endif /* _THEAD_AON_H */
-- 
2.34.1

