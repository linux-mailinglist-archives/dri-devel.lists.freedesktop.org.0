Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5333B0A42
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E156E5CE;
	Tue, 22 Jun 2021 16:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0766E5CD;
 Tue, 22 Jun 2021 16:24:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIQ5FNuGLkEOBH5eNQZee8oghqCvC1O2jrFWWAucOZBHTBecX6UIZOB+t5hzKwdDqjcvUyQk0eq8DHTx1QIkynUIiuONnPwpcFcTvSB0sfZJqAeqQ38J0aGyU4EdNRA/G74Mb99MwHUSc77f1AgXEnukHqt3EMwLWGm9GcnRbk6/bLYl9JAadlpr0eQG3VcMe0J3lOBJCACcL138JyQHhLfhKaKmpiGu6UI2D2ZRodWsQaZFch40CIEteWRjDaS0JcoZdZg5PyhMF6jxKV2+zzaFk0S0GUwncPr9sWWLzSzApXxEdivAQerVQGZFJ9T8vPIMzs2vduIpM4KSbL/5KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ1TL2oUsvJFC51IBukA21mX9pZS3FElzBYz+QaKu+8=;
 b=loOOQifNnoc2wzKnEhTvVvbvJ6mLbMMKgvqj8uWjLWrx030BddN8co1om6vFxW5u0EF2dkT69FMDBlz4qK0ILAexjR/oPA4rgAK37U2voTWdXYZIGSZM0nXNKy5dh6hq9VC/EC37gjG0HLnuihtSNTQ2M+13QelcvJ4S+FLo/rdgKSr6T5Le1mo3/ma40QjF5wnVL3kA/ESJ4kHHxO75AGfUjRSnFP84EbM95nHk3pMGAvKaW1dMJDXTQJg5Ak7Hi+8bZ616z1P2bb6VVDMlXKDfGBX4YbMYOD6EqLhN3epX2T2niD3qb1eN/1kw8Ou7uLlR+bn/zqoPt3AqNVBRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ1TL2oUsvJFC51IBukA21mX9pZS3FElzBYz+QaKu+8=;
 b=LAY+NTJp8a2Io6feuzlgnD8iEqGRNIHhTpCQ8A9Cq5C3CJHd1X+INgbC9soGpVeidbKAKTQHInGJMGyx7bqjgAmjhZCeCSz0nsMBAOXluysuVIlY4sCitfWLwM1gfO+VeXGvHewl50k9iX5w6+pheVPtdAspJW9UEYnThZn1ybc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 22 Jun
 2021 16:24:16 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 16:24:16 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/ttm: Fix multihop assert on eviction.
