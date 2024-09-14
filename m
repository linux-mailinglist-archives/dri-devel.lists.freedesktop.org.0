Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D1978E7A
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 08:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8A310E298;
	Sat, 14 Sep 2024 06:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="YKxJCoMS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010025.outbound.protection.outlook.com [52.101.128.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77AC10E163;
 Sat, 14 Sep 2024 06:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYBzowCq83BO8gehrPQ2jCPujAOmsXUS2WnONEJAqWQg/iDTtqYXpxyowPp3/658GvqCGhYcVgkRWlaqXB0kt4EUXrjphU6gLw47akeEomMBFSGlZQUaISSUqES8eCao4bHnKqiybIQR9ypS2HSBxEISeYV2ZMzdQ+XK3sd86gaZs/TIZjAOivI9A8W6o4IFgSrLdMSdiqN2/03ip6Yc05V8mf3jxL19uDFGEqmbaChdqsBEPrbGnCuHjdwBSn4O/F0vfh1jUZ/DZN3ZrIQa7M/HVHKxnt81rxXovdEv0aODlJ0FQd5KEKtPn8NZx1vR07Nf4PlUASRbUDrDEg783w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+egUYdegl8ZXWcem7407SPi020qT3K5m/0OpGRMHR/Y=;
 b=uJfdrOxsnZH5Z3ijwMe+IMTAC/YiPNF8XYWIQpUrNliv6Px507QiMh1hRO+zXTA/eotvInymMcvz9HLudfE0Cj8E5YjlfvSytjCCTU5b7R04hj10nN9qSiUQdCaZyIwYdJFb9Fs03JLpP7n/0dxii3gLrWwdPQzQwuRVtW9WVMKT7hzJZZClYGa7onBNWMTecA01p5FhQUUR2ruVBUT/yz8lPmw29gqTYPSauyvIrBHwVQaaljBwiV2Fzn07UngImlQKh0oSFcIiG50itDk8KWgdzzPT0B4+jOUnL9MJbKax/8DhsCgDcuiJOI9VxpKpsUtJyeT/n0cv532gHrn83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+egUYdegl8ZXWcem7407SPi020qT3K5m/0OpGRMHR/Y=;
 b=YKxJCoMSxK/al+AtOZKcGnO9HYuGC6/Fi5rw4L2/FtYaw+hyLIjm7xVDGqh/ikY4UQvpum3F6Gun1VjYjQNlggN8YdAT5WO/8upD0SSl11PPQsafYjAfCngGesgk7m2+hg0rrQR27oBanNm86wTNLSufGBAUd4CCgbZ2li3mE98l4Bl28P1Y/4VzJbqc0kK0WBcvvoGm6Tu2TRRnRpjP48YPLlWJeDZ6uDlXTJWguNmnPoYR2SXoUoG9JvmSxzmy3S3lrI7j0EI6pRloG4Zn7bd9Q4/Z6u8sSLjG4CURXNO+NQ2LVMi1wDSZbPKDEZRvlmPpP/v73F76QW73PHZoZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by TYZPR06MB6497.apcprd06.prod.outlook.com (2603:1096:400:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Sat, 14 Sep
 2024 06:42:54 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7962.021; Sat, 14 Sep 2024
 06:42:52 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com,
 Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] drm/i915: Fix typo in the comment
