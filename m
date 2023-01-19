Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8600673C3B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F7D10E96A;
	Thu, 19 Jan 2023 14:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7627810E96A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:39:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsEQW67ClmSLM/mCFKuioEhCNgTtpUaBnsdvEqPCkvs1Auz3IBf9HNjWCiT7KmJE7OAfDsU0teoVDlqxoZarW8D2BG5XF9MepKcRvz3/rfxsKigF7pzcjWohHqxQ3m96dwQWLrrycDn3aLTtZGCdJ7AWKHVtWQ8wYRda1gxu0S2R13AyW+CllYY2OyF5dE+WDxIlM5qD9N4IN3Z+UvkEFM9Y9VE7RgGSljCct7tWFDVyE4JdZI2Q7P5r91k9oLeLhSSZId+hGKn1z+2VF33R5hzviD8XoIbzdINxBB4SJhs17+nD7VJ41NkHvUmUopZfbs9ExSUHngaqU9k6/IEVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ul52RGV0p7N1ehkJLUjpEfApoc6QQClumVBNzHT854U=;
 b=fTdIjVzKRV+wKm426SNRYklDoko3xQIjOUC1OAhz4wo5sLfOQwYnrHWXJ3TgXzLgFu5t7a4awJOVLMLMxp7Il5PItYA1oRVTu9aeogWa+1dYN+2hWovEHJdjNaHHB+wunMjd/D0Cvt2FeyLKK4CSCkTO3ARVURuziHt2J23jOfzpwKh9VW9xb+GLmde2yuJ1kZ70sJtwNlNi4GezYV7Xlm/1dWcatgoXHtABmqcMFoq0abj3G42beDVOb+zNNLj4aVCyYWUphYkhID0CD2N/Cnyip0I8duf1+gy6wIdR5NlTrnZ9QTpTtFaUhIVhA7myxJdfBPChQKGo1sheOS9HVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ul52RGV0p7N1ehkJLUjpEfApoc6QQClumVBNzHT854U=;
 b=Hi7AE39CUR1x0JTysdN6+8KwpZM9Zrm2Gl7n/FD74bhs3Xdpx4v4aEP4EJrS9pi2TB1WR2Sb8f/xVjvghjhV9Z2T9sUs1izX0g7YwDBqxZ6Wcg4gKdkqJ+2GaSC4bnF86g7IhkkURl20utEUt2ymS0y/R923aDeYuQsNR0migPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 14:39:23 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 14:39:22 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/rockchip: vop2: add support for the rgb output
 block
