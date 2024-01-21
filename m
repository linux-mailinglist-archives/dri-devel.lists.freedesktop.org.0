Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638FF8354C8
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 08:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B3310E070;
	Sun, 21 Jan 2024 07:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2087.outbound.protection.outlook.com [40.92.98.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44E710E070
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jan 2024 07:08:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfrkMq/Yk64eZcvmFiTR7HqRqAUn09FsDr3kSymcQOqDxbbBbm6WFxIu/Ye32sqx3hcIFofIZH8SDXkPtZPNefzSjt7J+jQsq9ajWtlNQ7G/Z/30VnOyX8XGywrgPVCAVyaTAiOiz1wzENl6VsgGZljq/YyalMUPFikWozzumfsb2M4vQWhZ/hTGigAyTV9H8+rxRYYJ/j99Av081B7JHVIGD97NoFIvyeBeXFK5EZPjwe8sHSFeXteElSbNnwCXskACJ5FFreRWHBSTxEqKIsQ+obqJmx8IQINJQGrDGYWLF8HTfbB+IfncXvwA7L4HTxzuiMJX7zA+1QXr+sqnyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82Sa/Nf8RpedgozuRmcYaoq0iX1bepaV/I2FHw0X0RI=;
 b=XGTqh7rjkSoNlAobMc7DeGkLq6HGEr99qF+XsiaLbOs1tuIbwQANPMxX3T/8PdjEmhKJMKfJVGYAF8lZVJrr86uVBq2yOCknOc/g6gCZ2HCsXN1J5mKMrhkRQsM/B5IfsogJYQl+/aTGuL9NEr0pzfHFw4L0cmhkOGAIGg1c9Vr+itFD/EnEq/csNKeIFLyP1S6Rkrh6ATJF+bmumPXY38BjUtQdL+/wcG0i4TJgBR5vWJlZT1L2Qj9uuIRMQQUv7MSbGuK/R1+g2mHYZ6jyBWduoaFu5idJgAJfdWYz1JTQgl7yDrW+2+m1rf9RVs3lx1p12nbP4N3bI36SXSNqBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82Sa/Nf8RpedgozuRmcYaoq0iX1bepaV/I2FHw0X0RI=;
 b=SvwEcaBss8dWwbyoTbfeMrp5HQvwVmMhZrOP6vD4Vqw3Q4iroPmBLKfMQlJdri+S+gH9zueqnMj9zfjmgch9lJsHNajtEr7v6znHkdeHTmSK/y3yORYA34wc9EILZUXWwmZTAD7nBNONBMDrsRFD5gJ2SC0bQJAawHGUQxletYOjk4IX4GzmeHdOzsMVVmLal+7UrgFp3bljeCVpRzyP47zO+gUMOTi5OGQQKQiaHXLAE98dOpuuIxrCTnm3mpmeG7iS2tnL9IP3JMjIP6MsTlQH8OdupcSDpePzvZB0bHAahOzjCFC/5vvDNvEFBXgt5VcQyV6/4NvTT2AZTnCV/w==
Received: from TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:309::9)
 by TYCP286MB1914.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:11f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.30; Sun, 21 Jan
 2024 07:07:46 +0000
Received: from TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a820:660b:bc07:c568]) by TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 ([fe80::a820:660b:bc07:c568%3]) with mapi id 15.20.7202.028; Sun, 21 Jan 2024
 07:07:46 +0000
Message-ID: <TYCP286MB29891E14DB45F41FDB48A53EAA762@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
Date: Sun, 21 Jan 2024 15:07:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: drm/loongson: Error out if no VRAM detected
Content-Language: en-GB
To: Sui JIngfeng <sui.jingfeng@linux.dev>,
 Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huacai Chen <chenhuacai@kernel.org>
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <1ead2284-dbc1-4938-bdce-66971c70ef1e@linux.dev>
 <TYCP286MB29897A1BAEC60654F6AC3D13AA772@TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM>
 <f41bc98a-cb8f-4e75-9445-f24e3c55b69f@linux.dev>
