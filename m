Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C9F5EEFAC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 09:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512DF10E2D9;
	Thu, 29 Sep 2022 07:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1D10E2D9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 07:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzNbRWWFNt48gAqyueGrvEweCPKqYfgteOGYjbf1HQZNVR8YPITMPn/ojsMDcHd8mNpF4PlUheVFWoeiYENl4yreLa6ULdAOUMmEwnAtE0hWXx67CJVwaRSm3qogkzsnQ+8ziLiTVpmNW2Qkp+ObdJiixtdDM1ym5nZWXc5JchHqmeL4wATHpnDFing+pmf6VWL2sFDyw7+KoLYqlMSn2VMKud0eNmNcAab4LS/18Llmv6NSZfZd4fjmVleo200r9bh3POyABk8cFTvhnc5m03XzwpLGLEwhGUaLzTVFYlx1ob9mx3/vZ9MCVepQeGhOY5zd/NQLWicIA/zTbY+H7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4OPijY8WIOccUbwGl1IYwLlVYdrzNaXZU1suV1jlRw=;
 b=OO6dGi+NJ44BL8qdMt+mNabwEaItNdlGdt5g1mq/XsG6YOBwu/a1IjN0mJEEOTMRsuy58D7RiMEjqA9pOHnq/+u78Xp104KCcBVBCUwxrp+7G4koS8JGstJImbIU7jP5nKzqyuRjRYhLAbZXMTHvA16062aSXAjhqx8pLQ79DNsvg8FVY8DYIclUOOqGVLvSPFNZXKgP1DlIFg6NUQXM+BeqvLbUqCMKFzf5wKyewg3BhrM3w3VkZndO+kbh633gZAS9d75XJHVoJ7MEttFaAP/YYGFCPY68HkDn/Tpj9QT0YM62skLNY/Ob2i1Z3v5KyXgdZ3rDAN6FqBL+tsjodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4OPijY8WIOccUbwGl1IYwLlVYdrzNaXZU1suV1jlRw=;
 b=CD8t7pKN25eWTFz/IEwyEmkYBmdxH9KomCK/WJj4rdHqK0FcccY5QUuj1DGY0YecTz1w2rNkOy89GNVfO+/gGq7hBdk7slvIn3JYOj3IuVHM8ymxsrPPamf/dnaWrmYca1HcADHyDeZ2/EPEUMrH9UBQ8LuCQb6YBRhBywyYWGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7852.eurprd04.prod.outlook.com (2603:10a6:10:1ee::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 07:49:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::181b:75f7:dbc8:b4bc%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 07:49:42 +0000
Message-ID: <f7b038dc27a70cdb5d5cfa12362b66625872710e.camel@oss.nxp.com>
Subject: Re: [PATCH v2 4/4] drm: lcdif: Add support for YUV planes
From: Liu Ying <victor.liu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 29 Sep 2022 15:47:33 +0800
In-Reply-To: <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9c33bf-700c-4145-f96e-08daa1ef2add
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSk03ByE0AFveThsM/cZnCrlCDtRGDNFfSn92PkvCGMws289z4F57r6ChiBNKPCJw6om3u8LgCEeb/XHbLhFAq0QgkiYZYXoWiEPFUGeEXL/PoCWB9UuaPjRAeOfCXZD0h3wXozx4ACPxxrSNx4rAu7f+OxrPfXYijmHx8HaTEmhAODnm08/i048hR0A5TBuaGMv5dIyfO/yePucRzllXP3oBg/xsz1bjYyX7q8FgkKkT1zl0VsSgC+e/hm1nEqeUUugG0JlTMUR3vK+9qnj/xeAH3J8hJGusBvQIeGSI1pf6OOyR814z+SB6JKj5QKiv8deqQJWAxWK6yeFHaORfTLze+6LMt7+W/omJBqrjr9oTl9jnvVigr4I29z00aaSMlwkQua3jQQUAYl2iGVk85VQVLwJA67mr2PUDUwUOLu6u4vuC3k+4JlL0FYRq7vlwNORNB0rj+vMLjhFg8AqS9oFiSF6mhr7IrORjUvkiiUqSvUnqkkDYML6eqaqBXTZtEq1UfmkrLuZH6W0PhNv1GTv3g4uj0UaaXvquzdKHh2WhBcek13oKp5Q4yB7icHVMQ5aB+FVU8Xq5zgvnFeaPXARD3JbZFpeG0jsQGrP+RiANc72pDlXIKrPt1L6O5tXn6KaJnF+HQj0ByeivM4QJjt2wx+bZRdaoRAWUlmBZOTHaZ706c36MH1m4+2WMv4S7w7Ih8fth5L15Lvaz2fyDLVcPsUXjnO1rQi9ZkzsICsG1uhEYtYZFl9OoNFGepV/eooXRP5AHSpPcktzKrnDqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199015)(83380400001)(5660300002)(2906002)(6512007)(86362001)(66946007)(4326008)(6506007)(26005)(66556008)(8676002)(66476007)(38100700002)(38350700002)(2616005)(186003)(8936002)(41300700001)(52116002)(478600001)(54906003)(6666004)(316002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHBsYU5hTE5HemRSNUszMmlFTmNtWjFHaitua3lQcm9uWW9QZGtPSjY5M3RS?=
 =?utf-8?B?aWhseDczODNCdlE4UExSaFRLWjNxZnRTalV3Y0g1ZWlCN2RPYm5PbVYrbnl5?=
 =?utf-8?B?NUtLdll3NjE3WEdaTDVWZy94SU4xRFhiZUNFT2FId1NtLzk4bVhEazQ0RGxy?=
 =?utf-8?B?V2dQNDdmeWQ0OEFWUE5mQVNuSGpRdHBnMlNpSGNidUtndytlajZPdTZRRWQw?=
 =?utf-8?B?czZleUFKWkROVkJIdHdGYnB3VndFSVdUa25tczI0Ti9kTUdFVHBMR0I2QmJi?=
 =?utf-8?B?RllWUEVtcDIrWmhPVTB0WlNabVpsK0lRaG43MkRVMjJpa2w5clFtdUowdGhq?=
 =?utf-8?B?SUVWRDZucWlpSzlCUjZXNzRSZ2g0WjJyZUh6WlZ2QXl1K2ZBbGhFWHhWbkpK?=
 =?utf-8?B?K3JPWnVPblIrTXFKYXpDckxiMmFDbzhNTDRKQ1ZEYXdrbEFkTVUxdG1FQ09K?=
 =?utf-8?B?TFFPbkh3WDBCL2JRQzJhajNTNTN6cWlnV2hIRWZqa2ZPeHc1ZnlHS2k3ZFBJ?=
 =?utf-8?B?VUo3ek9mdXZFZzhvRTFHL0tCMHViUW9zeGNyYkQ5dS9oQTV4cnIrblI2R3Fm?=
 =?utf-8?B?OW5iL3NwMEZqSW5SOVZsVFRKY1lXS3NmUndZMVc0SmFkZVgvaEltc05OMEV4?=
 =?utf-8?B?dDRmZHRQN1ZZSEFRMGFaT2NOaXYybE84Q2RFZ3VhWlBjS1NBN3ZrSmlvbnhX?=
 =?utf-8?B?RTVBUGxFeDNGbmp1RG4wNmVDelA3RTFDR2kxOHdiUzdGRnhlVFFSc3dQSTZI?=
 =?utf-8?B?SEhhTmdEMHhORDhTaFFadHFtWkZ2K3Y5d0VGS3p0MnNsaGlrRXpTTEx0Y0lt?=
 =?utf-8?B?K3hiUVpjN2xkMEZNeEZsbHVNN29EUldEaE1YcktKMnVsNDAxbmJ2SW13VkZ5?=
 =?utf-8?B?UXVQTlFuZ25SVWZ4NWhyQ1NxQlUySmZBWjI2MjNNL3lTcndWV0pBZHgvaGhJ?=
 =?utf-8?B?RW1nQ2xaWHEyUmI5TmJaUGR2QUlkVlRhaGZ0N29heTZNSzhUcmxuTkdHZDRV?=
 =?utf-8?B?UWJWallPS2d2T0laOWFySEVxRkMzdnM0b25QTjZrdEhyTVEwSU1qaUdZOWtx?=
 =?utf-8?B?QVBtKzNoa082aU9ZY0dCVjNYV0l5SStOR0syanZSVDhTU1dVSmlVR01UQjhY?=
 =?utf-8?B?bHBuck5WR3ZCRmNUZEEybHN5NmJFUVhob3daK0tuMndQMkFOc09DU2RwNUMr?=
 =?utf-8?B?enBndWJ4Q0F4SUNwWVdVUGxlYlhjRUFmZzdqVjN6ZTU2UmlKSnZqK0wrS1Az?=
 =?utf-8?B?eUUzOWJLQlBzOGFPNW1aeUN0eVFCcjR5ZlpPVEZQMVM1bDZKUmxvaDF1V2dC?=
 =?utf-8?B?bDI2ZDdtaGJZM1ZIRnpISkRaTHF6bDI5akppMHFXT3VSTVRVRjEvZk9UZXUr?=
 =?utf-8?B?UVlIMGJlN2F0dHQ0Si9kSEhCd0gzNWdRWS9KUERDbnRzTEd4cFJuU1B3S0E5?=
 =?utf-8?B?NFQ0cGx6VVIzQjBXYXpZZXBxUkpuUkNudm1aTDRHTG1EVmF4SnVFMnkvVFFD?=
 =?utf-8?B?SWR5ZU9nOGNVZVhDTGNQNmM4UUdwV25JZllUMGlwMWN6RU4ydVBValNuYXRL?=
 =?utf-8?B?M280RFBPdFoxNDlJRThNTTJQcldnbTJXVW85Q0NLaUI2VkRMTXZzNW5JRUhP?=
 =?utf-8?B?NWNXV2c5SUhpM2JIMi84eXhFU0FiTDR2TjFaRXUwdXhyelptSk5VVnJBZjRO?=
 =?utf-8?B?ajN0SlUxWVhjSHhjMDNXdy85VXhJTmhLL3RwU0RCeDRtRnVOc2oxMFVDVzVI?=
 =?utf-8?B?bkw5NitDWnRFSG1CSklaZU9ranJLNFY1OFNpdHNKam1GaHFVcE5iQWlZRkNX?=
 =?utf-8?B?L2FxZ0VVWWwvTDhmUXJsK3A3WC8vank5R1RSbnZwc2w4S1JZMkhuZE82OFNj?=
 =?utf-8?B?SGdCemNtWFlFY1l1c3A3ZVpxanI1UUFQM2JHcmtCdm51VUpjWHVaWkp6Tm9U?=
 =?utf-8?B?N01ZZjVTMW1IVklKaXhraHhsdTc1WThrVm9aTFVVTWVnWHBIUTRPNUdxWUdj?=
 =?utf-8?B?OFVkbGhXK1BaRWpTMjlndEw2bk5ES3NrcXJLbWVmMXNDTTRPSkxnMzdkL1By?=
 =?utf-8?B?cVdUTmRoenltbzJHdGNKdkkrTnF1dHYyUm9VTEc1bTZGR1VmemgyeWZuOVJ4?=
 =?utf-8?Q?e9kJU+o/1jNs8v1npiPG+YnQZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9c33bf-700c-4145-f96e-08daa1ef2add
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 07:49:42.4179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaTcMxlbXbBdD0bFA77/q5Hxyq4IOf0RgIRntrc3/mMeZFsXUSEw8BdNfV6kfy53IpboyHYOESLsHLO++Ojvtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7852
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

Hi Laurent,

On Wed, 2022-09-28 at 03:58 +0300, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> The LCDIF includes a color space converter that supports YUV input. Use
> it to support YUV planes, either through the converter if the output
> format is RGB, or in conversion bypass mode otherwise.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Support all YCbCr encodings and quantization ranges
> - Drop incorrect comment
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 183 +++++++++++++++++++++++++----
>  drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
>  2 files changed, 164 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index c3622be0c587..b469a90fd50f 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_color_mgmt.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_framebuffer.h>
> @@ -32,13 +33,77 @@
>  /* -----------------------------------------------------------------------------
>   * CRTC
>   */
> +
> +/*
> + * Despite the reference manual stating the opposite, the D1, D2 and D3 offset
> + * values are added to Y, U and V, not subtracted. They must thus be programmed
> + * with negative values.
> + */
> +static const u32 lcdif_yuv2rgb_coeffs[3][2][6] = {
> +	[DRM_COLOR_YCBCR_BT601] = {
> +		[DRM_COLOR_YCBCR_LIMITED_RANGE] = {

Can you add conversion equations as comments in code for each encoding
and range, like imx-pxp.c does?  Also for RGB to YCbCr conversion.

> +			CSC0_COEF0_A1(0x012a) | CSC0_COEF0_A2(0x0000),

Looks like hex with 3 numbers is enough for each coefficient. Use
'0x12a' and '0x000'?

> +			CSC0_COEF1_A3(0x01a2) | CSC0_COEF1_B1(0x0123),
> +			CSC0_COEF2_B2(0x079c) | CSC0_COEF2_B3(0x0730),
> +			CSC0_COEF3_C1(0x0124) | CSC0_COEF3_C2(0x0204),
> +			CSC0_COEF4_C3(0x0000) | CSC0_COEF4_D1(0x01f0),

Shouldn't D1 be 0x110 since it's -16 and you set D2/D3 to 0x180 as they
are -128?  The same for D1s with other encodings and limited ranges.

I didn't check other coefficients closely though.

[...]

> @@ -456,6 +574,12 @@ static const u32 lcdif_primary_plane_formats[] = {
>  	DRM_FORMAT_XRGB1555,
>  	DRM_FORMAT_XRGB4444,
>  	DRM_FORMAT_XRGB8888,
> +
> +	/* packed YCbCr */

Nitpick: Add a similar comment for above RGB pixel formats?

Regards,
Liu Ying

> +	DRM_FORMAT_YUYV,
> +	DRM_FORMAT_YVYU,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_VYUY,
>  };

