Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF58017B8
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648B210E985;
	Fri,  1 Dec 2023 23:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011009.outbound.protection.outlook.com [52.101.47.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2911D10E98D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWT4waEo1UjYw0WyNaUiRszgsm4GWvItIuHKrN6FXSKRHVSIdMSRbLd6jUlUeNmgzWO44jFFSeloerFByBcSVCKnH6jUr+eiWvG4LTthFrn78XYmo5NY3ZX2c5749yo0FXA+lIosQfQAtfzyGVePTccl6r1O25GH/4N2F5xhuu/n8iQeywk/OfqnqL+HYWnff4mAnlQCsyd54kMu/nRT0rtSfHezCl0qPS1bOoyqS6ezf2Rg+5A2CwrZ7HL2K82yBhMssqEf2sftSF/PO13eXf/miT5C8lqRn0an2yihBCJlQ0nDsZpuT/nj3oFsbiBFfOph4g9i9s1KT7YcOb/Shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdkUc/pA38ALpvd6mjLBu7dvMz+DWcEcW0kh5so235U=;
 b=lHAwuohqYBf3Lik3Lak/C0hzWwPxKVH4A5ALumWGuq9Kyvc6CQJlmUJbjxCVYxbVwQl5ujFE21asGBl7217DcpfCqnbvpn46hOYUs1LHGPIJY4MGRdK6fBGhLy6apKhbLLwBufnvOsc6GcwssJjam0LxkCqo60vHOXbwnXgw6KVkLvBVlMPmqzF5ZhbPcE87KgM+7Q4Gp7iTqP9rf40bRxLOlv/FBl/M7CsXmo7t5Y2pF6YX36x7beaInNoaiSzZFfUwCuO+KsNugSL2VO+r+nHlj7AGKcPcNsK9W0oV6ErGFG9keYH9yzU3MUwnzjwtvDGk49S7DfED8yZYuYPc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdkUc/pA38ALpvd6mjLBu7dvMz+DWcEcW0kh5so235U=;
 b=NxWwv+eEJPjlLCXmPcdf5yms49xrIWKONSsjhcONnY7mdLUybIHo0dA19B/hfMSuAxeMYJSVHwlaL3ts5anUpzf/WcPPto02meegq3jsX7SGAm5COdpq/MeOHacx7Panz9nU37SGxvTbAWHA59KZTgkTB7bt76O6ihaelYET8yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by SJ0PR05MB7787.namprd05.prod.outlook.com (2603:10b6:a03:2e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 23:25:10 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.021; Fri, 1 Dec 2023
 23:25:10 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 hpa@zytor.com, dave.hansen@linux.intel.co, bp@alien8.d, mingo@redhat.com,
 tglx@linutronix.de
Subject: [PATCH v2 4/6] input/vmmouse: Use vmware_hypercall API
Date: Fri,  1 Dec 2023 15:24:50 -0800
Message-Id: <20231201232452.220355-5-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201232452.220355-1-amakhalov@vmware.com>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a03:505::17) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|SJ0PR05MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 0775764e-2b44-4a7f-a5da-08dbf2c4c2b2
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtFwd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WaAYWmy8i6J66vkWjYSc6hVwgeRZJSSPwfvv390LaxFDd8kEdPwzaDaRrO0XVewReOM6n9bfp67AxgfXh+iKp9DVPVDDcboKmnGBtzNJ6J0A7I4cfO85htnmGIsjRmHOKkr6Ju1C7iB9c86kx0STTUPU9MzlKje5EW0OZ/5jDgf1ouUgP2LIN3a79XqU91EL4jjnZxcSQyxG3p/RPLsJeuWTX/IChI+IxofXq2ipZNChQq0b6Zz4xf68QLl7kQMrgY8YPhq5ayz/TKfak3WggUN3OsZrMvwPra1RFAgsJnq7qi3PBOt4GJGfT/xzUPWRuK/sk0no4c+0lb5EsDJMW0GNQFVq+Qa53sfd+zU68jcTu6SYAh/NIkTYXWG03pPeGIsLfSBCvPbOy+twwphWv//HgLTcTuTxyu051g+U62QtiF3XF4pKD/BE95y6R6qy4N9y929rcnhdJETOzKvwqELr69WNr2noYhSNDHXHIG+WDw5C5iqvsJQv0phlGuKeMy8iDnoiHPgTYPzpnMKmcOh38pEUqb2RXIphjNP8xn0xNXPjt2gmLKvWJyOjfIlBFWQrPsOG/3OLW170OuXl4p1esQcsbyKdsNLZYToj/WHPvI3hWpp2wdsFPQbjZZKjPUpR0dIqmpNteYKN6SYHEcYt5YEGkilP3qwsvcDbzZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR05MB3648.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(36756003)(8936002)(316002)(66556008)(66946007)(66476007)(8676002)(4326008)(478600001)(6486002)(41300700001)(2906002)(7416002)(86362001)(5660300002)(38350700005)(38100700002)(2616005)(26005)(1076003)(6666004)(6506007)(52116002)(83380400001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6EjP0s4EDY6jygLYOoM4tL6MANKAiNK2Xlu2SCwJdzttU5E9ndwtwyxVKKtu?=
 =?us-ascii?Q?zSww+SK1qiprvXK1lKc0d3obOpPppiYJwsS+JKC4vHAa7f9i7Lqc99M+hj/D?=
 =?us-ascii?Q?HX+2UBMoLdgflYb9oRb+Rk5olDdzUQ/1Qb3n8dtSHXxj2aEeRy2b1SXsG1Cr?=
 =?us-ascii?Q?b/d+e10i+u5mjtn/g8pRNvUv340VQwZsDO7IYXfTQrEeVawBCn481il3XcIB?=
 =?us-ascii?Q?cRw0r0lvDjo2wNrZDRZp21Y8AgxpcW+uGXV7QgqcTzPtNEM/6WLqAeQep9N6?=
 =?us-ascii?Q?CUp3HngDER0FW7nhkCZa5wZ9t6sYxNo7Xc8gUSFncPKDH0xVO8oOYYz9fzcb?=
 =?us-ascii?Q?eZXqiI6Dzhp0FH194Ly5LkR3G0r8YKk59m0agy3AwQP+Iwc/iQe0j5y3xq7i?=
 =?us-ascii?Q?/lQ3KxBsj3D7SAgWstPu/2PGZUESS5TBMEpJJ2O9V/T1SU4ziziK5aWMs9KG?=
 =?us-ascii?Q?WnQmYDhuPEcD+k/LkvJmh7pumecOVKZvhua8AunJa+OnuKCaLQYAxohvwtAv?=
 =?us-ascii?Q?NQsXWjZG2iLNQvcLkJtrRfc8uRf91A7urIApdL5hok+oNwN7FhQz69/8Tqug?=
 =?us-ascii?Q?MrDGiMHxjF7WbZRY6+1F58yygl6JiC/3ZFwYRRiJrItfuCZLBMWPFMQ2zvfa?=
 =?us-ascii?Q?OYFWhB31YOeZq8vSNqpB7ab9C9YWHAvX3knBIW/XR5nMfMidlfiSPsZNodQb?=
 =?us-ascii?Q?X99z0n3bEriFXPl8mxaBMKr1ojfRpCwFMb56deK8drhAZLUxUp8P6Z240klc?=
 =?us-ascii?Q?W4JMOExpbxcNIlirsiuKysvmNc1ifok3dHDA8csVjmIavKvtw3tLrwGiVVt2?=
 =?us-ascii?Q?yUCM6WnfGQCagym9KPg+6gHHkt71g/8Ze4tnUtXu5itDnal5yEri41splovV?=
 =?us-ascii?Q?1cdlwYzdv5OP36TrUYo8XnMGjX7iDvUVIzjplRRgmGqobnQRxy+XtjTg3U5k?=
 =?us-ascii?Q?jgjD9/2nmuv2CMdqpFWdEa/ZRF64aEEnthE3SL6mhQwcS4cHOHNr+bkYqwfO?=
 =?us-ascii?Q?3NltEKtcugIs9a2gx1ILEfkVV4WccfVa47/wHH3nOozsYR/LhRMb+5wFfYy/?=
 =?us-ascii?Q?8rEw1uEh6p94/lw3i7fi7JOwkz1IgGscphAXrC73lcIV8H+mUnpzJlzcgR/z?=
 =?us-ascii?Q?AwrsSmVMrgQVSjI1UoNYJ9F5KftwMSGrm4qcPulJxQzszzBlutxqsJLqPmQC?=
 =?us-ascii?Q?+Mzb0txra8ZbCa2HNpKioZtUaAVkEbydVqNIYXjZGqHEI2qI8reSUK1k68Fq?=
 =?us-ascii?Q?BRZXDvx9OqQrS1w4HOk7/k3+RDKL/VRQgtVFq9SDwYuGNCIyYFVFtY7qq80M?=
 =?us-ascii?Q?wnCo2UbfR6b9PXDmSjP3Y8ZKAR72pOTyozbxzKyNtrxINJKa/hCICcf4i4Bu?=
 =?us-ascii?Q?CfDv7+p3xWR2gq8ZTbyYsXlUd1WkZUM1u+aGgBFQXy8HjNklNpMhpZdzrZfg?=
 =?us-ascii?Q?zbBkNphRZokBpaZlHRYxiWw1xYwQt3974E+xTARv/5AE2us4zsPH5oiSf6O2?=
 =?us-ascii?Q?9i4jHKmhikWjUvYHeTrfq0yP4Ex2KrVAj2Xlp37VqjpJYqNty7Z7Nr30sT8x?=
 =?us-ascii?Q?49WS0okwXPoDUzbnaThJ4f7VleOV0B7BSqmQNhPB?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0775764e-2b44-4a7f-a5da-08dbf2c4c2b2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:25:10.0449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi0Kv7qN5arCsQjnoY6eF1mfdjTMRJSTR3lNY6ps4WBUi3IKibVVr+kUF/zYoLNalTxebTvpOzoWk7GyX6g0mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7787
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
 zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

