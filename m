Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B435B851F54
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF44E10E2D5;
	Mon, 12 Feb 2024 21:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QrzKp8j+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAF210E2D5;
 Mon, 12 Feb 2024 21:16:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/RsIhq0xyj+X2iSlzFN3Ya3rzx7Aooab94Q8happTGwW6Ar78v/iWEzb1VW/+reGdRiR17Zlrt+aUXp3onkUK16AtfPBbN6vrp4qP7hZ6VOdnUvn6M3GkUhvAY6A6Z31iuzQd7f0EfcTRfqrkE4nstFNM3Oa8KOwDtDdxpiYP/uRV1ymZtMfkyK5IhLrV5qXMl/P948kkPvuTbJGsHz5DZbk+e2R3kCbI5riBWQsryMX9r8FeaHgDEbpbxQ1iPTAAWK13+Mga5/TRxo1akCDi8pSctCNhDonQobUVlE/SRvrWIHPI99zaC2ZFHI5p7fm1WV9nyyR66xJfzoleIxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HMVINJIFZxsk8w+gQacoD1pTxiK4mrj+tEVKeJ3W5A=;
 b=UiwnPoT8npwJPEiYmsTIxoYdD8h2GVtNLcVLYQVGXGNSTzxc+GMXppkQb9BMARnzY6wLKuTqeTaF5MqizHcmYAxi7jgLVBn7rS9rpswiNpJUsGLsKtknBvg5kA7hWiYyQSyG9VSj1nG1WmqJAC6lfIwmjvwcn8UUEx1O614QPpt8JsjGlC2ZCJmXvDsS4PDraCw+ROErFllKFCpgujkO9J/Tu70FEg8hC6cv7R49b4iyL134LHpTnXooP2qdscR0k1ZlHF+L+90ZXaBGzP0bpm/syiCUy6pkl+vGx8FOLrOnm58yFIkPbTQ0Nw1d/cXqVMgeH8LfoidzAQNB4+u0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HMVINJIFZxsk8w+gQacoD1pTxiK4mrj+tEVKeJ3W5A=;
 b=QrzKp8j+c0jNWXESwtl8W714r6l5WdpeinuDbWQ9Hn5yufsfpMbZMR0FvLti5ekxDXM1A9i7yXdNSjL0yLiX27ihmprc3ctD1EzYsA8OBjmTwM7VaV2V6wAOJhQDnBhKL+Ef4SyW359prdHVbxEmLBuOldFeukRFAl2TlKW/Y4RiYWA1JsbWgS3jH53hagWyhKCHuSVUnNWJWbtzcrcInHFUhtEDF62NSlbA8sOM9ytv85lCblE5Gydw1/7tLeYfdUzgl0WVrwy4LRfRBpLqPig3bsjb+kK16vvasLLyxPGMh6r67FCQ7IkqtTWbVt8idG15oyQ5AuEIfk9gBXabNQ==
Received: from PH8PR07CA0010.namprd07.prod.outlook.com (2603:10b6:510:2cd::22)
 by MW4PR12MB7167.namprd12.prod.outlook.com (2603:10b6:303:225::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.11; Mon, 12 Feb
 2024 21:16:08 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::c) by PH8PR07CA0010.outlook.office365.com
 (2603:10b6:510:2cd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Mon, 12 Feb 2024 21:16:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:16:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 12 Feb
 2024 13:15:54 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 12 Feb
 2024 13:15:54 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 12 Feb 2024 13:15:53 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@redhat.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] [v3] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Date: Mon, 12 Feb 2024 15:15:48 -0600
Message-ID: <20240212211548.1094496-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240212211548.1094496-1-ttabi@nvidia.com>
References: <20240212211548.1094496-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|MW4PR12MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc93b89-a127-41c2-780e-08dc2c0fd4bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/B96MhVlmwnWH1MrAf8woUY3E8oG0rCF0TLEmrTkGcVpBw77xxLIpWcdTnq38XAlJ2PdIeTixPJ2nRDKBpaPgcCtxETX4jtWuYUbuT1OOL1Qxk1L+YJq2UZbiSH4aaPdeprWRgEgZ+nTOnoMkvLVQ9Y7dNpnMfbLT5kavXOuTNcEpPZglPDjJSiaATNtbLxc2K2D1rlWyb/M6QS7Atl1hBVSG1B9WVHRI49BNoUjKUaRb9cIYA5R4rCn/1fW/vNsDoRcCvIfYnjvBI5zVrXqbMvmqcQ+Om0cnxqZySzaf1Q1lZAtAwsXFTB3Mmq7tVNZcfYLWFBD6vs6/1j+la5cXELreq1I2Ezbyj7QW2f55Y/Oy6P06xsnF4HUSt/Bc6aWJTPOerc+cZMmCrj497pqtuZ2mv4C4WVc0K0JE+tJWcVET/GVnQ6SuCtN6i/DnEjG7hGJ10SoEYIIpqWA5EXivjdxINqf0hnVC8yhU0ZKjOQ078s0HhAnc5Bowj6qBp/oU5YYR0USXWJiyXamDwDJJ2xIlwpf7y0AD9JE2WbecbHuEhKMYFsddLWfDspLkjpDFMydK2MWmK6eWwy3T+53PAWw4ZT3hV0aG+uKFAgTNg=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230273577357003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(41300700001)(66899024)(7636003)(30864003)(2906002)(356005)(5660300002)(426003)(8936002)(70206006)(8676002)(316002)(2616005)(70586007)(110136005)(82740400003)(86362001)(83380400001)(478600001)(26005)(1076003)(336012)(6666004)(7696005)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:16:08.3679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc93b89-a127-41c2-780e-08dc2c0fd4bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7167
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