Date: Thu, 19 Jan 2023 15:39:05 +0100
Message-Id: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0152.eurprd07.prod.outlook.com
 (2603:10a6:802:16::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: a900a1c6-3d0f-48cf-4843-08dafa2af4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wiX82gcEzN1hg8AHI1k1lVnuPYj8cEkwAYK2Mh2EwSi12pRndW/nZLoWzgDy3pMCRX953VKmkCksh0/LrkhBuNL/YfS+RvCtLXE35TJ+jkGRlIv9p3MUz7iQS5v6vzbrIDh7MDn71zlaWfpR3J8BmSlD2S9qEjn6iVY3sbwrcia+V5NsoZgPez8bkSJH+GXrJ1lRIaRIC/qJ9J8GPFur2zj4cK0M9ngtq5kSKsEfRyfFQsz1pX+7jp1X5l9cxq1FjORSHaaTau4p6cfaRnr2ctdvjx/9sLHG140M4/5lHc3TuP9/kDYgPByNEUIUiHkUjBWTs5dWYRFAQsGuybnuxBx6CEVLy6w1U/Ty4GY61shdroxAAqziP+rEoK7riOxyXRmM/Zns1W4JH5DUgmudEPP/xV+yI+O94Vg+NzgeN67BCgzAnGisuH0rVeEawvoxdcyBOC5ojclaPGhjsE6BO0gjt5F014vfNG6QtPm2Rrxzcsd0tfeUelMWOIGmwwNYySOFeFoCRXO/ElQKRVCd+Rwjr/Ewd7f4F+uPFU6RAarLjZ7MQ3zznU/m8tKMJxfHOPhmotrmop7pGL1vKrj3U0dh/33/mtKU0P1D4AFcYBrscUW7yL1Sq7sMXwXbggXnX6xFFRBjeqk+E8CEupSq5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199015)(2616005)(52116002)(36756003)(478600001)(6512007)(8936002)(186003)(6486002)(5660300002)(83380400001)(41300700001)(7416002)(38100700002)(44832011)(316002)(1076003)(66556008)(66946007)(66476007)(86362001)(8676002)(107886003)(2906002)(4326008)(54906003)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HfAos/ui9H3WM5Wfme8zewbwzygS9Bei8txFcX/YOf+jyyLn19I9FRakh9cD?=
 =?us-ascii?Q?/5Wpmja3WbO9hIwzZc2LfgMZ3ozFRhAaZhsW5xt/AZaJtBLTjyH8tEumE7aT?=
 =?us-ascii?Q?cFFDWl4/riuRPpRY+a72owPtkiMJ+oLK+QdKYz8ND0Kkdxq+ZreMmTQSleBD?=
 =?us-ascii?Q?GOXrmDJL8cEOouMT5NRfJ4d6Apguanq9Xh0CDJ4cZDozCoyC9MFAFZC203je?=
 =?us-ascii?Q?KH2QsFrvczBK5uLTLLeUQSUYHfaRLnFQLR37I82N4MkL6WAXTq4h/y0QHvJf?=
 =?us-ascii?Q?66oEiBIqgpkOzM1r0bljfdsiVge1wqBk6NQXoo6DElOltRkt3US5sGNSEjRW?=
 =?us-ascii?Q?cqPu6AuOzm/qkyTV2AAt+VV7+mx0OKEIojQQhdh+o7qjCCQIKvvD9+C6vhBI?=
 =?us-ascii?Q?HhSuSHHjP3I1L9BwmXUIjWZwXwQ55rAE+ZnYxeGSmcELS9C9zCYcvdRlo+Im?=
 =?us-ascii?Q?xmnNg6m1sky9qKT6hEbcBid/dKT7MHNdMlo94zQBpQ8plPUT2bQp8MZZt9Ah?=
 =?us-ascii?Q?u+cxgLNRLq3omvj2RlP+CPc1tRk26P2w+afjZuxmALqgoYs1s4b0JuwINkmy?=
 =?us-ascii?Q?AAhpeJ9AV9dfPtrYopemyk+crtYsikjlwPsVoNu+0/PPRVppXYgb8/fhoXiH?=
 =?us-ascii?Q?ILbtur5ofTfnFSViRxOY/GKPJsgRDAON6/sZJCGMO6xSFR26B94svzjBNVv3?=
 =?us-ascii?Q?h9zsKyRP6BYHJOaWxNWw8o55ZFcNUu3GpUKUgal1aCOhWWSDtf6ObELUwtlr?=
 =?us-ascii?Q?zRySXqMZmg4tPUPvgcIoZmj6gSbq2S86PqVVOqPl0WMlSLBdD4EgQuSJalfb?=
 =?us-ascii?Q?ZpDmg07SowAkgoN8pqUzPc40G/uioztpMMElvKLnz6k4aj4OM7oZoCeGrEhU?=
 =?us-ascii?Q?ISSRMe9UrSSweODF18Aj2a1/PSer/luQUjGdah61X+rfy1BxYwj+C9zrF+Of?=
 =?us-ascii?Q?KtaFEFohRIf0LfRrsmjUVjf/8EkEv228LoK/KxYqeE7tvLgd5elitu8HRVhM?=
 =?us-ascii?Q?bPy8iqnN2t0wPjwbCDRjcAMPb6RfB4k7VjM4jbOTmH3VEKpzCzW9ArbPdR0L?=
 =?us-ascii?Q?wemoBATBZSJ93cOYZsWyxRmm4/kN4D8gmBZJVhni5qAjg76465ISdyEy1kWR?=
 =?us-ascii?Q?pNo8IERdo15O7RH5mZ4FiUXWp83W5N0oMCNTL7nAxq4CYQ4k13gBvpCOiFOH?=
 =?us-ascii?Q?FrycatN/oprUdJ1aaDkN7NblgBVflD0hTgEh1UYdp0Q8cy/eZIx5goyP/892?=
 =?us-ascii?Q?BiNihgdswiYwnn+nhqtWrPGDNjoxf69T4w9w04riRnAxcOe7a8iCt2ryapas?=
 =?us-ascii?Q?ODgt4Cw/ZyIzQ/SqiyDpP6l9Nej7CF4wUQST/697Vrol6kdWK35bfoKaQnbT?=
 =?us-ascii?Q?pL3xyWOZGpsy/MMIFtS9Wdx1hY2+tsS7ahTiJuYlKRXjuFCv4mBKxi4fUlOa?=
 =?us-ascii?Q?AGQg6BwGSizcX1+B79EoTpz3zRdTH5LMO5kf+rozJVIZW/mgEQy7UC+nECXG?=
 =?us-ascii?Q?8O86yqGgJ3Pk9U7KFYyhKnKECMztucqNbDJeTVDRHcPm+4OaThGjRPI0ldI+?=
 =?us-ascii?Q?+qVA4DD+w2ia/VR1KWHAO9KM9DxNjeEazNnb/1FWZHZaEYIym7P4Hsomwqdo?=
 =?us-ascii?Q?EHjEeMjYIbP8T4Tq6LkHaLJNeQMx8rrQuzAnNhM0fZ3gBAI+bLaJemYGEHcn?=
 =?us-ascii?Q?4j6Otg=3D=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a900a1c6-3d0f-48cf-4843-08dafa2af4bf
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:39:22.8875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BD9NC48DusZ01J6A4K/Ab8Riamyh440V3OgwMICR1DVAy+BkYkSJZy2xB+XcsKDTvXxcJDSAfymCUIJ4lMOJSMEUmwlELzKnqfi/3BhkEMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
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
Rockchip Video Output Processor (VOP) 2. Version 2 of this series incorporates
the feedback by Dan Carpenter and Sascha Hauer. Thanks for your comments!

Patches 1-4 clean up the code and make it more general.

Patch 5 activates the support for the RGB output block in the VOP2 driver.

Patch 6 adds pinctrls for the 16-bit and 18-bit RGB data lines.

Tested on a custom board featuring the RK3568 SoC with a 18-bit RGB
display.

Looking forward to your comments!

Best regards,
Michael

Michael Riesch (6):
  drm/rockchip: vop2: initialize possible_crtcs properly
  drm/rockchip: rgb: embed drm_encoder into rockchip_encoder
  drm/rockchip: rgb: add video_port parameter to init function
  drm/rockchip: vop2: use symmetric function pair
    vop2_{create,destroy}_crtcs
  drm/rockchip: vop2: add support for the rgb output block
  arm64: dts: rockchip: add pinctrls for 16-bit/18-bit rgb interface to
    rk356x

 .../boot/dts/rockchip/rk3568-pinctrl.dtsi     | 94 +++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 80 ++++++++++++----
 drivers/gpu/drm/rockchip/rockchip_rgb.c       | 19 ++--
 drivers/gpu/drm/rockchip/rockchip_rgb.h       |  6 +-
 5 files changed, 172 insertions(+), 29 deletions(-)


base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
-- 
2.30.2

