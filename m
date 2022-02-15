Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ACD4B607A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BA310E3EE;
	Tue, 15 Feb 2022 01:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300099.outbound.protection.outlook.com [40.107.130.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28F310E3E7;
 Tue, 15 Feb 2022 01:57:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/BPnwY+ZdxxyPyIPnN7em1ZZrfniVeiNlO7hnPdm1ldxYX1feoUux15m3UKOTr0sXh9NoaKecRINMiKYJ+CrwIWTsPX+vCqdyNSC4rjhx5kZAriEeuhJkIQOALiGvJQGEj4agH2lQCgjcia9UoegqBrJpRRnpe38I9Hj5DwICjK+67vdGrwMfG8Gh7dap/bdMb69s+gO2uQVNZU89FCJVB3qikv9wMPhuZLWY+LjpmKm/z3uNKWaobExfakXLE0Z8ohacKWg6gUKBm4pwe9jdTKJg31jsnuy/ZIjbaSZ4T/jgHX0UPboPkoXzsezF2AqzpIVIt6jvXptYpNvsbXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5nzH//PBKk0+joZfpDWq2saS2oSjNrVp/U+ZGSXe3c=;
 b=oPrRBxdhTtRkJW3Gij8/hsBhbcnno+UatYccov9bO0iJnBp7xk1hN3Rxbaefp+QQQ0forR0V6nvwQEVDV05dQm5aYJWIx8FhMOKu3fawTdPrV9JfaHdNifd9hNa/zYUfGkSSQBhQlKMHZOeJrZP7hDwxtsTyFzei8uoqWJun2JV95EfsyyMLoBCnL97AISNjvXOp3ONesp7Ocv28ZTpg4jyDNvjM/IKcS0mkOqcMX6/T/gdG3QrmyHnW3Qt1GAX8IuSPemuVBLuFOUH+/XSBUCgtlNeWs9noSRHR1ZxjMb51SlpR2506PyMcbezEXIKB0r/Ew5osN1vK8jw95TsUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5nzH//PBKk0+joZfpDWq2saS2oSjNrVp/U+ZGSXe3c=;
 b=Xb5egVe6Qv70vT8lhPbHIt9VrBVhH3BwkIDYAkPe5y6nrBXwLUZbG4tjOZAb2wnlzdW7lb2rpuhIGCwDGOLgBmp8Nz1t6MJUvD37UDDpbrTSZdrsBRhZ6iI9VET1/K2gRnpxpKm013fB7pOy33QQ5FYddoDzz6st8RB63X+Mmok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by HK0PR06MB2771.apcprd06.prod.outlook.com (2603:1096:203:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:57:14 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:57:13 +0000
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
Subject: [PATCH V3 13/13] media: vivid: use time_is_after_jiffies() instead of
 open coding it
Date: Mon, 14 Feb 2022 17:55:50 -0800
Message-Id: <1644890154-64915-14-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b832f5a-dcb1-4e65-5aaa-08d9f0267bfe
X-MS-TrafficTypeDiagnostic: HK0PR06MB2771:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB2771D9FC8FCE2704409599B8BD349@HK0PR06MB2771.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:590;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/4bqIzmoJrpbSPGOKQFg3STl7pNYuYY7HyAxnoNBYmHT+1a0htC4+KZF4nwpycZ1/W4Ctxzyx/PTvG3N36pMzTrkwSMNUzF0eUxAwl/1rlecctY7zsoP2L9SvhyRdcRzpjhlch2M5M7XpQvoZMKh3HDdA2KuLfI2jIInkjIyZpJvcAv8EwliaBDXBzCoOTQcOsr+HBcV27t+G/srcgQdCQEO5z32g6Mb8n+3eBGcZXac/IEc1tk+5fX6hHvOILfg26RgtWlnK84Uae7R4C7zu50/JvXvt6dDOeuKSsyKuTnrdXUeNToguNafjyllSS1g21/q7jTp1j3dxuvHafZTl3z/6qUQJ69+xXsYaAC2JHjtZvQ25BVpldPtExoa4xHj+jLPRg/7qLfrffdM0zMxI3lFePj20ysi1vRUAQkRIGpchPE7xvv1LD9F09v0tfSMppv98XwLX7xDgXiaI0CRk6ciSNtosf/CfVu2y2Awx53M2z5rmBP3GbGRyO72dVVzSpJxNzgnmqG1fn0DJtYOJSuWiQizCnY26Js+nXAWNIJ06euzmYCW/ncuyuQjZjaha9PlxiMUg5Bh1v7N8bQ+GmH3xQRqDnVBMKYpEzlaCJIrqM0Pp2Ze9cY7qgurZBMVHLi7cz8NNRhhXhg39xgy/3fmUR1GgJImDyuMo0WJz8Kpy+aTQNRzKhxeupYM5otuAJslYIxdxixFCxsrIz/AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(8936002)(83380400001)(26005)(186003)(6486002)(508600001)(107886003)(5660300002)(2906002)(7416002)(7406005)(921005)(110136005)(316002)(66476007)(8676002)(36756003)(66946007)(4326008)(66556008)(6506007)(6512007)(52116002)(86362001)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bK0nz8C1sAOMe2uEktKzSvPsIyfDKfV9FcSqR+eBqcWsshGvBa4WTZxU9KiE?=
 =?us-ascii?Q?3Vav+GqZW7U69B2v4SW8UW71GSYl2UGRPwB+hEPoa2P2v1HPRTk6E+yeY03a?=
 =?us-ascii?Q?Zoe51jzCRekRNgd0Zfa8LyGJpeKJ4J2ZGHEYxlUKVyHUICMKKOxn3LAcS54i?=
 =?us-ascii?Q?3JWXhM5Ir/j1SPSAB2BtSxLERl6DJc2MkRkLRNieotOIfArJ8Dg/wOBaK48R?=
 =?us-ascii?Q?acOhO5vW1kEdBIcih9bnKLFZDSo5wJmnd5lkB0ifef38Kot8n6fXzT4Ewij/?=
 =?us-ascii?Q?JQGE8ompPz3xAZBs1vqFipu7WwWzHS5n6pvKprgGGYJKuXToTGtkEt1Te7Hc?=
 =?us-ascii?Q?ihh4zgPRlEB3B1cr9nh4AHp4ZmkWsdEvMIdgyoR5JW4eEsXsUnq4GtPjRk5F?=
 =?us-ascii?Q?PPJsjU3jNOUVWrO7ZBiiY4yOoppLLknRub8sfYbIebgTdg6BgwGcfS8g13vw?=
 =?us-ascii?Q?CO2+jBzLb9uIGEU33ENOq6QjZdKzUElFbkPw6Jbk4MbPmDtn1yqVtVxQ125l?=
 =?us-ascii?Q?Yw9SdR743VUpRRldl/IRLoKC0E5j5bXfzANnIypQGtL5w7J3WvaRe8oMQ5m5?=
 =?us-ascii?Q?y13uChO8xNvh975DtaOg4HrLP5fh1jbkYVllm4TauZ0y0GnTbCOLU4J7WXTV?=
 =?us-ascii?Q?IDTyuyJW6Wg3VMD3j1XxNPFzK/3gYbttE/35o2wL+JYP3R7SPYHa+OLoX5nG?=
 =?us-ascii?Q?IZgz6347m+JC/13n7BgJ+/TfttoWX9IdRx2GAQg60lEJaTEtoXeeANjD0vip?=
 =?us-ascii?Q?ZNmtR81KhQ3WzvrJ0tyBEdTE9iqt58cX/sv/g+juJ72n8gnDYN66DdpWjI1w?=
 =?us-ascii?Q?h241ziU2Edw4OqKVceCI6yBL+p+GB8gFLCXdqya1ULuLjOsHPFA8UYofJANG?=
 =?us-ascii?Q?Kk3/NyVWwJ5nnnQQWnNxoDsTnIwX1gs8GEf/arv+/g8LqEzOjVj9m4axF1PB?=
 =?us-ascii?Q?dR0Jwr2eQkB2fT6v9YeC1G6zh6Efj50kJyhItTSTlX+ZYDjw/LIWK81p1D/Y?=
 =?us-ascii?Q?UZCRzvN30HUG6BCTdpEJjElEphkrzSIASJM0AVgMV65nnibnCJnr/d5qvNbd?=
 =?us-ascii?Q?9HiIspZG586oGk+B8kHhl0lXnB4682W3u+806BQog5YIwFTjeo6A9vExY3l2?=
 =?us-ascii?Q?+Y22bHHUZ29d1oLocAYelNLv2MGfYnYEhU55KvO3zG/tqMSwBOlTbKCLJQ5v?=
 =?us-ascii?Q?/PyrIviFHhht/Xwfy/FXURBEzA40RzTK2yMDZVZTBeLcTXeNqu6WPuUg0ZMp?=
 =?us-ascii?Q?TlrVTzO3GwXhSpDqBqfqCNxL4OWWGcVQf1sdoDTdt3bCKoH6c3Jdf3sGbDDX?=
 =?us-ascii?Q?Lwv1ovGhvyWvJa+FkrnrGMNJOGJBEywV5XyU5XmEfqyvoZRgTQeSqifwD6ik?=
 =?us-ascii?Q?hfJaCXJas1GH5OcoaI2G1QoxCcqScLz4dceDs705ftneXbQ9Zx5HgB0urOgi?=
 =?us-ascii?Q?145/5Jaf9b51bo95nqOZglW8AxsfiTJcsur99k7xj2FVC38wF4II1TAlbbiA?=
 =?us-ascii?Q?QvF1XxxLoBN5AkOGhBI9Fq21+tmTXulegOcY5MySIWm3MJ4EUGX+Rxr1vr7r?=
 =?us-ascii?Q?1wKNCzV5xjDjpzYNYlJSI3EgvGYl9cx/48GLboYyfKvjmCpzN8r0fbMuIfxg?=
 =?us-ascii?Q?JRkfz4pmTNqX4/+9vBRbhOI=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b832f5a-dcb1-4e65-5aaa-08d9f0267bfe
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:57:13.0888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyZdUVP+2fWY+yORosp2bLfqv4Z5+NzGfn3oDk/tXxeEcEmDE7T6Y895G6GWUbvVkpnX9VDalim26j+6jFRLMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2771
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

Use the helper function time_is_{before,after}_jiffies() to improve
code readability.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c   | 3 ++-
 drivers/media/test-drivers/vivid/vivid-kthread-out.c   | 3 ++-
 drivers/media/test-drivers/vivid/vivid-kthread-touch.c | 3 ++-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c       | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 6baa046..295f4a3
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -18,6 +18,7 @@
 #include <linux/freezer.h>
 #include <linux/random.h>
 #include <linux/v4l2-dv-timings.h>
+#include <linux/jiffies.h>
 #include <asm/div64.h>
 #include <media/videobuf2-vmalloc.h>
 #include <media/v4l2-dv-timings.h>
@@ -893,7 +894,7 @@ static int vivid_thread_vid_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;
 
 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (jiffies - cur_jiffies < wait_jiffies &&
+		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
 		       !kthread_should_stop())
 			schedule();
 	}
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
index b6d4316..13f737e
--- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
@@ -18,6 +18,7 @@
 #include <linux/freezer.h>
 #include <linux/random.h>
 #include <linux/v4l2-dv-timings.h>
+#include <linux/jiffies.h>
 #include <asm/div64.h>
 #include <media/videobuf2-vmalloc.h>
 #include <media/v4l2-dv-timings.h>
@@ -234,7 +235,7 @@ static int vivid_thread_vid_out(void *data)
 			next_jiffies_since_start = jiffies_since_start;
 
 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (jiffies - cur_jiffies < wait_jiffies &&
+		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
 		       !kthread_should_stop())
 			schedule();
 	}
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
index f065faae..8828243
--- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/freezer.h>
+#include <linux/jiffies.h>
 #include "vivid-core.h"
 #include "vivid-kthread-touch.h"
 #include "vivid-touch-cap.h"
@@ -134,7 +135,7 @@ static int vivid_thread_touch_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;
 
 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (jiffies - cur_jiffies < wait_jiffies &&
+		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
 		       !kthread_should_stop())
 			schedule();
 	}
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 59fd508..f82856b
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -17,6 +17,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-dv-timings.h>
 #include <linux/fixp-arith.h>
+#include <linux/jiffies.h>
 
 #include "vivid-core.h"
 #include "vivid-ctrls.h"
@@ -205,7 +206,7 @@ static int vivid_thread_sdr_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;
 
 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		while (jiffies - cur_jiffies < wait_jiffies &&
+		while (time_is_after_jiffies(cur_jiffies + wait_jiffies) &&
 		       !kthread_should_stop())
 			schedule();
 	}
-- 
2.7.4

