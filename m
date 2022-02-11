Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C894B1C6C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB91410E9CA;
	Fri, 11 Feb 2022 02:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2120.outbound.protection.outlook.com [40.107.255.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F8A10E9CA;
 Fri, 11 Feb 2022 02:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNn5PFnUlQRZMroeUdNK6hMvhNg013ALNzHFF4aCA6tIQjuE/IGUwNtsc9o9ocX0gBwgK2zyNWLXbng9z2RHrgCw4E6Ay5ptBCwA+b+G+DElYxUxSp9P7KssRuYYHiIcY771B3LYduPicahMc4sd42w7/INIFVh9tYpCH5nt6HzYGa0VTHorekxnKLfyr6BkeU08PknMDQU/SvWmhQW1VFhNR6Qt8z+oW+nach0t6fV1rn6Qc6olB/SPz5KH17u2xzb5Zb4m0S5bylzkiIgJra1Hiq3rPa/ekftDUhqRYOVlzFQpXfPmDBJ7fLQUzQDS0i+cvGH/lEm1lSxHMohQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0n+5Y+UWhVVFn6fogkZFTZZCvYdUAj53FrLFaVjD6g=;
 b=di86ua/aim/Sa3gK6CBDkLJN+pJ0toIN9C3muFlOIThSpMmZIXe9/TRzGplUAvXdPO+awMomroG9nPL14bCyOmW/2tCpQO2edu8PO/mZJTI01FUz+b7AVFiEYwh5sp+LnEtbAeK5DwoON1y7/UkDGGo0d6k5TrmYr4DvY2hbHXdUNw/MMzPLF9vTo92NIvaleCtf34etFOtBgVlSgmToS9xL24VKexxA/hB6LDB9bcY2myWr90Ql33PbRZc6dNW4bSx2BFMPK0cTjl2dNQMsCbJLWMhAmw/pcF3w48R+//uzM/M7IBk0tViked0RujsCuMtM/l+cCmF4sF9d454SBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0n+5Y+UWhVVFn6fogkZFTZZCvYdUAj53FrLFaVjD6g=;
 b=G8TvP9jD7K7K7nFUHLOqGimeJOBLUx0xSN+gIQI4a17bqYB4kRNr2zygEnh6Iy9iSoSjoN4iphrLW0xJFhZbU30GXgXS9U5xorHCWsJsI4RjN6Ce45Cy1iVsvH5UbHBUqvW/e9udYvd5/UM1dESjpPmDEU3rzmYGRFkF2xhdM3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TY2PR06MB2895.apcprd06.prod.outlook.com (2603:1096:404:31::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 02:32:16 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:32:16 +0000
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
Subject: [PATCH V2 7/13] md: use time_is_before_jiffies(() instead of jiffies
 judgment
Date: Thu, 10 Feb 2022 18:30:30 -0800
Message-Id: <1644546640-23283-8-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c225f979-e148-4ff3-3fd8-08d9ed06b7c7
X-MS-TrafficTypeDiagnostic: TY2PR06MB2895:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2895C5F8FAFF3D4794E09867BD309@TY2PR06MB2895.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+gLbLKDEUYtgg6JicjuPldNAEFxgWIHOT7l4DraoaJD6b+FautiuJXjyJSIJnH9mYKXvyu+2+URwZPVEfb6vN8+fn9tAy71Bc6uiykTfGDuBzTJ0l31SRC+FVmdiStKMGJYItgGxPmMwTWHdRigJlEQoVRSLJuD30YI6EKeosSlg41s5Kt5+03KD7jrPgSU3x7wAPsWx2YEd/ZdeGmDJ/OLPQLtxL8uga4F9oRJ7n3tpd//z6MSNbn23dygd7SK7z3LlOncANQB6BnnEUVhGionjOcYHC4Nhn8HHB+W6tbkLI4Q05+WXhY50Y0g7T5HuZXT1fyRKJntJX/D4xljmO/35XkBLb/WJBBPbxv7L3EZnoRv9+8E35V8fYjSclLpy6GSkmLgJ8ir76dIcz/sUwNkaMN9tpYehhuArKCh4gVArqP3Smg1izn6tNo5NTlWUYi/qAzjzgIFvMjPsJ3e7ZSGINZTq0N6+lCasmPqxtkC0vRYksTQ2uEcMAnIbZXmw7yYZN4HBTUF0uEnL0gsxQ4Tzd8JyQJ4FIbFYPxcMvQmyl2FuO1ptziccMi6fHR60ceVv0K8ymdF//fb6QGhDiy8jTmgesQpIpqHc4JTHlU/akv9pM+JhtXT19Z0WXfOZw9WpkAiVYMrdpno3VHXamMW1f69DbuTOQPcSiZ/3PgeoMJJMLuXbfdTShntVbvmMMa+xpVviUqPZhaWNt1eJEZBS0PqcJgxpQCriKRPTUI16z8JpnXpHbscDnhs/j+X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(316002)(110136005)(86362001)(6486002)(38350700002)(6506007)(6666004)(26005)(186003)(2616005)(6512007)(5660300002)(8676002)(4744005)(7406005)(508600001)(36756003)(4326008)(8936002)(83380400001)(107886003)(921005)(52116002)(66556008)(66476007)(7416002)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9wJunXdafueXwS1HARm+UcDn9TyGyU9g1s76Lc6rMQJXbcwOgVcd4d8/HcxT?=
 =?us-ascii?Q?/JVc9sR2wmCQDk7kOA/mKbLUkeUOddf5rVUcUlE81Fv0wxXIT/Foo0drXfj+?=
 =?us-ascii?Q?okhp/LpdHRtg8IoqR4a+utA8A2LjYTwIuv7AbnnWNUrU8otcHM7DGUU9VSun?=
 =?us-ascii?Q?OSybiJa3wl1QmPNWxBCuY2vE2cmkGuA0Q4Zf5+zvew3XxpH70pcN8epb8+0u?=
 =?us-ascii?Q?ImsWg9Oqzv2/l08hbRK/SmE7K1E24tWVo5yhjebtkN21zBsxvKLlMmB+C4ov?=
 =?us-ascii?Q?9nUrCkwx9PIFlhzkbupJowU/DIOD8DxWCKA0/KETzZwpjNbyEjM6wg+YM7pT?=
 =?us-ascii?Q?rdWeH00wh1eGD1QCe7DP62Zc/DJtjFbqK3ju6fnUqwQ1BnOxn1NkonkH6g+k?=
 =?us-ascii?Q?KniDGW8HavDExlKV8oAaYwtrAw46pWP7CvGHKyYBpWTT5gJ9/RE29rHNGOd6?=
 =?us-ascii?Q?B9AQ8MQjkKQERY/XYUlyh3yqxjkbRufTz7z91kZP0q86H8EWsTSsh4R+ZTuq?=
 =?us-ascii?Q?+yHiaVNfLspSHxhR0EWCFKLGIYl4M2JplniPFyvSPEi3QTirWUWSqYYREEQE?=
 =?us-ascii?Q?LjiqcDoiNITz3jlQwQlmSPydYl7ccGl83oE6Z0Eirrz6B/ATOyWW94XFPNsV?=
 =?us-ascii?Q?VgWX4dJGhPeO/JQk6pnp555xDOGPQrD0uY08eAhh6Ju5Z8WqooBsJjgT4oqN?=
 =?us-ascii?Q?5RZhZSvX25ug7mnGiUxQL2KyoqbhaQebsti/5bLobYl+OcTL9sqiwDjw6iuy?=
 =?us-ascii?Q?P6BUxvccPC0iGVdT3jw3PE9gRhPTa6KnGY6yfOlxsxxe9PygYsDF9e6rtm49?=
 =?us-ascii?Q?so87P6FdbsNze0VvxckqfXEWA+Km1EVuau5FEM8VKuYSVLQTAaM5SqcT1+d7?=
 =?us-ascii?Q?rFt94cSWAzina+8dneb4FTT0XXac6ZRpPNt0U0TiYMmFOKXHj/qK5WaajsgW?=
 =?us-ascii?Q?9HEdcqH3ohQuClPT9k3pyKXFclQKUl+agejOMUufnLU/JTyZSEwqu6GZE4xM?=
 =?us-ascii?Q?jV9Xwi0mzMxE638PMfIjXZ4G+e1ppd+XgjsE+xFzydGg0/izIekIrmw/3lkg?=
 =?us-ascii?Q?2f2wddwU+aNCmewhKVuem5MZXhJ58qlw/+/KSHUkYxX+hcbndPj8RwjEpCxH?=
 =?us-ascii?Q?3zNGYha5VItjAxNc3GpULxjllMJGsUBTwU09b5y3Cp7XMo5yLQLGGhEQaIvv?=
 =?us-ascii?Q?USJjyQwZpKIAdJJvMHTd2bIqXVXmZM0YCWI7QDNXmoUmkKLGAedlMXGRFXvj?=
 =?us-ascii?Q?6k0uhycKg8Jw7bFZIaSdmnspMP7eNc4aicCu5clLStuHtyXzADfNCCWPEG3b?=
 =?us-ascii?Q?RtKH3AlvaqAQ8s7IWGl3GBBNbWJZlS5hWSi4S/biIU6SmytICG0QmyNIMJSW?=
 =?us-ascii?Q?s7bwcIpGqdyqvqgPOsbMxYzIBO1nLzXz1p02X9262Ika9zVbdLuvjsMNM5K3?=
 =?us-ascii?Q?jVEuF1JfIpMDN+gtBk236EAU4YWC4VY7bSUXWp2CElVRoET4QKsQhYhZn7jn?=
 =?us-ascii?Q?D5YjklnY7XuekOlL9KeVHQz41Mmjvry8JHCbPYuu4iovExU+MBp07l6cqIgc?=
 =?us-ascii?Q?dSvYJ/x6mvC111Frfk+SyjIJWYQpkZbOABnMpwjOyNUN+M5/hW3N1tvWHEGO?=
 =?us-ascii?Q?ejej4/MAyunSQ9wmcy2LGEE=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c225f979-e148-4ff3-3fd8-08d9ed06b7c7
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:32:16.0854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4YxRg1ecI7HlnxWT425FXY4UjVoKm196uJwuFAtIX1YYiOd8+uoj7+n6d7o5Qgax39lGdeRzbAoVI+SjmIuNQ==
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
 drivers/md/dm-thin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index f4234d6..dced764
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -161,7 +161,7 @@ static void throttle_work_start(struct throttle *t)
 
 static void throttle_work_update(struct throttle *t)
 {
-	if (!t->throttle_applied && jiffies > t->threshold) {
+	if (!t->throttle_applied && time_is_before_jiffies(t->threshold)) {
 		down_write(&t->lock);
 		t->throttle_applied = true;
 	}
-- 
2.7.4