Date: Tue, 22 Jun 2021 12:23:39 -0400
Message-Id: <20210622162339.761651-6-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
References: <20210622162339.761651-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:5c6b:dde9:a4fe:685]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:5c6b:dde9:a4fe:685) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 16:24:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de273d25-7447-4e00-ff1a-08d9359a2dd9
X-MS-TrafficTypeDiagnostic: SA0PR12MB4399:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4399DBBBEE2C3A580B8BFEBAEA099@SA0PR12MB4399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjYA/nW90yO+Bf0jyJplfy3S+nC2FDT0/16LTHt87dIgLeU70pmvQStja9dt5T1XkxJnVXGRMlfCeLQyBtZwREaY9DAfDJhYci6M+ZQOE195XizF30IvoDNEO5CkOOq5XgrNjZPVIa27JAYNPIz15Z+uVL1ZlOXuwdGyi3gRcJI6LGj5oqOgi0b3rngVid6T/hccoJlAFjvHMaHMoTcUBkcmaFQ9Epiq39Ego1qPrd58DLiQVNNNN6fuxqUpC0cu1u80Iejz6pHLxBSUBfjwXNZtN3aFZltGUH6E2HAf4CysPDHYoG7KScOTBnJYK+K2vPIgZz3lMmBhM+xMrJI8WL/GVhFtwLxLedwPUn2iE9BZHCZ8kLs1cunQCgtjCcuCHQDItNBG+lZPPJnV+lD/4YsM74K6O9woEM8BuOBN2IkDkj+A3ttQKXafUKF0S2nGrPWsD2gwdJw2ZAOm73Ud/7hlGsBt70PmCALJS99Fc0EA0Gr4eqHyMarBdUJ6Jdk/eH16ZUnu8NJNWeUnEl4PaSXnRgQobSPPQU3cuFIvMWSfTBc31oSXCcCDhW8ZeO4CH41ZThlnZZuQ9GFauP2F+mA36UVgnnKnAotQWw9jwMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(36756003)(66476007)(66556008)(66946007)(2616005)(44832011)(2906002)(8936002)(8676002)(316002)(5660300002)(6666004)(86362001)(6486002)(16526019)(186003)(6512007)(6506007)(83380400001)(1076003)(52116002)(38100700002)(4326008)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zOceRIzIc9WCrWI8cjQFS1O+4pe5LczcgGar+g1cyvhcc5nHOHq0yUPeB1d6?=
 =?us-ascii?Q?NV4MqfZ9tB3Ww1ZD9zmFGThLt5S0ON5JQLflER+RSa9NU3rxzbtW0oHaSnMr?=
 =?us-ascii?Q?Ms945TGVYcPsKS/J4rthWnI5b3DsJ+lajBAza+y7cv8B4D/olAtkyRM1IeiW?=
 =?us-ascii?Q?DQhCXHmGh1EXSRN+Dw2xfY6W15zj07gV7I6+zhvh0K/q43HYcQ+RSqzsLek/?=
 =?us-ascii?Q?PsU8YluPGU2bvy5pJCFumkIapOfXTeHWUvUOMq/V+3y++Dtna2aRbJ7aFzMr?=
 =?us-ascii?Q?BCGV+1AytfIH8oDrNRp1F2PxgSFt04cC7kinKajP+HvniE/1u5dUeYbQogv2?=
 =?us-ascii?Q?tvqqAAKZZz6owjW4WCbjESqkrrSIaO+V6QGyoog4sFGZAz1sLegsdIWxwA/I?=
 =?us-ascii?Q?DjNAKPoFxtuch1QTs0ct3TauRaxeOlNW2rk9DlptgzsuR5W1YS1vYq/h9ZBA?=
 =?us-ascii?Q?ZOD57kutX8F4vKxbyZ8DjB0Pn1lm7yNX6XM3Ee/8je8bPzcsGHymnoJ7nqu/?=
 =?us-ascii?Q?qzitjgJlBCyrHY2WcdWLEReMmuThODAWDM0zScywb/H7lkvcGVaCBh89wITu?=
 =?us-ascii?Q?z2ZWIx2zBLSjZNssnZvDPmR1+549qUdY6zcR1Sepdh6T/0HmV+apyznDM9wc?=
 =?us-ascii?Q?QoIwohCJwxe9xOFOcTbrI6D2pBP4n7UnEHFdkxXVRcr9UsA+8c5Q294i+ZVk?=
 =?us-ascii?Q?p2G93Wnr9jVShSwNwwLL9i7n9aLQAbSF16k/YbKn0WM6uj0VMWrr/Dm8Tpzf?=
 =?us-ascii?Q?DO0EY+bFqWtejv/SFoPkF2e2kOblKbxagBFHLNKd353L65g+h5pPtSbQy91G?=
 =?us-ascii?Q?5bTeUOi8mUxNQVczC5ZkJ8+MlarczRRAuBdW0CTZUxcyCqX/OaKpYi/HFQM/?=
 =?us-ascii?Q?BxosD3vGWOdp/h/xlD3NzvXysBLDWEP/njRTFwWEgg0anrIovDyKIVgSyG7l?=
 =?us-ascii?Q?PIqttp+93CIn/Fczpz46hn9oFpQ5/qyOY0F9tWQ9laAfYvWSajn0LyWAx/kf?=
 =?us-ascii?Q?xCSXX0lBHGO+AILYLfLv06OzB0/6VDRbR78aHW4J0+x/VtZoEbJeUqvIxFa9?=
 =?us-ascii?Q?dyD9Sq6m1BAQvVQ5o85tUBzEsRGZHtPPiQJGDNPVo/Xxk2QLs6r89Ermpag0?=
 =?us-ascii?Q?nDkwy5ifPVW9VgopMs2EHWZi1Tu1uKsYl5i8gz6MgIENkHXZ0Ik76kCcq4Bb?=
 =?us-ascii?Q?txQjUEgSaup9IzIuzBu86IUh45c6fEVzb1h+5wIGAYYCLLXWDhfON1s/EcXu?=
 =?us-ascii?Q?jr+MQg1H1tVK5m5e5c8Zcs7WZ46QCvGLXNGpDxfVaT63fWQulBG5qbxufD2I?=
 =?us-ascii?Q?pNLMxHIGJo/ueJxq69hjf9Y2frHJx9U3cdLXHqnQdA9c71fgdG8dOCd1isZG?=
 =?us-ascii?Q?r42GCNcuBoYFhSzRLreTGcJg/1pb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de273d25-7447-4e00-ff1a-08d9359a2dd9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 16:24:16.2001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vb9De1/Yr9NAQ9S83+ztCmzJJyr9Oy9GmbbiNqsk3Y2JvzDDlU6/25bY7nasUbk+mPuFDTJRA8J2DLuYzkdwfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399
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
Cc: ckoenig.leichtzumerken@gmail.com, Lang.Yu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem:
Under memory pressure when GTT domain is almost full multihop assert
will come up when trying to evict LRU BO from VRAM to SYSTEM.

