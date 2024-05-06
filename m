Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069118BDC74
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 09:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F25010EFB2;
	Tue,  7 May 2024 07:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="DznRSwXw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2108.outbound.protection.outlook.com [40.107.13.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F25510E18C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 14:04:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTpwFtLSWqLVtzpjlKr6FfS8pTdAkwFGb3YRSeygUERihoTElOsp5Uh1LwXjKY2geozxL+JVYQQZLUr+p0VhUvKHyjsAq6MJ6znVWXM0AalNpdWiPrEcqpFnA+pR3n/N6loypJOs1oGq54VtHuMy/f7TQc1G6J6AXPGKu2tyJjZ2g9uE1U5nX3yJlbyx8t6f62HZHqDcGx4XPCMZ+OhxGOCcigYkKnd82X+pNRXULoz87KqmBzoaSjnfPpD4gHehBaNSFDSbQUnRA6nVBwu5A89cxJkZWsTUhAaHnNv02PoFJWjAeWS+u4NkaV1Eg/fUwQYE4DlAaUr1BnBkKHqGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Vp7PmNeBSyveAILLavbbyS2qUAFmjRXL5IO/LuI82c=;
 b=DPb9jbVM4SDU3pgjIHlfZ4+m4QODDevsy6pZV95Lh+v7oCnTMbxn1lOdU33YyPng0idaM33UTYdMuUuF0apgAuzOBhMAM8hnuGl99Ozln6OTJb9TEr5prp3rdhaP3Z8ARNeOL1I3uMrmrk8brjvuBDqq0WU5pUeU7ukogfNyDTCvNrrri0R00QWfT5ixvdC9D5HFivSyQjOJNcjYj4xp/NNP0cvd8GnWvNBLSvMyK/QeJgBA2V09tmX8uwqw/ha4izwDBrytRNcC3KSY0izyKfweM1asRVXD78Xp783aUFQVDfjpaYSiaXwDZgcqZl1PAm7ammvBc3hX8T7pITcw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vp7PmNeBSyveAILLavbbyS2qUAFmjRXL5IO/LuI82c=;
 b=DznRSwXw1WFTZULYMds+nmKDqfhwXlp842U9KsOVzm0JOCEZ1QPUy3R72VqZB+UXPCxn3toGHfZdrc2/dArqLnigLuUWUXhNGls1ObZfTA5iFGcTRzlVa9M4IYsE26Q6EES03FjWh9KB6n0cktl/weDCcMbWpv1xI+5y8u93g7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com (2603:10a6:10:1b::13)
 by AS8PR04MB7896.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 14:04:33 +0000
