Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA59AC3FC1
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C3410E356;
	Mon, 26 May 2025 12:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AFvufF2s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEA810E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 12:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3S6jmnI2JUzDq2tnSSrxF2L5sPR8O2dwBFkawSCFvUYEhvyUkQJC7Uku8KL7jtyZVQMdLCjSP79gDyY8KQfEn+q9FkBaL4ZcAzGP83QJY4G8enkRWr6B+RCsBGe7plMKwum4WL10FHAJp5Yo0+INVzzzSdW5zPXIKw6BnTzjIFbv22DABIxxu37s/kn/QY80YQv2uIIc//LEyMIr0xb9Ms3Xy132HV0tA1q0AFCgdFAut1Aue6rEKqtx8/j/rEV6jotC5F1ZCoDXiht1iDKcGCIdW/A+vyELrrl9mdf1kQi+LDTgys9EN1QS4qyaWQsuyPBearN6ybR89mR2ronXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YExrLBNmjk0Jky++4o/V4jEROgJRqTpVnrXzJ5VrY0A=;
 b=CREdCOizGhJ2ijE8F+rVWfEczxcLxZFVU/wTBMm0BYxrUkWtQqFdDfnbEKuo0L64csS7HhRfO5dCt84KoIIs05UgWRkyAMYSjmXsAkyEgYHDAdskPbQGHalV1leglTq+WLdurMS09MLmEMZFBByrFUX5SrQTwL7/fvlPzsJL2YiaD8jh8hDaB0EqRIdWNA8/NGx7PKyK4e/NqZZEof1eSfEcXOPg1Ibhe1sYxAWsk+vfXRJvjlx8kLw6AO27JvL32pNXhsGwJdC5TgvXvIUULcCVwI+/NS6IYPSrcWLPuWPrNp6iBlgMIqlKkzvqiWCuE6fsNzNwMe7ITiAT6allTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YExrLBNmjk0Jky++4o/V4jEROgJRqTpVnrXzJ5VrY0A=;
 b=AFvufF2saGJeq8Dg32vb/8LN2OOWJ3lJbx7bRfifje8oC8YsVEZ7GIKoFW8z2DFMVLzm82pCpFspDsZrDln0Mf3ZvsbiL8UQJCHiaw0NA0xWkdwrcP5Polj/z1QGfVKZi9/ccmp695PX5TLGRQ6c/APmCVN3suf4Hzl4Hhpmo/I=
Received: from SJ0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:2c0::7)
 by DM4PR12MB9071.namprd12.prod.outlook.com (2603:10b6:8:bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 12:55:36 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8) by SJ0PR13CA0002.outlook.office365.com
 (2603:10b6:a03:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 12:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:55:35 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 07:55:33 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 01/10] drm/debugfs: Output client_id in in drm_clients_info
