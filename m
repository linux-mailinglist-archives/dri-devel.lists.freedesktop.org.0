Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9574B1C38
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A9E10E9BC;
	Fri, 11 Feb 2022 02:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2112.outbound.protection.outlook.com [40.107.255.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D9010E9BC;
 Fri, 11 Feb 2022 02:31:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSefw3STERiZDcIboyeDQ7hVKDchAQmNiB+4Me7dl6Hcb1z+0Oqgm3aM66s8SqkKw38i3oUKOdMWmLBQ3EW6hUKtInvyxfUXoPQW2KeWtlzOMhhzAy7nDQG8sddzIb04S03hIY6Om3cJLu5guOXRzofHTz0ccs5VuhOr09JQBAuDhUgzHS2WKhn2uLtXvz4yMGQrgJPA604slMMBrKewjLqgbCCE2wTUUoEKHgQZOcbrT31PTpFulYDvt1F6rVEznJM9Z5I67SlEbkAqx0HfXUP+rJBlF4qdJBOjhPdEHLUIDClE40/lXXWZqW3S9o2YFjM8cVuqgdBWoY04SjJnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtHTZjVp3/VIpdOr4maT4KogzTfiuLSuNCTpXn0uCe4=;
 b=aYLnns54XD6A1mh0Fd4udT7fqmyk3ABsFlEGZbjf+LqY9YJQR26MALJwChpve2qmcfB/KsD4Lk94RF3a/W/XaAo9Y2cr8KJj6jc3UXT6jBT5antCKsZuQC1FQ+Xdk8eCKG88S1wpVpJsFNVSVEV5VjrpSYD3AfI7kiawi2Lx1I5OKP4/yMcQ65C4cM2MkzppacEkHdxu+wpJ6sxI57Omhx3eYwFA0pCKSehmuEiIXNXTa0GSobNJJ2eB9Bvkn16OyctIegIiza18y0lIhHo2yYTk/uHKTpZV/bMXefKpFv5OvKBNbnsHFYBgdo/ULcCEo0QvUiEECEmpxvhycddWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtHTZjVp3/VIpdOr4maT4KogzTfiuLSuNCTpXn0uCe4=;
 b=LtxIKR8TwaCfMLahGSAsLm7wTDmx0MjTNDXNrrSZ6pyJ36HWN8QlKb17cwCgl7tU4/RMTQVTsWxQ5rWVcFCaqEiAqBHVhmHiiqH0BFi58/3TrufPzB5h27wsA9RsEGdMHy0EmpOW+yg2IlAzfyVN+1QHoCOG16i9iZQydnUQ8y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PU1PR06MB2326.apcprd06.prod.outlook.com (2603:1096:803:39::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 02:31:04 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:31:04 +0000
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
Subject: [PATCH V2 00/13] use time_is_xxx() instead of jiffies judgment
Date: Thu, 10 Feb 2022 18:30:23 -0800
Message-Id: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12f0423d-5bf0-4afb-3a90-08d9ed068cee
X-MS-TrafficTypeDiagnostic: PU1PR06MB2326:EE_
X-Microsoft-Antispam-PRVS: <PU1PR06MB232661841B6B806EA7C2DEF6BD309@PU1PR06MB2326.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9trxlbl85cMDnsQkkH1NC4DB2oryjBfFLQsUgCCNeCl2CbbcZ+YgilLN/AZN1ENXpGHAyeZWvYBY2Pp6xozkOCR20owugnbsLfd+E2CQIFeAex9C3b6SJhLHKl7yHDgY7ioaRc1rpaxu08s5gCp19GzwYLa0hYKpKcvrOQ+WNPcqadNFPok4GVOX4weMXak7W5S1X59H1nHLhKH/JT1m0uWtvsSAU710Fe6bGuF8UM32wCVRwfR4dIcZQRv1atzBaJ2A82pL9d+3XC86vlz922G2Is9bo1Q1ZTHal3UPjNomRICshdnz8bqjq1DaGxelYaJ1U/qz7LLVOoPkncOR8ULs/KpaMTSG47KK9JeRgJHh3FxhVbMu7M+xolm/ydM0NrYyFaQ6YJSOaNB8WSeKT+XLaflRJPLbQGPicklK1imKq8VhAlmtcfqwglnAu0ZxAPCPjzseThQTOXaKDxLaZeySNXMCpSetaf1f2e4oTMwy9GaJXNmZA1hNUZGiH7uM3zh9hWtqO1wHNCaWlVrUroSwkec+dVbBcczRH1gyemvigWjajwJU1E3IlxzC2z7WMpRbWndl/IPRcHD9MIasgUeEk+LW3qEdZzVN6waxEyfdoDuGinvaR3tQ5BzVrrgAARnpufnW41cCi/s+9hcwUTI7GlJJVhKYPmH6RjUeewlo6HVdtYyFW+6BJyW80SGhzAoPARdBSiu1hHPGrEq2f2Aajq/rwSppDoyF8F6D8Dbq1qlo/WeUdpMeXNL4cOE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(316002)(508600001)(110136005)(2616005)(52116002)(86362001)(6506007)(6666004)(6512007)(186003)(26005)(2906002)(36756003)(66476007)(66556008)(66946007)(921005)(8936002)(7416002)(5660300002)(7406005)(4326008)(83380400001)(38350700002)(38100700002)(8676002)(107886003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pwcb38pbAiZgks5vknGSpVoACVQdz2OjZOtgR8g30cFJLya5iYzxuEwxWSD8?=
 =?us-ascii?Q?F2zFdn1HzCeesLJ/LhSOMcQIZ17yIC+zD93PCoHIvsn81zd5PJmkKaMZjgh8?=
 =?us-ascii?Q?dOwkC8xO887eTtXweQ6x1rPlSCJ2K0eh1RUa7M9qDK+ONK2Nabjs10CDvBpm?=
 =?us-ascii?Q?a4/rHJl+9lAxDfyZIrkPsQENijzWitWsY4CBkwnccgNnLWV1xHM1AV/5BtOn?=
 =?us-ascii?Q?y69ZOvUr92hx7X2ThF1+D8q6UKBOJaWOYy/mwmCFUAuGBHcMdB+DXe5X83K9?=
 =?us-ascii?Q?IqJ/QK/25ZTOEWgK9NpUpg4MK7sOK4ul7jAAbHBXylQob7W8UQ6iFwGJAD4z?=
 =?us-ascii?Q?H4ay9UHnBZIIMU/U6Z0l355D3d02LK6lHmaHu1quCS/ao2g0ZYekI5CN6UoF?=
 =?us-ascii?Q?iY4akDiecD5ZC/J/xnj6KgT565iXLwVfxk+L7jMQZbrnwrtu9vRvxuHtIB8P?=
 =?us-ascii?Q?c3kcz83uk+bVzdA6x6KGwYxyep/6ykGUlNLXxpGWDibTagxnJhNkhzviXzAp?=
 =?us-ascii?Q?/iLu/UzvaLz9VOLV/ajxzEbJe4DwUlyW4mCXAM57XwtSRnT7CpGqbss95PY2?=
 =?us-ascii?Q?AKElaZrIkxbZ2kIQWkEdPKGfhovLHcJ3NNxxcg7YfIvv/0m8a0JaHVdFiibR?=
 =?us-ascii?Q?PxY9J5lMs3jKNL4Ecjjyv1H1LodRQSYNbuXC9qJQMQzI0sX108tXnQAVnjB8?=
 =?us-ascii?Q?LlQoarEoKY9XutBBEVACRAPUd89OWnqDKLaKIgaVI9LlyiYP+gMTXNsd4pF4?=
 =?us-ascii?Q?CXbrpVFZ8o0YgXZMdbWb9KBFagBwMjBJurbJeegqTED46CLq+pYYo8pV79S1?=
 =?us-ascii?Q?l0a02iNvxOu37QLIBSFRvGQpcVAyzxDADzSz75zyFAzBT1udwZCaxt2dOepR?=
 =?us-ascii?Q?tPt0WO4nyAVY9QpeGejxVnT/NGp7ymGh1Gu4hjKf5+fayS9k/CFnT1NIb3MS?=
 =?us-ascii?Q?EPXieryJ0lsEmfAYhvudv44/JA7wVa1iee16Esh+sGR/bJQpTgrzQEydXbOb?=
 =?us-ascii?Q?tHrD7jG7a3bToFEkaIxuWT6ejn1UiyTniSMPa814qUgdJJ6O3X9p33MNtwlO?=
 =?us-ascii?Q?/gJTYCEXvHaJIEfSL0Tc7rapuQBb0/rO9TijUJXuOkuldx1t3ldWEwDkl8bp?=
 =?us-ascii?Q?u3wDnytYUOm4b4ZSBPYi5Xs4w/URs8oRwmORk5S4BrU2BjhDiZTTLximGuSd?=
 =?us-ascii?Q?Wa6YWglK87NtFlGApVn007Nh2gEJ83Sw6Q0gt99dJAc8eUPhVMcdu++aM1v7?=
 =?us-ascii?Q?BWNsKpCog8jk4Y86Cxb3WJ7IiPEEWDMP9+1EMxqzstlEgaEUR/7xWsGfLTdw?=
 =?us-ascii?Q?mIYg74qMN3YJgYMQdSuTMbiO3MUJqF+HDB8Wd7fxvLdHwCUP6qLib1i9gBFY?=
 =?us-ascii?Q?FuVXf5KDGjeCXlHNLXSrTi2Mo8tAUcdnC+X91Jh8Jsm084DQtr6dNh1hG4Ek?=
 =?us-ascii?Q?e1MgOtr35Qwjq3nCRicTbpKAwvtP3nQDOmFhvGQOqRT9a6mWyOcLdSY1LxUL?=
 =?us-ascii?Q?W04bpI7dZNMA5pfEe4jlBMTu4w+Qv06LEYS1ykxLBno3f64iIgsaWSGJxUFc?=
 =?us-ascii?Q?K/WclKYZWok7B08WPCUgb+I17WauS0ctVHGawxfjxm/h0AG8W+f4tdIlIDFZ?=
 =?us-ascii?Q?Qt8ji3YjhRcJvw8oe6IMwoc=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f0423d-5bf0-4afb-3a90-08d9ed068cee
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:31:04.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83te74sRfLTcPmKrUYJgY5E4cshmgUH/XLr/pshbIFi5WC+b08UVDDt+dUyLCUoWRfeN1LzfFiWdT0c833J0Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2326
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

It is better to use time_is_xxx() directly instead of jiffies judgment
for understanding.

Batch them in a series suggested by Joe.

Wang Qing (14):
  block: xen: use time_is_before_eq_jiffies() instead of jiffies judgment
  clk: mvebu: use time_is_before_eq_jiffies() instead of jiffies judgment
  gpu: drm: i915: use time_is_after_jiffies() instead of jiffies judgment
  gpu: drm: radeon: use time_is_before_jiffies() instead of jiffies judgment
  hid: use time_is_after_jiffies() instead of jiffies judgment
  input: serio: use time_is_before_jiffies() instead of jiffies judgment
  md: use time_is_before_jiffies(() instead of jiffies judgment
  md: use time_is_before_eq_jiffies() instead of jiffies judgment
  media: si21xx: use time_is_before_jiffies() instead of jiffies judgment
  media: stv0299: use time_is_before_jiffies() instead of jiffies judgment
  media: tda8083: use time_is_after_jiffies() instead of jiffies judgment
  media: wl128x: use time_is_before_jiffies() instead of jiffies judgment
  media: vivid: use time_is_after_jiffies() instead of jiffies judgment

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

