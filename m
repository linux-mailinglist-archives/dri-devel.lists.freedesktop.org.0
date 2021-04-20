Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C16E365B38
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 16:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F787882B5;
	Tue, 20 Apr 2021 14:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD3F882B5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 14:33:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnNoxoreDLp6d1pLgZvbNybXtQrViO+FFE8+56arXuYx2XsziJA/HYW+o2nbFHa/1FzV8trmqZeeewxX0RPG2zlFLmDaCzj1YakxAQA8QvJf7/MEDJuzuKWquCAZ0Wh6eK98fYpCqC3jnijDmX6ivmF9pLud/ixpsIgzrun0yvR2Dro/tTJ/LKhKSIX/2433vkIghT9nK3j8LNTfRVhDeaSMA2ex1s4hayTun3tBXydooJXRVGSGoBZaJJwQKWR2CcqyTO86u8G1LobljS+yZ0n1VdUG7DpnQR0Ub9uQzQSLQA1LqjC70ch+xlnPyKoA9OsLufBzLXUPcKIlguusIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iy2BBCxR41BCC1DRvbL9inYyCHewnFcmFJEW5Uy/xl0=;
 b=TsDUxmqK5Dx3DFE3e/zvpv/R14Rtkdppw/rYQGm1PKiTRD035MclPsInr/JEnJ1KkyDxGgxe/5VIMa5TcoZSDzH8I8es5p45tp62nfjFeAh87CxFXnqaHWOgrUDDqV9Tjv05d7ZS4GoH/ktqo0q2YwZLoluWKbKdMlNvGdEppZxIDNExkOKB2m9gMfM0naYujcjsKYemZY/hzXdaLhtoPBhzgh4qUSM1HVhLVfioR62Q5kBLTVi5zbdb1S4W1cKhoDq85QLC1axu5kMwU930MNpdYnrr6BzxsY/7uJtdwoarYIC3y8DZbE96NrfoUp6S1faMxhFh9oyyl2cTOQ8fQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iy2BBCxR41BCC1DRvbL9inYyCHewnFcmFJEW5Uy/xl0=;
 b=ozO5n8KzusaO0ywyiekys/Z5B8HbjsPpaPGpjdLMLiM6L21UGl3Ltn5yLrJlEIkK72LUrUwLmrrZlViZdfxxkuG24ZjnI9XfxDHe8OFM1E56DAzz9irTfY9NGV30szoJfntFF3K5W+1loOYrWZ4+CF9fVx4SAkx/6/5f4YVFhEw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3196.namprd12.prod.outlook.com (2603:10b6:5:187::27)
 by DM6PR12MB3097.namprd12.prod.outlook.com (2603:10b6:5:11d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 20 Apr
 2021 14:33:19 +0000
Received: from DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392]) by DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 14:33:19 +0000
From: Shiwu Zhang <shiwu.zhang@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix error handling if no BO can be swapped out
Date: Tue, 20 Apr 2021 22:32:57 +0800
Message-Id: <20210420143257.13865-1-shiwu.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR02CA0212.apcprd02.prod.outlook.com
 (2603:1096:201:20::24) To DM6PR12MB3196.namprd12.prod.outlook.com
 (2603:10b6:5:187::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lnx-ci-node.amd.com (180.167.199.189) by
 HK2PR02CA0212.apcprd02.prod.outlook.com (2603:1096:201:20::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 14:33:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c5ae965-f167-4704-ac8e-08d904093e0d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3097:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3097C36D2FA6B13263A12F3AF9489@DM6PR12MB3097.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5MJq1KvJEPglE+Tjns/I9Kfw3xpoyf9dHjNzLP4ngiQYtAE1SEmpN6bzOCStgVKd2oURWPeMzyRlsCrp7aIcTcbkaJPVldq/FZbmo6jC97NbBCzKB6P1K84CTs/d4p//sVKxG6X4qsof3L6Sp6YUf1L+Oq2Wlj5R85BtUtsj5Wbq2Rp7gsheCRtMrpK72DHNpxYhtQyLaVA2EEl4Ab+qPYVZabTzIgVwHvqs5wOC0Rdmlj8k27V1QjI3K3TLsXj7zJQHokQn55X4DGPvomoxV5jPrSIbkDxOKbHbEYhRZ25XL6lW4yAbcA7N9gNc4sin5Dr7/30gkTh6kAIGVEBiK6LVElXan2d2SvD1hks/7vISIb4kx2S4GJIN/DnoUkj8G+/V7xbWzPzeKvJEXDQQKdVm5pEArvikVuq2oO0bpYGTB3+OKriWMcwW9sRRDUMIWf1r8likU+5KTWbDxAKR03wbH0eKTR+1q2X01BF8nfzy1qaO9Asj6zB30sfNdbOJl3x00gHEVmFhJYulCpCuXieFtkjWyoxu5CEJUHhu6WmOoLZTHV/HrTlIedfYrVVSh6W3a5soL6rL8G8eVqdEUfjKTKXWwoaK6My1bKCAQ7cDb93zBD5aI6QnD3/U4i5stRxmTTyhfY6vrjboVW4G7PAC1L8QMWV6vc5xzFtJe9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3196.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(366004)(86362001)(6916009)(38100700002)(38350700002)(44832011)(8676002)(6486002)(2906002)(4326008)(6666004)(478600001)(83380400001)(66556008)(66946007)(66476007)(52116002)(7696005)(1076003)(5660300002)(16526019)(186003)(8936002)(26005)(2616005)(956004)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/Y7w9Xn/1eKxdHepPUwk1p770foyhoI3J2aba9ONIJ3EiSOnrcYG06RzygHa?=
 =?us-ascii?Q?lYu5LxlqIM/FTU2Um2G9jvwbuqa76HkvrG0ZrXH6e4PaZwC6XGhn87Wi8NLd?=
 =?us-ascii?Q?JrdTijZdR/Zc/MFX0Jrb8sDLE7hFQ0FuJCA8GkyP8rwTy4Nw4zAv51mHTca4?=
 =?us-ascii?Q?jDLV1hwueiFg0d5Y4KOlwETxX/xk3pfSqkYn0WMfBhp8/e/rf8jbAudSK2aA?=
 =?us-ascii?Q?PsfAFXtZONqDqlvP8udzbM61rJymA9PJWpk+8bjYiIawgTNVzfBTU7sGT2du?=
 =?us-ascii?Q?2VRxuP59eYmB9cbxGOE1cJ8/Kt8y+qP1kbKkawgxA9vOrQTvegdaKUPH3Ypd?=
 =?us-ascii?Q?xSEJEOzvsd61BIRpBzjU8BNtMKxgUvIAKqHcMCUH8ZkFDzsevw/fsX16i8lG?=
 =?us-ascii?Q?5d+EKiCXaAviT+fzCF7R56sVkxFa7szFZR35ljsWGsega19mdBT6GN5yR0av?=
 =?us-ascii?Q?BXrIiQumeYa06EG1MjpOM7R2NDLybYjRMnJGDJ0LelOUCnlxIAVsqOSblDqT?=
 =?us-ascii?Q?bYNuCEaHqIfxn8PzsKM2qMsKXYjKc2Xx+lj0XdfurlA2cSKMwggtMstJIKGm?=
 =?us-ascii?Q?Xeaeq/4ygk3IhFFzAaOE110gjchxfBhzRO8jx/21Za7wqCMG7CkvdxUmnlOA?=
 =?us-ascii?Q?SRPBtnhazuvcdROqi51I6/m1mncx8y7Yg8g5RmPji9TDPOu09Lzt3rRRZc3D?=
 =?us-ascii?Q?engq+pncUDVV6v9kq+gOloXoFixLjJeAqtDdS7grnHcG+tLsTgzGITw/2IJi?=
 =?us-ascii?Q?lT/LVNATH4XTUNAEgMXBTNbEwW6zfFs7DCKpj4l23YFVyBjNernAMuIcuZgH?=
 =?us-ascii?Q?rrWJjrr3BqFi/GnDU6H0PPzA6Cw46uC2jY1porwTWxhjHvKu7jVYEXJBRUAH?=
 =?us-ascii?Q?WP4j0o/bOBDe6VuD/IDf+iLgdmZQS83DBiqbVqnoj8brTKpsX1WCl9Mg8DmJ?=
 =?us-ascii?Q?O8oGYLj1eMQ43bdJ9gC2sXtyDRJUPQm3M8nbNrRRwJObl8j+xIztF8eakTWv?=
 =?us-ascii?Q?gzgWnBqa4vrkGgyLwwgiT0Ex6enpnEHlkmNTmIMboNCXfpKMYMFu3O8ukH/z?=
 =?us-ascii?Q?013/ZgcEhr3k33sQLhxkNYctYY5iwFwnTHl2wcBKu0Yf6Ft6ccYsoqdMl7NB?=
 =?us-ascii?Q?QCr8snRHrx4FhCXLO180iarYlEc4j8hL6vcKRcAjjmlG9MvYQVQKKRb/1jCt?=
 =?us-ascii?Q?6X9azzQCTETkxRqER78iKTQNW42LcGL/wE6arf488favmpMJDx7QzyKGudMY?=
 =?us-ascii?Q?3Bs+sPEArnl9eXULUJHfUMZ33SF/EX5ZFM0GeBV3rFO7AC65VpH4nQt5toiD?=
 =?us-ascii?Q?LAQ/C+ze0Nld7YLU1ddZzlnl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5ae965-f167-4704-ac8e-08d904093e0d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 14:33:19.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVF2lDNc70R30rAD3GxUzLdseJ6g2+elijxLU3EnntK1+STtXQECQSegoSmI90X1hf+GGajjT+nigKtmygtVag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3097
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
 drivers/gpu/drm/ttm/ttm_device.c | 4 ++--
 drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 1f2024164d72..0200709db9be 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -133,7 +133,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 	struct ttm_resource_manager *man;
 	struct ttm_buffer_object *bo;
 	unsigned i, j;
-	int ret;
+	int ret=-EBUSY;
 
 	spin_lock(&bdev->lru_lock);
 	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
@@ -161,7 +161,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 		}
 	}
 	spin_unlock(&bdev->lru_lock);
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(ttm_device_swapout);
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 48c407cff112..4e1e06a04428 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	       ttm_dma32_pages_limit) {
 
 		ret = ttm_global_swapout(ctx, GFP_KERNEL);
+		if (ret == -EBUSY)
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
