Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6647539F5A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCAC10E3B3;
	Wed,  1 Jun 2022 08:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2051.outbound.protection.outlook.com [40.92.21.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60C710E4D1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:24:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HavRjAlaaCHQZqc4hHIxYG6sfUILxBQztpy3gx3dYITi6QABK0g8zqmfDpn47Pc+Q4I3Wd+/1XjdtdY9tbjiW0acw7X99066Vzcbo/VKwD5OOO9QCZtgA14jUWo6Qwf/k7uKdLiAYXgDledbtjVvdswu9CsfzM+JC2ziLsDZlllvnGfttia30P7KMNouM5Cq7EB51ZUPCwVg8RtCAj08vRo6DwEBKU5JFBNSeNxyE47RmaUnHER76lyVTiQ51PS6usGmHx4mw4N3Uap0QpjUSCD4GcNQPTfMruaQxuafYnJv6+y6jyw8820OqKxW5a8E8srklHO+JjxwbXCS5MPnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqGdLFAzvjePfMfHM9s5YoGjwV4QexPwTUYQiypvDWA=;
 b=cZWd6187KTqxpF0askSeLmZStAR5B4lbG7VA/yHprg3TmC2So7bgtb3+pCplzVR+tvukHsBvAyulKw4U9fsf6wRXx4N74WOtVf0oBoM1PGc2zNVgg/WR9gguOtI2oB9VGMC7J9cw2Y5YSg2Wai476/qGxyC95uChLOWAAhud6YVLQfcPyT7ocu7nJ7Fx+25E0D/QUw3B4fOQhkzcxBLXwk8tIwZsvFCwc+4L6T18dfQYweYvLe0nDpBptbMJX//7xAduxdbTwSGmkOfndGI1Z74V1reNyR+WImznA/4xqBarvlx7QDpEp3x6tC+IYjFwYEQ1xNbP7WvtVwkzNIoQnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by DM6PR02MB5708.namprd02.prod.outlook.com (2603:10b6:5:7c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Wed, 1 Jun
 2022 08:24:31 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e%5]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:24:31 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v4 0/4] Introduce EBBG FT8719 DRM panel driver