Fix:
Don't assert on multihop error in evict code but rather do a retry
as we do in ttm_bo_move_buffer

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 63 +++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 45145d02aed2..5a2dc712c632 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -485,6 +485,31 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched)
 }
 EXPORT_SYMBOL(ttm_bo_unlock_delayed_workqueue);
 
+static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
+				     struct ttm_resource **mem,
+				     struct ttm_operation_ctx *ctx,
+				     struct ttm_place *hop)
+{
+	struct ttm_placement hop_placement;
+	struct ttm_resource *hop_mem;
+	int ret;
+
+	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
+	hop_placement.placement = hop_placement.busy_placement = hop;
+
+	/* find space in the bounce domain */
+	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
+	if (ret)
+		return ret;
+	/* move to the bounce domain */
+	ret = ttm_bo_handle_move_mem(bo, hop_mem, false, ctx, NULL);
+	if (ret) {
+		ttm_resource_free(bo, &hop_mem);
+		return ret;
+	}
+	return 0;
+}
+
 static int ttm_bo_evict(struct ttm_buffer_object *bo,
 			struct ttm_operation_ctx *ctx)
 {
@@ -524,12 +549,17 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 		goto out;
 	}
 
+bounce:
 	ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
-	if (unlikely(ret)) {
-		WARN(ret == -EMULTIHOP, "Unexpected multihop in eviction - likely driver bug\n");
-		if (ret != -ERESTARTSYS)
+	if (ret == -EMULTIHOP) {
+		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
+		if (ret) {
 			pr_err("Buffer eviction failed\n");
-		ttm_resource_free(bo, &evict_mem);
+			ttm_resource_free(bo, &evict_mem);
+			goto out;
+		}
+		/* try and move to final place now. */
+		goto bounce;
 	}
 out:
 	return ret;
@@ -844,31 +874,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_mem_space);
 
-static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
-				     struct ttm_resource **mem,
-				     struct ttm_operation_ctx *ctx,
-				     struct ttm_place *hop)
-{
-	struct ttm_placement hop_placement;
-	struct ttm_resource *hop_mem;
-	int ret;
-
-	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
-	hop_placement.placement = hop_placement.busy_placement = hop;
-
-	/* find space in the bounce domain */
-	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
-	if (ret)
-		return ret;
-	/* move to the bounce domain */
-	ret = ttm_bo_handle_move_mem(bo, hop_mem, false, ctx, NULL);
-	if (ret) {
-		ttm_resource_free(bo, &hop_mem);
-		return ret;
-	}
-	return 0;
-}
-
 static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 			      struct ttm_placement *placement,
 			      struct ttm_operation_ctx *ctx)
-- 
2.25.1

