Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B47F54A1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E278D10E6B1;
	Wed, 22 Nov 2023 23:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013010.outbound.protection.outlook.com [52.101.64.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C798F10E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeGsIFpIHwj3qhdn5d+klHvUqQS4llm8mbZyPMala9uHNpdnxP9IDyF6X7U5mXLK+Zkl0QymSLrg6WSltbaE+KF95B/lnMI62s29ltGxCm3TQvDPgmly8Nl6hLwV4s3TT3tRSmxtCmykycf5r1Oxil9U/uwaDqDucbYAo3hJkQGt7+iRZ+6UvloNSW6LGgAxn+FRPSWD2hTk8eRsBE34KxlwexKMXlyh9SF3gktiY9PMRn12sPx+qjO+cnf9Hjh9Q7LY3g5MiTCCB0qZ8BWIT2ss2ieNSEP1oBnynZ55Z7xHd8Zu4LUwQbN7AAZof/auTap6NDvdhfp+CC9I9506WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVWzCjlcVgTSrRlWhpddvTqNCqboahtiFGaNpLw//j0=;
 b=D7o/yGOfOopaajjudNI+QFCHhFzWJqlfP449hOM+aGfKHAqOfEVbqV8QNO4V/sBFzAJ5GoeJA47PBvMKLftPktQ3z/ozpqDaiMxDFWOMRGNZ9YpoOKH8MKPvf6s7beiJ31hLNk45o5lsp0f1eZdqFt3+EH9YXNPSb8WkTldq6uOfi0N661oyXNhwGs40jWqhvGja07vYERuLTSxVqZ+C2jPUUO55MWc3XS7pw9bdfPB8x8bEu+0YTrz6sRA0DvfT9Sq1KPBHXZH1Vgh7fMzd8qc667wxXEOPngmZf/gGLHR5rsSadqGs4GTts9NpMupCGFU3QFk5/d2sU2m6tbp9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVWzCjlcVgTSrRlWhpddvTqNCqboahtiFGaNpLw//j0=;
 b=lkvKa23KmkmgrtV+ruIozbDQvkt7mf/q24mGVYf3HxKzQND/sVL8Y6KgNtl3E70zf08j77ilLoUlrbO/dhKEH/hz7j6Pxypvhf6vmSfixPDIn8T3uzAdD0CNLBFVrCRBWZAYJ1F4D+K5a2DCb4riqpuETesMOq9pcrucbgrGueE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:19 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:19 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Date: Wed, 22 Nov 2023 15:30:49 -0800
Message-Id: <20231122233058.185601-5-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122233058.185601-1-amakhalov@vmware.com>
References: <20231122233058.185601-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:74::16) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|BY3PR05MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ede83a-c3b1-47c3-b55a-08dbebb32130
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYmivN7UaTLQ4tHYozn9HKP4SXYLqb/dUtxEsCBq8p/IH0sYjuMj/mbNNJ/ttPTwlFz4Q9Y1PrG9Y9VXWTxPqLiOCFmvjcExcz1YTcbXFAOQ+OrXWbKnyTbHi4Mc4pIR++VOpDZx9GKhiQOVYXQLSuYr1stLe5udgqUNft55tlKPC/+UAAi+LWQ6++fWqRcVDxWy6xu5tSOogG/Vq76xYOwJ96xfI4CRYGE3dFdvfq0TXSJJ3gmK0BHQlE284uj193K0XSOD8ZITd2jop/PNP3FQraFUbwbXt7guSpxlUT+xaTQOon4qRaY1BhA81mi1jSRjthdDj0TI+xMCFQEu97xLKPfDQdloEow8FHGdGSuLsu0/6QGUFus4g80d8Ja66YfuyyOGuHXwUrK0CAihpgy+5LWY7KEaVDk3l9xGQuMThMoZFhwFYK23y8cjEFSC5cHxm5CWZlhPz6AetW4MJTX8pso6mAoX0Nn2pb8ASvfyOMyK7PqTHCZnO3U0lHYfST/H5HbSNrb1gRtc3/kOkNcF4GXLnMEIKV1gouoP34jmsCd5yo6QMpOwG8k+NO/czq6HDUsWKRumATAKt7KcgkEWm0MU+2BkuEELerrK2mhvq5k+0uoWXXUUkYcsZHmOm8ahx+rF7K38MnVMpSuMpjdAZEHw51wqda/X1rPk7R0cGvXUIM9MHaGVOgZjNFVO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQugOxds/UQP5hj90hUe4u0OUREVYEv/08osMjXUPXVi1maxiYR04S1VCbHn?=
 =?us-ascii?Q?4dsRVELurBiG0DeQmV3SJYNjzIoBzvYfBgSwTJ3UY733nIITLhkL6He1HnFu?=
 =?us-ascii?Q?fn957CeqmMn/VGbRm0oKKVrVUenXei50082fFkkp7vx5Xkx6K1x/+6f1EnMg?=
 =?us-ascii?Q?c7zPxOBeg76DqOQM0xn4eIs7nWfqhXbRqaquCLdLrhRspK3vjX4LslT6Ml+T?=
 =?us-ascii?Q?QLMUgQZI4A5wbdAgMQ9a9004iNnB3BglDiRjqR5qiyvUPNEQQbmV2yumdv+6?=
 =?us-ascii?Q?0cZ9SM1iqg7tpcUh+LN7MadGsykELZZt+Dsu55mIBEluoQfL0J0iKeD1zuzz?=
 =?us-ascii?Q?02EoaQ99iMBNLamWBSS9pUgRCP5Sdh0zY0Ie54SAZNaxWvX4Li9Zyc70+GTm?=
 =?us-ascii?Q?spftTMI58Weca6lhHHSMuuDaOx51d59ooe8zjdh89CqhzsM4/sh854G6rjI5?=
 =?us-ascii?Q?Z4BkyW/5fuKI16IOtNtweEqLtHwMuMW2OSyIQvTrloC0khaIaS+PjYF4o/UG?=
 =?us-ascii?Q?SQFS4Z6IJwtZKq6iIePuXRA3V7WDqmHk8jga5EXD9F19VYn9UUAudIpD7mCe?=
 =?us-ascii?Q?FS0kt9yscvHpLrXZFzGMVqtKkDdOmQRMBcvSBf8rFg6ge0QA+XUTZl52nHZH?=
 =?us-ascii?Q?jn7Sfm7a8JGlmi55+RvdvnLI25H3+sTjST77/GIlV1Lk/SAGA+Qe/XLHKvvQ?=
 =?us-ascii?Q?OIjH1YxMm1Wd6nW8KM8nv4no/RvOe0RbrKCQ8AA6njjPH4hFpQPCKbyC79zy?=
 =?us-ascii?Q?+AvgXzNTJ9gqrTK2/yVt3DLS1K+g9M9kRvdzn8nEwfi0S4Eyi29FLsIqBHnn?=
 =?us-ascii?Q?doQIHftoOPa+JKYxonbjm/utJQwFb9xPnoXtIYBnJazWtAeyf5kPxlmViCDE?=
 =?us-ascii?Q?1iezpnaIj7nA3bS/LXv2+bLEqcRkedytY2+IPnl9A2yhKezV7Puturry9Sao?=
 =?us-ascii?Q?/hbt8VZ6DOkWUIzFxzXMX9iHC5S6nsqpyIrV/xSU79sp7Bs3Aj8sT/7Lmm7r?=
 =?us-ascii?Q?o4vmL7Je/bIu/1ONHaEkMxKjvr7+q5Dw14Koxw2XrBQ4tvETAUrG4WRqdkWU?=
 =?us-ascii?Q?7YLHH16JWF9a/N1lQ4EcgAb/0zIVsTR1JOhcsTao8qSDGtoye15l/OSoT6Jz?=
 =?us-ascii?Q?OYI1YnMdNDmR/DPmJVFYdpmmTqS/z8cGVqWkPrJGbChAEaPazlWW5ysgWI6L?=
 =?us-ascii?Q?zS496HwvR+4HTcuW1fj04NYAVNusxkiPB2P/pqHIhgl1HLQyxQjGNqp8jngo?=
 =?us-ascii?Q?p1Ty6EZGf1vMrN0HjEOcr+5hG2JBV1sCeFcVJYn3ABwfS6NepAMB8WgRPTj8?=
 =?us-ascii?Q?ycBF3+FpgXVTODhmmWRsU4VOcoJ0OKz2OU+36eiTB/ZlYl8m71oqNAM9YolH?=
 =?us-ascii?Q?7duA0AHOoSA+ikl6PDqtdpZoXsZ5g8vr02JaXHT5R8tX+m7R1vCuPta43CGK?=
 =?us-ascii?Q?6m7gx+VyJ8hXgCjSb/lEzVfA6ESgliCqSsO9ltoRp5BoyNWoIaqKtaRIkHa9?=
 =?us-ascii?Q?fNIqciS/aOsuEqoXtXtdNc5Fn92Hnofb5e35drnt6dSHa9DmHvmVD8+ZdKIJ?=
 =?us-ascii?Q?KXI/9ocXzPeqPU86xYxaXCpWBU7K53zBHR8Oc3gZ?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ede83a-c3b1-47c3-b55a-08dbebb32130
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:19.5216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SicE/8Et9vMT6oqshLK//05lzvGPv1e80iadQYOCHzF7AoBT9KYTpRMA1wSvQEwnTbk2pD8HAtmeEZ4WTNc+Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR05MB8275
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
Cc: Alexey Makhalov <amakhalov@vmware.com>, pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, dmitry.torokhov@gmail.com,
 akaher@vmware.com, linux-graphics-maintainer@vmware.com, jsipek@vmware.com,
 linux-input@vger.kernel.org, namit@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch from VMWARE_HYPERCALL macro to vmware_hypercall API.
Eliminate arch specific code. No functional changes intended.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
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