From: Katyusha <KatyushaScarlet@Outlook.com>
In-Reply-To: <f41bc98a-cb8f-4e75-9445-f24e3c55b69f@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [UcSu67HAyIQWMq5NFxQscKJy7fQ+apUq6+5Kc3D7MuE=]
X-ClientProxiedBy: TYCPR01CA0198.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::19) To TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:309::9)
X-Microsoft-Original-Message-ID: <4a9d478e-c4eb-42de-b6b8-9c4731ecf3d7@Outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2989:EE_|TYCP286MB1914:EE_
X-MS-Office365-Filtering-Correlation-Id: b8752d5e-a490-4427-18d3-08dc1a4fab47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GnNrF8SPGJzkM9obnobdq5YyQ8eqop2Qcf+Eufy6/BhkujpVWHyAqFYDMmgxLmYIPtpR34UT/yRfbtJMbwD0Q4Z4LXNyw/v7dNTcFb2XPfhCRo6Uncr3Cx0KM+aezEAK6ZkaDilos5lvQbw+MZWS4FC8FdVoVFcaxp2KZdlW0zE0ErXfzLM5hzNCQ4UyNgKjHGjQ61KhsV1rujVQnT+/yArwoUc9GK3A7f1OtvThkaR7ZVvkeJRsi1i87z8Q4l+CqAvJSGZCWYiheP/XApu7Fzq0srRnpigoBLfdqMySLnJ9DsawSJLsiFRjf/vwFRbbyoM163qgG6QMOxYWThCUZ3v7k5atok+ljp2M8TTpyKmy27cxANnPRNUmEhRLljGRU+KV07F1xABMgKhMElOS2B/zIecz+aiuAHfQbFJr7lRECvp6EZC6CunQgRMkW127+qGxGYw094wJcThmaX6QOerVbggG2qbhgCeAoU45nNVHCZYvB1zOZSpAsFTxgckBc2Pz3qnHJU3P39kby3msw6eMVMWi1ypWvTWylBHlU5AjS2tmswwonYEPWR8cut+3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlFVcS9ZTUUrcG4xZ1BJK0g5ZHVvVWVWakpYTFlUUTVhVEcyZmxaWVNLeFB6?=
 =?utf-8?B?bzFHTnUrd0RFc3JXSUdMODY0ZGRzNCtZRS9UTzBrWTVySVZhaFNQWFFXc2ZD?=
 =?utf-8?B?RVBTS3FpQzVCcVNGVmN0R0dOSHNXTkxoclZBRTdwQ3NLbXlGNkl2bWdRQVNB?=
 =?utf-8?B?a01WdmM5WG9POEUvU05aT2g2amd2dUZjS1QyOHNRUnl4ZGFDSnFEYzNsVS9X?=
 =?utf-8?B?b3B0Z1FCYzg2SnZhTDFBQ0N2SDlSWGQ5RHh2a1VwMVNTY0ZRdjExMUloMHpp?=
 =?utf-8?B?WGpoTy9pS01JWGIzbmNzUG5UZzZWSDFhWDJ0RzhlKzVTRXpPMEtWSW41c0sr?=
 =?utf-8?B?bjVxMGRLTHU1QjBBSWdHVTlud0RlcVZpTEc5UXIwNFNCblZPV0FIc201aGFC?=
 =?utf-8?B?aDU5bEprU2JIRlFHcGd4ejI3YjZ6a2lxRytSblMxS3ZZZE10SURPWmNyZ2pa?=
 =?utf-8?B?YjVyNmY4OUxVV2R4Nk1yM3BTa3k0SEtiVlR3dFpVRURKRm0wWVhVcFJrMENL?=
 =?utf-8?B?KzBlMmZFSTRTb1VGUXgwMzhYcUVJMGNHS1BhbnVxNmEwU1JVdDJLbDROV0V1?=
 =?utf-8?B?ekE1K1VHRW5jcEtaTDVCTGdtRkw0MUtLbW4vc3dSYzNuUnRkLzh3dmltaFN6?=
 =?utf-8?B?eDZraDlzcm0vakhLZ3VqZUorc0NIL1BXZGxzY21DNGV3akpUSkJDbnJLSlc2?=
 =?utf-8?B?eGNmRXgrSXpLUXEzaDN1MWxueUQrUjljUVF2VCtldDV0eXZ5VE4yaU5QdWU4?=
 =?utf-8?B?NXNwekNKam04d3lUN0FWajVRSFRQU3NkZnNxYTZmRExYeXQvVkVXYXhnaXRp?=
 =?utf-8?B?blJ3eFpXbWFPRmVRLy9SV2Zody9WOHlFakdZaDFsZXBURU1VaklZam0wSkcv?=
 =?utf-8?B?UmNVUVRNVUFqNlhkeTF3eHRTd0RjeTZiR1I3WnVORlh0Zm52dE9LS1JQZGdJ?=
 =?utf-8?B?Qk5kakJRemhqa2dLWSs2NmVQeWUwYTFRc3R0ckl0L2pYOS9lcDBkbHFkZXFX?=
 =?utf-8?B?eDZkVnFVVndMNkNVMXpidXQvVTQ5azRXVjZtcEc1dXJJNWhBVFFiazA5bjAy?=
 =?utf-8?B?d3JvTkhIM3VKWW9ORVZRWmtnUjJhd0d2M1pvRGNBMXV6bHBnQUF0MEVUM0dn?=
 =?utf-8?B?bFZ0VFNCQzR4Nk9sbit1bFNUZmJYaDdjbUwwWGJpNHBENzZ2cy9ta0w1RXpx?=
 =?utf-8?B?VzM1bFpqWWRGNnNyUlNjekFVQVVGYjRFN1dXNEVYNXpTQmliV0ZSVWlyeFhV?=
 =?utf-8?B?UnpXRnh0M21NZkVQOVBSSG1wbW5tMEtpRzNKSU1wTXV0TGxkTDFuYmczWFgv?=
 =?utf-8?B?ZjRZUGFwa1dUa3RLRU90cFZ4VXdhNkxNelZjTXpLZVRCVm1iZW1PdFhNRWtq?=
 =?utf-8?B?OVdqc1o2M1RSSGFZWWxRdk5LVlBvNHZVU25LZ0xmRlZlc1BGVG5XMG5xbVhI?=
 =?utf-8?B?Y1BWS2gzUWlkUURFRjBnOS9hVHcrcXptU3d3cmkzbEVUMURZcTB5Z0E5ZWtz?=
 =?utf-8?B?Ni92LzdnY0Z5Vnd6R0UxZGgrUGJOZ01XR0UzbXQvTUtHZmVBNkdHeW1jTGQw?=
 =?utf-8?B?ZE43cTRHcHdQc2ZSZUpUaXJwcWVnM2xSOTRER0xZbjdrWFBGek02aUgwMjNk?=
 =?utf-8?B?NXdzQzVsR1owWTdwdnNFanpVMVFDbitEZ3p2Nmc0T0FxMG1oUVY0OEI4TFFS?=
 =?utf-8?Q?qOGu/yC+lQQRTl8Fm37J?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8752d5e-a490-4427-18d3-08dc1a4fab47
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2989.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2024 07:07:46.1404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB1914
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2024/1/21 5:28, Sui JIngfeng wrote:
> Hi,
>
>
> On 2024/1/20 20:01, Katyusha wrote:
>>
>> Hi,
>>
>> This patch works fine with my Loongson 3A5000M laptop (L71), which 
>> has a 7A1000 chipset without VRAM.
>>
>>
>
> Can you give more details about the hardware configuration about this 
> laptop?
> For example, by using 'lspci | grep VGA' command. I want to make sure 
> if the
> integrated display controller are there.
>
>
> Normally, the integrated graphics should not be used if there is no 
> dedicated
> VRAM equipped. And the platform BIOS should disable it.
>
Here's my result of lspci:

$ sudo lspci -k | grep VGA
00:06.1 VGA compatible controller: Loongson Technology LLC DC (Display 
Controller) (rev 01)
07:00.0 VGA compatible controller: Advanced Micro Devices, Inc. 
[AMD/ATI] Oland [Radeon HD 8570 / R5 430 OEM / R7 240/340 / Radeon 520 
OEM] (rev 87)

