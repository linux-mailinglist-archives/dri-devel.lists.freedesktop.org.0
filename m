Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A2343F48
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7372B6E3FC;
	Mon, 22 Mar 2021 11:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BF06E342;
 Mon, 22 Mar 2021 11:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4bkjw6HIj+aFgkLjbD3T0cJYvrdCWTz6Jnzqm6Ptr/BNTzrTLnpQmSH2X1D6o6L3DorGJ/S4BXvQX0kNzd32S7Y3acbSy/fmdtKi0m3CThQQo65T9KjjxZwX3pTyAzR4MR1pv5BgB5CMd0wGaSlNE8MCkcCW8fUj+oLi+QrG5bFdT8r5gETC7410LMANIaBm0n0GA8iWj43KP96UOhkNBPFbtRmyXpPYDXrIKkbN6hbarE4dSQdonRc59keDhr8K9jBMYrWll0Vyd1zytVGuLUKegQtlQNiFdVCcbBx+FcXbTTjcHeWHfKmoADHq09PedM8iE+WXDk9lF0BuVjXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2W3r3ZCMp2kGUfBRMwtw+bbMRnIEZgpjqnr05kcOA4=;
 b=oSyMzRE7DMY0c1H8rAKaAB48jf6RM1f8iqg9lVnLL0CyjxMCV1ShWMkkB+d1RsJB4fcedTu3fj9u3CYbWsrXM4IuUXI27zpa5UY9sabGQYfLcauFRVeskfEybOwLM4wDKSmMb1LinGMlGesAvuDGrhwqtiuWE0x5Zd7sI0CMgEMX+qUtzybg1gPNJ3nQa3bvzBCITT9YzK1cX8lQ3zLh/4F0z7q/Z0XF8YCXtWf5//9p1EGXOqAU/irLQwrOekx7fTp3mbvgcDEyEGVIACf+3A3KDJmxnEG+o00y0PT9bXTY9Rwq8b3XZ2UOaso4yr8Mkvnd37cWvstuHn51aPQ+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2W3r3ZCMp2kGUfBRMwtw+bbMRnIEZgpjqnr05kcOA4=;
 b=pvsrwhpKfX0V6SG9SuF/CZL9ekp856kbtGpmq4xZbFvNjDIbnlcu6+v9OJUMYZOT02l451AjGj2tUDpRS5e4NIgknS+6AqpzuzSstBKm5UsYqLq4QeSNvkGF7GqU8Zwqg1NdFVSDfzjN7GhHrcgLf7olWJLekQj28CoKgpjmBcA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 11:08:17 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:08:17 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 33/44] drm/amdkfd: Add SVM API support capability bits
