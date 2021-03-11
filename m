Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE694336AAF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 04:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43846E49A;
	Thu, 11 Mar 2021 03:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EE06E49A;
 Thu, 11 Mar 2021 03:29:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiHgTX/ncxMf/BEawrqUPGk4NahiIueI+2slxOiMI7bAItsBiWukLplbwMyz6Q+bX8kqAGHdzHOro0OPb5Qxv36/aEurhpI6Q5oycPi7ygU//TilYRdqOUGqrOMQXBsmK4q6LeLoMrQmnXP0bxec/HNl1DogsgeIEWz1KHpSy2TZcT3fP/jzoya+2o0GzG2/dchodRGn2dJTZgQPsInrQKEqxvb0DsnGnlc+ntt90shY0QMOVlSK1pMamE/Mfzg07zl2DanHfvejvEz1vsI9Ipf1AiR859nTaR6DV9WeQ3ZULghjMEXWguhagrv2P4WvuFrN+3nxtK4zQrsNUlhPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVlzHTB2tYNZumta/OPmVphkkknsR4ZXV9PUB8RYLW8=;
 b=PtWB0oFNw+pBXYklEVWqSXrwtPZRtko8TRqk3od7HVp6bWuOf5lbM2E2Jy3u0c5dXcpEZ4HyIqXTE1Gl0ojTCFNpgA3NyLdxY9uMrGvYKEUeg1eIM3Thm7OJanyxjGplq3tVwjUcND60R/0zcgL+d/UYVGyD0B7DGImFSKPdJm3Z1yYlm/dkYnFNf+yOEF7OVV0k43WB8eWfixHJGJOeAh+1QYJFodKMuPT8ykkbNTdx5BbByS7qpeFBMJvbRFL0mPFwpOfeghXcg2nImFnOsS5za9weMSPqLM1tXX8XtemFv/2PSQXvqUrgR/6lkIM0kwUJSchsQq96kPFHRIpfcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVlzHTB2tYNZumta/OPmVphkkknsR4ZXV9PUB8RYLW8=;
 b=4/6/ZKh1HIWi7fZ+bWFzT95iHxK9gZvyJPHTIkrv9Dkqa6BKMT3kpEuYKlf5oAAf/YFMpHwFAzxS2zif2pDghDfjOsloUpzWIfdfUel32fhCEBVShbwiMyhjgs5m2G43hL1S7hN6Wdqc0hMF3cjgAYopnn4mljzxCCbDOqZUX/w=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM6PR12MB3436.namprd12.prod.outlook.com (2603:10b6:5:11b::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.27; Thu, 11 Mar 2021 03:29:13 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2%5]) with mapi id 15.20.3890.041; Thu, 11 Mar 2021
 03:29:13 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: fix a few compiler warnings
