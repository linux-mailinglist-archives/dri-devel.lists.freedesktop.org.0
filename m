Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B2F562C48
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F345810E23B;
	Fri,  1 Jul 2022 07:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20061.outbound.protection.outlook.com [40.107.2.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5026910E23B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 07:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSaft92XWbpEltESWJRcq1BpplL1XDPyTZAJFvfLxELVc/+KeeA3xXh1sE58VSgE7toQcPybqK8iDECvkjtnhW3mTafxITgivP6VsqroYTNH+UNeiKee1tGvaSXpNVPLvGQcb0PbXp5NfbsBA5k1oaJfwtZ1Lm2Dpn6we4O50Q8dvJbWaB9stoFNuw5FWr/tu1dXmiBjTlMEJn/0+dJfems8t4Y0LeY2mkFnOqJyUfNt0obuXafIQM7oh7737iM224yyjRMzGGSepFieR4ghxL15oKkYB86/3rs9arfLsKvYNpvXsLJMe1iciqwl0Y6Sl1X7YZsvE/MxYBzRt18OiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWzQ5YDYDuhod+ndGlr/6xUYKOW180orx78DH0n2MjU=;
 b=RYXJ2GsIp/gfsctiW2+wQiHNS7DzV7sDw6TMCU2LEiP5vKQbaGZs1pdXyQwBWGClPdORUGkXpFQj70df9eilaVZUOmI8pncFVF/h/7/SM6f+o8AocJn4qRF2phL1qzN2MGGgZJbQSSK0vXeKGjwt9GgJAwiuImmJpb1S0auwmwhUwFBTir79oQJCoIAJ0TOIsTDB/qbzksuo7a69b0scb59ORtBZmqHwYe2fovXJQGYRnmgFWIwiR8UUXG2+3TscCVxVgaKr5L+4ZYvepDof8uhzF64vhMLhkuUANG7RucAXX4rbZYvnAP3VockpwzlryV7GzrpY7JYylNv+n57ksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWzQ5YDYDuhod+ndGlr/6xUYKOW180orx78DH0n2MjU=;
 b=qmsrlI3WMYMoptgERKjL80DEEp04ozT9KvvCEHbTA5XLcZPZh2g6ZKWEEwhPDXBeZ5BURba5YMRVC/A68ugRf0vAMn2nFIrqP6HVe7Uh10jQaOQ9rYfFke+sxMzAcXDjDa7RB+XQ86HZsy0H19C+qgBWMKdD8lVQDaKlKdARF7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB6446.eurprd04.prod.outlook.com (2603:10a6:803:11f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 07:09:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 07:09:32 +0000
Message-ID: <bfcbbc3aff61f373a238c5ecb6a996eb963831d7.camel@nxp.com>
Subject: Re: [PATCH v2] drm/bridge: imx: i.MX8 bridge drivers should depend
 on ARCH_MXC
From: Liu Ying <victor.liu@nxp.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert
 Foss <robert.foss@linaro.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
 <linux-imx@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Marek
 Vasut <marex@denx.de>
Date: Fri, 01 Jul 2022 15:09:19 +0800
In-Reply-To: <123b8767-7ea4-e6fe-6d47-0f2444a88dd9@baylibre.com>
References: <42c542b53a1c8027b23a045045fbb7b34479913d.1656072500.git.geert+renesas@glider.be>
 <b625ba83-fee9-b668-09db-976cb3bef3ca@baylibre.com>
 <9f5b511708ca9b30ef101a46a5d1b76f03b2c4fc.camel@nxp.com>
 <123b8767-7ea4-e6fe-6d47-0f2444a88dd9@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0079.apcprd02.prod.outlook.com
 (2603:1096:4:90::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4fc675f-5adc-4b24-ac64-08da5b30a564
X-MS-TrafficTypeDiagnostic: VE1PR04MB6446:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEgxRV3AKCyo6FGrAR/PlKSv8vbtw1w63/92X1Gcd1w7WcurSsAKXb14jYG97S/jnmUdZlLLej4veZTwpvwCQKKhHvoL7G0Si5yD+t4DkaSYgj4erVBEYw7mZ/zv3xNeE1ktbd6jdzn6yst/hRSMVa4lzdadsA1BELW+xcqJR2LbC65Tha57BJuR7cBbKJQ0rrng7feGos2AfwrZxvE+D823VSmSP+TzF04usFj2KvmiNbK2QB9ftvGxaWLXG6WVK+Glhq7amUrQOLJJe4DCugVsefx2FL13dIzJJHP5I0u05Ly2at8hXhPZQGzJ17ew6rLYW68fjPvJVyGPQx1b4fNNGrL+WOO/LbQbIzkBqyfRUt64rPTmUxQq2a6pYnD1V0eZVmZLmopSEfTnoW3Z1n1bjpMRnmgE6c2FBpK7/hkGHQ7N54DJCZMKjg/7BEOmhXFZ51SG3xCtaE825YkVrDydKbMYvavPFpBEqGZ/wQ03VHZa24ztt8adWecLFAgrrWrqySx3Q2JTgnW7hSid/iUkdX5ZjSa8Hf2pojSgO/LEVLzU7p97K8AX9sLInyBTT0O1BiTF7qUsWyQ8ijy0sA+bFGDHIcn6TBE66eHwbNGbyE9oTw8k+FSL6pGTBzvOnzjhMFbMaz1mfnH0Jb6a/DEbsU4ZG1ra3njGtbf3ENlQenfgKIxqeK8PuNfxbF4L26np3G+rXq73eB/nXV+X9vQNmyl5McG7CSs8y/UoPUCBjAckTeUwd+xzfOPO6lTZac9TyZb2CJyXk3TVyJklwt5uyRvlPOtpPUfyZvIfeHu272Td8+IC6uL/4S13Y8OZokMMvLa6r/tTpDR7tooCJ+qnntL+oplT3UKOR4qewSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(8936002)(53546011)(921005)(8676002)(6506007)(66946007)(6486002)(26005)(7416002)(316002)(52116002)(2906002)(66476007)(5660300002)(110136005)(478600001)(6512007)(38350700002)(6666004)(86362001)(38100700002)(4326008)(66556008)(186003)(2616005)(36756003)(41300700001)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGt5bWhRWEVaNXhQOHZ4ejF1bjIwblJVTGJLU3Vac0hkYmpyZWd4Um1XYUdV?=
 =?utf-8?B?T3ptck9waW9lc0ZiSzZPUlo2dm11aWVJNFExRWtoQ3Fka2luUFAzQlBCNWNM?=
 =?utf-8?B?MjBPc2pUSEtkTXNVaHRraHFQSDRHN1kxN0NvTzJLMWVxV2dhb0UxWkMvcGIx?=
 =?utf-8?B?a2xjQzJ2U0pQajNzbXV1Y3ArT2EyQ2h0WDR0cXpLVzVxTm8vTTh1anR6aHNW?=
 =?utf-8?B?d0V4eW5zM0pFT212WFFET2ZHMXIveFJudjFFbzlhVDJmNjMzR3JWZlBRSHVZ?=
 =?utf-8?B?LzFkcVZVVVZ6ckhEUW4yeTljK3ZQbDIveFJHUGh5emVGQ3BzVStLNVFMTUlZ?=
 =?utf-8?B?RFRNcDYzOTZjZjJUamtEb3AybkdMeDZndk9oZk9jYjA2N0Jnc1ZZQnQ0QkFO?=
 =?utf-8?B?bUtScTI1L0pORWtQTW9CWFdQc0lmR2daOW5iaDNlWHE2S1p0L3dUeCtDVFc5?=
 =?utf-8?B?ZmN3S3VEUXErbmFaSWw5bnVUbWZmaWh0T0hZSUFqbE95bExxUzA2clNzTUVa?=
 =?utf-8?B?bjh3NHVaRlNEazk5d2Y0TEswT2Rjc1dvd0Q2RmZSb3NQTWo3eS9VY0YrenRn?=
 =?utf-8?B?SXB0YWtBcWJUQ2VPcU9aRjRmc3pKMjhJczhDQi9ienBxMW9ZMDlPZWxxNHhr?=
 =?utf-8?B?dUVMYVdDTXZESEZQU0lKVG9oVWFTRVUxVk9IR2VjcEcyNlNLeWhQYmg1bTBY?=
 =?utf-8?B?L3hBNGI0ZW84Y3dWemU4MzJoVElPMXZtQkRqL1U4ZlB6dU1jMzFVVVhDdFJk?=
 =?utf-8?B?SHd2VHZQelBmVEwvMUhmWFVBWEg1cDJTZjFaa3hNM3RXQnNKOXlwcXJDNEoz?=
 =?utf-8?B?T0NRaU9UTzA2NGpNemR5cTNwWTVqaXB1c2QrMjlyOE1qYVo1V3RaamxGUDFq?=
 =?utf-8?B?Kyt6aTlqb0srU1dSTDFMNVJ5Q25lYVFCZUhpKzJhOWpCK0sxdFNscUlWRmhr?=
 =?utf-8?B?UGpJS3czL1lyb01VZXFBSStwaTlydTg2UU9XazhSeUFld3FPRmpPUFlkVW5Q?=
 =?utf-8?B?bFl6NDFqc1lodE4yZHc3dWIzVHZQSCsyR09MSWlhamNzUjU1R3MzS1JmSWgr?=
 =?utf-8?B?SXhPNUNVeXB2VEVyMGF6cFJFcnMvdDZ6N204YjlXOW5NSFZTSkp1Wk1sb3ZH?=
 =?utf-8?B?ZWhSSFRBQVFDcnBRWGZkbG85Y2dSU0tOOWh0dndQMUlqdzByWkRMVU9jaWRS?=
 =?utf-8?B?WHZobnZPU1l5alV3Q3Y5aEZ6MnRoZ3FqQXoyTjdBZDVHV2tYMUhzMmZ5WDMx?=
 =?utf-8?B?aXNQMmdRd3B6NWNUMzV6MGN2VE13TUpVNDBDYjA5WkZySW1iaisySlFyRXRv?=
 =?utf-8?B?bHVaNEtackYvZHVjSDJ2YjRicCtLSENFTVRzbW1qQzY5NVI3RzBINzUveDZs?=
 =?utf-8?B?R2Y4SktKU2ZwQzlRaWNqZFQxbUdPUXZRM0ZodGRON2FQbmw3MmU4US9YcVp2?=
 =?utf-8?B?NSt0T1VLZVR5cURTWS83aC9BNmNHWTB6SE1md1dJMk1hK2pGNGFBWTRldy9X?=
 =?utf-8?B?Wjh2eHBwMlc1cDVNMklMUXo5VjEyZnN4d0xRejQ2UEJYN0RzbEpkWXJiNFBs?=
 =?utf-8?B?a0llK3pKZDJmWXAvR0pyUkZ5Vk4vSlpCaTI0YnE4bG9SNUJ6dkF0SDBKMUJ3?=
 =?utf-8?B?UEdTVmYvNUlCS1ptck93Zm5NSEFpWXJtMFRDeTZOcTJpY3lYT0E0S2Zia3ZX?=
 =?utf-8?B?KytKdzNyVnA0OUZxcFhEYjcyRWp4a0tiMnNoNjFSRVZDbmo4QVNNamFFbDlq?=
 =?utf-8?B?Z3llTytMS05Fdkh2MXQ4dkxuZnVxSlZEUWRuNXlFUG5uRWs0dXdWbld2US84?=
 =?utf-8?B?V2RERFJiWi81eldpYTBKdUpGamFIQjBKdzlNeWtkY0RuR0N6ZEtsbTU4amg2?=
 =?utf-8?B?a3ZZU0QrZ01zdVBueGhpSmlPTGJnVFJuMUh1K2FLVU00MmVSdVZaeWRLUU1z?=
 =?utf-8?B?UW8yZ0g0dmpFV1BrOERoNk1OZnRBd1VQNElRTkpnUGNBVnhKVE1ZM1ZhRFQ5?=
 =?utf-8?B?bU10TFZJcVZXMThsMFcwMkRSeVFqTjQ1UTNIdnYyYU5SaDhabWU2cGVwcXpk?=
 =?utf-8?B?eExOYWxvb1hFSXZuYjZXNC9OSXJaMU1UeG9tYlNRN2VBWVdDRVd4VmpkK2Q3?=
 =?utf-8?Q?BnZGVCyv4jDigXJza64vSm1N3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fc675f-5adc-4b24-ac64-08da5b30a564
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 07:09:32.0398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfCWRCUheRuB0gfRn+qNFAhqh6x/Tj6zWrAQRRxeOqSFMYElcvcM/BybkRkl2dutRktWnoR6WY/QSY5fhjNzuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6446
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil, Robert,

On Tue, 2022-06-28 at 09:10 +0200, Neil Armstrong wrote:
> On 28/06/2022 04:31, Liu Ying wrote:
> > On Mon, 2022-06-27 at 14:22 +0200, Neil Armstrong wrote:
> > > Hi,
> > 
> > Hi,
> > 
> > > 
> > > On 24/06/2022 14:10, Geert Uytterhoeven wrote:
> > > > The various Freescale i.MX8 display bridges are only present on
> > > > Freescale i.MX8 SoCs.  Hence add a dependency on ARCH_MXC, to
> > > > prevent
> > > > asking the user about these drivers when configuring a kernel
> > > > without
> > > > i.MX SoC support.
> > > > 
> > > > Fixes: e60c4354840b2fe8 ("drm/bridge: imx: Add LDB support for
> > > > i.MX8qm")
> > > > Fixes: 3818715f62b42b5c ("drm/bridge: imx: Add LDB support for
> > > > i.MX8qxp")
> > > > Fixes: 96988a526c97cfbe ("drm/bridge: imx: Add i.MX8qxp pixel
> > > > link
> > > > to DPI support")
> > > > Fixes: 1ec17c26bc06289d ("drm/bridge: imx: Add i.MX8qm/qxp
> > > > display
> > > > pixel link support")
> > > > Fixes: 93e163a9e0392aca ("drm/bridge: imx: Add i.MX8qm/qxp
> > > > pixel
> > > > combiner support")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Reviewed-by: Liu Ying <victor.liu@nxp.com>
> > > > ---
> > > > v2:
> > > >     - s/i.MX8MP/i.MX8/,
> > > >     - Add Reviewed-by.
> > > > ---
> > > >    drivers/gpu/drm/bridge/imx/Kconfig | 4 ++++
> > > >    1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/bridge/imx/Kconfig
> > > > b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > index 212a7b0e64fd8b5a..608f47f41bcd1c81 100644
> > > > --- a/drivers/gpu/drm/bridge/imx/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> > > > @@ -1,3 +1,5 @@
> > > > +if ARCH_MXC || COMPILE_TEST
> > > > +
> > > >    config DRM_IMX8QM_LDB
> > > >    	tristate "Freescale i.MX8QM LVDS display bridge"
> > > >    	depends on OF
> > > > @@ -41,3 +43,5 @@ config DRM_IMX8QXP_PIXEL_LINK_TO_DPI
> > > >    	help
> > > >    	  Choose this to enable pixel link to display pixel
> > > > interface(PXL2DPI)
> > > >    	  found in Freescale i.MX8qxp processor.
> > > > +
> > > > +endif # ARCH_MXC || COMPILE_TEST
> > > 
> > > I was wondering why those were added in
> > > drivers/gpu/drm/bridge/imx
> > > since they are specific to NXP SoCs,
> > > I think they should be moved in the right drm imx subsystem
> > > instead
> > > of this change.
> > 
> > There are 2 directories which contain display controller drivers
> > for
> > i.MX SoCs:
> > a. drivers/gpu/drm/imx - i.MX51/53/6qdl IPUv3, i.MX8mq DCSS and
> >     i.MX8qm/qxp DPU([1], not landed yet)
> > b. drivers/gpu/drm/mxsfb - i.MX23/28/6sx/8mq LCDIF and i.MX8mp
> >     LCDIFv3([2], not landed yet)
> > 
> > Bridges added in drivers/gpu/drm/bridge/imx make it possible to
> > share
> > bridge drivers across display controllers.  I see chance to use the
> > LVDS Display Bridge(LDB) helper(imx-ldb-helper.c) for i.MX6sx LDB.
> 
> Thanks for the explanation, LGTM
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Care to pick this up?
I don't have permission to push this to drm-misc.

Regards,
Liu Ying

