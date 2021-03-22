Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D3F343F11
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985D089B33;
	Mon, 22 Mar 2021 11:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A06989F49;
 Mon, 22 Mar 2021 11:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vge3C1g22Z98xhoUwq0BZ6hpFQsVbfZJtHr8PiFIW64mrcN97ag8x0t4eJ7sepQJwjTCf/eXCaxzGRqhqRvORlZY2S44iUhqur0ZwKy9A6FSg8mJJzEKKKUJOyJsc8SGD6b11S8qV0PIf49NuxccO4az4ZSVrfxrHnncMwAWkn/C+O4b1qcnr3ryXb99Vo3Y3fKErdAiXmfYO2jU2s1ocmI13694T4UTflDQ0NXFxvT3oPkmx8Liv/PwtbgPe6OxUfZsb10YepUTNFam9UnW7iw3kZlWet3OoUwsXoRyimmfQPJiWpNQf7NK3xUppuIUw/Xtl0TY8JlcZhpa5vjgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgNyPmXptTB7W68tG8a63FoS6cZBhpgPCx0Z4L92z+c=;
 b=l0qVqvnxaX5ujDrW5DGEffo6EALVgiLIbGXbAKlNcQ4N5YeRVNeuUp6eynLDl4CU/4NHC4M+wN8OVrFDFWQake0IpISqMfyKdK3EHjwwEF8JW497yf7VHKTSPKMIWYowBIzm8biGCaOxt31Hz/t4b6TXnLiSB7qcxN8oXLXtmyE9+md0zyySrOPMMpH6sjapQev+jgVuqLlz8z/2x3Hu40DlzFt00lfcpdcvnsHSb6zCllEvtNJF6wDhZdJXU/Ym+uNTFfACu7OBz4VLK/z+kWRGVhcQtG1zuAcYMYy/REGnlXMQkZ31Hf7/FiKRX0Tx1mr/cpE7UrAPda+dApSX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgNyPmXptTB7W68tG8a63FoS6cZBhpgPCx0Z4L92z+c=;
 b=245xWdtf1cfSuBMNDKVfVochByorBZMKKSG/hUiTaafXvr2eDNCaaW9mB5CZZZss64KWQ4WxbqaDQLW/oeYqgwWGfK22mlPxtiuP8E0pFflhf0CWeLSqWuvml6W+sioTXbs7ZcAK25I0N5FEc82WvLRTidTDfKePmarjRjO9Ors=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:44 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:44 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 27/44] drm/amdgpu: svm bo enable_signal call condition
