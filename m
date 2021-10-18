Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40202430DFE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 05:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193916E936;
	Mon, 18 Oct 2021 03:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2119.outbound.protection.outlook.com [40.107.94.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32C06E936
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 03:03:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXiWdwCVY1gDWL8ZOftLrTaCH13aci4bO3v13Se8XIUGh1zUAZuXkbwQD26v+I81uxX26M13k/8zxlJPZT7/LT1cTMmWR/z6WQjYct14kgjbE4AnFtb11movIDsdVstnVn+oFsow/85AmH3fFAcYjNXBAX41IKFK92eA5AVp2x1eICH5Dx4Jtwu3ygGNg06ZETd5cFIVwDjxKm63EVLSvnIxB403UTm1FOzM52NHNDTjokdvZMKWUPQujqXBZ7vEZB8QNxpex8c3as0OzsvlfL2nrU8UY7OWjMed14leRtdT8MtIw2fi/KSw3q3avY21gdjFDFMNr7ONZzFxfcn22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jm1yErAlZG4d+Ypt/Woxl4UH+n+0VhfEjRSo/ZCJBc=;
 b=jUzx49STxScgvcb+wuxmRPXcw8KZNOjlQT4bkg8E8jbA26iuSWThb7s54+bOO7DD5duoOZjELCiWp0uNMKqLdqdVFGxQ+2dPPOuWLCfdDh/nwsyy5dxqGI7qhKWzqqMoeRRT3cjf/DKsBCdkfDAfK7ERMtknQccBY/fByqegWL3jqLpAdXRdkot5n0QXUMPPBB+MLuFdhGqI4HMaqYlbXXMXf3CcxTWTx3TqijXUxXje+t7dw0IB2rPRgxu4maaRUMzLNTb9J2WOAMDR9Vz79wxafttn8/HmdyYDHUHjyvpzoImBXm139b1bwHKNZ3YUNrgJjWYY115bIjR2HuuakA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jm1yErAlZG4d+Ypt/Woxl4UH+n+0VhfEjRSo/ZCJBc=;
 b=y++oaPY8qqvV1Wgwhmi/1ZSRf2VGiQpVOoQDrLYg/694dSUfRXPHOQSvhLaVeHxpFJ8YgmdLfIr9tzI+omExz6GZmURTpysF3x7nATYslJVlQT6XwebK9oCOVwF/IGznX37qse/1/aQvnzQOYyiUtHzORy0/NAsZzodVnoLYMqw=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3862.namprd04.prod.outlook.com (2603:10b6:a02:ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 03:03:03 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 03:03:03 +0000
From: Xin Ji <xji@analogixsemi.com>
To: xji@analogixsemi.com
Cc: airlied@linux.ie, bliang@analogixsemi.com, broonie@kernel.org,
 daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, drinkcat@google.com, hsinyi@chromium.org,
 laurent.pinchart+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, ricardo.canuelo@collabora.com, robh+dt@kernel.org,
 sam@ravnborg.org, span@analogixsemi.com, zhenli@analogixsemi.com
Subject: [PATCH v11 0/4] Add MIPI rx DPI support
Date: Mon, 18 Oct 2021 11:02:53 +0800
Message-Id: <20211018030253.2055066-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628161369.git.xji@analogixsemi.com>
References: <cover.1628161369.git.xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:203:c8::7) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR03CA0002.apcprd03.prod.outlook.com (2603:1096:203:c8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.13 via Frontend Transport; Mon, 18 Oct 2021 03:03:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cecffa3-55fe-45c7-4c28-08d991e3cc97
X-MS-TrafficTypeDiagnostic: BYAPR04MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB3862C42C9327186EA5863F57C7BC9@BYAPR04MB3862.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1uqlJ0JnyGfkJ6gGXmRHzRmWehN73QCZiFeCXzD+1Nc7Fc0dIMF4gexFYYpzbPf5S1kYSNX7Kj2CJxgBurw5Nm58K6aqmlaJte8Qflp2o7HjesLPyP97yKN2BO8YD082wBuHQXrwVVNHi6aGC0J93msPP/jsEIuqP5IWhN749agqAhg9L9nowDdR6KO27TCfBUvOf48CyZmtGpEuTMfBXpnBGkYVVFhnP5PqFBd43iPAJ4sHOh4kGGIx/bK1tLNr6YRYCCycqfi/clZrZIQ4AyEv2h+Xh/xHDglj/KTf2VZoIvpCZKp03YyzyLbrgBMIWstrw+cY+tsU5xy4Zj1tvS3QbGJGXL6mLHiXRRq9hrgghnyJj3m6IKn3BNtGRn2BLT6dXsKginvbPqsZkFvVnlpxviWTWaWTsvI3HI0F9zo0Docm7wAvEE59XXJwuOfMdRQTPQMPHfdFqH5/Z+PTqfbbSMKt67ZGim3DoIGkL19qx4sVsXWkfw1LUZYqUKW10Bca3jcgfYAjQHiKX+iv2hqOp9GN/uG2sJM+Mho+I2kQlD7IVmv0/ASIgDk2lOfoPhkC7HvMr7VTob0N4IoxFj5wpw5ejYsHTO5uvLHfawVtPp1YwLrdeNApjLhDBJGRV0wfqTCGBqU+4QxsgtELN+spKWEDqRWNcbEr6WgaQeidy9wu0VnVCDurM/s9Se49n42aKc8pCcNJ7hWikaU9Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(2906002)(38100700002)(186003)(6666004)(1076003)(34206002)(6496006)(55236004)(52116002)(107886003)(36756003)(2616005)(956004)(26005)(8676002)(66946007)(6486002)(38350700002)(7416002)(5660300002)(4326008)(37006003)(86362001)(8936002)(508600001)(316002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+fXhGL2XVM3PEjHJXX6XuhiQaM7rz98hYQfi5QFwyYysEZZBsJkwBlUSwxjL?=
 =?us-ascii?Q?jvbu7GAwNCopNVtwI4j/xkitJMhau6haOHI3u3/GR2QyWi+xOgJK+M7pRgKG?=
 =?us-ascii?Q?YzvM2PXeqvETJ/aF8f0Cutq+SnXyAQGGZdd20MmjInUcB3K1JVpNr/M4g/QV?=
 =?us-ascii?Q?9rLOiEfiDU5Jq1e15d2rgSAfozzKO0RucsGJBdO4O4tkir8D07w3nYOnc22d?=
 =?us-ascii?Q?e0cd4JZPJEAPtmtYrluVQYS8NeN/idCqlmWELE7YdURSQKuWBTvWQRywaGxQ?=
 =?us-ascii?Q?slKBLHyRh/SUhH8WxpQc1BbuI1WShX5dVKjQX2e8Kr2kjAsy65XtFjKKV/1k?=
 =?us-ascii?Q?u+LS+F503e2xJKiJKgZEcLB+BXT5hlB7Fggd1SmG90GS+LvkSMcSb83orpVe?=
 =?us-ascii?Q?Q44cf7qkNEojFcI4dmvfa/PCN8Ur2CBZy/mTCyZyX10GypKvx1zdaS+neUBD?=
 =?us-ascii?Q?IjVHS/LJ0dwzpkUHBMdESJMi6UCieyowqlCSojTfaOTkajwNkntAWoypaHBo?=
 =?us-ascii?Q?1JVumFyht0UbDXjPnVn993P7zQprc0NlIBDYbSxatfVKcAO9C8SppHF0oNrd?=
 =?us-ascii?Q?LNNTB83w3Spk6BlGkmJcpnIBHjgYGBbyoRSxUrvTzJ83opu54DosZYbfR/2A?=
 =?us-ascii?Q?9LPREu9O0N6R9wGTSq51xBSkyeQELC2OrUdtqQGzpvG2yYaPfa2tmsPJeuqJ?=
 =?us-ascii?Q?Nz0X9JSGuxsNggyA7g/r5WJ2h3xUJdxJL3b66Di9h8DOF6Gf2RsFGObe88JN?=
 =?us-ascii?Q?uygtsSkj9X/Jh7WLYmiqlWBAwK0MYjH8BNdpnzQw4AyforidkgnGJwtO4onE?=
 =?us-ascii?Q?uEg59QZXd4VSuR4oHk94LxFConfYOKPIpbfCfaM8KDW9LhIIds7plyC500DO?=
 =?us-ascii?Q?jyaGuN4km8Nq7IMwBS+mVEzRVF3xNAC1lGLw9/cAG1ab+n/Sy1TIpwy/8j5S?=
 =?us-ascii?Q?1Of3FVKdRvnOZ7tWz4g6zudpA8FUE7PXuDJLQuvhwGLBr/Yhw2qYH5K45axd?=
 =?us-ascii?Q?NBeQIM/Aaet6gT8/CjZQnZKOnsUlV2Y0Aw5nJ1w47f3fYygf8ESha4e4LFYV?=
 =?us-ascii?Q?esY71R5SkYdgGYYysYGQWGLPej+jdPbRKzK34bqDsJYRTeZbw0qcyz0v/zzo?=
 =?us-ascii?Q?K7g0NNAZPvzpJ6MNEv1hmmdSu03VLjhLLHF+geUKyeiR0ubOj7B59RyQOgAK?=
 =?us-ascii?Q?1fBMSRg1Fpptt5ufXwFesZ6kPR1jWuJwJpL/IFtoepagGx78RB1qI0k+qlKP?=
 =?us-ascii?Q?1RMxSGO8Kd4P/jMO6p7/qAVon7gQtbuFIMq7IdEpnUh2kwAGGebOtV2WXeMI?=
 =?us-ascii?Q?JraX+zn0fCKE/FSZrJhOqSHW?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cecffa3-55fe-45c7-4c28-08d991e3cc97
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 03:03:03.0257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9mn3lbEuSdplwan3seHkRClJhCRcGHt/7xjQ8b1KhS0j0BEfGgJQvbwSGiAKiRhBeahuoLdkx2cHVXl7JCPOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3862
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

