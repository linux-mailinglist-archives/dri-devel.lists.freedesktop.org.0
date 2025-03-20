Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1BDA6A317
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 10:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EEC10E5BC;
	Thu, 20 Mar 2025 09:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rUR1oJOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB3510E5BB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 09:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPLTPODMo5f/OmWqWBc80dtN/MRknc5knCYkO3qmgNzreXw5BEomCY5BOFmnyiE39XRqvS2Uw+QQ91yNueA8rhljh4i9FPTTyhtqkWHS0xMotvqJGmibIy7UXGRBnZ2dZ0q5d6tdzxLPW7Spt/t7wmGZZD8DGL1eSH2JtFNVwhCo8zWL/kHuyb7QOI2TJPOro8K5unLxQPT5ArU4tR42ShzXmUHn5WuuqjE7mCSckg5liJDCfI378qsaOUSOpLeNLuZCHq1KucwSCYIzpnbMVZQnaBEe31sx8C1gxXmYoKaktl+HQ0Y4iW5XVh9sUKrN3Gp5qdwB2qtZ9qviYjkV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXrQTGTzheUF28f7gC2QFrZZOiro9ryAFKLgAhOHx6s=;
 b=q3NDR3F4KdoO+LaEqTSOl1v+Ex3Zr2ct0SaKPkZTyxP2dJP1ahpkYDdDdfkgaHMpSGE6EipctEtEsFxPzMJf5xoJaJ/pXYA7MkfTjtf7oAEYT+B6EIBawRwaYqqc0ezKTrPDT5GXZaAG+6JgL2+jbjT/99jOMKD2mtsjxyQAAYZm8KMMtd0+MswzkxBq5/cKb4VDUoTT/pkpAzzD0XH/sXwjR9IrEI6aVy9aCQ6V08ktVB/vnHeqx0mcj2F6c1Z59JDmfNE0FL+CK0PEZg2eju67lHtRiWSawt1DAed797+xOB8MyPtLPwERyXDUmCQSyvUJKo6DxAYwal93XSmpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXrQTGTzheUF28f7gC2QFrZZOiro9ryAFKLgAhOHx6s=;
 b=rUR1oJOOeD45okCOhVTq6qiFb71rv+g3y4RIyUMM6F280jYJDww1J3ioTsCeEEfxgvLqCIWhrlCpX5e27qDguNqz6U3tCVabHQ3o9AEyilj+BBD5wbqFdXzt7W9HVRqivcsdnkpip2EhHtCKA77osKE6CMWd5RUC14NyFAE45PY=
Received: from IA1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::8)
 by DS0PR12MB6656.namprd12.prod.outlook.com (2603:10b6:8:d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 09:59:28 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:464:cafe::8e) by IA1P220CA0014.outlook.office365.com
 (2603:10b6:208:464::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 09:59:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 09:59:27 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Mar
 2025 04:59:26 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 01/10] drm/debugfs: output client_id in in drm_clients_info
