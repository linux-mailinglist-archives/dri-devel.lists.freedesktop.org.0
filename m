Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F99C86BC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885E610E7CC;
	Thu, 14 Nov 2024 10:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZE/j7YOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6531510E7CC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gM40HjJQLnlniJ5JOpp+N+Uky/w5yeb5lcOWrnL4f87+r8zsxgJKf4SCNaO5Z8sADTi5D5Zr/X3fukCmOY5PoGGlVzIxcMmX/nAbR1hlEl87QcNxsc9cM41PFwk2I+X3wtTzzugU8YnR5s+eY5LMpOW2kGAOhltAkYyNVhi/s85zdm0TlnrthCeDa3A0uKCWxFxcuwuGVX+OJsHhvXuiz/iRqeUKrHyve01Hcgue6ovr98HU/+PLnjSAvyR6j5Y2nH1QdXu472rCzfb/ezDa120sBNNJorEHh8roMVxUaacpoePFSnlMM5m5Z+eGqUhXzLEupmvPYtpazeq9erUn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CT7pBok1+LVJy31/Y3uGkr34gtZwA9XZBX7iD2Da99k=;
 b=nNIrD1U5rvJYEsS6xEuPHF1eKGk9+qVFsedzHP/ghCgyqPDDjGxMN5BFzQlUnSGvHmscDj5tiAhz/hocTnIUM/hSOFVkZD+uSwuSMwQ7UzEeedw0ktp5pz9oB2i8oUUZ41Qj0NqPmzf1aW5hckPmfDqcBIKyYQqDuXdg7b7C+Upj7lOQZmzYHgdDX5kcV3k/oOz14H/ZRVp0/8a9onvRAi8tE1lm+Yol/bNKnlN8KK6PecqSrQjbOVmKTdqgv5m3CjCYPnqGCuqiKYkapW/CXLsoTFlxb0nzump5h8eeeTwQZsHWY7+1UWIGOGm+pPaPNGCATmAlm9ZiVB0je0pOPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT7pBok1+LVJy31/Y3uGkr34gtZwA9XZBX7iD2Da99k=;
 b=ZE/j7YOcOz4NujLfoszA9K9zGxrtDOPBtxNu0j5igu/8f5LKptUmuFTee8qcDFeZEWXxmn+zLUu7vkpE4wpkPp0dZWMtM/hUVrfK29PjlhDWAgFqtwHqnBC2e+QF3y6qmiBQ/vqRjhfAJYavtGPCpvKNH1lokgc6bQvysND2fVc=
Received: from SN6PR01CA0028.prod.exchangelabs.com (2603:10b6:805:b6::41) by
 MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 10:01:46 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::13) by SN6PR01CA0028.outlook.office365.com
 (2603:10b6:805:b6::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Thu, 14 Nov 2024 10:01:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Thu, 14 Nov 2024 10:01:46 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 04:01:38 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>, <l.stach@pengutronix.de>, <matt.coster@imgtec.com>,
 <frank.binns@imgtec.com>, <yuq825@gmail.com>, <robdclark@gmail.com>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <boris.brezillon@collabora.com>,
 <steven.price@arm.com>, <mwen@igalia.com>, <mcanal@igalia.com>,
 <thomas.hellstrom@linux.intel.com>, <tvrtko.ursulin@igalia.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v6 1/7] drm/debugfs: output client_id in in drm_clients_info
