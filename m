Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BF4EBBC7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10D010F5AE;
	Wed, 30 Mar 2022 07:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08olkn2070.outbound.protection.outlook.com [40.92.47.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F7410F18D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 06:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B53SkFLzb/jcNBDF94D8FheSNsct1pCUJhIvLy62yU++wuIzCcYiu8r11YBEcU4s4uOrkWQAS8V0SWgLewr76u47hVkU76BkiS+HYEew+5GnVn1g231rv8D1lWfkm2CahRMFv35VHLT701hNN5CiWrdgGduMDqeEVJi0EHdvmboCslWUx3W4Iiu0pPpmP/BJpqL4fM9M/65USmC/IYUGQUWGWFiZLoTK4oqLcj4bWbB45W7G3WmD8x/vKW0CAE4kGwgevqWf02gB34+ZinqPqF8UaO78RVNQAmOJE0pz/39+I+SZfANXQ+PKWY7HMyNBuu25ZjJgvNaaK98KQ+bKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIVKmciJUkjqgVyrdEV8jlIbThjkteUdnAOhH4f88to=;
 b=ep/ZatarnI8qPFrk9PqrcjYKJcJrv9iGxEymr0qovJ53/1/zsmSYqWslAgXHmsVcdeADRC6s8wqAktmOYEarxo325OL8Mvjp/seXrjZglyWslherz7d4u/UKBBafGifVfkLicxaZlR0jEZEQixC5UM3xKTIRu5JoRYJaZm4K/GMexUyphask2r50e+42SU3SeJmSuWTCjbj29a59oL9CaKG4g8SIeyseJYEt5iP3O6nYIV/c+BEPOJKiwbQ1Oq0954ERNH2VE49oqzxvdpvG62J99ppgyxfJ2DN1KG2qzJdY5DYhyGtWX90fiE0p+YdKkMN9tgrCqR/u+7AXOiNfcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by CH0PR02MB7899.namprd02.prod.outlook.com (2603:10b6:610:100::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Wed, 30 Mar
 2022 06:57:33 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6%6]) with mapi id 15.20.5123.018; Wed, 30 Mar 2022
 06:57:33 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/3] drm/panel: nt36672a: add backlight support
