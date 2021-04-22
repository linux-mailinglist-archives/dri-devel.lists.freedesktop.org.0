Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B2367E89
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 12:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF6D6E237;
	Thu, 22 Apr 2021 10:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770077.outbound.protection.outlook.com [40.107.77.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20DA6E237
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 10:25:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DinRndrWRG+GeegBTQcgLxMn3pj1XKM2rxY3VkYvNs2ZxbGXPEgxYosjtjSbEDs+wP1gyqSddgh1IHIA1lHpcMrpIHj3J2vIZyoFIhak+AVT9zjq0Wd51oCJtjNWeyV0hwa+Jw5Y/2fyu/glCM2oAfT6ITba95uXNZVpNFLDoCVGoeEnVV7OBQvEez3KKqqd0z9gXEFIFQvmUmZZ5xlDpes/dBBfZzOZ6lOVJ3GXWh1dHEPI6jmj3D+UgzH6WrBG41be+5kqFesIEIvLVZX4xPe+kGGw/Vf4RjhmQwi83fzy/AoY1TfL9TNljuIsl8NUHJyEzHbOwTl8jCcVz1IBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvluM0zkJv4HkGGc3kUJq2XDlIw/2vhTYtXw5aDnu9Q=;
 b=XxuhGfGDberzyKuHZ/lHqT1/GX6Xxq3J/l4ry9MjC6TCWflSOtxjxmuqckkmgkJ2I7MvoHw4CClhTCfox7MM4E5DyyyD97eOOAouT48AuHJvoz7t8QJT7YKQjyVccoP3KKF6Xy4GJjB3KAYiaBVocIEgZUZSw6WxUgRVZDhkj5wvSkWtfg7YyqZ2kYArDKj7yFNzYc5HepksLiggHhcgaxrGhowDbL7rDWjU4tKL24HY5O+X/bJAWBHD9Yy/iUxmFaHzssz7/d85oEakBaVMq7Sdby2dhx75bBcVc0eKTGo07jTQx8uIhgA9hz3yoOjFgM412DWGe/wmXNqzTNbIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvluM0zkJv4HkGGc3kUJq2XDlIw/2vhTYtXw5aDnu9Q=;
 b=SzKzfnANrVQV0fPEWsseevUtBhmtzfa5BKQGfqUiKx5gEBP8qU8nwtpWNCBfTVCTrFZuZHkLrOS1WYlBzo0sqJV24P2AKX8Sucomgv/fsANixvJCN7dT/FSeZxsbQcc8b9jmp82Vs/JP3rCQB0E9yzc0HhC/Gy0//u8+LspV6cs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3196.namprd12.prod.outlook.com (2603:10b6:5:187::27)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 22 Apr
 2021 10:25:39 +0000
Received: from DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392]) by DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 10:25:39 +0000
From: Shiwu Zhang <shiwu.zhang@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/ttm: fix error handling if no BO can be swapped out
Date: Thu, 22 Apr 2021 18:25:21 +0800
Message-Id: <20210422102521.22580-1-shiwu.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR03CA0066.apcprd03.prod.outlook.com
 (2603:1096:202:17::36) To DM6PR12MB3196.namprd12.prod.outlook.com
 (2603:10b6:5:187::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lnx-ci-node.amd.com (180.167.199.189) by
 HK2PR03CA0066.apcprd03.prod.outlook.com (2603:1096:202:17::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.16 via Frontend Transport; Thu, 22 Apr 2021 10:25:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f20c8ec6-f114-422a-181b-08d90578f993
X-MS-TrafficTypeDiagnostic: DM6PR12MB4468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB446867BCD3397FEA56903722F9469@DM6PR12MB4468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fdzJdO09wy6Zd3Nh0pNLaQjEIFJcsQ6JHa2uLXkeqYRCfcfo2qigiYFneDYcZR9m9g1jKj7Q0uZs50ZkTr0sbJgvUFgYKZmlH7Rc7cbzCClIKSUn9ndG/PJBAOuPcfOKoMNKBZtZJyFLyJKsKcDO/pqBqjDZpB8lKzM+MYGSm2BLwnZlBlobq1LG0e2rv1EVl0I/FJ7oQyv+J0P+rWtEuZMQfVSZhYB8JfgKJQMCjAWUUkgGaORDjP5mR8Zqnq9ZW33/moEeJoTgzSIXqtlSyKWOASih74y33QvgZHs+Wt0fHn+gfqGmLykGmL3FLyD82tEsFiI+IncRHp5gwkvN3kUXtrcoo9VrkDAxF/Yr3M1hFtYGNeLU+2IAT4TaPe0bP/fhNENqnbboqJWaYhu94FNLKJEbVZHh95GFl146BWkbzWaN8shxLNWz+LQBcu35WH7ZWggJNEoCgRqCH+8a3/ZsndXnAnkYuTfBKoVkSIWcsMB81/6jGAxXmk2YP4I75pmJaNAvyeHVsYgRmUMGhoTP1XkzwVjH1rVWEsV49ytQ8ChV/q/2+92tIhX3IEjHIZqqFYe1kIWmyJG1TOSStq1XuJ58Q4VZrERywukthgPX9IgaDwbgTnAr4xdvNqAFHneGdAr9QB4LNBwjUm/wWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3196.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(44832011)(86362001)(956004)(478600001)(4326008)(8936002)(16526019)(36756003)(316002)(2616005)(6916009)(52116002)(66556008)(66476007)(6666004)(186003)(83380400001)(1076003)(2906002)(38350700002)(5660300002)(8676002)(38100700002)(66946007)(6486002)(26005)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fTVrmOanaI8MEthViBn26UP0n6VB8ick9cp+W6+8imIffho4RpCb0eE0IzWs?=
 =?us-ascii?Q?yAXpMAIWba3oY+3XBLA+dAnxO567neiW2Aq/SvcluaLMamN2DISiO8vtQTQ2?=
 =?us-ascii?Q?LVf4xOpmMEXguIkH6tYzjv9d1gwnL3g++qKgqGHjcFub/PFI1JefSCnpzPEE?=
 =?us-ascii?Q?29Cvo2djKj+/oOE9Tk/sZnqcsMmJSfTsfvqTNtPi1wpSE2K1MbQSh8w8yM4+?=
 =?us-ascii?Q?J7Kd+ygbTcHj8vBVK6Xu2RVEOwuaJImYKze0HX0t0M4ZsJQhcCk4WgtlQzlJ?=
 =?us-ascii?Q?j1JcI/aOaNyBTDrrgAjVyL1wkhHDd1amoY7I1XW1qoP1z5YGVAyq4qj9ZUQo?=
 =?us-ascii?Q?mxohm5VP5LLV/WnbcdBtqlld53gTNix5dDSdOHuhy+IgK0oMxaZsdTuT8MRI?=
 =?us-ascii?Q?NlPkbUeCKiOdOM6CgJ1ikWrPGyQPOLciEKlsdXg/w0Z0On/vdUldJwGZxlvB?=
 =?us-ascii?Q?s0ZQLkSA7myCIrC3rWHCz1OkU07oBIDzqLnnT/xoVV1H9iy5EzL8wOMMDMOi?=
 =?us-ascii?Q?T9ZmCCgTbgHljCxrcyX+rx+bVALP80FIhOtGQsB6Z3YPK+ZRqtv18fw602bm?=
 =?us-ascii?Q?0MvVkJBgZuqs5siszLuIWxUXSUyf/aELz4MLR4DeVGUbCY5u91xwV0WFymQo?=
 =?us-ascii?Q?49A17cMpUDcIPWrmAP8dXkLhG1TXqdU24IQInQ3YWgznDeWxDeESpVCg451I?=
 =?us-ascii?Q?9B6+eGKJL2yF/AFPPhCzoZu6lNjrcNl1nocvNuwVFjPeXVH4pXzXL/+nhDI7?=
 =?us-ascii?Q?JOiy/xmsMSeicx5QQU7CV9RbbxoIccxGHSeC0qDr7JOn8mlA9C1YnGdwoMO1?=
 =?us-ascii?Q?702fCXCjyq+HsJoY74MiCR11/qTB9OEwql8trdgeKKhQ+2xTNAUigAMDzqtP?=
 =?us-ascii?Q?Gg/lYoLcS6hnLr21B6LVpBOd+JKxfJYQuicNlDjbhwtPKgJmVmwy8XVY52nj?=
 =?us-ascii?Q?vzCrSc3/YgcTGGlsGGLbsFrE3Zd36rkNR2ZWjTugQPcS3UwDXwl8nhEc56fd?=
 =?us-ascii?Q?baj8doKi34CQHM/YqX3XRzwttQRXUZYuPRJBMV4S70QxJuVQ9VWMlGH+A9Et?=
 =?us-ascii?Q?REYWLArb0/4mLcMRjhbCYvhl0jh5zc+tdSoObpUqEBAd6ELochGlO5udbBp5?=
 =?us-ascii?Q?azpJu8y4Arx/tx3NoeiqasA2+yYoMaXJg4orgVoTTCu5dezrsZagmVSPsiZH?=
 =?us-ascii?Q?D+8wAAWlzp0LBaC3auQwjg72spXU2B3yYkvdNvnMYJsKgawrWv3OK5zW/ukJ?=
 =?us-ascii?Q?FqyfPRWKlk2E07GE1cTHbiKpCROHmxo4+DptbDSAWMKq3+ZUOA8r3uzbeqiF?=
 =?us-ascii?Q?HGg2KWWbiXq+g/eosJV1CAll?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f20c8ec6-f114-422a-181b-08d90578f993
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 10:25:39.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io4c+ECUNdhTmWOaeIllsTavUoICcK5+m/2MoUybaNaulebnWDwmfpuiNeekNlSlmMWjpL4Qwb/zeTD+9bktjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case that all pre-allocated BOs are busy, just continue to populate
BOs since likely half of system memory in total is still free.

Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 1f2024164d72..a48fe4dccd61 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -112,7 +112,7 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
 {
 	struct ttm_global *glob = &ttm_glob;
 	struct ttm_device *bdev;
-	int ret = -EBUSY;
+	int ret;
 
 	mutex_lock(&ttm_global_mutex);
 	list_for_each_entry(bdev, &glob->device_list, device_list) {
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 48c407cff112..539e0232cb3b 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	       ttm_dma32_pages_limit) {
 
 		ret = ttm_global_swapout(ctx, GFP_KERNEL);
+		if (ret == 0)
+			break;
 		if (ret < 0)
 			goto error;
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
