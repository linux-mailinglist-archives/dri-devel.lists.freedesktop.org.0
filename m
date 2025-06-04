Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E711CACE052
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2856F10E7AA;
	Wed,  4 Jun 2025 14:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3K3twk9h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6CF10E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEs/VBJWjjq85BoQQKmdLVfm3ep7wwHf6gn4xv8rkSByA6VO1W4QISiDzWnmZlvz+DoKmWG25NE8VyDo0RavKSLXzPmx0ac2kGtXWrgGLvkAZOMDlOwLYPl7Bu16tO2K3z/4cyWCsO5etKl+xOFbxT3fdL60DtzocAvoCdYt7XghXXwC7x1jyRI7GfyQg9Yu2nehcKT45Y7BzPuzhFnB8tGRbSJSWQa2xX6m85x2auJ+kRyQ3tO3CoSsk6wio5M2S4uL77pLYkqJlO2q83Tf7vcGoYySt81lBZxyT54V4JOlDtlgtwuhEmnngvXCewT0rVrIiE+g0bOFbUiIZLjYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwTv8N82AvUkSYX0xV9XRe9T4d+L881V6ENelqHUczk=;
 b=KwqJDjWbdw78LvYd7xnMX7Wn2lN1noa/brAtIwvfynLgypzAijrgVkIBcWvjG0HDgSxyWfOMi4jW8BbL1a4sPRPjiOS9DhgKf1is78DHB37MVkHlxBpX1J3YKKWhMnSGQurk/gYb/dHRTvsYvfCWSdEO9mAMffrCF2qXqSB8AD24bv/f93ok37t4PKoNQa/zya6fgT/aI0YTch7y5Oyqqbem8InQ5lMmWbX4FMhGH8d6DIOPvFQzG68j2ZsjYfJKkWtS8c2xnvMrHTqvou7tU+P7T+LTT2AmgIMT8xYopNTSbm1BU7RrZfhemvXPgAAgbpNSd8GeFjmPgteDfA6oTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwTv8N82AvUkSYX0xV9XRe9T4d+L881V6ENelqHUczk=;
 b=3K3twk9hrG02ebJr5qHLuV/k+wz7NWsbEWdF+sZqUmqW75xx3pTHvl4gP0KRE0wBwWQ8UF0Cf67+95GGKuVrRcUwt10bXmRmD65HJHR6yIw/JzU0Q0wf/m+4eJeQ44raaaDILsvk1Xy31boXPrtSqv4P1OfdTFYR4Py8++qmc1I=
