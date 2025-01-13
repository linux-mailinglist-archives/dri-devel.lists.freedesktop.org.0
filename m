Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B06A0BFC1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 19:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BC810E158;
	Mon, 13 Jan 2025 18:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u9ZjlhNo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA3410E158
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 18:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9PkyUnjrv5t0+qc9ibjnaDs10Vfe4o80zIF5LcPBCPpSalB5AtTz5rW3tztHf5axmHFYq/lXiCQ4Er7h85P3NJEcx9V9Yh8nFbojR4sDGHaJPeeudwyfso5fk6dZzfPS/xyeJtUDd9XcwUyngI6+/cToUgxNHEubEQsaVCQ3j67yCl8Ri7a5aFYmesg9grz0Y3rfq4mwELC5/MxnFgPBcc0ey096HhAQlSEBgVKAGI8Mg4MTACDJNbilHf55kGqX9SVbaKkVHntbB2n1Z6eMaY5tjW5RAYUlm0/9F5Kd1ta5qfCnRojjcIxM1N46L4rXz/ZGkv9SRtPzmVVfi0/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85L+MCcsavCICfQdjrZEH5q8o+VxRoYTHfwWqKTzEOc=;
 b=qRND0vSTiU3aZweKYwuD68tpIQqZBqz39HUu19eCqIDsF7Z9YmUK7Igcc+AShrhse6dSo9B0d4EIvK+VYTkozuX2pSVtQbs8CZps73rQslC5Cp+pF5TPQ240OSiEj+kykmR57aBQWAralJc84vTokiT/8FiH8xD8fh1rCpCs+MbcyAnjoR2yr4MxlM+x3ORcmC/m3Da+wp6DWUOaM/rDK8DCTv0untodQrVsVpv6p0Ndu/UuoSmlSx8vrSzfwgr0c/D4m+2MIU3AxdogAJiRQkRpZjkMvyXyVWzZq+7zVfa5e2SXYpX29tkWkXXYefmkRPy7CxJFbvsp8NwjyHYhCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85L+MCcsavCICfQdjrZEH5q8o+VxRoYTHfwWqKTzEOc=;
 b=u9ZjlhNofGsn5mrf2xGoOqJN1v4Om4QOfkTXHVzimJJthVDwcf+zNMUU/QV1VQpGAJthZgTAUqFtTKFv6vyeSu79JMuAcOqRREFMz75zdbIOOn37S9KqhY1lDRnQaIUlqSQ5CwcBNbQU1H6tjf0JW+Q7SgzAVgUN6cg202cfj/s=
Received: from CH0P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::7)
 by DS7PR12MB6096.namprd12.prod.outlook.com (2603:10b6:8:9b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.18; Mon, 13 Jan 2025 18:26:25 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::c9) by CH0P221CA0003.outlook.office365.com
 (2603:10b6:610:11c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 18:26:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 18:26:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 12:26:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 12:26:24 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 13 Jan 2025 12:26:24 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH 2/2] accel/amdxdna: Declare sched_ops as static