Date: Mon, 22 Mar 2021 06:58:43 -0400
Message-Id: <20210322105900.14068-28-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bf9d77c4-c61f-4cac-1af6-08d8ed22b7db
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4899D58646B18E1CB64D819F92659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FUIojhwpDFO5Of5Yd+6ndV+W+ZnUJOIrTqgTGZfzU6QW+fqKxlhqT34oarus8SCXicTZFKfmFQU/CbI9fIT4uueyinoxA1ukPvtvuJ1PM2rF4X5q0Q9SvYg+go+xlxShIeZAp16IwZEKScD737VgKHNlDNzNpYHLHz8eYT4+bm3AI8LSB324bpWxbLec33etvLDFfw89nU11vB9zkl1MFlM65C31Y6zg16KiHJgIZ88XpivB8uGYHjDVNxFY2TwfVOjlRFPdG+29S49hmei4wgLT/I9GJB49BXz44VsTbFIw/bYezGXvznok132B5rdmq6q6KvKr/hIu2+V90Whwv7Y50arpHETawJ1IinO6yTfGpEqbiiKBA/Y+CAprrMR8Kvdv/6tr4LnE/SFycHMCK4z//PEI1WOASc2QVFXRD8DHPu1EgX5QGCOnsw2V6rcD17BQHxBv3kFYV+EfqtsmepthgVeE/DcIyaKQUSGZ2cObqOa4z5JXdKKEEROYRQBD5Q7dv9OBqWYna5zNhrItmow8SOP5TB3jlpnafBHbkA3f/3eZikn43EiFANMmjxyg6aPrlK6nTNMvBIyw5ymcy72tdH5X2X9D1x5ym5vVFhDOV4Boh/deHYm0RwAUCkFWDkiKL/8oBE3WtZnDm5O0P4sRsYqizQ5+6Lwdv63lwNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(7696005)(1076003)(52116002)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TnKYtHHCg06VqzGrBVPtcCGGH1R/bnEYdhhUzOzMk8jU+OqFUdoRxda262dg?=
 =?us-ascii?Q?meVFmrauCYTL+TUz6b8QagVM083z9WjfDujIincOSIkNv7IF/9I726F5jUy/?=
 =?us-ascii?Q?Cc+nru3T/iStqX9s4bZaMJEr36ZNMKVFhCkOkkycINksmuXJuEoyVElSXtsv?=
 =?us-ascii?Q?ZG9RFJWDxoUUYEhXmnegjldI+T4EGK7HI2B4tqrGNKRjInFTk8fACMQRFblf?=
 =?us-ascii?Q?ETiVCTI5KU/v4FM0f0JPahMKJ4fEoPCft6mXJ1iK6RCgV9yr+fEv1BpEVXp3?=
 =?us-ascii?Q?bhPzagnl5EedJr1dgetXKC4+XbV0L1GO3XpDRpo60DOGEVZpV7YC4rxIQ2ZD?=
 =?us-ascii?Q?kh3kVkUDTtB9Isd5wQu0EXu2AbPj+lBBQ2T0+JTLiJ4Z4J5f9LeOlJKgf3iE?=
 =?us-ascii?Q?biWR5VNdMjeKiKYqQxUGbqQvRdpYRlznrhWswsjQZk6Yxvrxbthaego06bBX?=
 =?us-ascii?Q?GBOFB+F5/QzmUelOW+rU0j604pBlz0gUa50undUBbXmYQPzXYqNn8/69kbhw?=
 =?us-ascii?Q?hGTJfu9S7KIotBZrUXOyJgsVBzoF/XkgPsxnGkFXX/JbE3v+IiNdTYtN0Umk?=
 =?us-ascii?Q?AYw66WA6/W4RN27D3YHiREYrgVG2Fj4jdvQM0o8nHAfbP2jN5E8bqaL4Ubj+?=
 =?us-ascii?Q?RJjOwdVvyGkyvdfjAO4CAHAk2t+cYCeGTwsouRIP7t2pdwOEjW4Q0vtG2TvI?=
 =?us-ascii?Q?vFx7Y68ksJUZ1Tcx6Jqedo1IE/TTE+KXgxl5nm3f1FNuPT+RU5TyIUxZiIaO?=
 =?us-ascii?Q?LEa6JlHEN90xppuZBX30RWfREcnXnEnQA/IIb4fqMRuyjcuS8H7FkU1QSdJG?=
 =?us-ascii?Q?nt7YcZiqa2uFv5HB5HvDpMz0y9GnwRZp+fLpuBXZ9pYvH/wdAbu/lX7JQygp?=
 =?us-ascii?Q?26cR0VeJ1B9DdPY+5TCBqMYGNrGlTHcrJt4zEbdPe4nRKB9XgWCWumhgC7Hy?=
 =?us-ascii?Q?WWikmvpMmL2QGf97TrafyBQokIvEOcsUsEvvokxbwEDWLDhdpLiNTW/4E6HZ?=
 =?us-ascii?Q?AR8bRgfnt5Bax2IbnKme9828Lpd2STWE24qaVGFmsc+ajwrkwmXI211m37XH?=
 =?us-ascii?Q?k07oBuvECjoYKt+X/8nuTRLc2XjOvRPbBECzrVp9PxO8nCRogSl3pM8XWIAZ?=
 =?us-ascii?Q?vF92mxilY0JYNCrS5hOzUENyaBx8PqqyRmzRatWFo6OiDnMDiKOy7IS/FZDE?=
 =?us-ascii?Q?c5xbn1ub1uHP/6oBB7XDPZuSaUb23UHyD2poEdl92UmkFkUa7rojfvCDZd1V?=
 =?us-ascii?Q?7M7LqPBOofbQHpARskqdZ/7fOY7FuRFbOuGvIGy1OUvBsv+clkYxmsVgCdYm?=
 =?us-ascii?Q?lSSoIoT2W1Ov0/gwg/qeaE8R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9d77c4-c61f-4cac-1af6-08d8ed22b7db
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:44.3699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1n7+w2chOhDQdEQVwEJMdEBX5yGkugF+tXlRra8+BpToAyIxvJqeFu+c1R11+KkW05TvvpPbnIf9DITCJL0FoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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

[why]
To support svm bo eviction mechanism.

[how]
If the BO crated has AMDGPU_AMDKFD_CREATE_SVM_BO flag set,
enable_signal callback will be called inside amdgpu_evict_flags.
This also causes gutting of the BO by removing all placements,
so that TTM won't actually do an eviction. Instead it will discard
the memory held by the BO. This is needed for HMM migration to user
mode system memory pages.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index aca5a29f6d2a..2d80eb3fa571 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -111,6 +111,20 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	}
 
 	abo = ttm_to_amdgpu_bo(bo);
+	if (abo->flags & AMDGPU_AMDKFD_CREATE_SVM_BO) {
+		struct dma_fence *fence;
+		struct dma_resv *resv = &bo->base._resv;
+
+		rcu_read_lock();
+		fence = rcu_dereference(resv->fence_excl);
+		if (fence && !fence->ops->signaled)
+			dma_fence_enable_sw_signaling(fence);
+
+		placement->num_placement = 0;
+		placement->num_busy_placement = 0;
+		rcu_read_unlock();
+		return;
+	}
 	switch (bo->mem.mem_type) {
 	case AMDGPU_PL_GDS:
 	case AMDGPU_PL_GWS:
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
