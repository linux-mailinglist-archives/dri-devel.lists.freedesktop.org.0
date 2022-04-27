Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD4511679
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 13:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C1110E243;
	Wed, 27 Apr 2022 11:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2135.outbound.protection.outlook.com [40.107.215.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DFA10E086;
 Wed, 27 Apr 2022 11:55:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtMJezANPcfcnMcTHUDiGcqF24dDP+VzCIuTwcXjOHThDcDEwPZMuTbPBOXxgegd0e1qOYOBKUuIL+97vWBJNd32PdLSe00c/3vnY3YtKnmki3Km23/serMBOSc1o7zX/rB7HIARCRTKDT8b09NQ8wT0iAjmsQf0yGbx6uTv91fL44+9Qihxf8D+D27vZY2QF1gUo0v9tap3/UJDwnNZTtOAgfUjfEjLZClhEaDgA2vxb0DKAoCp+YPfRi/Go4Rn+Ju7uPdJrtVZz3v3VHc9gzaMDX5RUMoW73RXWtNIUDOmC9hcOIp5bEPnfeRKSUJThF97O6jWMkO0ltKqJaDvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQtFNueahf9C1mL7BMnGGQiZUBUPxSj88/NO3oy1340=;
 b=oJHyeL0E2P6GJ7QJqmYjwVLLRFrDYeD76zbjH/tkPBbZF3Vxn5gzNrn+TIFDGoc2Vg7wgQQZ0nR3KQDZOgpbnZdw2BAT5EirKIJQ88e4IxSxrfG8CSsCeE6oSTwKGUcz009vMWU91wgGzIpfJUGtp5AJjb3Z1Pz3nkxK9k/HvTapQzXWo8Kp8ETXBVn5hlS8ClACuynNqHIgPy1+vz/FBH1k40mo2lh434S0NweUgLdv3R/hd54BzwrGdRhW8GwVeev43ndYdupuXI2V+rF/xtNRBYH+kkFuvALn44ZpV5CYIZfv8U/glaaYwKow1SlxC8ETWBuJxx/MfDGqYVtT4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQtFNueahf9C1mL7BMnGGQiZUBUPxSj88/NO3oy1340=;
 b=KaEDor7iAUB1z8hDLx47/e0WdXzSyeYkonnXlDkvYQuuINKEdrc4zwxsjuCj7TRyPjUMwSj9Bq5EjdNc3qiFBq/Z6ogqQFsf9oYuV0EzdD9X6QBas1q9JfV6gsGs6e+8+F/ygGOYU5apQtlEzNvjbWkVWhnIwmxgVOIEYGQNPVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 PSAPR06MB3992.apcprd06.prod.outlook.com (2603:1096:301:37::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Wed, 27 Apr 2022 11:55:26 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 11:55:25 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i915/gvt: Fix NULL pointer dereference in
 init_mmio_block_handlers
Date: Wed, 27 Apr 2022 19:54:56 +0800
Message-Id: <20220427115457.836729-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0057.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::21) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d925f00-9904-4202-5482-08da2844d086
X-MS-TrafficTypeDiagnostic: PSAPR06MB3992:EE_
X-Microsoft-Antispam-PRVS: <PSAPR06MB3992238D71AC04840117B002ABFA9@PSAPR06MB3992.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0HJt0DbFgy+Hua5HYH1gPSh6qlkCQ7LxUHIx8h+CVHLCZaIkqiOmTQ0hbIVLdxYt0pa8rdcCPGyNeIb2TJdkRMeGVcx7tf9bC3T98WPcDFTwrYamWlM7Gnt7OmzRuclTis/fgL73bay6+YXUjVdaSBedL02tDuWxxhy1EwbrV1xC6Z3YynimRPHnWI7zP+80ze4Fghnzu/a6VRkJJlNJwXbu+DU3n5y+NVtz2q0ki6L/itjZzSPK7wwYmzZ5ElPntsm6Dz15/2c4/RSBv5IOPJrmhoxcM1iVn/i8GsNOG415cHV9slrloyyzpZCpypc28d/Ymcm6dh2SNzOesTgteUOmYoFnCaaGyApVeSWvl2jlIqn3ngYDryjr7eVTHmqvI/YtwW5B5tal/kl5Gdq/VeWDljtQUUWlAf+W7wK3cpZyt9WGdBKnlPv4/7oNjDUulYFy7ZcBpsrnBeMGgyhZOoURsn6DOz1pwbuCZAY/yrLW+SHLJKB6/nwH10v/+klZh3VoWwLiR0c8XtoIo7hBWlzoJoXpFKH8J9g96K7PPTKpmULmM68NhFtfIWImbNjsIA7/fyGUv0k1cqmdymYBcxDbxkg9AfdktHkOB+zqL5RyMwZXj5WqOSiPLRnojji6Y0JMgdX5OeoNtbGlxBRMEMHFqemI4inCYX20I0iwuQyi7liqNG+SVjjLB0zSB2y4yulTDAUSDkNSCpmS0DhNKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(38100700002)(83380400001)(38350700002)(6506007)(186003)(1076003)(86362001)(508600001)(7416002)(921005)(5660300002)(8936002)(4744005)(2906002)(6486002)(26005)(52116002)(2616005)(66476007)(4326008)(36756003)(6512007)(8676002)(66946007)(66556008)(316002)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mVswxLF4DPyKZyol2LOCj0ocz1yY5POlspM0EF+uPVxlp+QJe1mkTcMyCbJe?=
 =?us-ascii?Q?ItuqdFNHzz4772yH0SIiZsGvD304VTzVqxLxiW2NXggE1NJT/UwXDeQrez2F?=
 =?us-ascii?Q?yDO8HB1Rvz1kATl/YikqxDmJUdnFZQ3UBqIzeLysLiOBMesXFCwlMq7xf8Uk?=
 =?us-ascii?Q?Yu9FzfJpRbGNxI0OaOeSywQ3JcV2JG+8lel761XCQq7pP4/5r8lTn2tDLE3k?=
 =?us-ascii?Q?gPFOGbMec1/bswH5w30H/KMKMVbr1GBqPamGcpiB2h0h5hY1mMdtoc3dXpaj?=
 =?us-ascii?Q?E3+ZwArqjJZQ9OEMHD5owiQ8ElKXYUcTXS8eLehCKBmzlQ733oAOxckv8Cpu?=
 =?us-ascii?Q?27dXB12iHHBIu54qWGGfBLcWoXoi10zsR8gUmuzaP/t8ID2/z7fxqs6FhmGp?=
 =?us-ascii?Q?hXhitJVQPwm9rvNq+1EKY8stcbKps+gIWe8ddJAoLaYpV/invjNabf9gdmZm?=
 =?us-ascii?Q?xsHPGbrzsEmm1jBw2Qscp+06hrSkzEJSa5DinBcm5MJc7t+M77gXs9lSRUU6?=
 =?us-ascii?Q?+kSl5xG3r4Tz/ukPtE6+g7DHohCSWK/Ve3sPOQf2yZP1h9dv4rKXjfScKq4Y?=
 =?us-ascii?Q?XQaVUTa8Guto5xxyoM2r72i7VtlEDQ0haBBTJNp7gnr9+D0x5T7AP1SfKP06?=
 =?us-ascii?Q?D5tUppBTpI3Lfns2hsiO6rF23BfdVU429xo2y4gPzwcPcghHq9dSFbwOkohT?=
 =?us-ascii?Q?Q0fiSvy4jAOTIiKxfl0xp9gZ/IlQoPssY4ovXgCTz7F8poAENYpESGvqcCQP?=
 =?us-ascii?Q?rAYUESq3vXpmG36q/9IYfytEg1WVKsUE2XmwGF5i1tFVp+mDFVQf01ul+YsA?=
 =?us-ascii?Q?UBZz0u8pm3bUnD691wN4nOAR+RPM5dG1oDtDRFWWUethHjywZ+2RxZfQzXo4?=
 =?us-ascii?Q?A1CRBbh4W1IOnY2G1nhB9SxGqqvLwXB9LOTCw+qQP27MySKD+HDMc7XWuyZf?=
 =?us-ascii?Q?jqFqaRPC0wxXEUUPpzi/m9MvDleC080Ir+/84E+gdTRcite2UmyNrTDQIxUE?=
 =?us-ascii?Q?G9z7C3Vw6Q9zKf2jLcmuUf+6CCJP5gzs6ensogWIaYSPrqKuFuKWLqUVh42V?=
 =?us-ascii?Q?AFgqchNHLckFOlFkAmQBodqFovLlJnvcVgnXGZSpVIih7ZE4cXlw+cAWojJI?=
 =?us-ascii?Q?bbwK/e2NE4duP0jY6d2SsoTEw+o876czsbjOFvA1OL2HYiUAuRdSfnciSIVS?=
 =?us-ascii?Q?BO/NEnx3WlBP9mqtkEsDZkDO4Z36ifljx0TjWnbqQDv15YBj7x5OKp6aV09E?=
 =?us-ascii?Q?uAdLz0ZbwRyiE0usOtXU//AaTDUObBonUjxSjDHyNQR5yqX4zpWIt4hySxzt?=
 =?us-ascii?Q?S6ilYSyoTBhOYGoL6Euxcr8UNbf3G6cI2K3675yZeg5K8hiVZARq8YJNVXUi?=
 =?us-ascii?Q?4eLr2fhruBmE+FNh2TULNNMxgPgtShzKzRvc+yinlMmjMiXVt7a3ZWYxCcAv?=
 =?us-ascii?Q?5l4/xV7aqUzl7/1jiJrudNJe3L3yGWpv7ASliF5yW53q95nJflIeJBLk8bXj?=
 =?us-ascii?Q?aEPpOMJEkdGER64Drfpm4StIajiDLwuWmRcgfeg9cX7cLJ/2WghZKbQO3kK0?=
 =?us-ascii?Q?8Oo8Pqz8ArjfPjYYHHMuQ5PvbWNbhAIP5rAHJpQsmMwN+I9/eIUR3nvB57C4?=
 =?us-ascii?Q?f6ZzQYMP25mYh6/aZBu1digJMoFqfRDQcuu8DJwYuDN4VU2OF6xDRGdMH3RH?=
 =?us-ascii?Q?29zkoNyP/ljKkr61var84BggyJcYbs685I+Zy6l6ZHiWP36mYGgWQG38iP14?=
 =?us-ascii?Q?e4KYAFCi4g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d925f00-9904-4202-5482-08da2844d086
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:55:25.0510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sJBd54IljHaomMkdlcCNBN+1vOvz19Sltf32TuY6O3hJIS3leWpt2UEoJYhoNyfhSm2f2oYIyVtmSFfG5Ox3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3992
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
Cc: Wan Jiabing <wanjiabing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following coccicheck error:
./drivers/gpu/drm/i915/gvt/handlers.c:2925:35-41: ERROR: block is NULL but dereferenced.

Use gvt->mmio.mmio_block instead of block to avoid NULL pointer
dereference when find_mmio_block returns NULL.

Fixes: e0f74ed4634d ("i915/gvt: Separate the MMIO tracking table from GVT-g")
Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/i915/gvt/handlers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index cf00398c2870..7ffe0fb512a9 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2922,7 +2922,7 @@ static int init_mmio_block_handlers(struct intel_gvt *gvt)
 	block = find_mmio_block(gvt, VGT_PVINFO_PAGE);
 	if (!block) {
 		WARN(1, "fail to assign handlers to mmio block %x\n",
-		     i915_mmio_reg_offset(block->offset));
+		     i915_mmio_reg_offset(gvt->mmio.mmio_block->offset));
 		return -ENODEV;
 	}
 
-- 
2.35.3

