Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD3C7D88BF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 21:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B48010E869;
	Thu, 26 Oct 2023 19:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2123.outbound.protection.outlook.com [40.107.21.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632CE10E869
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 19:12:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOPI2wI8olUVniTDUieDrDDB78MuzyzShTzQMv+MwTXAEF9FXLA0ENEYB326oQSQX7nbbp8A1Gsk0pm5bnhTFjqV0UMYcKVwUkKzG75fXO3QOKImghB69NISdQX7DuAJd9h+ut+sA3CE9e9VeKcBZASQ1NFtmEDZ8cTNvOcgIcc9FZ7mKW+9HWlhgHNyKW5L3CtVD4M+aB+fDXj1eqovv6O3tFxf6xydW+wPKQVoN4ZxwZWk9kW3FJGWgdiwk3zGPbImANfH1AOtAKtAp5zJE2Xkvc7/tk5zZBIPPFbP82HzUz2/sRkoBRJ/27RC2I/EbsTqBX6eQtVNCK+DfKOtyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sw7NpEG8IvglXmuZBpkx5sOOZQdFeOE4cBeOHMFdclg=;
 b=IhWrxZFb4TZVJ+noXvybk2QP51Bc+Zwn1fCi1dQcm2Ov/qDFSTDw6hn16PlanQ9cyRVEzx2LhoMuKFLgXeAGE3Ors9gDuN7vKHqfZfiFPEsIPURhGSzwy6l9256AhYsHcL52nAe8eFdHcDgl+sli3YorEIO/dFukHvmJ5AIUhGThHff550RReSSFhCrcY5fXjYzGpYwT2VJhTzhIc8QEo9aFyrbPuuLaEpKUymTdBYG26tn9jVwdvhEXSjkGzhAzhikSMDPb8qQPOHxPe8t4ai4yH0mL/vrWWzFmrQe4tLL5vcqDAjkrLLjZ5QdBmQ722LMA/DHTcR/m2MxVWd7iGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw7NpEG8IvglXmuZBpkx5sOOZQdFeOE4cBeOHMFdclg=;
 b=b02qDcYwL6OOuDGIY8dAbRC2trxDM/QdKArtq6KHmJQhy1evmUNhhkC2DffvOGl8yPhk/HmvrLH7UCP+y4v2RVz5+FV0ofONxb617iE5cuM9NqhQM5z1wHscrayQ6kdGS54lDQokIM9plCBi194Va4ASzpmKFIbi9Dosqlb0SkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS2PR10MB7983.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 19:11:57 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::27ba:9922:8d12:7b3d%5]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 19:11:56 +0000
