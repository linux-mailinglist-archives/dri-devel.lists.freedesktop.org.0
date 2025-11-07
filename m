Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF4C41395
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B953D10EB4A;
	Fri,  7 Nov 2025 18:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dZIPiBn+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010028.outbound.protection.outlook.com [52.101.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531B110EB38
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 18:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJClfM79w29EvjLDskHy/qZGJ05iv0wcfWWbkcBWC6db5GT9JBlQHscKfKGOw4cZHp7/Ua8Z22QjqYPWZKoPqbHo1Z1ZTqet9ox3Eh4fD1EJO0W6cHRolJu8V7Tk43EaUdVzOddo3ysoZYy7WaQszuTePVqwaYOByrbatVRr3Km6U3OzQh01ftrqBSFcUIAdKDdH+3oCmnlDokPotBuwaMnOjtXO0BhQC5ihM0I6uuTlHD1cmEwk1KALplvkUYKutMItjqBBdxBxVG4CuWOlQzwGkBXao01IP9F7sI4cZ9LXrkfB1KRzU5bki0ljwoKG3nL6jYJlr5wbNPNnEXJzWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+lOU6CG8bkgkkavNgKGxeeDMa63r0ygMfELlHSv7y8=;
 b=lYRyAoOqCeOUx/4hdOibRWtSBt6etpp915akBxHW1Puv66B6vSzjbkuploHiJOCa6rpu1OYlXtbs9iiNQjSgVwPWeAVMMyphciZjfwaHFiEo6Ts8XVcUl842HEBTvymbcSVfI1oH1Rj8hSh+CLETT1DFPGaIf6yQUNt2hb/l3sUgSwShRLpzqMwLr3aCwc7kLJaVRvnYIEL12+33nOY/T/Ha7AORaGbaz6mH9WVNGmQMaggRKeLC22Lr3UYQGkhWGQuShrvVRDsfpA+sgA4/nnZurbtS6GBNdw2QEZUnfj0NKp6Nu9QGDueT6l1FfXzyZAYUZGvUyyriaOvuwHijuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+lOU6CG8bkgkkavNgKGxeeDMa63r0ygMfELlHSv7y8=;
 b=dZIPiBn+Pw5ezS0/te58YK1THdpBrKIoC7YhTDrqHR5GdLzlEw19UtNqk0ZLu5YwZVnzboIXWFqK6g1/Bh0E1OpiHOjIJ7sydbvDn8JbyAqYhl+QQqlzaZLgyjo8WNoXgKpbwOSoP98jzCSsU5AnM9SF2XRjzux2wkrNryel7d8=
Received: from BLAPR03CA0045.namprd03.prod.outlook.com (2603:10b6:208:32d::20)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Fri, 7 Nov
 2025 18:10:55 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::e3) by BLAPR03CA0045.outlook.office365.com
 (2603:10b6:208:32d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Fri,
 7 Nov 2025 18:10:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 18:10:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 7 Nov
 2025 10:10:54 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Nov
 2025 12:10:54 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 7 Nov 2025 10:10:53 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH] accel/amdxdna: Fix deadlock between context destroy and job
 timeout
