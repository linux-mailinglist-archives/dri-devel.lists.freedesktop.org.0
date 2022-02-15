Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89E4B6076
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9396510E3D7;
	Tue, 15 Feb 2022 01:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300093.outbound.protection.outlook.com [40.107.130.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A573010E3D1;
 Tue, 15 Feb 2022 01:57:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDQX/hEsHJxF5/lqLvlvQWVFnfxcVzalF2MOEQk9WAOky4Zy58o2P8w/HIYNSPnaZgQ0j6YAuR0hFOBULYXQg4jJEOh42EVAyECyaNxLG/XP3FTR+oouzW+v+KEA+j2d0ipmds/eu41YEvbg+xpysI3y3Z/R3hEocadj6eU3unR717lX6ExfGYvh0NYCvI5nEwEwJsVs2bXRBV5csw6vTaAUSPJ3pafoINzPgvTbKDDkbpdimk0WjjhzXK13+IYlqIEzff2ubnpFt2X5FIKFFxOVJAbi0QzVnKQj5FAq+KsbxgXeUxTisGoxFerNxq4IfslApDD9A2npyD1yG5jP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USQtAH68lHNFd3aYmSwp/cn7GBKkIYnpqmGQauOL91M=;
 b=UvHJDA+jXMtoEsBh0+NRbfgfb4F+QUqdWZMt/8tG1HbdRc5ppCgOzwIZ9iDQI+eK9o1jn/VZhRR72c11usrzchFONpuYsxeWJFpS75rJCYvQ7JlFKYTkJutuiRwgd/CMl0U+Aj/oxXW7SQthZn6dFCU1MuydpzMQ1+FwixA1y0oG2s3G5nwEiUva+EHw/5yzFmyt6Oy2/wsgJ5fl7U4VnQOK68if5UhIiFPsC/FqtlO8CxaSicjO7tA0r5Dp5ffZgsomAHcTli2WwBFN0pdlJhBsnu/wKE8ydQ0NkFqBxY3nasB1GtsoNoSgXqW6HaBdcEppOGP3IN+/QMOyYgcVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USQtAH68lHNFd3aYmSwp/cn7GBKkIYnpqmGQauOL91M=;
 b=aD7znasnxuncrTApwoFimee0bVRQBhdOTCGj13m5201OThul4vY0qmJSew9JgNrjQPetc86yHlDs/v0Li9UsSqnMFG22JhvixYTUBGxVdiTVuNNJvTx6ER0Snysgyr2Owf5YoxyVz1XeVbotW0FF0iMPsOt7aB6nfSjf64OReL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by HK0PR06MB2771.apcprd06.prod.outlook.com (2603:1096:203:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:57:08 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:57:08 +0000
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
Subject: [PATCH V3 12/13] media: wl128x: use time_is_before_jiffies() instead
 of open coding it
Date: Mon, 14 Feb 2022 17:55:49 -0800
Message-Id: <1644890154-64915-13-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6296c2c9-2fb7-4819-0f42-08d9f026793f
X-MS-TrafficTypeDiagnostic: HK0PR06MB2771:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB2771C677E22165241E79FC93BD349@HK0PR06MB2771.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qSjKbwTeUefY/5XfnMzQWYZgsd45DfT8L6x6Klg3SnsN1cieMmLcMaWkL4xYkeLO7W0x3iSqkVTk5khQ2XrDoAAw8tIwQj1hQw+hbkc3oYFQ4tumhkZQd20Muyvh6xRWy71DAfkr+z9tRqzGPAX3rF5qXLAn88hJsTu4F8Bg+Qh03pBatNcKD8zWhWr9QwKenkblxg0RpG/uaAUmMQ11DFqY+kGPyqMtYOMukqt90XCYThQuO3Xlxp1diCO8QcJo48PgjQ7kikry7VEjKOY4/iCwju6LBew5PGHh94abvrpIUzzp+YFRF5oRp0RtMGbGgLfV7+UlQb8VfFcqVQTJia033kQXr05fh+CPxnR5gK94KnqKLTeGpsu7ufOt7PhhmsFk7FfarnTNcsCj/vAXINrDiYimDTJskKjYzRXfh33EDNBJytnv9HhHBRYqBbjtWFH2EPsovF3jQhBPDESxoyIgZeKryIw28JtKEn1Awzbh/URMnC8gRsTWtU+hoUP5o+l/J8pxs7PuNJr3SzJYbdSpOUkAP5m0PtnZCCk0OHzsBKRSODbvATPDmunC0Ifo4Sk54bRPDpnABrdVAb4nzBJK0Ixb8wKZ48KHS41d1KOhwfsmXz7tY+kkaRwmxL0F0IDUmC5RPAPHhSjkAv754GZSGxzHtnLNyYYw8aa7fl8GgJ+Cw62svRUVFvCxRlutSV6/WgbN4U8n88eE+glQ4vZ46yFh/3TRmid7v8lAlUo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(8936002)(83380400001)(26005)(186003)(6486002)(508600001)(107886003)(5660300002)(2906002)(7416002)(7406005)(921005)(110136005)(316002)(66476007)(8676002)(36756003)(66946007)(4326008)(66556008)(6506007)(6512007)(52116002)(86362001)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fEdToDFzbgvbvN7qWxtjGGi+QazY9e97o1YF7YbhRPDsHggHUFqbf9v2tSy0?=
 =?us-ascii?Q?d2ZGrpigbm0f2NJZv8hrs3xIIpSq4defvWJ5m/jKqSluy1qRFLyf7WZTkxgK?=
 =?us-ascii?Q?1kpJZhJnVAUOJVC7cOdGF9BQMpwylJk30xJO/cotOM8z12sJo/6htGgZI1M7?=
 =?us-ascii?Q?KnoNAbBPqNEk+1m4aMhLXaSya/i7/2kmoBEGkNzTZS6S0Ym2eOBZ46y/VIgq?=
 =?us-ascii?Q?OZ6WH8Xeazc/ug7gipHmHIw0lIeYV9zTTkFvxH9vnsWcTynmBPHGYIBVEQLl?=
 =?us-ascii?Q?chPR+ez21rlfD0QIGSpc25+HUDb+4Rky2UiwNGKSf4y0uNtoH1IfZkYyHif5?=
 =?us-ascii?Q?NPOnTjBiCqRVloVgsnF/ZkgW7j/yuMq6miQCEYA0UBao568Egiyy/fXuc9ST?=
 =?us-ascii?Q?ntu4Y5NmqZNWysp2NOMtiHWhPEehR5lREWlPqauiZgMHQIbmEklbZ9IOIJE3?=
 =?us-ascii?Q?HRxcH6eeGLAfGs3kM/m1aSPfsGuz/AXgQboEJDiGHCOstX2n2arLJWEdZk47?=
 =?us-ascii?Q?gOnHXIbgdlrNtvBuT273N5GMnbqaaRXX0gc6U5AGxf8zJA0uN/5/8MWQHV8U?=
 =?us-ascii?Q?+1EHaF6ChDy0SLN9BHn6jYH/Q5Ot6TFZf2/6uq0U/yCPTKbXfsGpnRp2xud0?=
 =?us-ascii?Q?cpPWBuXs+xagybrMbZQlBAqa22pozi0oJvIrUuRHOsd8rLk2Zy9T5ttMSC/W?=
 =?us-ascii?Q?Rp0I7cgA4siVVzFd9nIOXR/tb/njBnQ2rzOdRXY5Aoy3dzKMOwBf6ujAMKFV?=
 =?us-ascii?Q?0tWb/sjiMR4uAi2bN0nNFbrc5lZbQ8bGCMdRsBFMKZwfHRYPOfGzbFlkKVNH?=
 =?us-ascii?Q?vkH0559fck0kRQQA2oQCOwnqyc8Y9T/ewAv/hiRyWaZO2lP1V0OmZhdUUPIi?=
 =?us-ascii?Q?/HAj6gT9WrA693LTWyVwjLanMYeh+bgmd0Drgi0TN4AZIQGq49skb0f+H0CD?=
 =?us-ascii?Q?1ugVpJJZY6si8TRkwuPXYNHmvZjZuhsKNyRJwROZvt3ud9qpA3bnBOyqOcYW?=
 =?us-ascii?Q?wPsABG5MyRt4I57cYHU1e9bfnPRtzuAvxlsaKuD1Y0kOSvnBdadn3Qsq3ILw?=
 =?us-ascii?Q?lCYZOGZJnb6jSo65CdWTJYpwWkP3B9ayXxd7f2DO1IQq7wxSHAw5vZoiAZb1?=
 =?us-ascii?Q?4fEwE76LG45UYaHqpzE4WRLqe2fvhZTMOrphwU+KfHetNBnkE6e+MQ3qB+Qz?=
 =?us-ascii?Q?293af7kMgOSEgXpViCWBwzmmJYm8m3OKjAzQ2M0HE2AhRaIV6oy8xqbSY2+a?=
 =?us-ascii?Q?0oKHPKZ2IBuRkelqeyOnG3OlGWOxmoXRp1ojFTcLt3h+emJbIrH9Q19pl/qu?=
 =?us-ascii?Q?ymHx/B+sp3By1upwlc9MNyBIvXKA0qjk7a502R6ECmjbIYZ6us9G/PQU2YLb?=
 =?us-ascii?Q?mTDgMdHNEUqHoOUzIvn0JZZZN0SSIxhAvSlkT8v8tjlKNccNa6aRohJcLcuY?=
 =?us-ascii?Q?aumtCEyaQczqIH49OyUXAJAT55x+uxs93P1DNwvHkbkJlxdnPzVC4gKMJA4y?=
 =?us-ascii?Q?xCSNkacsN0noFqG9IlNI+4r2irT5eoICIQjMNyG5gIzNBNCurke5DNW9gtbG?=
 =?us-ascii?Q?nDlx7B/sSQVeii6pRBkbjgOEm6YnyedmWaIVRw/C/kAZWr1wpBpBkIxAg1KR?=
 =?us-ascii?Q?mK45CnaeHOrIaYoivIWnXNY=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6296c2c9-2fb7-4819-0f42-08d9f026793f
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:57:08.5734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZUQJ3DpGBlABktVULOZhxTm+OFwKEbGKvDe4gjCg8LI6oJ6aIWEVBqVVBcDqxwPhShvhFs7+tS0SH5zdQOGTw==
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
 drivers/media/radio/wl128x/fmdrv_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
index 6142484d..a599d08
--- a/drivers/media/radio/wl128x/fmdrv_common.c
+++ b/drivers/media/radio/wl128x/fmdrv_common.c
@@ -23,6 +23,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/nospec.h>
+#include <linux/jiffies.h>
 
 #include "fmdrv.h"
 #include "fmdrv_v4l2.h"
@@ -342,7 +343,7 @@ static void send_tasklet(struct tasklet_struct *t)
 		return;
 
 	/* Check, is there any timeout happened to last transmitted packet */
-	if ((jiffies - fmdev->last_tx_jiffies) > FM_DRV_TX_TIMEOUT) {
+	if (time_is_before_jiffies(fmdev->last_tx_jiffies + FM_DRV_TX_TIMEOUT)) {
 		fmerr("TX timeout occurred\n");
 		atomic_set(&fmdev->tx_cnt, 1);
 	}
-- 
2.7.4

