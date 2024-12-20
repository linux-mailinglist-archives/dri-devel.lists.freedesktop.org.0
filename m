Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF39F8B79
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:41:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCEC10EEB1;
	Fri, 20 Dec 2024 04:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V+VUN4rU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190D110EEAF;
 Fri, 20 Dec 2024 04:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+I94YnavLyKE1eTj0phoTJdVmjwjQ6+5m6EhcDNBFJ6SEY4JJdS+PvVWlXf0BQ2QdC0aWXK94njfTkM9HMTiF3fza/4JRPFZW1L2tvSULaSNC1NexhXWv3El+V9xlLJRbcl3M2uHVoQKuYk1Q/Y6+5IvFB9RmfT6WTIxVBVJbtVnEDa+4QxXefuKkieNxlbq7zUZI48nV8V2VCSNtV/+ulb9F2slo3Og8m6NKgvVCwbTFklXlHwMMUbJslpP+pFBckgs5kUyWNrw9HMg0LnoFi4gpPMTQvYDPj4vY11hAUrfn96ItCyg5vJ7dKKv4Z82joVPUc6N4h6/de6NVoMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7BX0/wz/HJhyOCmHrM+dLgF88Sh8tQ9PSsAgUlMX18=;
 b=tvrl3D3c80+mvLLfVMnjDozJYh2xijmpgl+n0vnQWKXrWP62/Ak3/PPykaWev0lRCGMzKPNidg1pT8R7N58fEXCQJAWO1LFjEtglz2lphvP7pzSApYG6cFP3QoztCBouVnIusNsVmlAmktftLz2C2HsqTkn9LjkjOrw99eyGmo0M6tw0AK7h8ID4idk5OK5VPmDKY9+fuLYqNVG1WprxLQNWIuSWVMs86vjOvdJi/Yt3BPQkcsCFqF+U4drGG2ICtXJplqUoDeYQjjC5Rsjr9dGVl1SlBRZlpmwCrbG21PW25BMW3Zq4WLaaQ1XVtYJdnMy9YuReJ5TViLxIIFmIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7BX0/wz/HJhyOCmHrM+dLgF88Sh8tQ9PSsAgUlMX18=;
 b=V+VUN4rUU6Q1peTfpwTHzakSfvaAOpQ6LGHYk+Oj77epTzOvJ0+2AU7L6x5WMyRBmcqTc8eQCNeh9OrYJGzUWF2+CojBdC1qYGFPwiI8ZnuiY1/u2qXEagrqVLIQqSpm0TA+80VNGEivM8vf2icBYicB7QRkHqkz9Gu0jXKF6hI=
Received: from SA1P222CA0134.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::7)
 by SN7PR12MB6689.namprd12.prod.outlook.com (2603:10b6:806:273::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 04:41:37 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::1a) by SA1P222CA0134.outlook.office365.com
 (2603:10b6:806:3c2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 04:41:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:41:37 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:41:35 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 25/45] drm/amd/display: Skip color pipeline initialization for
 cursor plane