The LOGINIT, LOGINTR, LOGRM, and LOGPMU buffers are circular buffers
that have printf-like logs from GSP-RM and PMU encoded in them.

LOGINIT, LOGINTR, and LOGRM are allocated by Nouveau and their DMA
addresses are passed to GSP-RM during initialization.  The buffers are
required for GSP-RM to initialize properly.

LOGPMU is also allocated by Nouveau, but its contents are updated
when Nouveau receives an NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPC from
GSP-RM.  Nouveau then copies the RPC to the buffer.

The messages are encoded as an array of variable-length structures that
contain the parameters to an NV_PRINTF call.  The format string and
parameter count are stored in a special ELF image that contains only
logging strings.  This image is not currently shipped with the Nvidia
driver.

There are two methods to extract the logs.

OpenRM tries to load the logging ELF, and if present, parses the log
buffers in real time and outputs the strings to the kernel console.

Alternatively, and this is the method used by this patch, the buffers
can be exposed to user space, and a user-space tool (along with the
logging ELF image) can parse the buffer and dump the logs.

This method has the advantage that it allows the buffers to be parsed
even when the logging ELF file is not available to the user.  However,
it has the disadvantage the debubfs entries need to remain until the
driver is unloaded.

The buffers are exposed via debugfs.  The debugfs entries must be
created before GSP-RM is started, to ensure that they are available
during GSP-RM initialization.

If GSP-RM fails to initialize, then Nouveau immediately shuts down
the GSP interface.  This would normally also deallocate the logging
buffers, thereby preventing the user from capturing the debug logs.
To avoid this, the keep-gsp-logging command line parameter can be
specified.  This parmater is marked as *unsafe* (thereby taining the
kernel) because the DMA buffer and debugfs entries are never
deallocated, even if the driver unloads.  This gives the user the
time to capture the logs, but it also means that resources can only
be recovered by a reboot.

An end-user can capture the logs using the following commands:

    cp /sys/kernel/debug/dri/<path>/loginit loginit
    cp /sys/kernel/debug/dri/<path>/logrm logrm
    cp /sys/kernel/debug/dri/<path>/logintr logintr
    cp /sys/kernel/debug/dri/<path>/logpmu logpmu

where <path> is the PCI ID of the GPU (e.g. 0000:65:00.0).  If
keep-gsp-logging is specified, then the <path> is the same but with
-debug appended (e.g. 0000:65:00.0-debug).

Since LOGPMU is not needed for normal GSP-RM operation, it is only
created if debugfs is available.  Otherwise, the
NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
v3: reworked r535_gsp_libos_debugfs_init, rebased for drm-next

 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  12 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 215 +++++++++++++++++-
 2 files changed, 223 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 3fbc57b16a05..2ee44bdf8be7 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -5,6 +5,8 @@
 #include <core/falcon.h>
 #include <core/firmware.h>
 
+#include <linux/debugfs.h>
+
 #define GSP_PAGE_SHIFT 12
 #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
 
@@ -217,6 +219,16 @@ struct nvkm_gsp {
 
 	/* The size of the registry RPC */
 	size_t registry_rpc_size;
+
+	/*
+	 * Logging buffers in debugfs.  The wrapper objects need to remain
+	 * in memory until the dentry is deleted.
+	 */
+	struct debugfs_blob_wrapper blob_init;
+	struct debugfs_blob_wrapper blob_intr;
+	struct debugfs_blob_wrapper blob_rm;
+	struct debugfs_blob_wrapper blob_pmu;
+	struct dentry *debugfs_logging_dir;
 };
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 86b62c7e1229..56209bf81360 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -26,6 +26,7 @@
 #include <subdev/vfn.h>
 #include <engine/fifo/chan.h>
 #include <engine/sec2.h>
