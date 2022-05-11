Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6830E522BA4
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 07:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CA310E75D;
	Wed, 11 May 2022 05:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02olkn2102.outbound.protection.outlook.com [40.92.44.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9157210E75D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyjvYBS9LiUkBAIebg7Th1g3bsU7d10umVMSWB4bv+cpHl2h1BvDOQ2h46LEF++w7P6Oms/Eh4J5gxV4X3rxws1BTKue6BKzqhcNr/d9wa8rASbDo/Z3/QecHE7XEZPBOJC2RlZdztDexCYd6JOcWaSJqK0+hNwVIvsCAqNZPkHHwOyU609LtL0dBqR6BRya9+dT9s2FOBcbh16s9BYbGdhSy19khXUadZ8MzWyBrwOD7G2q0P95JqXGd3GUhbY4fB4K7pJsJDtW3XSb5eOjXffL44SKG5TtScpQe5BV/uJk0NHw7RdfbIVQntZinjF9SBzJaNZWXLBpq1iEBYNehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bB1pL3u/luXjA3VfglqgqHt+krdJRQy+38r7T7uIm8g=;
 b=LncRzqvEFGEF6PlyisRWbAGhI2W3sAWW4fbMWGzjFfcUx0DEWmEJf6vTyhBavhww6LFKpYn17NMTi1sQID9EIgEuX+fd3CDXdz8nss9K/Mtavs6KGU08Xi1OaYEdlpsldl8Rd0yNx+YXDFS42D4gIba8Q8mz+sTGjoMJTb91ztIX8h8oz4NSA0220wvXFoQaJ8qf/4JigbKzIVO6eMY9nd01/CPXE3//VCeTkIBfwGNwoQNT3phlkPNoh40xcyCKeT6xjIiazrxFy9PN6BI2oQjxXAZ/mRstU6KFExxLnru5lOZjRGjcx8SOl9tjTWhqk1yJ1c93YrJdcOy70HpF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by PH0PR02MB8407.namprd02.prod.outlook.com (2603:10b6:510:10a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 05:28:35 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%9]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 05:28:35 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v2 0/3] Introduce EBBG FT8719 DRM panel driver
Date: Wed, 11 May 2022 10:58:08 +0530
Message-ID: <BY5PR02MB70098599813F51B07057AE4CD9C89@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [MrTlRE9vkdSuGVkXiWQOOSB4Zmkth5oqtc6jbcgsGx4AFGHjERcDIPj3Xhxxx0LL]
X-ClientProxiedBy: PN2PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::7) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <cover.1652245767.git.jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 634cbcdd-4c07-47dc-9462-08da330f176d
X-MS-TrafficTypeDiagnostic: PH0PR02MB8407:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iqzG9YocUUFovDavDbIHnazG5N+pshkefI1VMOMjc9Fc29xVAxnGXf+ksgQ5KC4JpYnQGwVZbGWQMgZ/a1xZKeGiEquxYKpJG+KzmsR5mxxaBDQix819I+d2gz/DrjP8oFvFe/GJB0nha5zGhhGc5NMOAZgWer9s7hDNt8OVFDsNWbCaRHON0CeYdxEMtsj/n5YbWLAZzNlyZrdewPt0XKxcim/Oa+ZUY4OL3npUlCOHoOaFb4fK0JtRmuK1jGpd68lQcz9hy/hClJEM1mwIpzasce72QSgU5crP7tF7Ry2NLgIgJSu3KWlenD5vgsna1kGPjnA6Txq//feT1HuVkBCzjN+b6rajFPG/P0mqtUln9yZuT4HugeGrIPRei6v3lKfGnjCjv50k9h7BE+1EqOLsUOQV6JpIaRSHHuXKXITruiVmQQht6miTL89Ls3pgItLcikzYkzVC0OBi8tVUbtbf2kiMfPnF2CXtw9bg9GJu6ESerm3gLVEjHsf9o21Gu0qqbKiV+8SlnUhxD/eOsanne5/9XVGSZJ3YxOjFQbxQhRq8b3qbUtpaiWPwdF5Te7lsfKrCD26b1/MugGSkfLkQS9cbk6daqUCquNeP83hXuooRSNvSlTFT3cu2R8k/VsBRORb41IUgY9ZMkbxMgA3RNWK9rLSSZsUqLUHbGQ4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?URhDQXlFS6TGjSEuBlv20LKwDbPpCurfFioXe71cPU5qLtQ5OJY+gvHalarJ?=
 =?us-ascii?Q?1WNJkrh8NNlc70LpKMjWml8wMAe9YNTj3BIp0RVcgC3fjVZfRH0AmWHYvBVQ?=
 =?us-ascii?Q?qk1KTDxFD/qCBWIbW7opOGlJ4CgoZdLEdSfZMxhTwaYc8pCu/WvW4OScROI4?=
 =?us-ascii?Q?pw2qczphA1LQfOTB4ABwYFSnzqeIOXR/M0F7B1Twk/9faMYaY+9SGqgGhCtX?=
 =?us-ascii?Q?S5aC/tc45/Z9Dj/MmYdtF6iLMr5e6i4Tdt3LR/Kjo35Jf4IMibXszhBFxSfe?=
 =?us-ascii?Q?JlnfZRnk/UuJFa0esC5rMrSvc4ObGuZJ9OjqrH0SzcsECXNJ/+T4Kii4kUvQ?=
 =?us-ascii?Q?7efdS4k8PRrP1LJMVCDzXLUgx3wkJrjhFuRZVGibun3lQbVri9dc2Ty0/PGh?=
 =?us-ascii?Q?mZW56J9TuDYu1yVa6YjsQLu9lh8sYK8AybFyIaB9oAJ0sGc53sraQY83NeFE?=
 =?us-ascii?Q?Fu9/yfqtposfIrORI97eXxhiO4GVI5bVGfZTwKBNnY7kSd953XOtzKTN02ej?=
 =?us-ascii?Q?JahePFUxxfLla9AYdffNDrWvXpNRQCAcT580PIDPqmMdtBIhhBcUALLpZQia?=
 =?us-ascii?Q?evhtlCH+u1DvlwhcBm71Dz7zd7hTzXM8nV8fXtJttIZCdPBvIU+gwSJnmlYj?=
 =?us-ascii?Q?R7R6W47Noe2cfJxPWsqCD7e7NiBweK8VgogotmWtKyzB84z4alUpIMfOlM2U?=
 =?us-ascii?Q?tbkvOkzIo8h/ZBAAZ+efteoa30qse4+L+kdGkYH/q1byoEMbVXeg4J54StiJ?=
 =?us-ascii?Q?n/0GNIbbchE0eUUG0qi7LvoiOYoeWvStReDULHr1SFTpBgqYQsAuEWK7TGdU?=
 =?us-ascii?Q?3SBLpBcZRjYK3bLhT03WdiV7z6WxpHE4J394vzPj53bO0zB8JceaOAfKVRYv?=
 =?us-ascii?Q?IPGS1JPgCVw2Rx85motrm7XAMYtFFU5H5ihnUULia04xXfpFRYox1dgO12sq?=
 =?us-ascii?Q?DXw9APSj3cpxDgwPOMHp67u8/jqmGIleVTSCsUMT42G1Xdu8AQMkJzCLZpE4?=
 =?us-ascii?Q?APlLQeYnC9ZMFLonVnKIRTv2fkdjZrRGxg8IEDQdl+QZHsWvN39SoKRxOrd6?=
 =?us-ascii?Q?RFc36wcwRLX0GtCsR7Tv2hij0nzb0Tf2c97TmqDFgg5wejhJmFtnrjBl2j4H?=
 =?us-ascii?Q?R2k6EE6KH/OjcZo4UdeF44Qt0RVptM17+Tl5of3zY0+2Oc+X+yrPSvkU8Vag?=
 =?us-ascii?Q?ZEJfnXyB9qAr5orEXu4vpc11DbMOVXBV2TkPQOASZIZWT2TwQ/YszlXfj8p6?=
 =?us-ascii?Q?raq24gzr+1qsD6Z2jkOJgEywPbpuE4jFinxOJiHWEqtFUTgh6b0inCw1gRTi?=
 =?us-ascii?Q?UlyuVv/n+wJF+VzjszU1vThMav5N08JAt9ZmdZZoDsMYKs81l9ZT4p3dREad?=
 =?us-ascii?Q?xg69vPy8AbrjxU4o1WIjwCpNTmnWf2uxNr7VM90feE0vhyL2ua9L1RJZ1vXk?=
 =?us-ascii?Q?2qFL694mr7ICi69ETBrR7YU6JA9iAHLrUvGuBpvMJ3tHw+iPgEFmHA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 634cbcdd-4c07-47dc-9462-08da330f176d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 05:28:35.1001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8407
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings and DRM panel driver for EBBG FT8719 6.18" 2246x1080 DSI
video mode panel, which can be found on some Xiaomi Poco F1 phones.
The panel's backlight is managed through QCOM WLED driver.

The driver is built using linux-mdss-dsi-panel-driver-generator[1], and
additionally support for handling regulators and linking external
backlight is added.

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator

Changes in v2: (Krzysztof Kozlowski's Suggestions)
 - dt-bindings: specify maxItems for reg
 - dt-bindings: cleanup and simplify the panel properties
 - dt-bindings: in example change "|+" to "|' and "dsi0" to "dsi"

Joel Selvaraj (3):
  dt-bindings: vendor-prefixes: Add prefix for EBBG
  dt-bindings: display: Add bindings for EBBG FT8719
  drm/panel: introduce ebbg,ft8719 panel

 .../bindings/display/panel/ebbg,ft8719.yaml   |  74 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c     | 362 ++++++++++++++++++
 6 files changed, 457 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ebbg-ft8719.c

-- 
2.36.1

