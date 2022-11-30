Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D5F63D769
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9317010E45F;
	Wed, 30 Nov 2022 14:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9F510E452
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCC90ScobnqVj8B2UdEMwGHDbPerjPZW2EKz/267qoBvpjJ1jNwH3vi4O1CW0BdZd/4/NZ05zwcMzIn7457UbXY1dKak2CXcX4oeQ9OZ1kqhmTBDMrnE8HMYacBnFN7Vle0iX1ScZhEG1Y9zz7tP2uDvpBH2P/6mewwZP4bZ4SmOuuqFOBaITu8Q91NLwI7eBZY4JS/t6fvM7iEGvAloCG5VwmanBwtdFtwH7vFecZ9O4pqYzFKuFUl2lAnYVFT038dzO2lY5atniXPJUchQR17iBmt6i0bVYuV4lpG9U1uGTMG2A9+CjuTbQD5eGPHpzHWq5UN02kXurcqlwh6i5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1sCCXDsdj9s1Xwo6nXOZ9JgXum0ndoJTAwzspwTmh4=;
 b=h4Hf28OO1+lSWhHBDHgCtDzPeD1jskasfrXQ8j+Ku1jUMFB7djTJJV6XydRFOpexAM1zfUFFZ6n1+hatblfEGWU0KI5kHDwlgdZxd0zSSrGyY/hMPRhFhOQH8pb+Dsw/4Y6IYIIlW38hqQYfS3zBolhsXFrEI66Pxcg89CPf4oftT+LDsq/nVSNUpJsIaFKNRi860bQL7CpQBIrHLf/Cmg3lexF4gJqMz64A3Gt7h1lHjmddg4M4ifRfw5DsaiIWKCv45Amv8wlUl1jAPt/MwQhll+yc7lno0JrzUYuyoZJniPhpk1yprVVw9c2I+I8V+HEhOIgL+i/3NBhjigDYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1sCCXDsdj9s1Xwo6nXOZ9JgXum0ndoJTAwzspwTmh4=;
 b=IEmO2WcmPYeoBhWhXZusV02TLt8P7EvbqCN7FTqD8At8pmLvZ+8mnWzCbSHGNTenBSSFXHOR0fQu48Gj9mdyVwO2SP4Hv6yR/3vtRK2HlCgKuSybYLBgGOHZoY6jVqal1Afic/x1rQinKpwzZrcn7qcoR0Wl3lDkfkpU2AOniuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8695.eurprd08.prod.outlook.com (2603:10a6:20b:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 14:02:45 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637%2]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 14:02:45 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/rockchip: vop2: add support for the rgb output block
