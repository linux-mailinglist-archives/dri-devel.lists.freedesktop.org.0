Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AF4B606A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D6710E3C6;
	Tue, 15 Feb 2022 01:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2117.outbound.protection.outlook.com [40.107.255.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C3B10E3C5;
 Tue, 15 Feb 2022 01:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knZyCcYAGtawopZ82sMpDMmMuw8/GbquUhS1Hq+t915/MYnbkOHTAsr12hRpPHPzaFHsZQNn2IJx75mgZKSpGfPcYKJ7PzUdx07cRPbENYrSWr2F7k3+KeR8ucEft9LbTMzsdG2m19LKc+EUkK/2sO8J4LHwoqU7/m2pUP86B4TUTnq3nT5hnU7yN05MNJ4/ZqroFhwZ14n0oxtRLq71m+7WiI9YRxFmp5V2+esxZmrYxCdHGyqMm7s2lbHpu/IJ8orQZdJu8X4CAminScgWObbAD4EmWbHGlRLsV0/N03DExGjRHF031zgwXXUCZnnG16FLxGqUDnyOxao7Md84kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBp6QqgcxBqUyzlzcSCesk/OaHoOl/yHBure7Y2N9iU=;
 b=lw6oTQEaTxMaX/n24R19QNnFReSWLzNilpJdYOldEDpFjJOcoQb7LVjI2LzkjfaeJtCcYydfZHuDQHT34dGBvnKG6iQU5wU0wKvhly3Nv6fTRjts6RwyHHWDVFK3CVCwvEGHuATI6QfLlevR3e+J7R0N13dyUxkUHBZQwpghMLq19/YGfniIBmrtjN6+FhdZQpKL/LxzB4R8YjXecnwXnmBul1sYEVjMbRgJsm1QKgmMlDf/co/wyHh+uRXt39ua2BfN+7rvuiGkjw8TD9S2WnqFaBgxZDrl/mz7KZDS810Rmtx76Ew3CS9AHlwGrQfwSKWeHNX85wFtH4VUmYH4tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBp6QqgcxBqUyzlzcSCesk/OaHoOl/yHBure7Y2N9iU=;
 b=SaQynrlL3YPQnz22upp514fER/TyXj7Bho8VRGxYrvkwbrHKoZQpeq4Vng77oeI3yMpY8KYHMinDxLEDVx4fcj5HEf8LhmlNu2K5ZKwtAHDUvxMUgXUIRQTI/bQTQYT1qX/OKsmaWXOyjyHiVUTdtIISVk0LTzxI/75b9lsPqzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by HK0PR06MB2771.apcprd06.prod.outlook.com (2603:1096:203:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:56:46 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:46 +0000
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
Subject: [PATCH V3 7/13] md: use time_is_before_jiffies(() instead of open
 coding it
Date: Mon, 14 Feb 2022 17:55:44 -0800
Message-Id: <1644890154-64915-8-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d1b7eae-3c35-4b24-eef9-08d9f0266c1f
X-MS-TrafficTypeDiagnostic: HK0PR06MB2771:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB27714B8A27E9EFD13292E88DBD349@HK0PR06MB2771.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9umtK72So+HOJMJynAoNcqIKtzt8h6WC+lj/eowtVzatDO2oyReLR1Hix0xDIsU1sFqF08DqIOfCCqfX6TYO4B3mpvaup1hC46JJFx7mM21PlNybWqUqYku9K2XyJmoQjd2+PaInkHvTl5BJUjCLTf77VbgxqiPdzsfnrpyN4+pUnROQ3V/DR1va09Qz5Udej5Ct63iAYR366Y6MMHb2wU9wKxwJaWfPiwQ4eDfWYA/Py64voQLBmWR7TxKvinU+SBH5oU3qfU3ergN1fyyBzwHGEIp3Zhd2PyS+7hT+HF0zDr66ZHtCy7Klv1phAXTXN5DuNWStGnQltaYmRdZ84SXzz5vvXEj99opE/TUT9jAMRIUnE6Md9FuirbNy3KeL8ka5j6w33zm7BoXy3GwVrZFH4Nztx8Ij+WqNx5GsSt23DRol9ZOqORxF9Lz3gNgPBS2YDgNByZPluY6PNruGWIdsn3xR+jNGKC6z7ejBJ2qrGa80YEow7mhl/fk2zCoop7k5H04SCo6VJuHeA+0N/lOTzyukEgzbpm7fsiXDXd4Mu1ov/oet7kRltQbK3J4OFOa+xGDQJcXa5JKOByCMO7NvwGOXCRQZNfFYcgVpndi1WXBsiBFoe27CW1IQNY0P4yLb8F+HIT4xcJHIpaNus30HBx6JlUZuUgZOd6s1CJil7+rizoC0dY5iJ+n3L8P1rwbiPDncS9Hwf6HVNWVM80aceDzpruN06ZP3YjSfl58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(83380400001)(26005)(186003)(6486002)(508600001)(107886003)(5660300002)(4744005)(2906002)(7416002)(7406005)(921005)(110136005)(316002)(66476007)(8676002)(36756003)(66946007)(4326008)(66556008)(6506007)(6512007)(52116002)(86362001)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qr7w/D3OwuPzFuWkRZasFmrqocTl0pOHW++Bqrc3lcdxzjB/q5XVEUCRe37w?=
 =?us-ascii?Q?QNTIS3R0DZxIHiV7QJYqRq/olod9AdUGZqlbJDMEQPXgTMevhNZgsfhLGtH5?=
 =?us-ascii?Q?5UX6Rtsi9GYDecsPwJ/Eq1x47R+NF9mGL5Do1u5hxR+lBofLxh18b6lGX/2k?=
 =?us-ascii?Q?9YpRWMsTRBO0ynv+np15xuEQDx9Eym4+wpeWXaSASsEkR83/JgZsuvBrHcpW?=
 =?us-ascii?Q?Z6BH2D9kbP2c0qYB+thkeW5lIEkpGngkDvGwFvdkqXHivG/yJ+B2KwKy9PEh?=
 =?us-ascii?Q?se9nYvuiwfyMbzWMehmXw8AO88Hw4/9HIu2VXPH+QTPkIwa5zd8HCCAVJISd?=
 =?us-ascii?Q?5AIf6rzDhTEEs8aoaCA14d3av9OU8NKf+LQiYch7a6woHKswUxirMKaS34lf?=
 =?us-ascii?Q?bmEDlzeaWgxcQjQB0CMgKLmbo29rgQGgm9WE4QN+XynqS/Z969xr7N7cUQZt?=
 =?us-ascii?Q?MMcJayibm1zG2M/5DOqAImRri1aftADciPBPd38xdMI7Hfku5Cvnp91sGgtk?=
 =?us-ascii?Q?odHzdjh1Gjt6ZZiLe9G7Z746TAK2BR0wQnrH3m98yADwQzSP/p7oELzgQoEr?=
 =?us-ascii?Q?8mOX+J6TmZd++8iwRltk+BMYLU2tWqix7L5UL7WgR0PCzNf+FjpRdBWNsRmt?=
 =?us-ascii?Q?C31TM3KTZGVh3tRxYEd8lzKaqLZJLDGUeDV12Ft7bbYjsEvziaZBhFT4unsd?=
 =?us-ascii?Q?Qw4C4jPFWhZ5w2CJDVZsLVy84/DYgZFwpF8+qt1ie2LRSaHdexsbzB98Qx9m?=
 =?us-ascii?Q?QGuaPf+kLWyB0MUOjW5LiljKqo0+hRGHju+MDINcJ4rVefJq8XnV6kEh5wn7?=
 =?us-ascii?Q?RW4Pm7tYery9HWxsevbGRh4OxnnL9NoGKl/f95nxJGoWehOHoB9RTNjmBH12?=
 =?us-ascii?Q?IQyR9OzTTCHZPqaZbR0Er7aOj532vq4JfzPp1jfkYLYI9briowSGCuV5j+el?=
 =?us-ascii?Q?FBwkxfa3suvijWLh0QUv9R/fQKQWrkgoixd1TMTRyk+jq4W9i64iDprtKbWa?=
 =?us-ascii?Q?UGZ/9XIfuLj7c5DDylnQ93wr0+FPUDgn08Dk83cwX1J9vfHj3ncxVxX1jMI0?=
 =?us-ascii?Q?FNcc/MCoGaAlMRcKkRUahXVj0MjB92/RwUR9wLaU+VaznKomzy6ZQk/AwdFz?=
 =?us-ascii?Q?aCGndkgjgvUlWohre4GDNAPDg+F5tOoYqtOMjaSALxhrXQ0HWloTfIFl8vRL?=
 =?us-ascii?Q?cid3sQWtxr9GNtbaIeLa/NX+o+jYO6VuKLtbYvz+TgUvIRoFPiFzz7xgXWsL?=
 =?us-ascii?Q?bFhdk7V9yhXCZayLZ3PoPYK/srI+WHEC5x0RVEWfHF4cuvARhnxxm0TZiAoF?=
 =?us-ascii?Q?Ej1180RLRoZb7LiEg0dKOFyJqrgBTv05ApySLW9FiUFB6Fva98r7+qPhBZNA?=
 =?us-ascii?Q?2gpgQvtbo6chMBrNPSsjeyQ2nuzhlU+MeBi3ysnv7ptrcH1VXkWE0jGdLCV4?=
 =?us-ascii?Q?fyupduk9WGDZU4cN/hfitMbDRYeYs8fbSUojPgCwLd2SjlzpC4VdibE1Az9u?=
 =?us-ascii?Q?tiVhd3n4aZtddVZYLr/0Sjc4hrTNcvAimoc+hmrwoYVlKi1F8pdUllIJo5KF?=
 =?us-ascii?Q?5dHWkfSMacLeAxl5nhEOurkudAMyOUD6A7pKp9VERvIsXv6sMloX+sx5mHuu?=
 =?us-ascii?Q?7ZDVQNaDA48h3I/V+WoZY3A=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1b7eae-3c35-4b24-eef9-08d9f0266c1f
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:46.5435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CuQkkncIquAWowsVFvIAcUne9uogjwEjTI2rzMIdX/1OvIIRW1Yo0U53H2jqSYhEesX6mA/XB5q98w+hWzCkuQ==
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