Message-ID: <5aa375f1-07cd-4e28-8cd5-7e10b4b05c6a@kontron.de>
Date: Thu, 26 Oct 2023 21:11:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: bridge: adv7511: fix reading edid segments
Content-Language: en-US, de-DE
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231026113029.575846-1-emas@bang-olufsen.dk>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20231026113029.575846-1-emas@bang-olufsen.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS2PR10MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: effdb6ee-27a5-4f00-272a-08dbd6576c05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x6fAHN+r0U4yuPAODLIDq6CAOJL2sFyXcCt241SfrzHgMNCMf17EDaoyxsukyD42ey5U4r90gDXzlYGKPxLaoMQAAfinyALJ1br23NZgASCwJ9uHBODL7TogCCyja5PNTNlHylS5M+ep4TMAO/Fhbjh1C1Vzr/awwFaEgSX25aJj6xZzSVMlDRCGBaRfK4z0pgNLUR3u4qu5HmsTbL4v4P6LZR7bkjp+Ehs62IWsz+UTofwxBKtR5u6FIcjgM1eN7O2UvYg5KerNWQyMvRKO4J78k72XhuqXMCPkbFKwYXVSLLPGFoY/SZiHewxl0RN8Z6ak3PST7x/4mzx/Lf3EAwgePcWrtxZ5N6fTtSdsREXoU7v6YYrBFJ5lBpZLXqk51i0WIuCXJkbN4qtnRAUUd1qHPdTcHTTpeKKE4gV+Zgi29Fr/JU3DI5/BeRptgiZy1jh90O9a1Xp78W6Vnl02ycfH8oUjKoyGjg0ZA8ZbGehiFp0+4oWRaquL3JADpmYUEyUU/ECfqAkVTYbdkSEP7+VfcXVimjs1NhNBS3qyllrD6TLVrQlyN5Uw8skugf7IEO+TpVOy3n5Y654oN+atMYAONa4GU7VYHURroGFtteqS2ogzet9XUlA0/pzgR52qYvBmkQ5XMukZaM/Rbn/Yu9ME94PdTb+GcftHTz68jGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(8936002)(31696002)(31686004)(5660300002)(4326008)(44832011)(8676002)(41300700001)(66556008)(110136005)(86362001)(66476007)(66946007)(6486002)(478600001)(966005)(316002)(7416002)(36756003)(2906002)(26005)(2616005)(38100700002)(83380400001)(6512007)(6666004)(6506007)(53546011)(921008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVMvbTFmTThDU0x4WVlxU2pndnFIa1hBcHcyRUhzZUZnUTVOUE1Ealo3eEJF?=
 =?utf-8?B?K0JYd0Q0U09Ea240S3lqVGUrN1loQ0cvN0hDalJWUFBGOHJhY1hUV3VTMlVo?=
 =?utf-8?B?ZmJ6bUU0RXo4S3B3d0NidzBMT2JrNVl6ckREUjRXd0psZEpuUTBJdXVGZUE2?=
 =?utf-8?B?dklnK3RiN25NdWltSFFjQVVkcVphRDNETUZSZ0hCM2dHa3hocElYd3R1enJw?=
 =?utf-8?B?ZldZakFqRTlVekJqbGNVZjhSMmtUWit1UUxKRmR1ZG02eDdaVlhOVDhlTnVY?=
 =?utf-8?B?OHNwZlVYOHdvK0N6NExNbGZaeHhpSVhtSnBoSlAvYWFZbWJzOXBxSlh2UjNN?=
 =?utf-8?B?Q3gxZ1BOTkZXMjV5MmoxZmxUZjR4TjRha2k2RVZpRXZQaXV5czBmVzUxNTZs?=
 =?utf-8?B?bUJwNE5xQkZjOTFiamluTG1TYXA0cmEyVzRqaWJqRGRNdU1kdVhaaytaRVVa?=
 =?utf-8?B?ekIyYUI3RUtDZ1puY3pZQllMMWRTa0RzKzBIeGpwTUExdXNzRStINEpKYm9V?=
 =?utf-8?B?aVQ0VmkxM21yQUtUblBDNjM3Q2lVQW03ckFvQVFacnhxbG5tVkJjSGFaeHFx?=
 =?utf-8?B?QlpWblZwRllYenFQbEhGRWJ4KzM1b3FZZnVzVTc5cUd3TVlDME1Ub0hOV0lO?=
 =?utf-8?B?Z0dNZ0lFZjlkNUY5cndxRnpwTnJTeGg1WDF4OGRKN1NXQU1lYnVoV08zWFVy?=
 =?utf-8?B?emZDQkdLUGZxQ09kcHNaOFRBOWlhNzZiNm9iemhPUUZZL1RWUmtsVUVPNFk4?=
 =?utf-8?B?czJtMFdoK01kdmZjSlFrRXVNZ0VkVk9tYUFBbFhhaXgwYks4N2hOM2dzcGJj?=
 =?utf-8?B?cExoeU00VlNoWGk1Vk0xb21WSEJ3enNac05QS1pnNjBaakVGcnQ2NXZJS0Nk?=
 =?utf-8?B?c0NpWDlSVWxjOFZTQVBEUElZb3Q0anVJWnJEdVJkS0RBVHdFUXpmeDdhMEtR?=
 =?utf-8?B?Z2lKWWxhYkpyeWF1UTdnMlo2cWhJSW1NVUIwRGQxQjVaNklVT1Ztd2FWWlBz?=
 =?utf-8?B?Vys1SGYzM3RENEFwMUF3dDFva2tHOTZwK3lDNUxMYmIvOEpWNVNWRUNsSWdU?=
 =?utf-8?B?ckN6WUZXMlNZK09vRzh2QzMvMkF2U2xkZDA0dHlhN2QzaWp5TW82VGR3YUE5?=
 =?utf-8?B?dWl2RGtKTFpJMnR5ZDBxbVFiL0tHcmU5SnZNY2xuTjQzYzdyZmZDL1c1VzNw?=
 =?utf-8?B?em5zZ05Lc0RiOU5MMkpHbFFoN1NIQjlXVk83MTczVi9YTXFtenB5V1hzcUY4?=
 =?utf-8?B?Wnh6RHo0OHZ0RUMvSktqWlEwSmIxcU1sVFdOZW5yS0FOSjU4WlhDZThwalBM?=
 =?utf-8?B?d2phTkJwVHBmeS9uMHNlSllzQ0FTaDJyaEVxMUM4Y2xSMG92MVh5cjVGUTY4?=
 =?utf-8?B?Y1ZBWXdXS01PcG02L1ovcHNLemVFK1l1NmsyaFYzR0t6ZStENnFtR05lVFRQ?=
 =?utf-8?B?cit3eFc0YklVSlpwZDNGWXdzcmVqeXZ4d2dHUFpzcjFKdlovZG9HSDlTVThY?=
 =?utf-8?B?Y3BIV0t5d2lIY1FNdnkxT0VHKzBObmdtL1pBMTkyWXZtTE5IdkVXeUQ4eURr?=
 =?utf-8?B?M3Y4SXVoaC9OZmtYNEhnT3ppdVlxQmhFZytoSXl6a3hDUEE1eW1GcUgwellK?=
 =?utf-8?B?L09uOUoxZTJKVzB2UXh0SS9QdGRkaWRmNUtrU3VPWHBZckZXbitGQnJPVE9y?=
 =?utf-8?B?NlBlQWdXcktuVnQ3d012UzhnMDUzZjF6MGl1b1pJeDhXR0Q3WnZBZ25zNkZT?=
 =?utf-8?B?TFhQZDAwdE5qa3FzaDlwOFU2Um5xSjVkR21jSWxSZlBXRmNDcDg5QXlvTHNr?=
 =?utf-8?B?VW41MzcyOXFwcEdCOThiMnMvaFhQTk42KzBnMEJQeHI2bHIyNXowL1lJUmRy?=
 =?utf-8?B?b3A4SzhqWHU5VmlTdzZaekRibXRmYVV5OXFONk1QTHBmY094SUQyTEMxaTBx?=
 =?utf-8?B?WS9GdWxVOStWRGZRNlhNaitpVFgzOFltbWMvYnZTeUNpRW43SUtza1NrZ1Va?=
 =?utf-8?B?ZEtlajZRYytwQWJZd1hnUmtoZ1hZekZSWXBRTUQ1SS9LQ0RGWVJSR2FDNytl?=
 =?utf-8?B?QkRhV3BKVHhKSCtML3RXcjJSamlnaENrSU9zdldYdnYvcllnREE4RnMrdzlG?=
 =?utf-8?B?bEFNL0lpd3FsVldyRWRpenJBRWswS3drL01nWE42Y0JGQ0FFZkt0QmNNQjhL?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: effdb6ee-27a5-4f00-272a-08dbd6576c05
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 19:11:56.7183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh7Cv0wGRh8CQs2/ip3MQCXyloxYt+EcYf/N0mfAMES0VnK1NhITX/9lBHYjVHJ8R4lTezCVYQFbO8losTTYQAOWtO9poCU3YM+EM+Eg1sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7983
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

On 26.10.23 13:30, Emil Abildgaard Svendsen wrote:
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
> Also change check of DDC status. Instead of silently not reading EDID
> when in "IDLE" state [1]. Check if the DDC controller is in reset
> instead (no HPD).
> 
> [1]
> ADV7511 Programming Guide: Table 11: DDCController Status:
> 
>   0xC8 [3:0]  DDC Controller State
> 
>   0000        In Reset (No Hot Plug Detected)
>   0001        Reading EDID
>   0010        IDLE (Waiting for HDCP Requested)
>   0011        Initializing HDCP
>   0100        HDCP Enabled
>   0101        Initializing HDCP Repeater
> 
> Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>

This patch somehow seems to break the reported display modes with my
setup (i.MX8MM DSI -> ADV7535 -> FullHD screen) when I test on current
linux-next.

Without this patch I get 30 valid modes reported by modetest.

With this patch applied I only get 5 valid modes. The screen still comes
up with the 1080p default mode though, that is now not even in the list
anymore.
