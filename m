Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976112E7413
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 22:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C68489232;
	Tue, 29 Dec 2020 21:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4932F89231;
 Tue, 29 Dec 2020 21:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg3h0DbDaboQtyG4SD25xBXl4q9R03ayJqpTRu08CuoxWM2W5TjZ11+zl+dW/V5ymuyy9bLOkwQ2LPnLgbOabBruOkajF3xGtwgM34giTCwNM7lpQufs4OL8pGDvmLpvBauPAf2+YPGyq4aPbDUcnpZ5KFYpurKoOh4LnL7QOndmrBarTRzbwAti8GAg0iATSO1TeCrzd/8eAICa6q5vN6MSAnKghggXfClElyg5V02ruOwg5BN3UsB5p9tofkqBbnUvEVfw8uYt8CNwQ1pMSX5PuiQ+1Mgk2b6pmOHb8GCWasY6TAkHBOSeyY6OheVlq1OjMuzVyqSIkV8mlGlHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ2nJofzgi6Qu9PVBaYNuJpo9ZIoSXBWfvdGytSok44=;
 b=grv2QxcR+6YFHAUKbLvfp4OtFkx9KIPd7EPrEGu2u5uAPIi0qJrt541674h5oshdThdSx2wzFqEmjqITp1pE0CacU5MdbC7+QjsyRmna/oE5kTsDG6TBzQBB4ywtc8hrnjyRjPIs1ZP0IZIQ2uy0StlK8iOgBkbRzLWtWnwPI8O/8H49O8HrB70q41rXYpQ4d3b2XTeg1K+icvSSKXtxxr0GCW8xf0gF5/7o/XjZ0GPgZm5qBEOB3W8Kb3ac9Rgw7DoH4nig5ND5bs0hB+6Cr6vRLDz+iCGp/Yt9AIspAJIlamTl2jv3eLJzePtMT7CqXWsF4UCkmavfgvTTFUBW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJ2nJofzgi6Qu9PVBaYNuJpo9ZIoSXBWfvdGytSok44=;
 b=TV1unBTzKj3tBgSSUYuJ/K5xyfTY/SGNwMbDjwlfqw9IiwsSVN/MzQVZBKrhQVRvTKD2td0lbbvufNis1UYrLeZ/fzUe0oc6gF0Gb2prCz8V91fXyKFkBLRO4k+9mCytgnVH/cmhBKPC8HT+0oBl52G0oeRrSAcGyEpwbRoxESw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2971.namprd12.prod.outlook.com (2603:10b6:5:118::28)
 by DM6PR12MB2971.namprd12.prod.outlook.com (2603:10b6:5:118::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 21:10:57 +0000
Received: from DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0]) by DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 21:10:57 +0000
From: Zhan Liu <zhan.liu@amd.com>
To: amd-gfx@lists.freedesktop.org, zhan.liu@amd.com, Nikola.Cornij@amd.com,
 Stylon.Wang@amd.com, Chao-kai.Wang@amd.com,
 dri-devel@lists.freedesktop.org, Nicholas.Kazlauskas@amd.com,
 bas@basnieuwenhuizen.nl
Subject: [PATCH v2] drm/amdgpu: Do not change amdgpu framebuffer format during
 page flip
