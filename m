Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A681FAA6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 20:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C9E10E151;
	Thu, 28 Dec 2023 19:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85ABC10E14E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 19:24:47 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-204520717b3so3587528fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 11:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1703791486; x=1704396286;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9Dbt4U/NHONJYOO6LtAo8Oo/fKCNSARoDTA1T7Tz4I=;
 b=HLF39n336/eoHEjVQ46bRMiuV3/1Mefjo9tuqxP7jEm88c5LCd3xIRpcWcmKvsre3H
 wJnGWpI9M2oajsUmnSp6ae7mT571XOE/PUysnzM4MCJuW7URu7o/2jAJxbAPEPI/e46Z
 9wMvG9yjyDFRR+h1ooS92BwHmMlzHkum2ouf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703791486; x=1704396286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O9Dbt4U/NHONJYOO6LtAo8Oo/fKCNSARoDTA1T7Tz4I=;
 b=NsUxLMDJfrZjNBd5HtTPmOBrIoVm1bivL4M6ViBID6tswtromUksIsMVJagGzxekzd
 EFdFNAXe0g4iBq23PPPvNV4ZJTVgkp4ZkOtc4wMCL9YNTTWQB/TQMQoQSjR7UGzpA2gT
 RclZ1JYLFPDAr3j1oXmT0OpRjQtOsbeMwAagvlUUsqDtSprZ4a2GsKpT1k1FvL4/zzff
 cfz5wJAkz/9V0dNoth2C1N0HnOa29IFFGGgSqaazbM4PV4ELxyyuyu1rpO6nCwvRrdY6
 nquUIBB8k5FRAEuoGRF47p1qvlIHVM9U8wdsaADDTgk7sGaD+SoSE6X5vEw+E1vfI2Q4
 FBEQ==
X-Gm-Message-State: AOJu0YxrjWU//GMa5XIlx2mgW3YsoRUkH6raF/hNAUnlCciuInockGh4
 ZGoJQpvbHvQWQdySH2OmIYUOLEc+SNZx
X-Google-Smtp-Source: AGHT+IEyiPNcl5z5luSHPiGHE5v6RVHVW9COlCEH5wbF5bqgi/3/klaqqZzSZZ5U52Xt0jfGA2FzYQ==
X-Received: by 2002:a05:6870:14d1:b0:203:e9cc:486e with SMTP id
 l17-20020a05687014d100b00203e9cc486emr12157827oab.107.1703791486664; 
 Thu, 28 Dec 2023 11:24:46 -0800 (PST)
Received: from amakhalov-build-vm.eng.vmware.com ([128.177.82.146])
 by smtp.gmail.com with ESMTPSA id
 k16-20020aa79990000000b006d9aa04574csm9522987pfh.52.2023.12.28.11.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 11:24:46 -0800 (PST)
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, bp@alien8.de,
 hpa@zytor.com, dave.hansen@linux.intel.com, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v4 4/6] input/vmmouse: Use VMware hypercall API
Date: Thu, 28 Dec 2023 11:24:19 -0800
Message-Id: <20231228192421.29894-5-alexey.makhalov@broadcom.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231228192421.29894-1-alexey.makhalov@broadcom.com>
References: <20231228192421.29894-1-alexey.makhalov@broadcom.com>
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
Cc: dmitry.torokhov@gmail.com, tzimmermann@suse.de, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 dri-devel@lists.freedesktop.org, horms@kernel.org, akaher@vmware.com,
 timothym@vmware.com, linux-graphics-maintainer@vmware.com, mripard@kernel.org,
 jsipek@vmware.com, linux-input@vger.kernel.org, namit@vmware.com,
 kirill.shutemov@linux.intel.com, airlied@gmail.com, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexey Makhalov <amakhalov@vmware.com>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/vmmouse.c | 76 ++++++++++-------------------------
 1 file changed, 22 insertions(+), 54 deletions(-)

