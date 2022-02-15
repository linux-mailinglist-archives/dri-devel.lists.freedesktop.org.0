Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C844B604D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0379010E290;
	Tue, 15 Feb 2022 01:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2115.outbound.protection.outlook.com [40.107.215.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313DF10E122;
 Tue, 15 Feb 2022 01:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpBhjiCt+TR1oD+9SisslBFxuxAzwP3RmV1SRP2G35tgwo3R8fP4B9vzyGNa4CXV8TJzmAPqnAUKZpl2Xu54jNM2zh8RVy/ccZxhfw4Rk+PS2s2WS9im5Tuge5eS18YtijToo3lcSi96fEE7kO/OfYjAodylEiGL3YpJ7hHAeDuvGAOX8LK/NOBIST9pBIs5AnNeCCxPeHizn6a6/pSOzHnFnzMgckyaf16pYdwnfya9NvN2RE53MQ7zKULQlYT7Dro9BMzONtBqoJAg5dVPNHgjELhKhgsY5KseFRPpwCXi0M8sVojwkDpcy8oM+FC7TAMdwJpMOoq5cpZq8q1nRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVSv4id1XvIEsR0JQdTE4jLw7iNsPW85tN4HhR4261s=;
 b=nkElgxMN/UGeiy+TNa1IpvRPTSijX06B9X34/RBnWhhWtWs7/8uk9Ey6Sy3ZrSDROP8IP7ZvRbHhqxDYYTCBtiMM5826UfGHvyzDvg7JwEaTScq85nKY8hMfgMxmJtKJvICyYHqWeKQbBffzh+07ObzmWUwiXTs/IaThnhIxivZJ27nL1zGT5hkdV9loo5RG684YJmY5UQS5bZWSUrIOHxf0XemLHNleQnsd6Q2MMdJHc7HWcKsd1TPbQKF64Y4rrvHSqAcsk7O3p5lXWOw/Oq9KhqOLUkJY523lq0/r9CCHEINJb6klbTakDo3BN9yjfbi5tEKSTGwneaL/tLgpew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVSv4id1XvIEsR0JQdTE4jLw7iNsPW85tN4HhR4261s=;
 b=ddeIggz159DjpX/qqvxxJYqJtFtsN43d6T9NtxuKvj68eYi+qLHLsuFfwuAYqqNwtMJWWvUaUMM3fPfgYUscS1qeI788JtE/gJNxsLTOZdi/fKedL4RSJSf5qN5X0113yXBL7HGeT+Cnd8ceU+4fSUG9L1CwGVvfFzqATsWgG0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PS1PR06MB2742.apcprd06.prod.outlook.com (2603:1096:803:44::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 15 Feb
 2022 01:56:14 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:14 +0000
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
Subject: [PATCH V3 00/13] use time_is_{before,
 after}_jiffies() instead of open coding it
Date: Mon, 14 Feb 2022 17:55:37 -0800
Message-Id: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 065ee1a7-5587-4384-3f5f-08d9f0265906
X-MS-TrafficTypeDiagnostic: PS1PR06MB2742:EE_
X-Microsoft-Antispam-PRVS: <PS1PR06MB274236C9FD5C5DEA7D6B7C36BD349@PS1PR06MB2742.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FIrSayWKZ8j6bJaLnXRVXkxeeoaz+2X+fZyNQFaN2kAW+pPY/0SPu6gBiWhwkTARxPQYDMiLe7MDAlnDaK9iwA6DRW7gnvyXovboKtpHm8pLj52x86aGG0bObeKgRoYNhGdsEIbC8SykF4gclyrpz1Me95ioEx6fgC+f7IeoqW2S8ZKzyMiN2KqFWOBJT3pdxbLP7f82Om51xkL84/3ZHlEr3ycdBKj8vOuaDoyARYD+GYYFqehvDjMsRaorDvdIRDD5tmheAft+0JH4MniHMzLGU5KUXUXGAII3RYwRJVbCKUOADLDK73l5PVvy1ecateULtyFx4fNppHpT9tp374A42+QdGhPaQjAbnMUNKq3/QS6J9KZzKExKOoaUXCsw9q3ETf1emX/KqP/rPptzrrTblp+ME8t5szEDZSFGdy6Qx9JqAosvQXcU8dQ+B66GG9Fy0WDRONz20q6y74ZHN6z7ZF7zQxWsyBDMuICdsHUFlTZYNsZorIP6vR9U8dZvrOew/f0Wfxr+A/Jgiz/n2VYBd8qz/8cJsVYjTJamhEKqncdho/8uOowl49POqBccEicoLsbHdGcSeALavTLX4QvUKbB/lMKcpyvWyb8URypSBvEqfyqxM0OalztZvQFH9nFKQFkGIPhZWnT2my4bw/w0k//BJRCkXn38klTTYjP9epuJFrCKfwl1R1VdgMB+7lVXiRJpl2oPpEVTigTUyi1uHHRqfvkxP8q5YdvZe4a5taTmNQj1gZ7PNGdCvU0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7406005)(66476007)(66556008)(6512007)(6506007)(6666004)(110136005)(8936002)(66946007)(508600001)(52116002)(6486002)(8676002)(316002)(86362001)(4326008)(36756003)(921005)(83380400001)(107886003)(26005)(5660300002)(7416002)(38350700002)(186003)(2616005)(2906002)(38100700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q0EMyZeaFN8KzbL3iUiyuXPn4zqLctRDhl2oM5AW81nmgOD27y6wA7I4jWFQ?=
 =?us-ascii?Q?L/JmXvMM7fXf9FIBfT8clFjwl2ObyWCRjD082rlUj7fY5v5UW99lf17J5K2/?=
 =?us-ascii?Q?6C522xph54B69Iv086pvlvD/LIW31Ub5rZAweDorV+ArkNO4A8631QKXOZwR?=
 =?us-ascii?Q?+Z4em4VVp0eI5Y7of7plCtAXS6fv12u7Uw15BDQJQIlzbxx1ltsmro9HRX3O?=
 =?us-ascii?Q?G75/yk/Uy4vTPpGmQSOZ9Mos80QWLZjvjXs7v+05yTWa80Nxm5y2G6LQxpaU?=
 =?us-ascii?Q?4CJ0/bcAhAWwBXtOzoIG9lp7wZm1vZXUVjUtmkiPBcsoWN0I2zgGHBtzwJDA?=
 =?us-ascii?Q?HG8fIEu/RNd7XoiblVt0lElA+/l4ycyIUfoaKrSwzJfeTJCDp/ozPbEXCqlP?=
 =?us-ascii?Q?p6OnIUSEOAcUFan4XGYJFE8QNnsw5BQ0zFnnXa0SSMR0WeRm2kUoB7NCFcNK?=
 =?us-ascii?Q?loJux/gTqUKclmp3Y/Qd4kN6IfATycXhVZlME67YogTSgipOdXzftv1vewL5?=
 =?us-ascii?Q?TMuw9GrkCXMvgjuWpnNLzI8TrzDDZEjk9zBuan6vSROm5cLkJFShVlM50CQN?=
 =?us-ascii?Q?7s/Zji0QPKLBKN/Ym1TLhw/C+y8g+yTcrJta2rLpVa7jpB5cWIu4FrXewQaa?=
 =?us-ascii?Q?Zu5U/p7f8B7qM0vu340BWF6h914Zx4E0AXkJ+Ktf9Y70NLWWnTWr4Yg178YG?=
 =?us-ascii?Q?Ao44D6aBw8WvrCz2JYaU3s04jLPgg750gEnQbMPU6DgN6kwZW0PH++HNyKpX?=
 =?us-ascii?Q?EUrGDUbmDk09CeKg4QVKEkZ54a/CoPjWa6xAXN69rbUY5q5nK79qUvlhJ1Ii?=
 =?us-ascii?Q?amvnKiO1w+Q2nVfQOznlRnizCBvaaarVIsyYCM1umbhU9VJYbTeloNdzaKCj?=
 =?us-ascii?Q?yu4KokjHBflkqOrZuOXcFo34eM80O/Opn8Y3ZErXMKfPZ4oDKOfd8oErQDIb?=
 =?us-ascii?Q?m9J2LrQYQeA/22B4bmdWDgbeBVNZDs/YKpmc8tZ14dNCWUBFk6IUO7HGsJwM?=
 =?us-ascii?Q?w3+07a62+MwaBwTCPZiV8t0ZIB3/Bk+elgvS9/HgYjQVfOJzsbjBLBEUQ1dM?=
 =?us-ascii?Q?xCt+xBR6GqeLUwTC+kSiFbxcurTN8p0CO44zccVd+S5r/K1zCVclEWcq8ooq?=
 =?us-ascii?Q?M68U+WXMet0TcDXTg1b21vB7zgSX76mzz7+uMvuKSFRltiSmjRCHfAgCZWip?=
 =?us-ascii?Q?SMTu2CLkcwsogr1KKjGobV0THR1qErMZTaPAuukgM9DyCPAPIH2iLL6/CkDy?=
 =?us-ascii?Q?bHMV2FLqtNpYrs1Pg5DhgAdTj977S6rxjzxxHvPbdJpa7yafdzPFJxpdW3/w?=
 =?us-ascii?Q?WzGNnzm0bxYlpx6KeouswMDEO3OpP+CAIUoVsAikPUgCIpNLK2WuYBg/I0iX?=
 =?us-ascii?Q?k7NOFXfYi6tBRHOJIOQ0wzvfc9TNEu3NuWfcDFHUtw60v++Ki2raC0MxihKV?=
 =?us-ascii?Q?qkE2EeOgmMJpCLF8t2cQOAEVppaXY9Kb+9hpBWodqJx8aKCXkNgaPPHvV1fr?=
 =?us-ascii?Q?jCDj0jzgYwfG+BscxhhqGbMyJJvXw+ScPdOUNrE3hkTk49CVkB4doNZ0RCin?=
 =?us-ascii?Q?w5VgF4OhvN9xLBUH9LBkYElj9+/Q4f+giXNum49N1ORdUIG7cFIZSa0bJhJd?=
 =?us-ascii?Q?c9m71z/pz9iCb0mjbni885k=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 065ee1a7-5587-4384-3f5f-08d9f0265906
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:14.6859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwX9eHgjgcKWIuhu3mKyHYT0zeOt0HhV6v9Ys1mfhzViOMm3Ws3VRWJM56jBXfEPoJeNw+K7OVowG0jYVHi6CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR06MB2742
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

V2:
Batch them in a series suggested by Joe.
Use time_xxx_jiffies() instead of time_xxx() suggested by Kieran.

V3:
Fix subject and description suggested by Ted.

Wang Qing (14):
  block: xen: use time_is_before_eq_jiffies() instead of open coding it
  clk: mvebu: use time_is_before_eq_jiffies() instead of open coding it
  gpu: drm: i915: use time_is_after_jiffies() instead of open coding it
  gpu: drm: radeon: use time_is_before_jiffies() instead open coding it
  hid: use time_is_after_jiffies() instead of open coding it
  input: serio: use time_is_before_jiffies() instead of open coding it
  md: use time_is_before_jiffies(() instead of open coding it
  md: use time_is_before_eq_jiffies() instead of open coding it
  media: si21xx: use time_is_before_jiffies() instead of open coding it
  media: stv0299: use time_is_before_jiffies() instead of open coding it
  media: tda8083: use time_is_after_jiffies() instead of open coding it
  media: wl128x: use time_is_before_jiffies() instead of open coding it
  media: vivid: use time_is_after_jiffies() instead of open coding it

 drivers/block/xen-blkback/blkback.c                    | 5 +++--
 drivers/clk/mvebu/armada-37xx-periph.c                 | 3 ++-
 drivers/gpu/drm/i915/gt/intel_gt_buffer_pool.c         | 2 +-
 drivers/gpu/drm/radeon/radeon_pm.c                     | 3 ++-
 drivers/hid/intel-ish-hid/ipc/ipc.c                    | 2 +-
 drivers/input/serio/ps2-gpio.c                         | 4 ++--
 drivers/md/dm-thin.c                                   | 2 +-
 drivers/md/dm-writecache.c                             | 5 +++--
 drivers/media/dvb-frontends/si21xx.c                   | 2 +-
 drivers/media/dvb-frontends/stv0299.c                  | 4 ++--
 drivers/media/dvb-frontends/tda8083.c                  | 2 +-
 drivers/media/radio/wl128x/fmdrv_common.c              | 3 ++-
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c   | 3 ++-
 drivers/media/test-drivers/vivid/vivid-kthread-out.c   | 3 ++-
 drivers/media/test-drivers/vivid/vivid-kthread-touch.c | 3 ++-
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c       | 3 ++-
 17 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.7.4

