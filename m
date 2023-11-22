Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B867F549F
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 00:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597F10E031;
	Wed, 22 Nov 2023 23:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM4PR02CU002.outbound.protection.outlook.com
 (mail-centralusazon11013023.outbound.protection.outlook.com [52.101.64.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEB710E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:31:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVZ0vQqParvXxufMv2p5vI1i/CigrCMnK9UCbX05H+C77GBqSMb9Yu1M93MjjxAwMJxptCTH7ZRkqJJOv1ZXhz/3kf/04sBM1omeswyJFOuv4usLzZksrvS2gFE0xhxvC+vnVQiclGT+BreBkEV0HEaAg5bW0H9TWGx7Yi1yb77tkOJ73dVCSwzROZx/6fhXTzJK7DbuKGso4mM6QLVaMXwwu3mTOa/kISyuSp1dCygxn2DUxJFRsMT6z6E28/r0n9ta6E3XMmSguq1FCTzgb5B0i+kREKUccPcG+b4RtEIBlDlQJ4v/8Qi3H+ZULFKDgoHYZETMi4xI7mdEqTl+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVWzCjlcVgTSrRlWhpddvTqNCqboahtiFGaNpLw//j0=;
 b=GOS53qFzi4GltArs0mKjFTF2O94IU4N5q3nFdJawYL97CWbGcUkf4tYc1DQaiKwbHAN6lwd8EWv4pqfQRDfKpxhigWk+aER0VWgSWcVJrNRgh89XEkRLsnpvJcWpMVVHxxIaM+GrQ0bzZpRlVYvPuKGBC6Acgxz9NlXnucXFQeRA1EuCrPZBWXYEV2t6RFjdVoiP9fSseJrpdkIVHIg7n6WG1sSzReoCuQ/HYMps79fEbZkLYzxTk0Bh4hiPAOwBtSiuKh9YXM6R6cRIYQ061Oq3qve6TcmDMzEy6bb1peuK4HiTvh8C1zDqil3F6PFnsDiSB0DE4zIeMtl3sZXOoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVWzCjlcVgTSrRlWhpddvTqNCqboahtiFGaNpLw//j0=;
 b=0LLr2YvqtbLahFSU0skpEeCHxfSPffx5zedMgBTu315h582gl6x0Bk9mZfi5QrA5wIm4WJVmNh1aG+6yTEywIkn0D2dRN31b7Jq9wlYXhsieH89dPX4jHwmyt0Wc5xDIT4VUKVEzA+/44Txn6CRJ/vVuPpEKH8TGyg7VMYb2yiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by BY3PR05MB8275.namprd05.prod.outlook.com (2603:10b6:a03:3b6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 23:31:27 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 23:31:27 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, x86@kernel.org, dave.hansen@linux.intel.co, bp@alien8.d,
 mingo@redhat.com, tglx@linutronix.de, zackr@vmware.com,
 timothym@vmware.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 4/6] input/vmmouse: Use vmware_hypercall API
Date: Wed, 22 Nov 2023 15:30:56 -0800
Message-Id: <20231122233058.185601-12-amakhalov@vmware.com>
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
X-MS-Office365-Filtering-Correlation-Id: 594dd15b-e672-42e8-2cb3-08dbebb325fa
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wZ6xRnEpUlhn5BgJPTsKmDrLRAUQuAIcg2HN8vR+KrBk91n8oS6vYfo+0AJZl++lyMQeNfh/5S7uRRnK/tY/FYvjPvj9p5aISU5ShCXE3bWSwlkCQzUulmMwhnH4H+cC95L6+IQsps6bvT8ZyJWAMvK6GA0hevp8fV+qpfo6p+uNg83ZeopheoS/DAt5V5VMg3bbUySYwQdzm7d/Ev4ksZ5BFnZBkYROOem5TWjDD6tkaKUuYYmwNgLnFIHoqwxSAG02FeKUXU8rLBMml98m/fsHNHnFwRlI6UZiRVoXkLg927FebiK82JSKGLVtA1pKhJk88XAfliK5SR0GahNU/tJ9QftUNCkOAcI6vKrQVGaZj3NfThOIyWzutBwYH9R3IXPp5jo3FeJfAasr1/bncJoqYC09JdZ99MgegGnlHzHslmwzfByHTBCHFz77ba2vtf3PkIxALn6rDs/RR4p4P0URbIcS8Jkm79XhwCUc+9tfkYsEelGiecK1bWv2zHAYdcZVmYxCvfDravmrkwPtiJ6DwRPDBsfmezXDVM11JVQPpD9oT97nZwgwF4T0xubfwdbYxo9vpfFJqEkTW+GNneXEnt9mv/7RwSJ7JWrSDhU1PYZody1iby3XIscIkb8+zt+GrEa+9oVYsvvzz9oOdznkt7wF00S/A3QmEguwaIZD/1B4zd+GwzU78bR6Xun
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6486002)(4326008)(8676002)(8936002)(5660300002)(7416002)(2616005)(107886003)(478600001)(83380400001)(38350700005)(6666004)(2906002)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(52116002)(26005)(36756003)(86362001)(921008)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0S+mrVJ0i49ImXAe8p9qussIAB++YZLKQ79lqx89NOS79rgyIpBnjrsJmLvN?=
 =?us-ascii?Q?Utr1o6Kr6Yia7WSSQaDLVF68R6ffhKi74s9uYP8OETGudn6AOvvTu03S4DES?=
 =?us-ascii?Q?p/qch+vWvMwZIW6uxIrlEZGjBshQ8oApwzUMPpxviKwTqDsWw3u4Ak29AqyT?=
 =?us-ascii?Q?VN0Q2GG6Hgf3nYgZoqBjClasNbVlM87r5IKynn4Q0Pmz4OGK9KiFiYvhkQvd?=
 =?us-ascii?Q?sgO7BmNEyRi1o4zgAmNyCUdfXoOHv+U+RJmKKWc36YJH651IPLieZDsr76iF?=
 =?us-ascii?Q?SXf/cMAZ/vHiWR04sNVCB06DHe/6ambhsEUiFvycVDFG0w0DRbkgz2Lkn+bB?=
 =?us-ascii?Q?3RcF2q5atlgl4CgLUTp3NbKx0Eo+cXg0oAF0Of1wVRlSWYV5wH6CormtW52r?=
 =?us-ascii?Q?VvFQOIxuPljFUxZ3NJTLmBuSmoEUG7mupeFsWtmfsFAp/WQF9BkMD2ctLp5R?=
 =?us-ascii?Q?uFlYrwE2cBc9d01Q1ebIgsxOX1tUCwQ5AD5V1dwgOTBK1nLdpWbcaOrQ2YKV?=
 =?us-ascii?Q?yrDQXM5r9D+2wdo+H3qfKuRAosj2Fv2maILqhLCUc/Gz3I+1yVh6vXDCr0V7?=
 =?us-ascii?Q?mNYfl9Zu2WetZ+oZTGc+7l30Ex6W4PgL1m4oLk8joFuLnos5sXCvXkJrXHUo?=
 =?us-ascii?Q?zRgmildjgo0OSqqRwVLJK+1Q0SDEBStdZIRGnCQ/wUhifgn4J8sx/qOk+t4O?=
 =?us-ascii?Q?9sGGy3pqpRHuHkkgWgWgSCw3+nzcCxO4Gs7YN0ebkoKpdXx1WTzwBq1pOZlz?=
 =?us-ascii?Q?Um2zKSgNha9oMb7UDiyROUAkmc+D9Yf3BO4FhPGsj25Pz3fyb55j2cbGATD9?=
 =?us-ascii?Q?hnkMtcMnxZPfk5yC9t7sasRTjPcDZac4c1zvpDpvoVVjr22pPpIrlN2XI5g6?=
 =?us-ascii?Q?22RweScT8VxNvIO0lxeloQgP6UQcXzdF9i2RkSO4+27MXlDMKhk4rOMIQ3bF?=
 =?us-ascii?Q?s6p1A8LirNYQdVFVXC8zkfZH52LQ+DY3G1Rd9CL8ZtaDvbCYNrjl31CfHKM0?=
 =?us-ascii?Q?uEiZTv5SzPH5aXOK/xCJRDtPJLjjvdkf4Dt1hLuDMoqTtFBFz1YDpR7ND0Ou?=
 =?us-ascii?Q?5BOdEJxoeIysyHWwRw6cgSZ9tdRpYfx3x7Bawy+j1W1GF8I8g+Wg8luXfmhl?=
 =?us-ascii?Q?FtjWA38ZH03Opl8p69PyDiV3538Cw7UdHLOelfVtx8olkZPATIgTTefOJW58?=
 =?us-ascii?Q?C35ikp0JETvo9WNp3ZE4xkRwKBLJojCPYHzNijE+OV29Ixkh439W8mqvZpFr?=
 =?us-ascii?Q?3ZOYiebCYTBqEqpnT4rsgftKSAsaIALeZSUdtgYAO3cEf9Hs/XxGAzL8S9f9?=
 =?us-ascii?Q?NdAt6SCYentcj3v+trz8KijXlEyMhnxvPAGF0MWjBf08KRUHnBPteq70Xnj1?=
 =?us-ascii?Q?+ht5bpcM3ZVfTM80nbiONPY6JcXEq6lVy9XF93YfVhxuEfvkGJw+i04pNX3I?=
 =?us-ascii?Q?ktb1GtVVvGLTSnjJbO6tko+a9DWhqs5Qg8OrWcDkJa7elsUiD8DUm1PjNAr7?=
 =?us-ascii?Q?c0wYyA8j4KFidz2Xz5/KOQoNCrGjnURgHID5s6JUZtfPPgIx5guEVOO7XKid?=
 =?us-ascii?Q?E99WXWzYFzAUm04Fvz4oUexX1v+x2sib1EmEMsn4?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594dd15b-e672-42e8-2cb3-08dbebb325fa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 23:31:27.4901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wgDIOT8gOoFitVMRcoRRpfdXOgK3dxOLokB6QQ9wCn2jmw3b/BznecyTeozRG6vy78voyYgaVmqMcZh6XLScQ==
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

