Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A79592F6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 04:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9A210E2AE;
	Wed, 21 Aug 2024 02:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="lgTit2z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010040.outbound.protection.outlook.com [52.101.128.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 456BA10E2AE;
 Wed, 21 Aug 2024 02:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqrsweLZsxXpCXxR2GoT8BOsZie8sH29/INqhQFEDqdESkhMx4MhhKFkOfAURL0HhjaGZs6WSCsJPnSDRtunBX18aWRRDpk0FBsdEkOeP9HZ5qHKilkT5iK8P9uQsnClyh153EWDnaJW9upApzl3ER6CH5+rIxJbT34US5m24sBbvSeQ8fH1rWBZ3wkehWFnkJcar5e0hbdH4y9w2A+BY3eSyLpl6XBz2m3zI5XjhJfXl1rzL8Gj7ST71uWydIyuI7uvddPT9h3ee8JApEdAtXbtlfjfQEjnFTLpv+b3N9XPkD5N6BXM/HGWWSYV2UigItwCH55jPRfYiBncfoQmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZeJZiOJQ38dw74Hnem2BV8612cE8faqk0pm/TFYeKY=;
 b=i8aacaFsseyboZhTrbtk4Thl40SosVdQAAgG64L7KYNS34aEUj9tkD4e9OHmdMz+m9uZXgIJt4XOOFKwkeMxInP3dMiGMNy+Olee/p17u4AKzHAyHPQG8E42CihRFGFd43R8NwQMEZbbRR+N6SmZtRD0e+0dRhPjm1FQZOZtiG8poL3evbP+OZkzUsoycAy8mG/6BFvSiPZcgxyxiNOaTiKr1sRRKXMoQmI1kxHwFEknH5w2N3Q914ORdUxr+tmGq69xgmVCkBEf7JlRdlMwUpHaJLcB++sC9XSwlXks5uyeujr6l4SDZRnqt2neUytYNDl4VvEF96NWFa3pOYWYYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZeJZiOJQ38dw74Hnem2BV8612cE8faqk0pm/TFYeKY=;
 b=lgTit2z58vv1gtS78BvS/sjFTy43qtN1Azen6e+5bB4x6v+YIJg3SMJmq/yXX7fgb9sJ1Yl5gHHRE1J0b4CS5dHaP5Ao2DC0RN9NTKPcS9mbEhSoD3T2FgzyKfJUyJ+tn+3H9Kp6gPz05j9rJOn80LDQuEApL0QjRS/fOWzkAQMOIayakkywrQGqx1FH1PZgMlOVU3imowFs/YfN37LxLhaguwoWCo7wCoX4ntagTqCakbUuNiPkrg897r0OcakObPnq1rv5VWAzgNpMViExKGAqQVveuEgEEAIlr4tu6HSVugqa9UT1BgFIPwlZcaNG9H6qir/q+ilqh5mGY84cWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by SEZPR06MB7137.apcprd06.prod.outlook.com (2603:1096:101:232::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 02:42:08 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%6]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 02:42:08 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v3] drm/i915/gt: Use kmemdup_array instead of kmemdup for
 multiple allocation
