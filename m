Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A3A9A65E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 10:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CEE10E771;
	Thu, 24 Apr 2025 08:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fcXhxTZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9331510E771
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 08:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHNEdIk4x1nfCpqcRS9Yya4d2nHfKG7xvI619FuDGWok6B6/64V2xfNYwh9h+A5YCN7t9RIsV+ZDOtrMKvaLHKBwd/BUBE3FtDCJhhyTjzHi8sPU/7e8cm3R1Nl6lPo4gHscJIx64QYNvzHcW+giQ5IqKUJLad/7rP91OSPlhQIFXzjxCjUYwtV9arbwUgS5bM/8+4lXdCXjbwPUa6cPXVdVsv9iZWsAbuCMtVhfFINxsC6v98DVvB+8PzqXGQsNMZcqnSFeahza79KWCvBKDBN9CJvMlk8qmhAmKA/MtRTUEPU8gjezzIp0gBDViNZdxlxN6vLRcr/2d/3G4JDndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YExrLBNmjk0Jky++4o/V4jEROgJRqTpVnrXzJ5VrY0A=;
 b=ReBNLYDVisgK7tJrl5kHUX1DruSk6/LzbbJFSR25pzOeQKadjs/+CknwTMxcWaBxdcsY/tewZOZRrokjohHr6OBRRyk7Rof+wihmrG0hexjASaDq6bm8qnqIpqhG/UkF5oWIQk5/e3S/3icahvCRxGKcs8Og/BGoGfa2WQaG3QCzxLHlZcHm3uhDb92NWZN3gKc9/ohZY+tMSINlIbCp2VHPin6JJBqgvFzj3hKBNQVS3N6NcblHgf2hRaqkqP5U+XfnPZRwybvnbM+VnCTTRat4ZSSh7WHx0y09BMpPz5hRa8F59N8PPTjXXRBdWgls4jR8Rd0J8PtBfpm7egbdtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YExrLBNmjk0Jky++4o/V4jEROgJRqTpVnrXzJ5VrY0A=;
 b=fcXhxTZlXO6JVb59zl0TBecGz93jvJ7voJ/vIXMkjzPsuOmKJZnqIxASSLSL2qYpaRWj3AF0KMWMQpohXzO7dLdbqdpUtfX0KHcmHeKfRDREOKNB/09ohDyjKJwvtk1MJ9nh5XpXeq5fuzbhLMSEatR/jT9af/ouGPHEdtf4dB8=
