Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34185EEFFF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 10:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FDD10E9E3;
	Thu, 29 Sep 2022 08:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10042.outbound.protection.outlook.com [40.107.1.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33BF10E3B2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+WOo9/OCWiKc5Q6QEIT7hCTa+FiLtHfqYg5ZIURvBxCZ1Ng3VNwFykEnkkT+1AwLHL6mIG+JluNNqY9yAfbNRcMvITOGI76i9hMYUMIxyHJNE5kDx32z+D56ON2Vjx0RMSwRQQl5DdUA/nicjz2Flyc7hagrRu5MqYXJtnBZ8QRDH1808mNsUnk9Fl4p5xHMQulFa9SPb6vKnT978ymf5IF8VbTOfQpQDXO23oiDM7qlQQmoiA02bEK7I7HgIbEFyoBS2EPOsKtM7U//4zxgjqEY3M3fhtxhKpO6DHaZrGytBU+zr2V6cVtWVEnYYml1DIbxGC/scGWetBAeYMQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfcK8zALfckCPWbayubBpRrJlcKIO747W67AsXTQbw0=;
 b=fJ/9AXAoPHyYJaYhUYYw7unqws+3unKlfovDPReVNRHKI74/XruoEs1/AMDA7Vli28JC+e+osfac3MyAHAfaxvUQ1IJvbHSfMSz0hbGnz0idsuZT0WbsRuoBxGvqrPtExUHabi4Yvlt52OICj4hMWRo12nywaDGXlvX4xoSDRoUDjUxqqD9FxBrwEy6d8uJgBh+SPCul7xy3nVj+s6Udmhoj0vSTJrnaFyZpfeE/LHjnJUGVJdkixRMxfJrFynr0oJLpr4ZigVEJGfA6y1kEIqQ+W2vBiKrDArSdLYq1BVKAh2CfdQ5vNSAE2vmx02gt+VwlHgKV7RtPnaDvjXQ/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfcK8zALfckCPWbayubBpRrJlcKIO747W67AsXTQbw0=;
 b=jrJ/bROnqdkGhtmtC+iDYnFkbRiZJVdgjqqT7ld9Hkw79lXaIH5Dow0cL0GerINRhoGRETvv8NxRUv+s1vYiGTwYq2vbSkT7tjCvdpjm1gf9Hcu1pfaE2tVq9S3JgKKtnoLNhSn5FvEtocK+oCtR9iHrdRirtiEDCvZBnALswRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9490.eurprd04.prod.outlook.com (2603:10a6:102:2c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 08:06:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 08:06:57 +0000
Message-ID: <b7f1d5d2c03c970beea227872feb3fce6954b2d6.camel@oss.nxp.com>
Subject: Re: [PATCH v2 3/4] drm: lcdif: Switch to limited range for RGB to
 YUV conversion
From: Liu Ying <victor.liu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 29 Sep 2022 16:06:14 +0800
In-Reply-To: <20220928005812.21060-4-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0181.apcprd04.prod.outlook.com
 (2603:1096:4:14::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d0880b-c0ad-47a1-6948-08daa1f19394
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aZbud3jYEF7uCZu3GmpIvBFcFtijF6BWz+xrHKN3im5Z9WLqXyjWM9YrqO/DQOBh+2VCsVLBM1pKdoCHm8Aim+hYFQ2zkH8t4Opne2nLCxxsAzfpFgJNTnlg+leq4N4SeUhN+gy9cO7JfO5cxDRK8dCXV5kH4jaMHJHxQRIknMZ32u1FuAQoq9XIR9XlrV0w8c4jq+MKopc/ttuUieRlTeCRvHtiduCqe+c8+kXGlLnpH5RBgOSrOEgoq3gZgwEgwwlzYWu7YcHI8ltbdMI5ZUH2av8OCVLVQJYcJrnvixHjYLfyF0GoT4Xi0KjuiPkkVXCf89sB73YwveiHmEYZhEav+en0sQYXvjsSQ6J6g2MJv9uaOaaOeflYzZH4z0aIOlWVqUrWCkJLh0mlq3nOJgEvEAfGY2zqQz4mTD7VhhgUej2wIWpg5NaeSIoihWxRMmJyjnJqdErN02EpIiq9EKmtYlMjVmwvENdqEyNMfEVBa2Wjg/HQNBo1PrCBh/FHzQLD0CuXxNWanabNpYHrh/UXvLJTvQYHpm12F/94h/qaJdwcJonQuUFJtZ8PstLpgaLZLvMZVYnUI3g4Sv8PAX7N4GRRSNKrmZmhx7t4ZmrRfEwW0w220zctc6XMaHiaZeYZuid469MpPnmb1m0dKp2u2dJ7j0/N2S/N/wLVBxdawrLy0ChFpFf0+ccBn63fpnaBBI6JIuj4MKepe2PeXft4ABOy+kRvxrUjbR70AIFjbvqFqOJ+ag5xb08p0wC71659XKjbSfUpEzcutjQH6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(346002)(39860400002)(451199015)(38350700002)(38100700002)(86362001)(5660300002)(186003)(41300700001)(6512007)(26005)(478600001)(6506007)(52116002)(6666004)(6486002)(316002)(4326008)(54906003)(2906002)(83380400001)(8936002)(66476007)(8676002)(66556008)(2616005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1RkNHdkRi9uckVleVpPWEgvbE5nZFdnZmdwSCtFaGNTdGs1NlVqMkZTZHIx?=
 =?utf-8?B?bHRWekVoQkw0RHhzOWwyTi9oS1B2YTUrQ1Q4Q2ZRN1MyaFQ0WHBhQ1FIcnp0?=
 =?utf-8?B?TmY1V1Rha0JnODRXV3VZVE81WldQWFZGUHhxa1JhZXVXSGl1QkxTc2xLbXZK?=
 =?utf-8?B?UXU0Q1R3ZEIvbGxwN21NMTBwTlBjclI0S3VOYXEvM2o5TWJmUG5ycm5mSEhE?=
 =?utf-8?B?ekJ4cXdRTGNRWDdtWFRDdC8yeFgrMmtpYjV5cERTeVhGUGhzNUxseUhBaGdV?=
 =?utf-8?B?Z0M5SkJXQS9qV1dhdGxOR2FJMERLQmdnUWRnbXdXR1p6d3Z0S1V3U0lsODYy?=
 =?utf-8?B?a3dsdmVjL0Q1ODdyUW1GUUxTNmFuVnkwREh0QnpjYTJqS0lLY0kwVDhUcVFB?=
 =?utf-8?B?R3Nsb1J0aTBWM0ZVSlJrT1pLbEdoa0JVdkVFcnN3TlRQMjE1L3lSRzZha0tn?=
 =?utf-8?B?ZVhGUE45SGxjcFNyeFB3eTQxQUZhUG9Kbzg1cGo5Rzhvb21FeC9uNTdENitX?=
 =?utf-8?B?dVlOYnUyaGJONXByc0hscW9vdmZBYXJwdnRYTkJsNDduWW5oVVRueWNOK1N4?=
 =?utf-8?B?YjRuaHNBaHVXM0RrNlFLVUd6Q2tvcXdzbDFyeis3R0FwdlJiM3FPT1RQN1pI?=
 =?utf-8?B?cFMwODJSMkN3ZmlObHhtNnU1OFBNY0V5cVd0eGRWNTFWY0pKbDJFRWpYUWNP?=
 =?utf-8?B?T3c5M3Fvdnc3eWZuT2twb0M0RGJuSmdBTUJkNGhJOVNKbTdhN2lwUE9nNDg3?=
 =?utf-8?B?RGlyRGY2TG40bmhzdFZVVUFWWTVrR1Vod3dDbmt6SzFieUs5TzJuYlZzUUJN?=
 =?utf-8?B?WkZaWncxNmxnTVJjZVpOOU5hL3MrUW80dDNiSkY2Q2xnZDBnWXIzUkFVTDFm?=
 =?utf-8?B?SjkrWFVRWVhvS2d4SWFuQSs2SEtIeGxMQkJJcWQrU2hva1k3c0lHTTlUcjdo?=
 =?utf-8?B?eEMzYXVwZW5pNi9xUnBDRHJLSjI5WkZkdmZQL0tpcWFEOHYvU2tCVWJLMHp3?=
 =?utf-8?B?MTM0REJ0M1crQ0hXbzgwWlA1cHFHbUorb0hxcTgzNmNDaDRkb1cxUVd0OGRz?=
 =?utf-8?B?R3pWSFJsV1dOeFVuckpkQ1VuR3pMV1JML1RCcGtKME9qQm0zT0lmbGNVNTZB?=
 =?utf-8?B?amtxanB4aC9YUUtlNndmWEpxR2Y4QjZrNXdkVndMWjBpVExReWpNNE5xcERk?=
 =?utf-8?B?U0xRMUNHNDZxN2dsQ1BpbEVoajVxY1YxWG1acUlxUGI2Wko2TWVwTkR3VHJn?=
 =?utf-8?B?MzRwaW1BTFd0Qmh2cldlTTBPOFhkaXoyenY0czFYNFJhMTRDLy9UYllxMFkx?=
 =?utf-8?B?ajlEalZsaTJ5bDNMeGNBZDNGYjlFdnR1MTZjZzdUeGdYYk95L0xLNkIrd3k4?=
 =?utf-8?B?M0pMcWF5Y1R6bEZMNWdPaVRzUFBGU044end3R01ic1VnTlIycUovdW9PWWZ1?=
 =?utf-8?B?SEVHMTBvekYzaTc4cjJ1Q1NaZ3VNQTQrTm9XSjYvMnBxRFFldkszRllBTTk5?=
 =?utf-8?B?RXhocnRIa3h6YStpTWNMTzBvVlA2Wk1XamZWM1lNTGJHWk8rOWhKZFhoVmVk?=
 =?utf-8?B?ZG1RMUtSSE9sZklTbThFMkxDRzhUaGJRUFJJZUlRck03ZkVWSStUZ01XQW9Q?=
 =?utf-8?B?bWFTWS80c1d2S2JYbXcxNHhIV3BQVHFhbFVUU2tvRW5VV3FEM0dQc3d5VHFk?=
 =?utf-8?B?UFp5a0hsdFh2TEo5QjJYb1NFYldueEtsTFNLSng1WGF6R08xZzhNcmMwWHJz?=
 =?utf-8?B?ZVNDNExLeDIrbFNIQ05jc2FhSXJ3cGJUeEp3RVBpMTRNaVpKLzJ2dnhraVZ6?=
 =?utf-8?B?MTA2d1JwK1gwdm4vQTJOTUZJb3d2R2ZlV1ZVdldDYnJnWENGOXJnZi8ydGNW?=
 =?utf-8?B?azNCMzQ3RkRIRys3Q2NPQ1NYa3ZQeStjNUVXcUNTbzNhRi9MdWxEN0ZCYmxx?=
 =?utf-8?B?ZmpRZUdxRk5lRnlmdVNucHl2bmZuaW54WTJVRVFEYngvZ01hMTRmdEozV21l?=
 =?utf-8?B?SFp4b1RiMEJmc1dZSFFhTTJUSEZPOW1SVmJ3WHJ5M0lkWEQ2U2o0cC9BMVB4?=
 =?utf-8?B?VTV4SC83RVhGNWN4MlhwTVhCNWtDREl5c1d2Njg4QnlRa0JlUTMrVUlXOW5M?=
 =?utf-8?B?ZHJWdGZpM3JHYWw1MURkQmJuNklKUnk4bWhWcmJFZ0FCeEkzb1FVQUlPVXVi?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d0880b-c0ad-47a1-6948-08daa1f19394
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 08:06:57.3722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkFOJ0bC+b6YVouoFABd0OIUe3GsfX/QuAf4dSr98ojllBwKABbA57sljo40DC3qycO+vKR77nr5kcFHhrWkqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9490
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-09-28 at 03:58 +0300, Laurent Pinchart wrote:
> Up to and including v1.3, HDMI supported limited quantization range only
> for YCbCr. HDMI v1.4 introduced selectable quantization ranges, but this
> features isn't supported in the dw-hdmi driver that is used in

s/features/feature/

> conjunction with the LCDIF in the i.MX8MP. The HDMI YCbCr output is thus
> always advertised in the AVI infoframe as limited range.
> 
> The LCDIF driver, on the other hand, configures the CSC to produce full
> range YCbCr. This mismatch results in loss of details and incorrect
> colours. Fix it by switching to limited range YCbCr.
> 
> The coefficients are copied from drivers/media/platforms/nxp/imx-pxp.c
> for coherency, as the hardware is most likely identical.
> 
> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Use coefficients from imx-pxp.c
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

With the typo in commit message fixed:

Reviewed-by: Liu Ying <victor.liu@nxp.com>