Date: Mon, 26 May 2025 14:54:43 +0200
Message-ID: <20250526125505.2360-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250526125505.2360-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|DM4PR12MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0d6a01-f305-4309-ed03-08dd9c549b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDgzeWRRSlk4RXVGUVZEZEIxc2Q2SkVBMTJNNjBFSVlqM0NlamlpWnIxQjd4?=
 =?utf-8?B?NWhzbTdsd0tCUnpQNU9ab2FJME1oTHBNbVZ3bCtRZWxBazlCYksvMDlWQWhj?=
 =?utf-8?B?dEJ4RS9QQU05NlZ5dVIzQ3JodmRHcTQybmhXeVdGc3B2ZzR3YWpxZWZ0UUpv?=
 =?utf-8?B?UzgweE5uVGtmeDRUbzlYV1FQSFB4SkRqcEVzQzlvbkUyMGNuNW02blZUNXRv?=
 =?utf-8?B?Y0tBWXRNQk5DaTFqVkE1MzBhUE5PNlFsbjdrWG9Ec1gxQWlWMkxCd25VaHhn?=
 =?utf-8?B?NDNWYWRwVGQxMFZEdUszZ0JXUWt0Y2ZXRWxoZitLL2lKdHRPb1U1d1Nyd2U4?=
 =?utf-8?B?Q1liZTk2bnJXODNEZUpuaXZHOFovNmpsVTNOUVdGMjlTQmFqZnRlQVJHRjBv?=
 =?utf-8?B?L1ZsMjFxQ3k3YjVHbk1CUmpVK1pFT2xuWjV0NXJiWU1Ibk1BU3FyY25JeGxq?=
 =?utf-8?B?NnE1dHBjQTdkYjlHWTRtekUvNzNmaG51UERGWmVUQzJZQXVkYUlWYloxRXdD?=
 =?utf-8?B?NVQ1c0FuWnRTNzlEUHUzc0h6VjM0ZnIrcnZBM3FnT2Q1aS9jakEwQ2FwVTlo?=
 =?utf-8?B?SGRoM29UU0J1TWJFQUQ1M3Z4SFV3UmRFZHpDbkVLYVRnMmR2MU9wZjZvd3I3?=
 =?utf-8?B?bHZNT1VyRkhOMmdpUGxCNXdUK1pJQWlVQkMwVEQyQXBiaVdPWC9MMGtLNkZv?=
 =?utf-8?B?Z1ZkK3N0bjRseWNjYisrU084N3ErS2lXWEFXZkF0c045OXRrcE1DMzhacmZI?=
 =?utf-8?B?V1ZHcnp4NWxHaS9lQmo2VFhjMm94R1Bja295c08ycERWdGpFK0ZnWTUwV2R0?=
 =?utf-8?B?UWx5Wm42L3pZdzNKU2tMcEFQZjRFT1dWNlU5cVI0OFZqT3dJVEtSVk92ei81?=
 =?utf-8?B?VUxmb0RwVnRpNmt6ODN2cFNpSjd6aG8zajM1cVF2WnF3Yk9sU05xbnJIWmNX?=
 =?utf-8?B?bnVKWW1vcXlyVTdRckMzV3lQdFlZTHp2SnlJQlh2UU1KVkFaeUQ0QitEOWJG?=
 =?utf-8?B?WDlSaXlTMU9FcXp0KzlDMUtyTkIxMVVkTjRwbncwTStZOE8xMytyK0I1R3lH?=
 =?utf-8?B?K1oxRUI5S0lza2w2WlVRYzF4OXBWOTlHUVBJR0pnTElGcTI2UWJQOWtxNyt3?=
 =?utf-8?B?RUV0ZkI5YnNNeGtMZzEvRnVzekNSa3d6WWxLV1F2RGdnTm84Q0JNZkExTG94?=
 =?utf-8?B?MVFpTDRqOFFWQkE2cjNXdjJ4bkhLdmZhMGtnNmlacTgxRzhDcldpUU8xZFZF?=
 =?utf-8?B?NkNtOUU2d21HWURTTitNbUdicER5TFNPNzU1eS9HWkN0OWNYWlpLZ09rOXBK?=
 =?utf-8?B?YW9peEZRSlRSaW8vSUk2eVl4bWkwNk5kaGZtTFpKNzkvTGVBQ1YrZWFlQjdo?=
 =?utf-8?B?MjNBQ2RtUEczZ3kvR3g3d1c4TnA3MXR0cmZEejJyeVZ4Mnc1TXcybGNnUWJB?=
 =?utf-8?B?RXNycWgrQ1dPT2twWWVVNUtrNVFBTFBFY3BILzZuMjFHUG1SazB1OVV5anJ2?=
 =?utf-8?B?MHlhVDA1OGtSczBoMUMraXFhY1VpSzN2ZVVKM0N2YW5JYjJCdjkvZ1gvVWxR?=
 =?utf-8?B?RGZnRFN3ZUNFMkVDVDV3K3h6Z2xsNS9vVjdqM21NVXFTU2RTZStlY1NhSmdY?=
 =?utf-8?B?TTN4VHBNQW1KQ1NudTNocUd4bmZHTUdhb0JsaDhFMHZTUWFNQmRHaTJwU3BT?=
 =?utf-8?B?b3VvNEw4aWRHUmkxN3laT1hMN3BqaHFsYkVyM3MrTXF3cmowQXZlWE1TNnUy?=
 =?utf-8?B?V2ZBeWp5cFZlTU42bGl3cDZpOThpckZKK1lRemNCS0pLbXNWU2wvb3JqQnRB?=
 =?utf-8?B?RngzNGhlSTJKM3BySU5jN3pIUHR6ZUx5NzdDaWJ1MytFanVJdHU4TUxYbWpu?=
 =?utf-8?B?NnRjRTE5Z3dSU2QrNnpEUnMwUTg3Z0t5TnY2QW5BK28wdVRXOHJJTHVzVnl4?=
 =?utf-8?B?YjdwdkZKRWpmZHYvU3YwSFVIeVNjcVhlRThOcDh2WHdRc1BDR0F5NWtRS2My?=
 =?utf-8?B?MWpOVXZkUUZ5ZXRTd1VLRjRtQk56dDZhMzZPZUpGVVlVVVlydkpOaHlpZ0hR?=
 =?utf-8?Q?DKrxTr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:55:35.4070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0d6a01-f305-4309-ed03-08dd9c549b6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9071
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
index 3dfd8b34dceb..abceb28b23fc 100644
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

