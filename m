Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E62114B1C74
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C761C10E9D0;
	Fri, 11 Feb 2022 02:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2124.outbound.protection.outlook.com [40.107.215.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F1710E9D0;
 Fri, 11 Feb 2022 02:33:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYcls2hYgTRkgRmLNYq+PpwVIWJryFOwxZNyueE26a3tnCn6NO7ctkIsPPwe6D00MxSJ4nBypq+NL9zLZs70r5i+aC86rlvau8xIqaopkvfC0KFZJCBWOSpylLCt3MiVBK4WPNMARQKjWtphsSwPWpa+Tf2nmtyfsu/aykmtjvefwPJdYbFF2gZ/u8mCC5xLeTirYR4HCMqt57p0+OpLShvt13urdeGBmVeiERdpZ0XETvdNFvXEjeKHKu4R7kmIPDamA6ueWCEkCoBHE85FmXn/Ek7O0wM8uCNrxMCQ/ydjPr1AKH9by6o/rJInotFRSWSwSFh6m1Rf+lBvL8uJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTRNaeTNqvizWhskx53RuBoI6rnoc/OaONHjRSZtZb4=;
 b=laobJddwq3euwBKa5idoNzIY/7GQA2ReT4wkGY1t/IuwriDfjUWCgXneQBVKvJZbjQMEwoL2XoSepmVxUvm4oj1eS9W8kwTplcbQ7ZfYQeKDkfl/90x+zYYhHCzrezi38qdD5Kb+x8JVTSIVEnsmq9+mFydaSulJhUpxWb6V5qKXJ4v6wiDcfL8r0LLKE5vFifVM8+rF1YNx5K6Oqjdovwz+jjX98zHg4fce6+ybX38hCoKnuRd7OKqXeDzEx9iqtpZsD4TPa7KFOVPb5igkNIUlycp2VdASGx3oQvKqFTns31bbtEIwZ0BCH9ZmgJGUelczm8McgpQKhDvgDzp8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTRNaeTNqvizWhskx53RuBoI6rnoc/OaONHjRSZtZb4=;
 b=LuaQiHhLoMWk0Q6lAgXzFEOIF6E/Tvssv1qtqGP5p02RQG8Mvb2Dz7NV+nXvvOaHeq3gxceKD6D9jOypqntrMeIhxRWvSnVV77vTNmiVa20z3dTY4XqQWxjMbfgk3YwlPk3stSSsFVrkIniZKlundxfpguDw8QV/1s6+Co3ewWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PS1PR0601MB3705.apcprd06.prod.outlook.com (2603:1096:300:80::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 02:33:02 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:33:01 +0000
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
Subject: [PATCH V2 12/13] media: wl128x: use time_is_before_jiffies() instead
 of jiffies judgment
Date: Thu, 10 Feb 2022 18:30:35 -0800
Message-Id: <1644546640-23283-13-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0c82371-8017-4197-5f91-08d9ed06d2ea
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3705:EE_
X-Microsoft-Antispam-PRVS: <PS1PR0601MB3705AF49C75AC16BA5099910BD309@PS1PR0601MB3705.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 11djht2qCnSHMekgjn3yfBRNtKoR0UKGRdDeekosS2A4AcFGfSf+QKEcjVSnzr3ieJMEzCCnbyUD7zK7fd2IcVdw0r4yjmIqyF2yGbTm+2HU4IlFNRVNlCKKDzRlZ/6cCVK37j2tZ0Mw55gBsf2CFgFEpdmKeIS+UijpaMSkOLATA7oqL0OIuuQVDg+p4PfEZaN8rqN1A2VQH7ttB9uBIX1QuI7bQLdAdVou+oIweYykJdmldP2YkkYJJxj8P9cFqoqSruo+mu2cJaEx0HEeAHnMIiO2tAhoUJQM5465VSFPX8O0eoMKKQuNpCyjC5sIljeXf0enq7aKAT6lbhSVB1nreAIimblP2EiIuFzqnnsURNqftyYJxzUPDBLAM5kenQUdKj5zUvGSpqhgiqLrHx0MtWB28l6sbzxD52d6iHp3EM1j3KM6T98sYHvMbFX0oOZRroNIYvYKkVQ41UTrURd+fIF69cftcJiBCa2U4TxXtre2edAL7Xf3Dmr5zRlq2lbuFtffgfkBkv4YbzE+Nqlwg36WM7ihe6PospLDzLIrL25Z3iXeEQz10a3Ko6R89PJzcS7JGG0eOGV1u+wijPYeha6073Gp7Mecq2MK1wX4vfIblPMSue9oHRzEojZpvmBbZx2B/+DhzfB+rH1xuC5F63LNPO4aD5udzwWf2fz6s/XwP8QuzB/cxV7XJrrd/BRaTaXaCA5ozq8eLq5y1gtQUD2ZTAdcWp005htUYf8JtG4kn7FB4qp40LfQrBdB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2906002)(7416002)(66946007)(316002)(36756003)(2616005)(107886003)(26005)(921005)(7406005)(110136005)(5660300002)(83380400001)(6486002)(6512007)(6506007)(66556008)(86362001)(6666004)(508600001)(4326008)(52116002)(8676002)(8936002)(66476007)(38100700002)(38350700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j9fyLt2pN3iVlwuQgYSDuidhHBuXIqGYNxxdAxZxiLqMohOtaeQ4vcG95cj4?=
 =?us-ascii?Q?8tk23Bxd/fSNFy190paiTPbZL3vhMrekLNGVOImi/gPBk1Nmv9rA5EhMuCUP?=
 =?us-ascii?Q?je1dnQHm49etj4mp/Q/gankTIjbTVaB62MwksFHWLaiLP/pNgQUEJYyr5WoC?=
 =?us-ascii?Q?OMjBLuNNTc/mwvq11hwxOagLktLUfBsWIWzyh5eGr+/IobCHbnsPjJejsNRY?=
 =?us-ascii?Q?xZbJUywMZtmYConMfnjZ+w0HCd+Uft3dek8DObgX88vbFk1wnhyvfwk1AQ0x?=
 =?us-ascii?Q?uYuIbot6Bkxx33EGOf8p83qlCg8m0YznvJsThw3o3CGJHmiM7vv+uNLaMtlw?=
 =?us-ascii?Q?usupnjPdxbrdZXbzikVs312ML/TVP6s8qMU8b7DtjE4EqVhixvtN+ZGxIVJK?=
 =?us-ascii?Q?0KzoC8C8bktQol0RNWc818k8cAcO6wruT8ZEgZ5R8Zk+qy7bmpcdGi2FCbsW?=
 =?us-ascii?Q?s9je5QH/Yn6UCHJ1c5oG9uCwsy+NTWu5Iw/UyZUrFlveovYFyzZXsXIA3K0a?=
 =?us-ascii?Q?lxExdE3NfIXWcMgetjHAtg6j5PT2NZFgeIC/RUQaNnV4o6HVpSewEuPC0pwr?=
 =?us-ascii?Q?VgHexVgfvMw/FLOaoG/R+lKAproLn+ODDh3D1pBjq0e/gCJuBSWILxeHKahW?=
 =?us-ascii?Q?q5Jna0NBrGCp5GZ3+qrGLpGy0UCXiQUqxoi+EHYPhuY3AxYxPhR2nUlPIuXb?=
 =?us-ascii?Q?5yFuSIUekF7EchRUNEHzaK1T0eBkIkvdkOvtJRFx2/1YcA2uasFAjbzVvBHV?=
 =?us-ascii?Q?MSxF+3SACPq6sNMNgm0Cu/UH7JxUz0TCBh/SZUBT49E+7Yes8YWgFBDj205N?=
 =?us-ascii?Q?Mp+TOTxnEq/Sf/nEQPhey2gV08XSH5+37sUQo71qI16kkeOSHoUiZxZ92IR9?=
 =?us-ascii?Q?glj+z7pMxkcYjul7sFNTksL8yoKrvPERGBvpUgaRElg5qmlK2bUKO5diNCLj?=
 =?us-ascii?Q?HaewpMmmXkY5Xf7TmEQOZhAwT9/T8KrKjxzBmUpDkyo6N8Z1iijvF6S1rU5X?=
 =?us-ascii?Q?6doyYzqhqNcMQnhkv2bK27LTFrUXktrhC0ABsnJ2xZiRnWgbrFzsoblnlebD?=
 =?us-ascii?Q?rKoVD9/mufSXio0kFwHGCy8kihdYplrZdv8XCNgYMdqVkTbSILPM7+QT3feE?=
 =?us-ascii?Q?lAeO4y6o3g4K8R1jUgNrg7f0pe8o2xN5oqw+wTJXj75JdqPzbeufTeyw0YPi?=
 =?us-ascii?Q?kDFmcPQZ1YQ7aAOv9e8x37tsOHwwDeqz/N9s/rpyqto+GyGqVjh3w1KMwrgK?=
 =?us-ascii?Q?NEt2SLFP5Eb6KdYskenPL0wzNkd0yLDMz0yCNIPoDpJ44z4P2APDeA5Xzgh4?=
 =?us-ascii?Q?s7Db7ETALugxj5MA9fTSin7gcOkwlJDzxeravTfwq7laIXqNF+Mt4IEi94Rs?=
 =?us-ascii?Q?RGtman4w0dQhnGfzetD8P4kt0GstkLSxXwmeezCGkmK2tBRHEqN5Olrimr/P?=
 =?us-ascii?Q?jb5MSFNcL+dHhWKg0Cibf6vl5j1o3ZmE4CzOI6/xz2kBgG/W9YnAIg4sBXRE?=
 =?us-ascii?Q?jmYw42Kp2ugl7V2ivgeqwjtyl43EwCq3BBYSKg9FL55TxqFMyCAs/U+7bVtm?=
 =?us-ascii?Q?/7PCgwOqunni2VGWvO06JdDBSksstiVDmNMy9W3uYmtPM6SGbTApPcjW+bem?=
 =?us-ascii?Q?Uq3uRUmeM0yZNeBmyxrTv8k=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c82371-8017-4197-5f91-08d9ed06d2ea
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:33:01.6141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDxsZ8OVzzcn3EziFmxkt3V6wB/ovplKbr+7kX4+3TE38TD3TwdWdWogUoybm0UyyF1ke3SnrbndMi04Mm7HgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB3705
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