Date: Wed, 10 Mar 2021 21:29:04 -0600
Message-Id: <1615433344-16267-2-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615433344-16267-1-git-send-email-Oak.Zeng@amd.com>
References: <1615433344-16267-1-git-send-email-Oak.Zeng@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::24) To DM6PR12MB4732.namprd12.prod.outlook.com
 (2603:10b6:5:32::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YTOPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.26 via Frontend
 Transport; Thu, 11 Mar 2021 03:29:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7341ca3-73a9-4eeb-542d-08d8e43dd728
X-MS-TrafficTypeDiagnostic: DM6PR12MB3436:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB343646F714CCE1EF27492B3F80909@DM6PR12MB3436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tp2GQZzSYfb47sNv9HFyYm91i56FBDv3VtDT7sGJvaZTYcM2MBwLZUltrq8aN3109+GqFnoup0sWI7WPxllqLchJ/0o7nr88QZCR5HJeyl++mbHUbKjTMRaKdL/hqFEc5861xEExSu6iyxWAK8Ij2hK9cYehkIc3CO0fRGrCPKM8drRVwY2lQmRTNGLYEeJSmOt2uu4vS3/Gdog+SceBGEeHL+3Qpp6BCE9thYXMua6u5CM2r+dultopuKucBoh1aR9R5yeY5BEQdnmmalb1P5OnyRlr31+hWduPJGvitaWEqH9equGqZz+QP+TP+ht7H/XQ5IGXiogUQH6/FkQSQYUqEXswRfIILLIuBfhAVhMoW5F/otEU9nBqQhOTUZD1SfQEh8mJ2diwuaOb1dKvaB3ZNNmJsmVYmbdnKc8V2EnSFYuxIbvmmXwf1nkt7EDnKsmWikImAiyQRAyZ+/S+//5awBvR7L9ZJCP+KWlbvPsWmfXH219CZ6Hq8uK+7SMcO5qiREWo8EF2635+I54eug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(450100002)(16526019)(316002)(186003)(8936002)(5660300002)(2906002)(6486002)(83380400001)(7696005)(52116002)(86362001)(26005)(478600001)(66946007)(66476007)(66556008)(36756003)(6666004)(4326008)(956004)(2616005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?of0WHDDOxQtw58gJNgizrMLfrccRDjjvxCHE6C9/XXUNZIDd18QEEPBBtByS?=
 =?us-ascii?Q?4YRZwbaILT5bOuctsD8zpjhkeSj4Hk5yE3oIQ/9xFz/VKgJJ4hu8nOjR18NN?=
 =?us-ascii?Q?O4jjrGg4h84jRqzVOzoFPNXpKrjocXAL0dvKU+veYvMoAKhhjbJHoY7bzVqE?=
 =?us-ascii?Q?uZCJgeixeHmpgijxfFLuDn67DZiQ6gL+nUwQfKmGAopIPVKlZBB5NmtO1fAe?=
 =?us-ascii?Q?LX8SKGOGB54xtMVDDysOUdZblfVTHoflEuVqdkQIIWMOhpoQge7YPjN0sMOT?=
 =?us-ascii?Q?uI10mWiMMIJkBhAUmuyaJbr3X81O+/85GItrJoCJWE4bJeWaWo4gbC3cmyvd?=
 =?us-ascii?Q?Yp7rzh/k5fiNfFIltbPw+Q9btTJpqJ2E06n/bc6/igb7wamhJs9vgur6gwxx?=
 =?us-ascii?Q?xBxpfWFOom4jv8SrekC/YqutsCW5uW3K3HC3f0JLujRdRHbSdPlH3z6Uhcn0?=
 =?us-ascii?Q?74jWFghYvY0KxMuqh31wEAySpWJmdb/NPHx+2VL19zaEQSyx61IjF/KmdXnC?=
 =?us-ascii?Q?1XrK+xpFPb/Rux8UrLb1mTKre75uqMS7+uDOq+zUOZoPeAG9QJSZBr/0Q8uw?=
 =?us-ascii?Q?eUJsL+F3R9HrE3fjHCkSVL+umRJ8yW04MrB9sDOsUO5XApEl0jjufnqoCwP1?=
 =?us-ascii?Q?WcUqPNDUFBKnalqNthZdmO87gA7d0lTqBcHwTT9rhzLfZ+jw6/e8lihRXJBP?=
 =?us-ascii?Q?uOoJ3/jFWGZRW77jOnPwnZTFU16R++nRBrrPxlJ/7n4QGdH1lZUnULGmQ7qQ?=
 =?us-ascii?Q?BOSCdsYxyUPeJWKgXbmPA8NKerhsPcKgHqAiSsD9uTlnbzgs7JR+vSSDHDy9?=
 =?us-ascii?Q?LHn/UJdu8ejslvlaI0nXvDjzFD5mVnJ/O0ejDSO/tK5ngHO1bvSAVa15Snh9?=
 =?us-ascii?Q?V6NuuoeT4SKJsnee/XxDF9y28b2vnQEpQfL0uZXEIwWAZbyedpgDZPyUnmF9?=
 =?us-ascii?Q?hnCzoc291Txn370FxyjJtZ8EftuyqWmEXfZYIXrjKgza3vmtO2uFnEtQ0P2X?=
 =?us-ascii?Q?ZF2DhVRfJAJDh0UD9y5Tvcvn7nfLkQxIErH7iYLEV+uocms1JWhLcZmvutm0?=
 =?us-ascii?Q?ijblor2EeW0U/afSiLncAYT+9Up1iZUMf8bPqYxMIgC2QkHn9mbSo6hQhuDC?=
 =?us-ascii?Q?kE/Jd4Eb1Z37y3jgUw59VJfbYi4djayClflxoBVHhunKOe+pnAZ9yVKYt1es?=
 =?us-ascii?Q?NK9yxptQgTbswVCg0gwKqGVxoA7oBDzvP3ADkIFuh2GmvSZMW1p04MnjH2ub?=
 =?us-ascii?Q?1EbS3VdVPHmPRgNDU8OrD2YmBkgfyZ8xoT19kGu5QZ32m84SYbSqpSoJHrJX?=
 =?us-ascii?Q?0L1a6bzImQTJ/DFKf45Ibxcv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7341ca3-73a9-4eeb-542d-08d8e43dd728
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 03:29:12.8166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /O0tu+mp1g84oo0RNtgL5P6HDs6lf16cop4JUMK7ngjGlpPlsC4bvhC2UrODsocg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3436
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
Cc: Oak Zeng <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1. make function mmhub_v1_7_setup_vm_pt_regs static
2. indent a if statement

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c
index 3b4193c..8fca72e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_1.c
@@ -88,14 +88,14 @@ int gfxhub_v1_1_get_xgmi_info(struct amdgpu_device *adev)
 		adev->gmc.xgmi.num_physical_nodes = max_region + 1;
 
 		if (adev->gmc.xgmi.num_physical_nodes > max_num_physical_nodes)
-		return -EINVAL;
+			return -EINVAL;
 
 		adev->gmc.xgmi.physical_node_id =
 		REG_GET_FIELD(xgmi_lfb_cntl, MC_VM_XGMI_LFB_CNTL,
 			      PF_LFB_REGION);
 
 		if (adev->gmc.xgmi.physical_node_id > max_physical_node_id)
-		return -EINVAL;
+			return -EINVAL;
 
 		adev->gmc.xgmi.node_segment_size = seg_size;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
index ac74d66..29d7f50 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
@@ -53,7 +53,7 @@ static u64 mmhub_v1_7_get_fb_location(struct amdgpu_device *adev)
 	return base;
 }
 
-void mmhub_v1_7_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmid,
+static void mmhub_v1_7_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmid,
 				uint64_t page_table_base)
 {
 	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_MMHUB_0];
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
