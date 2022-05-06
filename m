Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FEE51D765
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 14:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9710A10FC89;
	Fri,  6 May 2022 12:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2068.outbound.protection.outlook.com [40.92.22.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B563910FC89
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 12:18:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRTmXsaV0UTPAOJLT0O654lo4XCOPZT4Y/dUJLIgzp5PoC5bprts2V/fbP8XDn16gZiJMe590nAAO78c3uQyxU5kjyAuW1eucxXr5pmFAkRUIL/91/xRevaAIaXoHOVcvqIcYo83bimSUXckLnuFlN2p6WdiHj4LYb1W4c7ms//7/QE9LEgW6WlCH4bOPzAiA2UgADdayyDsbM2npQQ8iZMdoY/O0UgK30kBHrF+F8OlNAFBfVht1lftlhn0c41Yha1mivxSZwTq9KqMegP1eqBzJco16aKj47BtIuyiwW1wVzK+T6t/dk1fnbWz+gSd8Modt348UwbE3n9CwTkUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsSbsOUwHurBgv16tOk7+X8A5ovdgNh0kdbmdQL+Kp8=;
 b=UCZ39SF2EQPxCjsUQmF7V7EAo7di1DKF5qoeFMiWSH1Gg4pVBMKalj1qtMt4GQ8f9bSfFwttapL0w3pLxLZk3PS8dKa6KjEP65AZirCU5hDMMTYzIkPtpYHmB+lw1V3k/YOq7Xwf02xNYl9gDY1kgh3xflhW7FF8zRS60ibziWzohOi3VSBq7mNQry6HIJY8ERTksiNXs2hF0tKyKAb3dkVMPWRYmgejMWvZt1VqWRI19tHLam/6AhgRU42vuabNhXsLsvyTyPr7IrQTAsaGWEb7i034N0SdFBUI6lGelcwfrYfNkD9sTruXwcPSv2xfyQYf3Q/80KxR6gxpYLTQrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BL0PR02MB6497.namprd02.prod.outlook.com (2603:10b6:208:1c2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Fri, 6 May
 2022 12:17:58 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%7]) with mapi id 15.20.5206.028; Fri, 6 May 2022
 12:17:57 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH 0/3] Introduce EBBG FT8719 DRM panel driver
