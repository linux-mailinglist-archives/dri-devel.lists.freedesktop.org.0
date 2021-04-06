Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C6354A51
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DE96E1D7;
	Tue,  6 Apr 2021 01:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E976E1CD;
 Tue,  6 Apr 2021 01:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5J97OkbAI24wahAeRV3OXsQVZZWnuGVhnX+jgSOvBgdzm57h3E81qYeVe7XpZ+wsvO9zDQmc/lMSzce/UvDC2U2e9aWhG7mbtbp8e+hgELDKif89RhsIw8qOEiAg/VuGPv3sMUSb2zeArnyT2B02Q0t4wulfEtwHKqWTN4r7AS3lo2KRxliPwm1r8+lFRErWvpuvq+s41uet7v3mPlnMPhz+HCFMPnSUAWlNAPPGiSoUCR1lWQ1nLXcZYN6SqqZLueoJYV3l4QK9VNMyDEcI1xwJqzEQJWPB1ZkJ0YU6J7dAEwsqDhDIS3XR7BVwEkARkIDVhVv032bAhg91LU6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpD/dGt9IzXaWHrquC7jjnFco++2UBxm86erVLnjDkg=;
 b=lzGXjR6q/cCDzH9Intji/KnBIucXfGGC+DGhXmh+4Z4w10u9Onr6BnQy8OERdTNX9DAKmaQl/OFNLFpsbEBPyP34lRRONjLQoHfbpUSTKEMTLALbzBxDXcfdqXYebpx/+p+7qq/wsDpJRmkRACxro+Uk8IFrdsvR9HjEpU78ubsKiSTUgidnjbMnWuFvCoZZc/AaJlQHQRiGQc9LnfUj6Y7F+sjFg1dkHNwwBSIAGOdknCs3hcwI2FaY3ltyAKOmVqf7fEkplPE6Ije3yGHLFpuW4zkhEWN+Z9W/somxI480RjZCHuM4g5rm1cy+kHX5602m6rs1Yd2k0eZHawmeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpD/dGt9IzXaWHrquC7jjnFco++2UBxm86erVLnjDkg=;
 b=qJ4flBFP0wh1aeDqm79JH36UrMoMyy3W/mBe08dd3d7BHlKAgcOQQcw70lxTs5xY2mojJZ9UJPPunUUmX47mkCzzgxZfVN/h75rN6W9iK09YuxA1vrW3LUOw4h8EY7CLpz92oNQiBOUFshMIjGyvBd/0GmMbmzit0TQ7h/JQYDM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3773.namprd12.prod.outlook.com (2603:10b6:208:164::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:46:53 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:46:53 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/34] drm/amdkfd: helper to convert gpu id and idx