Date: Mon, 13 Jan 2025 10:26:17 -0800
Message-ID: <20250113182617.1256094-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113182617.1256094-1-lizhi.hou@amd.com>
References: <20250113182617.1256094-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|DS7PR12MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: da0db14f-31f7-43e8-9dec-08dd33ffca34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HomxSX1k9nLCVQ1a+b/jLaLcl6oB2zQ8me8a8nxyhrWVOopls4hrGE9uSww4?=
 =?us-ascii?Q?Cc4lGLuf/DNlsGEdIH0sLywBLVD70VlhE/YOQj+1iKQwVyfE/R2ctc6V41Ms?=
 =?us-ascii?Q?xTvz4a23EyayGqjUOtqkCMKR0kznDEmScoW15F5y6qK/TW4BQgNKQ7d4rP19?=
 =?us-ascii?Q?uhKzW4fdrj9ge1hMgX3XTEdmXdyIoCJ42ete+Bqw0yvTwCceC8bQO99eTAP8?=
 =?us-ascii?Q?BKCsyHSvQ+D9a1laeX0r2ycbrWK51bnQTxP5Ae9yhpZ+ozrTNFYQjBivEFGe?=
 =?us-ascii?Q?CvNOjlXz5bhylvsbQ86ia6iEhdsIyNc/i325V4rhVBvbrVMNZfNtPDQhTgio?=
 =?us-ascii?Q?5PFZ80rcSxYCyGNiJOrwDfImyC7vSYtVRjpy2MnjkVILiKRRKVwl+b/V/nYA?=
 =?us-ascii?Q?sTVOWDgMsnfoGI8F8x7rEQKgmcLVNqQH9Nsm8oAzCbm0JwVf8YH0dEDqn0S4?=
 =?us-ascii?Q?iWBhpcMRvXchzTPpfy1o95TKuFUurIqyT7Ahteyvlfp4ja1I/0XhoQNAUksD?=
 =?us-ascii?Q?0rmEEabenk9772SqSRgLnSaoNHi5NP7OrJxo2f8mfgHLidj2jR6ofQmYs+Cu?=
 =?us-ascii?Q?J/7IctDc0y/CbYtdtb5Kq90RFV62TRpGXQLS5CWBYgjZA8p+PUWaweAmYMtB?=
 =?us-ascii?Q?S2cfZeVvQkvUXKO0vZ9IZiIIOi6KHoisaw2e1X9UcWTr9EG6T8MM+IVrC0QC?=
 =?us-ascii?Q?EPuXehhfb7GoRtq/Wxxg9MTFTaltbvrpTIRZXQkPqYE1E2sT8hwQabw4IIa7?=
 =?us-ascii?Q?QwrfdfzbEoH0OjpcriyvncZyeRwkdSoVhE5DoEeTi4ggUDUup89+JZUnBC/f?=
 =?us-ascii?Q?Y6gQDi3WcY//KJslkJ/Vf551ShUYalRD+BXalq1cWbBkEPEcDIN/lJ2W5uOq?=
 =?us-ascii?Q?cLIeNycodJYBL1CigHeVIo3MfVpsEPAy8DuG6rzcsQlf79xPKWS0amm5HzE2?=
 =?us-ascii?Q?00g4BKLnoK9/fIvjFgYJzzB4uIPC2UxNjmfRtnsKUYEYXsrB9iZG9HOoshn9?=
 =?us-ascii?Q?r8/esBeyl5mxTEr97bsQYpbRZKO51LWUN29fx8lQwEkzOJECEBIKv3lxg/tt?=
 =?us-ascii?Q?M6CPWyjr52BgjDlqt9PCaVXo4Nh9DfnBuavja0vsMk32jx/unH6wD8ZnT0Lx?=
 =?us-ascii?Q?KnEuAniSr8+qBh+eYiEYmOM0cMXZtaw8La7gglXBQpOBjEPOC7O6oXY3kkdv?=
 =?us-ascii?Q?+y/JM2FOP6g/KK5Q78OnsN6vtlC7xDtAQTYPQ/4aJGRTp+s1yOW5ylEzh4uJ?=
 =?us-ascii?Q?tslwzT0hReyoOoGzuAzP92qjBX3vQ8XaXEQ2znJgEdeMxczH1G1/69cQH+uf?=
 =?us-ascii?Q?qjzttxesVZJNQ7srIGzrx6Pn6+DqqwF9+adxpMzQQCMruETrILuxpcEVcnjZ?=
 =?us-ascii?Q?gdTNaJq8K7Ly1rubbBosN4mH/M/qBioHyQEx8xg+TLS1JezCKwc2XeANa2kM?=
 =?us-ascii?Q?NTo5Eu3Ro25hDvnQPuT9XOATUr4Q20IYUj+QN+se1xt5WAyvDavZ0X6/uW/3?=
 =?us-ascii?Q?jzcxmj0D5Kjk/+4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 18:26:25.7820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da0db14f-31f7-43e8-9dec-08dd33ffca34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6096
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

Fix sparse warning:
  symbol 'sched_ops' was not declared. Should it be static?

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 5c69ae3c40f8..2799729801f6 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -361,7 +361,7 @@ aie2_sched_job_timedout(struct drm_sched_job *sched_job)
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
-const struct drm_sched_backend_ops sched_ops = {
+static const struct drm_sched_backend_ops sched_ops = {
 	.run_job = aie2_sched_job_run,
 	.free_job = aie2_sched_job_free,
 	.timedout_job = aie2_sched_job_timedout,
-- 
2.34.1