+#include <drm/drm_device.h>
 
 #include <nvfw/fw.h>
 
@@ -1979,6 +1980,196 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
 	return 0;
 }
 
+#define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
+
+/**
+ * r535_gsp_msg_libos_print - capture log message from the PMU
+ * @priv: gsp pointer
+ * @fn: function number (ignored)
+ * @repv: pointer to libos print RPC
+ * @repc: message size
+ *
+ * See _kgspRpcUcodeLibosPrint
+ */
+static int r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
+{
+	struct nvkm_gsp *gsp = priv;
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct {
+		u32 ucodeEngDesc;
+		u32 libosPrintBufSize;
+		u8 libosPrintBuf[];
+	} *rpc = repv;
+	unsigned int class = rpc->ucodeEngDesc >> 8;
+
+	nvkm_debug(subdev, "received libos print from class 0x%x for %u bytes\n",
+		   class, rpc->libosPrintBufSize);
+
+	if (class != NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
+		nvkm_warn(subdev,
+			  "received libos print from unknown class 0x%x\n",
+			  class);
+		return -ENOMSG;
+	}
+	if (rpc->libosPrintBufSize > GSP_PAGE_SIZE) {
+		nvkm_error(subdev, "libos print is too large (%u bytes)\n",
+			   rpc->libosPrintBufSize);
+		return -E2BIG;
+
+	}
+	memcpy(gsp->blob_pmu.data, rpc->libosPrintBuf, rpc->libosPrintBufSize);
+
+	return 0;
+}
+
+/*
+ * If GSP-RM load fails, then the GSP nvkm object will be deleted, the
+ * logging debugfs entries will be deleted, and it will not be possible to
+ * debug the load failure.  The keep_gsp_logging parameter tells Nouveau
+ * not to free these resources, even if the driver is unloading.  In this
+ * case, the only recovery is a reboot.
+ */
+static bool keep_gsp_logging;
+module_param_unsafe(keep_gsp_logging, bool, 0444);
+MODULE_PARM_DESC(keep_gsp_logging,
+		 "Do not remove the GSP-RM logging debugfs entries upon exit");
+
+/**
+ * r535_gsp_libos_debugfs_init - create logging debugfs entries
+ * @gsp: gsp pointer
+ *
+ * Create the debugfs entries.  This exposes the log buffers to
+ * userspace so that an external tool can parse it.
+ *
+ * The 'logpmu' contains exception dumps from the PMU. It is written via an
+ * RPC sent from GSP-RM and must be only 4KB.  We create it here because it's
+ * only useful if there is a debugfs entry to expose it.  If we get the PMU
+ * logging RPC and there is no debugfs entry, the RPC is just ignored.
+ *
+ * The blob_init, blob_rm, and blob_pmu objects can't be transient
+ * because debugfs_create_blob doesn't copy them.
+ *
+ * NOTE: OpenRM loads the logging elf image and prints the log messages
+ * in real-time. We may add that capability in the future, but that
+ * requires loading an ELF images that are not distributed with the driver,
+ * and adding the parsing code to Nouveau.
+ *
+ * Ideally, this should be part of nouveau_debugfs_init(), but that function
+ * is called too late.  We really want to create these debugfs entries before
+ * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
+ * there could still be a log to capture.
+ *
+ * If the unsafe command line pararameter 'keep-gsp-logging' is specified,
+ * then the logging buffer and debugfs entries will be retained when the
+ * driver shuts down.  This is necessary to debug initialization failures,
+ * because otherwise the buffers will disappear before the logs can be
+ * captured.
+ */
+static void r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
+{
+	struct dentry *dir_init, *dir_intr, *dir_rm, *dir_pmu;
+	struct dentry *root, *dir;
+	struct device *dev = gsp->subdev.device->dev;
+
+	/*
+	 * Under normal circumstances, we add our debugfs entries to the dentry
+	 * created by the DRM layer when the driver registered.  However, this
+	 * dentry and everything in it is deleted if GSP fails to initialize.
+	 *
+	 * If keep-gsp-logging is specified, then a different top-entry dentry
+	 * is created and that is used.  This dentry is never deleted, even if
+	 * the driver exits.
+	 */
+	if (keep_gsp_logging) {
+		char temp[64];
+
+		/* Find the 'dri' root debugfs entry. Every GPU has a dentry under it */
+		root = debugfs_lookup("dri", NULL);
+		if (IS_ERR(root)) {
+			/* No debugfs, or no root dentry for DRM */
+			return;
+		}
+
+		scnprintf(temp, sizeof(temp), "%s-debug", dev_name(dev));
+		dir = debugfs_create_dir(temp, root);
+		dput(root);
+		if (IS_ERR(dir)) {
+			nvkm_error(&gsp->subdev,
+				"failed to create %s debugfs entry\n", temp);
+			return;
+		}
+
+		gsp->debugfs_logging_dir = dir;
+	} else {
+		/* Each GPU has a subdir based on its device name, so find it */
+		struct drm_device *drm_dev = dev_get_drvdata(dev);
+
+		if (!drm_dev || !drm_dev->debugfs_root) {
+			nvkm_error(&gsp->subdev, "could not find debugfs path\n");
+			return;
+		}
+
+		dir = drm_dev->debugfs_root;
+	}
+
+	gsp->blob_init.data = gsp->loginit.data;
+	gsp->blob_init.size = gsp->loginit.size;
+	gsp->blob_intr.data = gsp->logintr.data;
+	gsp->blob_intr.size = gsp->logintr.size;
+	gsp->blob_rm.data = gsp->logrm.data;
+	gsp->blob_rm.size = gsp->logrm.size;
+
+	/*
+	 * Since the PMU buffer is copied from an RPC, it doesn't need to be
+	 * a DMA buffer.
+	 */
+	gsp->blob_pmu.size = GSP_PAGE_SIZE;
+	gsp->blob_pmu.data = kzalloc(gsp->blob_pmu.size, GFP_KERNEL);
+	if (!gsp->blob_pmu.data)
+		goto error;
+
+	dir_init = debugfs_create_blob("loginit", 0444, dir, &gsp->blob_init);
+	if (IS_ERR(dir_init)) {
+		nvkm_error(&gsp->subdev, "failed to create loginit debugfs entry\n");
+		goto error;
+	}
+
+	dir_intr = debugfs_create_blob("logintr", 0444, dir, &gsp->blob_intr);
+	if (IS_ERR(dir_intr)) {
+		nvkm_error(&gsp->subdev, "failed to create logintr debugfs entry\n");
+		goto error;
+	}
+
+	dir_rm = debugfs_create_blob("logrm", 0444, dir, &gsp->blob_rm);
+	if (IS_ERR(dir_rm)) {
+		nvkm_error(&gsp->subdev, "failed to create logrm debugfs entry\n");
+		goto error;
+	}
+
+	dir_pmu = debugfs_create_blob("logpmu", 0444, dir, &gsp->blob_pmu);
+	if (IS_ERR(dir_pmu)) {
+		nvkm_error(&gsp->subdev, "failed to create logpmu debugfs entry\n");
+		goto error;
+	}
+
+	i_size_write(d_inode(dir_init), gsp->blob_init.size);
+	i_size_write(d_inode(dir_intr), gsp->blob_intr.size);
+	i_size_write(d_inode(dir_rm), gsp->blob_rm.size);
+	i_size_write(d_inode(dir_pmu), gsp->blob_pmu.size);
+
+	r535_gsp_msg_ntfy_add(gsp, 0x0000100C, r535_gsp_msg_libos_print, gsp);
+
+	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
+	return;
+
+error:
+	debugfs_remove(gsp->debugfs_logging_dir);
+	gsp->debugfs_logging_dir = NULL;
+
+	kfree(gsp->blob_pmu.data);
+	gsp->blob_pmu.data = NULL;
+}
+
 static inline u64
 r535_gsp_libos_id8(const char *name)
 {
@@ -2029,7 +2220,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
  * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
  *
  * The physical address map for the log buffer is stored in the buffer
- * itself, starting with offset 1. Offset 0 contains the "put" pointer.
+ * itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+ * Initially, pp is equal to 0.  If the buffer has valid logging data in it,
+ * then pp points to index into the buffer where the next logging entry will
+ * be written.  Therefore, the logging data is valid if:
+ *   1 <= pp < sizeof(buffer)/sizeof(u64)
  *
  * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
  * configured for a larger page size (e.g. 64K pages), we need to give
@@ -2100,6 +2295,9 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
 	args[3].size = gsp->rmargs.size;
 	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
 	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
+
+	r535_gsp_libos_debugfs_init(gsp);
+
 	return 0;
 }
 
@@ -2404,9 +2602,18 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	r535_gsp_dtor_fws(gsp);
 
 	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
-	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
-	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
-	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
+
+	if (keep_gsp_logging && gsp->debugfs_logging_dir)
+		nvkm_warn(&gsp->subdev,
+			"GSP-RM logging buffers retained, reboot required to recover\n");
+	else {
+		kfree(gsp->blob_pmu.data);
+		gsp->blob_pmu.data = NULL;
+
+		nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
+		nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
+		nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
+	}
 }
 
 int
-- 
2.34.1