Date: Fri,  6 May 2022 17:47:32 +0530
Message-ID: <BY5PR02MB7009DDEF8AABFE9C14F5C985D9C59@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Sphv4hLQgQ4yrfdeXmAjZlkcvfbJD9Zue2zn9c87UI5vMd5FjotyneIZBLH4j559]
X-ClientProxiedBy: PN3PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::6) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <cover.1651835715.git.jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd86a21-0cfc-4e40-8e8e-08da2f5a7412
X-MS-TrafficTypeDiagnostic: BL0PR02MB6497:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lgu2uMWhZ+58pjLhUevJhwMspJNYwbNqdzTh3Nbw/X09QAac6uxClb/awJJF70YXCTTLs9s4jv0+2UemWYnT8SOVt8R+wXPt/GsNRJD8Nt5yzP15uwgSzvQABI2BB/hhKjTZaPhM6yT0mmL18x8VwDgDFomJNIFSboKEjgbaTlLHmGWAjhmNpbOHSn3h+jGGnYvlQiVJAnvUxXYCkZWThcx7JNOOa/YA2yxpjN8z4zdrQmZ3Dr8yfIDM8+j1ofiqhisVXajRUY3XwiNiTby8mjVwwkPv/D9BNZnUjTOJ8eUH1/LzVki0uaOgDqKWkditHcksiM1gRimFWGhGBguDUcXXVaGhgN+LySg9Jgy/9TlmNObep9RXx1TR0Na6mqBG8thukVr+9N3lMPI4KYO9JXzzeyEmFzn8WVQPuoIicMW2D67J5NKCRZlFVpyI24VFhAZiR4ixcYX4OYFhG9yy2AeFuaBwA+90t15S48vf+BmBNnPzgnh9GTsU4AS70z6uWNWWKvoW4rB2oRcYY9/zxZIG7gCjNtGeYKzmB3EQMsR3Zcw5vbG+/+kQZWFyMHHZoJSA1HJHjmv2ok95vT1SaxD6RNvIUuiF5EFh/TiSQlLKKFpM2l6VQrfp81Sz3rp6utaZHLnK+TBKuyXKAB13FirF0wFHYYnRfVtNYq6KEjo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PEU0m9zpIdg7mZmFNVkQJkee44qrLMoVTWSGiZuzZ1vk9oEQWo+qpk5OiNll?=
 =?us-ascii?Q?Vg4QLaFa1WWRU6XTs1kbNq0lOI3689zng9o+p1EyvPvytWDiNioxT7kzrQi5?=
 =?us-ascii?Q?WFtMHxilLs+LqKhuzt1aWUhb7B3U3FZEGXIxeGoMye2+8A6+MvEs6rO4G8kj?=
 =?us-ascii?Q?P/qZP/Xh3JSbjobCL/cvvgdBmaInhIiuygVqIICmgv1uGNo53ymEtTi97M7f?=
 =?us-ascii?Q?mQi5Bz7KnaXLcQu+xzBx3Lw6ctN37MCHVgwy+ej+LBkV2IyuFnzz722bw4K8?=
 =?us-ascii?Q?EHpxf1Ik4GWHccQ3CQ2fpojiu7G8+NKjROvXMCw+8Hg4rCcD+9cD/tO3omkT?=
 =?us-ascii?Q?wXFiGK3HlZaml/jsPv+vS57uogCBoy9DHHOdxgqowj58Mj6dVd7vS1R0rj9o?=
 =?us-ascii?Q?faMRRa4plV77oPKwocOCYEJ0X5ybK9iTc1PBhw0FcRtw1jDddWtycB2rVPCZ?=
 =?us-ascii?Q?E12W6GCYRy9kQGQzBeqseYB406/9gZFbSnXiQ1fsK7qQjUMvm75R6MNtYhOW?=
 =?us-ascii?Q?yeeBm2dIvbkFGbqHWY/gSWwwFNF9cKzbBykTLaWBhpUYlE/kP78heAVj0rWU?=
 =?us-ascii?Q?NVtP1DjQvfYXB1Tu0CQC0YVeHwbfpX7mkVgXMGmlNcnQlSXseJF9l7bUpmud?=
 =?us-ascii?Q?gN0SNkKoFzZ+eBp32qY4U08MO/ImpzEjHqfjCTJcCECkd4H4aRGxqYmjwUrE?=
 =?us-ascii?Q?3Jl83p/ypB55YGGvsx7nYAo5FzfB0kx6ZaDEXMTfkk+A5B8ilKOCJoRRuLyq?=
 =?us-ascii?Q?hu5AqE3GxxbRfmD5+tWD7ez8QUj8FLitQmybkGIEzGicsjthGetRLv9tN6w/?=
 =?us-ascii?Q?eJAvGzus3sbuCdSDnUiz9CbK4pTMSd2p5zEIA7tGih3nFfmnnsodM8LriAQV?=
 =?us-ascii?Q?qfyW5XVmitkF9hoNS8iSRDVOgyDga4pFDO1vzU7zaPGOtlHA0IwE46Kq+bnl?=
 =?us-ascii?Q?q13+bp1uvG/3Fhal3S7a/KIyt1/HhfcAeMKaeLnQxyUQfMeAo19tK+CS0Sb9?=
 =?us-ascii?Q?AEXsBsv+xepHS0T4oyz/6POkG8lluF+G8eIJYxwryejVdGUPTRy1z77psZYr?=
 =?us-ascii?Q?cZYMtH0U3RhsENxah4Ecz3e9m5aFSHLZ3Q8LdPPmb4IwujCn4K22mqKUSNIT?=
 =?us-ascii?Q?ZEBSEo9sAtzo6fqWDAZvlMMpJXBaQ2JUfiSa2t6ysO8rKQ4I9MHOGVwhp5Zw?=
 =?us-ascii?Q?vHXmjUoBZKFKOfZ8GHa79ST1jLVRLobPBqupzuxqT5kNLBzNwUDpzwa4TPkg?=
 =?us-ascii?Q?MG9yv47MKht3WjSComTYYPkuzLoNOSvuK55BLFQTPHKaal7cm5p0cCpRd/Bv?=
 =?us-ascii?Q?DPXhyTZXngYlnelY6WRrqN9Jsl6/VQCxQLluRUDUiqtJkvskmTuCnY13KlzT?=
 =?us-ascii?Q?5RwfO8mB5xObENUnq7Ib81ucnabVLB7Zk+J7uaTzgBhbPzkMtGyKXMoQO8Wk?=
 =?us-ascii?Q?sTJrbgYpgTMcY2f/6kciCxydkaCw96in3O2gfDfxHfO8KTDZW3W/zQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd86a21-0cfc-4e40-8e8e-08da2f5a7412
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 12:17:57.2593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB6497
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

Joel Selvaraj (3):
  dt-bindings: vendor-prefixes: Add prefix for EBBG
  dt-bindings: display: Add bindings for EBBG FT8719
  drm/panel: introduce ebbg,ft8719 panel

 .../bindings/display/panel/ebbg,ft8719.yaml   |  78 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c     | 362 ++++++++++++++++++
 6 files changed, 461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ebbg-ft8719.c

-- 
2.35.1