Date: Wed, 30 Nov 2022 15:02:12 +0100
Message-Id: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be4e0ef-cef9-4b89-0888-08dad2db8e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /vM5owyOipouPsNpSzABKAPj7TVEGGNfGYGKwOela2gNcogoVvGzKciEl9xiWgeUdTHqTEfcQCE6iKPqXjRUNnQdf5ndK8gBYVsNjc1lFRdcXQTIuxtHW7SzOMqXD4pS5+m9B/HyAq3wNURkt/JCl4+yFyTKZAvUVXFTSkf5g+8MLmQAm/b1e/nPpU03CoiW0PdvtCsgBHZRY2nWIHGtj08me0SD+plgte6bM+KoaA8FJzsLptmp7NlN7V9x6Wf4Y3vFRNB7L7tk8LHRyKgAurS/1mFc3di7PMFRXDsVcbdEtYydtypmFpAYpPgG54YHcPH32DJ2tLD8pKtSHXzSWkpboNln4CB1vEUGOZbAk/HnJlHorK4NbKRX3q82QkQ+XNEwIazzxN2uQdFqRcc80KP699d/FhnobAiy6iwLS/WFlrWhjKrcBJ9V0iz7rGx1y0po0I8Oi+/mpOdTmcInXq8xAUnIgTR5QV9K13N2GzNyTs1QQ2GNOGjXb7qixtMt2+JDdSS29ofqh1dLBKttm1CtBaZQp6QMedpF5hYP45YbD5WjEUzqKtfyvB+EMzyqPOQsjwpFvG/EE/EOn3U9xenqfmk/j5ijP3bOdntIEczt/UHzvtNsUwD8z/KG2+7dI8rFtZcFu0NVaHLozEqz6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(451199015)(38100700002)(6486002)(54906003)(478600001)(316002)(8936002)(2906002)(41300700001)(83380400001)(1076003)(2616005)(86362001)(6512007)(107886003)(6666004)(36756003)(52116002)(6506007)(66556008)(7416002)(186003)(8676002)(66476007)(44832011)(5660300002)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1kwsskI7IYUxB+p3Lf3xt1IrvunIQgHTf7wEIKGuEwAFb4EK/iuhtP4Zbqez?=
 =?us-ascii?Q?OYnCvutzwIG7Pj6qfSkudN1R2vatB97VJDxDBT9VttU7MWM88PnfdCjek+L9?=
 =?us-ascii?Q?+NbetyklqyA4J4uLLmzUelXNOUcYeskEAhJxUxu5h5iezkh5DLPb1x8YRJrO?=
 =?us-ascii?Q?tTgZWMmUy2ZxuwgQRaJE/tjcJG9KHcET/w8HxRdPWQLYYuf/zXwTfGxmGH3J?=
 =?us-ascii?Q?urkxoxPZXwAlyURb+DOgmRvlCiBhez3Gq9p/Qeo2EDFzxafmBVUfL1Z78+Qo?=
 =?us-ascii?Q?hL9toeQVgtzCfUhVgLcM5GVvyaPYlRJiAALhm1IBImnpJNftsFr19JpbobUq?=
 =?us-ascii?Q?tZXmzVhaYr2jhyi/jfiuAoOaI1OXWTTYTH0dcj2nLPkSnkEBCzFcvkac8jmB?=
 =?us-ascii?Q?DP6bqJ6tLGEsadJN77vPDEhxORAqZ6134yRGKKd3xq3yxeW9yhbw6skZ0UKX?=
 =?us-ascii?Q?OTC4V6fikmiUOWEVsF5Oh1qj/EAx4pIr0goSMCVmDiDksePO4l8ar7TEiEyE?=
 =?us-ascii?Q?WBt2raKsFzMNcWykieJMpB1kENbj+rkqUO86NweK3npftmdyNQO+ftfbvidI?=
 =?us-ascii?Q?SguDobRHUDhKsjbF5xmnp4CmnFZ36UaoPSWq7Jx91+tc1e+5/4CS8TtHGIcY?=
 =?us-ascii?Q?dTkWjXJpCxwCRjtx8o12N6Lj6GYLBXqW/5Y3xdnU3bqzvv1p39uk4wgALzEx?=
 =?us-ascii?Q?cp5fosn22TRKoERPVu6O4FficBrpKiG+l1wmfTuPMg5rYzZnq891tIKuwdQn?=
 =?us-ascii?Q?/+FSWR4nVrkqEO8El2BuCqZicEozq6kru2juATopLf80b0o+pzG7EdJCrsH/?=
 =?us-ascii?Q?g7VK/8W60drNcPTnrONUjOijGKqIuZo+YqrOI3qPdn/jf+GR8GJE4ONM4gI3?=
 =?us-ascii?Q?XW8WDXtI/jRsOqO3KA0wN+bNuHrnp+EZL38XdFGs2U7HICZHXdw1BXalCN2K?=
 =?us-ascii?Q?2k9VPCAhFez4tfliCS74JHacyt2QbEy7ARj03AppC2CsVmb3qZZMIXohHyyc?=
 =?us-ascii?Q?yofrlHgdippXucKOlFTZjc9me3q1epMoum2lDcVbrKSBHaEjXlZBFFvzxWKB?=
 =?us-ascii?Q?ZoHeIw/hSOb2fWZNFyE5UQxFYzAgKKrqfzw+dUXWy+iim0PLqDrcJI8m8ULJ?=
 =?us-ascii?Q?jmwqYlWCUGRyuNjF3LZpENN37qKn+K5FVMq2qCo4SPO5NuGHHqSkwVxrF5F1?=
 =?us-ascii?Q?dYHgWWKyaJJhDrHKphQtamrKOzAPLSksKfjDGOkGvaQnIYMPThPusIEfZQUa?=
 =?us-ascii?Q?nVR3R7cYCQLPd5vsEBfsu3iHZOSVnFalW47gMPkQsnXrE+acnIYjOYUJFiCe?=
 =?us-ascii?Q?9VCUI8msxVrt2tQo+moWkWapo987d6ZG/4yZ1QPNtprR1R+viKy6HiF+v6lO?=
 =?us-ascii?Q?h1+KK0fP67PmxyO9Jx7oHt8EBRpmoKJp3A1LlbR/cQfW9ScZCVGOBXZVXLbW?=
 =?us-ascii?Q?G/jT9R6ICDTO8CiqQvn7lPEtY5H+YB1SmxHIJrqEh9IW+8Vf+aqtyMSEAlyZ?=
 =?us-ascii?Q?ugw1+M9vzKWnv4rtfNXF4Cgj613w1bf+lDX+cxJyZdxRbU/LHRGoqAt4EDTm?=
 =?us-ascii?Q?GbUKLzd4xlsDGpgTxAcwsI5UOISgQnMLmyTAHiIQ2BzqTubrzDL+H7TNKdE2?=
 =?us-ascii?Q?HZ8dhHCDczAvZ/JYiFsV6xwoliPM2O4p/oEZ1uhBL3u4IT342NNG8Wt57Tc5?=
 =?us-ascii?Q?V6IlTw=3D=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be4e0ef-cef9-4b89-0888-08dad2db8e71
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 14:02:45.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNEwS2Xxc9dZfqP/iFIjAb6UdkP1KVun4kZm6MMAjsFTxlFpNuPi8EuJkhUGiWVStoy/P7/XMUM1KUjpEHAA0JlNuz65hD1VMy3cr6aytDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8695
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series adds support for the RGB output block that can be found in the
Rockchip Video Output Processor (VOP) 2.

Patches 1-2 prepare the RGB part, which has been used only with the VOP(1)
so far.

Patch 3 is a cleanup patch and aims to make the creation and destruction of
the CRTCs and planes more readable.

Patch 4 activates the support for the RGB output block in the VOP2 driver.

Patch 5 adds pinctrls for the 16-bit and 18-bit RGB data lines.

Tested on a custom board featuring the RK3568 SoC with a 18-bit RGB
display.

Looking forward to your comments!

Best regards,
Michael

Michael Riesch (5):
  drm/rockchip: rgb: embed drm_encoder into rockchip_encoder
  drm/rockchip: rgb: add video_port parameter to init function
  drm/rockchip: vop2: use symmetric function pair
    vop2_{create,destroy}_crtcs
  drm/rockchip: vop2: add support for the rgb output block
  arm64: dts: rockchip: add pinctrls for 16-bit/18-bit rgb interface to
    rk356x

 .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 94 +++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 50 +++++++---
 drivers/gpu/drm/rockchip/rockchip_rgb.c       | 21 +++--
 drivers/gpu/drm/rockchip/rockchip_rgb.h       |  6 +-
 5 files changed, 147 insertions(+), 26 deletions(-)


base-commit: b7b275e60bcd5f89771e865a8239325f86d9927d
-- 
2.30.2