Date: Sat, 14 Sep 2024 14:41:41 +0800
Message-Id: <20240914064141.295712-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|TYZPR06MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 578f9933-1f68-4f9b-43ce-08dcd4887429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pmhIV42f1c2CcKK8x8KYJrAMw+pbUj+/qThvSeHGDOTdy0M6rSC9o1LEr8Jn?=
 =?us-ascii?Q?IHDbGoFcQchV/sLHGeVEidhK8gzStf2Pf41oXgTVaZnUpWvt+hDvw+hlejAd?=
 =?us-ascii?Q?pKy8t4DmAdVNbn5I6a5fntIh3k+/p7V4L0io1knACJOc1R+W+4e6l5Y1swjM?=
 =?us-ascii?Q?mcOZlHxHqhSZdSEHIfQfsyc3b3qZCBJ43BuzuXM+HXEr5DxyfjNBHiTgmPEg?=
 =?us-ascii?Q?sWUbSx0G5rOhg7LSSHx9UTdSub3MWDwxU/yKrps3udrM6Fbnrp4CkwgpcM1u?=
 =?us-ascii?Q?OY0DFkLpCgWmxf3E+XRZ24jOoVhOyhJtGNBupJqrD+iDLhXuhzJSDDRXvZo7?=
 =?us-ascii?Q?Y/W3DewPNu0gdOPHdVNoOoQymzX9EeSgEIHDbeNAYXET3mrz2p50n+7fKLcb?=
 =?us-ascii?Q?yiu1LqF7Ub70AOfBYysoiXbrZ/07izJZRDi5aWSKBIP6Qptc8ZZclTYBbdiS?=
 =?us-ascii?Q?EtT3O8RSd3GqPRPLFI3qTLWWu+ljbamF7KzeQG2pZwMtWNQcDaLXMj3OzVit?=
 =?us-ascii?Q?bGLH+4eGvtLawinAdjwbAJLW81HewTlR0I3kdud0+XaVQCz+LjeO6xvVp1A2?=
 =?us-ascii?Q?Lz3paEjNeQnAAcOaKwE6QtP7DGq4S4UM/N6BLsulvinm/nXfTdjgP5Zy7Vsu?=
 =?us-ascii?Q?bhWW0WDbVhaLa+NOvYX0CCKKAjZk+yNOZEMRjxx0E1aI/O0aS6zlgRrDMcUC?=
 =?us-ascii?Q?qpCT7s9B07VGuXmR/C592jJ1vK1XLLriDIMnHgQjSG54IYq88dQFIsddH70s?=
 =?us-ascii?Q?nfu8TDjoPUC480U8Rl3KOw1BvNTNsQCP5Bh+8NO4V7gwcpR3cgDtE0s/FMq+?=
 =?us-ascii?Q?eIfswROA6cQNDIBzi9gBh0zUWtX1e1BcsUPOEdcut+shhhnSjR4xE7N6lJLI?=
 =?us-ascii?Q?rXSjxgeSncsYTeZidQbCD1pQ5VyG+wGS6wrg0RShuoIf5brPWCTKY+kW658W?=
 =?us-ascii?Q?Gkab2DzsMJFbtV/U/QGGaYwvTcOUgcSo+fxrumHqtKjnsDjRopTAtO4hFqFW?=
 =?us-ascii?Q?lw1Y0EL3ngQwHLRppqdN4o71YKpQxUt/jkrA//GL6PgVZDFWf6tbWrcrMc2o?=
 =?us-ascii?Q?fX/QO2zkmKueR6tj49/S6jPIPvwrMaB2O2oaxYE97ssikIV7lq/suybBQ3xl?=
 =?us-ascii?Q?DX69buXpMroYZ6tHYzA8ggjdL34dlTGCUv6GGXJhkVbgTLphHXu4M3SerUzJ?=
 =?us-ascii?Q?fdmELfDlFvh3sG9BaUC2kMXkqHfD9d3z12dZ6tfg4hijoSysP/2W/HbCqrFz?=
 =?us-ascii?Q?13WXq9oJorbzWvzoJWTdV9p9g41HbnulnjEDN60Un17zBvT5j4Yoesfj5bZ8?=
 =?us-ascii?Q?UuGbgjW0pFlIU96U0SMAjwtbsUSPE1CiRNjXXu6cJTdgBpTeQW9+HCF5oQGE?=
 =?us-ascii?Q?zjKHcd3W1bCVOi/5A3pN6EgjlB1qdJTbw8EaHBQPTJVALnVh7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4113.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qu9A+fLXLYDPxLnVduZqI3xu1bAoJNqH2jvD7ezXyBrRY909YNG8yeQyur0G?=
 =?us-ascii?Q?/ig8YDyJ7T5pUlj5a3WBrCZPiZ8kGaPIMFd3ksq5lws/YHngvbCReSg1+yt4?=
 =?us-ascii?Q?qhYBPKtQk6ualZ/VNGvovAawu/vdivcr1u+WM/yAUyudcnkt3vK1HsZwe/kY?=
 =?us-ascii?Q?dMrEpI05LktILJh65jiNQ5O3E/fpQnhnyxCViHw4814oCLpnobtu4VlS7plk?=
 =?us-ascii?Q?aBUobuCVt4lgcf1ckqoPNDcNhgDS+jdPDu/7W/lW9kgX+3STlUbJGt46/48v?=
 =?us-ascii?Q?gvwvNvjctgxEZvI3A7faDonXPZmzVyFkwbeqIBGRheqMxthzl1RiEBm5kcmp?=
 =?us-ascii?Q?7fuUqU9kABDY8rd73G2e6srbQh098k9KpXSC7OAFcdnr6DOAjbrUfDoYxdCX?=
 =?us-ascii?Q?yJyGfH+AQjnjX+7WByUtPHQFH3Ud1CBPeRmQwpZpEdXUrkWVVcCupBJyDsiM?=
 =?us-ascii?Q?JIR1rsYRy4pKKiO5h1XHGkIHOwmfIHN1H7ItZgitzsJ1s6ZrOZySfwyLUO/x?=
 =?us-ascii?Q?PG8H/+o4VXM5nL+XfCAe8uqz3nGugfDD9U68vp6FVhBjTkJlJZgEfREU6nzo?=
 =?us-ascii?Q?CJuD3ae/A2EDKqTpFwN4XiS6+TSY8+j1J40v6jy4emCc6Pb8Dmf+fsKkDgjF?=
 =?us-ascii?Q?tfAmzkyv945AG6XZOHO7L2L908oaUqMW5d1N+XUrMxOKbhS6JbS+QHrgo0sb?=
 =?us-ascii?Q?74tCj7KZaWqCYf9V4a1YyPyezvUUgECOfJVsu7yB6wKEpsxVe5pg/+hLNjdj?=
 =?us-ascii?Q?TO0wqNDwI+NTz7/PTiTOeES7D1/jAd61qs0aXlAHme1uK55RfJv+KfOb+0pl?=
 =?us-ascii?Q?2m1Lv4/1LKWB63dothHTM6WAZ+dQSwzxCKJUpxQ7Cr1ax2y+x2JD8MDKAndC?=
 =?us-ascii?Q?HwK6rzEbTBMXnwZaWAdklTNesTVToXwM2MHgvt2CWVL7JQwdOciHt2oHJMNh?=
 =?us-ascii?Q?FYdT99EgZVJ/niBWMUiKwuhuXYpvZaYKYTwtLiLVEOgwxxcqLZyidKXp/7GQ?=
 =?us-ascii?Q?lVOPeJDJAWr4VR1+vFcnXIY7HS1BArWkpiAOg411nQmHrlM8xw0nd3QZz16Q?=
 =?us-ascii?Q?NaSJSP0UmddyCJY8TW5AZiWP4qYl4ox2SoTQXVhVcZBncut2qMviA7c7HWKR?=
 =?us-ascii?Q?o0HNinZvRe8IkKjv3BfpPXMsMGExHSZ4BDetSDFJTwTqavdsElMBZWwmQYbd?=
 =?us-ascii?Q?RQ0fusMvzICug/ZvEttWxen7L81AYyTGBaRQ+2jTAMTq+SJktdeop6fLdG80?=
 =?us-ascii?Q?KnKy8ERvF2rjnOYIprzJORtgGVTNu6buCXvLSQ8Lrw59RHIZN/mHQUh7aEaK?=
 =?us-ascii?Q?K1L4GOsQG6F6FV54UyJ1zAfyx06NYiHDQOpmTM/b8SEHFhtJjouvazvzpBze?=
 =?us-ascii?Q?xTwqhLfWgJxXCgyQQSOspSDkoc+Iw7nmH1kFRr0VGZigOT3t+m4uh5wX8Zdf?=
 =?us-ascii?Q?QKHZEZkBETP1Ry0nVD2/LNuVuvJVIW2FxFEdOoUqlSK0AOaOphtzep3ZQ+A+?=
 =?us-ascii?Q?ytaqOZan5bTp9vXCmloWHpsPWgz8pzSqGTXw9zcMmxjPtpP7ipXLczA/AC6v?=
 =?us-ascii?Q?t6z2aCjuGb991jfsMpN9n/Yh7HQkskEa45fYIM7l?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578f9933-1f68-4f9b-43ce-08dcd4887429
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 06:42:52.7792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roQF2aiGvwW+Rdk1aIhVUt7BX4KRxF5mVBAMp/OzsXYCL3svJC3TSAPrijIW6lcWzuSXfr73DdEGT5tbk6QTNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6497
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

