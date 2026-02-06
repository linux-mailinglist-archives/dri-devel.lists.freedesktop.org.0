Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD35KRyEhWmqCwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:03:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EBDFA88F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 07:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876D910E35C;
	Fri,  6 Feb 2026 06:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CTN5hbRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B0510E35C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 06:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DebbZ2ain+PW6p5tUai+jHWfwJ+bm1WBPUt6uiTMyEEfPQ/V+hLK6lzMehSPlrB0xXrpRRutvDIBE3CLD+sfUQH3RGBbsjulPonM6zSIMcmf8h7r/1XHCYEvk36Txos5sjypK4N/z1rQX5gmaeIzvYTaNhIOZngEa+IGi3XcttoSP652EktJ2Tr71DdWf00NjLO4e7fDRkpNv7px7iQ8+gtlF6mYjiQpwuJ+0SI4C8doApuOdZ9RQJRIaPYUYUqknI1iM1SiOL6OdouClVImzBGk3WFOKFSidVLgj1K2CL8XxvnKsggOWzhZ8lgWqiMG7KCUKsD2imfJuP1xaRTGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKxMdJi5uiQx2mHMtGf+iGBDFZ6tKhuaP919goj3HPA=;
 b=sRlFVWjeJfOImzvYuKDyZtDPtQoDGGINutKNrEuHKzTgEk0V59ySIjkhlWVn3u179J1VJS/V8eRKsh8Dj/4Ub/yJMw69Wf4+Ip2RCfLeCiV4vXvMXlZlNuKJiJfGe58E7gIWtjeEb8kHvWNp0LBd6FFmAIrPwtoiCaZT3BZ8T/MZTGnPIVoZuJfPfuxqEdMySaaOyTY77ZvRYeBcHqbs8VWER400De0ISvI0HQAmE7qFaEEpUmwUdUQKQ9tEZGQEPICdJUhHEGXt2BBUymjz2md6qDIHRBOKfvsfV8w7z3zxQ5NTLBqX4t8J6qwYpsyIiZFK+azDmXZJTnXx5OZoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKxMdJi5uiQx2mHMtGf+iGBDFZ6tKhuaP919goj3HPA=;
 b=CTN5hbRY5KtPsYrWbVfAUgZO8x/6+BwNTIo09kU5MBwYJRZS2aGUzGwEBLvjyykDmp/wI38qY3sMzTIB0zprDlT+GA/EAlPGAgNL6iCbHJvgKETT5icATfUZQqW5UroCpXAM/VeRasOpqXn0PCKbgj7kKLL7ZmPVX4gLy21bMB8=
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 06:02:58 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::8a) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 06:02:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 06:02:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 00:02:57 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 22:02:57 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Switch to always use chained command
Date: Thu, 5 Feb 2026 22:02:51 -0800
Message-ID: <20260206060251.4050512-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DS0PR12MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c061125-8fe9-46ae-eefe-08de65456082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/i8PjK6yJItTghjwP8a75GjthYVk199+FKc1FAtUiY6Ix/kPgmKOJU7lzzI3?=
 =?us-ascii?Q?A6dQjR8plUXB7VkZA1ZGgPyfAUAb+yMXkl/2SwRnFYreGMhPuHBwylV1smGA?=
 =?us-ascii?Q?8t/9XyFDuG+kSxZmWSo6ThK5SHb8MReb2dlH2dSJBEzCwllWjrV8QMgMNkI2?=
 =?us-ascii?Q?BdJZTNgecbQuSqDUH040uyn4WgtCviBpCPUbDECsBWxH5GZLTO9vxuL6nN8a?=
 =?us-ascii?Q?/7S/He+3AyQIJfIk2y03lYgZpSS84nNh1a5CFuYigfg49E4QS3tukFEESQ72?=
 =?us-ascii?Q?+PLLXphhIqfkJxw+MDeEgyZtJp5dq5btEKeyJwP5JNUt26+c8LKGk+P7OKXb?=
 =?us-ascii?Q?vh5j8AlgmvyYZ5ERotCJZSX4zBaYGxMPdHZOb0pkFdb8Zf2Og5ue3vjpsb6E?=
 =?us-ascii?Q?phbCDaqUba5si6a4I8comzfKxXIU9nBZjREvdInyypLopoRTaX5IBUAH0Nh/?=
 =?us-ascii?Q?Wmh9wXXIr9CgEL1PLjlmQ//cN+rM5S91scm5y+UHaRovqK9sOnvmrKmU3ZUx?=
 =?us-ascii?Q?jCsPX7+qGgoDwL1hBlw9z9UDAkERvTXFYSYOHlgEhp2Kt+fSTfPEGU+kqtal?=
 =?us-ascii?Q?W6KysfEesAyeY1s9Q7HbLcpHzj25v3w3YzOX/mKN3Dxp1Ssw2HKPYuulPs/c?=
 =?us-ascii?Q?yny6sQDtqpIpzhfaktfi5I13QHiAZ6cGqcSbd5PgzBCuDcPb0TI/sHYSFzKn?=
 =?us-ascii?Q?aIH/ygXBC4jZMXGt0HVoMQU57jKgZkoK4hnTA4eZnoclj2m/zQyqzGQDm+AB?=
 =?us-ascii?Q?qinoWwj/bXKqHn+U+Kkf+4QuEzBEyosH5+lMCzcHfl4RJZkaBmbmvd7v8/7D?=
 =?us-ascii?Q?YyOFGsaW54Mjtwk3lSavhtH/rgmD7NY047MYaAiERfKOswetvr8IdyBHedvj?=
 =?us-ascii?Q?g9Gnvp/dsf7FQrpJybDMM7zxn7zKR/ryBKpAyFzbQJ0EAL2KCyYtDYvrmTxF?=
 =?us-ascii?Q?vChr2+HgpleLJNaaDv/tO4iqweO5DSA5XuYb2OWntBOy5lt3E093XkvCi02C?=
 =?us-ascii?Q?beV9RiV72+/XtGyK9Eb3cmVDFcOr7rziGLOvLVH23WK39NodqEKQKdbRq1Xe?=
 =?us-ascii?Q?85t1whGnCOg3xpqwTNWVlrzkHqOOSB3TqAzbyyJ5sbcppHxTBBQYvcvYyaIG?=
 =?us-ascii?Q?PzSvwngTyB/HE3vFgphD4y17HmMmRvnqAB8BVNH6B8uDL9pIp39aIKvPU6tT?=
 =?us-ascii?Q?3pNs3QNrWhio5CJ9tgqqRBmjBJPTZ806w5UQdc/KfCVoX45hHANH9XsvzOSM?=
 =?us-ascii?Q?nnTIgnKFV0vwBfalcLSX5vhWrresInJloYlVgHew6fZ/537yTOvXzOnkY8sf?=
 =?us-ascii?Q?zKfFNMmIkvvp3KUXWYlZWY2/EqLbdC7g074bxAnMVEg/r+JfJC9Mt0KsZOsE?=
 =?us-ascii?Q?M5h1BOS68WC2papOlxtWYkys3aNC17zNENBPyLHABtNB8NpH1P39aP2yeUI+?=
 =?us-ascii?Q?cs6XUmQKN5ayzy9imPWaaDhhVpS5dd+lvIZlIjK8kRaFzhIXPxiwRXPrQpoZ?=
 =?us-ascii?Q?fr+xkXlIJIvCDYJdlKo5K+Eo2KDB3bmXVXLwp8q0gNpR6lkdLS7ieDevEtrp?=
 =?us-ascii?Q?AsWXmZinHEPPtd9DsvjpsEtebWFhpCgDa72QlG/AjyE22lIGmZFWO9/tJ583?=
 =?us-ascii?Q?4F8yt9MaE1GkQGark0vKR1td2FQLF+qR5WRyg8IRDfsqOxxNhALzbNaFbyZc?=
 =?us-ascii?Q?Vg7Xlg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4pAXIp9PPGSSzZoF9ZlPGTPdhmF6rJqn2fnj68joCZs0KNAAnBRjT9+scuthaRcCDbkqOQVW5FkMcH2W0wUpjyp36CGYC/a+DQKH3rx52sybHgQBZ9Pv9iH/hwfrZybg5HXI6KxybJqgqqTd+reTyrYs5Sw8Bk+ut/6tAUn84Rheho/9rP5ZX+S8CUNB6qSszjw/u3kUsYgNdIP0AvKAZemnU5Afgzdh4iRduq1znLgQ2SnQqJWwkfe3jyRWYZxRzgZKFGoAiW+ALWxY9F0n2FQ6/UE9b+ggT8uNe9X/leS/7VNSX6BtexeqiBZwYVSiBodnB5TryI+qV4AvvRW21LkPd1Y4sNY4NQW8ghxrCBqE6xxS4K9PItdz4bDxmXpsSg026vUozGmZ67kztAD6O8yO8z85ie4D3XpxjJj9OE/OAFPdrCOUef9xQc0yCr18
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 06:02:57.8714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c061125-8fe9-46ae-eefe-08de65456082
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
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
X-Rspamd-Queue-Id: 29EBDFA88F
X-Rspamd-Action: no action

Preempt commands are only supported when submitted as chained commands.
To ensure preempt support works consistently, always submit commands in
chained command format.

Set force_cmdlist to true so that single commands are filled using the
chained command layout, enabling correct handling of preempt commands.

Fixes: 3a0ff7b98af4 ("accel/amdxdna: Support preemption requests")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 37d05f2e986f..6378a0bc7b6e 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -23,9 +23,9 @@
 #include "amdxdna_pci_drv.h"
 #include "amdxdna_pm.h"
 
-static bool force_cmdlist;
+static bool force_cmdlist = true;
 module_param(force_cmdlist, bool, 0600);
-MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
+MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default true)");
 
 #define HWCTX_MAX_TIMEOUT	60000 /* milliseconds */
 
-- 
2.34.1