Date: Mon,  5 Apr 2021 21:45:56 -0400
Message-Id: <20210406014629.25141-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:46:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf7933c7-194a-40d7-e35b-08d8f89dda9d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37737908599D773E439BD5C092769@MN2PR12MB3773.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ns3WDn+RXcgknCBk67ec1ZmaYWihccKoJWcpOZuQd1zufYLX79DtoXi5ZpXNIRm16mdbQVA/q9cWzj9ZfyG+joWjT3yB+9pOb+DB+c+dO6toDShdlysSbhEMYOZPjE5GFc1281Iu3Zd3o9YO78mqJHjCqSbewEq5bllLXuwO9bk507Wit1q+6+7FjryyKlHrle3SkVMy4hRi4yrl5nuGdUMzEIUg0dF+ghqmXzrj4lFqeJ9Ix1Lp5zv1LlxjEaJsEC2tHQQAYXyK8aNPY3L/+ngbUNeYtxW/juEMdrJFvFSdZATFwJfAH229V0ftv/xqEBsWoHPBSZ/aIPGEPWR3k7RcDj2Ebo3/9nsKMgvjPaglDckMvfts90RSFvJepzEO6NTuSb+VAloIj8oUjBOHVI/4puAt2hItUgQilV6sC4O/KNKViqLnWIYyL/xBYHGjGsC1ozwE2+L0Sms+ZRJVTFvpr7uXLwOn4tLqnOQV40ZCP0M+iUUPfGy2wpKya+X8ZNoD1vF0Bb5najD/ZxEBNceU+/jkjt/Pi2hjqmQ8pFqhGVyDzQdGO55vnnItj/esdWMQ51r+vvLxrmQEgWbhbuIs4RDMaJF3YeVzIrqburxI7LQbltFeEoUanlEIH776vNtaS/+J+a3SAuRHD89Rsy1HIGMUfeC2b/gmRehC5jQC5Wo69acp3HhRuz8gYhe3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(478600001)(5660300002)(6486002)(316002)(52116002)(66946007)(1076003)(36756003)(2906002)(16526019)(186003)(26005)(450100002)(8676002)(8936002)(86362001)(66556008)(66476007)(4326008)(956004)(2616005)(38100700001)(83380400001)(7696005)(38350700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+e4mWTKXldB/9Jfx37pe9Vk6BRIseG4GKt+DLDSiZIUNHBY391d/rzLAl9u3?=
 =?us-ascii?Q?MMB4OgjKKOE/6NC6CCmSGv2zMXn4xXpC9qpO6aAFxO1NdxvJkPP6zGVtJSrc?=
 =?us-ascii?Q?iQ0T3Z+0hFMIPtxCWDKD2g7CwXoS0ktFVwS9T6ujysuee8PpHYnFgVEEo1NG?=
 =?us-ascii?Q?fTFp10kh6GvvuZFIcywPQhEgAP3A8LY2QcRx+zbgJ3iRMTpConmXLMIFE2gk?=
 =?us-ascii?Q?oJpDbSDay92vgbTDRvo4Bevtoa1cKxlrvYKW+OiBwb+rxaMLw06ruMFVd4/H?=
 =?us-ascii?Q?EieSpUjp5fcyg5Ub1IiimT3RuSMw3RLwoXC1E/qonYPeZQBShNInPImAYZDj?=
 =?us-ascii?Q?P4OOkAnUTz6cuPf3tW60Equd62T4xn1RFldF/VC5MC7AxBTocSCl8N9iJlZ4?=
 =?us-ascii?Q?AqB0PmoCFEywxU1tu23LNNLG0J38UX9gPdtYO5zOvbbzRFIuerpyUEnfphZU?=
 =?us-ascii?Q?HM6PtACzs6lw+B1QcuAHwRGyn9orgAAixW9qwFkden4RmAhnLhgvzGPUn5eT?=
 =?us-ascii?Q?U6sO4DSqTsokkpE+zI2R+7rSbDycC+ZIH+tyFvwaEkHF+Zl+5UMVRvkuXJGU?=
 =?us-ascii?Q?bEFn5MPDwVdBCSGnF0Nbh6YMqGVZXcLWuPx+jjY2J9oPZ2z/wOLjlRjJnuoN?=
 =?us-ascii?Q?QNMT6jL4zHB5tPz7xc/23j2m6K2MYVpH5DNhgrlcwgGbxBpomwAgaCLCnesh?=
 =?us-ascii?Q?bHrFbbZx9pn0g/O6NkSH4uwyC24AL14PvPOeE/VBdcvQfmjuqqkdGOyu0Efc?=
 =?us-ascii?Q?yeoG+8E47G3ZWd27aM/4VCQJ7BTXJWsUzilOWWhhb+s850Bx1iwFR/zjVLkc?=
 =?us-ascii?Q?pTaWez+9w07p99vUxhtPsahbGaX4ZE+gjMSlWnS3+ZZho5CFp+0vn3uy6Sw2?=
 =?us-ascii?Q?tic3l7YXVsfyf4pFlK+qKdD5kS0F0oNKX8Kcg/a6FtnwFm5Vowp3ldRViqXQ?=
 =?us-ascii?Q?E+ergJCwAZMc4aFpRqOYa4wni+zpCufOXjQRummQq8kwOFWtVHbM9RTaFihU?=
 =?us-ascii?Q?2EaqMdOaEA5JXnK/u/M5oAUQaa8OxcvR0+nT/kHACahN0REZx/xkFkma9CXZ?=
 =?us-ascii?Q?E8c0eYQRl7Tgb6wytEd9Ul6j+1txzrLgpc2teHd3taBlfomGUOJ+wqqLmf6e?=
 =?us-ascii?Q?vQQOltzzXxGSMhZ6Mi6DQg8Gh3fy6k33SR12oe8LackI3w3YbBRbURC7o1Kf?=
 =?us-ascii?Q?3vPkSZj36Cti03ffNZhDThwAdbtJkbJXN1dmk5QF3rpFRhiQtLHKbz0FfgPA?=
 =?us-ascii?Q?fToXNCcXuX06gzrQvrAiPmnvYsPeArxdj3nEP+AtG0v4KsceCGfUcTeacMFY?=
 =?us-ascii?Q?p8fEosEUs3USQZ2ltu0Wr79i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7933c7-194a-40d7-e35b-08d8f89dda9d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:46:53.7126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGrt7u4tFyQ3uH75jwZUTqchAJFfOtiU642cMVFPb6qHunrIs6yrNN+Qtc2IPMU4AghhKxpLljTc9STsCLFMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3773
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

svm range uses gpu bitmap to store which GPU svm range maps to.
Application pass driver gpu id to specify GPU, the helper is needed to
convert gpu id to gpu bitmap idx.

Access through kfd_process_device pointers array from kfd_process.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    | 11 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 0b6595f7acda..17d91f05afe3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -842,6 +842,17 @@ struct kfd_process *kfd_create_process(struct file *filep);
 struct kfd_process *kfd_get_process(const struct task_struct *);
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
 struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
+
+int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
+static inline int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
+				uint32_t gpuidx, uint32_t *gpuid) {
+	return gpuidx < p->n_pdds ? p->pdds[gpuidx]->dev->id : -EINVAL;
+}
+static inline struct kfd_process_device *kfd_process_device_from_gpuidx(
+				struct kfd_process *p, uint32_t gpuidx) {
+	return gpuidx < p->n_pdds ? p->pdds[gpuidx] : NULL;
+}
+
 void kfd_unref_process(struct kfd_process *p);
 int kfd_process_evict_queues(struct kfd_process *p);
 int kfd_process_restore_queues(struct kfd_process *p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d4241d29ea94..d2cd757670d2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1607,6 +1607,16 @@ int kfd_process_restore_queues(struct kfd_process *p)
 	return ret;
 }
 
+int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id)
+{
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i] && gpu_id == p->pdds[i]->dev->id)
+			return i;
+	return -EINVAL;
+}
+
 static void evict_process_worker(struct work_struct *work)
 {
 	int ret;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
