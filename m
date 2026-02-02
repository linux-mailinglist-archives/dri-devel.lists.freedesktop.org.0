Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHx5OVMWgWlsEAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:25:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D581D1A5D
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD7410E3D6;
	Mon,  2 Feb 2026 21:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mD5Gxyua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012036.outbound.protection.outlook.com
 [40.93.195.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18AE10E3D6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 21:25:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTyAZxqjsIQ/TPKTtfA29XhPsqZPi7DCzEFwnw5ioE+VqbMT/H5W6dLyrYlgI53tdg39HW3nsnhM4x3qZR5+4UUBB27jhws76TzXsGjUA2mTKM347qqtXbHOG+yCPiOFx0N7cBun4adVq3ER4hzAWrcHaDX1n6xwiP8OyHy0TKYIJTD0dAuKH/YS6TXM98CF2bmh0wa+PVYzXwO+v8FjUuxcHu+Ls9YegUt8upkKxfUhSz6APcAxKTdRzJXT5gO2NpKdeW2zbBFW0yWKSAjMBk3itjiNyvsvutzlvYYS9YOA4pCYdhYtiL/D0CT/mnpFw85udjxyc4OusJ61cFrkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nE26tOWp1dNLoVxT7/JvrMO4n3mp9QYimUqaqhoyte4=;
 b=hCK5YMmnlYkdgGZ2MwwF6mY5OclYCAYouW7ZGtmxbaQLBxu0QASJM5Mb+rKRJV1C61lHFj0oab4m/+MmG8OTdjpiFr8rFVSTweTn56fOYBWkzXIT0nv8+ZwRzvu2tmMFxz/EwMeqatDJU7vhPXGwqSJ9fQAOhreYT4Nr9cKRVxLWJaY2EZGD3U/P6qoWP/wUqEhSLPt6bsqDXCuNYW2iN5PkGI+zgfYpuTL4RKCPZY4pu19DN+Jb9VUSID+rYLu3Tc73CyUKUm/28nMx1e2msSO+VOKqa8/gNrCDevPJvh8HwudrYfjK8Zw0BZiEWHNLDd8u2C01t5D+/RGoL2oP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nE26tOWp1dNLoVxT7/JvrMO4n3mp9QYimUqaqhoyte4=;
 b=mD5GxyuawBCmLeTWSxeiqepmt4njIeRdWJLTc9gY5SSznkv3qh/KOt9X15Cyh9IeFwAKEaUNhyUhWdImt1BQ7U1No0pqRwejfNI4R3e2+9n3oWmuUh4n3PUNDKkU7lssL0QidjnNBWJ1drq8AhQ3953X6X1Yk7gqCbjFKH/Z4w0=
Received: from BN9P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::8)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Mon, 2 Feb
 2026 21:25:31 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::44) by BN9P223CA0003.outlook.office365.com
 (2603:10b6:408:10b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 21:25:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 21:25:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Feb
 2026 15:25:30 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Feb 2026 13:25:29 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Replace platform name strings
Date: Mon, 2 Feb 2026 13:25:29 -0800
Message-ID: <20260202212529.2681307-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a03049d-cce6-43ea-993d-08de62a19830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mPOsRtvaPk8cN3UajzRaOTKFFrVDOBHMQ6ZA8Tkvyu3QbstdvoRQx+0JLfYs?=
 =?us-ascii?Q?ysBAPojKivWQnpIdgJh/hG8dmSClfCVGAWeSb7y4AOJceBHkx+WfBp1xwY22?=
 =?us-ascii?Q?GIahbbVyFrBqO10v7L6IJwLbm2E7ZGWhpuYM0zdyTV1rEcZ+5+gwWaGJ6Yl+?=
 =?us-ascii?Q?3F/IAYnxA2Ft6e9lvpfN+l+7fU6owDuvLrCIGqbGA1hkaNS/opEOipq1Nt7l?=
 =?us-ascii?Q?BZeCsLI95gjeFyVj56afkOSTsllJY/GQHItwHKLQV9FxVDCqYTt/rcb7mY+G?=
 =?us-ascii?Q?e7KUc7bo/PlzHcWyEFlbOiG/2IlUdIp1OnQfVnUC47RlP9sqZIhB97Rzgim6?=
 =?us-ascii?Q?Dd5B4Izy3zhv2pIkXpTDmFJNd3iIjCUJFqaRJXoezab6OTdK/cEsxVN6QC9d?=
 =?us-ascii?Q?+h/6HFvczL8gAx7pOPvwUeu3KpnJcArY9jJM5G+fQQVgz1IJ/sd5VjAx9J3f?=
 =?us-ascii?Q?0M/A1divjwrT0FemHW0ECfAjdPznbgF9Dv4tCU5u+2wZ5U7IFLDmoqlkj4YP?=
 =?us-ascii?Q?4DUaKjl5PvtAYcdgXZ8pg0TUqCEtWOsbfJp2Ec9MKFn+FGlPbhcncsw03/yM?=
 =?us-ascii?Q?WH7y6PXQ+0GRybSkVlQyKcM/SYPXVfkSUGkQbCcxgwS2vp/pW9EcHKwMiVbn?=
 =?us-ascii?Q?Gsy3beamAyXmeejqFqpUf61aI0ZpUUpROQK6WWKQ0eMNc320sVfRsKtmP2uz?=
 =?us-ascii?Q?u8YPxjqlXGyhsE9aKcFlTLtmh/6byXvcYueI7YQP1CP3V+TEyi86TfxlZY/R?=
 =?us-ascii?Q?QXriH4yINNKdeVWiUnSSd/FbmZKn6PQEd0xyZkHgSuBwkDroN2X7kO9OsIh1?=
 =?us-ascii?Q?wzTch8nHcY/Q8q27GwS7SUlxApnMMebErqDTJVQIbLJrzD3UudZ835hYZC+B?=
 =?us-ascii?Q?drctfLM2L+VXew2VQF4JGzjV0id1L1/HCt98OdcdLRhVo0zvpCWB2JXAHm3y?=
 =?us-ascii?Q?FC2Af6UKi8kPPLsbL/fBqdmUfbsW1iHRxIBcPAXKVs+pd6oO5pLukFUvXwYQ?=
 =?us-ascii?Q?CfsquGpTnDqEfGvpzWRSx0r8fMETzO6eSwtihoIWkIOtpvMy+kZcfqi4EiHm?=
 =?us-ascii?Q?lgaMN7Ev982Jqh0fzoLL0Uyq2MOTVHZruGMwKH9uV6b6tc68WgbgnVkJuqcK?=
 =?us-ascii?Q?uwhyNg4tb8OIK+YczR61warGaBFEAPVDTauThk5q0hvwfZGNw68EXHu9hUoC?=
 =?us-ascii?Q?MhSA6RB6gH/jBG1jhaBQmgX/TYcjrCgAkgowY04m5EZ4JyD8jHaQxyjM/BAk?=
 =?us-ascii?Q?bPnPy/rBKhaMEa26sTSQyqOsF40q4Ig/xxKQW+WKpeqnFLzz6iIozTmUF1wO?=
 =?us-ascii?Q?A0sWEyB56FNUcVk1pi2z99JciJKrO+X4m2t5ndGR1AyoaDs4ok/yExkF3Uus?=
 =?us-ascii?Q?VCWaV94h/sIP+daGIExAQTPeTAlNjyqaK0gyj2UoT3dlJsn7vGogaRWhKkGz?=
 =?us-ascii?Q?kQPz2Qdcz3APPyGyl1wvK8x5mVKuXrSKYCh2PunzJLggsNw8rhlDUfGRUeCY?=
 =?us-ascii?Q?anzZKQfafazNykiMDI6Xffg5YJgk4lVA/vxw6I4jUwzdFEznP9oD9SU5OAON?=
 =?us-ascii?Q?Ds/XrdvJQCo+nA2Bpd5LgIRbUkibuGCIp5jLjeXs4NahpVjoOaeAD5EHNzYJ?=
 =?us-ascii?Q?f21O8ih2DTQS98TgF47INChX61kaxoPoak1P73aMFV6K8/UNXYbkDU9ITAVV?=
 =?us-ascii?Q?YpIsuw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xluJ6E65Tw8tL+GZydXkZaE6tESxwgkXiVkFHFd1UVGrcpF+4lRGeLcYSa8/D/str6zalcimukFUgM/z1+2sIsgfn8H9neZOKbOL7rBDfsLb/ezxj12otevgDCU3MGlKFf97uIGNIL1M+0IfhZWLr3merivV96wd0bg1Wmhnqavvnmt+tnjpN5ihXKRhaEl9CIntulvgzrsdydZF2Oce2G2zny6YdU8PB7IoSQNiSXj0Vf51OXJvO8lFyAiun7RAHUsNGDHxlcWD3PrYVSAmx/KtdhjOoo8HCISvAV8XXRJDfPjIoLslsxtrcQI1UywVj0L5Bn5kLxtaAfLZSXdwwjJEvzHI7MM2Mvfpxst8k8WEcjpLGVTt2YwtQaoD8jHZAnxXqbABGVVEUk+xGU6eBvHKjwOMw/UCnU517XO654/60lWWOYnvlOUSB01zFEcC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:25:31.5329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a03049d-cce6-43ea-993d-08de62a19830
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D581D1A5D
X-Rspamd-Action: no action

Update platform name strings to be more accurate and user-friendly.

Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/npu1_regs.c | 2 +-
 drivers/accel/amdxdna/npu4_regs.c | 2 +-
 drivers/accel/amdxdna/npu5_regs.c | 2 +-
 drivers/accel/amdxdna/npu6_regs.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index 6f36a27b5a02..cee42c49cbb6 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -117,7 +117,7 @@ const struct amdxdna_dev_info dev_npu1_info = {
 	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
 	.dev_mem_base      = AIE2_DEVM_BASE,
 	.dev_mem_size      = AIE2_DEVM_SIZE,
-	.vbnv              = "RyzenAI-npu1",
+	.vbnv              = "NPU Phoenix",
 	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
 	.dev_priv          = &npu1_dev_priv,
 	.ops               = &aie2_ops,
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index 3fc0420e8e3e..ed0382925b59 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -144,7 +144,7 @@ const struct amdxdna_dev_info dev_npu4_info = {
 	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
 	.dev_mem_base      = AIE2_DEVM_BASE,
 	.dev_mem_size      = AIE2_DEVM_SIZE,
-	.vbnv              = "RyzenAI-npu4",
+	.vbnv              = "NPU Strix",
 	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
 	.dev_priv          = &npu4_dev_priv,
 	.ops               = &aie2_ops, /* NPU4 can share NPU1's callback */
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index c0a35cfd886c..8427e9f2b4ec 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -108,7 +108,7 @@ const struct amdxdna_dev_info dev_npu5_info = {
 	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
 	.dev_mem_base      = AIE2_DEVM_BASE,
 	.dev_mem_size      = AIE2_DEVM_SIZE,
-	.vbnv              = "RyzenAI-npu5",
+	.vbnv              = "NPU Strix Halo",
 	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
 	.dev_priv          = &npu5_dev_priv,
 	.ops               = &aie2_ops,
diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
index 1fb07df99186..a960149b5408 100644
--- a/drivers/accel/amdxdna/npu6_regs.c
+++ b/drivers/accel/amdxdna/npu6_regs.c
@@ -109,7 +109,7 @@ const struct amdxdna_dev_info dev_npu6_info = {
 	.dev_mem_buf_shift = 15, /* 32 KiB aligned */
 	.dev_mem_base      = AIE2_DEVM_BASE,
 	.dev_mem_size      = AIE2_DEVM_SIZE,
-	.vbnv              = "RyzenAI-npu6",
+	.vbnv              = "NPU Krackan",
 	.device_type       = AMDXDNA_DEV_TYPE_KMQ,
 	.dev_priv          = &npu6_dev_priv,
 	.ops               = &aie2_ops,
-- 
2.34.1

