Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF357FF42C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E5110E043;
	Thu, 30 Nov 2023 15:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2132.outbound.protection.outlook.com [40.107.13.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBAA10E720
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:58:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5D6X8StCkYt71K4CINMbbOnBKWizBpu0K+VenM+Sc/CfEEYhMqh3PcSo0N+U78Fje4wPwggX+GulkevHY+71b4oAAbOr7x7rhE24iSpAFOfa1ZZnOm+WZKL1BWkQICsKvYZ6CFrK0SExBEJMk0RXu9aw9b8meTY5oXU4SK7IWHONnEAYyx89oi02Bsu85lvkn5elu5NKEAv7MEgEcg3xzt7tvIYSc7wWdWCGipXJRxn9Q0K6Nb1PsmvNFIE4qbNoMOfmrin3yBwMV+cGOsjh9w04C1SFPSUrHgAdMPuQQuVGX0h6OR391bZmBntGvdgkmj55a6E0L6jN3U9y3fd6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARJzhY/M8WqordsTRhRDROROlBMyxpOlq0ugi812ze8=;
 b=eaqQB74ZlrGALU6cwa5d47gbRid0mmI1xCqZdOXt4Ul7N3bpHHPUIsEVPcdDZhMboDggFmIj6W9qs0W4QCtLRh0f5OTiETPCoN0sBUGsDnd3tp8BNwubioASosSycRVLCAqfR12DXU1BAJtkSPvE7SfrKUlaOeDySa+aZyuuPvPlunL4EmEmHMzrQnYFsFAA/Y4Jo8QN2f79hct10bBL48Ne+jie3VBYAXFZS5OrsipKBFAQCraalbS3/zAlwR6rBkN3/MZbLYlhGM+M6HzR6BHNIlDvgVybArH3/zLGc+Xp33H9TJFtDI9boYor9zptjZX49mmZkPQdUJIeKLOexQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARJzhY/M8WqordsTRhRDROROlBMyxpOlq0ugi812ze8=;
 b=F58NyyrTE+8dE28xbCN62vZARBwCrRzuTRWw6MhfOAT7Q5pPK8RctcKdKOHHvdm1m+IIHrhoHQdxjIjqxKGC9DS3pJB89iG0ffKVormThL/L3+xkhk2F3hedELuSC1ooxIYKbXOdKhqXLXO20dseC2r5cnbVbHj7gKguRUoeME0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS1PR10MB5553.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:474::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 15:58:00 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 15:58:00 +0000
Message-ID: <4e727bac-3a48-4784-9deb-136d61ae431b@kontron.de>
Date: Thu, 30 Nov 2023 16:57:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: bridge: adv7511: fix reading edid segments
Content-Language: en-US, de-DE
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lars-Peter Clausen <lars@metafoo.de>
References: <20231027122214.599067-1-emas@bang-olufsen.dk>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20231027122214.599067-1-emas@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::21) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS1PR10MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: e8467be3-038c-4cde-c530-08dbf1bd208c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Msu4J5BuxCXFHLSqNZaAxMxGgCZ5+3iwiKLUuyXvOGreHYnBaJNljCsqvGuj+TZw5ryitNjLcOj+I4D/d2HTlzrMkBHmbUtj3ZTZDuioCYDDGf61WF11nH+69V4g21IGGEeSfHUVhfZvgTxD8VABLvDE8WePArMKAlaMBSQUwyHy8gpT4WDqWaHhtHEIJ7fVJry75eyYybLDNyOI2TyRwNgFvTZQN/BJZAfcdQTKAIMCa4Pc4CaaGQn2CeW8H+XVvZvEwkI++/qy9gQiV2LzuYdpF9/v8+Ab9vyPuzS1z2MHJh/FPY9/NfrKIWAKAISvi9tNm/KuNfc9qrkFYO2mCbhdnNc/12QKfiau6Wyt43Uu/KWcvsC1YrYzuuHxposl2vUp/2D8qGOoO0UAiNUDReU38EX+kQHFWeNxLuQ0Xt8EHMSXzZh3rEb3jxB83o/eUDy4iWD5iLNwYqLsPxINtMR6NmK4j5cqMGlv4PTT/FewrMK/XV+69SKMHODNu9fkl92YjJX8L0DJC1/2xbd9//ma6AOknrY3MJVuPF2QejLYJ3zMKeAOH6otutnNmM750NSs7PXGY5eiM6MBOI5jo3ou9vxssJV1/vIYLFCT+5jWoC1bVNloShHM0XCoV1kseL6bzUQgb3r6Z59cJ22URQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(396003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(31686004)(4326008)(44832011)(110136005)(66946007)(53546011)(316002)(41300700001)(6486002)(66476007)(6512007)(8936002)(6666004)(478600001)(6506007)(966005)(5660300002)(8676002)(45080400002)(26005)(83380400001)(2616005)(66556008)(66574015)(38100700002)(7416002)(31696002)(921008)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGxVK0I4L29jbjFjcUx0ckN4bW5mV0Z2Z2xkUWtyeUFiRThRRVY5cGdzVlo0?=
 =?utf-8?B?aWVnWStTRC9CYVVlbXpaazBUa1dlM09LWktMMVpZYkd1TU1NVUdVcUYrQURI?=
 =?utf-8?B?UGpaVWJMRC9ON0MyMEROL1FqbjY0cGlrenNqZWVHTHVRMzdvcmFrUHEwNzlV?=
 =?utf-8?B?N09BZys0V0NkZkNOcXR6ak1LK3cyS1M2ak13THQzUTN5WnQvcWdHOEZWWU5R?=
 =?utf-8?B?ZFVkd1EremEwaGc3WnMvbERjQ0owc3FFQzJmeFg1eERQQ3RGaG1oNmV1aEhm?=
 =?utf-8?B?TXVML3BkbjZjOUIzMy9nY0FTV1hoOEcyRmxsdksxbDZHUXdPdStqWktpa3Fx?=
 =?utf-8?B?Q3djSy9ldFlMVTZpcVVjVnZjR1Q1a2tiQ0U5aGViNGpVMHdlb3cvcFBsaTZF?=
 =?utf-8?B?K2tIWWlYZHdxek90Z1Vuc3A3dXNKN0V3bXRxS09KZ3hYUytYNURYR1JNZ1lU?=
 =?utf-8?B?b0NWYlU2ZytFcFR4Vm9IVkJrdEpQUmo5ZFNwQytiYS9VTkd3WnRxYnIwenF2?=
 =?utf-8?B?WUUwcS9XR21wQ2tRMG9NSUpMekFaYWpMaVcrekFRTzFzOTdYUDhIUDNtOHc0?=
 =?utf-8?B?RVF3cUZKWldrMTVtUWtIejkyYVF2ZlpnL2EzUHFhMm5mN053ckhKRk03OTNM?=
 =?utf-8?B?aUpSYTg5ZlczWmwxWkJZZldxRE5zWG94MkRMNTROSzV0WkE4b1dudm43L2dB?=
 =?utf-8?B?Tzhlcy9MNG95VHg0b3VHaWdGYXAvZ1F5SWZwTmhMV2gyOURTaEZmbDdrWjFJ?=
 =?utf-8?B?ekVweWZuWFE1c0tOUE9JMUI2Nk0zdEljdHBMNDlHdnFndnpKUjArTC9VbEY0?=
 =?utf-8?B?NjFlVXJwdEtORXpJQ25SSFp0aVpVVER0Mjh3Q2IrQW5iL3l4a2F0WW1hZGlD?=
 =?utf-8?B?TWNlREIvVDIzMDNpT1RNRGFVdzBEdFdWQVZmdXMxZnVHbjlWdU11SFRFLzlX?=
 =?utf-8?B?VkZNb1RoQy9vdkhaSFlQNThYMzZ2YmhoRWZaemI3WmU2UEpWWTFoeGMrdlBK?=
 =?utf-8?B?NUJBZVdkWS9vMzdNL3BQaUtDMEFuTzFZdG9ZaXJyNCtPUHZQbzUvMy93R3lt?=
 =?utf-8?B?em82aCtCNnlGYnh0OWdqV09CZkZpSzV3THpOU3p2alVzdXIycE9KbjVIelN3?=
 =?utf-8?B?UmI4VG9iN3hQbzJ3YkNHSVJTemRNWGw4OVkySTZvdGVJS1MwMDhFbHdIWXh2?=
 =?utf-8?B?TjJadWVmTTJoQm15TVRJT09SS081VnlvSytOamUvWmZia1I3NXdERTgyQUpI?=
 =?utf-8?B?eGZtZmxZWkJQNWVSSTkxS0xZQmk2MlBiUGNId0xUejZLNDRoeE96U042enQ1?=
 =?utf-8?B?ZDFraCtqQ2NJekI2VEpqOWMxSCs5bnFkSlRZQ0F3RkpOYlYvbG9zRWxpaEtm?=
 =?utf-8?B?U3dOVUFLd0JscUV4QkhPNVloUFQ1WkFJaDhucllFUGRZdmdVa2M0aG9ZRjZr?=
 =?utf-8?B?MnhUMjc2WVlyR3hpdWVzaittNFRXWUw0cVJsZmRuOSt2bnNVTyt0UkY0YjM4?=
 =?utf-8?B?cTVxNERhZDVjOFlrT090Sm5CUm5Zak5vWm4xV2JjRklNQ0pYZGlPSnp1RnlR?=
 =?utf-8?B?MDhMbG1YN1dpSXNEZTBWZzA4UUp6OEEzY1d4Szc5Mm1RcFJMZ3dEWEwrWndw?=
 =?utf-8?B?SGR1OVJOcUNiS1I4VWpjMXpsTU8wT0ZheWZJUHRoS3BiWS9oVG5XRGtjdU0r?=
 =?utf-8?B?Y0FuV0dwc2Q1TGgxUVU2SGZuSFFKMWNPcG5RMTkyY2RUM1RVaURkQUdablg1?=
 =?utf-8?B?TWdRRDcrK3JoT0R4Si9FQ1RZSVpIaDFYZDZod2txSTRtMHJrSXlaMjk5WHky?=
 =?utf-8?B?cUxYcDRhRUEvUzA0Y0R1QmV6TThMMnl0VjNpKzJxUDFBcitpZTdLTVBKTjNj?=
 =?utf-8?B?dkVXdXJGZGxGMm1UcWRPeVJJWjRCZGtlY25nVzlRcXZpY1VkRjFLamVJUlI5?=
 =?utf-8?B?MHpvc1ZxRFhqejFRdm9VV3cvbmJXeUFLWHdCUHcrMHEwaEJkdGxYTFVDRG9t?=
 =?utf-8?B?U24wcUJhd0pZV3RnR3p1NVJFUDJraE9PbEVuWlBLTUJ2OHVhMzMyS0VNY3U5?=
 =?utf-8?B?WWZxTGNPdm9JSjY0alJNL1NWYjlOU0ZoVXp5TmE2dklReVRaVktXS2NhOERq?=
 =?utf-8?B?U0l2U0RMWmt6anF3OGdVZllRbjA5bFcrOUxhWjYwNjRLZjRadDZncml2Z3hY?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e8467be3-038c-4cde-c530-08dbf1bd208c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 15:58:00.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9EPJvUxW59mWXoAKtLDyAUfx5JuVA0jhW8iXZ/H/D9Pz9J2vvTMShynX3ip2y/0B/27sLAcXG1y0TRsDKcSaxa0kWiuLQX4qXPTS1pV3V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5553
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

On 27.10.23 14:22, Emil Abildgaard Svendsen wrote:
> [Sie erhalten nicht häufig E-Mails von emas@bang-olufsen.dk. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
> Currently reading EDID only works because usually only two EDID blocks
> of 128 bytes is used. Where an EDID segment holds 256 bytes or two EDID
> blocks. And the first EDID segment read works fine but E-EDID specifies
> up to 128 segments.
> 
> The logic is broken so change EDID segment index to multiple of 256
> bytes and not 128 (block size).
> 
> Fixes: 9c8af882bf12 ("drm: Add adv7511 encoder driver")
> 
> Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
> ---
> v2:
>  - Split into two patches.
>  - Add Fixes tag.
> 
> v1: https://lore.kernel.org/all/20231026113029.575846-1-emas@bang-olufsen.dk/

Unfortunately this v2 series breaks my setup in the same way as I
reported for v1 [1].

Also, please add me to CC for future versions otherwise I will likely
miss them.

Thanks
Frieder

[1]
https://patchwork.kernel.org/project/dri-devel/patch/20231026113029.575846-1-emas@bang-olufsen.dk/#25572510