Date: Wed,  1 Jun 2022 13:54:06 +0530
Message-ID: <BY5PR02MB700961069804230B5AFC5E04D9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [UxYhGyN4r2QWaddhC8FxyygjajlImiEVO+i+u0XigaqnjVN5Chkd4gVvbVicufW6]
X-ClientProxiedBy: BM1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::13) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220601082410.55266-1-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f090ce7-ab57-4780-e915-08da43a8266c
X-MS-TrafficTypeDiagnostic: DM6PR02MB5708:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3aEl3NY7XSQWZt1LrQmOxvLmTypU7Yp6WrOC1dsJUtfd+kc7UceCrz2WV51c/8edmoaucZefacRqFjeKbdv7Mse0N0OhkTZM3t57nXFqi8HrEKn8JoM5fY4yBuH51cAcz67nwHD4XV9cXCLx/PF9bp3tO0u+JrYWEseFu/uzmPy9US+Dqs/fNIkP1V3PRIkzy7CdTmhV491xVQyhEJdxmcVX4Pbkj4JxD9HlaJ7xCLhxAfUbX56xSyYNpWdDyDPvVgghf5V+kPcVRR62w5kvYr4G+LmfOBLWlINUAdoOadBbJBO57fmk384gKqWrMMh7coRzgpASyb6LBrITms1rcyRU87PMWOPbP25yFBotG60zMqG6OTEKhL1P6pBMNmsopz9ibkJsJ19yXRrfBhbYkPiIO9YRDbiNcavoIgSAkRFQgFtlrovt36xXiEtXuDdKHGS0v2rthDvNuC1fjUq76fuctOWCjSlaAYkLvSn4iucSGK8Pj2hBfrH7qkJG/C8lE9+2AdJogLgkASvW0AeBKFyWmPlFYV9PAQkMw3vGkM9ZjE4F3fvGJab8DUOCXyGnQv5iVMs0YzmMYGRvsZWThkDVmnn0ok9SK0Y23YpkZlJl85TTUqVGugOx7VKpDcqz
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q2Hbk5tUdynfMzjWxtOZGXxk8bwlM88MFVF5uh+ZH9DXKIimF/uMn8THul/K?=
 =?us-ascii?Q?8aJft80nqi8HIoGs6NkJBr0sZJEqVK3Tu1MSfrA/Q1UbD1tP/zMCFnWZ1F4q?=
 =?us-ascii?Q?me3+wpyupCqY36368EBCI0vjIZY+eOuLntd/TvHNU449cvoZxWJeublJR4o4?=
 =?us-ascii?Q?zyPuG7eHu7z36G4rTi2ELNTWlBey+60fUN7QSQPPL1Y6JmBMXyYnNUjXM92S?=
 =?us-ascii?Q?5NuyJtQXppe2hsr00SA9rgOqTi1/K2ogq3C25MQ5ni2aM+tlqglbi4YXx6Pk?=
 =?us-ascii?Q?6an33ZBH847SmrD404GGHnlgAvIrrt+BgHutt7pO/25nL1pU3RVDehwEHuM0?=
 =?us-ascii?Q?qwjsTvCkBSOkXIv7A7aBrKFBZekaEFxirpYA3zjndfXOzl+DXJe3K1WofrPN?=
 =?us-ascii?Q?4qCy18lAqwxV7lVsffrK08DQ6nWY62JmJG88SEcZKh1s5Ktu6rK+HVQLvzC+?=
 =?us-ascii?Q?VH/9NREuSLokUiWettkLtnQusGE0wY2EB6ctssmwLom7L3q/dT+26xZi9E65?=
 =?us-ascii?Q?o9fKZkS2BuIZhU9kgMgoZomaOFAij4tsdsyYkuYzbrP975ZYzHTBkIJP7vZt?=
 =?us-ascii?Q?+rsvNgrHMnx8mUCgRIRl9JxNgs1tM8BmXI044otcySOoYNgVJlMc6TJgPfL8?=
 =?us-ascii?Q?TJnaG31CSWU8WrR+8x6ZZ9Nehe45ZK4JkSkrAx8biauMgDn5X8RC+D9nn8eN?=
 =?us-ascii?Q?ZDlTl6WRpl529OLfrg08AdMxIbItvOwTUWW9QPmNXo7Zy7xtWhryLPosjOqL?=
 =?us-ascii?Q?+73ysU+g3WdDhJfdi9eXx6uIUvpKd/QWTksrmESv8Q09A2LQl6hLfffmitS1?=
 =?us-ascii?Q?QVoGp5JRMmiRNoq8Kv+Mg/7vQtBp5efC9V7OgaddkIPEoCRNlCJ563qz/aQB?=
 =?us-ascii?Q?aJUzv9FygnFfvLmMULOCrcZ4ZIlUIDU6CETq5+eP/hmVGGTgH0noa8Mw2F6J?=
 =?us-ascii?Q?TJqOlGns+1fPEDpNZQKV62d3NlYjkPTM76RbUi4hsOxcCxuuuiO+etGQYroQ?=
 =?us-ascii?Q?UP/0m5WtAT3UlJNS/MhblrcLRhiwYCn1usX5nrPcwsFphHu8cx93bOTZZott?=
 =?us-ascii?Q?oZzu7pisMBvvf0Q2E6RSIneUe4VY6jwRcipl72jfrCqlwk6lUoz0IyMBRqZB?=
 =?us-ascii?Q?bHkV6AHuVFTokow3cfA2eqdSbK7ZUOIypqHWMEEJkMea8/Ls3eIyjMN2j+ul?=
 =?us-ascii?Q?9gd5+iDt5Nf79lRUdnsOGSAREXjy6W2Wo3icUyDssB8PWZdQrlL2wev5kFw0?=
 =?us-ascii?Q?wzHsUqDib2SE3RmouNq3C1+HmzwKcATSrv4capPIQ31ZQrHAhCiUCjWP9U6s?=
 =?us-ascii?Q?F59/MJtP6Quc83IB+zq2M8UxtJnVRWMnu+JYUGs9b8R7Kb3rMz7CI244Jq2y?=
 =?us-ascii?Q?OJfb1js+NPatwMoB647mJKrhTArHfELl2270KgtZNMRCAm0SA6OHVne2AfWb?=
 =?us-ascii?Q?cyabvYbMDA1kmVl7wWl4nvCOuSUD7YvA9X6lmtSJAfp14Ae5HWWXVQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f090ce7-ab57-4780-e915-08da43a8266c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:24:31.0376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5708
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

Changes in v4: (Linus Walleij's Suggestion)
 - Introduce mipi_dsi_dcs_write_seq macro in include/drm/drm_mipi_dsi.h
 - Remove the driver specific dsi_dcs_write_seq macro
 - Use the newly introduced mipi_dsi_dcs_write_seq macro instead

Changes in v3: (Mostly Linus Walleij's Suggestions)
 - Removed ctx->prepared state variable as it's handled by the core
 - Print error in dsi_dcs_write_seq macro if it fails to write
 - Removed magic power on sequences as panel works fine without them

Changes in v2: (Krzysztof Kozlowski's Suggestions)
 - dt-bindings: specify maxItems for reg
 - dt-bindings: cleanup and simplify the panel properties
 - dt-bindings: in example change "|+" to "|' and "dsi0" to "dsi"

Joel Selvaraj (4):
  dt-bindings: vendor-prefixes: Add prefix for EBBG
  dt-bindings: display: Add bindings for EBBG FT8719
  drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro
  drm/panel: introduce ebbg,ft8719 panel

 .../bindings/display/panel/ebbg,ft8719.yaml   |  74 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c     | 285 ++++++++++++++++++
 include/drm/drm_mipi_dsi.h                    |  17 ++
 7 files changed, 397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ebbg-ft8719.c

-- 
2.36.1

