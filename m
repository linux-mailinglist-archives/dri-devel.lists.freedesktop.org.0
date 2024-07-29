Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F7493EFA0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 10:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1DD10E1B0;
	Mon, 29 Jul 2024 08:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="GamRz1qt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFB510E1B0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 08:16:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hoE7GsuHUmd5cXpjpuxtGqvH0prIrR11E7DwpK2S27jkDlZKogVMUcbzCSaV+73BsABIZ/giVmfXEc1Bp1CbSN4TpKOnchqvKkgv7xi1XZZ9zsSyOxEbzw52LheTe+dW6rDRcC7zBlJRr7ccDm7fj9ODVXm8MRPZ0wwrLy0bM+N/flro4CAYwp9VRoK7ThQgnPln20oGcvYOp686q7BI2vp7FxFk/n/2lxjMIkHFaJVUANpJiT0h15hOAvvAgdsLAJaFUYdlBr7IFPdnLN5zpfnZwNpsr8kQgu/GJHFpe2oqEVEVbNsCHbA3zehbSimbrXhR9vEWEUd3U5Z1XhVCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgZVatPWfrtgffyCbW787gDtaSnJTPzF8hxm/9ih1Rk=;
 b=SZWhzSptOtY1ysh2+EiOL4ZL/SkjNQFDjWlU8unTa89bm/LwHa8QBNDgcmqjWI3wigqyohAVvzQEFFOVU/TkwnvNiH+ke7476+hs9P6fhu9qnBV7nrrJteRl1GzVARoX8wnFDEGtbGOCWsSHnrwpw3wayHqhhPfyOyFnGLGvqrX/duEdKnIuJnbLBHoCvawbWWCGBQOcUCn5P/xxgfVZ9g4fN+izG0ORZq/T7xQsGxatyLSdx9Lg/Zt7CxYB21ZezHs54RLBrKYgl1zi1kF1y+XfquDW2L9px+UzquK06/GdDCk5DbeEfWp4ax8GJJHMMT96iY74E664LaUIMHc04Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgZVatPWfrtgffyCbW787gDtaSnJTPzF8hxm/9ih1Rk=;
 b=GamRz1qta29WAOvq+c6EoR+YHFqNcdwXIiwwQUj9bDpVriarfUGNDQIlwkL3VDO0Fi6NaARlpNT2EPbPriv10El0kLnCQTp3/2T4K9HZ718Rkgqk8kTe1Ve1/BCbAOSByBF31wARfSOh5EQE1yNGSaEM+2dB07JhzeBo4TAK0EA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from AS8PR02MB9580.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::19)
 by DU2PR02MB10181.eurprd02.prod.outlook.com (2603:10a6:10:46d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 08:15:57 +0000
Received: from AS8PR02MB9580.eurprd02.prod.outlook.com
 ([fe80::9bfe:e236:2425:c887]) by AS8PR02MB9580.eurprd02.prod.outlook.com
 ([fe80::9bfe:e236:2425:c887%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 08:15:57 +0000
Date: Mon, 29 Jul 2024 10:15:55 +0200 (CEST)
From: Ricard Wanderlof <ricardw@axis.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] drm: bridge: adv7511: Accept audio sample widths of 32
 bits via I2S
In-Reply-To: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
Message-ID: <dad42efe-7895-50f5-6bba-9b8abb97f34a@axis.com>
References: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: MM0P280CA0083.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::24) To AS8PR02MB9580.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9580:EE_|DU2PR02MB10181:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dba0176-2ba5-4643-b835-08dcafa6ac2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mkOAdCkkrgrc+a6rnBtpLAziPsWc9EaIaUOMrROVdecEb6yYqkauIQVk+Dk7?=
 =?us-ascii?Q?A4ADrtm81YlggSYxmJOz86kOlKUAVHDK+03Y84QLHDahU/yCohZEoycPMgV2?=
 =?us-ascii?Q?c7BxIBhpTdfasbKDreZ4SU91K+4Y8cWAmicpHizeVA+JMDvZFAYnIDH2SNMh?=
 =?us-ascii?Q?p3EN8/V/sbgOIi/LBX1THa5KU3Hx0a0xVUdwUU0W7/4ZFbQnU8nw9WuzEqf7?=
 =?us-ascii?Q?QOveflRa1MbFlO+GztxS2iQACzLPvifElQ1F1nIXFj5mBMUGfVCAlLnPpduT?=
 =?us-ascii?Q?0EJz93GUCxY/2/UbAjCOSdknnNWWrsaB5edir8KYAr+ejUCNcNbqxNHWvfFl?=
 =?us-ascii?Q?y4x3V6uDHbYmVQKKxn+PCbLn1gHdnHrltf83O45ZBCyYYLcVb3veRJO8KBhd?=
 =?us-ascii?Q?2cWW4VnOOhbVm8agSLFs+NeDBXYtGnK+hKVul4u6HURKWVMdTMIo7HeA8eMl?=
 =?us-ascii?Q?CniZXdBcS/9cq+8IZiZCqMM8UiruoWJ9LxZRLmXwPQl0ZKR1Vk4rp95BaWVb?=
 =?us-ascii?Q?B7NL488bHUrZQvcrDcVN/8KPqB3OP+ncuBXv+ArrfWY0bzz/tRiSXk+7WSyB?=
 =?us-ascii?Q?F6I3J58brBCCIFXW9k9J+9kaG/PHG07PapxFvaZjfWyBz9omdHt/yh7d/nYD?=
 =?us-ascii?Q?aF44hmPTQgsl6EPm3JTrreeolW58OPF0An3MtsbyxvRZRNftw+2bCV3h2p1W?=
 =?us-ascii?Q?z2kAT20UPPi/NP+0tpWqSLQBP1YOgdXV1I9LHXKfbZ0hXtbEVUn1amx/rvd0?=
 =?us-ascii?Q?qb8fGQAQ1xbn7dr7UNPoZTKpT6kHsKdn0Z1xula2bJlZkzjVyVqaN4tMFdvx?=
 =?us-ascii?Q?uMT9m3p4z5zlcBtstCwEZiAsTvjqrnMo5P4X5LapIUzzJVVJ1uHOuImBWuTP?=
 =?us-ascii?Q?KHXb0IilsvvtdoLrF1VjGMIuzylz2wZv0BY0Tfp0RoXVIbs+PLWOQv/2pkJl?=
 =?us-ascii?Q?HhyTjkc23AwX/1ZX3E+2F/TYwppNhrkTSPJTHsVUIGWLaCerjqXfc4FKHZ1s?=
 =?us-ascii?Q?cUYDvEit1rLVo4h95+wfr20EVXJ8lCo+Kb1XOpmQFMYAPCs6B4+kkZOS+PRV?=
 =?us-ascii?Q?5MiXi4oe7fxSmJ77fic8SgkwLD1X48B0q7Mn5Hx7KZg/DgluZyCBPrte9MOY?=
 =?us-ascii?Q?MBkhlOuW8VTyCfamNsx+KfQ6/GO/E5coEI8pvZRgfhiZklnf+OEvt5hXPxRs?=
 =?us-ascii?Q?13e8GKwbAbFgSC/Krb1TH1fUUehETCdcl26WsnrENcwSnL7vcvYf683HvsN0?=
 =?us-ascii?Q?5TYHIKuc7xqnR7UJqackMwKpdZ+8iZC8l9VncelrttVAeIFK1lpEbAjpvJAu?=
 =?us-ascii?Q?lXqXF7kFG6EeVaZcy9JQOMu127cNeGqrsUyPm3/zbiTu0A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR02MB9580.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aQwgzTK7+DyvSwQzgTvgZHNHqjs9CKDu6/PMxEOGDi68KofFU7tDgqQ9r4yh?=
 =?us-ascii?Q?PmKo0WWIN2SOvlXq3v7SAZCjHVPhmHTsTN0LsYhrmwp08/2ILgI3krRV/EHX?=
 =?us-ascii?Q?x4+8VVWUtVx3OlX1uNFmlkragiQiJhfAtI31c65dYyk0MaP/oxOz0vONnxht?=
 =?us-ascii?Q?JdX1pxc+TUdEJesRq5SBI1Ikv3ZMAKjkvC9hdfDoBU8tGCwcEpOO0nQBaHak?=
 =?us-ascii?Q?qadXNEZNS70plAVqTyCt3ZRuATadWJeYPc4UH+W4ldQNrAFvQMQtAeTWoZuk?=
 =?us-ascii?Q?L7P3mhMhkqjyJAYEp/f8a7//OGXAw5ZzKSn5l3zr5VpW8HPgrpQvnpw7RloJ?=
 =?us-ascii?Q?e8GIKZWrQUyqL4XaLgVLdfP1OoK/BJsRNa+ey4EDPft+OihdkSwr4F21FhsT?=
 =?us-ascii?Q?KH01QoIMVK+jo9rlIOhDxHixDvkrsuGXsvc+7jMK1EF+HhbAse5AgORA0uJv?=
 =?us-ascii?Q?4/tJO8GrGn4Ua9l5WleQA6eOFtWxzAJBncNPYW8Bm/1IfdfQwu2buUljQBtb?=
 =?us-ascii?Q?g7hx1X6Jb0WUTM8aFPFSm9diQGKz8GxeuszrGhLaATAqLReVdWw3+XUDKrae?=
 =?us-ascii?Q?iLJUiVi6vRdErrqQSCjAZWUJ83cR8gYTIRv2KlM6e7322Cb5gcy4H8fmPUJs?=
 =?us-ascii?Q?2fgXki0kW9K6mUyPgXx4y9R3cW4eb5WU0Z458NDjAz/S2IEIho/NCrhxjKIz?=
 =?us-ascii?Q?Vsy3p6EbKgayhgeKO9aLhl0qiB18/slfNMPPFL5vhgLd4iCma4Wz90weve3R?=
 =?us-ascii?Q?xUWLEod1Nd98pYT1VnHPCwc9PabruR3C28wLh7x/o3sTY0Agl7UtKI2CCxLF?=
 =?us-ascii?Q?0lkJTZ6gLqlwixnZXOe27UKLIIL6ZKqREfp8rLCDhWBQ9nCqZNj+86fswi+X?=
 =?us-ascii?Q?mdSIbycpFLWLXI9AL5p9uVffqz4WU3MC73MRL51lWkUdqPDj+Sv1m5km9vEa?=
 =?us-ascii?Q?CYyAMPueUwbCQ49vvbwKuBgXbPeqQF8fP1OIlI/Z/V8yOkocCaLt0At0hcLJ?=
 =?us-ascii?Q?wDsK0g/q+wjIFlz+7lSIO+6ecBpqzNHRLFefMTFcs159uXLXJa4OYfufAcIa?=
 =?us-ascii?Q?Jl4on/Q5kYjcvw9kYq/bQn2PKAHnQ6QJIZ8ViCIa3iXTIOKHRycDmX8Rz3rL?=
 =?us-ascii?Q?zghZJBRQaslaPxR3KWhfaW1Gu+F5ZEbW3elDIRBLJb0oIzFx4kHCvjhi9N3y?=
 =?us-ascii?Q?Ibl3jm8SeAoDOINidKTzHnlBkSQIa45w2fjxWvChJe0XHym/4H0SDKyNQAE+?=
 =?us-ascii?Q?MjDGE9zMw9QTcAbE5UMY5BsrESpJSzlbHyyhkfsPgyUtYErsAMD5wYtjLeNu?=
 =?us-ascii?Q?yb9TKQol1tV/44Cij7cqR7a1qrkCKojGkoxLjNSIGlLAyfONMhZVqPFjTTm5?=
 =?us-ascii?Q?lbNTbDfeaQGrWohF6kvqGUBczM+vRBGk6BxMzWolofhW7aUgC6AA9olOcgY3?=
 =?us-ascii?Q?s3cN9jfUG4SO+OiCXIpPMGFUD2cHb6ZsjYDdcCw0vlOspv/h52Bvhk7r2CPu?=
 =?us-ascii?Q?NodSVS9HHQUgPkPYiTJN1ji/vJg1qDQFJ25OBHDbcft/0RapSKWPAS3wrOQo?=
 =?us-ascii?Q?+AOY0WTwhRDnU+Pk12U=3D?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dba0176-2ba5-4643-b835-08dcafa6ac2f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9580.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 08:15:57.0924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOjm2E1G0Q4GBcRUKrihcKm0T5akmsn4Pd2b/D45dfvWW1rqRhcNm+EAxhB/HECqJH1vSg8qp+3b7GQeuShWVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10181
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


Hi,

I submitted the patch below a while ago (two months) but as far as I can 
make out it has not been included. There was an initial concern from 
Dmitry Baryshkov which was subsequently addressed but no other objections. 

On Tue, 28 May 2024, Ricard Wanderlof wrote:

> 
> Even though data is truncated to 24 bits, the I2S interface does
> accept 32 bit data (the slot widths according to the data sheet
> can be 16 or 32 bits) so let the hw_params callback reflect this,
> even if the lowest 8 bits are not used when 32 bits are specified.
> 
> This is normally how 24 bit audio data is handled (i.e. as 32 bit
> data, with the LSB:s unused) and this is also reflected in other
> bridge drivers which handle audio, for instance sii902x.c and
> synopsis/dw-hdmi-i2s-audio.c .
> 
> Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> index 61f4a38e7d2b..4563f5d8136f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
> @@ -101,11 +101,14 @@ static int adv7511_hdmi_hw_params(struct device *dev, void *data,
>  	case 20:
>  		len = ADV7511_I2S_SAMPLE_LEN_20;
>  		break;
> -	case 32:
> -		if (fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
> -			return -EINVAL;
> -		fallthrough;
>  	case 24:
> +	case 32:
> +		/*
> +		 * 32 bits are handled like 24 bits, except that the lowest
> +		 * 8 bits are discarded. In fact, the accepted I2S slot widths
> +		 * are 16 and 32 bits, so the chip is fully compatible with
> +		 * 32 bit data.
> +		 */
>  		len = ADV7511_I2S_SAMPLE_LEN_24;
>  		break;
>  	default:
> -- 
> 2.30.2
> 
> 

I recently discovered that the maintainer for the ADV7511 driver (in the 
I2C) framework is not included by the get_maintainers script, so perhaps 
this is the reason?

Otherwise, please enlighten me on what I need to do to get this patch 
accepted!

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
