Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4AD35FF7C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B636E9CD;
	Thu, 15 Apr 2021 01:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FDE6E9B2;
 Thu, 15 Apr 2021 01:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn33I7ZBrBdfNfSmkePhhlh6cmykkyG+zlR6ZzpQfJf1awV8GymW1zr00E86MD4qFZelbrdHeO56hpAsL/9iuTCHvTVUeaAicDvexnzAgy4XnP86avI8zyLJ26xDenxN+HXlITvHD1uIVmpxyKVyDAatpbevEUmeYincCR7raj/ZV68fgePFns183CZIP/VxVX3uORSvm2fIYV3ufW4tRZ+pmPanZq2Y1QvK4q10B59S3y+gTGFg1LV3VjkDCC7xmDBbZ40nQIP1YkPPIqmJmXlMxvpsHqZouHf0qgsMgpnXlhG7IHKCJDhaj58XETh25B/Mg2VrBnugl8IlM82/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvyDCr8572+K2UEase8xCn6mYN49gB0XzWehB9JlPjY=;
 b=UPCnf7rM/UMUZBALKJ04w3YOTnoa/qxO7sZ06LjK4iiT72DJ6fDoXBtEUIesCnkB57cj6MLjDPJxigxDvSJPjzj8jsRZjFi/gfttUjOEbceTxhpdVvOfKMf8du2YRCKK+3Vv7eFajVmZ0iA5Fe9iRzx3lQf3mfJHp3qFmmDk0K3assLyosGd9/x6Izhq+7b3L3W9tjyVKOJ5XMyoHlgrfmGS8ibXkGuobzl1VRkkiVMNvJsEJTNip6tt0aRk5HjLV3jEphSG+MWE54Uf19MkGoKLBMLjmr9TKxSw/k74IMg9n5W3muLeKGwAkE9LPdrkldcN2SOyCOrUJE5jRVv25A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvyDCr8572+K2UEase8xCn6mYN49gB0XzWehB9JlPjY=;
 b=Ua8KSoRP7ZnBilpuz2/ggs9ugSCUkhQIi58nac1nHcvj5RqYTWWlfIgxwLwfk5seuEs4UGqBvdJ4jpmnuQLWVOBon7kvEkHRQZWqUhgqz2djXdg15XruxjmDJfKvGZlUf5zAxjrF7yw/dZLVvfbDcG41hqc3exVC3KI5mkmRf8k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:08 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:08 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 29/34] drm/amdgpu: add svm_bo eviction to enable_signal cb