Correctly spelled comments make it easier for the reader to understand
the code.

Replace 'ojects' with 'objects' in the comment &
replace 'resonable' with 'reasonable' in the comment &
replace 'droping' with 'dropping' in the comment &
replace 'sacrifical' with 'sacrificial' in the comment.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 2 +-
 drivers/gpu/drm/i915/gt/gen2_engine_cs.c     | 2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c        | 2 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index d166052eb2ce..4f8d29eb513c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -25,7 +25,7 @@ static bool swap_available(void)
 
 static bool can_release_pages(struct drm_i915_gem_object *obj)
 {
-	/* Consider only shrinkable ojects. */
+	/* Consider only shrinkable objects. */
 	if (!i915_gem_object_is_shrinkable(obj))
 		return false;
 
diff --git a/drivers/gpu/drm/i915/gt/gen2_engine_cs.c b/drivers/gpu/drm/i915/gt/gen2_engine_cs.c
index 8fe0499308ff..1b5393afd13b 100644
--- a/drivers/gpu/drm/i915/gt/gen2_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen2_engine_cs.c
@@ -179,7 +179,7 @@ u32 *gen5_emit_breadcrumb(struct i915_request *rq, u32 *cs)
 	return __gen2_emit_breadcrumb(rq, cs, 8, 8);
 }
 
