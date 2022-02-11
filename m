Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836D54B1C6F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1264C10E9CF;
	Fri, 11 Feb 2022 02:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2097.outbound.protection.outlook.com [40.107.255.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAFD10E9CC;
 Fri, 11 Feb 2022 02:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUyznWgZuzDBHHk8bhhKsOaQrI8+HfR4UD2AeWIqP2UBi6gGUTmvgzXGONB8c5xm+tpHE+cvnpdD5M2er7CDpItRSPpKtXanQfJghe8kqXP5MRG5vlOFjp7CgxXC3EWV0OYnO0hE6IWCkZbUWbm2NWtBIXL1GAvqWH3/h5iCdH8m1N+WeZU6db27z3w+F3RqSis2QE4e6Xg4c4DtXDNGzRJRKrpeTDL/eJ6hPWYJvpkJO0r5YnBbLqniNUFesFtWIwCqoCzmMrN6Cr32xYeCcEpJFeyfeuouH9nkgiSVfyk/07crTNlmH59H/qvq54YO70Kb9sDRYhyYyyFTTTeTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GX+nOYxisljzrKTgPKcHNVXPHiBaBNm1rCGL/Hfu0io=;
 b=kSAropA30K0hq1WglqOOhRRxLrcNu9TsVIIDwPM1SPWUWsM7XKAAnoPyM4z0PjBSf6LxY/fCMmSUY6uGr1/QGD8lawlpdCk6PrY00mHlzx+ZP7Vsyo9XDr1vGwnXYlQqoGvmyaSyj3L/3PjZ5bI942KRpbcf+4D2VoLGCGGTEQ0g2yUtvglFFA1bk9P139RDTBLzydNY7G2VXkfQlQQeSszHEb/C735n/y5ntIia360JC7f8hNTrpDYhrichejbGtbFAz2zcdnMwRGpyczic0tNlWAuM41W6rGCskmzpg0jgyMY5/FIj32R6bN1G4VhQIvZAzTyL72t+VYsQHgJK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GX+nOYxisljzrKTgPKcHNVXPHiBaBNm1rCGL/Hfu0io=;
 b=MrEOAevPxCNjl2YjyKrIEp32HF6lZG543aFtZHJQVfoFKWs9D6p7tBil8ZzyVbssPfuQJLGGK8NV9jAATBffofMh6jBu/zNdbevav+z1S9iTHGUYlp96wSRQYu9vyKzjohjU8VHV0FuZ1NaUIaI2Yf7Ix6SGdHqwnLwhrZK4rx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TY2PR06MB2895.apcprd06.prod.outlook.com (2603:1096:404:31::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 02:32:23 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:32:23 +0000
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
Subject: [PATCH V2 10/13] md: use time_is_before_eq_jiffies() instead of
 jiffies judgment
Date: Thu, 10 Feb 2022 18:30:31 -0800
Message-Id: <1644546640-23283-9-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fda17dd-7627-4ed7-980b-08d9ed06bc3f
X-MS-TrafficTypeDiagnostic: TY2PR06MB2895:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2895B4FB384B056A69641E17BD309@TY2PR06MB2895.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vCcORnvvTaCSGSUv6FaIVzz5fCHZQ39cob3rnZpeEfCgUnbOK6Ew3NujI4eQj4E6oemaWr6sQuTR4A+q1KW18wwDu5rbt7uw9pJToWNslEEhlHV0id4DO7YP3t3NBlDMWwk0M2ZXpl8F4Th41pQMyhoDztMo8QFRjQraRlRMbOV0EPCsMIo/NkoKXXpupiBsTyN/P7/T0ytRY5MFfRGEqx0BtqPZP8o9TEXlYDrOkScovmHB85LxDA++EuFd/41ONgLFun5G1fnn9C5CoUVs44dSu3qtyWKjQklGYWE+OM0pZAmru4SjPLBGbCGsnGKWasxK5bUhg1IwDDnOjwEjjUcN1ofLzSbxO1vgAYLb44uYy/nD9V8RwXdNYJdmpIhtPbdXidXC8VFSS+EUh4OnqcOhL+uFVXQml/bWG/IZhOXmFXXbo/qb1EWeE7wfL9yJgXCpiCYqEwBEXPf9GwLRkT6zUQ6pgNH361lC3KflPMABa9Pg5UUyRBNuHEzGTmY7kuDxMFHuSZhHVoOSGeV7o8YpxAoBgYyONdV6B9DroPET5JQ0OqUXM8tmof2wrr4F7B1/x4fg14kMobLWHPQlmjzX0CkpYGPrBQm+PkFHBlWxbjBmoo+vo9NVX5+IiIoUXRtmXTuDXAK0YcRLfElMlyiLA2SUTBIYe736SE2WmKAUzPs3tr+6xT8M9z99sFbvox3OimyVqhj5XsGnb8qfSKKUuyD0aj35hxDZW5fM4bnizguaPFCSoJ7trriVtW0w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(316002)(110136005)(86362001)(6486002)(38350700002)(6506007)(6666004)(26005)(186003)(2616005)(6512007)(5660300002)(8676002)(7406005)(508600001)(36756003)(4326008)(8936002)(83380400001)(107886003)(921005)(52116002)(66556008)(66476007)(7416002)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5RLiO7j5eiRGWiybTSbw3O5WAF60yB9HB5/fjAxP4Yq0I6DWM/DVOs4m4+yO?=
 =?us-ascii?Q?oWTzpWXkZsIMleQXe1Q9OQbxEO2c3Yk8DzMvc8J78zY0HlCy35rlHbHQCgpx?=
 =?us-ascii?Q?9XQnRLIWXblEAAvckGpikNanBded8bjlA3FDpRX+jShHcFT2cRyDy8P1Flp+?=
 =?us-ascii?Q?hNnhCvVNvDN8ootk4WKUe276uSIBohcDJK/nwsUtBFP87fodZC5XYPdEOMZz?=
 =?us-ascii?Q?5GbV5WZbinCC0i5eDvxowd5t+5fdnjAvfTr+HMu7HH16JPwQDJsryJy/jRLM?=
 =?us-ascii?Q?D2aoFtXuE2CyURZ9sV2yoo672NKu0B8+C7YldGKfWJptMf2SAVV5a0+D8BvC?=
 =?us-ascii?Q?8zMypXSeoGxjnvw8Qel/DE2ctYSeeXvY8iNpeTIBZQSuC5zOHmYYBAfJjle4?=
 =?us-ascii?Q?EBWqsIrT+SJxIh7Tsri34OvuvQ+qo42aALsuCkx3FQbMJf8ZofESmYR6fPI+?=
 =?us-ascii?Q?ASrPeAuZOebLFsOZL4+OhUUiWlLQPpotil8EWtY+57/kqrhdO0KMq8HRI8Ru?=
 =?us-ascii?Q?4mZvt92T966UjrKkFRb0/5AZHuF8wa1spXxT+DEUnGVqz8UM21idUGhfY07H?=
 =?us-ascii?Q?7z9LZ2IhHWWcf6dvU/v0gnYkOg/prTqwapL3ARZtlvbEX7V+0n1oJm8mJDzH?=
 =?us-ascii?Q?j9oXju/0ax9vMtQFLmT3/vqK3JF1IDXTFWwC1BhaI/EvwubO9Skp4fBZXZVu?=
 =?us-ascii?Q?EhWhnaWxg03WWv0kg8DW8DU0MhQvhdGDYZA/SqaAvcTOnQGlQD8ajN2sT7Iw?=
 =?us-ascii?Q?bFPomPh7eWZDHy8IZlxT6/Usc6oYJoWW9Se2V9Btk9ldiDIvmndUjBBdq/v4?=
 =?us-ascii?Q?v7/BAOqakLZmxMsb3bMDsshP99xGAe4xa4seGrhkwDgGH+ehbVhC4Axu3xqY?=
 =?us-ascii?Q?2mOSUDJCeIj5248dR3xklP5CDZodjieTaUN7cBZOCJP2AeWsdYgepP0hX4JW?=
 =?us-ascii?Q?+YaV5iYqo0LOfHhqY3pDFafu1PQZmXj3y7jRb6n3QpNmEKdN6dSc9aUQwNUV?=
 =?us-ascii?Q?LwY46BcW1X65EfU2TxyPvuinkSSdxZRn49DGM4FwtsS1bhccE3ILMlKT6Vnm?=
 =?us-ascii?Q?VtM1T4QrGP+KxkJvZ1UnUGUKWu+rkKtVdlmMiHkwLID2K0kMTKOXwh4b5zph?=
 =?us-ascii?Q?o+XrjKZqC//xVTnH7MCjPV0do1fQEH0BPIdEcNn7hm+ptLW6+JI3bAHfWVSZ?=
 =?us-ascii?Q?qeGKZLSgJDVo9QwYz4wNMQ5+u8E4xzUrbwzkad4qLwROApJrECCD43rqvS6q?=
 =?us-ascii?Q?NgzpT3cteNQkYfBMUVidlx3QHcb9Cs6BVbMuzf6hweS0JbJ00jzYXXnRCy8e?=
 =?us-ascii?Q?msLla6q7vSVTR4FXZ84UHO7RnMrQw4J4jGhtMTBU667TDFJqKa7PxsxYtvhy?=
 =?us-ascii?Q?B2c163F/H93oCjmCS5ufoL4YMrsn3Ts8KeQ6w1nCbDsiuQ+8H8fKZEr+e9g2?=
 =?us-ascii?Q?uZ9gWcL4DEEsQz5KJ2QLYKRAj7znDtEeZL9Rhig787sK8XEdTsAZHJxKBwGk?=
 =?us-ascii?Q?SiNSg03r32GCvAvE8kPmkYxPW7UrgWb/tmXIZaIMPM6yMughmIgO1OQSjVi2?=
 =?us-ascii?Q?Cr3E+iz+S+VxQ7S18KV68uAywtwOyTpreCAAusTYEIt+N2oOcW2qNL8L0X5j?=
 =?us-ascii?Q?1gX9kV7UWJmmNJH5WaVJGeI=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fda17dd-7627-4ed7-980b-08d9ed06bc3f
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:32:23.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vi3vLXcRyS7gacphLwGgMPrALLyerptZ8f1fPbKHYXREiSfPa/Gb70a2fmKlyVurJ2uQiP6vzh+L4l9Bsyj0ew==
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

It is better to use time_xxx() directly instead of jiffies judgment
for understanding.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/md/dm-writecache.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 5630b47..125bb5d
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -16,6 +16,7 @@
 #include <linux/pfn_t.h>
 #include <linux/libnvdimm.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include "dm-io-tracker.h"
 
 #define DM_MSG_PREFIX "writecache"
@@ -1971,8 +1972,8 @@ static void writecache_writeback(struct work_struct *work)
 	while (!list_empty(&wc->lru) &&
 	       (wc->writeback_all ||
 		wc->freelist_size + wc->writeback_size <= wc->freelist_low_watermark ||
-		(jiffies - container_of(wc->lru.prev, struct wc_entry, lru)->age >=
-		 wc->max_age - wc->max_age / MAX_AGE_DIV))) {
+		time_is_before_eq_jiffies(container_of(wc->lru.prev, struct wc_entry, lru)->age
+		  + wc->max_age - wc->max_age / MAX_AGE_DIV)) {
 
 		n_walked++;
 		if (unlikely(n_walked > WRITEBACK_LATENCY) &&
-- 
2.7.4

