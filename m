Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666AF9E7B4A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 23:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02B410EAA6;
	Fri,  6 Dec 2024 22:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oZ//8zen";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AD610F1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 22:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPiGkElBm29PYku8QIx/znGyi/7zlSJzGijUMQCwuvpZdO+6ynEHwBKFSKMx61zHPqgUYbzw7AN/S5svbmflDST1rq9JqkXxFzhwsEgZ52l+NUL8y1YgtSd1D5bqKEIz7liwFVwq9TW+56egAat6GwidIsQwJQkk0R2o5befvAwFHlAP/ZwfdrLUypBxeYjS4GdAJsW95lr25C0FyvwFMUzaH+LBwO+ZPnEztj/nq8nYmp3vLH3F49zGrz79JEd7MmJlfA704hCO1xkw47eyUXW3iD1WSJ9DVxlimfgEW1UxeJooN2HdHFZUChiH5fQoQQLRJ6hFDaNYpRNxR+e+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5JGvdqwWAtUwNT0ViXjo6f1BqpIgKpwG11clquBknc=;
 b=F0ouBNpilhjf6bDg1af+KM5JFR4lj8o7swCATtgeI7gy7cDJWKfoLhpS4/0DzaF5Y5k3WqTVGeIUZipCi3v2k5wrUTI1Ygmt5zaxvBgFrhzkqhgvXBKna9wwRM4syncH9p/F+GUtahgRX4wqCW4CWNb02dwzOPeRyjLyPN1kkQFUeDjc5e9K75SgaiL4gGkaeJD0de0Tk4B7l1r7w7oJX9mo9beRkbjdNNork8sjypTypXz9Y4Y4ZOvsgk0z4Rcmm0Odblamxj+ov+97vUux0HUs9EIo+Fmshto1l1qCcb2n4knlgnlCkrH+RfMt0vNK2pOUCw82Qm5KADpF8pPtzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5JGvdqwWAtUwNT0ViXjo6f1BqpIgKpwG11clquBknc=;
 b=oZ//8zenaXl13OhN2kO49Z7iTjkvlxy2DPcTpPjKzufT75NysJushrKc7C3KkvsXpq+1S2tlCNdlhDuk36Nb6L2HDWUsNpsz0Ut7xqgD0K6uoDZXZ2gvChmcQMz0R3qarEpuPLqB3oFET0hfBiZxWI+xGDOHKXIGGmWrg0HZKhs=
