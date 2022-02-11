Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015324B1C48
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62010E9C4;
	Fri, 11 Feb 2022 02:31:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2125.outbound.protection.outlook.com [40.107.255.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAEC10E9C3;
 Fri, 11 Feb 2022 02:31:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjoDUp+6IAt3TmNvWmEvU5i5dq1hw55MnOdxjOoGxLeSsL21K9GC+RjIAYuDogD9hyCMSmAXDXIBuUTgiY6APGygabA4afG2YAeGiydwOrOjePujemxSlrOibEzMhOSgzzHS5Re+fNfW25ev7KW8zLgGAiWP/g+IqJQFb4bErNAYMXAyeph6PP8/0kbBdSQDJmm/Ssrx3IX27mgvrMQexYQ/cs+dbLdy8mkBfldy17bKRkYbCf7gjz2IulcKS3ibjB6qdW15u6FQURLToSTT623qO3hw/SxxCMfN9uojGyu0UitKm/Eepm77bNJrzZa9opUBd+7tSWgGE80RSHDrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXuFDjruBaKh8CiDorxYd0K6ecHc6UY3H0229Ft1TgU=;
 b=J7gi71L1mH/Ktf3wkuLBFxRRtLhg+rl2PfYhyKGblXrUKQYtBmlG/M6bHM0/+Ec4uYNgeyvuDF6NgtCfYwiB0H5sKRtJubcYcDFCTt3fvSzRaZ3JirK15OnKvnaYiAUulBSav0mF9Akg6mnl9g0OKIwu0VzZ7whvEUVnT01JtsHfdDExhAcqLiwMyqGrWcWo0x9ocnTk2zUldBx8iudIcvrBc9wkuowq52zHt7mmhjLK4ksMOVV2tVtehtsEIXfKI1Z6Ib5/Yc2hOXRxBVJ6cvod9w2JHXwhol8qO5NwnuPLqc45CBlDBiOC3ujRLT+FO0TPzujJcYhlMhO9bSWfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXuFDjruBaKh8CiDorxYd0K6ecHc6UY3H0229Ft1TgU=;
 b=Rc6ZjedPMda0v0UqZ5HITet1gmi5Ih1I8cJCwPlCg0Bo+7IxJ5ygEf9U/IO8koI7VFPRltOPrRIFigZJPp0n6gbeHfbCaWxsJplrUnXqFE+GM1QAvjilZQkT835M92uSEP94vMr1GCHeRRC6vyzNJeUAryGfjIKaLFlA6TSkuWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TY2PR06MB2895.apcprd06.prod.outlook.com (2603:1096:404:31::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 02:31:32 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:31:32 +0000
From: Qing Wang <wangqing@vivo.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH V2 3/13] gpu: drm: i915: use time_is_after_jiffies() instead
 of jiffies judgment
Date: Thu, 10 Feb 2022 18:30:26 -0800
Message-Id: <1644546640-23283-4-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe8ac258-883d-4bb5-0ed5-08d9ed069dbb
X-MS-TrafficTypeDiagnostic: TY2PR06MB2895:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2895D78B3ED8D2EFC148E95FBD309@TY2PR06MB2895.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zo/R/bhk4YPH5LccKiv+TX+wqX7W7/D25syY6RvkcP1xlIoeF4bHvdEVY7ZVn5LEZhd6FFobafjLvqiGAlNDktxB9/L8f6gQJMQFWwlhH9VXNBZQ7s2DIBDExQkvb7SUY5X8oqPNGlH85qRmigyEWfKVGchpeoKXRGww4S4OyxcTAZwwgRnO+JA7xLmQFWA2HqA2SDtwO39P1InflK0McUXYyFFDjZ7RdjgOvNkMfsqdQZ8Da/Bd8CJDtH+xS09saVOq2GB1R0mtTJ0Y/0JHhZkYgLCpRhPyZXVE7zhPT66CBo0xJrkWHwQCVqsgqnKnDMATM7pBHAedgfouT073upYp8bgoH7dUhk+QfSQKnKmgOTuiPY93JBWZXfSUIDr0p/+Lk28y5Lai+DpaHk7nLhGaJywUbTOC+zsLVOfbZXiYhqNnMvlON1uxhYNAYTGvPLlsf5PSNx018TCNjmhjzMCLC2VBLlzcVN/rKseRQ4ATIoICfFWkrI06dywiFPOiBQ9v12so6RcQZyKiKcGalse59lXl6sdjDKc+NHaQhDeNlnRfxXa4xcj5x+v0Z0MZ1fO7Ao07sQHLiZcvUSomnUnxhSb5ibkcDZmkLgZ1n39ySrpzCVjAmA0ni1wEH3AN+Vy8mo6uL89U4TU/84HGXZ0SwiTX1vE67/TCM/eROcUAiEpTzApJLqfXFwXmQNzd4fw4z3U0jlxiMNC186Zd69djOYJZZmpv7dBNR3sz3SWI1aBpyvqRsWawxpL0wVuA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(316002)(110136005)(86362001)(6486002)(38350700002)(6506007)(6666004)(26005)(186003)(2616005)(6512007)(5660300002)(8676002)(4744005)(7406005)(508600001)(36756003)(4326008)(8936002)(83380400001)(107886003)(921005)(52116002)(66556008)(66476007)(7416002)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/bIM8AuiT9udRoKnStelhbmCbuYE+e2WZTAJGisC5tRuT29x7b+a0DWP4bv?=
 =?us-ascii?Q?YNwl3iAlOCwnfti139KrGxzw4sreNnnL0mT5q+1lDX2HmmzHaW2wGv/K8ldU?=
 =?us-ascii?Q?eNic8Z55b/irrrUobHNcyFrEqMAPskhq+YJgx9PUkvBlM/r/RlYzjYaRDZQE?=
 =?us-ascii?Q?WwM5j/75QHJTu/UfSfn61Erq2ymiyAl7DAxUjNASs96TpUVjGynmM3POjclA?=
 =?us-ascii?Q?fDZDIMm6ueczPiQlBuUXaxDenwladTdwRKQsDEHe0Uhm5Rp+DPDDmbqxPuO2?=
 =?us-ascii?Q?UUqkBOvBEXqmjdRcAcezDkOYB55xcDFEENEPy2v+zCuJGPf2EIjZLl175ie+?=
 =?us-ascii?Q?uRQdzaBCP3tHfXAE3hjcF9F2rAFoX+alnmmliArjm/C62U/IEVPzsmN40ziV?=
 =?us-ascii?Q?ZAFuLbYqLuS6iNRMoVfztTpkysd8eUBNRwjKvAuznPytDtyIzZvfiRD4pceY?=
 =?us-ascii?Q?tnPH4rTEggnH/OwJJjHhUcOl+Sot3nw881tNEGuP4E08cDYbDdaJ1aj2xMHI?=
 =?us-ascii?Q?6sx1/3DiBInsR68NAI4DSE8LYLeKZ1sorcpBqH9jyF4+8nGhBA0sE7cluNDd?=
 =?us-ascii?Q?Wto8qMDdkJ5KScuN50r+aSJbob75H4wz3S6IJP7oEERyLHWYNygaS3PFKF6F?=
 =?us-ascii?Q?S9RJAGy5/n6GO56G7jpUXdX8NdTOoCTjsfH7IAXfFSXvxgACjDNByF8aPCyU?=
 =?us-ascii?Q?Q+9xFJzYpIS7tiQohPQId38tFWr3FShtbVfp06axt1Q2lp8r38fCeOt5pkO+?=
 =?us-ascii?Q?TFxs/Foyd8C7kIdi9xbgkzoc9Wo4mxrCyPDf03iCDgtpUPPg5wf/9t7UlHXH?=
 =?us-ascii?Q?aNwVb3RSaZqvpvMmfrA+giyGVTTDbREgcKjSQCoNoDtme1o1mbOfuaqV4veO?=
 =?us-ascii?Q?2P1QPYLOfunhfg+F7HfcWQHVL5Py7CVMmFIvoe0iVFKScI6BMLbcJbKza/qb?=
 =?us-ascii?Q?RWQz7tIE1DpTnxoIB+CaMEQJNgWuJNYpW/mbkYSxY1L8UqwUsBkptqQz3m0o?=
 =?us-ascii?Q?NdLh8YrzS1H4onbN8Pc+HZSwLjBns2vblomcw2Ux+7kDf24jtvn238CWythc?=
 =?us-ascii?Q?mJgTNh+VRF2J3C7Rk+Oiwu12rMuIH6bZUJOL0lmKs0n3vvRMmSbH+jMwIFUN?=
 =?us-ascii?Q?MMsNrZOr3SZIPyRry3k4xtIlFQsqHVg3hGtnM3vitS2J3mEDDvniGut+4Hm+?=
 =?us-ascii?Q?nDVaUOUmUGMo4/Ut7uYjooWHXyy3VlAO/xqEj+DJ3UNv3WIMwFKFiux9MteB?=
 =?us-ascii?Q?UNvMvc+0ylsVT5bJ9cIU8vL7JdQni3fU5T3dNNMaR0DWizPZ7uXoC8MG/dE4?=
 =?us-ascii?Q?pad+RnUI8StFM3uftnhqN+WzD0cFnMcIPmCQNH1YhcP15+Y9BiPAuaqDhsDm?=
 =?us-ascii?Q?aibuilsasq3xsDmuQMyfvdqnAyx1D0e8jw3p9/dP0ht4dovmlxCd5Xr6xYPW?=
 =?us-ascii?Q?W/8s/DQwX1Xhr5Dk7yncPNsEOPhOgAsh+FcTOV8RsfipLe8I5/hVQk18+Lks?=
 =?us-ascii?Q?jIkuAsZ9XOa9IlO1oLqnY5WTPZr3kRSQWaIDT2lp/paOfP/Bu/q5NE/qyfrj?=
 =?us-ascii?Q?s+uu34nWNAT5cxP7I2SPtkDtrj592myGYuA12vkr/x6NrrLK0+WH4ip9tSJk?=
 =?us-ascii?Q?ggSi3sULiaAT6wd4HiO7Uvw=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8ac258-883d-4bb5-0ed5-08d9ed069dbb
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:31:32.4316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/oH9WScPdLif6Pl7r7BCJBGenT1qn0YKCRUYBNcVPrn3O6oBRxTzJbBkRtJgninQGAvI9WToS7m73nvAX5qyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2895
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

It is better use time_xxx() directly instead of jiffies judgment
for understanding.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
index 9db3dcb..b289abb
--- a/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c
@@ -56,7 +56,7 @@ static bool pool_free_older_than(struct intel_gt_buffer_pool *pool, long keep)
 				node = list_entry(pos, typeof(*node), link);
 
 				age = READ_ONCE(node->age);
-				if (!age || jiffies - age < keep)
+				if (!age || time_is_after_jiffies(age + keep))
 					break;
 
 				/* Check we are the first to claim this node */
-- 
2.7.4

