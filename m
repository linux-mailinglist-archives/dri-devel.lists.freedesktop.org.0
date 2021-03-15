Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EC333C01D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 16:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887E89D3E;
	Mon, 15 Mar 2021 15:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86B989D3E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 15:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPdpE+Uwunk6C9ucUhrT1eUOACu9Mc0GzbZs05Rt32hSvqjwW+uwVXAbR+mpXMuaihQdm0unwOQO/CuYbFXtPCnRmRKVmYtU6vUHoClyhNRLEfelzbHaMxa1KAzoDjiFn7bqB3SXx/Q/P4DF7PQb5Tsylbq8tcsfDKpIN5Ra2fXs9SvUxk5Rtx2CdRvbgaLlkY3fUJXL96/p1gYdC9X1IlVejTzmyapjZGGzIVYt1+DjO5D/WvtvUfwIoQd2Avt1RgJPPk+/7GXR6X4mdjkQs0/L2UCDcvhfblUjnYzwZWtgPqHJgkQAnZepkNZWbosmLDa4VqEgyWqB7LTBTxjOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyrCNjmtxX5ClRE1dbTLlbII8uRvwy+zRwQNzK57SZU=;
 b=D7afR5RWPbe6RmEnDcNHG2QBzPL9WMwOFwQysojO6pNSN4eAU+Q7sNkBEqE1oJvMjsy4vpparHs8kO1NJH6jo66U+dwig8cfIm2z57KwjgoESWlwe9Q6PkRF3GV6OK/508Z6evP1twbCm+KnISep8LSaW58T+v3h4B7QS2iTbnwBz9E6TnvbvDpVM8ND0QYjHcLR+ij0N7BoA947xuwUJAqahpacFYanYAt9nkK9SXurtIjuDrES1NR7YoXKYHs61L+HyDxX+YPdyxosZkQpgtWRoX+1qz+OIsoTmwMnXySJR6ywZfdYCcR2bO7EgFlGuVxOQ5YBlzYhu3zRj+Z0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyrCNjmtxX5ClRE1dbTLlbII8uRvwy+zRwQNzK57SZU=;
 b=eq13SKxKsO6Xv3ZpAWgtHp6NqUaJ2j1dprvoRdWz8qjBGQnjeZZrmtwDqEkjhae0MZvtWpPFyQTULnLKqDJ8+5wOn9hxqLquLN0QxpTOKGhaD1XBYWbzUuuvkyi4WEoN3CiKah35/xA8OENExkN/3XhQENbn/B5SjxKtZn6zq1U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Mon, 15 Mar 2021 15:38:20 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::f40e:1245:84b6:e2a4]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::f40e:1245:84b6:e2a4%3]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 15:38:20 +0000