Received: from DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6]) by DB7PR04MB4842.eurprd04.prod.outlook.com
 ([fe80::ac08:df46:97bd:4ae6%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 14:04:33 +0000
Message-ID: <dfc4699e-214b-4821-bdfc-7306eef80d30@cherry.de>
Date: Mon, 6 May 2024 16:04:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 15/48] drm/panel: ltk050h3146w: Don't call
 unprepare+disable at shutdown/remove
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.15.Ibeb2e5692e34b136afe4cf55532f0696ab3f5eed@changeid>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240503143327.RFT.v2.15.Ibeb2e5692e34b136afe4cf55532f0696ab3f5eed@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To DB7PR04MB4842.eurprd04.prod.outlook.com
 (2603:10a6:10:1b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4842:EE_|AS8PR04MB7896:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8865b6-0ec4-4b36-166b-08dc6dd574ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1kwMTRzbkFNMC8rWXdOWDdQY0ZBejdHUld1RDRCQlRKQmVnZDN6NFl3SVhB?=
 =?utf-8?B?ZUlxZ1pHek0wMDZJZjdNTFUvWnZQQ0ZRVGlUQ0VTVURwck1YdVNUYkpSWUF4?=
 =?utf-8?B?cG9kUzd6MEtVZUlaTE1SUjI0YzFSZW8vNGRXNnQrVGNJaEQxcWZwd1BtaWJL?=
 =?utf-8?B?S29xSEk1YUp4RVAvMXVpa3VSV0Jtd0lRTlJ5TWpudEdja21DaEpBZEl2RFht?=
 =?utf-8?B?bkFoRjg5SG13c1RCQUYzY1ZtUDVZZmF0YlFEd0h2a3doeUtoRjNFRU5VYU5L?=
 =?utf-8?B?cytzdkczendXZG9iV1RJTzVWUng3TWRFY2ZpeVY2dHBPZkFGWk1DcDFDdWZ6?=
 =?utf-8?B?dkprUmVHRUVuMC9ZTlh1U2liTU5DN3BPOUxxSDgyVGltMVJmSDA4SHliWnVT?=
 =?utf-8?B?QTF3MFJBSFlDY3FJWUhYdDl0aDl6bXlOMm9SZ2NIaTFhK3ZMbWV5c2R4MSt1?=
 =?utf-8?B?M3FRY092Uks3V1krblpXVlRsVTF0WnpGeVE5WEI0SUVaTlZoK2phMHpRdS9M?=
 =?utf-8?B?TC92VWg5WTB0RklZdUpZOTd2bEszNnpMaW1SdEFPK2JjOGxFMEJRZmcxS2FV?=
 =?utf-8?B?TU1TYU9QSGVseVN2WGUyWnA3aW0xdVZuT0JnbXloZGVhVVp3RGJwa29LTXM1?=
 =?utf-8?B?dzkrd3lCeHVMNnZpRUlCYmU5S1dmVHpvZXhkemFoWFR1OHE1N25tSUNWWHNy?=
 =?utf-8?B?RnovK0poc3Y1cHg4c21maWY0M2I0NFk2NVpyejdKZ2swcVI5UjVuQjFYNk9B?=
 =?utf-8?B?d0NpTlNYMkpDRTBXeFNudzlMQmQ4N1laWHZGY3MyS0J1a3VydWpCMG1SbURi?=
 =?utf-8?B?QTFXSWxBcXFpMU9BREUyK0hXcGR4L3liZktwYjVNQnZWUno5SDZlOEdRQzAy?=
 =?utf-8?B?MmV4T0xkellyT3lHMFJLdzVXRGx4SDFzalNiayt0VHNqMVdmL2pPNmJvRGVq?=
 =?utf-8?B?RHBsYTROai85aERtM0Qyaks1SEpHa09pOGJLMkswTXlqS3drZ2sxck5YYlpw?=
 =?utf-8?B?QSsrcUVvTDVxdXd5UnBWN1A5ZHM2dzY1dWRHUWNxRDBjM2YydDlpY25BeGVq?=
 =?utf-8?B?RjVOaWNtSzFnTjl4UWM0dHVrNFN4eFl6VGg0SXFuRkN6ZDk0S1JiOXF0dTFy?=
 =?utf-8?B?NElIdHhOVSt2MUdrWEh2RWE1YnRYV2lrQXV3WWVUQ0wwTzVnZEN3dXQ4MitU?=
 =?utf-8?B?empSbWx4cThLQmg4YnYxMnVaeVQ5TXNJME8zQ2RMRThZUWpWeEI4SzBWYW5H?=
 =?utf-8?B?WU1zeTl4ZGpGWGc3dmd0QjNLanhEL3M4U3VRWXI4NkkreVZoVWRFNXFZWWNj?=
 =?utf-8?B?dCtsdGo1aGZqL1Nsc0huWGJ1TUZVUi9mNUdOYzRvUjhHeXRmNjUweFBGNWhl?=
 =?utf-8?B?TkJYcXJlM2tjUHVnWFR3YzZPcnhrVUY5UTNOMmI3Y2dmUVNNaEtRcXczZzVl?=
 =?utf-8?B?d1NvNnEvU2w2RWx1QVFVQm1naWVlT2NVSUJkRlZrVjQzZFU1Wll4aFJaQm1D?=
 =?utf-8?B?VmF5QlBSZk8yT2h3MXZZa05QZ28vWTVvR1FlMUxNakpndzdYL3FwSTZlcHdx?=
 =?utf-8?B?dDIwUzV1NkNnbjNyVEU3TEtlZVhVTnQyV0s4b0YvVDlydWQ1ZVY0QWpGTnFt?=
 =?utf-8?Q?NM6VYRQbswYaYl/1snxK0wpPxXINssqcG/oxXsZZVQa4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB4842.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0JEeW0vU3dsSExTVkgwNTFoN09Vb3U4eWYvekswbnNETUxZZkpyT0tzUk1V?=
 =?utf-8?B?RDk5dWFDbG4zUUpneXYyLzlYbWlYYzZuTkd4Ry94c0xxdWVObWxnN2w1MCtu?=
 =?utf-8?B?U1VSK0hoT0h2QWFzeGNTSHFVVDN2Sk5yaHV2OGNmdkUrTSt5V2IyN2xYckEw?=
 =?utf-8?B?Wkh1c2orL2FSYnBxdjk1aDR1dXBuWStacVE0MFk2MWNsVVByV2VMMU1JOENB?=
 =?utf-8?B?UnkxQnBKeC8vN2kyQjBySVFXeXNGL2RpM0tYeG9PZDZJS2NESjQxUkJCQlk0?=
 =?utf-8?B?L1NLbm5iaTkxRk12U1RoZ1ZmQ1c0aFJvWTd4V3dGSDF3Y25aRC9HYXF3NUdE?=
 =?utf-8?B?ZUlPYmxTOE4vSGUxK1Y5UE5XMHVDK211aTdZUzhjaVZ0NytxUHdJYVZPSU5B?=
 =?utf-8?B?ZkxEWXRCTDhGaUF2SVg5WUYxZ2ZzUm9pUTNaZlBraE5ZNmZ6ajA5UlQ5Z2dq?=
 =?utf-8?B?TnAvOWd3K2w5d0hOcjZWNE0xYUhnZkdJRXlFY2JQR3YzMlhMRXNZYXdmUHkx?=
 =?utf-8?B?SzY2TFM4bWs5V1IyYkdkN0UxSkh2YVRyWlM4ZFJEeThCVGVFc1Q5T3NCb0Fh?=
 =?utf-8?B?T3drOXdSTVBBWlBORTVYOW1Vdkx3N1hkK0ZmOVMzVFNSQmxyV1pNU0FYamVG?=
 =?utf-8?B?aXB5R0p4T3NRbnJyYldPTGgyZmhSbjF5S0VhMnNENGdFaVJqeFcxVENLb2F3?=
 =?utf-8?B?T3lFazdvamlNTjVTNlpPTmdnNk1pb0x3ZzFkeEVDL000L1I0UCt3NTNWbFRC?=
 =?utf-8?B?UmUyRmF6czJCbC8wUjJxcFhtZnVUSkVCMnJNbXB3SXp6bVA2eFp4bjdFZlhV?=
 =?utf-8?B?VGRDbzdyTHArTjQvejBsNzNLR0djSTdYb3pGMmJSR0lwZUJJS3RCVG0za29R?=
 =?utf-8?B?ZFN6Ni8wc3FKMWlrczVPZklGOCt4K2FmT1hVc2ZLTFdOcC8yeDMrUGRHa3ha?=
 =?utf-8?B?OWpvWElZZFV0d0RxNmt3SFpYSEppQnB5bXpMVjkrakV6UU5pbGtmVHdNQ1pl?=
 =?utf-8?B?WEErV0dMODVFSUtteGxzSXRGeTkxck9EZG9ySHJ0dXM4OGtCKzhhTlhoU2ZP?=
 =?utf-8?B?czBWZ1h2YWY2THhIZG1pVHBVVzBjYjJYaHU2SGk0QUgrRUkwVG93L3RzNjgw?=
 =?utf-8?B?dmtQQWhWenluU1RVUm5wM28xYW1YZlNST0M2ZUhtb2ZiVzJUUkNKY0xrTlAr?=
 =?utf-8?B?UGNMT09kSUpKNkFCZTBMN2tJTndQYnNIMTRGeE44YlhHOFVPYUJTY2Q1NzV6?=
 =?utf-8?B?cjlkOVY1eVArUXFhY1hzSVNEc1lBbEp6TnYyUm5SU3ZtN2F4TmM5WU9MQ3V3?=
 =?utf-8?B?NjhjS0hOT0NSUlFGVFVoSnMvYitKN29tR1VRMitUbi9mbmwwMGtyY2pTOHhY?=
 =?utf-8?B?MW9vMTdkOXNjZDcwSVFBOVBlNDE3OS9odWptclJjdU5wZ3hhb3h4S1o4WWNZ?=
 =?utf-8?B?am0wZDVKM3BtMTNteTloRkcwcjZHZTlORmE5ZGpub2s5NHVWNVFSOXBweWFp?=
 =?utf-8?B?UEgxSU8vaDRCTmRSbS83cEtYZE1nb0pGTUdkVnVSakY1NVdITU9TeWFLWURu?=
 =?utf-8?B?RDFIWXJEOVZ5VHlEdnVBWEZnTHcxRml6NCtqRHJRckJ1VzViQVhIQnpCcGkv?=
 =?utf-8?B?STFpa0piS252ZnFIN0lNdzV3YUQ5RGsweXgvUStNaEpMK0lvNnZOckdaM2lv?=
 =?utf-8?B?Vnd6V2o2U1ptUnF3TmgwRlhJdERzMDJud0paRTFpbTFoUzBoOHE2VTByUHFK?=
 =?utf-8?B?cDBVNU9LT0R3YUxnNWFOMXZtdDl2TzBRMGY1TUdLL1MxcndkWmJrL0dOR3ZV?=
 =?utf-8?B?RDdCQjZLWXFRV3FYUW45VW83TmJXeFdxUkxvWUQvSlM3S2FrZ3JjTHluSFBp?=
 =?utf-8?B?WmNQbU1rNHdsZmV2aENIaGlMTGNkTEpCRVlOMStDSzVNVStNejhwODdEQTFE?=
 =?utf-8?B?emthR2NrbENySHFseVJxajhaU1h6OWpCdzhIS1lXZk44T2pUd0xsMGhjY3NP?=
 =?utf-8?B?ekFyU25hY0VKeU1pTnBlT2ZDTDhzWkhuM0Q1OFN5ZHFOM0pZb0hSK0lXRWZ3?=
 =?utf-8?B?WThqSHNuYmJTMTVBM1dGYXFiYmNnUklCT0NTS0RlUkJBa01JTmdaNGVWanJp?=
 =?utf-8?B?MmVyZ2FkcVlkZFBzV2diS2xZNTF4ay8yZXBrRE1BRVF0YVIvVmJzS2RMd3Y1?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8865b6-0ec4-4b36-166b-08dc6dd574ac
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4842.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 14:04:33.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flfoVtulJlQyCQzOwc+RjwFepnXPbtUgBOzCIZNiy6mi+h/EriQpZKeXGf3jj9aiWD0B9dZooi9ZoxA5kUW9qMOOPLS7AeYToBUMr4WfwBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7896
X-Mailman-Approved-At: Tue, 07 May 2024 07:31:32 +0000
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

Hi Douglas,

On 5/3/24 11:32 PM, Douglas Anderson wrote:
> [You don't often get email from dianders@chromium.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> It's the responsibility of a correctly written DRM modeset driver to
> call drm_atomic_helper_shutdown() at shutdown time and that should be
> disabling / unpreparing the panel if needed. Panel drivers shouldn't
> be calling these functions themselves.
> 
> A recent effort was made to fix as many DRM modeset drivers as
> possible [1] [2] [3] and most drivers are fixed now.
> 
> Unfortunately, grepping mainline for this panel's compatible string
> shows no hits, so we can't be 100% sure if the DRM modeset driver used
> with this panel has been fixed. If it is found that the DRM modeset
> driver hasn't been fixed then this patch could be temporarily reverted
> until it is.
> 
> [1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
> [2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
> [3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org
> 
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I get:

"""
[   27.239362] ------------[ cut here ]------------
[   27.244549] refcount_t: addition on 0; use-after-free.
[   27.250308] WARNING: CPU: 4 PID: 1 at lib/refcount.c:25 
refcount_warn_saturate+0x120/0x144
[   27.259556] Modules linked in: snd_soc_simple_card crct10dif_ce 
snd_soc_simple_card_utils fuse [last unloaded: panel_leadtek_ltk050h3146w]
[   27.273470] CPU: 4 PID: 1 Comm: systemd-shutdow Not tainted 
6.9.0-rc7-00002-g4a8eaebfcfde-dirty #63
[   27.283584] Hardware name: Theobroma Systems RK3399-Q7 SoM on Haikou 
devkit with Video Demo adapter (DT)
[   27.294180] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   27.301962] pc : refcount_warn_saturate+0x120/0x144
[   27.307411] lr : refcount_warn_saturate+0x120/0x144
[   27.312860] sp : ffff800081babb10
[   27.316559] x29: ffff800081babb10 x28: ffff000000640000 x27: 
0000000000000000
[   27.324539] x26: ffff8000814847f8 x25: 0000000000000001 x24: 
ffff800081adb028
[   27.332519] x23: ffff000000e13090 x22: ffff800081b3c280 x21: 
ffff0000006c8680
[   27.340489] x20: ffff0000006c8680 x19: ffff00000a6f8000 x18: 
0000000000000006
[   27.348468] x17: 000000040044ffff x16: 00500074b5503510 x15: 
ffff800081bab580
[   27.356447] x14: 0000000000000000 x13: ffff8000819944d0 x12: 
0000000000000a2f
[   27.364426] x11: 0000000000000365 x10: ffff8000819ec4d0 x9 : 
ffff8000819944d0
[   27.372396] x8 : 00000000ffffefff x7 : ffff8000819ec4d0 x6 : 
80000000fffff000
[   27.380375] x5 : 0000000000000366 x4 : 0000000000000000 x3 : 
0000000000000000
[   27.388353] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff000000640000
[   27.396332] Call trace:
[   27.399061]  refcount_warn_saturate+0x120/0x144
[   27.404122]  drm_dev_get+0x78/0x7c
[   27.407924]  drm_atomic_state_init+0x78/0xd0
[   27.412695]  drm_atomic_state_alloc+0x6c/0x9c
[   27.417563]  drm_atomic_helper_disable_all+0x20/0x214
[   27.423208]  drm_atomic_helper_shutdown+0xa4/0x148
[   27.428560]  rockchip_drm_platform_shutdown+0x18/0x28
[   27.434207]  platform_shutdown+0x24/0x34
[   27.438589]  device_shutdown+0x150/0x258
[   27.442973]  kernel_power_off+0x38/0x7c
[   27.447260]  __do_sys_reboot+0x204/0x24c
[   27.451643]  __arm64_sys_reboot+0x24/0x30
[   27.456122]  invoke_syscall+0x48/0x114
[   27.460311]  el0_svc_common.constprop.0+0x40/0xe0
[   27.465567]  do_el0_svc+0x1c/0x28
[   27.469269]  el0_svc+0x34/0xd8
[   27.472681]  el0t_64_sync_handler+0x120/0x12c
[   27.477548]  el0t_64_sync+0x190/0x194
[   27.481639] ---[ end trace 0000000000000000 ]---
[   27.486831] ------------[ cut here ]------------
[   27.491995] refcount_t: underflow; use-after-free.
[   27.497414] WARNING: CPU: 4 PID: 1 at lib/refcount.c:28 
refcount_warn_saturate+0xf4/0x144
[   27.506558] Modules linked in: snd_soc_simple_card crct10dif_ce 
snd_soc_simple_card_utils fuse [last unloaded: panel_leadtek_ltk050h3146w]
[   27.520468] CPU: 4 PID: 1 Comm: systemd-shutdow Tainted: G        W 
        6.9.0-rc7-00002-g4a8eaebfcfde-dirty #63
[   27.532230] Hardware name: Theobroma Systems RK3399-Q7 SoM on Haikou 
devkit with Video Demo adapter (DT)
[   27.542826] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   27.550607] pc : refcount_warn_saturate+0xf4/0x144
[   27.555958] lr : refcount_warn_saturate+0xf4/0x144
[   27.561309] sp : ffff800081babb10
[   27.565008] x29: ffff800081babb10 x28: ffff000000640000 x27: 
0000000000000000
[   27.572988] x26: ffff8000814847f8 x25: 0000000000000001 x24: 
ffff800081adb028
[   27.580958] x23: ffff000000e13090 x22: ffff00000a6f82e0 x21: 
ffff00000a6f8170
[   27.588928] x20: ffff00000a6f8000 x19: ffff00000a6f8000 x18: 
0000000000000006
[   27.596907] x17: 000000040044ffff x16: 00500074b5503510 x15: 
072007200720072e
[   27.604877] x14: 0000000000000000 x13: 0000000000000046 x12: 
0000000000000000
[   27.612847] x11: 0000000000000000 x10: 0000000000000a20 x9 : 
ffff800081bab980
[   27.620826] x8 : ffff000000640a80 x7 : ffff0000054e1000 x6 : 
00000000ffffffff
[   27.628796] x5 : 00000000410fd080 x4 : 0000000000000002 x3 : 
0000000000000000
[   27.636775] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff000000640000
[   27.644754] Call trace:
[   27.647482]  refcount_warn_saturate+0xf4/0x144
[   27.652445]  drm_dev_put.part.0+0xb0/0xc0
[   27.656925]  drm_dev_put+0x14/0x24
[   27.660722]  __drm_atomic_state_free+0xbc/0xd0
[   27.665687]  drm_atomic_helper_disable_all+0x108/0x214
[   27.671429]  drm_atomic_helper_shutdown+0xa4/0x148
[   27.676781]  rockchip_drm_platform_shutdown+0x18/0x28
[   27.682425]  platform_shutdown+0x24/0x34
[   27.686807]  device_shutdown+0x150/0x258
[   27.691190]  kernel_power_off+0x38/0x7c
[   27.695475]  __do_sys_reboot+0x204/0x24c
[   27.699858]  __arm64_sys_reboot+0x24/0x30
[   27.704337]  invoke_syscall+0x48/0x114
[   27.708525]  el0_svc_common.constprop.0+0x40/0xe0
[   27.713782]  do_el0_svc+0x1c/0x28
[   27.717484]  el0_svc+0x34/0xd8
[   27.720894]  el0t_64_sync_handler+0x120/0x12c
[   27.725762]  el0t_64_sync+0x190/0x194
[   27.729851] ---[ end trace 0000000000000000 ]---
"""

when running "poweroff" after doing a modprobe -r of the driver on 
RK3399 Puma and PX30 Ringneck (the trace comes from RK3399 Puma). It is 
fine if I still have the device probed, no trace when powering off.

BUT, I have the same trace in the 6.9-rc7 already, so I guess:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3399 Puma with 
Haikou Video Demo
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # PX30 Ringneck 
with Haikou Video Demo

I'll let Heiko test this on RK3588 Tiger with Haikou Video Demo to check 
the whole stack is ready there as well.

Thanks!
Quentin
