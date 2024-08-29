Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F7965222
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 23:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FB810E746;
	Thu, 29 Aug 2024 21:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yjmGytt6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0938110E746
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 21:38:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vE23i0/XUhj0t/2nPij2YYCoyiEDcXEuDTOduF4fZlKp+lKfkPEX6vl3WphLvpP+yWImHQbAl1Ju7xECwhKcaXf4zemxCQnAdi/O1OTCWRCHWFOmNpcoT38fAV9DGJkkq/L/QzmyZr8cjINcRUK5nUKEVSxsHiYD/FDctcr9N+G5njpH1YY9RnPcYQZ2+mSbAydpAz73BnYV3AWp10omcFAJ+ZorOX79a8RARfhH0U89cmUuu/t3grCQem/6LNWdek9MmrMljdtC2RYyBJid7TOKxg9axWyILQ12qDttrTeBZ+GmtDHPWBp6P+nd0nYn+s2GLvJZ7Vv/NRjTxVPyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsPugdNJS3JzMR9JqLvKAlsTC6lYE9nPkOTVtrv/wnM=;
 b=JYZLfj77eDZCyryDUn4Dt/SKFzGTAWx4JmBIiR13/KYnHXrclc+xogCOljPfDFZCCfcrHKS12zwIu0kFzz4Ezg3kxl0xdh2i90sJgsZBq+IzNi59nOBnSusK3rI2VUoGlWkQo+gOPwRe4LpUrvWnQMp+ucfuBoZ6PLAOWfuwvkG5Yli5bnYU8tsEGBL12+roRMN1/Jy1igxzSscvLubJiqRajlQMq1xSoGKWXAAybo1OW3X2enj+Q4+FDbTMwS9MQ8CdBkVqmujfWRaoI3uzDZfjj3iSJqP1XVbMewT/iMaAkSyklQbS/H6lrPhF3O+jH+9bM0LXSEfothmksD+svA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsPugdNJS3JzMR9JqLvKAlsTC6lYE9nPkOTVtrv/wnM=;
 b=yjmGytt6p5GnZV7bzCcjQiksb/cySP4dJKVWyqhivZbmILKPDeH8d8pX1E/jPp7aoEQkYu4mmyij878srYTTefb4rvICcKfydDwNS3/Lxqa776WPXKwx/YZkxQKFgfPwEzmj4YaPEQr8mDLexaq48d3vjqMsTo0eJpK4S10UdOM=