Date: Thu, 14 Nov 2024 11:01:04 +0100
Message-ID: <20241114100113.150647-2-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 0485cb01-c6ea-44c5-aad2-08dd04935964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5bOU26PYYqRdBHNv1EFPuwtxx8OXphMtMcsZIOD4jDu8XUUsL+Ri9/mTpcrN?=
 =?us-ascii?Q?GsatY2hQbYNz5XOXcJa8ypPynXNtv4aeUBHZAo3J2rUqSYoS1Y2Sns/d0fLZ?=
 =?us-ascii?Q?0QNCsLPkrKq5+tnwHDoXsK8ZUJ/ZO4Wz/V5OO5O0tj4yHdWfp63qMw2cBsHJ?=
 =?us-ascii?Q?4M0NsMxyPOT5NBwoABnSaoNBGX1PZb3YLJNlu1kdvMtHJkMQTLE3RmmLOF/r?=
 =?us-ascii?Q?6A2gR724X7NQRXUROKVJLAcgbF0LD9NHx9LGNXpl+U22ANijVNBqf4ZS7TpT?=
 =?us-ascii?Q?4wNh8FfhDO4qatObz9A/SQaNU2K6FqIKISx4YK0OIdVjjWU3pK/JzLe4xRcL?=
 =?us-ascii?Q?WCfxjk0LrJda+7xpSfgwsmx+obPS08T1fjddP1jWqjAXekuescUd5a0btRNM?=
 =?us-ascii?Q?m0XjhNf7bmNd0VpqFSJD/whDE4DlIraOmI2mCY1u7rH+PLSOfJ5iHSMYCQjD?=
 =?us-ascii?Q?ruK0XiS4dtIZhjnUuxQRnbxqEMylcN2sz5n2YhOA16vaFP041PKA2iz5NnTi?=
 =?us-ascii?Q?PSigK2TIXa0BhhwajIXHCyYjqet4btSqoYHuo/9SKT5qKYqKYNsGoi6rGwX2?=
 =?us-ascii?Q?kgdpHMHuQYwmgtXnao2EHch6h5Zz7ME4B6F6Rya7kgJlfZu4+LUU7jk4lJdZ?=
 =?us-ascii?Q?NSb3UkdcYqAEaggXykimljkwlt8p2bTXc7/0jX21/L0HdCXTZIDpHg9Ce0BH?=
 =?us-ascii?Q?wVE3kMQcZ2wNH0Z259BwOKGh4/FJhnJyoZALd6pfmavdKE/2nWWOIDSy8Tyh?=
 =?us-ascii?Q?rZpbxtSHve/ATLsPjekYlHsoFe1hu38QPbKP0T7vNQIvvDfVJ3DoBc/kGJXs?=
 =?us-ascii?Q?S2/spS13MyMxGwnWO5N5XOxNPDDr1Ki0HfDOAVQtJpqzlIFJQMswf/Rcxd2+?=
 =?us-ascii?Q?YwxgI/f4XjFkw17w2XJS/lvhLyTAyPlWAoG+wNicRHn6GTd1ZqSUFlPdq4F/?=
 =?us-ascii?Q?cb1WAeyJlFpMHqVE/706guQ02x/YEzYN5DACPrzVzVz3dPoNZhDBfUvi708z?=
 =?us-ascii?Q?N1oGhTuVM6WgWguaGWnwDgvJgZmHXcSPxqHHfj+K+PQjiolw8hx2/AKVlBVG?=
 =?us-ascii?Q?FWIQ2u9AuycD25Bc7nzZn6U0hnUoQmvuhHC46mHJxA0WhEBpy9sWltKPY735?=
 =?us-ascii?Q?c4Dy9lW20ORG5i9BUyzbcj3nCK9FketbZSixVFXvP4vQqgiY+B7A59e+9W4K?=
 =?us-ascii?Q?yOA4pIL8YT/LKuMNnrmvdHRPVtuat4BIl6cNL4ze9XPmBg5UjCVYj6EOU5Cs?=
 =?us-ascii?Q?FX1fBM9ZGJ+ZUfA11WG6g6JUIFkLzfo95XPprK4IjKq3BOXViug6fNTnESez?=
 =?us-ascii?Q?g1D+cAeGLdX2zvUuL47GPPYKFSRZUvfBRaiOw30D1by4fDw0jZ8urHccylC0?=
 =?us-ascii?Q?hHR6I7Vt/nWs61bt001aNOOFZ4hBWtDXhB0CzUwrcKh5XLs0l8Olgy4qMu5/?=
 =?us-ascii?Q?M02Z/2MKAfA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 10:01:46.2170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0485cb01-c6ea-44c5-aad2-08dd04935964
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
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

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 536409a35df4..4c0bd0cb5480 100644
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
+		seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s %20lld\n",
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

