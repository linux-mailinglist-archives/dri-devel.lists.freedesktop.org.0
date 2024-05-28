Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422DE8D16A4
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 10:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A6F10E035;
	Tue, 28 May 2024 08:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="jagiKPpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2097.outbound.protection.outlook.com [40.107.7.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346B810E035
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 08:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0MYR/DTGEHUNGI7KHtLLrQxYgwO92zuZzhgVODKJd3ySlAwWXfH3oU5TUuCpiimIf1Q2Xbb5I0a/mjEg/JXOwlKpsBgiye77cJWPrYSBs21gTkIO2JDyOhz90NHIdybB75uIFzhZqmBBcrobFxhiWyRcE9gfQrn926QEPJpsNxNvOrTkKZn/IHtMJBHhnefo6usjpy8sfTBmfuDgqultYg76GW8jebMed6IdCXF4O4lgTEyf7HeT4YTWTBncKPZilDbL8t7vPSU1ptwHGqlqRumJxQaKWuzFt/MCKbz18mqAT9JLzBUUih4eKymOi/04aQ8T87oEdDiPoE8B/L1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qI+kH/IftyhFbLymgeeh1N3ClCxUMYdDosdpgRQllo8=;
 b=cOmMgAC0ZuObWUHelWZWcyHjPC5Bls7c9cfCR3JxbBOsERLNAV0PYFHhsg46kkU1R4P0Ej385bZEg2LFaceFso/HXalWtP47ZWMGFPzahau201qHErlA3q8h27OZY80yrPvlFhfMaqGhRy1RmDlqlWw7e3g0VeBOTRZGDTeIzH9B0Ha8B8x2mzC8d5YFgCEukQZs6VlHfnodEMAq9e05d8XcvSqOVeXRqeKFiXVdPGA+CgORNUTvZPE2LE14VugzyCndROnEWdF687rROsadxrQKuHjhxXjLWCQDWFCYZ90mmDueNxb9WG6dmpY8RTjjTG5OFEvTgcgYu0OUF3Ihig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qI+kH/IftyhFbLymgeeh1N3ClCxUMYdDosdpgRQllo8=;
 b=jagiKPpzBiUmsjn2Kle3xxCryjUDVw6Qo7EcqTjiGk/ExjuZDuKbYaY+DpOpnurPRAAKA7GGkIm8YzY+WJSqJScxOnVH4OXWh7+sZUhPV5jyK/FH6s09lS3C/dPuzskPo/x8G8Mm9M4PCGhkkgvYDHuNbUoY73DkXQGiAhmtt/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAWPR08MB11068.eurprd08.prod.outlook.com (2603:10a6:102:471::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 08:50:51 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%7]) with mapi id 15.20.7587.030; Tue, 28 May 2024
 08:50:51 +0000
Message-ID: <bedeec1d-d4eb-4154-a6f4-21b8d873a416@wolfvision.net>
Date: Tue, 28 May 2024 10:50:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: sitronix-st7789v: Add check for
 of_drm_get_panel_orientation
