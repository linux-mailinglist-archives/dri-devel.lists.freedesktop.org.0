Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022924B1C39
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBEF10E9BF;
	Fri, 11 Feb 2022 02:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2123.outbound.protection.outlook.com [40.107.255.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1370010E9BF;
 Fri, 11 Feb 2022 02:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npH1iPy/cK2EfovjDDJ0g29/nvaBE85BtC0SCeJi8J5FXnq1JoPf3PNTYZLFlsfZyI4fw9w9+8IaUCg0QaGXRvDKRzfylathGXdfBJv8apiCyrU7Cru9sXOqq11hXbhNJXaUSBchllWj2ZX4WAXkVXC1DPtdGjIxKIuqTGL1ApaoG/4orO4TAgzlxYmMMsHgjKxOGlDKeFAhg30ESkSkM6xZYv7NwZUZqn7sFhVvhltmGwjOY99V+yIJaASXFJ8zzdpNgq8XBFHmWCl8at/EpTFdJAlA/6XuGhyCUL2Xe7+1f3VghJ0uxxoD9qw1hzwrl1K095OLWU3tUshRY6m9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYuRSWgY6HaeljgNbxaZaf003O9SNKziTfmoexXwmbA=;
 b=Ff/TaPCh2f00LsjtWP+09mBSTE0lytvDFZ3xbkS4jw+/a5T3odWlRplg3MUYR5thE/TuBAOi29OWXNPdvEFfhhAxm5GjVBYCw+E00LFfpNrHK+QpZ56c2liJJ349UpZNQZ1saGtI7uB8GpZ/koSlMrOh4FXOglVIRfkxMXXaxiWIzF0bBtXGkv4CY6e/J+4T7GbpJGQHMblgAnW9aItBuwk5QMqEvmc/EDATSyaCNXO2E9e0rjDqba+fZJpeuWv0IcxHKnzWBywITvYK0Cfcn0GvZwZgml9a2e9M9ahEC9PAvNMPdp+Zncb+AI9kWnA0wLdmPUOpl6zNQVipOEM6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYuRSWgY6HaeljgNbxaZaf003O9SNKziTfmoexXwmbA=;
 b=DahaCz8LcBl4s4N93+t6hpH9V0D76QtWgLDSv/Ttcuazd59HNa8GR4q9vUL78daNMYKu3C9NuRFOCOANhI9z9aGVHZjLH+FxTNt8gvf7YM8+wsEiP/4KT9ZK6Dtn9VlMWYOWEZd1xJEHTtwkYou9gsfNcZsP0LmmireP0VMWUZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PU1PR06MB2326.apcprd06.prod.outlook.com (2603:1096:803:39::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 02:31:12 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:31:12 +0000
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
Subject: [PATCH V2 1/13] block: xen: use time_is_before_eq_jiffies() instead
 of jiffies judgment
Date: Thu, 10 Feb 2022 18:30:24 -0800
Message-Id: <1644546640-23283-2-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4453172d-1062-40a4-51ed-08d9ed0691c8
X-MS-TrafficTypeDiagnostic: PU1PR06MB2326:EE_
X-Microsoft-Antispam-PRVS: <PU1PR06MB2326541D928E240EFB1B6D23BD309@PU1PR06MB2326.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eP6YOw4R3jawIEQSMCI45OGmHyly8vyYqkhdazwPrzt/6mtGuIm71LmjFaxy3UVdqYDII6o/y/paR4ORUrg8wMyGV160gfTUQz9n5XwUATSstX5nu22RuE2sZxAZB23/YiAyCv1OX+HuegZUDD5lOEVEc6CekrE4Mal29dnB95X5fbrQGJzYk+XIKdNtt96nwEhHDxQjy4pj7d3pE5VaX9eMSCBhCBEC9iCFkRuzLfGtk9gZnwXMRJlKor3LLtrfA7CBwianCeTo+bpELFXyvu9LJCw03dF7F50eEcA3DuXkoWw9dTLPwjG7mJqa+r9u5D9eBQZBUce22QKwLgyhPcuGXa2kshtC5V81ojRl8eyt0yUNosYZ42KOeUp6toEG3uLD+4nhVSuloqdJKU1VCcpABn0f+LE8zMftaja2FIfzdD27fEwVQxdpD24upmy6rqVLvEi1/2cnacV7YSVU3Igmo40bsXSHClkLZTCPsdZ962221FDY+1pc9yTSlYoahyWqjc/mm81tDPEWnMhlXTZ2KNVr/4IjVUkk4ij26KtXBJmtGzwp4zB4wl2rxr/xyLgmDzs2mW/16icoCVHomtTT7manT7c5fGBM35UA3KKs6k/BugqXbMBiBWWGdWFybPoeG3iZNsOqhVoWWxweotu2czABYRfNcH9FwTUX/zuSKqjfnbW7lQXTJZET+ole3DBOvRqdwg90WVQaBtLlGExMPrX6cUf7lH669g2bGWAQP1QdDWoZoiSLsJ379vAG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(316002)(508600001)(110136005)(2616005)(52116002)(86362001)(6506007)(6666004)(6512007)(186003)(26005)(2906002)(36756003)(66476007)(66556008)(66946007)(921005)(8936002)(7416002)(5660300002)(7406005)(4326008)(83380400001)(38350700002)(38100700002)(8676002)(107886003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MPOxFWmB5E2Pt/1C2XrNteRXkmz8Srv8O1WeQjdRIJU6rqpIOUQ5pVdAGRBz?=
 =?us-ascii?Q?ikiVLOKIG/bsksxsxLXa93yDiSqxXJ2QAMm2lSXohTG0XKgY/DT/HRrbdMgo?=
 =?us-ascii?Q?3eW5tUsoS9yKaWiHtelJ11se6jPYZyL4GXtGZ/ugyMCK1H6QXVu2q0n2VqSO?=
 =?us-ascii?Q?mOZudoKGdD8HPLpn+yYFL9B0KRLO9T1629z1rr1KDv7WgxJ6KwKZwzwjOwON?=
 =?us-ascii?Q?hz7QhC9lX8MBPJT+NuaMNgfnykBSYwV8efbX/Bq35XKgjEF1NVac34OxTqiX?=
 =?us-ascii?Q?Et2rMv4di+3kp4C7gIfqwRyqUNPWmQY/F2Qf+GG0d9b+4nLSI3F5YDGaxm38?=
 =?us-ascii?Q?SoZ9PQPJVtzh4lfpYCmtW4asY08kGCWIfiycxT84k09lt66SDqSkN3qFXLDo?=
 =?us-ascii?Q?OLlE5VAMR/cUTOiaIBxkyDiB04apQLL2J+bs6nSHqSs3E+hE8/hnt6oQy9GF?=
 =?us-ascii?Q?vrq2/c8fCDGdiqhQ8tODcW7iAdemra8ZS8E8p30MBjxIgVyr69Yx3pXWnZ7e?=
 =?us-ascii?Q?fDBd/whApX0RA2ofv7R6KVppKQgAImbyWTvoxOmKWDJzp1faafR1ZSyg+FQV?=
 =?us-ascii?Q?aI14/F/RcFzsXxwReGbuabevcgnUx7A7870drwtY0Qowhe3N1+6nXXW4PJOI?=
 =?us-ascii?Q?3iV4TXCAxYKQMy8ypCBgG/8iIsrrsc4qmyUOwo/fVu7dWfEcZ5DwizXeUPbg?=
 =?us-ascii?Q?hpBgQhVBphZVFQP28m5PyvpOpMuYXHs4XSfHi/t+iOQGs/7TdHpP8HYqHZc9?=
 =?us-ascii?Q?kiXAni7iCPY1MLg10Ha4GiSPKGdXL2p7ZOaX6l80MS1XPfOgYK4ApWhaWeZi?=
 =?us-ascii?Q?GJQ4GVKoB4uqy6J1VWsms/N3WIkvggzBvltoJbr+Xebdd70O3qtnsPlv9ENg?=
 =?us-ascii?Q?2/yQmwATPR/bh0wZsQAU11hDUXMgp5LRSoywVb/BDS8nia7h8QO3eYdsSbjW?=
 =?us-ascii?Q?JbBYtM8noZ1Q5XN1v9RnqTrwpAFnU2XAUijG9nx/8azvOmvwa2BtPXSK7Q1/?=
 =?us-ascii?Q?ZKuZHK6JcKwyiniw2OJEui2JJY0Wu4zPKIiqAiKMIQC3moJ4Ok1Xr4jjWRG3?=
 =?us-ascii?Q?G7EXbtrYmuGeGEzqwuGJ6Nej6cVYhZ8dvWsZOXE868HGx8RsYhoWqrbJ+1zy?=
 =?us-ascii?Q?qLz196fvBbkdQVFRWhndvp0Kg1VSNyw4gVhiu4yxQpSitvzq52E/s/KMwVCu?=
 =?us-ascii?Q?NOKVo79n30LFTdpH2eJ805D0pTTozL0F9+Rt4+//vJ44EYaYM1zZ+nQ2e30H?=
 =?us-ascii?Q?a86+v45oyfeLMHTk7eSjCo/tqN8/8QgzuA4j+xs6n6M7174uNYKy5WsyX3P0?=
 =?us-ascii?Q?FpzTXFrtjB4U6n7igbXkB9xRWwUHrAq81srR2wg2cijXRnOvILrhmauYP5Y8?=
 =?us-ascii?Q?qG9jdZlfh2SnIjEt7MJMugDhvCYFQNG+lHWY7a3RgCI3MOvEb4NVujgMkG1U?=
 =?us-ascii?Q?jCLwOGiDKQqodG5FlLPNgrh5De+m5iJ28Qmzop2+kX5ID2mg7VNVs8sBvz22?=
 =?us-ascii?Q?9JrioWKIYj6I3fLCdLGvXugW6XB8fYTeviA+/f3V30Gu+/IsVQP83eIvKFHY?=
 =?us-ascii?Q?M5YoGHYg60uf5f8oGOUHibrx427WqgVH/KWJehbpv/NF2OxBzaHu2DUpQ8Cu?=
 =?us-ascii?Q?Trvr9xfXwhLiC3Xf0CZXHIM=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4453172d-1062-40a4-51ed-08d9ed0691c8
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:31:12.3078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/uacg7VVuyGzwc6yT/Jpc+2vpb5IQkWzzzmvRWJ3i/mySH8q4yB1L+ZwI8D+kW90tZHy4eG/bm1/t4R1NkkIA==
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

It is better to use time_xxx() directly instead of jiffies judgment
for understanding.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/block/xen-blkback/blkback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index d1e2646..aecc1f4
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -42,6 +42,7 @@
 #include <linux/delay.h>
 #include <linux/freezer.h>
 #include <linux/bitmap.h>
+#include <linux/jiffies.h>
 
 #include <xen/events.h>
 #include <xen/page.h>
@@ -134,8 +135,8 @@ module_param(log_stats, int, 0644);
 
 static inline bool persistent_gnt_timeout(struct persistent_gnt *persistent_gnt)
 {
-	return pgrant_timeout && (jiffies - persistent_gnt->last_used >=
-			HZ * pgrant_timeout);
+	return pgrant_timeout && time_is_before_eq_jiffies(
+			persistent_gnt->last_used + HZ * pgrant_timeout);
 }
 
 #define vaddr(page) ((unsigned long)pfn_to_kaddr(page_to_pfn(page)))
-- 
2.7.4

