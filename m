Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 011369C334D
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2024 16:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254D010E035;
	Sun, 10 Nov 2024 15:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F8YOd9SG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD2710E035;
 Sun, 10 Nov 2024 15:42:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6/GjtYz+tMjdHB12nFcfWmgtwzPiKZ0FqwMhJ44EJLn6XuBuKpdu+RxlEt2XwNRe6oJZCCXWYlsLgsf1yGikFmVXT8bbGE3lOK/H/7pGthJlYbhHCf8BBa7cpSxIkl7PgRETERks1KFIO4ssKCp9m6/nmXAA7/gJldH3Gojrvx/E9PWgRgP3yP3icFFxxQCwjs+Fp1I6j4B7AkA5H6g/Ye+EL2QuIjeUTyPZrhRKhPw5r2yJs1sP5YSEuIFsJY0Zf4/pBSl217PkpSD+E/mf6u8GY2QE0MPX7LB75TBmVtgjnwqACbEcmwTDLkfcHBV17W0U4IA3uZtma6W8+ocGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSWAjmpW0RzYA3fPKkCKeVEDXtQcv56hW8REsGhZQAw=;
 b=LJKlzs1V/Ixei+3vgYbQqY3sNk2fnvg0AiAeQLq4BrbsfKlIUjzpj96hq+/Ek4VPna9rTO68Zy0TZSSvHt203VlKtevvhsqzTlnlsu9Asr5D+KwsfWjFEEJ2EpA+ZSWeMSuib8xPdiyIFht9V5yzYbEkNYGQoD7EAD3ei/D1l55ueUeANN1EnZ2VvP3euQaPwiqQkzbJi14IzEqj49QmPIHDxCewQvC5PNpKEm4X2iz6pONDy+avHSN9RK+MorSjh7zacDt4lYu822avjQW/7bGitUJwBUHo+SAa065nv68488vsSFxQFsdphBIbKexSHWavemmAErjhquIwP5LgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSWAjmpW0RzYA3fPKkCKeVEDXtQcv56hW8REsGhZQAw=;
 b=F8YOd9SGltcht+Jn2C2o7j4/yrNNZcVy47SwKc8dfBTmewFcHZr0tkb7U9BIhnA1TMk5uXRGhpXZ0GeG+olm6v/48OTropIjoD7mhL253qXIicuIbbtGeWX8TXZbSEFOcJ2SfMzPCotlGtYzT3Z7mPMKxNsaMKXoyvZyJ8iLN7w=
Received: from CH2PR14CA0014.namprd14.prod.outlook.com (2603:10b6:610:60::24)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Sun, 10 Nov
 2024 15:42:25 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::28) by CH2PR14CA0014.outlook.office365.com
 (2603:10b6:610:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Sun, 10 Nov 2024 15:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Sun, 10 Nov 2024 15:42:25 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 10 Nov
 2024 09:42:24 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 1/4] drm: add drm_memory_stats_is_zero
