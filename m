Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395955385DB
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 18:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B900610E3F3;
	Mon, 30 May 2022 16:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2010.outbound.protection.outlook.com [40.92.18.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1D510E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 16:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVqtkgha+dbPqTnhwLyyVh7FAzfFMk/0+NBhYxfbyW4T7hJ00owxEjS7GAjYPUy64OTvtdkRBBxdfmPtcRdA6HHeBifk5W52G/THy1rvR0n3zBnI/eeM2B6VObM9J+3hBEdrjBmv81nkyk0nQOxNH7HFtuwTb5zFBovSXzLEpfMCPcfgSFg2A9TWOZoE5CMJqW1IrI+BQWvONfe8Qu10sO0ju4GCoU9zswVB9fwg7IgcrgrOpE+6pj1cFj7DNcF3B0bblaFJQQwF2fmufzgzk7ixB2tNyAG92SMV7hjltr/eP2WzxQdKcqbG5zrhnZaL15fAeSw11fl3b6/ygeo2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suDOP3FDgsbk3lo037gMex3JtVTcUC+7mu1TUSYdvZM=;
 b=DzKjz3lotJpWqfcwKoNArAKSxmoQYS4EL4DrBmxnK10k1ebUoHo7JzVW/H32uWxMcgwOb/zX8yO4O9AhmSXbxdt/IK57GY66LdWR4ZaBwSAvz3hnIpDA6HHN48z8OrRTN6YpAak2Fks902gww7fXXPtWomiGnAdCb10d2/m4VYvV01OfMxW+lJTX/rnRGT24FG+GbrVF2FaI5k5YmgZPdVN/irU2TBJCzYMxTrQTdo+kWIDezJ7O03cL0lloEp4J9e3gNcP60+5WvN8nFjdNp9aErkUVhD/5i5VfnZdVaxG3zSMxKDUC4A6mn55G7roHrXfKi7gfsSgY1k36p+sBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BYAPR02MB5880.namprd02.prod.outlook.com (2603:10b6:a03:11d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 16:08:21 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%8]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 16:08:21 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v3 0/3] Introduce EBBG FT8719 DRM panel driver