Date: Fri, 7 Nov 2025 10:10:50 -0800
Message-ID: <20251107181050.1293125-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: 17219863-ae2c-4939-f74b-08de1e28fe91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uZx5ic7PK73JNBTYvz10l5baD4mC17kRgZDM5J5Uix1mSd1CF8KxaCIZqgdU?=
 =?us-ascii?Q?BZatgIzJyAsqbUDoxaiVoocpl/9ZwQdbS6rMcuciR6KMWaXgep9KVtz0P1Si?=
 =?us-ascii?Q?ee+fOZvRdHwtJWJtrp/toDAMkkreHlAx69meFw4vOgkfEKOARSAaLnOgVcnx?=
 =?us-ascii?Q?Qs/5kGFaY0LGazAWU7MlEhFjn9rekB3EjqdkOPwgAAs6FRdop7NtVhWKQWZ5?=
 =?us-ascii?Q?vSDiWbOx5/9Evaf8fggnw6h3UZFwwu46nK4SaO+EJsJN6v9NxtpnfhLfcutY?=
 =?us-ascii?Q?KwhUCqgc3Iv2cXqlMK7MIDr2tz/7ni9scvHA63ZHMLCKgwwCmZOxApaeRb8b?=
 =?us-ascii?Q?RrjpfhQ9YIs8fYRDekOMBbkfRExSsevtrV1M2tyJPY80aFzw9eWAwm2GSZjp?=
 =?us-ascii?Q?7+lWpIFNC0GXyVZ70FY+Z3WZtV/Ck5g7Rzz4ZhRTidLkHlT3eYvcDhifOI5n?=
 =?us-ascii?Q?D7IDkFTiaCTduZpPbVyomqck+rhTRRO18qIJUW7g/P445vAAoQTTXq28VqOG?=
 =?us-ascii?Q?2dvhpUGxhVrRypNUM7BjLHOL0nwMromCGUfiL70jFZ3EtW9g2q9lEVQaPhrz?=
 =?us-ascii?Q?+Ciru2kWGjp6tw13U2BGDryUC2lBshs8kIPgtkFfwT/ivYwtSYaJU5J/YXR4?=
 =?us-ascii?Q?G9pC8GTStwtaYoJCXS0ljiDiMoW378OQzmvjkiT7nwEfJNFV6L5gz9Xv1BSK?=
 =?us-ascii?Q?l0Na+UrISQzJdGIA7Z6poWREUBI89Sp30LP44sDJM1Ra2h7sZesGvNshptCg?=
 =?us-ascii?Q?8W8NM9TQl+XyfTwfn2xrX+lcfmm3Tl7H052IQv4AZ1zTezsIFVJGBYjvmjba?=
 =?us-ascii?Q?EqCcYrnDvrxrkomt3tAczGqTrUdJDYB40eWFIwe5ekLx6ATyYvoq6Tcve8I2?=
 =?us-ascii?Q?KdZbr11kQg3H9DwXg/XPVtcD1bEQa3+ZcfSRKa3GSvTDQNBedxQ+na9WXO8u?=
 =?us-ascii?Q?i7erC8pPuQ2V6MI+iQyLlZss8+7NAqEApwzpp/4NUnp1rMoi3i9rQXflK/Zb?=
 =?us-ascii?Q?V2CaCT0fl/7U8W2aAR0/lT9FBboNY+Zbm1lpL0MlGY77Cfbq+XZgWn1rEvoS?=
 =?us-ascii?Q?rokfF/4+AaASxgoVzN2nXQ5Od9TIcPN+26OgHOFQH9k1LYHr1/7Oj4uequZu?=
 =?us-ascii?Q?57aKaLQgxiFDo04mfLDEKKoMTU6YEJPi3OgV9voprT4aq2sKOES2ZGzddaTW?=
 =?us-ascii?Q?2gB/TqK8M196Z1gnhqVR9UYl+5l4TpJ7nPN+kjLFOHo8l0MY4u0XgKUIs2ul?=
 =?us-ascii?Q?+Bl0O+dmMl5e1PaTNIsdz5RwI++KlsfwRY7C43smuKuCDMQqdJ4IgIGvDQy+?=
 =?us-ascii?Q?SvII2uMMP8NHn3K3bCJQxgQTwRFcJdIDW62VfWEI9hB27uFGc8OUaS6YPozt?=
 =?us-ascii?Q?4zZ424obPFe3qoFoexgtNDye+twTaEzvoKeF62MdYq8wKjn3VwwWnJB08lfR?=
 =?us-ascii?Q?CGV/LpbpsnoVrPYIhtahigozL0MsWcu0o3OjJ48uvYDofMtewPUKFudBHw3G?=
 =?us-ascii?Q?eoUajhyZvQcCxNhoCaOXVjVVuXBloUJ7uJbpWYPW9vTdKzB+pbXf9aDASa1V?=
 =?us-ascii?Q?SAocLcS3E9Jl+TkNS0g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:10:55.1242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17219863-ae2c-4939-f74b-08de1e28fe91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
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

Hardware context destroy function holds dev_lock while waiting for all jobs
to complete. The timeout job also needs to acquire dev_lock, this leads to
a deadlock.

Fix the issue by temporarily releasing dev_lock before waiting for all
jobs to finish, and reacquiring it afterward.

Fixes: 4fd6ca90fc7f ("accel/amdxdna: Refactor hardware context destroy routine")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index bdc90fe8a47e..42d876a427c5 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -690,17 +690,19 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
 	xdna = hwctx->client->xdna;
 
 	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
-	drm_sched_entity_destroy(&hwctx->priv->entity);
-
 	aie2_hwctx_wait_for_idle(hwctx);
 
 	/* Request fw to destroy hwctx and cancel the rest pending requests */
 	aie2_release_resource(hwctx);
 
+	mutex_unlock(&xdna->dev_lock);
+	drm_sched_entity_destroy(&hwctx->priv->entity);
+
 	/* Wait for all submitted jobs to be completed or canceled */
 	wait_event(hwctx->priv->job_free_wq,
 		   atomic64_read(&hwctx->job_submit_cnt) ==
 		   atomic64_read(&hwctx->job_free_cnt));
+	mutex_lock(&xdna->dev_lock);
 
 	drm_sched_fini(&hwctx->priv->sched);
 	aie2_ctx_syncobj_destroy(hwctx);
-- 
2.34.1

