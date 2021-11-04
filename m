Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59407444DBD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 04:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62D67B0BD;
	Thu,  4 Nov 2021 03:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2138.outbound.protection.outlook.com [40.107.243.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033B57B0BD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 03:34:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOcYDGEPk9jR3BYt+bKsVVVBNpiTSXE5igvh0rWp/qWnRL3ZORHIzDetNKSaKUHP7t2KYNnnOv/pNr+FhM6SWD2FcfhqxmJwNOQUc1W+kQFVv07Z5KiH4ZhNT/9/mC/K+vR7Lo1+Pr99DFEzVRJsTbXcoOFFYkyWo5ky51BCWg6PsqM5v1DaLqbrTeMqyRAnszwSHBoCOx0Gy8vexxokuT+TeyhrMOgGk62y2ss12T4gmdvNL9cNOCwNYmFWsjhnLYR4AM3CRa/a+/Tlr4Ew+qef+CQ8xPeYAXWV6HWUqzrNxpAlcSdgwnbTyji0+W4GG1woaRaPmg0IYoEpjSENcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW4H5qtzQIyzWkoaX+ItDuv0JthXiPG/vUCG1kUx6fI=;
 b=fiPCrQ7uqI4OtTfMPfrN9dWBOMwvZ4chfrKSgojz73uNuJttNWyFxI+JubOWxlMzsW1+/flZlgLyfF1EofXtakS/6ft49curGgjgCd67R09lHBNJlAFEVm4FCWDbc4AIk+dfbcbPP0qi+ki8i5ZBQvV5+xU1L3RkM74WrYMQQLnPYHTQ8I2pX+N47/GSJ2Cejak8DIYuAQVuFpg2Di8KNa10efRYeXi6KkKyQgjInyVC2Q9zaKo44Z3XQ7hijGhLsg+rc35iZqQULul3sC/gOFYh61UHbI9llgVMuNS4bnuxKZ/ZaQjw4jzHH98vmpmqaguGO3LnOuoeCvMhDXHI0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW4H5qtzQIyzWkoaX+ItDuv0JthXiPG/vUCG1kUx6fI=;
 b=GSYgGnHkrpwIAv5STsbRIiINgAVdAIWpvftyNujZhbdio8UuDQ+PwmCb/PcmM2/GmaRRQKgMlzez4dVw+8qKczFk/VzwVICAr/xoLmruWj6mQ7C/BUwe2msoxnh8M2L7oV64o+IM3SKV9SntXrxOkfRhFYIqqYvM9mcI1/hRKQ0=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4277.namprd04.prod.outlook.com (2603:10b6:a03::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Thu, 4 Nov 2021 03:34:04 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 03:34:04 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH v12 0/4] Add MIPI rx DPI support
Date: Thu,  4 Nov 2021 11:33:31 +0800
Message-Id: <20211104033331.2634341-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0154.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::34) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 SG2PR01CA0154.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Thu, 4 Nov 2021 03:34:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00246c01-fcd5-4547-e89d-08d99f43f2e2
X-MS-TrafficTypeDiagnostic: BYAPR04MB4277:
X-Microsoft-Antispam-PRVS: <BYAPR04MB4277D4CEE16B11CF7AE087B6C78D9@BYAPR04MB4277.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6GY0mhi8tB6AjAgvFdLbeI4DHQ8iEycLLEu7oWO1otZ//imZdsHGxY25XTWkQAwGgbv/RRL9uzDpOkweUX2/MFtlyWl6h4zi1dmNrvHyEoBuuGWWX9D849wgW589vTCO6uX/+yeGtfUtmYZSQE6IraY6QEtE5RhrXxlJYnrH44MZSlwuFTFhMQkERtglMhMgLkCGQlv7TguMDkN2oYvviokM8QW5LD9b8naqR92OBIjqXMSdKuNlcqAGNdmn+yveQwnZhEb+bGwiduzZ7UehMJwlfb8/PcfxLne36cFUlENB0q3EKN16EJCmy3Z7CYViPyxM2qV3zCgAH0YWd8wOgBuX7V9bXdQGkVp4wjXglNpWP9lkpOWUYciETLOzwGjIcM4r3rveD2eo4/WATFXQuVZbXLCIW0Ggb7jXLm5DLTmzWILkbNteYJ3IYXHqTJLCIUplQMsi4VcYB9oYlQ8EZs8+ueIl0kQNC/+CfDjuQrNVkMbUywHSjpPoIXNwXDhunRnSrgLoyQs3t43Y5/9z1zYzQ7uOZS77i5i86nZ2/jIgIAS1Iy9TbeBy5jRb6sDL5Zbxdz39Ugb6r0OsFI72aumZWcZvmYvbtbW2GK8jr3UztorncEZBw7efTkNdoofBz4gcUhZtjzOaVP70jKmvNh5XOtGOjFhycxd/T+p45ZWXiF1nlVxTE39M5SuCvHU6snZvx4bmjH7XhmurUL5W9s9j12imUEMvHGUBThBz6+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(186003)(26005)(8676002)(8936002)(55236004)(36756003)(921005)(86362001)(7416002)(83380400001)(52116002)(6496006)(107886003)(6636002)(38350700002)(38100700002)(1076003)(66476007)(66556008)(6486002)(316002)(5660300002)(4326008)(508600001)(2906002)(66946007)(2616005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?slBZf1vlfsdjRoSXUJl6Ktm/RImgw55/7dgTlZfBzhP3DYBr/A5ymRBq1qpZ?=
 =?us-ascii?Q?pfEfgwKxcnIQYW2LoElGGSp1OoFz6535i7mYGhr6ouu/SN/HnWbjDW4HCOTc?=
 =?us-ascii?Q?rYKmaSOw753MNqQW0BVl0MkpmRWhY5C1dYFqnzkDQER95f2IdiEhgHYmBugg?=
 =?us-ascii?Q?HTR0H90x53OR893jphHH3oHWAhpk/bayl3lJJhn7Sv/iS+SKw92L/MNxnmK5?=
 =?us-ascii?Q?opOsVAltTfEXGNTojPN8tN1+NHbn2L8Yo35BgewYmF0BTqcGUDFBPMVLGW+/?=
 =?us-ascii?Q?AiILXbbeAvI9HlZaya0P0+YGVz5iRIfCAXR2UTDySfHUb/wEcZUiSFci/Hei?=
 =?us-ascii?Q?ixA3BKOcAiJkaoGxD7JC/tvItNXYz0cSuKGLqdYvCiHg9A8/TwXWSNH7RxBJ?=
 =?us-ascii?Q?ODKtO2SR2i7q4Zz7Yg+pTmpa0RBPdHZ1A+WMueMwGmj5r9MrwyuZyjWd3a1T?=
 =?us-ascii?Q?9wWxE4cK+v0OFO3Nq6zpl1Zw3tgjagT8DoKeGJyBIRG3OdhoOtSR89Zduwb0?=
 =?us-ascii?Q?jzFfr4yjZ0YrX/bnH5bgNDceFAJEYNkPVFIOx+xnvxo2Ynq69YPvBtAKYpQN?=
 =?us-ascii?Q?FC7/nzW0CZIotxRZo2rqEV4yvA2E0SN/RDNNJLZ8hp54cUVKIn97wiwpdJjU?=
 =?us-ascii?Q?CoWwqbI+hBDVpM5CmQuZOCT4l1G7ytq3aDeuvaT7JS+UFmNP4sosQnBbycdD?=
 =?us-ascii?Q?in26IXRFd+lYM4nD4hgztT7FcxD/AuVlChPwL6V5+xeBHqk8tRiuhNjqlfKi?=
 =?us-ascii?Q?RDVtwHoGarEQnpK3R0+jZAqy/UpAAg33MrK28PqOv916NEaUajJvC2QTRcb3?=
 =?us-ascii?Q?cpQH0HTMAYzvFrsvuEfDGUwtfl9ol68aXzEpHgz0XOgVmCQaMKcZOSUPKRwR?=
 =?us-ascii?Q?gpUiD9hRKGU9HgVYs10/JcnV54df/MfNRkmycL7PZ39fg7ccjfFtUrAVm0wE?=
 =?us-ascii?Q?4piChzCHXIEguMscGKCZKHQP7vrGuRpVsZbe4/aBSKkAtb5URCfymv1n+hSH?=
 =?us-ascii?Q?QuynVl5+uAb+9KNC+lgEQoird+nrv8Z14vbpR8Bp05YKCCmBDuQxxHo7Zitg?=
 =?us-ascii?Q?GOcZC+kMQBjDQrFZ+ooOuH+PWwQRP5mIuXABRizdPUaxInxmnsTb2H3Egq4f?=
 =?us-ascii?Q?n6d+xAnbB0VRiHy1Sk4jIjlNPN9I2VoIqlWMIZDeV4BQmAAkliXiY2SJUgWK?=
 =?us-ascii?Q?b/dV1DJM8DN3EUGp3dNIxliqB0UTYQw0Xmd/zPRFjymA93lJfVqH8zbo0tFt?=
 =?us-ascii?Q?ubrLRDM3MMWm9AjdE5E6H+aDRgKGd1YFGUUmIwFhUB+K4qWm0PAG24jafc1i?=
 =?us-ascii?Q?AwLzD1qJzr0KduDNS+6NKn0p+LZxEHFfV/uC+756yk4oKTIHnU7LTI0wfTzO?=
 =?us-ascii?Q?Vw52WQOtvuSC5lTKfjM8W/+6lkzWD6xt9G0Q2Pkw4hRN67b31uc2+Gu4wd+u?=
 =?us-ascii?Q?SJeBam0GilCnySR+ivZ+OSvCndVC4xDaLlGjizERSA7EK5Y1K/pj5fiYBHRO?=
 =?us-ascii?Q?NzTNSo2knVQqHo20KzJ9QPpKvbfGYG0qQRNJoCQoGlWmxR/pefyH21R1YNYo?=
 =?us-ascii?Q?7VNMlsYs1LDuRuMhc9qt/rGyxMGDUrRWrIHaWt8bx2wAsAkhi/H/7tPoqDDB?=
 =?us-ascii?Q?G8lxbBQPsUzTyv7yV4NYUsk=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00246c01-fcd5-4547-e89d-08d99f43f2e2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 03:34:03.8507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjkBBTV8WxxwL2BEsotltbn8TcysljdT/PcECaiuSk0U8BgSbjbaIHLuEUIstWr4nDhQhnLhQEQ3/HFUJC8KfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4277
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
Cc: Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all, this patch series implement MIPI rx DPI feature. Please help to review.

This is the v12 version, rebase all patches on the drm-misc-next.
Any mistakes, please let me know, I'll fix it in the next series.

Change history:
v12: Fix Robert Foss comment
 - Apply code on drm-misc-next branch

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
 drivers/gpu/drm/bridge/analogix/anx7625.c     | 459 ++++++++++++++++--
 drivers/gpu/drm/bridge/analogix/anx7625.h     |  23 +-
 3 files changed, 492 insertions(+), 55 deletions(-)

-- 
2.25.1