Date: Mon, 30 May 2022 21:37:50 +0530
Message-ID: <BY5PR02MB7009F3259F82C08023E7365AD9DD9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [UF0Zb/hjgkyOnAsunSFINw15siQCBqAmyQ0qhmI3GNmUUSiBvAxAwIyxPGZY5ixI]
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220530160753.100892-1-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23b5eacf-567e-4bca-82ee-08da42569e0b
X-MS-TrafficTypeDiagnostic: BYAPR02MB5880:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fopcoA9U/zxWDysiYd1/g+L0jFjhoMSUX6NIvrMBia3AcYf0L9yiXGT/NPK9cwUq/deUFkGlUcHVCVCakptKu0+hEkGurL4wFhKkSc03sfJHlwyjQGhlG5JMZKp4aNOAou1A2oMbqbvdmLO2i2rRbQUkVplwoSTjbI7qxRtcjwMv5XxXKZ1QrcA1G9z6NYvox6ShQQow36RVnspq6drcwfCuXKbhQRvA+TVE0Nkuj3KFLJCRjQ8yHljbY1tQFXou+o+Qgs86EmM8hE2WSwW144W/7rtgr7pAIHza47Q+eLCXU4XsdTgukDxU8bJHJfxPyhU3wX7O6AzgQg7woRi6HG3kNGHCH2K2Oh22cpNFNBerZYqefK2p5iXxo4G1NdtmhAP9vB229WMSmNPbX4UNW9rfXfo7MXDvw1Vsb2towt8dQ9BGd7gs7j8rUpauj00T/WLAClYNNm1aIet15U68mRYWo0FZ+/yrwkRNiiF0B/omUP7iybbunCey+3OFSTqzuWFkY3ONBk41CS2GhHYRZDISqd8Db3FWYPr8bpA2w+yqiMJvVl+CO5U3V8vAZbJJW2GVxWbCOGfLV4LRj/DSOx7fQZkHdVQQhHqZmZP2CmjYqi7RUNW+9BhAm0tovnge
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xzc5vpqr+uLB9JIZ8bOiAGqC9ePwt2dNHS3czDqH1bqWbgcMPjoNZdExp1xR?=
 =?us-ascii?Q?z/lqCLdIpVRULZyT9hzDY4Q/+YaFNTWn8gdBOhnbUNfOYzSJzFc6U4xLxwz1?=
 =?us-ascii?Q?kcA+G5voCXDaO5Q/vhAgvGhKTnr+R+YkzQHojwORN17D5RUGqywsKi5uTH2t?=
 =?us-ascii?Q?0kbArFdgxiNcLG3lU0Kj1nI+L+5/TXuuWn7kswCVqeNLQQK5HrvaOea3Lu4f?=
 =?us-ascii?Q?DeitvRd2ITz5xPv/JbqYO9srHxZL9AQSHIoM08eAdiPtzM0+HSvGuwsTCBly?=
 =?us-ascii?Q?B5RR8U+P+bqa1+QVPLnJ9HHYldCES2g2wjZ2wN6HVNsb5iGOE4VT2FKR1+n5?=
 =?us-ascii?Q?3V9vzgV2suLsae6GutfcsxrPTo0bvvpDFRC3lyaLEuEC5vnAPUK3Mm1u8kvv?=
 =?us-ascii?Q?u5s7vDWGzwvkV+iopt/KrKkXAdd+DoA3qPtWarwZNBvfVc7d7LBMza5bbLrE?=
 =?us-ascii?Q?n9hr9rb51Fa67BaiwVvkVFFS2NON3faPGOBUuUYpTH3dLEE2InzlKdQr5YQX?=
 =?us-ascii?Q?qJaaHTDoYv8aExcwl7Pf2ANHy72hJZH65Juwt3KsNUJTknwMFIe983a2BCC7?=
 =?us-ascii?Q?JIRSol1MIx9oS4Fdbcn06p1U0GUkAFQo6uVGvYeN7AKz7qPHnTNL/rXWbSs8?=
 =?us-ascii?Q?AGbYM1mN0lpODcyElGSfVVmMBBrewa1lUmWvmHwRD5vQMrXX8ZlZ8x3Gq+v9?=
 =?us-ascii?Q?2nidTsn0EgzlAiWgG79xhzh0JGvZDdtkyBgIYG4VKBZnzJqHbpqhdAXecWPS?=
 =?us-ascii?Q?8jy9xLt0rAprr9ZuwyEadRivoZTLCXtfuhu8napQoDUbFhEI/hmzydheANt1?=
 =?us-ascii?Q?MJk1jHC/yBW7Poe++d37eNtkoUihQIR4lNgqFmt3XLLLy4EZuBpGQSSPJnQJ?=
 =?us-ascii?Q?IxYRXVSwJ8TZtLS7HeM2V4utJteHvGrHSQ9N0cKx/oXyTyfjEDL5b1RCdFxB?=
 =?us-ascii?Q?PVou+ZOsTrIEmSVRt8zL1SIUtJKfz9mftjNw7zRP6IpBJnYufqo01aR19tYR?=
 =?us-ascii?Q?MULK44DTssB5rPeWQQs4HUajIs5BwkvX2d6AaZcMdziHdPraJwGsdZpJMX+p?=
 =?us-ascii?Q?ItuQgieEItQLbV3QRYnz5LkiMBGd4/0RteUYuMKgY455TJW7+nEWf53WpbLf?=
 =?us-ascii?Q?CQ1aQ7y9BfcGNbHXaYLkYuap6qlMAki1oN5V8rpV8gbTwMiDbfOw2w+bsXBs?=
 =?us-ascii?Q?WqKl8gQbqIZTcLhMYPjwRLdMFramA8pwSoN7aYbQCDh7RPIsJP2xznoZTNGi?=
 =?us-ascii?Q?esXvcv4HAWJNe83dDHFRmg/AYX9B9Cd1XIvqSiOpp7E50QWg+UPd50HepoF6?=
 =?us-ascii?Q?HUooOQP34GMLWiwjeQp3Bk8JQJQ1/OxCULOdH9+GnZiYT9rri6QcE2VsKQtt?=
 =?us-ascii?Q?fjpYUG3UoavrFkQpPX5ZbZ0dRz1rVx8tD6XCOMAJAg44YYd6lp6ebizqG5ze?=
 =?us-ascii?Q?K5ULk5DT0IRQLV/JuMggGfV9GbPYzz8rzpGT8vKvn18JlskHRXr3UA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b5eacf-567e-4bca-82ee-08da42569e0b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 16:08:21.5958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5880
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

Changes in v3: (Mostly Linus Walleij's Suggestions)
 - Removed ctx->prepared state variable as it's handled by the core
 - Print error in dsi_dcs_write_seq macro if it fails to write
 - Removed magic power on sequences as panel works fine without them

Changes in v2: (Krzysztof Kozlowski's Suggestions)
 - dt-bindings: specify maxItems for reg
 - dt-bindings: cleanup and simplify the panel properties
 - dt-bindings: in example change "|+" to "|' and "dsi0" to "dsi"

Joel Selvaraj (3):
  dt-bindings: vendor-prefixes: Add prefix for EBBG
  dt-bindings: display: Add bindings for EBBG FT8719
  drm/panel: introduce ebbg,ft8719 panel

 .../bindings/display/panel/ebbg,ft8719.yaml   |  74 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c     | 296 ++++++++++++++++++
 6 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ebbg-ft8719.c

-- 
2.36.1

