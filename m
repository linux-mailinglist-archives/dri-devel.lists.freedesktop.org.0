Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0694B6054
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DBC10E343;
	Tue, 15 Feb 2022 01:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2128.outbound.protection.outlook.com [40.107.255.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6671510E3C6;
 Tue, 15 Feb 2022 01:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8HsjUAuDiZGrS+c5lMaeW/BUR04OhMOIiaHpwcXilk67d042aYhjL4MTFhbM8/Gu2Cnl4yGuLV3EjS0tbgN3DMepNqz5TdP8UazPNtWfWp4o8eHPREV5vVE7KmwyK4/pPOFFcORr1kML7pZQce3QbUdWmWpxzSWwcdo2AmwWgmqnQGpxyOh+XMp/gGGlDgsWkxHimTTN2ccP4nvb+QtKcJi53FnN60cdiKe45AQMPtoya13t2CIfCwtFPP84efasEY/xd6ngzeRJeBQvM8/nlmbUZM+YziQ2fVjvw6LXoL3J/0OYzJpvoKTAIGWfYsq5FyLeNkcJEmyV8T88gdwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSlH34ordkui5eg5FB2b69b904l/QW4ClOKj8NHGi60=;
 b=V3PNVDh9GnraROZp6RiPBqnDj9FFMnQUshnDib0a8KZSwlZ4aPObJd//POXWqx4WZpOBxA3U3FOcQ45CsPbKFFxJm7gdU+lCNSR6OaYwUwbj3yw7IpF/9vPEZlhvycR/2HS5B3qKhVyQNlQsjwEISP5xFkbvmRXzLk8jf41wAOqnVHsEh6214k3BfTQQhty1oAn+jeTjsJ44SsvkIHfA/pg8KSY4Wxr+Qxb/QvvhEsBsLrefWN82TIZmUCPfOWuPAZf2Ognp7VS8+g4RUQBUhL3EeGPMGZqg8dgKxhFHzJ6tJ6UGdLtNirb9ZrAU1j3rjSUbM4FVOnWsLV33EiCsDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSlH34ordkui5eg5FB2b69b904l/QW4ClOKj8NHGi60=;
 b=W+3TM2uxcaMpxt2um+Mpvzt5vPu6uK3hkzpD5sfwGd6feNFiPYJOHMckmcMQo9XMXc9memZPp9G4yBCRI7LNwSsya0FlheOscKN2NIcj85FV26ja7ck5Fc4bgMj4aYzSlnb8nuWh/2HqeY0HVYpldwCpMZN10mUy+0L1HNrL2oM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TY2PR06MB2767.apcprd06.prod.outlook.com (2603:1096:404:3b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:56:32 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:32 +0000
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
Subject: [PATCH V3 4/13] gpu: drm: radeon: use time_is_before_jiffies()
 instead of open coding it
Date: Mon, 14 Feb 2022 17:55:41 -0800
Message-Id: <1644890154-64915-5-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38200d9f-f936-4add-fa38-08d9f02663ce
X-MS-TrafficTypeDiagnostic: TY2PR06MB2767:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB27678FA9AA8B49BF44E6AB2FBD349@TY2PR06MB2767.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cg3mXU7BWZZX2gpu1DeSE9r1QeOTrZaWzbXV9fQQE3vaPQlXUz3BZdNXCkoNksIl5vTozGlD8Gj2+CmYAyyXcHBYd8DkT+7NUb8oRLO6thvDkhbgh/Zan/ZryZuskYi6YuoW2Xg6E07AtVQeDCBgWb+ww6qIvZWQBROk0933tOHA1JmERHyCVNXKNb0jDvi4Q5w4tnCVyPKRlGCgk8s0QxAjKXQiddkYA3DYJrkl6r9okpDj2hTbHzOaWy8ffqc4QzasHEg0uZLmKx38zGpStlJDuhSZmgAZ+VdJ8F+5z0yomWBck5miPzz1dRg9xwU/glpv8RyzUm+CGYvGru6JDqgGIDDuK0U2ksW6ksyZy43wGFShyqB0b763MsZSezAZCHd7Rwf/P6fw37zHvbJtoy6h+AfRG0DvrYr3NzpO4/4tbzm4qDcGCqz75/DDY91ixbS7h0ctOVe9p6V2QGfVlDtj4yx3XjpJb89RC9MOU3cbZZlmfUWSe3DLCrPJkn1hhx98B/GAZgxRQ7xJ2MfRS5X5F2xgaej7wHfIPceFe3cOH4o60C1EHA9ufsBD3mUXPrTWUEkZ2+ZooDdsp3hgHZtcdkKLftlHQIkbX8hE/ydLDomCujLgAUp2+n/aNCp0Pca0D940P4Vqf7ar5TCxzK7kVa5GFk71uHEADgNSZst1KZscU5sy/EFZxx8HFszIlVlvJ63hsLI1Q1vM0SY2ObLLjx4JmVGqtW/WyJ8aKGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(7406005)(7416002)(4744005)(110136005)(107886003)(921005)(316002)(26005)(186003)(2906002)(52116002)(5660300002)(8936002)(6506007)(2616005)(6512007)(6666004)(4326008)(508600001)(86362001)(83380400001)(36756003)(66476007)(66556008)(66946007)(6486002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Omh3Yx//sPFK4LbBNvrYl+g310Vjw96sOgDDxTpNoa0z94woUqmxXw2cXufq?=
 =?us-ascii?Q?YNW7NMqgImOnL3vjUfqr6wpZDac3CV3wLwjaPy3Bk4jpxnSHj/Ze0A8E1BUc?=
 =?us-ascii?Q?B6WaNlIFq5bgHa4HMpZyWStgPVNUk2UrbhtoQK2COJvvgyNe9TgD/TEQLAI+?=
 =?us-ascii?Q?mMMeyPGfvEn5TpW2Jc5B+/Q2IZuFhn13i4b4wkuOqipgIQF9tHwZz7j/QJ61?=
 =?us-ascii?Q?UTy1AC+bUFMCEARaW74LGLBrwRi4e+tuEMUvXapESmMJMYF52sRM4GcYD7rb?=
 =?us-ascii?Q?yfPPB0mq7/U86MVeRRGosvIDrjJtnV7hJCvBROHD3Qy8G7meUeaAH9TWj3PX?=
 =?us-ascii?Q?MB2LYhLRLS16qwCQug6wcPoun4ncnj7OBrtGUexCIBHWs39JqPBtZbR3JSbe?=
 =?us-ascii?Q?xNbgAaU0breJ0U0/5w0lkwQdSNKk/7WIECo8y77rGpbW3fdZknljz2fKPeBU?=
 =?us-ascii?Q?QufXnf9jYQ2NneVmG38FJB2dutp0oZeu8ACPSOI0PFdrBmTdVBdx+8YITHTG?=
 =?us-ascii?Q?pCdoIbhid8isjuftnY+mHO26uQL+AKj1kLZvqdDyFg5VzRApqTquQlmyZ8LT?=
 =?us-ascii?Q?TAehL2LALTzBiT2P5WpiW18Twgf2Eiw21Z4Gy9+q964mgwLWROZnF3GO2sS2?=
 =?us-ascii?Q?l+NKe24FoIJH1CGx0gRTS5SvMI+Y4PAviPHGqtKKghOdmbfXv9jTM6cAS2c6?=
 =?us-ascii?Q?t2MuiUq8F4eyF28XPcD9B0xL2/KdIwj7W0ahQrYZtI65KaMG7ZooIwqt/g8i?=
 =?us-ascii?Q?NEJJfHSlg7D5w2M3SblxHwfJLnmfVlWhHkELudfxlvYBRcqQs3d/N2lUYXQO?=
 =?us-ascii?Q?ZTZmo5FF317novBRHUNtyq4ep9b99OiFHaEA4GbpOfZQis4wCffpAtWlJiWT?=
 =?us-ascii?Q?XRgr5ILc7gdXgFMMNfA4jpbOzCtYmoecMUvm/M1TPKjSA/05W+QT6o1vHxeU?=
 =?us-ascii?Q?RFlptPShqGCHgsJx1WldLuR24YaIUKATHlDLo8F9s3ZGV8ybTzc9ndwJRWiz?=
 =?us-ascii?Q?+6ys0W8Iih//fZuWTsxkWbH6aJV7l+AZEU7iQ59f9LN5a5IPpYQ0cFWgAOzn?=
 =?us-ascii?Q?HHeOeLdoDSFMU+Qu1H6YFESId0q3UZ7KqkNPCdnUpZSNXGGw07zWZJp1jttm?=
 =?us-ascii?Q?x0UkcrFtyjbsZw/riF31hpKd0xKJfpETcOjnpVg1IQEGeAXL0ujwfdjvyhyI?=
 =?us-ascii?Q?nFt/anRfOq4/+RD2/jEzHjMny5Kmc8/SHHhsntELHDsQJ7I0Mb/+gSZzJLyo?=
 =?us-ascii?Q?9A+UwWnf3AstXAY+AQKzCapssWAXB2YKKEWLhjGvFlUA8nAI/Zz9AwKZ5onz?=
 =?us-ascii?Q?0em5NDe+992CkefbFXJgiRgENNhu4tp/yOhsuA+6mVCbQYNq3Ptp7Ze/B2Z3?=
 =?us-ascii?Q?nDzAk2zeeQ73B8FrK/UwtMOV2GsV/oFeyiexqJ9pXXuFsAc18VNRk5sULrpT?=
 =?us-ascii?Q?O47d3nZXttoggk0mmnY/di0oBJe7PYYuESPHYw6d+K8F/mB5F6hlBVp4/BnV?=
 =?us-ascii?Q?0yicqMVQ7S3Cq4F1fEdvDrmJ2EJqJ3Jco8qszuSJsuw92mJY9Y9m7unOtP3S?=
 =?us-ascii?Q?XaTVf2jge8xu0I3IA2luGsyvOEBuDnx1q823S3Ar2TdxFtrsOZ5vraCBI5xE?=
 =?us-ascii?Q?wva1BjD8btIX4jqpW32gXnY=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38200d9f-f936-4add-fa38-08d9f02663ce
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:32.5443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIn5iwj1EgCSFXWVwDmfDj2iBmBLasb9+7fAuSjo2wPX/x7UYTBLiuJ5wl+rG5+uSU+IidQrC2kqnHPKNtXtwA==
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
 drivers/gpu/drm/radeon/radeon_pm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index c67b6dd..53d536a
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -25,6 +25,7 @@
 #include <linux/hwmon.h>
 #include <linux/pci.h>
 #include <linux/power_supply.h>
+#include <linux/jiffies.h>
 
 #include <drm/drm_vblank.h>
 
@@ -1899,7 +1900,7 @@ static void radeon_dynpm_idle_work_handler(struct work_struct *work)
 		 * to false since we want to wait for vbl to avoid flicker.
 		 */
 		if (rdev->pm.dynpm_planned_action != DYNPM_ACTION_NONE &&
-		    jiffies > rdev->pm.dynpm_action_timeout) {
+		    time_is_before_jiffies(rdev->pm.dynpm_action_timeout)) {
 			radeon_pm_get_dynpm_state(rdev);
 			radeon_pm_set_clocks(rdev);
 		}
-- 
2.7.4