Date: Tue, 29 Dec 2020 16:10:44 -0500
Message-Id: <20201229211044.109020-1-zhan.liu@amd.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To DM6PR12MB2971.namprd12.prod.outlook.com
 (2603:10b6:5:118::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.amd.com (165.204.55.250) by
 YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.19 via Frontend Transport; Tue, 29 Dec 2020 21:10:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9c526ce9-a48c-4855-5cde-08d8ac3e3c46
X-MS-TrafficTypeDiagnostic: DM6PR12MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2971611353275A3F5FDAF2D79ED80@DM6PR12MB2971.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZL+nWwh8Ge674NkHKaaQOEOyJ5Ft7c4xImAQrRKgV30laF/O9kDRVC2g5w3cd94IDUWUaJkNC55tJdMoAPnP/bHqPpw5vzHsZMh8FrviZ+lFqgTx/pbIrOKVj/vioHwt9lqbezrJWwtU8h6kQII85nD0ZN4lctyrf+knxD++LqvcP/jRRmcncyVXuNz9Swt9er5JGqtkKRufFOunYOdWR1XQVknWdZIAueq+dmMD86k1JLJLRxbu/bMJijhhcMeGtffyCOKk1JCOVwkIsdB0HCIPRrMTzvcVtCqmZao4CQ80dRR+/ekfQfWPhdSiBS3sUocbQ1WxaQwYdV6qBojdS6Vleb3cp/GHtYAB0reOnH2bdXo8FQgIqZQm15Fwqa4HzwJ2nA3WEEPKYbPMhMBB9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2971.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(2906002)(7696005)(86362001)(6486002)(36756003)(26005)(956004)(316002)(83380400001)(44832011)(8676002)(2616005)(66946007)(16526019)(52116002)(66556008)(5660300002)(186003)(6666004)(1076003)(66476007)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fi/9s8qHzyou9G/v22vOdM6xj76zDZljr1Ciuw00g8YhZ8SkAn+2rxCATdaS?=
 =?us-ascii?Q?q5AoiUDNTOK/9kJsOsWW7S+WcnsOBpvURZZrwpexJHyOUbRGhCN55r2hD6/Q?=
 =?us-ascii?Q?cVawcxV85uV6xu0X1RLlGzeWa8z5XcbQ4uT5m7wMujs9xHmxrkX4SZNwUHRQ?=
 =?us-ascii?Q?YDy4o+n6fVx1AzE17OEALQW2k6zWyh792Nq7t1V1OGrGLK24MvQ+LU2Dkq49?=
 =?us-ascii?Q?W7X1iNoj8HuDC6A5qwdUx0sRiBorwGiX4+78H4p1ybLd4rEcriGtAp4o80hI?=
 =?us-ascii?Q?EticrEDwLK3fGJyO6Q64PYBtYYWGbspH510TJsd4oAKoZJgC54DvTITd34jw?=
 =?us-ascii?Q?+++sqvIqoH+OgoUUi9816sgXpkWP5FUa47x9PJSyHI0v+3RuyaMEcxcP5Lr7?=
 =?us-ascii?Q?4xBPlFMgQ0bOheK68WtY6agaYwTO/OnpH9yE54BrtrbX77ClyoHQCnBSGVWI?=
 =?us-ascii?Q?wKOiAPPERA2PNnnWW6XiffYOhTr8tasEHwaGFKLgp9HPTRbvBRZiXgjh3LVy?=
 =?us-ascii?Q?ErS4ajMcWyxad9we4zb1BvxaTNJ1QnH9b1adQ8YgHjuMhFMK8KVvLMSH2+Ni?=
 =?us-ascii?Q?Ac0FyC0poZiiUpA3xSR3g+Tef97p6IYn5kuzdgWJSr8Rg9eQ06Bo3ApQ+VP9?=
 =?us-ascii?Q?KwxKGgouvI0/Q59Ceecyc1aTNTUW/wPkWBxgopFe9Ao/j9MHLsKCppAhLRv1?=
 =?us-ascii?Q?zqfCS/goIxXod2DEQLJb9Ykm73YV4nx0xKs+NYEzo/4SGKIbGKPZ5aw/6tAm?=
 =?us-ascii?Q?sf/JnXAbxGXx5IIv9/bX4MO+IsK8DW4EsAOa0A7dudO9rp8jWHARKyULTu1H?=
 =?us-ascii?Q?WpGYRdl1ZhQ9htD82ycnr89KKlBS5dxzn2Gt+KgXlSuNyAOmllnTG87SwiJb?=
 =?us-ascii?Q?gTAiwjnp64k4ubKIlMl1CUVZQ9byLM/mEMMVZ0BRtywA4sWle/JUcD0+YGJl?=
 =?us-ascii?Q?ytxAW+0up/7zeQFti5dPyT3dddTMFbD4+ZKvGLIyeXulExm0Y5rU1eFhxZts?=
 =?us-ascii?Q?mtXF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2971.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 21:10:56.9550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c526ce9-a48c-4855-5cde-08d8ac3e3c46
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52wUGSXMtKCuShypwzjpXOqG5il4FTeeDQprcTK+ICRQTLwGn+m3RP1HgciHr50h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2971
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

[Why]
Driver cannot change amdgpu framebuffer (afb) format while doing
page flip. Force system doing so will cause ioctl error, and result in
breaking several functionalities including FreeSync.

If afb format is forced to change during page flip, following message
will appear in dmesg.log:

"[drm:drm_mode_page_flip_ioctl [drm]]
Page flip is not allowed to change frame buffer format."

[How]
Do not change afb format while doing page flip. It is okay to check
whether afb format is valid here, however, forcing afb format change
shouldn't happen here.

Signed-off-by: Zhan Liu <zhan.liu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Thanks Nick and Bas. Here is my second patch for review.

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index a638709e9c92..8a12e27ff4ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -832,7 +832,8 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
 			if (!format_info)
 				return -EINVAL;
 
-			afb->base.format = format_info;
+			if (!afb->base.format)
+				afb->base.format = format_info;
 		}
 	}
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