Received: from CH0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:76::15)
 by DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:ef::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 14:32:22 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::cd) by CH0PR04CA0010.outlook.office365.com
 (2603:10b6:610:76::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Wed,
 4 Jun 2025 14:32:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 14:32:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 09:32:21 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Jun 2025 09:32:20 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <min.ma@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix incorrect PSP firmware size
Date: Wed, 4 Jun 2025 07:32:17 -0700
Message-ID: <20250604143217.1386272-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: e7ef541c-afaf-45ed-fd0b-08dda3749e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rcPlUvdhRBsLbavW+YKp4A58YtNPCiY5yMmvIuEdNMRMyvLK60Vi9whquxI6?=
 =?us-ascii?Q?flwkLZFRF1TiPigvJpkj0EdFsfX7JDbnCRzeiN4YkxME5X5tUxpYYw48I53Z?=
 =?us-ascii?Q?BIb2yJqn+6Z2IsRI1Jfd/EieeMDWGoySxRFcAyxKvEQ6iZIEHomhgHVXiQpN?=
 =?us-ascii?Q?mVZ9bVAXyCUeWdDjJvORFpKpmoz1UaaaXGSdlVNzzPs2gvC+7oOsk7fOYIzE?=
 =?us-ascii?Q?VjkVaiKwPF+wb9+CrkYtfYEoEcalAX63qnOQeaSwaR+XnUe1EHcAbQsHNwG2?=
 =?us-ascii?Q?CnDipjSZFqwNAJpk9XPah/jzmeCgbTEH8+MdeWj3MSPDaqKqXqAzZi7BJukS?=
 =?us-ascii?Q?HvZMqMleTTF+h5o6SVnZjGpL2USAb/78h+RopQVeEVeRYxb9fA5HTzgbmhHw?=
 =?us-ascii?Q?F9GjptA4HLBvQwgOvvYlaXxTzRL63xoNlHaZ0vzpW2stYH8yU+ANz6Ykvv62?=
 =?us-ascii?Q?CeMYwuH1/tUytHWedxamV411BF6+2cs3DFQpxxJYZeAr3Z8hQxKXXivf846j?=
 =?us-ascii?Q?TZC9udl222pRMYY0F/rBSYmzjUxSM+w2R3M69aWYWqbPFfS3mBUOH6Uyg+0I?=
 =?us-ascii?Q?6kXCz+knDANGwWQnV/TBHbpzO/oA2z2TxEU97ICNw0BdFgCyWWRDA4LVYbge?=
 =?us-ascii?Q?76SRYsagFgyRTgDuKSo64hBwpzDt7ZZ+LP0b4tshZb2ABkkqwywBhS3hsrN2?=
 =?us-ascii?Q?wt2U24LCCnVPHz9hqmG61XlW26zFrl6AO99B9R52GmSdKJ45kUO2oCR8vw2T?=
 =?us-ascii?Q?UEFozGEa7gWHoir6DCD0qPAE5GSVOf3HK8K1YB85QKMH8NQbEVGJTOdEHODC?=
 =?us-ascii?Q?CU84MS/UN07NZs/GL9D5JDWy8O0xr1hz/Fh2HfB6wpynNLTlwU2HRR/YoA9R?=
 =?us-ascii?Q?ha8Ly7U0ILOx7IPI0acEOlr0+LsOl+5b4VGs7UPiSQZZ0P+j+6JMCzD/2MUT?=
 =?us-ascii?Q?pkOu1AwF76vjRNBenm6VhI+WpYICccZsb281bkIavQnf5+YO6v4U/4LulFa3?=
 =?us-ascii?Q?Cf/PWt3nuVhEohcSud3dfKCyQeZNFlB+I5sinEsGcKhBVSNviGJApBmqMxVI?=
 =?us-ascii?Q?dwgc123KnpgSaYD82PcKK9kPyBr3DiQW4Ee/hz4AOTNlwmUsm9VguHNe9Qau?=
 =?us-ascii?Q?2ZLODrZQT4r96NNPh9cbxRYBVVeVaWNalpf/mchzBknPs9FZ5ugMndYJlFCQ?=
 =?us-ascii?Q?vuJQT6RKgv8mnFXIJYf8hQ0F9U1RHRM6v2LafZLaXoyjSqU+OOGOgENuOYTN?=
 =?us-ascii?Q?Oo4p1s6YdwuEkt0NBtJ5YOkddBbWuNQ/qYloHiB3fO76Y+Tq+/3cnqElbagB?=
 =?us-ascii?Q?nQJ9TF402gALqJgHvvcQVEeG8gOFHlrVuMHotmigYDhbSUgBBuQuQ2jqEAud?=
 =?us-ascii?Q?fyK9fPT3IZda18aayP0kN2wkVQRWvjC3mbM3n/Fdvd6D44clKTRjTzf2EPhf?=
 =?us-ascii?Q?qup5aEZ/71DoUp34MiQYIZUDbFv0YFdL6xP/r2gZAZCkcFBpP+PNiEcjUM+y?=
 =?us-ascii?Q?P5Cd6r5Xu2JQ1NgD6Y7Y0b71gSqhs1b8NqLw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:32:22.4552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ef541c-afaf-45ed-fd0b-08dda3749e63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201
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

The incorrect PSP firmware size is used for initializing. It may
cause error for newer version firmware.

Fixes: 8c9ff1b181ba ("accel/amdxdna: Add a new driver for AMD AI Engine")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_psp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
index dc3a072ce3b6..f28a060a8810 100644
--- a/drivers/accel/amdxdna/aie2_psp.c
+++ b/drivers/accel/amdxdna/aie2_psp.c
@@ -126,8 +126,8 @@ struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *
 	psp->ddev = ddev;
 	memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
 
-	psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN) + PSP_FW_ALIGN;
-	psp->fw_buffer = drmm_kmalloc(ddev, psp->fw_buf_sz, GFP_KERNEL);
+	psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN);
+	psp->fw_buffer = drmm_kmalloc(ddev, psp->fw_buf_sz + PSP_FW_ALIGN, GFP_KERNEL);
 	if (!psp->fw_buffer) {
 		drm_err(ddev, "no memory for fw buffer");
 		return NULL;
-- 
2.34.1