-/* Just userspace ABI convention to limit the wa batch bo to a resonable size */
+/* Just userspace ABI convention to limit the wa batch bo to a reasonable size */
 #define I830_BATCH_LIMIT SZ_256K
 #define I830_TLB_ENTRIES (2)
 #define I830_WA_SIZE max(I830_TLB_ENTRIES * SZ_4K, I830_BATCH_LIMIT)
diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 8f1ea95471ef..66dbe4933570 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1098,7 +1098,7 @@ static bool __intel_gt_unset_wedged(struct intel_gt *gt)
 		dma_fence_default_wait(fence, false, MAX_SCHEDULE_TIMEOUT);
 		dma_fence_put(fence);
 
-		/* Restart iteration after droping lock */
+		/* Restart iteration after dropping lock */
 		spin_lock(&timelines->lock);
 		tl = list_entry(&timelines->active_list, typeof(*tl), link);
 	}
diff --git a/drivers/gpu/drm/i915/gt/selftest_rc6.c b/drivers/gpu/drm/i915/gt/selftest_rc6.c
index 1aa1446c8fb0..b272a7d44599 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rc6.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rc6.c
@@ -211,7 +211,7 @@ int live_rc6_ctx_wa(void *arg)
 				i915_reset_engine_count(error, engine);
 			const u32 *res;
 
-			/* Use a sacrifical context */
+			/* Use a sacrificial context */
 			ce = intel_context_create(engine);
 			if (IS_ERR(ce)) {
 				err = PTR_ERR(ce);
-- 
2.34.1

