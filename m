Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA77A1713D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1561310E45C;
	Mon, 20 Jan 2025 17:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Td2TCgD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2B210E45B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:26 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172125euoutp01c1f4513371f810044ffde648dee1bb9a~cdloiF2jH2431924319euoutp01I
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250120172125euoutp01c1f4513371f810044ffde648dee1bb9a~cdloiF2jH2431924319euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393685;
 bh=sd08BWohXem3dBVuHX3dCJ58apCrb9/s0z26DVgq2O8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Td2TCgD/Zq8kxf/98vIBsGiwXE+sO5Dd59JV1aImZZZWCYU1DCtTcLwtNElpy79xd
 KJXu3yAwzQ0UYgwwpK/4ISV9wvF5HH6MsfoAnWtbMcf6vXeCrVrLEvu9xsHaFNdTFq
 laRUVucmMRQGwqKO95ZdRxhfRklMd935VfJgYkVY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20250120172125eucas1p28c3c0a3da0fa486b827be5e76b2c6aea~cdln2KwWH3179431794eucas1p2S;
 Mon, 20 Jan 2025 17:21:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id DF.56.20397.4168E876; Mon, 20
 Jan 2025 17:21:24 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29~cdlnW93ux1089910899eucas1p2r;
 Mon, 20 Jan 2025 17:21:24 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172124eusmtrp234fa8332a1f78f797bda0b78dede1c28~cdlnWM6hV0490804908eusmtrp2h;
 Mon, 20 Jan 2025 17:21:24 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-46-678e86148686
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 58.95.19654.4168E876; Mon, 20
 Jan 2025 17:21:24 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172123eusmtip1c95c0bf6f2ec1cb55a478acbb133f612~cdlmGpqQq1013910139eusmtip1W;
 Mon, 20 Jan 2025 17:21:23 +0000 (GMT)
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
Subject: [RFC v3 04/18] firmware: thead: Add AON firmware protocol driver
Date: Mon, 20 Jan 2025 18:20:57 +0100
Message-Id: <20250120172111.3492708-5-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120172111.3492708-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH+T7Pw/NsO6cPk45vlHHg2W9RjJOvByQFdg9HlxZ3eHp1NONx
 EDC8TQzLBI6f0mSGkDHUAXEySEJwLOBkKxibCiybMjmDoYjWCBtzMpQMYj1U/vf6fD7vz+f9
 fd99ebhISwby0qT7WZlUnBFCCgid6ZFlvX9xuWTjGX0Euni9HkMdf6oodLbHgiG10eKL7FYt
 hq7NOkn03Z0rFPqtJ59ANs0pChWYWknkUNlJ5FLYfdHV7pMkch81AqRzF5KoxThGodZZNYbq
 XB0EaujsBqj4yBlf9PPlbWjMfpFAjqsKHBWrVqHFC50UWrC1EajmDwOFtNNf+iJzy05UaKgk
 Yp5jnCNFFDPtcBBMX+kDiunx1BJMl2qMYhRdg4Bpbz5CMqO2CyRz+tK7zPgXZow535DLFLaY
 MEb510bGqR8mmXJtM2CsBdepHaLdgqgUNiPtACvb8PqHgtQbxjpq39QJkFPfd43IA48OlAEe
 D9LhsLkksAzweSJaA2B5TXoZECzxAwBNiz/gXOEGcKxWRXhV3oUCdQnFDRoBfGyYJrj1aQDb
 Z3K9TNKb4M1Gta9X5E8XEbCoPx94C5z+FUDd5EnSq1pNx8OB7y9jXibodfD0RCHlZSG9FdYZ
 7CRnFwQNPw7hXubTMXBuuGdZ4wcvVU/+44wvaQo6anBO3yaAV0YyuWxx8L7jVa69Gk6ZtRTH
 z8LFLjXGcRa82XF/efUQ7FKYlzkSjlrmSe8ZnH4JtnZv4NpvwLaKaZK7vhKO3PPjHrASVuhO
 4FxbCEuLRZz6eVilOPqfqUWjWzZl4EjlLHkMBKueiKJ6Iorqf99agDeDADZbnilh5a9J2U9C
 5eJMebZUEvpRVmY7WPrYAwvm2U6gmXKF9gKMB3oB5OEh/sKnZhQSkTBFfPBTVpaVLMvOYOW9
 4BkeERIgrDcUSUS0RLyfTWfZfazs3ynG4wfmYQnUCzGSgYGy22V7wtY+nbTOWVO5V+qzsCpm
 +2i11dpPOA3RlZ+vyd285Zv0YAu/q6K/wZUQu2sQ3rpz1/lKKH9zTZjLGb1rSH5er5yYL9rz
 baPPcWn5lrfOJYbejYyMLf8gfi721Jt73w7Ly8nZ6YHuHSJTonj+eF9UbPzwYVfszIqzAUEH
 Bw8t7A68J3hH8svDpu1RK/y+MqfeduqHPouIK9VtO+yTEiRp//3GuHFOlsxvjGAF4dat8S8m
 VFV/LY22VXzsGE9M0r6/JjwaOKfO5U6891BpsnncVe5NqG59yU9K4VxyvicxWFPKKtP0Qk2A
 dNLDxDVV1t2aT2KbHlvXhhDyVHHYy7hMLv4b7pGbZkcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsVy+t/xu7oibX3pBqubJSxOXF/EZLH19yx2
 izV7zzFZzD9yjtXi3qUtTBZXvr5ns1j39AK7xYu9jSwW11bMZbdoPraezeLlrHtsFh977rFa
 XN41h83ic+8RRottn1vYLNYeuctusf7rfCaLhR+3slgs2bGL0aKtcxmrxcVTrhZ3751gsXh5
 uYfZom0Wv8X/PTvYLf5d28hiMfvdfnaLLW8mslocXxtu0bJ/CouDnMf7G63sHm9evmTxONzx
 hd1j77cFLB47Z91l9+jZeYbRY9OqTjaPO9f2sHnMOxnocb/7OJPH5iX1Hi1rjzF59P818Hi/
 7yqbR9+WVYwel5qvswcIRenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZ
 pKTmZJalFunbJehl3DqykL3g1XTGikWHr7A0MP4s62Lk5JAQMJFont/O3sXIxSEksJRRYl/z
 MnaIhIzEte6XLBC2sMSfa11sEEWvGCV2b53ICJJgEzCSeLB8PiuILSKwmEVi775KkCJmgbeM
 EtdnbgTrFhbwlDi9/RQTiM0ioCox71EL2AZeAXuJhfvvsUFskJfYf/AsM4jNKeAg8f3qXrAa
 IaCaO1e7GSHqBSVOznwCNpMZqL5562zmCYwCs5CkZiFJLWBkWsUoklpanJueW2ykV5yYW1ya
 l66XnJ+7iRGYYrYd+7llB+PKVx/1DjEycTAeYpTgYFYS4RX90JMuxJuSWFmVWpQfX1Sak1p8
 iNEU6O6JzFKiyfnAJJdXEm9oZmBqaGJmaWBqaWasJM7LduV8mpBAemJJanZqakFqEUwfEwen
 VAPT5pfGB0S0Vxz3Kj668cMT+Q17Ja/POLvA89/yqV59HqLRCZ1bbq3azzN5qdWul9usVhWI
 GgYxMu35kLdGwDOb/V/x0qOLc2+++Oh00m/VtgNvLxYeE0s6N6Vn0kzFtbMtL+axSD7T0e09
 a2QcIclr+W7yddv/hgwltREL7uaxFT9sz68V3nMtce/jSeFhGyJqLFeqnmibGya/8cbm0783
 nt56KEeo6bawCf+s2+fe/V6i8i9PocPmxG7eX0mlHW5W02YvXbH5wt+aOE2O7aETf171DZ8k
 XBHq8vdwFJ9EiPKfeXslYtk6bVbWiOh+Pf3Z6J/OtXQH+UflU+/J6BhyqcdOqlOZ+0B3nsnH
 xzlnipRYijMSDbWYi4oTATGGHlm6AwAA
X-CMS-MailID: 20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172124eucas1p233b3f6da39e7064db62b02a66bc1ac29@eucas1p2.samsung.com>
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
 drivers/firmware/thead,th1520-aon.c           | 271 ++++++++++++++++++
 .../linux/firmware/thead/thead,th1520-aon.h   | 186 ++++++++++++
 5 files changed, 469 insertions(+)
 create mode 100644 drivers/firmware/thead,th1520-aon.c
 create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c56a1fb6e02a..c96a1e6c8831 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20191,11 +20191,13 @@ F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
+F:	drivers/firmware/thead,th1520-aon.c
 F:	drivers/mailbox/mailbox-th1520.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
 F:	drivers/pinctrl/pinctrl-th1520.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 F:	include/dt-bindings/firmware/thead,th1520-aon.h
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
index 000000000000..32d159f46ebb
--- /dev/null
+++ b/drivers/firmware/thead,th1520-aon.c
@@ -0,0 +1,271 @@
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
+#include <dt-bindings/firmware/thead,th1520-aon.h>
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
+	if (IS_ERR(aon_chan->ch)) {
+		ret = PTR_ERR(aon_chan->ch);
+		return dev_err_probe(dev, ret, "Failed to request aon mbox chan\n");
+	}
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

