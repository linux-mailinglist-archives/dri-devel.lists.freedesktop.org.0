Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD43E1383
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 13:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5399B6E7F1;
	Thu,  5 Aug 2021 11:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2091.outbound.protection.outlook.com [40.107.220.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE05C6E7F1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 11:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnjMUpwhsNsDxAb6rc3sxOk39BKdHpKuh50fqp8ngUq7QTpan4TuC8J9zkr+tQOnMnfr24y8iZK3q2Tw1r2oE2sFVIn7oiVyECbz7wSJUvWCFa25jNXR6Svo4YH0HjTWVHH0CVbqVzy89AvoErJgxM7upElv7+CTK78/q98kgzUvAhGXqL582ciC5ml7/0s3hgnn+MzXNSjzgvIcgdCuA5ObS6jWFPHRpT1ov4pWyKmMTHw9GLuEN0XY7pGibp7iKNGEwnDUmWs479YKVUi7gyQUJRaNTftFRvab9EsaJVQp5YFKKH36KMK2EV5qaSACmOlP/qILy4NsgzTV3ISWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jm1yErAlZG4d+Ypt/Woxl4UH+n+0VhfEjRSo/ZCJBc=;
 b=h0/i7JY+oPxOoNXnDwnm3voV3zorRPrYmAEn3eLosr97wCTQTC1TFynKB/xdJXzPnymO0/9Jbi+40fVE0/rTcgPLmw0KztYL2gV0IgCxbUKfBr9VvE2XBGeNsi88XykpSY05jF5jgTKUyM4ssA0ilySOxnm0rfIDfAdt0dS1ZutjIFOHDF6jVJR+8VbXG6o2rrLvZn0VvbdlFMzrPGGCP2vBeVuL5cMH0daqDR7iLfRe+GtH7EZbBuQiDJoQ1AHJHMXWeGmUyx7AqDCERT53j8m8loMKRIcGaIs9S82l6MOrTuFOYS6G5mV0R18+VYjFpMEvqWe66WDDjncC2tFDaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jm1yErAlZG4d+Ypt/Woxl4UH+n+0VhfEjRSo/ZCJBc=;
 b=2nlkmQ5MmG1tBRFr6c8pwwUOt1jdp2DqTKGcCBsj5P7zmvBHR4yHzdAFDiZ74lXQkB8QzDiuJYBiN3ANA6v+bzKTL9/k1c9GgEpXT/p1VzypuJYs11qScovysZAuuU/7YaTTzrIhvoABHoyDHYXD+Vd3OS3GdzF+OV5HziX2/gw=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4901.namprd04.prod.outlook.com (2603:10b6:a03:4f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.24; Thu, 5 Aug
 2021 11:07:55 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.018; Thu, 5 Aug 2021
 11:07:55 +0000
Date: Thu, 5 Aug 2021 19:07:44 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Nicolas Boichat <drinkcat@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Bernie Liang <bliang@analogixsemi.com>, Sheng Pan <span@analogixsemi.com>,
 Zhen Li <zhenli@analogixsemi.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/4] Add MIPI rx DPI support
Message-ID: <cover.1628161369.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HK2PR02CA0182.apcprd02.prod.outlook.com
 (2603:1096:201:21::18) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0182.apcprd02.prod.outlook.com (2603:1096:201:21::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 11:07:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e117450-16bc-4e28-aa9b-08d958014650
X-MS-TrafficTypeDiagnostic: BYAPR04MB4901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4901B6138C5FDCFD39791969C7F29@BYAPR04MB4901.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B/qbCsQG5pVeZocHrLO2+EGe1CnrV4yDhVxeb1xh2/oeyNZb9ed+VVOxB7LfQmcBp+KHoSoEla8QA9HFKHTFSjYex/LwN3uQbssScrcJeuan7l5ab7y2TBMS32jLRAKmSSjVmBPQ4JZoGhF6tju+KBpeQax+VpzN/F16+Ud7VM9n6iFNZ45pddfEeC1LomQCz/H38vlNHbt2AcllUGP8MnjaEs+Ho7Ul0c8goeZ2kqUaeePv6sI9Xukm0iY8/+GGidMsPeuuqB/TGu4gyZskHCFQOON5zczeWKb7Z0z8bMDk4LRT0a9Q2RBc6+QrxpiBHkLcA25btXOIDsuUKV9FjkCY8W76syc8TiJjHGhh8JgJ+WioYRYHKwhXPvvg8EeUiB6Uv3CPrZ//+XIdsHJzDt+zOTQxcUFllmecwjz9S7MPFwybfEnkFtYuN8XSrOfac/tkmOomCzqh+PeIiT5GYBk94aZoxjtbPoUHB6J+HRhsyOtrwjAEHJC6dNW/4HjnVsESAXbld6qcIsFFPYiigf4y3f2o+5hZAYW0q+iIx9Jwoov8iGBKcXVo7KS0Sv7rxuYbbjrrefT9vCP9L4V8dQJdpJbVIEW5qB68f9IpLQ4pm2mdOWI3CbH/HA1zR+KS8NTQ4Y7lVZFZjvnw6X8YoheThq3+ZlhGOG4zyc4TU2FeKUWXrd7DxuSXInraEFfb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(396003)(366004)(39850400004)(86362001)(4326008)(36756003)(2616005)(26005)(55236004)(6486002)(956004)(38100700002)(38350700002)(52116002)(83380400001)(6496006)(54906003)(8676002)(2906002)(8936002)(5660300002)(316002)(66556008)(7416002)(6666004)(478600001)(186003)(66476007)(110136005)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?upBeGvXRgQpNrZthThJgaJeMtAWEGVClbBMD3EoTGinqzaC/h1sS911ZLNOQ?=
 =?us-ascii?Q?AZ3cMNMFREuvXnpVINwky0CuRcKC0csS6jYn8eW7Ah1dzwJypLPDHl/xkrJp?=
 =?us-ascii?Q?Al1mYTvlrS6aIXK9crJVuTYtqBjEBq/6YEVXjqPXD9PCnQ9tHM6MVKhcmu8Z?=
 =?us-ascii?Q?3XCKkKVs0TvjQ0KTmWgWgz3otVPQ31LS6ik4/JRyQklHTxxgo9u/9bQ+ORLa?=
 =?us-ascii?Q?Qy8GFZNEKre5rSy1RgNziZQGzryX9x/yInT4D5Suf5BJpPjTN/tKWY0g6Uqt?=
 =?us-ascii?Q?7NJdRxWFy4V+XYVRRAgtKecnoqVDwjlxoV3D1a9Yv+2MdLBFbIBlXdWdCiKG?=
 =?us-ascii?Q?T2u4F+oJBJ19WgPCkdI/UUzG23MUyDtrlAjTJCbbqk7pZVJEVmxc51m6vYKc?=
 =?us-ascii?Q?2ORSI7lIrUhr+0+Fm3Mx+u/pRvyWi0TxZexW9SDHpk6PqXhxRVsUeJXgpODt?=
 =?us-ascii?Q?/Pq6yHApQ3T5FOfCKn8OVEEaW3pyWIWL8n/GtnFpCsqeBC4Y1NqQyHQeDktg?=
 =?us-ascii?Q?p1e9D0MUiSNHPA+hbqGXIL6z5RaQ1NX1zx7lIWHab1ToI+3I85xZZGCCqzhd?=
 =?us-ascii?Q?0ZDghI8s9/sSGlCJvTkQ6WprZ94nnY/4TzyDWnSA2VqxGZ75AkSDKRKCCukT?=
 =?us-ascii?Q?O/b36yRW3ukxOZ4ISn7ZJ7m0Vy3Teh3IEiQ/85FGIjFoa9iyWDJa0YD3woys?=
 =?us-ascii?Q?HKNxC167wno3nt9X9SsgMBjpT7zTeK/j768gjK9T2IFOkqUo+kG5VLfVykJJ?=
 =?us-ascii?Q?ikD/4YaFMefQJW+vREJlMtrCIUAOFqHyedFv+Jsqw9mc88FdZUvwtSqmb+tI?=
 =?us-ascii?Q?5fWRUoSodnmQ/WZs5CnLWtXW3sC+ISeuIsEn02H4vmsPqHT7c4WGBr+/7UmK?=
 =?us-ascii?Q?BlXoWNJt4+zp60oMsxXV2bK9WqKFoETjyyNaek3Cws4ZRQd9RY69SCEt5kse?=
 =?us-ascii?Q?KwFaFh9KCBnTcsg3jUIGxLP2m9bCoWSJ9GC/UUIxmnnnBCiZgBbQEewoBIAf?=
 =?us-ascii?Q?lurjpOsQVzHdeWhlSxi/6HqWlJoTxHD5QeDBFUmJhhnQxjnF8LVBsyEr3Hti?=
 =?us-ascii?Q?T3f+awcBYOxiiXNHM19rXbj9xwJCPfG3qG+TH+RidBRkOEbUmSYJebwl0vKr?=
 =?us-ascii?Q?hCpN/oMQL1lorilxH4YRCzmgchRX93WMq0laqKyRBYSm63f0crjioMZRmbKI?=
 =?us-ascii?Q?nlXSJ/ImwEZSDNBLiNzOLNJ0mBEa+VA4p+SUmosMJ/iFyMgPeU65dop5t/nF?=
 =?us-ascii?Q?+6yTaAE+0DHxJymDujysIiLbVdh58lWEhU/MDF4ag3d8RP9096ImqbtN2mGy?=
 =?us-ascii?Q?vaQw29+KNMujWGZj1rIQMK7N?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e117450-16bc-4e28-aa9b-08d958014650
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 11:07:55.1252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 950OkklFD9tb1mPchANI6eoYTosTCVvkzCkGKmTwreTp5MGYgFZQLHBt1+Sv/vJtaH12tFnqO7Wz3tfWTib1Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4901
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, this patch series implement MIPI rx DPI feature. Please help to review.

This is the v11 version, rebase all patches on the latest code.
Any mistakes, please let me know, I'll fix it in the next series.

Change history:
v11: Fix Rob Herring comment
 - Move swing register description in property.
 - Remove additional property.

v10: Fix Rob Herring and Laurent Pinchart comments
 - Add more description about lane swing configuration in commit
   message.

v9: Fix Neil Amstrong comment
 - use macro define 'V4L2_FWNODE_BUS_TYPE_PARALLEL' instead of fixing
   value.

v8: Fix Laurent Pinchart comment
 - Expand the commit message.

v7:
 - Rebase DT on the latest branch 'drm-misc-next'.
 - Remove HDCP patch.

v6: Fix kernel robot compile warning

v5: Fix Rob Herring, Hsin-Yi, Robert Foss comments
 - Rebase code on the branch 'drm-misc-next', refer video-interfaces.yaml
 - Seprate HDCP function to a new patch
 - Fix driver not correctly get 'bus-type' 'data-lanes'
 - Add audio HDMI codec function support

v4: Fix Rob Herring comment
 - Rebase code on the branch 'drm-misc-next'
 - Change 'analogix,hdcp-support' type to boolean

v3: Fix Rob Herring, Dan Carpenter, Nicolas comment
 - Split the patch, fix not correct return data
 - Fix several coding format
 - Split DP tx swing register setting to two property
 - Add HDCP support vender flag
 - remove 'analogix,swing-setting' and 'analogix,mipi-dpi-in' property

v2: Fix Rob Herring comment
 - Fix yamllint warnings/errors in analogix,anx7625.yaml
 - Fix kernel robot compile warning

v1: initial MIPI rx DPI feature support

Xin Ji (4):
  dt-bindings:drm/bridge:anx7625:add vendor define
  drm/bridge: anx7625: fix not correct return value
  drm/bridge: anx7625: add MIPI DPI input feature
  drm/bridge: anx7625: add HDMI audio function

 .../display/bridge/analogix,anx7625.yaml      |  65 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 458 ++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  23 +-
 3 files changed, 491 insertions(+), 55 deletions(-)

-- 
2.25.1

