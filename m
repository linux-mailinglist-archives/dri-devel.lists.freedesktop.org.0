Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA3326B75
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 04:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2A96E48D;
	Sat, 27 Feb 2021 03:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F0A6E428;
 Sat, 27 Feb 2021 03:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNbvr2VkSPq9w5PPhfI81FRjxB0wo+wSCt/rcZre9paFOXNrHT9TI2hG22iXOoSjqk5YqMAXjFqUZo4Peb3GGO1z+2XXlFFFl0Y7amy0ALNbQjh6uQQqqo+oNwA/YtA0QddleDZMdzrnX8FxK0WRXX+jMN0tA6gzD+7G9lBwbV7+OyO/dumh3UmDyogYZUYg4bv+NXBHA0oMztsfCn//Etv+eCgvr4UyNCKCXvgeuiKj8F+oQUaN7sJ/lrswAMKyfv2gYKd28h4RmY+rfi/EdQUexx+Lldh8rFcKcZoDPptiGxkuckxS+UuxSQgwKDwBd4xVbhY6spPwteJzAp23og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obU6PIpEG+TP9/q9U28AzC4GA20ShU9I+pNdn9TpNlo=;
 b=Afi0lUyOm9rdzqX69Eb3hggCOvOaswALq377W+xgOrf1ezDH2ziaEQYJ5UyXOsyZTnXhWob8x9CIDuwuQJ8s/BJniKILR6PwRwarO0AutpEE2FVT+tJE/zinMVQGFd3WdVbdnoagM2OFj/lPyE93hQboW0SC2vQygk1ba2sI20I6Extk4weEc0zVHaaiWQcxrLd32PDvV4ad7TIU2xZZXjbs4s4F/dlIHsbGytB9iRIKoS2yQWmDsBpvmlK6G+OHABcwTUPdWQ/sGC/8H6M/1sfItgO9CNQbZdQx8a1KJJh9EoMArIEHtOdYqHraUdfhhp3KjJxNSFMHTrPcl20Tlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obU6PIpEG+TP9/q9U28AzC4GA20ShU9I+pNdn9TpNlo=;
 b=gfwqJz3EWsoQuM1I48eUL2Tw3Adt3GSNP0xA58YTp3D5axWvP4wwcGaC+8uiPuLE2g9cXGbgcqQLct3TsU8mbNw49pLQHE6rAkDDWo4byZZ0JerxlgFI3gWWj12t/gTstXu2vMyNyi5T8mrgIYvpQ8cUUgGcgbB/Kl9EmjTWcQ0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4408.namprd12.prod.outlook.com (20.180.247.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Sat, 27 Feb 2021 03:45:52 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.030; Sat, 27 Feb 2021
 03:45:52 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/ttm: Ignore signaled move fences
Date: Fri, 26 Feb 2021 22:45:24 -0500
Message-Id: <20210227034524.21763-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.30.0
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.32 via Frontend Transport; Sat, 27 Feb 2021 03:45:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: acee923c-9e51-4192-8125-08d8dad22dab
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4408AA392555F304EE2CA901929C9@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:765;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XiMFZ5bF2NN9/rtXDYzOPWqCk+0KHzRKP2776IR02GtuWc4baPJ0YDSwOWh2Rh5UP3VP7KOtaXSu4xnWb16BLMlm3LQdycp7Htiu5VSMQ88Z+rhVBRzrRoEexd3H+4Xgh9UmFa0NFpdb58NOb2DagHvp4aLBAK/BjuHVsqXXTj9agOnr2eHxhsL1YpOoWrFdJ/TUCCQLm45Yj/GA++BrkPOUux0/sxEpSnqjvPU7Jj/UF3ruaU6/NHetzUoQXwEQ3swR0/FWFWOfCj4WXpByXMjmqm40DnF0pfNTihJWmJLcEjl0+SsVZsf2nzvui1vqqWj4tcIz4J6YuQehcqLMiHFtQnwzHP6yCFP41SnWywmbDVcXhiEGp8wyHESTugRnE+98wUXF0dMcunw6wV6GsA2uuLBMv1NapYfaMETLvDhjCPD5HpT5OWk1tyKhc8d/VAy72Hx/1S6wQVUs74hQ+tMDhazqZjPAOPcfIs4hvgfvamxYdQimsCVsvxRqcEoLytUDWNqOGIOmw47egP4PJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(26005)(6666004)(16526019)(52116002)(5660300002)(4744005)(186003)(2906002)(66946007)(7696005)(316002)(2616005)(450100002)(83380400001)(6486002)(86362001)(8676002)(8936002)(956004)(1076003)(66556008)(66476007)(478600001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CPhn0DD6KU8wcXDAm/FV4KortsHd10nq8y3KaViypD3oWNCH1VHwHu6ysc1T?=
 =?us-ascii?Q?nq15E4RlhuhxxjM49nChISvlFcUvU05Ql9EY6G4o/y03X1Brse88SJKuuR9V?=
 =?us-ascii?Q?mhWnLRaB3FRN+sh6txDx6wQgbQ2vQLePlvfeQYbNmuS9oXcJfmidrpBcfQ0I?=
 =?us-ascii?Q?IJDP7XFg45V2JeOJvtHIOpG00/WeclrjSQmzS9+ZG6j+yCfTVpLqVmIXCUD1?=
 =?us-ascii?Q?OWAaamqW866+ulZAf8OFFZUSKafWrw9H2wDXwAc5Y0gCN4b+FL3L4FpsvgCQ?=
 =?us-ascii?Q?joXUUJYyASHU9kK2BEczLvdA4lr4nZJIHVFPqtI1PhVQvCvrMRUI01NGUSyG?=
 =?us-ascii?Q?UQ9lc6A9oDcvasF1OjIny98uWsxbYTiA5Jj4fBQLgz0k44jpmUaoUwu8lgQJ?=
 =?us-ascii?Q?ni22m54zd8MycstuChgjWdKZfG3gK6FltKeuUF23dOjYl02/1Ga9rjT8m+BK?=
 =?us-ascii?Q?KlJowZupapu/m/f//9y6B4k6DHvF6FWvvogL0D75/aOp4mXGqrFC+F+VMsDb?=
 =?us-ascii?Q?7cgXPBWjEKsqnu2qjPn+X+KsEoECB11RXnEGqkaEN5WtwKdUr5UL3jQvKRk2?=
 =?us-ascii?Q?qC3SBQp6QhJ09q2RBIKYpyneK/ZXJM45yNOQrgD8gn1DL0uAFFtPBKK74ZUq?=
 =?us-ascii?Q?Hzrc27tkkzbNDV/ig1TzBdzT2NuifNN3qB429p8wTYIP8Bkw7dbG2/vTIDfi?=
 =?us-ascii?Q?U/nHxlULNcbOpXH/QiaeJojMT5QXHsDIBSbMV8GhwrqfCS9xE2m7KuDLCu/6?=
 =?us-ascii?Q?XkeG/tUGMwBFMGm/2subvBZw4Pxr2sQDiyuFrtMPoXaXrmaLtgv1jfXaBfpY?=
 =?us-ascii?Q?9lMEMJGyQ6Hv5FpMd+8hXBSgBfFiYlPihrjP+OsSLs9KjH2exLHCQMYmOvts?=
 =?us-ascii?Q?Iepun6cAzCCbzd/z6uRV7um4/G9zUSgOxYcnGHvHrwzCxWPO5TsKdxlpI3DA?=
 =?us-ascii?Q?ihltnRetl/bfzXmyfGGxIq3wxKY3L4uBNoXdvtE4nvKXHSYWEwzjrPTb3wqY?=
 =?us-ascii?Q?F7YBdkuX5NxFyArzl9/KpyHO6VUfrSUSj2k258w7Xtb3kEI7A8s7YZJ68+Ff?=
 =?us-ascii?Q?wzcSFj3PmAgULhuHYQ2wBUum6rSghfyoy4RxLTCuH8yqbH2xFqSzg7i0E0Cm?=
 =?us-ascii?Q?CE0G/ILgt8E9mQx9BfeviK/SKN5o/IGVQhN/Q4wH1/x6I2bxXQNSS3z0Pj6s?=
 =?us-ascii?Q?r3rHfHQnddKgYOWCc3bhnGHOLm4zOU316FqFRE17zyIn/yBvlqMciZQfuuEO?=
 =?us-ascii?Q?yz+VktmAvXeBxmxMrjhYuV+evECKjJDHQYLo/pMnESmE/X1CNzRl1KtOkGbD?=
 =?us-ascii?Q?uLDw0uIdYpVh6t32nQmIxXJp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acee923c-9e51-4192-8125-08d8dad22dab
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2021 03:45:51.8799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czjQjKhd7Cw9WegZs6lHLbaUebCECpAJEZVQxQa79MKfC+MMWwS2kUO1ZxmGt3GExJcPjjF37OpVerOcJyefkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move fences that have already signaled should not prevent memory
allocations with no_wait_gpu.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3a10bebb75d6..de1ec838cf8b 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -730,8 +730,9 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		return 0;
 
 	if (no_wait_gpu) {
+		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
 		dma_fence_put(fence);
-		return -EBUSY;
+		return ret;
 	}
 
 	dma_resv_add_shared_fence(bo->base.resv, fence);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