diff --git a/drivers/input/mouse/vmmouse.c b/drivers/input/mouse/vmmouse.c
index ea9eff7c8099..fb1d986a6895 100644
--- a/drivers/input/mouse/vmmouse.c
+++ b/drivers/input/mouse/vmmouse.c
@@ -21,19 +21,16 @@
 #include "psmouse.h"
 #include "vmmouse.h"
 
-#define VMMOUSE_PROTO_MAGIC			0x564D5868U
-
 /*
  * Main commands supported by the vmmouse hypervisor port.
  */
-#define VMMOUSE_PROTO_CMD_GETVERSION		10
-#define VMMOUSE_PROTO_CMD_ABSPOINTER_DATA	39
-#define VMMOUSE_PROTO_CMD_ABSPOINTER_STATUS	40
-#define VMMOUSE_PROTO_CMD_ABSPOINTER_COMMAND	41
-#define VMMOUSE_PROTO_CMD_ABSPOINTER_RESTRICT   86
+#define VMWARE_CMD_ABSPOINTER_DATA	39
+#define VMWARE_CMD_ABSPOINTER_STATUS	40
+#define VMWARE_CMD_ABSPOINTER_COMMAND	41
+#define VMWARE_CMD_ABSPOINTER_RESTRICT	86
 
 /*
- * Subcommands for VMMOUSE_PROTO_CMD_ABSPOINTER_COMMAND
+ * Subcommands for VMWARE_CMD_ABSPOINTER_COMMAND
  */
 #define VMMOUSE_CMD_ENABLE			0x45414552U
 #define VMMOUSE_CMD_DISABLE			0x000000f5U
@@ -76,28 +73,6 @@ struct vmmouse_data {
 	char dev_name[128];
 };
 
-/*
- * Hypervisor-specific bi-directional communication channel
- * implementing the vmmouse protocol. Should never execute on
- * bare metal hardware.
- */
-#define VMMOUSE_CMD(cmd, in1, out1, out2, out3, out4)	\
-({							\
-	unsigned long __dummy1, __dummy2;		\
-	__asm__ __volatile__ (VMWARE_HYPERCALL :	\
-		"=a"(out1),				\
-		"=b"(out2),				\
-		"=c"(out3),				\
-		"=d"(out4),				\
-		"=S"(__dummy1),				\
-		"=D"(__dummy2) :			\
-		"a"(VMMOUSE_PROTO_MAGIC),		\
-		"b"(in1),				\
-		"c"(VMMOUSE_PROTO_CMD_##cmd),		\
-		"d"(0) :			        \
-		"memory");		                \
-})
-
 /**
  * vmmouse_report_button - report button state on the correct input device
  *
@@ -145,14 +120,12 @@ static psmouse_ret_t vmmouse_report_events(struct psmouse *psmouse)
 	struct input_dev *abs_dev = priv->abs_dev;
 	struct input_dev *pref_dev;
 	u32 status, x, y, z;
-	u32 dummy1, dummy2, dummy3;
 	unsigned int queue_length;
 	unsigned int count = 255;
 
 	while (count--) {
 		/* See if we have motion data. */
-		VMMOUSE_CMD(ABSPOINTER_STATUS, 0,
-			    status, dummy1, dummy2, dummy3);
+		status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 		if ((status & VMMOUSE_ERROR) == VMMOUSE_ERROR) {
 			psmouse_err(psmouse, "failed to fetch status data\n");
 			/*
@@ -172,7 +145,8 @@ static psmouse_ret_t vmmouse_report_events(struct psmouse *psmouse)
 		}
 
 		/* Now get it */
-		VMMOUSE_CMD(ABSPOINTER_DATA, 4, status, x, y, z);
+		status = vmware_hypercall4(VMWARE_CMD_ABSPOINTER_DATA, 4,
+					   &x, &y, &z);
 
 		/*
 		 * And report what we've got. Prefer to report button
@@ -247,14 +221,10 @@ static psmouse_ret_t vmmouse_process_byte(struct psmouse *psmouse)
 static void vmmouse_disable(struct psmouse *psmouse)
 {
 	u32 status;
-	u32 dummy1, dummy2, dummy3, dummy4;
-
-	VMMOUSE_CMD(ABSPOINTER_COMMAND, VMMOUSE_CMD_DISABLE,
-		    dummy1, dummy2, dummy3, dummy4);
 
-	VMMOUSE_CMD(ABSPOINTER_STATUS, 0,
-		    status, dummy1, dummy2, dummy3);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND, VMMOUSE_CMD_DISABLE);
 
+	status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 	if ((status & VMMOUSE_ERROR) != VMMOUSE_ERROR)
 		psmouse_warn(psmouse, "failed to disable vmmouse device\n");
 }
@@ -271,26 +241,24 @@ static void vmmouse_disable(struct psmouse *psmouse)
 static int vmmouse_enable(struct psmouse *psmouse)
 {
 	u32 status, version;
-	u32 dummy1, dummy2, dummy3, dummy4;
 
 	/*
 	 * Try enabling the device. If successful, we should be able to
 	 * read valid version ID back from it.
 	 */
-	VMMOUSE_CMD(ABSPOINTER_COMMAND, VMMOUSE_CMD_ENABLE,
-		    dummy1, dummy2, dummy3, dummy4);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND, VMMOUSE_CMD_ENABLE);
 
 	/*
 	 * See if version ID can be retrieved.
 	 */
-	VMMOUSE_CMD(ABSPOINTER_STATUS, 0, status, dummy1, dummy2, dummy3);
+	status = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_STATUS, 0);
 	if ((status & 0x0000ffff) == 0) {
 		psmouse_dbg(psmouse, "empty flags - assuming no device\n");
 		return -ENXIO;
 	}
 