Received: from PH0PR07CA0034.namprd07.prod.outlook.com (2603:10b6:510:e::9) by
 DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Thu, 29 Aug 2024 21:38:51 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:e:cafe::1b) by PH0PR07CA0034.outlook.office365.com
 (2603:10b6:510:e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 21:38:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 21:38:50 +0000
Received: from work-495456.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 16:38:48 -0500
From: James Zhu <James.Zhu@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, <christian.koenig@amd.com>,
 <daniel.vetter@ffwll.ch>, <epilmore@gigaio.com>, <jamesz@amd.com>
Subject: [PATCH v2] drm: register more drm device nodes
Date: Thu, 29 Aug 2024 17:37:30 -0400
Message-ID: <20240829213730.308885-1-James.Zhu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530153439.4331-1-James.Zhu@amd.com>
References: <20240530153439.4331-1-James.Zhu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: f4eb4a27-afc3-4927-7559-08dcc872f8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HonQXlTA/tt3m4OViod2VTm9rlzS0AKYeG/+X6DUaCxOoT+9PJ9dImTCK/AQ?=
 =?us-ascii?Q?X9likV8SQl73gbwtORdPdgK2B75i5jbxLvakb1NwMEb0njq2O3VypZfSBy3R?=
 =?us-ascii?Q?e+xsTgEvNnto9BBlYhCzPmFv383QSqg/qZkoGCAYf2d2vi6vLwJDw1+iu1Ga?=
 =?us-ascii?Q?CTxz6+3b3dY3Ap75eDNaZK3b81oBvI+V9bHAHyAACYyhKY8oc7GqPGYa8s1O?=
 =?us-ascii?Q?F+VSnis6LxDzk0vFVmg8ihBmrCb4QYgqVxxOKl69+YcF69Va6DI+GyMd1IJU?=
 =?us-ascii?Q?EV6k8CcXCYKAfGm75fs6Yfh+VW5Ce0kfVOCJ32nyEHXvUkgOISdvAphtp8yB?=
 =?us-ascii?Q?9bkbL4L/WwYtGatNDGNL26HsdaMeX/dGRNP4w/NtaPScIX7wnqzwwVPixMtb?=
 =?us-ascii?Q?Q2g3Jf78BvZ0vFY6ngbJ6zvbQ7UNTqTFHe6igkjo7bBYcTvAEdOXfklCU7jk?=
 =?us-ascii?Q?g2rXoQCUkEdnLIW069E3oZi9a5vpMxdNwfYr0mM8d0cCedVbN/1bJEpz009b?=
 =?us-ascii?Q?xlNWEGyP73TEDYr5o6K1hXu7oH2rPFDi+6edbwjEj2nQdLEzelztIGuLMx+2?=
 =?us-ascii?Q?/OJblMCTDR1xItiBQPALNRZu1zFqNCq3vdKMuMM23EkaVCoDmZIzX/p0qt57?=
 =?us-ascii?Q?UJuxWXJvxoS5R/5YAtYcghVwadTV4OKctxAxl6mWk+jYO/AZINl1yiWPf4Mq?=
 =?us-ascii?Q?bDQ6IysD8FiDR+ZBuZlpawSarkcKuEExJOY8zxQuNVsChYXFNzuAmdQF4nd4?=
 =?us-ascii?Q?6J5mcduC6H7WdbIHLhLqigxIK+cJqNuXesNOyIRRELdhXyw/ENu/m1t/EOae?=
 =?us-ascii?Q?m1fDVP+cDKzTXoj8yGsRKkCXUtgJi+p0SKzkLe0jUY9SwoKXZyS5Y8uef1PH?=
 =?us-ascii?Q?f/sD+ANBOS5lGTaPSfHxOcsncEel9gbArFMtmubj0NvSHsXE9ybYARq5EBzO?=
 =?us-ascii?Q?62XvHLo7ui2vk1nQUM9MsrFx+X3w3k6Bp3QY53n2ExR3vlZ6LCZIje5qKX6M?=
 =?us-ascii?Q?J+LSmcMcU2KlL9SFcDwSAEae1k9CGCCpqe9xnOnGy/6i406rGZNkbRCE5BQl?=
 =?us-ascii?Q?hEdNRxibzja6SU14Mg/OSZP57HU/vFz5XWeeqsEyf2Lk/u4JCB+81/ViQLKJ?=
 =?us-ascii?Q?GtaaVAE7gcVyU+Nb3EuwYLb9sogVRopXOYQZJMRhT8+RrmZvc+FWcy3XUwIW?=
 =?us-ascii?Q?UfoOe2STJQof9YwbCGci/BA2XZw1s1z52o2JWjUD59/AqSJiGHCwNFXo5vvB?=
 =?us-ascii?Q?eIfjtWGxjNpHUtI38n3F8fK83bjeL34o5LQ7MRBlsP1RgGE2S/JoLfO0SVSg?=
 =?us-ascii?Q?yROhE3dAODCFnVVXJQdN+u40+FJ9kjh/DZ+leHXvLz5FOLx+4cxpsYVwbNPl?=
 =?us-ascii?Q?+s0OnM82Dfm/Ld083pJQUjc4/4wGO+v1+KxTEFrHZdbxeA36VoHcmVO/c4gB?=
 =?us-ascii?Q?E8e1nng5Uqow5f5PDCDubukWiCxVazZK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 21:38:50.3732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4eb4a27-afc3-4927-7559-08dcc872f8dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672
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

Since the default number 256 can't handle large modern systems
with large numbers of GPUs, specify a more reasonable default.

-v2: update drm_core_exit to unregister more drm device nodes

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/drm_drv.c | 4 ++--
 include/drm/drm_drv.h     | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c..bfc6c18a7a92 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1063,7 +1063,7 @@ static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
 	accel_core_exit();
-	unregister_chrdev(DRM_MAJOR, "drm");
+	__unregister_chrdev(DRM_MAJOR, 0, DRM_CHRDEV_MAX, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
 	idr_destroy(&drm_minors_idr);
@@ -1086,7 +1086,7 @@ static int __init drm_core_init(void)
 
 	drm_debugfs_root = debugfs_create_dir("dri", NULL);
 
-	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
+	ret = __register_chrdev(DRM_MAJOR, 0, DRM_CHRDEV_MAX, "drm", &drm_stub_fops);
 	if (ret < 0)
 		goto error;
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 8878260d7529..8a2da92f02b7 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -45,6 +45,8 @@ struct drm_mode_create_dumb;
 struct drm_printer;
 struct sg_table;
 
+#define DRM_CHRDEV_MAX                1024
+
 /**
  * enum drm_driver_feature - feature flags
  *
-- 
2.34.1