Date: Sun, 10 Nov 2024 10:41:49 -0500
Message-ID: <20241110154152.592-2-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241110154152.592-1-Yunxiang.Li@amd.com>
References: <20241110154152.592-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: e46556b4-16dc-4998-1c6e-08dd019e468b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG5RUHJLdlEzNlZJbzNabVJiN1dGTlRFakJxc1hKbEk5VlUxUHRldFpOQUlV?=
 =?utf-8?B?SXVFdGRIbzNveWFGZzU1YVgrSU80WXZCY3p2TXE1aWJnRnRvUmluY0tkWnZJ?=
 =?utf-8?B?c1JCUzJWT3Z1WHE5d1o2bWNNUkM1OUs3TSsvYXRVN205dTlyS2lzWk1kQlJ2?=
 =?utf-8?B?YkhWSEhqWFI1SmNuUjU0aVhnV1oyVFRRTGVxWnE1dTErR1BSOUFDd3JvTHc5?=
 =?utf-8?B?eVBESzk3aFZyemVYMW1wcXZMczRSM3RHN1VTMDlyS0ZaL3hneEk2Rm0wSTZT?=
 =?utf-8?B?d2xwZmVOVGwvVGxvNmxsMnphOEQ5TzVDcjRneXQrakpOb05pNG9ucG90STZo?=
 =?utf-8?B?NE0rNXc0dlJjenlGVDlodS85ekdHem16REE1cWQ1VTJNUGtuVGROOXFNL1p5?=
 =?utf-8?B?WHpVTHFrWVZSZC8xRlBXUWN3Q3k4NFIyVDZoSy9yRkpCZDFJbTQrdkpJajNx?=
 =?utf-8?B?alJzUHRmSmxtVkc5cmNVZGpmMHdwRE9qVmNCL2pTTmFpbGtRUHlpaS9JcTRp?=
 =?utf-8?B?UTllMnEwSVRZVVA4RXgxczMwNDVVWVhQSWpWWVVJanhmbTk3MDlEblM2ajAr?=
 =?utf-8?B?T1NzcTJ4RVVMZCtVV245S29ZUWdEa0x0d3RiT0RGaUJkdjZ1R0p4bG5ON1Bl?=
 =?utf-8?B?N1dIaFhIRGdrMmliOExGcnR3OXhjajJKRXNKVFdWWWxMNy8xU3J2TEtvRlNs?=
 =?utf-8?B?WnNsNUNlUzJXWmMzN3I5aFl0MWpIZG9yOFMyZDBqOHcwN1d4OUI1K1k2MEpS?=
 =?utf-8?B?NFFUenRCV2NHVWlmR3JEYkM3b1RYUkFQL3VxL0V1NWc3OXcxYnp3dHFXSXFs?=
 =?utf-8?B?RGRYMk1Yb0VMZGF2aFBLcXU2VWVpMi9XNTNHV0U2Um55OEoyUUNmT25oZlRO?=
 =?utf-8?B?TDEvSjF2alpQd3o5MG1EVDVwOHhxMDY4K05ocmYzS0NON0U5aDhVRGRGT2tQ?=
 =?utf-8?B?VXFucjdLR2Rob2RHR3RxNXVhbE5HTjVURDBsOGZYK3dSa2xYL3NoelgrUUU2?=
 =?utf-8?B?TU9VNW5QU1J5SEZ6TTljSHRzTkc1ekJ4T0xabFpoSmlqQTNveEVtSkJNcmlr?=
 =?utf-8?B?U3l2Wm5ucDE5S2ZONG0zVGJyeEM5MXExVU9XVGQrWmd1SVBYV3ljSGhUUm1T?=
 =?utf-8?B?RDlLVHN1WENWRTVIZGhITVMyb3hWRytmci9pSE9aMVU1aVppdlBKWk5KMHVJ?=
 =?utf-8?B?L1REUDVPYWVERGJtQnh1YUVLZmdXL3JFa0QyRVN1Rkx1MjVINlZXUzNvK2hP?=
 =?utf-8?B?bkRQaWF2ZlB1U0tZakNUMUdMam15QllQRlc4RStNQmxBdWlMTWpzWkQxTGVX?=
 =?utf-8?B?Q3p5cWZMK3d3amQ3YWhCNStVU09iYnZGVlRBSFkvK1FkYUpBb08reG1BMDdN?=
 =?utf-8?B?TytVdmh3YVcrT1pLUk5CeFdPK0FYRkhMWTdKdnhBUDBrbGt4T1FLNVdFVFd6?=
 =?utf-8?B?NnZoUDAvQWt3QmZGMkpmNzNpUURtZkE4M3pDbG5HOTREZC9ibmJkM0pQcjRr?=
 =?utf-8?B?NHdZYTUvbzhuSzJFR0tRYUZsbElVZHl4ZFVTb0V5R3hMVVh1aGtidkE2dU9z?=
 =?utf-8?B?YjA1cE81bk41N1NBNmRRK3g4Q1BIdkI0UGx1RFRHZHl3YVROb0wwS1pkQzIy?=
 =?utf-8?B?Z3ZmOFBXUFFDTGFYU3BsU1hNOFRDYlUwVWoyZkNUK2FNVTM2T3JUNVBGS0hW?=
 =?utf-8?B?MVExVU8yQ2w4SzFqb0c3WldDUXRkZlFlWnlxbE53WEpPdnVLNkplakxkbkhB?=
 =?utf-8?B?WWhXRm14alkyVXlJVmtoN3Z1aWh2cUFaMHJkRkVUMHgwNEg3akQzK2xiVUM0?=
 =?utf-8?B?Q0VZUXVkQytXUVVDQTNLOUYxZXExTDVXRC9zY3JVK1lxRjFTSk1aYUR5UGNV?=
 =?utf-8?B?eUk3bEhYczhsL01QMzZoVXovemI4WnFVbEN0SmgydllEVmc9PQ==?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2024 15:42:25.5523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e46556b4-16dc-4998-1c6e-08dd019e468b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567
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

Add a helper to check if the memory stats is zero, this will be used to
check for memory accounting errors.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
CC: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_file.c | 10 ++++++++++
 include/drm/drm_file.h     |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 714e42b051080..e285fcc28c59c 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -859,6 +859,16 @@ static void print_size(struct drm_printer *p, const char *stat,
 	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
 }
 
+int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
+{
+	return (stats->shared == 0 &&
+		stats->private == 0 &&
+		stats->resident == 0 &&
+		stats->purgeable == 0 &&
+		stats->active == 0);
+}
+EXPORT_SYMBOL(drm_memory_stats_is_zero);
+
 /**
  * drm_print_memory_stats - A helper to print memory stats
  * @p: The printer to print output to
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index ab230d3af138d..7f91e35d027d9 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -477,6 +477,7 @@ struct drm_memory_stats {
 
 enum drm_gem_object_status;
 
+int drm_memory_stats_is_zero(const struct drm_memory_stats *stats);
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-- 
2.34.1

