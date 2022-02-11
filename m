Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837864B1C65
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 03:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C2810E9C8;
	Fri, 11 Feb 2022 02:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2137.outbound.protection.outlook.com [40.107.255.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4E710E9C6;
 Fri, 11 Feb 2022 02:32:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIfy3zPFMEbsGtSoSPPqbkeOZ/dLOYRhHpUAR5suGf0g13wWkXMBPST8Fhr6n/7cQw5DqX2AdL7hqO2geNXWARmpnRgvAaRXQ/b9VHLTMT8tFEIbPQnJ+qjBY0dhfBHqH/WEA3Jujet6Vqxhxo4ASGgUua+3W2YMZgdME8yLHeHNXszr8EkJZCsegRjL4m4Rrf2hzfQJXoKAzUn2Nziou+RKBQTUIjeWmLStwmtLIoriEyWVYLjFFz+JtfaJE6Yb1fvTU3haZeC0UzG/kJdWGiXtFbCnLk34hPB/ZaevsLKWne/VXoBsxKEaF19bgjwJNc1QD8CB/XAu1TEuuXdT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJmrL/wszRwZlM8YVbrQxGpNSgXK6M6vSTblQPIFMZk=;
 b=fZLtPnmelz9hHT+SBLwremtvuxlBf/i97duKgdlLicJMapgsGYxkM7ekYio7Pqs2xqalvaWb4a4PPyY6ePuE46T+6ECgZEg7AQPNZeiW410j8/dtomsvKjD3vfQIBxHdIFYI6CvJ0HDNZHApXCu+E8yxgvBJg4q5sNHXPw8HaXSTcCff7VQA/oPNpMgyeU0YW9nTl9KFgXwKNJOKiQU98yjlcsPcKdnafBe/Q+9lGFt45RQVyvI7yLjBrl3xGWLMxNeFahRxuyFQDtpEzF4Z/lTa4P0ARmevDbfyt9Wn2JwOJ0Ncn93UcBRzHU2abDTvZSvgJCmVDFnPL8kOP+Y64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJmrL/wszRwZlM8YVbrQxGpNSgXK6M6vSTblQPIFMZk=;
 b=LDllR3IILBHFO0J/aZBfYXz5fNvlV220gcDU3SWKf+HU7oHuWzU/dB0FR2LJfl/dYcSy8cqB31wWUe2Mb6FEIUq7uzbzVVCpg+g3myBOJgzqZwDq2/jtLrEXi7JxOgHSh2NqwPFlxkIDBzHxIi0wn+xWvRizEAh0w+V3IgMIFtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by TY2PR06MB2895.apcprd06.prod.outlook.com (2603:1096:404:31::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 02:32:05 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 02:32:05 +0000
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
Subject: [PATCH V2 6/13] input: serio: use time_is_before_jiffies() instead of
 jiffies judgment
Date: Thu, 10 Feb 2022 18:30:29 -0800
Message-Id: <1644546640-23283-7-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
References: <1644546640-23283-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0178.apcprd02.prod.outlook.com
 (2603:1096:201:21::14) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d708849d-f73a-4f4d-cc35-08d9ed06b144
X-MS-TrafficTypeDiagnostic: TY2PR06MB2895:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB289554482BFAB287A31191B5BD309@TY2PR06MB2895.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Knvn+ZoyuwtwWjb9mcX7NX4jSd5sdfPjHKvVg0RXnl4B0HLfdv7nMLFc7oEB4uoAC7nhPliMSDWanEG6pMpbUMVchrTfRPtCpo+Y9i2hsRrc25VPJsQIlYgbOHynMgwohX+gOCxM98x/hcUkKTKy6Ryyhot4nSM/0df5459+EPX+x8NZu34ETQArWLJOO3DJoFyzdyDDJijXFnKF8StSK8SDk/KX6pxA24EhE4BsT7pE8nNubWPzCoKTJZ7vOov0foDGTTu6krh/sLcMo6L6nZ6nydKlrooia830KyO7n+KfO43/q8wgsu0A+JODt2HzqOlnx941h+brnfgGknRGrExAUXDCl8qIKFU0jeXg2oIM3raNNQXDgmZPJOmeMV9EhhTFBr5mgg1YOlGcDkX2Rx3CZfKwql7KkyvR7akXzIHPo3pC+7d2N4rU1kFHPBOq+rv1FrY2/QtW3a0t65ZNCOQDeECkSq5ewxwXJiYpN0ZKgFH1KLjT7ocJcx1ye2Mjkzh1io96S0XXVoxVwnFgltmxzN3tbxnfFLn3kP0Jnh9Sv4sKlzKr13KfQgEjlD66Y8FsDfp3Xp3FqQnn+hJ4WkYB0fL0fxaXSwDlsdL/R1zm5erAtH3JjL2OMueHjzOjBFj1hDM2oTVUQ3HXfriBYbSf4BBfNyfwfOv7LhlhMppZxHs0XurFN1SuOtP7wCSnfPcNMxU25l/4naC+SDZhkRhEnwSvc6XBS+HkJgo+XK7hZZGCTdgfdd8zaO/cYRS9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(2906002)(316002)(110136005)(86362001)(6486002)(38350700002)(6506007)(6666004)(26005)(186003)(2616005)(6512007)(5660300002)(8676002)(7406005)(508600001)(36756003)(4326008)(8936002)(83380400001)(107886003)(921005)(52116002)(66556008)(66476007)(7416002)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j1JTYbUZFwE57rs9P/bZPsIXhEWUhUwZYslxJXmoBcB0DzYfbRs71yby+bz/?=
 =?us-ascii?Q?vz75e/QAd9pa2P700yMpBDdgLxzW6+5gs4C2NReUwTJLVy/jkasgGvEJEAMo?=
 =?us-ascii?Q?ANyh3VAVxDLRWeKzNgfmUh59OQ0gG7J78o38VzqvB2TASGOVv9JmA04H3jiz?=
 =?us-ascii?Q?VATIIQjKFAWUEX2zZraRVTaLYF/Kn/KwzMw+jry1qtD4Pk3NcNq3a9h8UVqa?=
 =?us-ascii?Q?zDvMEWaV6dI+Ps0UjvurBJ0po1LIa12Dn1BruvzU4WmY8X/Q2Sur9NeUloSc?=
 =?us-ascii?Q?8ccM0l5hQfo0YztFRCut2eaB6mWaG1NKEJ3KjWSsLKJU1ksTHAptEVL+jpRp?=
 =?us-ascii?Q?Qj7+D6zg0cYdt8RfQzBKDr/sxGlyKyCaHs1vK6+Z70aP5NdTA0vFxnluiB8C?=
 =?us-ascii?Q?p3N6bDN7BqbEpAAAMj+WVfPHTtIByNjhVb+oDGgc/O4OLFVaYNrrrVHz5Zi3?=
 =?us-ascii?Q?tt5ZMkj7zIUURoHN7vpQHb3Y99X2LhgNrHZ8kbkuhPnXNZAU0Ysfw/jsRKos?=
 =?us-ascii?Q?MzLH/vn9iS3+9Jk5h0q75TeX8s/kGubhwUfMgV/S2lLcpf0UpUsYHxxtYzon?=
 =?us-ascii?Q?K0oCVegi+YetZ4v7+g+GSVsGmb+KPqjx4Mr695Kr/ltQ8+JgB8Ia+dmkVLpm?=
 =?us-ascii?Q?dq1udpl1z/U8BjmWMAcnjNrypYQrJkBH0UESuwbjcCN/nGRl+164MP1mXYSC?=
 =?us-ascii?Q?fsVevoaKz+vMKE14aCjXvtA03yJ/PZTteqsLnw66sOptNlHnVKIL9l0Fdcj+?=
 =?us-ascii?Q?jDebUhmOIBpfoOIcioevcPPSiH9jWL1swvSekt6owINn4xveOlxIl0GOQ3j3?=
 =?us-ascii?Q?Yo71yZzslNQDV5uF5+Ur/j7819SU+IkaojzQ1dJJ1+bO7f2XBNBmRiFtCytM?=
 =?us-ascii?Q?viKz23TLEqe5WYTk+T5zePcV84QL1bJ2C+xqdrSkr8Yf6OoaeZBupFAwVm4x?=
 =?us-ascii?Q?cTVHHVYUMWx2PPwExu9WPAKIM7Uh190sthnfabctRky2InIzIZAhV4Mku/Kh?=
 =?us-ascii?Q?SzHGHOKpVYOThcYCUVE8Hmk0yhWYjAf4LcHs9rDTRBw7GqMQh0dP3IL9OLY7?=
 =?us-ascii?Q?BQ6HfAy+tZk9yltgjheKpwqhga1YZWgZQPYAlpDINa27srj1yAPpMJDC8MYd?=
 =?us-ascii?Q?Uo8qF+DflfHJJQHU/+hRlXiymTJBgXWKu12JEX7xCeknq1Hm2kyhmScKRHlU?=
 =?us-ascii?Q?1vQpaDbZgMU04tH6zjPWq4ENhOO27Qv/3PHBcZXW7HhJQ7IlfO7QKTINUY8e?=
 =?us-ascii?Q?dr/J825MBIGDIxE1ZIW2/lJoP+5aYqcAj4Mn9uwCazYon5CmGekCEjPpKYzI?=
 =?us-ascii?Q?/4U+1h5LnacScpbVRhSDZOhzC/nvAredJ67lub0o0a36TEg5zvNi9tugM5q0?=
 =?us-ascii?Q?F30Zr1Xo/YHair/UowF6j/fWerUeIUQhadUX7HZz3tJuCFj3rjerGRWG6qPW?=
 =?us-ascii?Q?q2OOJcB7iltVZ9HQI5GAo4/MsgPPdvQXOtXIVeT2fLFQeQwtp9m5ixLahLkT?=
 =?us-ascii?Q?IevJsLNjsAxF07GN1agDblRVNjIofefahuoICwB6CS/Vxns6d/Yqw/ibLnrt?=
 =?us-ascii?Q?Ve0p0IZq4Hz8+TRwiysYCTaru+5OfIlnMukaKBQz5hUy12PLehFXl8E6uVFv?=
 =?us-ascii?Q?uTbGOTOaM/sLAUWkpuhcXA0=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d708849d-f73a-4f4d-cc35-08d9ed06b144
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 02:32:05.1954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKip6f9iqiS3IpgYMeOPaufHSDL7O8bFVrZCqIKCGXNHOnl1Y+SvZVBj97LT3qYik6/RGDYwW2+DwZ8sR60wNw==
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
 drivers/input/serio/ps2-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index 8970b49..7834296
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -136,7 +136,7 @@ static irqreturn_t ps2_gpio_irq_rx(struct ps2_gpio_data *drvdata)
 	if (old_jiffies == 0)
 		old_jiffies = jiffies;
 
-	if ((jiffies - old_jiffies) > usecs_to_jiffies(100)) {
+	if (time_is_before_jiffies(old_jiffies + usecs_to_jiffies(100))) {
 		dev_err(drvdata->dev,
 			"RX: timeout, probably we missed an interrupt\n");
 		goto err;
@@ -237,7 +237,7 @@ static irqreturn_t ps2_gpio_irq_tx(struct ps2_gpio_data *drvdata)
 	if (old_jiffies == 0)
 		old_jiffies = jiffies;
 
-	if ((jiffies - old_jiffies) > usecs_to_jiffies(100)) {
+	if (time_is_before_jiffies(old_jiffies + usecs_to_jiffies(100))) {
 		dev_err(drvdata->dev,
 			"TX: timeout, probably we missed an interrupt\n");
 		goto err;
-- 
2.7.4

