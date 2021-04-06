Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1C354A88
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EE26E52C;
	Tue,  6 Apr 2021 01:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C2B6E55C;
 Tue,  6 Apr 2021 01:47:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZx+fDK3TLql2fapCg0OZFy0n7cCQwm6gzKQvJae5WfsJ2UTsxjVXGjh35gV88bekYrPyUuwTCwx8dZMjr9ozHom9jMT6BQp6lojuv++UIXW7mBlyKSGhSARJ3S+wHSBnSh49/6eAwmTraHfLctFxFnwbAekj7Jb094Y/WbxFhQALRyHlt48LZ6r/4JigMr/ANsHtzgfjk2lTZYSbfk72BCxw3Uh3eWV2/BCeoyjdbplUcnPXdTA8iOykZH9VKxPAZ3pYAG7TA9SptbV6FJVlJsZVnwpdkSgFeoZKH25dlNPYv0wbjcCpuE9pVzEW6DMyjb1co3bUQtI/fHgyoXYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvyDCr8572+K2UEase8xCn6mYN49gB0XzWehB9JlPjY=;
 b=XvOR8XCvtYIPRNxGr24GA/rG43CSXOIbNp60EZIUCGlAwFEFFm5FLch3K2jDeorTbxkAw1pZj5J+5el5uLoProZSMlzyHc41b6c9ClpE9syAFnHuzVU9vwyZ78FSkOdCs5/dDzEL78/3oV/H/pbeOUcxf8+uKRt1PjcPV7cFmf6boO2K1umGWdmwRpmKyTdSX4pGCaAcbFYkxH/kunSdcbZNIGESH5sdI2r4d07BlGunJAyEO/hP/7ogS7NzMquUUv+yW3BE+/rLHtJ2p9DXg6rR6yZMgWPdp5iYjs0svXwGZcLJlc4cWMgn2TChmVpm5lM4Pr2xswN0KenyfMeEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvyDCr8572+K2UEase8xCn6mYN49gB0XzWehB9JlPjY=;
 b=V+cxfXmsossJUyff0R8Kkyv+LS4IbNDk30hZwImUhZq977g+/CnxfNd6/1V1ZR0vUeXGNHdUWC1y6RH43li3SWJzrE9xRO+Mo0AcvqaNTS3Jb/TPnuOE5tZX0XXDw9lZRG4jBWZC1mwa410cvqcNQw9cPQO7rGceYUwLMfxeHeE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:11 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:10 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 29/34] drm/amdgpu: add svm_bo eviction to enable_signal cb
