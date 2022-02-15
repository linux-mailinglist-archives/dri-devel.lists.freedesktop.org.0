Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712814B604F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:56:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781A10E3BA;
	Tue, 15 Feb 2022 01:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2119.outbound.protection.outlook.com [40.107.215.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7431B10E3BA;
 Tue, 15 Feb 2022 01:56:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9zNVsqDZpeU5VqBbaE+1mGkTeZOJcRIIyunzWYApUBozzIJ9dc+nAgY2VcWP6OuJuQNbIMo3T5M8r4+cosZe1qlzVvCTpjw5tTuMUFYxnp1DX/pwqFuupR1cya9v73JMWOR9YBM/QDPhJC7hbuz08V3e56dVCiyAz2oc+3BPxo1wFuGRJEAjisMFMkwFDfCfZ7/ik1K3bJpddhp/GyCi1Vt4pFMbcKONsz7p0vz9EARIz1cRZ/KrPBks/dh+6USZa9Uptrvn6h/WvWbBgCmVqwjVdWCxRMFi5zEMoVac/b7TjxwZARZqawMdFixtduYFeZkxpliJ3iXh2eALujZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plqEMFlTcQNTzi1qhffG46kETCuLRyfOsTN8Bkig3pc=;
 b=Z7UjIN31QjRJqbM9D1ke38hm4/MYMEpCoeoeOS9n0CW/iYHamGBUE6Lko+VoRwu7NIvRA9NlWPBN4IqHh5g2o3Cs9APCbk/kTnUC3Po0fHLCSpXPlF0vp52PwQ6XXDzaRovUM2Cy6H87eT03+Kqaf8DctL3f7N4yqFhnrac9QUCJAvIE231FUURMVLY29rLC6sHBR8lFXnjwr2zEWcrNu9x7saI4YrKoOegeVpEviFr0cXOh5JGN2P0VeRS8b0JQ4hzryBHx8EebO9ZOQyxBhXfy0eUWaNHI8FAovcom0YJ3F7A20IOEu2ix+whWlGoppyQdshS7schazfDvJHxp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plqEMFlTcQNTzi1qhffG46kETCuLRyfOsTN8Bkig3pc=;
 b=gOwFV/bnab2QOaRAgDx1p01oFAOsL82Umui1UxURpbpbswG2GHT7WQnq7YjF2IiNZyfY1fb34Ac9skSZ/vIDRETzRn74gIpVlOhR72lNLQ4Czi9BBTqnL4Puz8gDXZG4Ey8rse2OWWsL5d6gcbsY4Siy12hEhGeSUXMSpqxMAZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TY2PR06MB2767.apcprd06.prod.outlook.com (2603:1096:404:3b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:56:24 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:24 +0000
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
Subject: [PATCH V3 2/13] clk: mvebu: use time_is_before_eq_jiffies() instead
 of open coding it
Date: Mon, 14 Feb 2022 17:55:39 -0800
Message-Id: <1644890154-64915-3-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a592c175-08d4-4018-d460-08d9f0265ea3
X-MS-TrafficTypeDiagnostic: TY2PR06MB2767:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2767351B13A2B13D4B513FE3BD349@TY2PR06MB2767.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zX2WoqF7MNdOKgvoqDvJhcCDh4FqMCBpHKSG0rNS5d0U+wfBxtQaDuQvl2Hiu1iAu8sUtj8UvfwKNAoaVBhkUUPMnrPHGdx8PIsfUNqxJkdGO2IYtGZ3L9XZR3h+FYFlcEtpceVk+KByzXWpiJEelUxepRgviV9UwUT/4vru1LDbp0ILVrDonHfeNbxbVAhM8fbVAC2dUK8uA7YBRTTwT59hS13MUTqvpLY2pW3POiM1hhiBYw02MCO3skFt18GK3vmcCCnskhLws6ioMXilv5GBRXiKF9UPI5XdDIBCaT97lAH5gWduNHdfSfyv/GjybSM/qWGyZ2UbMxeWa99WZtZtIKcMudJcOQr6CXdrwS1hWyANXWFLp0/qMVsoTLFGLrCrAsQ6MhLMd75+FvkTvparPFv15z3TiPWQxIXK/xrUdOtUkjlUhHLdfrFhCrVtUKDeUzTEjJII8xoKcwM7qehlR9ET+kpyMcJqR8IxsizFZaYJgxYcclNcJBJIxeLnmG7g5Ax0p36SIfhDft9AIiXlLSRJzES8LSdltQfuYBE5vvIojX99YZCoyiGJpy7Ns1xd6O22/7N8R4n6dS3Ny+LYr3hSUt/DPh9XiapEDBdUhCx0jkinrkQAKEO2vWCHgU2txvTdZ2KkoUQl5eQzIlXQMiuNZ+4kL7K0iyRBYEJ/yYL+08Te02m/HJSTM+0JJUBuI10lhiJCpSwMIfCvoMmjL0Etsf9zIQ+E5TPGeaU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(7406005)(7416002)(110136005)(107886003)(921005)(316002)(26005)(186003)(2906002)(52116002)(5660300002)(8936002)(6506007)(2616005)(6512007)(6666004)(4326008)(508600001)(86362001)(83380400001)(36756003)(66476007)(66556008)(66946007)(6486002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wpw5/l7FKXOSWvAniOTgrmDA7O0YmEK3cu9ebJT2n7gDSmUwwYsI9grkdQj+?=
 =?us-ascii?Q?vtwlJvrlPqOtYPeYGTA+EiC+m+Y4RSpIEMp6AyL0pRiH4c2RYUCUXVN73oQ7?=
 =?us-ascii?Q?BDWpKO/0+k4xYHfQ8GIXoylYLO++eVRpGrr1RE2bomQMplb1O4zPF8gfqNx/?=
 =?us-ascii?Q?qIwQ9XwA/rRmzmCplmTLnn14JqeC+rb8yS92pYyIcMV7LBmHYoRYV3Iz3E4i?=
 =?us-ascii?Q?M56X6HOyPvTj0EpQXlPrEc+vwpMWEzDyfBRvPaTuauaPzrY5xsi/ngsidFd8?=
 =?us-ascii?Q?i43p+utDVYBqBjpcGRJ5meXl4f3gh5lghVJdN0ma1ZdOx1nLI1fPrU4+81S9?=
 =?us-ascii?Q?QVVhEmquiYxU1pmm172XWG6WkSs02rcFzvD+7/63vC5CQnk0o4osGxdQwHpb?=
 =?us-ascii?Q?uU0HZ/uRFcI2BWjeFONl9/6DBpRupYo/XCJWFRraAh/+PvVvBIecIbfnA57L?=
 =?us-ascii?Q?Z7X57AkkIl/sFasRRHDkV6+QeWNXLFGqx5fHWUgQqu3NzccKJiSbPfnhk/cs?=
 =?us-ascii?Q?dYDCKT4IC59H9UylRXsaBmS8NPeboXKbcPzKevy4gONKgSy8Wp2+mqp2jwAh?=
 =?us-ascii?Q?pRFHdrGOqLdJxYHyk6C07BJiF/8QWU5TU0+5CV291WlEe6lwPaQm86FMl//s?=
 =?us-ascii?Q?FRKnocqxAyr3xh5d+bOp4yYMSmbEC0RYppm2hANCkLXhmuwB5Rgz3CHOSN+Z?=
 =?us-ascii?Q?I1NXRPXtb+UOspRKqZLAZcDbeXW1Br7nfk0z+KzFKYaLgLeDOW4bHY60D0j4?=
 =?us-ascii?Q?IuERPVqvGXWQy5rSYbU6p4QALOu2uHMpLNF/9u/syhN3cYZVM+nlmfU1zn89?=
 =?us-ascii?Q?XR9I60V1a1aUWhwIFPkRglJxrcWLsnEOC39bZlJXEVkQxhDzVeeDOUns01V7?=
 =?us-ascii?Q?zI64pmtancpCjbT7L952oHi7i4JXQx0hrWmH+XyWos3JhVNIyzVuUjBVJcy/?=
 =?us-ascii?Q?rakcshLNC1FdvSl5VU2/ZsM5V1GuLY7I7J0UCvYb2pz02m27vlba7eJD2xCm?=
 =?us-ascii?Q?M5vjCe7a0eLkRYfS7n2nP42BB9kWUkSWxTpN1zCBLL2aWBFliraNvEK9fm94?=
 =?us-ascii?Q?NPbMW4veEOKufI9SR/tU8VB/xAV8NBOIGw9gkLMci83S4kgayd5zRGxfJt4N?=
 =?us-ascii?Q?e8WlpLoE2ggE7Tr/dY2Y6waUUavn9GfpuyX1yYu3FuNjot1lmewLCQ+uuBBB?=
 =?us-ascii?Q?bBHVBag0ugRmL+XtIF/DVfuylRwz9zB/9kqJd7/fkp60VPvZhjd85Sof+i5Z?=
 =?us-ascii?Q?aDTOOXU8q47n0KZALH5ywnl3DHe4Serv7jV6yROXugz4il7Q8doUMfSpZbRl?=
 =?us-ascii?Q?C2HHjm3nRe5fLB26e/cN46qJFC/LZvFC7qWE0l4yPbdoY4D6xzY5NP6E24BC?=
 =?us-ascii?Q?YEnXUSsOv3hnOAe9iWTkfoUhNCp5dDbcfLjw5lyOR5zZwRN3kh0lIkbUznE2?=
 =?us-ascii?Q?UxaoNmMhJIy7EhMQ0gsSM2ovIdhr5v1bJSAW8C0JigSUtY7nd4PV5+0NcdBS?=
 =?us-ascii?Q?qEFfUtS59ee6kAkDO1QKbSLBidp5a5WtH3dCc1HGuY0AeqiuDjsWK2Q/Lf59?=
 =?us-ascii?Q?aOPLIl07l/mAqmbPG5Ei8xxLZ9svR1ldKDWn2wraTtw4kMDh04jkKI4u+ao7?=
 =?us-ascii?Q?B0f2RuwH/p/cqJ4BlqIDWHU=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a592c175-08d4-4018-d460-08d9f0265ea3
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:23.9354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Edh6wThjQcu9bBPcnAQQNuMw2s0Y/99k5LlcNHPrjrGpOlLqbeF1aegTWK9AI/RhKFCCkax1Oz7ajkvWdmyf1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2767
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
 drivers/clk/mvebu/armada-37xx-periph.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
index 32ac6b6..14d73f8
--- a/drivers/clk/mvebu/armada-37xx-periph.c
+++ b/drivers/clk/mvebu/armada-37xx-periph.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/jiffies.h>
 
 #define TBG_SEL		0x0
 #define DIV_SEL0	0x4
@@ -541,7 +542,7 @@ static void clk_pm_cpu_set_rate_wa(struct clk_pm_cpu *pm_cpu,
 	 * We are going to L0 with rate >= 1GHz. Check whether we have been at
 	 * L1 for long enough time. If not, go to L1 for 20ms.
 	 */
-	if (pm_cpu->l1_expiration && jiffies >= pm_cpu->l1_expiration)
+	if (pm_cpu->l1_expiration && time_is_before_eq_jiffies(pm_cpu->l1_expiration))
 		goto invalidate_l1_exp;
 
 	regmap_update_bits(base, ARMADA_37XX_NB_CPU_LOAD,
-- 
2.7.4