-	VMMOUSE_CMD(ABSPOINTER_DATA, 1 /* single item */,
-		    version, dummy1, dummy2, dummy3);
+	version = vmware_hypercall1(VMWARE_CMD_ABSPOINTER_DATA,
+				    1 /* single item */);
 	if (version != VMMOUSE_VERSION_ID) {
 		psmouse_dbg(psmouse, "Unexpected version value: %u vs %u\n",
 			    (unsigned) version, VMMOUSE_VERSION_ID);
@@ -301,11 +269,11 @@ static int vmmouse_enable(struct psmouse *psmouse)
 	/*
 	 * Restrict ioport access, if possible.
 	 */
-	VMMOUSE_CMD(ABSPOINTER_RESTRICT, VMMOUSE_RESTRICT_CPL0,
-		    dummy1, dummy2, dummy3, dummy4);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_RESTRICT,
+			  VMMOUSE_RESTRICT_CPL0);
 
-	VMMOUSE_CMD(ABSPOINTER_COMMAND, VMMOUSE_CMD_REQUEST_ABSOLUTE,
-		    dummy1, dummy2, dummy3, dummy4);
+	vmware_hypercall1(VMWARE_CMD_ABSPOINTER_COMMAND,
+			  VMMOUSE_CMD_REQUEST_ABSOLUTE);
 
 	return 0;
 }
@@ -342,7 +310,7 @@ static bool vmmouse_check_hypervisor(void)
  */
 int vmmouse_detect(struct psmouse *psmouse, bool set_properties)
 {
-	u32 response, version, dummy1, dummy2;
+	u32 response, version, type;
 
 	if (!vmmouse_check_hypervisor()) {
 		psmouse_dbg(psmouse,
@@ -351,9 +319,9 @@ int vmmouse_detect(struct psmouse *psmouse, bool set_properties)
 	}
 
 	/* Check if the device is present */
-	response = ~VMMOUSE_PROTO_MAGIC;
-	VMMOUSE_CMD(GETVERSION, 0, version, response, dummy1, dummy2);
-	if (response != VMMOUSE_PROTO_MAGIC || version == 0xffffffffU)
+	response = ~VMWARE_HYPERVISOR_MAGIC;
+	version = vmware_hypercall3(VMWARE_CMD_GETVERSION, 0, &response, &type);
+	if (response != VMWARE_HYPERVISOR_MAGIC || version == 0xffffffffU)
 		return -ENXIO;
 
 	if (set_properties) {
-- 
2.39.0