Date: Mon,  5 Apr 2021 21:46:24 -0400
Message-Id: <20210406014629.25141-30-Felix.Kuehling@amd.com>
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
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66b5b851-1a3b-4f7a-6000-08d8f89de454
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4159D446DD168A0887B6005692769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nwzokO2vDB6OAeIVJOf9yLSs8BMy0u7UaXwjvc0PMiYTOHwYwtGJQX8NksYUEnxOM8c4Ef3gzXpoDmMkDq3mujMptDRtlF0PQKPxIXLujYN8ELugUYTJizSn+dTUOU+He/UbGAGQ2ymdKGSpSK6p8mydhcOKHBBpOWNwSR1kzF4yQY1QQOQ9DD7PHoxzcXg62vQG+/0DrBcQ06U9sP86tOTXEp5wJwQohuFBH4qFm2a+3H4udnvAmxfpXZgpqwElADHFaf6y+wwFBeJbGX5v70qYGY2gTX4KYl8HZipjD3HDaYWCo7WlSlVeI+UmjT91U0+C4As5sT/Or12UkENW+A9TCiShvRKJ3FlPebQJJLRYbHlctuaqrCIolrD+8qZgqcWVZxbtAfhgnAbseYrbObcxZc4Hr2QcCyP4fZmyWmDvKIkACp+98p9aIWXTtEPAVdDXZ0lVV7mVi9mkbkmK8bDk98eXxwjHNGOYRVQDCDHIiJGkUL5qvHzkmfguRDA+eiHWLF91KPP2afUYtBnPA0p2VH0gLI/8ajMwe5QY3ppnsymwoTciUhZOAp7PfrYVOoDdLFyVbcaDJ2UVguaUJRZD2970oGxEzZwkO1L93OEMvZjHXtSYqOzGmacS3gbEnpQTUvKS7e5xPA+6+bYjE0jk+hdYGua83y4jtyHgCWiJUr6x57Mmy+90tJ9orBQK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(316002)(4326008)(83380400001)(478600001)(450100002)(52116002)(7696005)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fkf6XgQSBgmN6suHQwafd4BkqAILv0XPCP6R7R3dHBeGbHurm0bodn3fPTE6?=
 =?us-ascii?Q?IJHZ7B0LKA5NQBWmcs6gB27Lhm1liUmhdzTxvFs5l4Gl/D1FgKi/P9J/l/k/?=
 =?us-ascii?Q?7cpUdcM/JRK8jn9OO31xt0DoEtEIHeDu/mtEtzDUPUZd/xBa/UKy42SX71oA?=
 =?us-ascii?Q?zbuVpz4EUlpwyy2QMM4JJw7ueZsLDvoBlis9/4o5fGtdsYfB+nD6FPTt3lCx?=
 =?us-ascii?Q?LNX/dBGCPpiiRWY07SSSmpt0S2xWBHtPkefZrdosu9wBlM8NUDSyoa6nw5HF?=
 =?us-ascii?Q?ELfWmhSaNwPdYNPe9SlCtidhxoJurulmB6wHKHlmmjQcRFNqUE3jx5HwCI/a?=
 =?us-ascii?Q?ii2tTt0fNnM6F0CGTBfanDA0oWEbJRm5wF3UYFNPSQiYdsOLJNHLyKlGWlvH?=
 =?us-ascii?Q?DWnqtU9fUqODZTXlMmI9zg8TAYv1chGNn40sLaXcoqxaOZ7UWcZATH6Fjxet?=
 =?us-ascii?Q?77DF/8EXOFIqsLzaQfMZi9P42OeuuXIPq5BX+d5i3Mhui9y75JITfTLCKhoN?=
 =?us-ascii?Q?J7EQg2QEa7J77C3ECc1jBd4RNJRUU+TMJw7hItMJhRktzjPzo5FV+ve1O0id?=
 =?us-ascii?Q?1Iipf95pPPes1khq/+QHgEFznu5jSRxwJhbcW7IDkLYWSfnGmm40mbM4buqX?=
 =?us-ascii?Q?9M2v4MVkXDgU2hPhX5lvhTuBosRoehDEATIDz5Qbdnbcpzz/otBbN1TOfdWS?=
 =?us-ascii?Q?Mjk5Mf2Hlyvy7MOZmj2aUbIcE3RqDFnKaWQ7D+KQTUmi0TnRF8uosLNrGMBw?=
 =?us-ascii?Q?GeHKPm2Ur1Dso/eCjY6Qup8G4WfNaF5O5TeWJ376TfgkvDT7D742TGG/NPEn?=
 =?us-ascii?Q?/uPsC+vaYQ6lvZkT7boEdhzHzqNULQaLjdgjB8rnEnfwAg/e10/d19Yq7LDH?=
 =?us-ascii?Q?TQvIJvKBlbSz+R7ekl55WbDsJxhffOchRAKZ1ZHPqi+KChZnWxpWYLM8pFhk?=
 =?us-ascii?Q?5v21DlIejt7YsevUWBU37u/2ykrbZjnfyKPzT2ghIJ5f1eqPZMFSO6FbMNqX?=
 =?us-ascii?Q?Ag9Zofc4xxJ9bDpxShWKW2iFsUo2JOWxkxwxzff2oN6ZsMH6nddU1sPJrpxv?=
 =?us-ascii?Q?W+dqCI1g2y6y1/8bACg+uCpuZ9a8AlZdsDTO7OmMYoFnHyQt4dYjGvmVM3ty?=
 =?us-ascii?Q?j3M6lKNk8jtScvA7m8RitGlPwjE22gBvorh5m7pWgSvQRsSBQpkKjQm2xWMX?=
 =?us-ascii?Q?/oqzGKzkiEb08/uS+b0ZtZWN7EigtSBv3RyGXIsaWkUPlh55gbH82Snr0Ule?=
 =?us-ascii?Q?ogQEVDCMjtFihMbDoWjaRkm20tFWiz8V98T88JbEdJb4MkVev5SX4suyTPx7?=
 =?us-ascii?Q?Th3mug6JTBQ9YToxXM9qgAqi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b5b851-1a3b-4f7a-6000-08d8f89de454
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:09.8986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzcQanvoCkVrLu96V4SL94FMVf7DgPWaZp8RBQ+o2bYnvRrxlhhbpdPl5huB88EfDuP7jN9QE1Eb6c8SlUHsjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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