From: Oak Zeng <Oak.Zeng@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: fix compile error on architecture s390
Date: Mon, 15 Mar 2021 10:38:09 -0500
Message-Id: <1615822689-32730-1-git-send-email-Oak.Zeng@amd.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::14) To DM6PR12MB4732.namprd12.prod.outlook.com
 (2603:10b6:5:32::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ozeng-develop.amd.com (165.204.55.250) by
 YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 15:38:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e5e7ca74-11a1-4551-b3ce-08d8e7c85c3a
X-MS-TrafficTypeDiagnostic: DM6PR12MB4418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB44185650C2A6AB9F1FB4F874806C9@DM6PR12MB4418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGWldBx5cDfx5coHaen/WAVK8siqelootE6MyXHifUqZiPRhLH8BxRy1JzpUbMwA7x+EAHailod9pbQpWc/EekyUGS08jlMh2oIRDUIVTbvhYxTBpxpVrAFvVfECJ0e+y7SlRaMU4Ozo5TnR79H1c38kqthb0thh2Z5iutUeaezmisl22kWMGBuUKTRvhK3a+mSPP7CXKXyR1NTR2U8GHIG+py12IetnFlHrDGmL0AtdKT35oSttSb9qHu1v6B3RHypLGZPGcW+RBNGBmal/mfpt+VI2llll1Ns3vI7RKLfqgQ7A3/3iFs8RF9PjPFMUpMKyghBg9TzAyvFkkzKt6qodEunvzWTiuutN63tDdtpwWysQaA5yW+Cx2HIsQDCAikreFqPg0e7n5f3ZiMB4DKgUY85C+2ihdtBiYr9nshgs+Qv9SRuJfCmE3/5Y9jtlVrnYMEICzp/vCITQwuvEqfCQ/lNXwCI2xHVPvxTUU9boPmZ5opZG0tRFGYFKeGzABbBlmktRldWCqKkSdzkTU2kwM7OQ3/ynZJRiF7VZQE5AoVW3IdhvaV3EIUHvo2LY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(2906002)(7696005)(83380400001)(8936002)(2616005)(52116002)(5660300002)(86362001)(66476007)(956004)(6666004)(66946007)(16526019)(8676002)(478600001)(6486002)(4744005)(316002)(6916009)(4326008)(66556008)(36756003)(186003)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RBr8bvuaz7kCzzoUXaRl19HKO74wi909pRbMTvOralZ+dmQLumOCT9MwUIqI?=
 =?us-ascii?Q?HYvjf8XLbe72dPfBhPm/3X9eNP2znI2BxvjGPjakprR8Dg/1eqIiMJmxyHzQ?=
 =?us-ascii?Q?THxBZDSY/jsD/kqWV8GDPVATxCkVavEm79uzJv86m5JsvWkjxP/vgQ+SzTFC?=
 =?us-ascii?Q?wAOKKTIhB2QioUJKjOXFMh5FNmwTJpnRQzAWa3RKsDl9kc1rbOgt192P6kM7?=
 =?us-ascii?Q?PKfBWzXSg4KjbaxU6nnCOprsvgUZG7u0HGGWJgEYpsoOZcPVHQSBpaXUb1E8?=
 =?us-ascii?Q?0o1Jg6fj+g6juxzIFciKC66qKXEAfme949Kt8A7r6WB/5JC4J0QIhLUGvHuk?=
 =?us-ascii?Q?bsJ730ffdiBqYQ6jV0srKXRLhUVdGExyLoGLwTneqDaCYaLFanUv32EEeh84?=
 =?us-ascii?Q?N3X5Y9DZWeusXghGMZydXpWSKgVyKw2grZru6OaSktPXYWYmHW1JBeGg8lUj?=
 =?us-ascii?Q?TFqDjRkgl5jOK1+jT+oAGkVwEgAeYDrHEAaNwKyQ9PD04SNdlh4Oi8WHRqx7?=
 =?us-ascii?Q?n1YkTU+oNh0fu3n9vrMogelGbDPaXzRgRTNmoZvNjzWBfNXTOt7Keb8qXIJU?=
 =?us-ascii?Q?USjiELiQZi0FMFM2wHJyDdOGuht4t14fTdzWSnU2pLBP6DRU5MzcW8u/I/tz?=
 =?us-ascii?Q?RdpJAaa1mdFYvwc4Ik5bJu6X5UEJyo7iYCAHjLv3ZJdGLqbM0jjZqssUmh4R?=
 =?us-ascii?Q?ObnRIB2c9hL+Exy5M7RiwnmHwDR6bQkLtySospAXCPvdCljItFDvJUSPKg+u?=
 =?us-ascii?Q?zs/vvOp06qH6MCJ9UbXGl/094NIPGCpr+I8c93fdZ85k7/E7RsrIketRQxB4?=
 =?us-ascii?Q?jXQOHYPSawnnJ9kZ+uBD3t9W5v8RdgmS76ImbQkCC3TED4X9ubxGOTnh8y2n?=
 =?us-ascii?Q?Hd9DoTEt1Y50Z9GAUTKPRf6LOkTBv/Y2eMM1jFlrPrFo3W4zKrjDiHFaPn6G?=
 =?us-ascii?Q?dfNSxEzoAEpRtvFxnj8K4nWQS/vjxKi6dq44biZS/Qn3xX7EryXzYNpVDZmc?=
 =?us-ascii?Q?fZZ45o/PWKfnolIT+NN0ZxJHZ+o8SP0ZP5wPa4N5Nn3rmnomXiA7cAD155Mo?=
 =?us-ascii?Q?kvpDjkUQX/wTL+xMLV/zMbbOBTikF8UAsJ/lzSxzsIpMWGWan8OBKrMcBeVs?=
 =?us-ascii?Q?YRahE3ZhCef3c7EqT5oFSDcxFax02D+VJRL+F7JdKMvxZf7tXefVuyrml1Lm?=
 =?us-ascii?Q?grL8V6sTCSEo903fNes0jjJL+gPep5MpX5/d0bbkBc0u18tB+sq/8b8Qu1Zc?=
 =?us-ascii?Q?ZX7Gr/KO0yKt9oIRvOOEOjGHK8D0EbRL+nVL+3oaczcSHmkCAgraTo/B1bI1?=
 =?us-ascii?Q?MRqfsQrVOSq0/384hHKcDO+G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e7ca74-11a1-4551-b3ce-08d8e7c85c3a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 15:38:20.2300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRgzEjYGDTPo0kD3128kCAz6ZVz2Jx3tatkpP0BQ17HnjXWDnGtXd48kgnzzUyL5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418
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

ioremap_cache is not supported on some architecture
such as s390. Put the codes into a #ifdef to fix
some compile error reported by test robot.

Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
Reported-by: Kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 37751e7..1091585 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1817,7 +1817,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 
 	/* Change the size here instead of the init above so only lpfn is affected */
 	amdgpu_ttm_set_buffer_funcs_status(adev, false);
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_X86
 	if (adev->gmc.xgmi.connected_to_cpu)
 		adev->mman.aper_base_kaddr = ioremap_cache(adev->gmc.aper_base,
 				adev->gmc.visible_vram_size);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