Date: Mon, 22 Mar 2021 06:58:49 -0400
Message-Id: <20210322105900.14068-34-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a077ba7-91fa-40ed-76af-08d8ed22b9aa
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42558F219C2E1C29B28CB9BE92659@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3oL+bN/vO/+xjA8bE5dkfel5dmqi8ELit+GYckavhM8hiX3GO8CKF3CrOJE5Okx1Dkj0U0VBKIPdX7MdoIsle6bkuzvwgXTixcXFkELBUPyKRxM2wI+zkVTlTZEyaEUXCMVCh3Wa/A3NCWDPozLx/mU6FEzyXSN12lIfL5PAMMHFyBwAToPqEP+At3q/CjASJB2CwcO11JVF82vll6iJWknaQurvESpqkhdcC9Qoj5kvTilTWVfwbVC8meLMzQ9anS/YvvfLNrRpwRQEWYFucdjBk6n/nw8cDFD7ry+FHMW5peT0+VCmFdfvConGSbLRFFDXSapz3i7UyjI/4eOUutlGDvYO0T0t5vyquBRuohsKP9zHOSv1BukmgqhMeKarz4oewcCc9wFNX7oQKVxgHK9DHjShUvwDWoBrU0WTUTrfGfwJ6U8Nf2QPCFHEXc2CzttcXGX3ZwUF7fakY6LPssbo2cL0ZyeHN5ewx/rTLHz3AQHcpT/BsPQSEVs26iHfKy5YNmHxR5I4rUiCWI8qaB/7KNarz+n+0ygM2oFjb1eznz6uKBT6AmwiT4tbibfH7oD9DA+SO07/NInMz2Sojm5fE/9hHZERcvU5P0lbyNxjOic6LYDSNO0zO5smhXG3gedytoFLeh+Lpn0sRSO3h+Cfej1I2qdhMk5Wmekcre4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(4326008)(450100002)(1076003)(36756003)(38100700001)(66946007)(83380400001)(66556008)(66476007)(5660300002)(16526019)(186003)(8676002)(26005)(7696005)(52116002)(86362001)(478600001)(8936002)(2616005)(956004)(6486002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Z+Efho5K04dp3hrqUC87Dm+NUUU2WbnNaWkQWVsNTOaRdAM00Uz+mOR0KWpd?=
 =?us-ascii?Q?oP60GKFafle9vucMMgr51rKFiL/sTbezTQMmKrnOsr3oS3Rp/mfqm6NoIkVe?=
 =?us-ascii?Q?B1VWInQr562qno4y0V39wC+QumDHSuww257gJKVFq5wAtuUsAUsjXIY24hwe?=
 =?us-ascii?Q?/GJMG59RqE42X/Urs10UzEVZzL2dsyJBLYgNud/cLCa4BiolOlnoro5Vwaha?=
 =?us-ascii?Q?iV4pr+0Vgeo1ch2xUsrL7kdpIfj2OnOIJKdtHQ6hRMlYOGxB1a4MLG1tz0Dk?=
 =?us-ascii?Q?hpVcBpNy7mn4uKE5DYx6AEXi0xaNs1Ju27EMui/Nf5nvV5QtYuGLkrsrnj+E?=
 =?us-ascii?Q?I0U/jvvpxXTdBNFAR/FCMbImaa4xtm7MvLTNBpsfFShdLwi1rQnlQS8EivkU?=
 =?us-ascii?Q?ml9pjDnjnNeYfaCtMQ0pTMkXL6xr5x8P6khiRvs16PS38BFRArY2HrtYO4Gc?=
 =?us-ascii?Q?VDR2t17T2S7FrdW1tREhOdfgn7n4abU8LiQdEdnZqYedPt2O9lx1QdKyrIde?=
 =?us-ascii?Q?n6eJzIUwJJTJcBpGjuCdjpEU8utE+mF+7AwzcLe+nbBubD6p7uEHEXhrFH4Y?=
 =?us-ascii?Q?BOwwFjAdIBBC07rGAfnOfZFM+Oho09w9kQJuEnRvLymF5+e5wA5lfL5D+wvB?=
 =?us-ascii?Q?VHNh+j8iKLbdmKJT+kGs0Gau7XoiPYcphuDQa7EE1ow5VjIP8cb+vqUUPbX8?=
 =?us-ascii?Q?c/TF2f3PdQJMxtvF4b2qeFn8f+j72Y/uj2w4t7NNR5iPIjYALn73wYOfYXWN?=
 =?us-ascii?Q?+PVCEp2xY6O12qvYjENnx6srk30bBXixUdXrrA9VcGOkhBF2wfWUFVb782+v?=
 =?us-ascii?Q?/GgjbfU7+uNDRU7iD1vvkL+Dk+SPq/v3nCHUP8k4oiDMvgU+lOYQ0QhEncb1?=
 =?us-ascii?Q?g1xz+MBnrf0INFiihAM3spQ6WGJHKluC0czxohf1ijjFot5TGXdd+4UzInRj?=
 =?us-ascii?Q?DZXqdDchQsIDWEoByFXuLiX3ljEfv/Sd2enrmuIVoWMxB4/gAxbJtneZw5pf?=
 =?us-ascii?Q?UDAaJtnx5o8ipR31F6QCH56gcMZc934sQS9aZImCKPvz4i8V8mwFxlp1Km0k?=
 =?us-ascii?Q?MGp4DWHNEqJTpy7+APFrXsYiOOXEp7hAOZoHr9bO2AJuyCyjFvdvUsJvnZjc?=
 =?us-ascii?Q?RXKKEQkuTJnZ19crkAgBqCITeDcqfF/+KT83hUv1Q3dkl2Fi/I21EauDqAAU?=
 =?us-ascii?Q?PeExk6L4jq3lG6QpC5FkVqlEZI8MsbudjI3i/oUhdDSZOV7lJryRNtC7ZaKz?=
 =?us-ascii?Q?NtLrsEW+Mum9MhJpkwcBxGEw85SpjegJDyZx9FDo9JlbIMUUCirjGWXZ3QpA?=
 =?us-ascii?Q?p5/mqCUiOSh4xZfwjx/hFlEN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a077ba7-91fa-40ed-76af-08d8ed22b9aa
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:47.4026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fU334iWklLV5jfE91/HvGolSG2OETo9NW3VVQN0aAf2N2blBozHgR66GMwPV9/PjJUpkHsJTYb0gb166WI8vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

SVMAPISupported property added to HSA_CAPABILITY, the value match
HSA_CAPABILITY defined in Thunk spec:

SVMAPISupported: it will not be supported on older kernels that don't
have HMM or on systems with GFXv8 or older GPUs without support for
48-bit virtual addresses.

CoherentHostAccess property added to HSA_MEMORYPROPERTY, the value match
HSA_MEMORYPROPERTY defined in Thunk spec:

CoherentHostAccess: whether or not device memory can be coherently
accessed by the host CPU.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c |  6 ++++++
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 10 ++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index cdef608db4f4..ab9fe854b4d8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1419,6 +1419,12 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 		dev->node_props.capability |= (adev->ras_features != 0) ?
 			HSA_CAP_RASEVENTNOTIFY : 0;
 
+	/* SVM API and HMM page migration work together, device memory type
+	 * is initalized to not 0 when page migration register device memory.
+	 */
+	if (adev->kfd.dev->pgmap.type != 0)
+		dev->node_props.capability |= HSA_CAP_SVMAPI_SUPPORTED;
+
 	kfd_debug_print_topology();
 
 	if (!res)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index b8b68087bd7a..6bd6380b0ee0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -53,8 +53,9 @@
 #define HSA_CAP_ASIC_REVISION_MASK		0x03c00000
 #define HSA_CAP_ASIC_REVISION_SHIFT		22
 #define HSA_CAP_SRAM_EDCSUPPORTED		0x04000000
+#define HSA_CAP_SVMAPI_SUPPORTED		0x08000000
 
-#define HSA_CAP_RESERVED			0xf80f8000
+#define HSA_CAP_RESERVED			0xf00f8000
 
 struct kfd_node_properties {
 	uint64_t hive_id;
@@ -98,9 +99,10 @@ struct kfd_node_properties {
 #define HSA_MEM_HEAP_TYPE_GPU_LDS	4
 #define HSA_MEM_HEAP_TYPE_GPU_SCRATCH	5
 
-#define HSA_MEM_FLAGS_HOT_PLUGGABLE	0x00000001
-#define HSA_MEM_FLAGS_NON_VOLATILE	0x00000002
-#define HSA_MEM_FLAGS_RESERVED		0xfffffffc
+#define HSA_MEM_FLAGS_HOT_PLUGGABLE		0x00000001
+#define HSA_MEM_FLAGS_NON_VOLATILE		0x00000002
+#define HSA_MEM_FLAGS_COHERENTHOSTACCESS	0x00000004
+#define HSA_MEM_FLAGS_RESERVED			0xfffffff8
 
 struct kfd_mem_properties {
 	struct list_head	list;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
