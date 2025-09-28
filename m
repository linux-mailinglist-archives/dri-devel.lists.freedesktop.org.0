Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7CBA6CB0
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 11:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A99910E390;
	Sun, 28 Sep 2025 09:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qPAYykua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CB710E390
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 09:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLNfU39ByQF8L0Q7adpAayXAkL8BWFTTpr6QwjNSp28ezJ8pmwqDKL0VrjdnkuVCKBt/u+TOcrGYJFV6sLnExIwlVH1QYz9PWD7LHVM81nqBILqdMBx0Qk1dqy1lYGwTy7biwbHeeIpNPI6pwFpm0+AEPsQ9hf38c7EiYBEQeQ9yta9/O1yiU5WawtAYiFpup74FHs4cguaAD4OlRcUB9LlxHyCEtZPqUXSbbbU0lvCpOriTuqSPcufJTwPOlF4ETfEbSYm+Yl4GbkYS9QKnO/6MI5c3oTatNSe1i4eP8/2zj5NnUTZKG2wV8aV9g5wC4a8jfI598dr9GlOQpz1pIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEaZZ72mspNTASiE4HYy/1H8weAC7yYw3VK4Xl5LZJI=;
 b=AzROYmZyFf1nbw4CZuLrNaByB97XwN1Dn6EmgLBYThPAQ0xbDHGTlVBMajsY50aahPT7inybVS9woKDCZEd6QUOXdOzNftHI5hHso/gRiaWnqHSJ3WLHBKVf6dEqC7l/xDtaWQqx07VxG0sUKn+o2DcdfnlZQWUgaRKxCLnzELK9RXyv9qSuPRi6gGt+PJqx9N6PKoFHcMJ4DUEYnaoHRflOFylPZPWyt9Mcmr0MXGXjOA53IqUHZEB6CIME8gW5N0kKpuu/NUEiF8GMowonsAjGkQjDxWujCk+ih5ij21WWkSgTPKn66PSs7JD5scf5l1Azus0KfFaWmqUsx4uyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VEaZZ72mspNTASiE4HYy/1H8weAC7yYw3VK4Xl5LZJI=;
 b=qPAYykuaFJYJ3YGbWQ0TRIT7riusoy2LIQ3aqp6lZM3YgHpQlkGipPQKY9ntI6IQfrrE9BflUP3Ur5Jhx17u9/mgZi442Q8HN8q3P25wqKIhL/OCGtnIt8+PETHGXM7ggsuyry5zO3FOWiDKAOYUnbknV57ZTne09njQBhZkBNgoNCabNZbMxZTSpf9bT+ftfXew5k5cKQlXCzl+7lXo1P4nzvlIqMa4y8gtoZdxfUVN4kn/43rhTTTVmPN/CO7C+PPR/MMWZXEr3HEhYmeAm7Pn467a1gjhT8at1JB9dHI/5pPiAVz+uUSbEeAy3CcjHe/1MmoUP1nV/c2jZmz6Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::9)
 by GV2PR04MB11302.eurprd04.prod.outlook.com (2603:10a6:150:2ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 09:03:47 +0000
Received: from AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7]) by AS4PR04MB9624.eurprd04.prod.outlook.com
 ([fe80::fa4e:dc6f:3f71:13b7%4]) with mapi id 15.20.9160.013; Sun, 28 Sep 2025
 09:03:47 +0000
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.co, simona@ffwll.ch, marek.vasut@mailbox.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Rain Yang <jiyu.yang@nxp.com>
Subject: [PATCH v2 2/2] drm/panthor: skip regulator setup if no such prop
Date: Sun, 28 Sep 2025 17:03:34 +0800
Message-Id: <20250928090334.35389-2-jiyu.yang@oss.nxp.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
References: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To AS4PR04MB9624.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ce::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9624:EE_|GV2PR04MB11302:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d948c2-7936-47f6-3fdc-08ddfe6deed7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|19092799006|366016|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fJpk5aDp9d2rKnrQXpqKz7EHbEK85VTmFzMV2ecBsAUmQRA4q6gtLAiwiw+u?=
 =?us-ascii?Q?uIBXxPQKXw/CM/gFd6pE7sKbYR37sgUH918VKpmyW+ChxIr1+xUrFpBdiXEt?=
 =?us-ascii?Q?f2O9p21vWFir39iiWZJeks/miuU6WFDdwYKs46aP5CVsGLvmWMvbAuD4GLiD?=
 =?us-ascii?Q?NJfNCuQhybe+GsyT/VC6LblMlG1eWXMCzGqq7IlhUrgXwAv0NP9/ItqTny6w?=
 =?us-ascii?Q?b6Z8cOFFWPgEEtjv2tyPRs1Gq2gmmd0B7gxo52ZjzgyQcPjHZgN1A5bZbmda?=
 =?us-ascii?Q?7j5z7cbjs0nMtrpqvAFYrZDYWnFOiilxEYiDB2hpoQjHiqQQFHUTDElNDiAu?=
 =?us-ascii?Q?zbfvpzsUpVRt7B+BMG1+uamBBOAfeStmDEfg8JYk26mjnlYeguYrLXgaldfd?=
 =?us-ascii?Q?+s8MYX6KTAhDhKCUYoVhHdsh9cteI3k+IU9XWHEJh8CNt9yBFHRU7bWcH9P8?=
 =?us-ascii?Q?DzvFn5bO1fChjEv/NLK4uHmnx52rRY/muMWhn1n0jvN7RDK21EpSgcikQu/p?=
 =?us-ascii?Q?9sdDZSnuAHr2rffm4EWxAcycl8pwOTulO6JFc5QYZDhywZQII1L9HeI/rtbm?=
 =?us-ascii?Q?boqZSDL4Amh1UjQRWwkV1X08Hfnh1ac3/d0MDKFgboQSZSQ7imwBDXqlXuzp?=
 =?us-ascii?Q?QK4Ss1upuS53qp4xuW8nmZ2Qo71ZcRtjgW3mK4yDwcY3bqpIb7/m6ry9Egd8?=
 =?us-ascii?Q?Z6Qj2LX2IjSzEPjEdGe4FpeV90zEmW230B00TAbCjf9neBFD8QHnrF7Wz9wD?=
 =?us-ascii?Q?BlGK5Y0mGs4TuTQhH8zQ5ZzfIwfMzhhFqiJFE1pNvtEtrUfmQ4PgRuLBLKyo?=
 =?us-ascii?Q?f3q8iHGmZwe14EHvsQbgJKUEFjOXSkDwuC8bk8tIHXVsUEyij+AofAYNkiyo?=
 =?us-ascii?Q?FWxC6ipyyAhB9sGS+bnnfia9b2JV1MceRKuoDEXcP03TzSqxNMo0oN5S561i?=
 =?us-ascii?Q?bLpjzmu1UQ8Cuo80Jfy0NyyO5y66AoLlOh8EI4BxTKXBBslAraMYwWHrlbCa?=
 =?us-ascii?Q?LbMez4jELAVgSn+9gvMy6z8LEyE3MNZTHEgT1vwY8Y/NE4WCOf0YXt5OKTGG?=
 =?us-ascii?Q?ZOkNRuIzvD6F5an7dPHFAk8I0aYx02Q1SnSyLhgARF34LBIxtaoMM1pkdGrG?=
 =?us-ascii?Q?rkYyBHTIF0hJ4IL9JQGrioh2psSoRuvXLcRd7BuHE4EdsP06iTOaL/PCsOdB?=
 =?us-ascii?Q?FJjL7LSYn20IFtJW28AeUEqgSKWYTnow34MiTzvJYwzIItv/c5b5gFWfm6Ld?=
 =?us-ascii?Q?SEDfn6XT43eoqVdsyZW9yJOLIvGo83kQfQh+mEJG87aEzfuBl9I2hog4Q8Vu?=
 =?us-ascii?Q?dR8DYbmhC7JGfNTFkONAZWCiodok3Sw/8heV6qjD0LeFKP3N7t5FmY2qgTOy?=
 =?us-ascii?Q?FVqDcv4vJHJob9Irxp1y0/a/yHkJmMi4VRPT85GV/8J9Vqyu4tUjf5t+3EFD?=
 =?us-ascii?Q?VriJyY9bLJtDAZKMRqibBejGHSpJ4E2ljhOtEJC+zeLq+YqPq2XyKtF+G5/5?=
 =?us-ascii?Q?W9aFqD68hTHli0Cj3sEIENUYa2+0LCw2oYxv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9624.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(19092799006)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?62eELKQiGBJDSzM31tQ87IwCGTuxSKd9g2gOqnjaWhSsjNClh30/rUVwXR5e?=
 =?us-ascii?Q?Kul8D1wutP/d2ICudP/SV5LzeUGhMap1C7YjHacmAOw8/pypWC4ZzItTtgGd?=
 =?us-ascii?Q?6RtxSk8OzNvT9pDrBCGHByIoTQxK1joAzVw4mAKYafkSCg3GzzOAqg0USgml?=
 =?us-ascii?Q?Dfm75Le7eudTS2DtmWglQ9GCFgd+QfVWXDlYCbFc03gtEYAo9UxPguFelmNj?=
 =?us-ascii?Q?LJoNt6yv8iin/Tzir3Z1Ikn9UsLLrp/2D163usU2mhDea4yNUwtUO25v/3cq?=
 =?us-ascii?Q?73jl3NldQEf1pwj7MHiY2OkVJYNM6xLhNfdLrQMvp+aMXxDDM3vgUUNy8gm1?=
 =?us-ascii?Q?fVxoducCmPMggw3f5p6n0fp+eRW/kHsfb+1L2pMMpmc7w8nGiVtSjPdKAzG8?=
 =?us-ascii?Q?aH27qGAyg5oo/tih9kT2vqs7BVfDLjbbhFxBAhX8GfyNyn5jZ++6uE/GPnoD?=
 =?us-ascii?Q?aRPx7FZdQ9YH61flJMoYpZUXlrrrETZPdB9z4dBI836tmFJZWUHQwGS79Dn0?=
 =?us-ascii?Q?n6LoVYU5SThtWVrfpKwX0wz9P65NnExHNHHMJxh4reiGH8AZ6vqkm35/yDNv?=
 =?us-ascii?Q?rUifeF3y0LP1m+enuz2SifSKa6Lx9i1CunBF5EMlc/XKtu7Ys/ToN6/5s3Bi?=
 =?us-ascii?Q?1IUZHUGZZutBVtumHF7Fi/hqO+ouFIw2e+jVE97RBfnkuxSPtuMtQdOP06uc?=
 =?us-ascii?Q?5HgmNnAXy5gB2RCETURt8NlBSFYEnIP7ZSqDF6U8OHWd0PJIu5Al82MfAPtS?=
 =?us-ascii?Q?FD9OTnLkDwIFhvrE4u9Dpw9JlQiYkeS/xynP2hPwA+GG3Yf8pbu33uXgeSEt?=
 =?us-ascii?Q?0nDA7KJpa6s3jVVgbzavbl2sWq4ZYiUJi59KE1lAycjFXbCR9AqtkHkjSuuM?=
 =?us-ascii?Q?wX0gIkQnWqzByiFkjo/YNIDFpGTyvXCLiT6GUlPhnpZlf85hh7o3fEOCyWT6?=
 =?us-ascii?Q?Xp0xMnJpXujMgDOUCP+gkQoyJBrDteKIzx3K7wtJg5N+sozenkaQZYSKKiln?=
 =?us-ascii?Q?2jMjHW0JYBB/ArtyqorSKVJkU0r6dNSzGO9PvhD/1sqky6/aVxRKwcM0snhI?=
 =?us-ascii?Q?ngKzYzoXSt1aP7Npu5Qupzoh5g2NT5UeUqZGAdPeaYU0wjGup94RQD+DCsHy?=
 =?us-ascii?Q?74BPFiXp79SGr9DME8/wD3oDSAM3CzLK1DZrx5RyqDSzfjQ3gFov90DW9wXc?=
 =?us-ascii?Q?r5nHnvTL6g3XD1oax4z0zr5rGWUArE4aB204VoH3NfxsRlyzWV7wlBTMdmmt?=
 =?us-ascii?Q?kiiwLEOQHNFtirXMWbqkSTWHWMzIOdT3JU3T2DeJJ6l0MkXYO744XVfQczrZ?=
 =?us-ascii?Q?7N78r8Ag3b3BjicQ6b4CGIEMlwFPDsjACBK2L4ow/g1K5i7zb5vWtVGJQgCi?=
 =?us-ascii?Q?bGeo9dyAkLtTDZiRvMxq/z1bTEXmpemguecUS1vv8S75mpGZmJoA+h1B3dZb?=
 =?us-ascii?Q?2iD61HQ0tp6rCcUC82mPIfAEyt/fPyL0MyozLK8clACi3KvRBReph6XYyCRI?=
 =?us-ascii?Q?JNvSTzzRygoGNsp+tcSzPp/feGjTstvLVGubR3gqEVw7Ipt2VWB/8vMSoRhI?=
 =?us-ascii?Q?D6VmzjiMxhLteldUn8wmdKFGHBo640aM5udzmyyy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d948c2-7936-47f6-3fdc-08ddfe6deed7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9624.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 09:03:47.3658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgagYFgx0VDUpzx6rvREiXHsFh8vCsNRIvRXfB7Ye4tbCQ984OGXClxF2Io+dBgfd2TbZD7P+0aOLF93T3DXqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11302
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rain Yang <jiyu.yang@nxp.com>

The regulator is optional, skip the setup instead of returning an
error if it is not present

Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 3686515d368d..2df1d76d84a0 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -146,10 +146,9 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	ptdev->devfreq = pdevfreq;
 
 	ret = devm_pm_opp_set_regulators(dev, reg_names);
-	if (ret) {
+	if (ret && ret != -ENODEV) {
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
-
 		return ret;
 	}
 
-- 
2.39.5