Date: Wed, 30 Mar 2022 12:26:36 +0530
Message-ID: <BY5PR02MB700990C63237A5B293E777F7D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Ms4kn9EDLdfU/Ugr1bDTqjmO3aHtO2PWfM+dYwYfvA5nr0ZG48hY8QNQxy8eeJra]
X-ClientProxiedBy: BM1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::25) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220330065639.245531-1-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45fa6dfb-7af0-4be1-59d2-08da121a9042
X-MS-TrafficTypeDiagnostic: CH0PR02MB7899:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jZfYC0j7iqiKsjw8NICJj4UgnSafkv+4kdVnMTwjsBbQRxjE2PtxLHgfAVswXTOoNMEltAfjxKLzRsPv3l6i1HzonK0W8atwuWgr3zm2IXNJy4gxhJlLpf1YGF9bpwfZ+i/6g8/UK9A0OLNd0HivSD3uMvf9H5g/5/AX7B4Y4wG3x1svmvZ6Q0F4DZ8rt1p2WRbd43eO98ZD/h+X8SYfJb9vFIfPQvKbDCMItUIqbYwCKV6+EmIv1YrMO+j+ALtyo9JPp7AHVINoLPHPM+m5ZTT8/YuUqTJ08C6F8CEgyRyD7EPm/EhN/4BVG3pwXNp5KOtycN16hL4H+Q1E2C496tXy6zx4dO1F5ltHOEbvAlcruCtkMg8Jw89BP/qQp4AUQuqsGCQ36svwc655tkIyYqQSvzLcG4TQJr83eONBo7LysjONvED6IOjh9WaQlZsyOBVXVWkQ1o/JMXsd3U7Ptz7L9Ty8bO32IC8NOWFRDcZDY4J4dT7HM89FhzdbTu3J1geZlrYkQtQ1MgmpesRhCYyBfxc2fWoLa3KZf0yjOvhMfLVmxogGRaMCmgkM/9TaZP45c5gvfqABJ1a07IvVQw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pLFmHzq02Yw6hIfH1fL66q3suqyXItnm2fV2wUvGgrqd7WqoA/pviRTN2KM9?=
 =?us-ascii?Q?ZKLDc0ac1vrGcv9hPK/80qO59VFTDYg7E+fXQ0ZeoI/WQV9ibyyVEUSCA2Bb?=
 =?us-ascii?Q?lBfNiQR/QPxd0kNc43b5rQv4iIjhwr4qnweX70QH4Etkz2Q7OSue/gygSCgL?=
 =?us-ascii?Q?3OqHQugLsJhflRyMJ7EOL0WlOzlAJt0Z2ZITtSEQ/quW8RXPRz7ZB1FGSUAr?=
 =?us-ascii?Q?8h8rIfN84rE0HD2hPFdvL+y4/cuBVp3qbmqOqQbtbc8fbwy1kz7hUOwasiE5?=
 =?us-ascii?Q?swdHh8Oga51Mmnw//xyx1s7uoBoUYQIpCgSemoc1c7zFl6xuPUsiPANfHIOk?=
 =?us-ascii?Q?hztigjupa0YUVopBaTHqPzc9BQDCC3pFWcfb2DCJ2+mNW0f0+ZboliUxcMjR?=
 =?us-ascii?Q?AqLET7lrjVRDckI7q7WHRGcUW1zOw0C3fz6KPW5SUY6Ve+JDmXUzBHOmSXwX?=
 =?us-ascii?Q?qKA1T5Ds7PdqS1oDqIAC96EekzE8yMwkMIjdFDK7zWUHEV0ernnCAvbEZPj5?=
 =?us-ascii?Q?U/Uf0BqNIJ746i8IJTRFnvVjrN8drApG2q88ikDBWx9lSCJn4qbfBtbmXJpS?=
 =?us-ascii?Q?DoLP+TRDqwaxhGtz93l0+ohE1DcyPottSOVv1eI4MMBp6zHpHtMcwNtYm744?=
 =?us-ascii?Q?FA9k39ALuW+JXFUwhaSiiP3gZtF90ZsWT0JEZjM87i8Oq0V70u+JTEP8POMt?=
 =?us-ascii?Q?wnRa8De3E4x1MgDG+X4UaSC+62DSsghwj7lL4dcazBbzzhani48bNDT1mEO3?=
 =?us-ascii?Q?qTWLwRw+maem5hQXbMLlyNJjxl6hhRqTfg+IGixcwUAYY43sHwVYJ2VlFSwB?=
 =?us-ascii?Q?yFPyAQp2rSoNGDjn2sDAsMoMQt7KJrt4/m8koChAeLkFCVbqVWiR6fZ3/XgU?=
 =?us-ascii?Q?4llQ1v6rsL5DUp9wI1wSGcsd/hJX56C9dqdBk0ErnpM06i2IAt4vRoSjen/3?=
 =?us-ascii?Q?oEDu1LC7gXI0FVATzbdLoEV54UAEHyWKKKJ5aVw7BhhSHjnegAiYhUbTrqZo?=
 =?us-ascii?Q?nmXxuFiOwZCifv/hUZp84xiX+5omU7EoZqX6Bkxx5whrp6v2dcMMEX1jpr3O?=
 =?us-ascii?Q?RhBcklQ5ZMaO6+159loqrIEpuYhaY64LWsYufPSQ5m8IRizK9D5gNLQfK11p?=
 =?us-ascii?Q?dspS+i9wG4Hrj3l816Iak5LlW3tlUkCQHDgxLPqRoseNbMCA9SM4l8Cimqzw?=
 =?us-ascii?Q?1xskEo7ELQTivQfnVyLX+cx8ks2qnGxUbYASykcED+Kv+tB2Ay6cJPFgW12l?=
 =?us-ascii?Q?pNfG6WJTNek0xIE5DxbZTd0A0Nm0XHDezch94ScGoZGI1Ti/iHYOxYPg8R3q?=
 =?us-ascii?Q?k9xUPutW2pX0WhbTJSJswaBUz/FArWzfqsHezN97HJ6FobGahEM7yKw7G6pn?=
 =?us-ascii?Q?/Ow6FP/xfvtShVq2mETTF8kysIEeXBkLeyqLeVuyO/+DGRSbeRPvkCZUXnZx?=
 =?us-ascii?Q?DoZzX7BCocJypq0wx17WfQFGMJ88OEKnHeeOZTD86dfckGHcnruSxg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fa6dfb-7af0-4be1-59d2-08da121a9042
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:57:32.9695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7899
X-Mailman-Approved-At: Wed, 30 Mar 2022 07:32:47 +0000
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Joel Selvaraj (3):
  drm/panel: nt36672a: add backlight support
  dt-bindings: display: novatek,nt36672a: add backlight property
  arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom wled backlight
    and link to panel

 .../bindings/display/panel/novatek,nt36672a.yaml    |  2 ++
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 13 +++++++++++++
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c      |  4 ++++
 3 files changed, 19 insertions(+)

-- 
2.35.1

