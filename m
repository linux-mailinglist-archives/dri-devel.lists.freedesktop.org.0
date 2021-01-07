Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C32EC889
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D457B6E3F2;
	Thu,  7 Jan 2021 03:02:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49ED76E3F2;
 Thu,  7 Jan 2021 03:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dw7O7OrDCvD57p0SaXj1StCKIsZNoWIZODnzlYizn5K9hA0OGmU8PH1ozBvwu6JK/z1vlaa13lfmMykSnoEnS4DGvuuHryzLb4lq0wZ3651uQkzQBbWElkXaTlHblMpRsrzsIm0KZz6gdJ5eDBh5WTG+cSY49zk5PHL858n1iDaIJOmcer5M/96Akws6rakZxGZAkZbB2EkBahEc5IGFoRw4iJisKOuFSWAJO4t7OZV+MmKLoZm4u0CybaV8ef0AGocSeOu/BPKwKR86Wj5upPlnjDOYDO/mhn17bygro4uRv3aHHf3vKOoNSHPT3ykw+bXjiGpzQ00d6NGrlvvLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7vmTZXZgFHJK1cdhsrT6y1QKtM4cVTBZDLDe8x7K7I=;
 b=L/jhCh/W2rsLMoywQdhYBFv5+dHAtPSoUe75rBuAMSjGcHqY90x6Z95I40TK7vSfu+OvUoA7rQ/dsgh0LEwts0YSX2OYFVfoJbFjlQgky0iYFqRFRtOCXqfhsf1qRueZ7NhmV/GCBF+rfaf+jLYT6UqFLiJE9PoaODWMNi8g3iOjGr5kUMGDdsSf4WOzddZS2a9Sbl9wmWRpIAOPV/64q9xZzFPssWhw3dBc5V/6V0aHRUY4eSfVFcTAxfsl72e4dG+gBy2TydG4SlIZ+LQeaTYxos3GmEEgSyVk59gdemBJvCMOnuK5Ma7yYrfwIUjYYx+Jf7lkSew0YWY+ib7KRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7vmTZXZgFHJK1cdhsrT6y1QKtM4cVTBZDLDe8x7K7I=;
 b=qW4K7Yf1nLjO2ZjqqysG+jxfJYnznf8jBokhatNOTVNW6N9MDDPiAewK1AuK7Ss9V7+CverUzOtdDQZhX7Zphr+JGcFLlJXGqrPAFdQBg3XFUgcidqWV5Ho+BB+zwTDSuyzo/tCUgDveZ88CcIsuprqXbeGyLJlJhPYh7aamKeQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:49 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:49 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/35] drm/amdkfd: Add SVM API support capability bits