To: Chen Ni <nichen@iscas.ac.cn>, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, sre@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240528030832.2529471-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240528030832.2529471-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::20) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAWPR08MB11068:EE_
X-MS-Office365-Filtering-Correlation-Id: f715cb35-6a7c-4328-b551-08dc7ef3470c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|376005|7416005|1800799015|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDAwaENlWTZwbk5OTVpSOFUyRGVtYlRNaEx4TVN3NzZZU1BqNUROUnpiakpx?=
 =?utf-8?B?TTVjSHZMamVPblhKc2htZFpzbFo0WE9vQmhBWWhpY3J3ZUg4ajd5RDVvendl?=
 =?utf-8?B?VU5yWlBycDhpSStEKzNKY2ltMkN1enJtZGFuRzFkdjhJVDV0ci9uVEJORUdM?=
 =?utf-8?B?YW9vWE81SW9RQjJwRHFtMStpbVd5bFIwelE4T25iOFZHRk1yVCthRFhLN0xT?=
 =?utf-8?B?QmNZZldSYzYyZXlna0RrRXJ3VkZvUC9UdDU0L3F5MmdkNVRaeHp4M0ZrRG5I?=
 =?utf-8?B?UzN3SGxrZkxyRHJjMnAvaG5Uam9XZTYvdHYvTm1oS3l0M3FoU1djM2F4cXQ0?=
 =?utf-8?B?MkpYaXRsZFlEWTFmb21JRHgwWDlOcXU2aXM1MWN1T1lvN0o4SHZOcTJWOWJJ?=
 =?utf-8?B?UDdhTVhwazJZZUcvamw4amtzQzROZVFGSEU2M1Z5NzBGOVdUZ0I4OE9WaExx?=
 =?utf-8?B?UzJkL0Q1TUNTaWMxaGdEUlJxdVgyQ2dWT1doRVdKb3hmaEFMb3Q1ZzFDMThG?=
 =?utf-8?B?TlBlSjBiZXNtSUFRWGtLRjZFaUVBb28rRHBLM0J0Z2E4RU4ycUh3TlM5Nk1o?=
 =?utf-8?B?T3dRVkMxRUFXcDNUWXhRMUlwK2dWUGZoT2RiQkVxUEkybUNBTXlqdXB6OUNM?=
 =?utf-8?B?UndSRFM5eUZleVBHWmRFejBFeTlQY3hoVXJSOU1zeWlxOXc5VFJxQWR1bHFM?=
 =?utf-8?B?aGpkYXBpbURuWEFKUm44Kzg2dUJNeCsveWxQeHluQlAwaG53RzhtR0pxL2M5?=
 =?utf-8?B?MENUZmNRZmplTU9HTW44TlVjWU0wUEtHbHR3L2tLSzlHN3R6aDFWNEt6RkI3?=
 =?utf-8?B?VElZc0lVZzc0dHdBSC9JU3FKT0xaMWVWQ1hwZTR1R0E2NWV5b3BKSlVxWGtE?=
 =?utf-8?B?Z3ZLQzZsa0MxdGk2TWp0MEJQREp6L0NGZWNlbXQwQWRMN25XVDhjbE9abGE0?=
 =?utf-8?B?UnRzL3NNRkRXRU5XS1lwSG82eWtYTVJ0cXZpa3ZHYzN2cXhzSmIyams1ODVp?=
 =?utf-8?B?TGNZWUlNMUxCNWRVbkJqNWw4TGwzek04ZnNQTGJuV0ZDNjNQRm9saEQ0Ujhv?=
 =?utf-8?B?ZzRLeGhBeEo0K1k3aVVoL2ZWY0FoUkZtWGVjODJGMHZqMnhrc2ZDOFJHVEN6?=
 =?utf-8?B?RDB4MlBueEhReEpSM2ZIbUZuZGNtekhBS3kyVllDdjZkZWUzNU5oQUpDUElj?=
 =?utf-8?B?YW9JVzBZY3lnVDVSVDY3T2dqeGFYdlhuR3Zhd1dsL01BWFhRQWxEWlYzS1lP?=
 =?utf-8?B?Zi9waGFWRi9HcnBJbzE3cnRpMWtCWVkxdUM5UTE4S0lHMWFxMGhIQ2lldmFI?=
 =?utf-8?B?MytoNm1OVGNZaGIzZHQrc2J1TDlMWURPaVc0enQ3dDRhZDA3N2FvU1RlZzFp?=
 =?utf-8?B?MU5IVGZxOVl4NkhHWXJTNjRiTnZiNUxmV3k3eC83NkZ6bFFES25vUjI5S3Q2?=
 =?utf-8?B?NHZ6L0QrNWJ0cjFtZzRvQjM4M2YrczhyenEwTThaUk05S2w2WmtuMVVZRVgy?=
 =?utf-8?B?SGN5UXAwQzdKMkpGUmdVd2pwRGdXSUdhY0s5alFhUW5MdUxCRjVQZFM3TDFI?=
 =?utf-8?B?TXZjaHl2ajNQYVB4ZlFWSXRIT0lFb3pZMVhRZTY0cVhrR0hEbXBtT20xd0Jw?=
 =?utf-8?B?dUdHSGZ2cyt1UHBNLzF5dEM3djJJTjN6M2Q5RzVMOUlXNDFLYkhPQ0NzTEFX?=
 =?utf-8?B?N0VSSFgzQ0Z5UG9aSzFrQndGYmJ1MVVLNk85R3E3S09LUGNWL1pZbm1iZnlE?=
 =?utf-8?Q?ttSBhXfyr4oWmIq0GD1aXwhz6wokGSVmZrjUPaN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(921011); DIR:OUT; SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFo3cGlhejJBaWVQSVZDalEyd0hBOTFXSytCL2wwT3UvZ3phT3hUTUh6WmZm?=
 =?utf-8?B?MDllQTA1V1VDZkFNT1dLN202MmxoUDIxQUh2cnFoRUVxZktYUmV0UmVPNkhy?=
 =?utf-8?B?eUJValRwLzJwL3d5Y29ySGZZZnFVcFl1bU9DUVkweERZUGp0am50Q05WYWox?=
 =?utf-8?B?Z2xwM052T0k4cVdud1hoNVhkY2wzV3NkcXZiajNFV1NwOTNNS2FIZ25GVTVR?=
 =?utf-8?B?bnV6S3FQYWt4THVIQklXWVFFRlBwQmFWWmJrR1lNaEU0ZnJPUVpocjhscU00?=
 =?utf-8?B?Ym5HSmYzclJVMmdnZUthTTNWUDg0Q2ZjNlp0bnc1aGFQaVFuTHNVZjE5ZkNY?=
 =?utf-8?B?UWdtcU9RWHJ0NEdEMzZqTUhxOEZONnFYNSs0M0hRRnlQcFhLVHJHeFozS1NX?=
 =?utf-8?B?a21Ca21JdXl5bDk4NkpHbm1RbDRGZzVOUWpWSnhnMTZ5YnVJV1Y0aFJsYzlk?=
 =?utf-8?B?dDdoZFJ3cHpESnJpMWtxcEhNWURYbEtGdEFlaWlvRmpnUUVrUDlaN01Sa1JO?=
 =?utf-8?B?SThoY09JQjNTd2ZmQmNNVjJETnZFZko4UGtUQzFYUS82T0JJUEs3TUgybkRi?=
 =?utf-8?B?N2JCRXdOWnA4NUk0ZTNuRjZrYk51REFRS2lJYUNZSXJVUGFaRDd2WnU5aHFC?=
 =?utf-8?B?ZGhxVVltNG8rd29ubzh4WkxYaW5FOUI5M1hiNUUwaUZ3OGh3d1pKRy9kWTZp?=
 =?utf-8?B?ekJ1Vk90OFFPb3RubE5hN0JEWUJkdk5melYvUFJHRmVzUmxINDBCVStvNEZ2?=
 =?utf-8?B?djZDRmIvNHhHRnExN0Nkb1RBN0NhT1BMdWxpUm8wYWFndjY0MnhtZTIwVExO?=
 =?utf-8?B?WDB0NXlVRkl5MDhMKzFJbmE1TUhXaHdDTExJNzBJOFNjdlZTMzYvMHo2YlBY?=
 =?utf-8?B?N25PK3htdUp4R0M4K0Y3T0NLSVRpdmh2b1BwRGpWNGp6aVNQT3RTYml5NGdD?=
 =?utf-8?B?NkFIZ01hVE5sVUFqYWZla203OEsva1hPcUFpT3ZjdjE2VktGbm9KWm13WUZB?=
 =?utf-8?B?ZkNqeThYQlpBR045c0Y1MjhhL2NpQ2QzaWhDSnVFN0hoWGRmRDZQcjBSV3hI?=
 =?utf-8?B?MmJFOFdWVDJEMHM5MDA3TnJxcW81WSthZTdBYjNNdUpnemtzMzMzaVJWcllx?=
 =?utf-8?B?ZzM4Tm91U2Y5T3ZsaExCUEZHV05ERWsweVJxZWk1TnFuR1ZXRGRWeE9qb0ZM?=
 =?utf-8?B?VmpoTi9rV2pHMXI5Wmo2VlkyTU1ZN08rT0RBNVhzYzd3Mks5dytKaTFRVjd0?=
 =?utf-8?B?VXJYNEdSSk5ZcEFGS21SR2N3aXdPTmplbi94bG5MQVduZVJjT0hrZ2hwbGdB?=
 =?utf-8?B?ekZkOFF5c0FoejZJRVM3UlAwdDhXR3NMUEpXcHFWN0RiTng4UnFvOHhyU1RV?=
 =?utf-8?B?MVF4OWJzVGRXUU9KMHA2eS9Ra2NTdGlWWWYwbEs4b2JmOHgvR1FsaGxNMDNw?=
 =?utf-8?B?ZmxqWnVlM0lOdFdZdVlyQW5vYjJBRldDTlBEcHJpT1k0UTEvbFJvK3dmbXRu?=
 =?utf-8?B?b2xFYnRiRTBDV1Vsd1IvU1FOb3ZhRWZSVC84WGpDZ0h5NWhDcitpaThQa0tE?=
 =?utf-8?B?cUxjNGtCOEwveFA1QVNaTUhoeHF1c3hicjRhRURoaHdES1pxL2xIWXRQZG5H?=
 =?utf-8?B?NDVMVHhSQjYweWhNSUQ0M0dIZVg3YTBTdmJPQitITU5GQUx1cjdreFRFK29r?=
 =?utf-8?B?WmZsNERmZE5GNXU2U3lqc3BreTZjTzBPZzlheUZ2a3hSVEk2Nks4OEhNNXFH?=
 =?utf-8?B?a2tuMm5Xb3p0Q2FMWnZ2VmtCTTRGaXJ0L2liTTFOcXpDTmRpa2N2ZjhSNlNC?=
 =?utf-8?B?VDB4SCtyY25aMjZ1ejdycDlDVkZEMjFyL2xHVTB2TzFidGxQYkpaNk5FRHRU?=
 =?utf-8?B?WUVuRGN5MzBBNWI1VmIyaDdyQW10cTIyMDl6M2R1MDVpR0xOSXVnWTBiYjdZ?=
 =?utf-8?B?TU1weTBuSnBYOWZtSTdiSnppVGtMTm8welJIcXdoajByVEd0T0FrRXA5b3Z3?=
 =?utf-8?B?Mktad0RXVVI4U1Y3THE2L2FPNnlwNm5GWjBiWnJKTVozTDRaZFErY1d5S1JZ?=
 =?utf-8?B?NUJUbjNNV2JhaVJITWNJSWQxc1huOHM1R05TZXMwTHZmdVdKUGREMFZxeWZr?=
 =?utf-8?B?NGd2dngwUW16OW9qOHNERjloZkVyejQ3amsvN0tTaEpCbm1sY2ZqSW5RVGlk?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f715cb35-6a7c-4328-b551-08dc7ef3470c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 08:50:51.5322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFByHJZDeoZ/fhkwTurE92xFAuswmMOjNBqKSy+PLB8uTs3X6+VwAaBF88QAj/5dh22ZSLphEcCQpLp4hBVAsnHbfSuNXYWcuSaLPiFGKoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11068
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

Hi Chen Ni,

On 5/28/24 05:08, Chen Ni wrote:
> Add check for the return value of of_drm_get_panel_orientation() and
> return the error if it fails in order to catch the error.
> 
> Fixes: b27c0f6d208d ("drm/panel: sitronix-st7789v: add panel orientation support")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index 88e80fe98112..8b15e225bf37 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -643,7 +643,9 @@ static int st7789v_probe(struct spi_device *spi)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to get backlight\n");
>  
> -	of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
> +	ret = of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
> +	if (ret)
> +		return dev_err_probe(&spi->dev, ret, "Failed to get orientation\n");
>  
>  	drm_panel_add(&ctx->panel);

I was worried that this effectively makes "rotation" a required property
(although it is not marked required in the bindings documentation) but
it turns out that of_drm_get_panel_orientation handles a missing
"rotation" property gracefully.

Also, all other panel drivers I checked handle the
of_drm_get_panel_orientation call as you suggested. Nice to see this
becoming aligned.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks and best regards,
Michael