Date: Thu, 20 Mar 2025 10:57:57 +0100
Message-ID: <20250320095818.40622-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250320095818.40622-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|DS0PR12MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ce15b1-b03f-4884-2c01-08dd6795e6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TndzM0ZYNGVzb25tZXdNNFBqUlRscldUQVhabENvaWJ4RTFvbk1BVkNaZVFz?=
 =?utf-8?B?VitiN3g5QmVVSVJYSGhCZTlpaUdnSkJIdFBOaU9nSS9NUFRVSUJBN1ROalhK?=
 =?utf-8?B?aTZCMW14VzIwcGNWUThaWjArVmFNL2hFdDVMTHQ4YzhVRGR4TkNQTXptczFk?=
 =?utf-8?B?bXlzNFpwamgvL2Viai9YWCt1a1Qzb3V3M0ppcElzNldxMGJUVllkWWZnUFo0?=
 =?utf-8?B?ZEs1Y091RE52c25xckE5Nk1YK2Y1N0U4TU93MklFQ3h6MjZkb2JxTG5yaFpo?=
 =?utf-8?B?amFOYUx4MElCY1FwV01pUTZuOFU1dEJkaSt4SnFQMjF5NWtWbitlVmpNTjFz?=
 =?utf-8?B?MWxVUGNiU3A3QVRmNitJMWtNblhjRlEybllmR0kvRHo0T2RUZ2FQUHpXc2Yw?=
 =?utf-8?B?WSs2R1pMcmZ5VkxaSXhvV2dTMVVZSkYvVE5jQ2ZuZCtHNW5qVEVwSmw3RVFG?=
 =?utf-8?B?SnJmemFEYmNZRzV0V0JvY09BYjg2alJ4ZCttZ2FVcUNJRVAyKzRvWVpSVnN4?=
 =?utf-8?B?WmFsdTZPS1pXU0lmbGdBTUo0YXdYVnhVbndpMHp1ZjBjK1B2SjRPc3I4a2gv?=
 =?utf-8?B?dlRjdmxQUHZYYTU2L050UUgzVGx1ZXBpNVZiNWdPTGl3T25TYzZYYkxpY3lk?=
 =?utf-8?B?MUFxV3RhSmpCcEhDc3VtTE5Vb0cxL0UydE01aHRtSmI0dVd4U3B6UEVnemhJ?=
 =?utf-8?B?cjV1VDV2UytxNGV6TEdsNEFBSzhRdkFFMk9kYS96WHh1L1JmNUMxU3RzTWY1?=
 =?utf-8?B?UzYwbTFPSTFlTTRPeStadnN3QlhORDlJS1pJRlJoQWkybFhWMHd3WE1mcVhm?=
 =?utf-8?B?VzBIQmIvNGtkTVIwUlBqTFRtOEFvcVVmTC9sR09FV0Z3MktSb0dITjREZzhE?=
 =?utf-8?B?M3N2QlAvanlvclc5Wnora2lhbVFIbVl0Mit0dWhVV256QS9CejR4THlrWHdS?=
 =?utf-8?B?MWo2UjFtKzRVaXhzNDdRaUdBMGhxcjZmZ3JKRTVaUHNnNlVybVNHbml6RDFL?=
 =?utf-8?B?dHUySTExbXZFQVQxYXIzcXkrcHl6UHMzK2R3ZmIzUUJXZ2Z0T2xIMm1oUlVL?=
 =?utf-8?B?WlJZcm9FUDN0WEZQb2YvR3ZWRlRSR3NzUXJ5a0NGdVEyVDkzZVNBL2d6R3d4?=
 =?utf-8?B?ZlU3bHlMNFdSaFBFT2pzTkg1VDdDdjVnaFo0bmJ1N1RQd1FaS3BjUU1ROVpH?=
 =?utf-8?B?WjlOdlAvVmpzV3VkZm5XbWJkSDhnZHp4QWVIYXRTSmZ0MlNxTVc3ZHZNc3Vq?=
 =?utf-8?B?ZWpHU21WTG1XbCtQcjdRNm5pQ0ZTaWVIOHg3b21maXdCK3AzOWNmQm9heGdj?=
 =?utf-8?B?UnBvcUIyTTdETHdCMGF1YVlHL2ZiamlxSUREQitSbnl6MXRSK1k1YlJOczha?=
 =?utf-8?B?YWFwWER0RFhxUXRmQ1dlZ0szeHZoTmpGUmRhZ0hWUTBSTFh2VUxCRlh1eUVR?=
 =?utf-8?B?UFI4dG9UbE8wVHBONkgzZkp2ZGViK3ZYY01UcDNrWkZWSlFTR1AzUkRieDNq?=
 =?utf-8?B?bE83ZTFWcGc4UlBrZzJLZzBVZnlLb01IYldvc1ZkZWliV0IvWXZzbHIrSnhh?=
 =?utf-8?B?YXI1ZWdxc1psd1NVYUFCeGRhSCtENVJScUlHWDZSVVNBMjZGZm9VcUs1ajB6?=
 =?utf-8?B?ZDhBN2hwcWRxSWhoN1ZYaTArVTlLY0pnWTlkVjNiT21PY2pkaUhXdk5iMitu?=
 =?utf-8?B?NUcxWHVPdksxaEZab1Z4T1J1eU5HVjhwVElMdnRIR1dGdG03QVN2YWYwYzlQ?=
 =?utf-8?B?VGhMSHkwbDd6S3gwS3NHVEw4MXArd25vZXZ3QXcyemQwUnVaYkl4aUlydmNB?=
 =?utf-8?B?NGlTTE1NWlB3cHhoWCtaVkJsQkpUZ09qWjVUWGFTMVBiQWsvdUlZSHVPdlFP?=
 =?utf-8?B?bXhERGFBSWFKRExmeEh4Zk9LWThCa245MmJ6Q05zdW16WEZYaXhBc1NoVmFa?=
 =?utf-8?B?UnVsM0lCQkdzR3lPMURCaXdINkFqaXUrUTd4SElONnhiaUw4RStTTzlpZ0ts?=
 =?utf-8?Q?siNDf2uQn3iJCI7Pe6kHy3wzimvLdA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 09:59:27.9239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ce15b1-b03f-4884-2c01-08dd6795e6fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6656
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

client_id is a unique id used by fdinfo. Having it listed in 'clients'
output means a userspace application can correlate the fields, eg:
given a fdinfo id get the fdinfo name.

Geiven that client_id is a uint64_t, we use a %20llu printf format to
keep the output aligned (20 = digit count of the biggest uint64_t).

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 6b2178864c7e..aed51c8883fd 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -77,14 +77,15 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	kuid_t uid;
 
 	seq_printf(m,
-		   "%20s %5s %3s master a %5s %10s %*s\n",
+		   "%20s %5s %3s master a %5s %10s %*s %20s\n",
 		   "command",
 		   "tgid",
 		   "dev",
 		   "uid",
 		   "magic",
 		   DRM_CLIENT_NAME_MAX_LEN,
-		   "name");
+		   "name",
+		   "id");
 
 	/* dev->filelist is sorted youngest first, but we want to present
 	 * oldest first (i.e. kernel, servers, clients), so walk backwardss.
@@ -100,7 +101,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 		pid = rcu_dereference(priv->pid);
 		task = pid_task(pid, PIDTYPE_TGID);
 		uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
-		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
+		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s %20llu\n",
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(pid),
 			   priv->minor->index,
@@ -109,7 +110,8 @@ static int drm_clients_info(struct seq_file *m, void *data)
 			   from_kuid_munged(seq_user_ns(m), uid),
 			   priv->magic,
 			   DRM_CLIENT_NAME_MAX_LEN,
-			   priv->client_name ? priv->client_name : "<unset>");
+			   priv->client_name ? priv->client_name : "<unset>",
+			   priv->client_id);
 		rcu_read_unlock();
 		mutex_unlock(&priv->client_name_lock);
 	}
-- 
2.43.0

