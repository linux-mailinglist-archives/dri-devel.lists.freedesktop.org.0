Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE14B6067
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 02:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E040510E3C5;
	Tue, 15 Feb 2022 01:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2117.outbound.protection.outlook.com [40.107.255.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B2010E3C5;
 Tue, 15 Feb 2022 01:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxA1FYlZRTfHHcOF7CgxsgWWUo1k8b5FiN30TeKrsLsOWhIlaqO3Ti/dkmbLoLB7bAiPE0W9UZxVhAl+Jnsj2hd3n+thtMBCJqJyj+LPhr3FpAaasrfUsf6iIpUmBSM8sb3uIclxxUSRNlq4B9Z5VPYqHLN4kqXGhASZCCkxj7XjL1scOV3ii2McT6CxrllRndvOy9ZDBepS6vI7TktQcU9fITKSat57t7g5vRZbgVANrKUqA8L8yIKnqflRohi6LX2EY34zaazvfyaUgRR8Se+ys7ScRkiRr6heE99RBNAXf35IKJZgNYHaaSOpUK4/RFzWg9Ff3tF56oZ2cvWLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gil4quij7qcTMvszTKjOs9aSAoYCJFZ2VUFmpkKPVQo=;
 b=LzmwAhHbFyr919Yuyc8qKzovA+u8YdMFxf62k6o651Ig/sGH7L3oOQa/oqGV7u4SynMzlO3C1dpbueBVB9JeKmBx1Ms/ye3AXyxuouVHM7BwlqBJ5SXGmoMbOjyWhVniomFaGHXjpHksIDReizbjmygyR7KJozAdJZYrEhIjTIrRGDG052P/A/zNt/eG393kLOqBXZESFhULOh+L8OSB4mFW+EE36JeKd2nZsFB9hH4ddTmuVyqHR3rrbmpzHyZWGmd8Gd9y9OEicDCIFegTHFMwJHbud0q3rf0qyW/8blspcr6nlNlXWYUR/u3u/vbIHQH5ZZ5sV9uW63/VENNaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gil4quij7qcTMvszTKjOs9aSAoYCJFZ2VUFmpkKPVQo=;
 b=n+wiVQk3Zy+KKpr19yc14kwIla5guhnQIjDr0SK8pmXIapT7m89WTmxGqeZb/OcOTiQbiF6i/R/rwRQ5oSQWWuSEwupVS5XZIKUaUzGSQlRcgoW/T89tsLSuXTPp0jUG4JAi5fd8x9dx9iZOtnx4nlXGDswtqKVTJk9jnV8M/nY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by HK0PR06MB2771.apcprd06.prod.outlook.com (2603:1096:203:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 01:56:41 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::80b4:e787:47a9:41bb%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 01:56:41 +0000
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
Subject: [PATCH V3 6/13] input: serio: use time_is_before_jiffies() instead of
 open coding it
Date: Mon, 14 Feb 2022 17:55:43 -0800
Message-Id: <1644890154-64915-7-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 223ce6e0-9445-4c31-3457-08d9f02668ee
X-MS-TrafficTypeDiagnostic: HK0PR06MB2771:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB2771C3D0F113D3DA4472A8D3BD349@HK0PR06MB2771.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cDMxHup5yWOHw8mFcFUIaQfoxyQKud4jrkTMFg0CUJIXPvP58tsdTdGcIPk6yl2u0h3zsSGhDm59qTDw1/o+vkc5hLhThbG+y8cUIRSBF4zBFbj4JTj4r0Ryq8RTF6prBUlIBAsXDYTtcK5jq0oUUaPm1SJi8uVupnocTn33UXOvKQOcNF4kH31q1XkG2vl1qev+hzrXLR9VxrJ1KVh1rd4e53A/iuAR23UZU7V9qPI9XFaJ+8I/3Zeg7wG4S7HaBtJXjiIdoRnVbIMoMy51/WiMdEaMEmY7uD4/uza6Ea0bgj+01tm3mOEScGl8Qj4nEi2euZtMfeVr68/6pgY74Wngu4Vm4y/QrNGWYHZ8P8ZXklpGJF0hEYlZCdOObcyOGKGduZczot8wEs7b7100+D6I3eqzSwex303n/63KCjeGBo8d8PCPORcic8FZwyzuqi99yT2n1xmIhqxpsPIs5bQkY2792VFGr1AT+k2O5q4j8tuwROSGkQIEZEmMTqIDsLaglNeKbtpIMVI2AA9plEMwQURwJZs0INhcCkZxFja4Y5C+WmTFiW/ytBTVwCsUNLnk68k3lbn7SWYnVJH0UfiV1iq82wofwKcxaBfMJlUwycgzL8u01S7pBZlqKHK84uHHo7QLSauT8PZNX63zosBVkCBgWMZ5SUHjaeLSp/IYhJwkFLHHT+qyeuYMd07i2++Wi8wYtdMmNXcDSpmDOxinS+DDxJCgNXzlPYzTRho=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(83380400001)(26005)(186003)(6486002)(508600001)(107886003)(5660300002)(2906002)(7416002)(7406005)(921005)(110136005)(316002)(66476007)(8676002)(36756003)(66946007)(4326008)(66556008)(6506007)(6512007)(52116002)(86362001)(2616005)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/hNMObMNqtwdyZN+b6AB7PMwEkk/ZcXye09kWae6WhE+yHoUl9Og9KQwn+um?=
 =?us-ascii?Q?p69J/+02qfDjjMtfbZTJ+7qmPm4+sfTDBW5WszpyAdBt8tpcb+/Uilh8YLb1?=
 =?us-ascii?Q?ZfDGpFwdHwEuOLZMMHgcGZJZwYeseT8iqRidtMx+YJcw1nS1EQJv8MwJt82Y?=
 =?us-ascii?Q?nE/75Ib7WEdeOtZZn7R/7qiYlPm1oSx5xarIC9FphLxn7tFlwBURQfMMSIx0?=
 =?us-ascii?Q?L6S9EtQNkPa6nSs9Vid/eUrEO4uQFTai8yf4WCRXJNwZILUaVfQyxLJDwJ0r?=
 =?us-ascii?Q?+vWUuE2h79Bnl+ikhlQmeuDhJkQAWsBENQf0BQ/Tk41kUSe8hjSccMba5dvB?=
 =?us-ascii?Q?1/LkpNf3prN+1BhNe6cYvTvplggzF+TmwaN/8Oon/RD/s8ub7mNrFw+6GWJe?=
 =?us-ascii?Q?WaIWsbnVqaXgfTJQEfY8Qe0IVDAjVlGIKaJOJ4APCeMo65VlASSMLkxkSSpA?=
 =?us-ascii?Q?9I0B09poREZyCN13zM+AGYHU20po3ZLu/E2Tzm/CiI2iLbRoW/UtvlYExXa/?=
 =?us-ascii?Q?MGFdRNNm8as0FSAhp6QV7kzpXugurT5bXRr/kJC+zoXt14EEzL1JPWbtLZzW?=
 =?us-ascii?Q?ySOjdo2jFaJKbgnSiCbn9ymIy4IIsX3EFMqJ3qxvBPu94MdW8VKse7MMcmdz?=
 =?us-ascii?Q?+0WQ3PR/xFAprd6Rs8nYHX6kbQUBt8KvFhDn4S08X8+yC1sZ3gm//xkArc6D?=
 =?us-ascii?Q?aFQL5omXkj1dogbyz8AdqtZeIOz9yS/o0+EDbikm+jrBAVRyWZf6JS13Xj6M?=
 =?us-ascii?Q?xB2zwBdyyguCeimCO+detEuLS3ueLQJm4RusdxCttplqZcd9AYkkU7MSV0S4?=
 =?us-ascii?Q?cOupaSmB9wDwIgrY0U4GTbpIwIJXSqV/iVUMdAQdY0Tm9rGhyPRiM6NnuyXt?=
 =?us-ascii?Q?cJyXSflP8+eb3/oPEmVUzyVm0j2a0YyBLTodxUudr7wQpHLF38g+mMIiJtzz?=
 =?us-ascii?Q?DQO9gPfn0zM8f3HU+S8hhXBlql2p/vb2SaQ4l0N9YLnkTRTv48gPblxKRmy2?=
 =?us-ascii?Q?bjf3cOAsYmRRAZO6lwx5TpXT7Pjf8NY3aG4f/FfmZ9cM3Lj0s7AIvH1qhYfF?=
 =?us-ascii?Q?znSwef88plc5VWdwzuPGIoASNK/cA0zF58aBA5ORjsY8/jM84VnlVibQ4XAu?=
 =?us-ascii?Q?6WZKwyrQL4acUhcBhbUdhRAWWlfQIbSgRKxANboe9zhCVgQemb0jRnYlZv+i?=
 =?us-ascii?Q?5b3v8leeD/rUZVFDVsxk8j5e/n13FPYmrlRObxpaJEY0WroB9v7tS6Uhc/O4?=
 =?us-ascii?Q?vdSoJT9f+1rEQwYaoC0Q759b5yMtht1/BDjcO0B8j2l86QZNVlnrchlGyrxA?=
 =?us-ascii?Q?bxHk4NDGk+taU67w62VNRHeZKQkeyGgQCKXnQw3trcmhXLrcBAdZKiiLbdK4?=
 =?us-ascii?Q?o59tRU+2es5UaEe6y5qn53dnlOFv2HUM1Yc6//VKm1G1GJAA+bTsbkUDdYFS?=
 =?us-ascii?Q?PLgwUyE9/Rlnmk3Jplmyw1RyEjCDLdJmNSHuC2DQBLklc26boLSZ+QqV2VgS?=
 =?us-ascii?Q?1Y6EhFeXNAFCTllsecc2Hdq3oJ3tYjL4UOwgBeFLr5Nxg41mSs3/UOc2SuDV?=
 =?us-ascii?Q?X7mWIjKLMI8Ts+RIQ9ZMkZO07PbE/RWxPj1cBpRlgvEEyi1KuVrUWrr89j1+?=
 =?us-ascii?Q?BzOD0j2m0Nov7hSAX3g5+GM=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223ce6e0-9445-4c31-3457-08d9f02668ee
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 01:56:41.3563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDMorbaPLABqnTTpOwm40CBkcz4dtMZpZlZYde5e3nsJXS1ZDx0+p2Hseebj67OCT6NIyc0pHCU7ReC2G7pQNA==
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