Date: Wed, 21 Aug 2024 10:41:27 +0800
Message-Id: <20240821024145.3775302-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::22) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|SEZPR06MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bca7494-bda4-42ca-9dcd-08dcc18ad9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VxFUgILAz5uicaWDteKvi1RmstyBXzylLHLOkSImz3dMOukwTcbpZ05v2+mw?=
 =?us-ascii?Q?hQHlrvgpAQK+sVeU2K603Uorz9B/tVYYGTHbUqNumcZMJtIiss/21TO42j3a?=
 =?us-ascii?Q?hYjYGUkMGMt9iIwg89NtvirQxwrvIjpRuIUjIrz98OnetrE47zLj0BMz4Y5d?=
 =?us-ascii?Q?UkK51GfarP4J+XrYMd5XbdPuLW8XfTWwpcp0NGp8hH0wZJD+HAwnda3QZyaO?=
 =?us-ascii?Q?96gAQaH+PI9xzK9xnt2desrBHBtM6CIcmqpTx/Fvct4Gc6zke2Y3xhQGa9rE?=
 =?us-ascii?Q?JKfBsiO9KC8iaYjQfPrdTZoBiFxuqyiLvrZpv6D+6h54ge736NJDFx7lqJVA?=
 =?us-ascii?Q?QJ6mqJokZTJmLaPs6nJG7eiBi24wGcj629wNl+LWIZ1Dj+IuNfOq5qi9+gT2?=
 =?us-ascii?Q?plTR05xLlVb2hihuS+bzSvgOefhINu+QUIeyhpmdanNzvhLgrKaWypOikjwA?=
 =?us-ascii?Q?w1t6Ttv1qd2oXrCgZp+uzli1j9AsvodaM1amgvuow+miO+ct51nU3hi/PUKw?=
 =?us-ascii?Q?6xjRv1GdQHLCEeCIvjVLf8CeCUkYadrO38lseCMBkYIwXICcNbxXpSNW+1bY?=
 =?us-ascii?Q?ghKvtFPTnYCVztv8KJTtE+EsamVv1bLL/PFQ3mJG2fDVvO95pZyOt8xhltpb?=
 =?us-ascii?Q?bSBEkHKuX+/4KUnImFbFV8BnV1jPFMeYk/nn8GwLgLmmfDka1KZLk2ONKmhN?=
 =?us-ascii?Q?SSI0DhWY4NB0dEUEwF1rYkJsc9cpBmJVDz5ZHb3gdqH75rWkhmmyu+AR8/PI?=
 =?us-ascii?Q?9nvLpLO0sfWoEqqbPPZGThXU2qx8AxDAdTMF/6lR878loFITDz7suJlPRw5O?=
 =?us-ascii?Q?4SGrrx8kt6AurOEJHghHU8DV3nHKCpPDM46rozKYqJ+kJkbLRv7CqhusQNi2?=
 =?us-ascii?Q?1DHwkqZ9fhjUEheQpvuSN8JhmgTwJbVlY/IeSRmTFD9qvxpgYal9UOT9tEZM?=
 =?us-ascii?Q?15ahrsjLgF+XMalLR6rWPJ8fNh8npz8qeLX1UzGKJ7Xi5QV1OSNRICZBiL8O?=
 =?us-ascii?Q?i7Rn4WFCNY+abxROqKo+eFX4hxSKC1ggaz9a1OVZ3qNgI/0ux5295BIAgjL2?=
 =?us-ascii?Q?EBAiX55T+XvBVUwbWXDdp0F8rtb3ngT1uaCrkDVHtjFNg4qQcXi85Hj1qhXH?=
 =?us-ascii?Q?YMTiCkXuI135jKopzGosau41QrmIpZs/hl5vxluLOj/LS93r9jcsPakIzTtS?=
 =?us-ascii?Q?Rtmw68sABxB9MmTX3gsk8eH2XAudIOo15Sd4JhaQUkovS5QZ/mHmP2gpKNpV?=
 =?us-ascii?Q?kymf30CZnraP3/mTTAOd7NgpryKoGC2nutp+n+E13C947OmiFFiRCIYkN9jB?=
 =?us-ascii?Q?qTRsbdoA/LL2xU7I5pLBNdRbaZ4r7ipGZgycNa3vdBlZJ5oPHeT/hUyEwJdj?=
 =?us-ascii?Q?/MZZzBg3yxpeRsXwwO1QPWFIAhTaYx9iP+fBeTHQHLiye1E7Fihuac577pXE?=
 =?us-ascii?Q?rKPzdXTZhqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pba9cQuyQHyTktCRqO6iNnmNr3FqdjqbXnb/hSVATDb8ZUVvkXYvn7Fm34IE?=
 =?us-ascii?Q?6+dcT157WkpzKPlPIQ/cH9JuGTZml10FuzpBWIf8XeRbPUHuHntEgK4RDJve?=
 =?us-ascii?Q?+MxPVsfMoivFr6WGmY7YH1hmhZEATGlVh4yOz6NUjRsH4qj9UP/Z7EFzXc1P?=
 =?us-ascii?Q?RjLfEGIVQkuTdoUdeUgOta9OKGQ0RYgj7IxfslMUm0gaB/On1kTqDnPbyHae?=
 =?us-ascii?Q?BnOfTERxTl7o69A90akdq6HHk/leDxN71y/Ul/e+ZQkRxn7fb5vsdkSspoDx?=
 =?us-ascii?Q?eHECUrCY8N8Sg5fyfR4Vm5v+V69KqM0BXXErVDURa4KRq6um9uO1taLEfG3M?=
 =?us-ascii?Q?RQK+0szWrDRMT7MQAOKySkWWw7QtXBS6OkHDJSloyURwLkXinateimyTzAyS?=
 =?us-ascii?Q?JR+nvr0vJK01+Apm5NY8gJyUHj1d21PpeCbsuKZpaBUJNAQHRveS+Ik9+k+X?=
 =?us-ascii?Q?wTHPVPDPxGgE6PWO66PMn/WizWf85dAdBymsSH1dWWcjRyAyCy7s28PRhVqF?=
 =?us-ascii?Q?xBFYOf2/o2lt/SMH/MIN/fVvWRkYcK1L+V/SmnqNLTMulDp5R6O811i+M6eG?=
 =?us-ascii?Q?8U02hxwDJK/hSnklHQej5G76rP6zbGUciP6ZELA00scsqVPGskrtEhFnIsQd?=
 =?us-ascii?Q?gtfOhac4ydNNJL4WlqYOlaw6pF0SRfDg3C4j5aSkqd0ZtDOpZrq8Ok1nTWEJ?=
 =?us-ascii?Q?yW/2pMhcGZuHnzbFdkmOE/jxz1wIepQdpmVVhgv661Z9pjYwyQs3qYng34RI?=
 =?us-ascii?Q?ONbGuF7XL7Vj+A8UY7IoN0BMafuWYIvZ9IB844IH5HWchtsw0pms0BOBFrnl?=
 =?us-ascii?Q?tVXcd7gHqbYGK0GoVUHzwsZBihoUo/GC91XmegsW2eyDamqtFA3Uy8FE+59N?=
 =?us-ascii?Q?Jbl+8xVk5CmPOzccr6ZoZcPVtFiqoUgiZmguM2APjj2Y2cN+LcL8R9u7qmIT?=
 =?us-ascii?Q?xnA2HF32UWXxzeMPXyZhVNgh542wJgBDduth8wopgYoNYrVSiEgHL8bHToLw?=
 =?us-ascii?Q?LZtT1dJz7Ga0XoeyUYU6mE5YEeQkkybHz4nA1p7USrQPpnRJV3hafwg85xzD?=
 =?us-ascii?Q?0IiT3yhq+r3aXSZDbTjk9LIK1D6sTQSastP9YNCqgKc6Ed+j1vyzdWqroN6d?=
 =?us-ascii?Q?y2llQML4/IovSigLdL2ivo09/0P2tPn7K3HKNSa9RNBcMwSrgUvgnW8c3sVo?=
 =?us-ascii?Q?FnLUShKgjcLoVcWMOyEsp3nVq+Jp15OQVoqhd0Y2jpg4UcTpy1DB5J25PrTB?=
 =?us-ascii?Q?QsXy284INsHD9LHTwxeTLBRrXtIfJpe3/JabHqMKDSHqC382sVFXbCvvVSMq?=
 =?us-ascii?Q?poF8S6zA7kGgzF+qaduYmRJR/AkL4MDOWxzkWTDMN6qlmMnO0Rp7y//57XSN?=
 =?us-ascii?Q?ZpsYHeG6/Ffve7kkE/sjbKE8gfWwvlAkOHnHattIoHqugBechlIeHPq6du/y?=
 =?us-ascii?Q?uFGYeyGVSNWm1secctcsJLIyVekNPNTGECYu+g+kfkA9Q/4CVs1mnZ5pKNn9?=
 =?us-ascii?Q?HytZExw02m5ClFxexB8VviojYCM2nOxTHuQgVIF60nsf+UIlioRfuYXWd5uQ?=
 =?us-ascii?Q?pgDNBd3+ZPD85Z8G6lY0KlwPjje5nGe6J+osLs3W?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bca7494-bda4-42ca-9dcd-08dcc18ad9c6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:42:08.4745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YYWBEGxX7WHZ2S3pi5Ho9U9ObLpamt6vOjfJPDOywquIvc6Q0pP4U2IAwE8OBe2O5tCVcEPLf3LpubcWHc8mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7137
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

Let the kememdup_array() take care about multiplication and possible
overflows.

v2:
- Change subject
- Leave one blank line between the commit log and the tag section
- Fix code alignment issue

v3:
- Fix code alignment
- Apply the patch on a clean drm-tip

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 09a287c1aedd..3ac0213c711f 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -111,9 +111,8 @@ static void wa_init_finish(struct i915_wa_list *wal)
 {
 	/* Trim unused entries. */
 	if (!IS_ALIGNED(wal->count, WA_LIST_CHUNK)) {
-		struct i915_wa *list = kmemdup(wal->list,
-					       wal->count * sizeof(*list),
-					       GFP_KERNEL);
+		struct i915_wa *list = kmemdup_array(wal->list, wal->count,
+						     sizeof(*list), GFP_KERNEL);
 
 		if (list) {
 			kfree(wal->list);
-- 
2.34.1