Date: Wed,  6 Jan 2021 22:00:57 -0500
Message-Id: <20210107030127.20393-6-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 54cfd3f9-cd12-414e-2091-08d8b2b8b74b
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39999274448F4AD5D38D6FA992AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFnBTWlc+RpGZ1bGiS91Q4kJ4gn4F6NAFuNxC3Q0Qo+tlXOtrklaRpqCjIxam4Py1WCR8Vq/53ok0G3vBvJmh6RH0XxacT4PfNVjfVTD37iapzZQU3XNX5v7b1EI/2drtufqPAsq8s3KQT98FtKORyE/z9wd/cV0CgJ4BJXNsIQ4mVP0NAazrD88xwBjIAHt/z6O1WuKsPk7T3+lQWwHLxWSjxZsOaIAp1e8Zi0hCZUV3JyKq9uSbELCL9JH0Kt1FJ5LQX+uRkewAuVHNc47vnJ8v+Gny3fQxfiVOt9a8noaNwWBzrOddVInVOZHrH+I3WrilfNdTFO4Vjt5rdd6/UAj2sjayLsz5ReUtce9n2VMM+xN9dIG9rJ/IejgISxXBWEpig4APUA5j3TKbACWyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6uxi9hteJGwpc1/1OkJAtQLSLpImG1hW77fYPk/7h2Eu49JZ5M3xY/rK6Ezj?=
 =?us-ascii?Q?TEgiUbAFsHX9yevZ7HKeGCTRVs1l4bJBK52COUQBIJs67cl5F2xCBdrj86NN?=
 =?us-ascii?Q?4iEBc0jn+zIPqZg6yVXw6f0QB6CDWW+jDsasBhEMj6sbv71zAqBoF8XKud+w?=
 =?us-ascii?Q?GZI0CifuQb8eDAanyFjiXfanzpg2PgReRf1zgmOqgUBHcJwDjHIoussaMRHy?=
 =?us-ascii?Q?rHMiTWmKRvFdDj25BRqF5iijsM48VvAlh+GDHly3aEIRRetao6N85oBctGI6?=
 =?us-ascii?Q?GUQnCUjNwT+4ONs0gDerr+9xftPI90GbGQQ6P940k2VM8WdNLX1fq9BLJtZD?=
 =?us-ascii?Q?R3H0VB6lDR+xGHMMNuuHClnPBIClaqSMVlrm8iNdRVPLSJ3SAuty2QS80YqA?=
 =?us-ascii?Q?e+vGREFBLexXpy2aCn6zZ8oHOqcAd/r/GVxLR7rn3wArN+CgVFXg9WfRKmnU?=
 =?us-ascii?Q?NscIAKxKc31uUNVz8EW0FlVDNsx1SGtfkV4CexLBfb+A6zpxvb4fROHNqZic?=
 =?us-ascii?Q?ykHPX/Ek1EbBeVUAOBdf4OVe+YX+u4kDDT+lGqk3Vz/xyhvBgnBZSpoYpdxc?=
 =?us-ascii?Q?PtkuPe59suKinznp4a8z9OUccrY02qYJ9uGqwpze1IXre+HLJ7RqoltPV3G8?=
 =?us-ascii?Q?iKObb4NLqDf9lYrQcRJtlyq720wXpD6TFHP/XeUYPmfji0flp7nKEOKBV/Ai?=
 =?us-ascii?Q?Q1IPewfp9OMw/tRd0lW2HUETj4hAMbk/FKvJeRManjX5e90f+UdzS3Wz7t7e?=
 =?us-ascii?Q?3V+n6I/LkNc7z54Ewmb9AIqYC20D5SjqXbxikQIWa9gmqJ6bne+dKs5qfKM8?=
 =?us-ascii?Q?jBXJN0WKJK7vvjOpoEZtkvF87nf0h8KQotAe1cp4CMQzNCzfXdsPzsm+DXXN?=
 =?us-ascii?Q?prMUzdgNpfDbo/IWhdqxaVn89mRkQAym1UNlI6SaRquf6BmRizWu8hZO+wGd?=
 =?us-ascii?Q?lm9kro0fGZfEAb3JWETWv4aoaF4WVrugCzPAXdTBWHpYY/E0aT8gPVbcCDw8?=
 =?us-ascii?Q?8lDy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:49.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cfd3f9-cd12-414e-2091-08d8b2b8b74b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oqbqdnCNVIgeEBiBQ0hFSkbUzEyIkphdCuo85sEqQuB+YD0w+yN19j7ZCPomo7npVs4cp2O0+fZOnFq7sHwQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

SVMAPISupported property added to HSA_CAPABILITY, the value match
HSA_CAPABILITY defined in Thunk spec:

SVMAPISupported: it will not be supported on older kernels that don't
have HMM or on GFXv8 or older GPUs without support for 48-bit virtual
addresses.

CoherentHostAccess property added to HSA_MEMORYPROPERTY, the value match
HSA_MEMORYPROPERTY defined in Thunk spec:

CoherentHostAccess: whether or not device memory can be coherently
accessed by the host CPU.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index a3fc23873819..885b8a071717 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1380,6 +1380,7 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 		dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
 			HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
 			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
+		dev->node_props.capability |= HSA_CAP_SVMAPI_SUPPORTED;
 		break;
 	default:
 		WARN(1, "Unexpected ASIC family %u",
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index 326d9b26b7aa..7c5ea9b4b9d9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -52,8 +52,9 @@
 #define HSA_CAP_RASEVENTNOTIFY			0x00200000
 #define HSA_CAP_ASIC_REVISION_MASK		0x03c00000
 #define HSA_CAP_ASIC_REVISION_SHIFT		22
+#define HSA_CAP_SVMAPI_SUPPORTED		0x04000000
 
-#define HSA_CAP_RESERVED			0xfc078000
+#define HSA_CAP_RESERVED			0xf8078000
 
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