Date: Thu, 19 Dec 2024 21:33:31 -0700
Message-ID: <20241220043410.416867-26-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|SN7PR12MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: de1a0377-fdb7-486c-2130-08dd20b096b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bhBJ/Jkbw+yY7R8GcXQfUhTgOPYT2mFanSWZO+XdogVXcGkD54T7II+Y0Afg?=
 =?us-ascii?Q?NORO69PPSMNg33FwOEkWKjmVquM/E4Oqi6kpiRsjfCoHFtVpO+JOHstGQU5R?=
 =?us-ascii?Q?zFO8LE5qEtNdGtqT16sEzZDqqTVfj3fs1jMD0YFaIQ4oVL0mxyAyv9ZJNHYV?=
 =?us-ascii?Q?YCpqPJ/esaFWwq9z3rd7DsC3bp0BjjPlPr59h223dfgORIUt9voFl67NnTqw?=
 =?us-ascii?Q?UxST0ElFlGMiCeYzgAWS93Y+u9vwo3sYFZYc3osr75eproRfUqqRO7h/wuAy?=
 =?us-ascii?Q?+IQ2sxauEzWuCfbTEp3qVkOR+3/Zs76UkoKwVw6dDNWyOktgkUjeaqjXJKgZ?=
 =?us-ascii?Q?uZvNMuTVHshfoChEuS5UgmwoLpykzC/qIFZHaKIXAUrvQ4uKpmJzaa5t1PTf?=
 =?us-ascii?Q?Lp6bF/g0j45/KaR4pU20v6hEteagtHr+bALAdssOBNXidqLgpKbAZ8MlgazJ?=
 =?us-ascii?Q?NVgCJRqzI/1lnB2QTkjkikC/6sD2u4ydDJnGqIRMRrMpoAxheb2/vUTrPXaA?=
 =?us-ascii?Q?+tmxuNH0dop+/7XXBCS2sJZtuO6/7Dwq2Z1CDrl73N71hFvuOCoQFMG2Uh0i?=
 =?us-ascii?Q?pT5qaYhJQVsEsK99fQUdIDdldsGDygbipkbRXGZS+ZUeBdSmtYkl1JCisRdf?=
 =?us-ascii?Q?63tc6HwvM/xRTqJRYly981MTL2gldfvYVkLcO6pVsKENmL90V7J39cm/Zi99?=
 =?us-ascii?Q?GcYu5b/wUAZAg+tw1CvxIRaomUXA+XInEFXZqRzbebe4wZbwpX+t/4zEU9fS?=
 =?us-ascii?Q?2stUA95PQRwOi4S1Yyv38e93drhwVeZR6rSsWfzcF3xmvxxDH6defgoPuJcl?=
 =?us-ascii?Q?NyX5K3zvJJuCafFsE50Y2+69DPltEzezDdX7Q/pjJISJFCyHbvUx0uRGCjFv?=
 =?us-ascii?Q?O6Y2ZETaFcKONn0dUJI24oGWCHp2sPadDiYHmlGFLDr82jtL648/Qsbu20B4?=
 =?us-ascii?Q?Z0U2OP5W8EBwtKmyBz2LEi09So2vRHQp0jASWQ0APcTjIRW/MWXCXoU74pEy?=
 =?us-ascii?Q?tdL+EDq/6xNd/Jaj/Bad7KZ8DhRNn9YtU2vTxIDj8w+rr8Y61rmAMsUzEx+s?=
 =?us-ascii?Q?r9vfineQodzqM3m3d/lfh1tDc6/yjDi6YH2uSzP+1PZj64sbd/NuxNPzTbRO?=
 =?us-ascii?Q?kOPNAuyTWEAUmM793CIoqEXgh3REKw2XuYp6UuIQ06pJLdXKpqDBaBIxq9/E?=
 =?us-ascii?Q?W7SrDNiRS5DBZ/47yCgHBoZmx9Yf7ueLcfX5668KWDS71HCPvNgQwHRVXYb8?=
 =?us-ascii?Q?Vk7vr7nOUpfG32VYy9bPOZcQwiAZB+x6X7B8f4u2QGpK+0U11sz6INrQkfq2?=
 =?us-ascii?Q?o35edKlarAXS+2JzRoeaGQhVE69aIJx7wXFPa0N0POAG4ZTe/ooT9QsqjysD?=
 =?us-ascii?Q?bU8v0aaWnHIKOuFfjkfgUv5TtGeijvdkST/o1cXcGjPc+1GTnmxHOcoeXA3r?=
 =?us-ascii?Q?AkXK+bfw7IAU4bS0ZkNG2g+crFrTUbNWF7gyjF6O/5azoEcLz1HZSPRqIfkZ?=
 =?us-ascii?Q?UBxS8mGbFh2dDoY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:41:37.0548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de1a0377-fdb7-486c-2130-08dd20b096b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6689
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

cursor plane does not need to have color pipeline.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v7:
 - Add a commit messages

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 22ff9a31b592..1bfb9f340c24 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1764,6 +1764,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
 	int len = 0;
 
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return 0;
+
 	/* Create COLOR_PIPELINE property and attach */
 	drm_plane_create_color_pipeline_property(plane, pipelines, len);
 
-- 
2.43.0