Received: from DM6PR03CA0070.namprd03.prod.outlook.com (2603:10b6:5:100::47)
 by PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 08:40:09 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:5:100:cafe::fb) by DM6PR03CA0070.outlook.office365.com
 (2603:10b6:5:100::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 08:40:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Thu, 24 Apr 2025 08:40:08 +0000
Received: from FRAPPELLOUX01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 03:40:06 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 01/10] drm/debugfs: output client_id in in drm_clients_info
Date: Thu, 24 Apr 2025 10:38:13 +0200
Message-ID: <20250424083834.15518-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|PH8PR12MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: c92efeee-3118-4f41-9a69-08dd830b9eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjV2UnV3TlR0emEyV3pyUXljM2dCS2lpbldUckxUNTBDZnV3aXdVSmpPbmN2?=
 =?utf-8?B?Uis4K2llTk10VzY0aFQ0M2k1NDA5ZS9ja1lTa3BTWDhETS9BM1p3MVFFcktn?=
 =?utf-8?B?WS84QlFYVG40ajB0ZGZROWN6Nngzajg5RjVoNmN0VlFuc0hLTFg1SitWUk9E?=
 =?utf-8?B?aG5LU09Rd3VkUVFYQ1ZJWFNGQVVlSVc2S0IrS2tod2Jwc25OcTRNVG96c1Zs?=
 =?utf-8?B?dTFBRm9za3dqOFdjTzJBQmw3bHRBVlIvaGJ2S2V4cWd6eGVXY0RITTlLVHdR?=
 =?utf-8?B?TldaV1JrRFB0MXVUWGtqZzhDMnduOHhwdm9OUTVta3k3QjNwdWd5Sy9iS1dp?=
 =?utf-8?B?eitkMXliUWxhQ1pDZHlqRlF0WVZxOWtuRVIybUF2eURMdytVZ3FjOHIwdWdx?=
 =?utf-8?B?ZGJYbW53S2s4SjVwMFk2VUJoem5GcXkwbFZzVEwwV1NIZy9obFpuZTNBclp2?=
 =?utf-8?B?ci83S3NuZ0hPd0dzRWVFTEpPSm85dnY3cS82N2dNanNPdEF0NzB0V08rcWRR?=
 =?utf-8?B?SXRJc1RLN3I5NDNiU1BEa3ZlOE9MQlM2czVTZG91aE5Zc0FpOExaZmtTVndX?=
 =?utf-8?B?NWlRYnpEL3A0MEZWNW9abUFpOWx0THduVDE0NHNqRDZUUEFmZUJ1ZkNTR0RT?=
 =?utf-8?B?QkFhZU5tZ2FYNWN5L0NUZnpRRTQ5RmJ3NG5BV29jTEVSVzFyNE5NL3BtTTJR?=
 =?utf-8?B?RndHV01FM0RvUmk5QTNYREF6UzlWUDJ3cXRkWnQySHRycXYrdUdveWcwRXJF?=
 =?utf-8?B?clRFQzZaS0xFMExhT2ltRFBicFk3N3k4UVlWb1FuNFlXTnhDWXY0ek8wcDhB?=
 =?utf-8?B?UVJWdGR2T3YwcERUbWRFZ2tBcDVac1hVOHpGdXAwTmFSOEdXMm1rVDU0Qklu?=
 =?utf-8?B?Z3RZVC8rS0tJUDFaTEJLZUg5K3RqZ2Z3K05vSXoycFp2YWo0bnlkZ3hnaFMz?=
 =?utf-8?B?QzF1VGtuSlFZVUVmemkxaCt3VVFQOWxtQWE3d1NMRUpKR0J2VVBwMDI3azFn?=
 =?utf-8?B?UmJsNExvUXFTTURJc0dlZjY5UWtoNTlWWmIzeURza3Z0Z2RjMy9GcHJsV2Jl?=
 =?utf-8?B?R3pyeTd0NDZnRWJ2TFg2Z1pxOThhWHMyVW50LzF1SXk0c3JHT1B5Ukk3dmtz?=
 =?utf-8?B?cm1BSG9sQVZ1TnhWSENsNjA1YllkWmhaMll1TVJKMjB3TEFZcXQ5UXUxWDN4?=
 =?utf-8?B?T0NYZlY5Qkk3ME80UHJDZW1UUWdDOXhXcWtrY1UrY0VSNVA2RmpENmpYUnha?=
 =?utf-8?B?RWZtNjhKV0tTNXZjRWRSVXBEb3FNVFNTNzYwSTJCUjFVaXdWMXpjVEdwWnlF?=
 =?utf-8?B?QkdVMDh0OW9IR0N0TkZvNlliMlVMK241NCs0VGkwZ1BOMUtVWjh5cUlYMFNR?=
 =?utf-8?B?ZFc2Qi84WVlyMmlqcmpkV0I5azhmbWJlUms4dExIU0RXR2lMTDAzTmFUeDdm?=
 =?utf-8?B?N0IvTjE2cWdqQzltQnJpbVhRUlFPNW5TaXRuOVc0dzJGR2JJZW5GRlkxcldH?=
 =?utf-8?B?WFl5UkJyRThDcGQ3N3hTMU45Q3JGWUtnOWRDQTFha0txcEhTa1dQNDczNkFk?=
 =?utf-8?B?YUpOdHFRdWZqQ0lOa2RpeHBsbFJaNGlaNDFjNk00NitUOWN5bEEvUG5uV2ZI?=
 =?utf-8?B?Z3NMellLai9taXhna2szdmRLUit4bVEzTURPM3RIYWhwbEIrU0trZDFGSUxR?=
 =?utf-8?B?R0J5NUdZTzM2VHpzUzcxSWNTNDEyTWo5dmhIM0R3RVJMSlc3V0xkY2dyc1hk?=
 =?utf-8?B?WnhqblNJa3FDN25WZTYyMUtXanQ4TVZkSVVHMmliVzZRcXhYWkV4RVFiTHU5?=
 =?utf-8?B?TC9za1gzYVVCajJWM3Z2dVBNNHRCNFNkQkNCOUlncWFJK2ptSW9EaXZjNGRK?=
 =?utf-8?B?K2lmekNBTXdmd2pPMnFJbG5pTkU2TXVGa1M3aUI2b0tPZ2NiL1pJOFVDVzJ6?=
 =?utf-8?B?SFJobmpFS29nK0JkTG1tdDFaL0ZzUlQ2K25FRm05SStNWU4zZUxaRDgvZTFu?=
 =?utf-8?B?UnJRUUQrQktlckpPYzNWUFU3bUE4UHNBTzFsNW45cy9iTU5yUlFjUUZTRkNk?=
 =?utf-8?Q?5naasE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 08:40:08.6662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c92efeee-3118-4f41-9a69-08dd830b9eb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721
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