Received: from SJ0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:a03:33e::8)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 22:00:23 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::97) by SJ0PR03CA0033.outlook.office365.com
 (2603:10b6:a03:33e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.11 via Frontend Transport; Fri,
 6 Dec 2024 22:00:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 22:00:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 16:00:20 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 16:00:19 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, Mike Lothian
 <mike@fireburn.co.uk>
Subject: [PATCH V2 8/8] accel/amdxdna: Add include interrupt.h to
 amdxdna_mailbox.c
Date: Fri, 6 Dec 2024 14:00:01 -0800
Message-ID: <20241206220001.164049-9-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206220001.164049-1-lizhi.hou@amd.com>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA3PR12MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f49ab7-8a4f-432b-700e-08dd16416245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k72b9foOAm+SuleJoDmC9pdCb57y2N2TvZ7C8QUkKfFgswmQrRG5aklWCQP6?=
 =?us-ascii?Q?yD4rbfUDMzXJPR71b0G4YlUmkWvAV39dceQUdrrQX5ABpSiqluC5dbDxCAim?=
 =?us-ascii?Q?PauVSaiZy/CdV+7ZhD8jUaCC/iUocrnubDwtkru4mbCZ72VCZf1ZRIsfK+d0?=
 =?us-ascii?Q?IySC7lxEv8XntyPLbX0B0dB94pjVzhUh2I3XEP5PUhSN6al9BYxAdJMtZ6q7?=
 =?us-ascii?Q?jn5mIBwcQIYEZZRgcmX66UvyegTPjSn7d6Stbc4sQSHcT5VGPRm28Q7xIdx8?=
 =?us-ascii?Q?rlma6vsoLfAKVwMoBaE/tiRTABvlOB72jvSQJW5Ff8iQa5o+L+i9NXiks/Mb?=
 =?us-ascii?Q?YFNfxjnWntQ0i9/qdMEs4vDyKuenR88kh3F3Qn5D3BNEtkyV+d6ilyo4EmWX?=
 =?us-ascii?Q?uH/3WcAlcR4+Rk/0ug1ttTyDv0Yu25fRk7lSOmlHP7UpNG4sAa4eFc85LZKe?=
 =?us-ascii?Q?cN7S7Zw7392uoV8nueXujsPocPRFFMFSZszqNvQj9RxfPzDxkeFsZprR+8mU?=
 =?us-ascii?Q?q8rx7T2LheBwyYPOqsml7kYfl6dWDX6VN70euyz1jS1giqTqJATlR7It3MJ3?=
 =?us-ascii?Q?98Unfk34n6HTbrgUekA11QpB1n4MAfqIH5oFKERpphW+EKZAK3c7OhCcYA5O?=
 =?us-ascii?Q?GsLkfbFARLA8o51fYvnPx8gITUno53YjpQRsxnPMCy7JXyaxTtmtbp6+XcMJ?=
 =?us-ascii?Q?hqWGtkW61x0ZSh3gk6gPkUJC+Quxk/LBORilK16+FIR34TJQas1wHxuIkPOB?=
 =?us-ascii?Q?BP0wpaYKGuVhpagknGx5pAW14fIYCo9kDDM+kk5li+MwSP+e1R1L/zDzmOPd?=
 =?us-ascii?Q?aThjS4ZNCbvzwlsw4Qm6Bcrll08CwQYF6GEqrMLlt0kAI8K+yr8L47fiT7ja?=
 =?us-ascii?Q?KNeYH68vHbQtjmBonbxEBuBm+hblephIeBV3W9tNHXNQTFVXzpr/uHiYXqBR?=
 =?us-ascii?Q?3ILDtd/OBrsVHbCm7Ek9pQZ+22mWOK8mY19sNHayRfH045pfnz8VhpcUlVaA?=
 =?us-ascii?Q?rQnXcs9b9FGEGsNDuxGgydA+5R6qwUz2E9TdHoFm2LwqHp6GzTcwYihRUH/t?=
 =?us-ascii?Q?7OT70CRNC9s6eN1tHXFVSwtuaMuWAfvXkjb4h7wZodofNwsF9++Ds05PLDJr?=
 =?us-ascii?Q?y1jlY15RkXNMmX+zWitWGzJRh4y4L/voX13RJZ7sARw90Myp6RTCZ65b2H2n?=
 =?us-ascii?Q?mFops5w6gvi7RcXsH48r/HfAlgLEUpMyv8yt4ahnIvQv3fSFfeByJlF5bNhy?=
 =?us-ascii?Q?kYFkrziSeO8n5CzObb2878PC6pwNNDBUpwhmA3D9wCtHWSMc/GhPI/xyNYA7?=
 =?us-ascii?Q?1wcsDxPJV9rbH+nV1d27la9JjYFXSzW/38JlG47cT4CeLtbMIqC6aSiwMScN?=
 =?us-ascii?Q?740sUyu0Kpy1IewQJ3IXxoF+8dliXED3kIpAk/+Z3xYzEfLozQzWtQ8kE4TX?=
 =?us-ascii?Q?RZgmg6CPy/sAa7jyhhIHOLm2SQmJx+ke?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 22:00:23.2319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f49ab7-8a4f-432b-700e-08dd16416245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860
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

For amdxdna_mailbox.c, linux/interrupt.h is indirectly included by
trace/events/amdxdna.h. So if TRACING is disabled, driver compiling will
fail.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Reported-by: Mike Lothian <mike@fireburn.co.uk>
Closes: https://lore.kernel.org/dri-devel/CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com/
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index fe684f463b94..79b9801935e7 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -6,6 +6,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_managed.h>
 #include <linux/bitfield.h>
+#include <linux/interrupt.h>
 #include <linux/iopoll.h>
 
 #define CREATE_TRACE_POINTS
-- 
2.34.1