Date: Wed, 14 Apr 2021 21:23:32 -0400
Message-Id: <20210415012337.1755-30-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34a50bff-a89d-45c7-22bd-08d8ffad2acd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB420849B72FB1FFB61B42876A924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2k2g+cnMLtSfgBH1iZ6cZo+VRQgRzztZ0G5tBrfokJc5d+RBxnbEvAKNuWjzLdJsWHwHCnWLumy+LHUzA34S24z5CiVPHIDMjayXZU4uVdJYb01KA7JSr7eV9KZtCYc4XPRB6SSmlJXYc4IDm14VLyE+daqhcDWry1X/BugVoBOtaa3qSFDNDB2Z3L4quK1icz4Yge5CGrYTO7ybopeiGt6AgqswCNn0vnzabvcKfnn/NhFQ9rwAbm7voOI2dP+N7bWbjHRg87yg5eThPRcPl1jodhprTMuvvVp8O7C06gcWKBC+E4rRwJHz0l1sH+edX094XGF+fGcG+0dYD1QSSppBzhcz0LGP3uN703BoZubszXLhFGzvSl9imRsnUdTxFgXuRTDQ//VqzK/sa1PARdS4UeQ66Bp4cShFvwfpcKRfiXo55QHlQysbt15cfpuukdEjDVLbTT1QCI4PEL2kj40wQh0+BW7WSTQi/1qy/Gib6Ff8QmS876U6H1wpb5hB5CViySmaiIWCO8cRyutVJ9xUvbI2MVgv1pC8ENu6soEufdGm7OuXHkoBnHwD0fxRZlPHJpTzLK54JDkknoO78nQFeyZzlXbh7Hc8tZw+Pkvqfox/Lttmt1xPqxaSeixUGHdI6En/4W8UpT0aQEMSMubhKdvPlAgrVPX91mjoTE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lHPfdWA2YyHg4qsCybt4BIowfro54RgtW994ot+hKopB1A9lv90WPprjjJfL?=
 =?us-ascii?Q?O5VJhiZmrOsbsH10eDdkXSAvJb66MyUBa4NAUCJ6fVJeuOs/YV7WI0YXRDEC?=
 =?us-ascii?Q?LXxUqCfdeNZeP5dHJKPNi1L9IJhQ66b0i+JU5sNuKtgINxVusVBv98RS+Oij?=
 =?us-ascii?Q?Q5logg3BhM9OCzP99lPJg5O3iUrAxZxTCEjB4c8uA5cFQ4/A71Ov6vkSJST9?=
 =?us-ascii?Q?k6OSd/vtTh0v/g3wPn9BRWg/7eOs1KARWbtycylbVZWsqXnDNBCOD9SrsnFe?=
 =?us-ascii?Q?y7SuQsNutUx0WysaNb7Zv67zPv+na5MRwOvuvYOXjqhgVGwdGZbCzOSk5m8N?=
 =?us-ascii?Q?7sKUSaWJ9gBBSzYpru3x/mf+Q+AIym/FV8NxvnNksotyOqYaq3JS7JVZ6XYa?=
 =?us-ascii?Q?nCRpgrhqt7puBoIX1APwGaD+QKWgNPIHxaulS5uqpG1ieyRRZrdLwXi00JgM?=
 =?us-ascii?Q?jGhBc/UNbTJesqwmAogNYcli/tFqupTjIlNpesYQlrgcPVwFaT0uEwvqmhcT?=
 =?us-ascii?Q?+LAKsRA9tTVGEb83qJp8jDkTPvbOCz1cQKuZFXCZgsXzQEL/Kww2flzkYv1a?=
 =?us-ascii?Q?TbvtVMKdtCsp0So8J1mD77zata7TzCjqUdWh90Tcx/oMo79PmEqJZMcuboaP?=
 =?us-ascii?Q?RkwghtO7bK0Awaeq4MCr7DbN4Pkhh3ilU6yteY1xisJpXTEOQTqQQ6gESsAm?=
 =?us-ascii?Q?1yFKlD+yn2NFHrW1uF7SoaZuj6aNROgorWy0igXlpqNI5ttMEzyA23xENpsz?=
 =?us-ascii?Q?R+bePyEO49O4oGzJNIhEYqvnsEgZXgkYEiQbRAH9L8iW6V+4IjsSh0TschKJ?=
 =?us-ascii?Q?pp2fE/OSy6vGhDYlMBXUZBlSFwGu3L4t96zqvoEcQ6rGBntPOP3idpozBIoR?=
 =?us-ascii?Q?B6xl+e16WR+drxgkjjBrky+GfWtakcxSy92+B3kkbNZFyzR6aThwxAwI20pO?=
 =?us-ascii?Q?pwe3lUOQdao3MjW0MIekecUkR4T+tzMsHy7fKOeepGkLtge7t7NrHUyqxR5q?=
 =?us-ascii?Q?UMeZc4lTq3lnRn0s9Erf+tPqMMYMT9jFzGbg1jiD6mxyh6vRFkllapVZUxbN?=
 =?us-ascii?Q?kt1PK15rkuZvw5UJBR7iHBwMJqeepWHO+RwS2XBwSgWUgBWI3hsRvWmSl/np?=
 =?us-ascii?Q?bQ8HI0yBU88RjoceHXjqwsJH6jTUdPZrCTm/CxzCl6BSstgDTMnRouVHR4xG?=
 =?us-ascii?Q?6XEjJ/fyGQxEf2MtEXCGzZEmRzMWlMMF9ucT9ekgI42HQWyU7agiBag49uMx?=
 =?us-ascii?Q?T8n02kZkCHBESOsu7jOpQIwAi7cmzA/n6mC/t9o4NBBA3rMIpb1PRQoFohsR?=
 =?us-ascii?Q?279/iNc/9uOTC8/WZikeuxtn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a50bff-a89d-45c7-22bd-08d8ffad2acd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:08.7179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyAlJJk4maSd1fuw7RTT71nCqBgsMwCouZ3NfHkwMXe3CLN1R9hefhep1aJ9H/2AUM9VHjYujFkd2TjVUkzXxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Add to amdgpu_amdkfd_fence.enable_signal callback, support
for svm_bo fence eviction.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 53559643c712..1fe233cddb20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -28,6 +28,7 @@
 #include <linux/slab.h>
 #include <linux/sched/mm.h>
 #include "amdgpu_amdkfd.h"
+#include "kfd_svm.h"
 
 static const struct dma_fence_ops amdkfd_fence_ops;
 static atomic_t fence_seq = ATOMIC_INIT(0);
@@ -123,9 +124,13 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 	if (dma_fence_is_signaled(f))
 		return true;
 
-	if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
-		return true;
-
+	if (!fence->svm_bo) {
+		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
+			return true;
+	} else {
+		if (!svm_range_schedule_evict_svm_bo(fence))
+			return true;
+	}
 	return false;
 }
 
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
