Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C598CB8B9
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 03:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AA510E11D;
	Wed, 22 May 2024 01:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="a54wyXbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2056.outbound.protection.outlook.com [40.107.6.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7028210E11D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 01:57:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTVFQjsGyy2wKZWUkzZkI9hsa3N6a/e+/UaErf+6aBnfOq9L4HJkd7jC2NmLHUVpKeOIjQnHmUZx8iONGtsrz9a8TimoxPQT05U1S5DfYwGmGPGZW659ZMW0WVfn4FhGLxfUMsp4Ysw4ue0qdLmFhHDUtu9OGYK3J3y/qSFXnm0AURlhRhNRbKcBTRVY44V+CSBOkjYZWL7tPD+Pp1WxbJ6iAGPenxVTfJm09M05lTOUYwl9zgEZzjYDfSul0bhzXR5+Tri/OPazjqZPYhQPCTeikIDZhOpGmAmytLeZ9XGqoRxPwAEzoZT9eTmVqueRRm96mUkrPqz+RZK0uy29Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hn5GrsbCNtIiNj7KyuBTctWjdArhYBE9qYaYZrCuzF0=;
 b=cQU9f1JaZNxoF8jHbtvlps4CceH7jtUXWZKUsO5IQjtKWoeoEUqjKqMfSYxmI4pRx4CfZAr42caTiFv0jya07JcrwGvJPvnGOeOnHsSImMeV3tMdLpxRXJ185ObnSNor+6rS82Gx4RAeksZ/X1i9gg3DfFtGAnvqMFPRVf53joyrxJpbGoVNWPiu03llvYTHxV3xJOewVxNg+aH+bYsic9cFAiIHKvFpFr90Jzf9WKJONtUpmWvIuHrrQ79wxjvaXJSb2JNPve5XRL+CWcHwlrjc8pO95bjMY1veSU4ssNp+4fTxvj6Xu1avXBQlZnwLCrrRAcWX/1/XuZNfH4ECHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hn5GrsbCNtIiNj7KyuBTctWjdArhYBE9qYaYZrCuzF0=;
 b=a54wyXbXwBnI83O2Vk0Nu4p8ILYVgknzVZqP2jFUL280J3du6NEc3gfrV+MpXrfn4pfJbLJq8KocnuUIGHFqEMGVB7kC0wUf/0Ca1bYCMFiv+Mi/8xmgZHGFMxj3iEoNO1/8qpbxW7wlerHEnJ2nSQXyuR2UARNL37CEmomO7uM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9584.eurprd04.prod.outlook.com (2603:10a6:20b:473::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 01:57:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 01:57:50 +0000
Message-ID: <7bb4d582-5d90-465e-a241-1ee8439a5057@nxp.com>
Date: Wed, 22 May 2024 09:58:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Fix Intermittent EDID failures
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, sui.jingfeng@linux.dev,
 aford@beaconembedded.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20240521011614.496421-1-aford173@gmail.com>
 <CAHCN7xLekU9u0auzB+bt7cRgv48qxH8bRY2e-_nK0nUhaLJagA@mail.gmail.com>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <CAHCN7xLekU9u0auzB+bt7cRgv48qxH8bRY2e-_nK0nUhaLJagA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4064f6-d518-47fa-3c22-08dc7a0295d0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dysrTng2VVZ2T0tNcytBOUw3c2htS1VlTzI2QksyUjRiODFPbGllajcwV3Nq?=
 =?utf-8?B?RTVGd0ZDM2doS2hsVFhYUDVqVXBxSE5YR2JIVnZSYnNJb2RDVjRraDAzTzly?=
 =?utf-8?B?T0NMK0VSZHFkeFZxeU1Vd3BvS3oxOWljOWhJWWh1QjVaMGpBTjltNDNIb3V3?=
 =?utf-8?B?eHNpbWM3dlBROGw1WXlEbm9kamhoWDdUNDQvNVNHck0xSHNPY0NZRTJ3Und4?=
 =?utf-8?B?OFR2aFp0Zy9KNVpNVi9HNUZ1MTFJM2F3UVk5UFR0azdUcUhiOWNHeXRVWEsx?=
 =?utf-8?B?aTNLdU9nUCtlbytuNk9MZUFrWU40N2FjUlFiREU2Z29hbFQwQkFCWnV5MTd2?=
 =?utf-8?B?R3lHQzdtZ1VhSXNBUUFhb3hBMU0wTFEwaDd5Y1NaOG5JSUEyZzVhaXovZk1D?=
 =?utf-8?B?eFdsWi9NT0haUVI0ZTZZa0RTSytSa3pWanJseFVzdHQvQWFsOTJMczczMTkv?=
 =?utf-8?B?RW44MExwVHd3bmlwbmdSaExaOWpoSlpBUENsVEJCTTIxbDExckdEWVdDbUVG?=
 =?utf-8?B?ZlJxZDVvQThQQ1BvSlBsM2dsbW1WcHp6dWcyUUZHMFB5akVYYXdIek9tcWxu?=
 =?utf-8?B?MXlSd1IvWUJmUFlTVXcxeW1FdlAxUXc2Sy85WDd5UktmMTRqTkFTeiswbk1Y?=
 =?utf-8?B?VEk5Wk05YnVkcG85dG9ha0hQN3ZkRmMrMDNkMmR3R1JVQjB4RVRkQks1ZUZ4?=
 =?utf-8?B?RGNKVWc1YldsTG8wUHlzTFp1NE1tZmtvMi9kNU9BZmZBenJJbndsdStSZWY1?=
 =?utf-8?B?a1REbnBueGNPZmZ1UGU1bDhuSUtiNTVGVlNycVVGUmc5UFZiQ0dTdFA5QTZx?=
 =?utf-8?B?aC95T21IQzltaTNxSDI4c3VhV1JPa0U4SEFqVU1qbmhLR2NIZ1VpTEdPanJB?=
 =?utf-8?B?UWxEeThyeXpLMnBidXc3TFROMzlvdTcxY0FPeWd3WDUxZHpUbXV0UkwzT2Jx?=
 =?utf-8?B?OHRGU21wTVYrOXVNcnJKeTJsZHNBMUFDdWYvSFhNR0FzR2M4bGdQU3NnV0VL?=
 =?utf-8?B?TFV5czMwUjF3am1IVzlrSW5kdVArcFplQVlRMkxHQzROYTNtS1pPVklQR1hz?=
 =?utf-8?B?ZUZ3eEk0RlVXUys1dG1PTDd4R1hlTEtJRm1jUWFUMHBWcVQraDF6aXRZQ1hq?=
 =?utf-8?B?dlRRRFRFZzlDd05uK1owc1BnL1hTbk84MzNSUmV5ZnlSQWVTdDE2L0o3Vk95?=
 =?utf-8?B?UnJWVWpqbjluUytQbkNPMG9hOUpIdDZoRGVVeThDTkVHOXo2QlBvUXVRVTRz?=
 =?utf-8?B?dWJSaWsyVmVVcWFEQVNDQk1iRzdjZWthMDRnTUVBTHlVT2dFYzFRcmVlZEZq?=
 =?utf-8?B?RHFpeHBvbzJWVHJGaGJ3OXBPOGc0eTlPS0xGanVObHNPRlRteTRacitreDRY?=
 =?utf-8?B?eTljTHNJVVZHSU9MMlNwaEhPQUpyODF4R0VtMmQxS05oazR4L0N2RXpwcVp3?=
 =?utf-8?B?YjJDMEY3WDBjS29qeEM3eTZXdmp1SmtwcjV0azRSN2R2SVkzOTI0ODYvaEhT?=
 =?utf-8?B?VXl0Ly9UMUVHQmtRTVlMWDdCZHIveHhzTURuUnJ4MTNrUDRtRkoyVzZWbkJV?=
 =?utf-8?B?NWNRSHUrd1NUUkNXY1RLU3lvMmRJVEkvTkZNdHdmSzlNeU1VcldNWlA4U1Nu?=
 =?utf-8?B?WE5mYVhtOU16dEc3cnNxQlV5VEJvUk92Q21vNHFUQzJrb3RsUlVERGhDKzJG?=
 =?utf-8?B?Z2praGRjV1JFV201dCtKR0RxRHBTSmF3TjAyeDJ2YTAyeC94aGZUd0x3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjNWc0lHaXBrclFoMEJyRnIyRFV0dEJpeVRxL2Vqbyt0aXBGQmt5bDdKMm9F?=
 =?utf-8?B?Q2trVEZZbVlkUDdoM3RObkZtUzlDL1dVNWdFc2xTYkZkMDRTNit1ZW43WXRI?=
 =?utf-8?B?UXlBMjRxaVIydTNhdnIyN1dhQ3ZlOGNTWU1waVBwRHFmWTF1RXVZK0wzQWo1?=
 =?utf-8?B?bWc2QmEySy9lcFUxNEk4QXVtenpGVDNsVHlyYXBYcHBNYUhGU1d2MmwrbWxh?=
 =?utf-8?B?ZjUzOHpuOTZpZncwNVIvQ1dtODQ5Q2MzRGtwak1qRXh3ZkxGVkpOcXBRWjBQ?=
 =?utf-8?B?NGVjT2d6d1JZQWQ4RWp2dzBRWkRTOUZTVEUzTTNVUjd3TEY5WDJNZ2R6OFJv?=
 =?utf-8?B?c1BEVVhJSHRKTEFEYWRFbTh6T2hEVTloeVg0bVIrVGU0czZlOGxza3VaV2Nt?=
 =?utf-8?B?ZW1BUnBXUCtKOVYwcTFWeUp0QXBCTi9kb1IvemtXZW9tU251S04vdXk1cWxO?=
 =?utf-8?B?blVXcVdLU1BXc0tUMGdtYzJZbGp6UDhsZ3ZZSmhUcTJ1Z1FaWUtJSFU1bkRw?=
 =?utf-8?B?OWlBL2JJQXdXaXRyTmJsOXNncjdIanNxb211dXkvaEZ2S3g2bmJwWXl0eGJn?=
 =?utf-8?B?WVhkcUxaa3J1NmxPTm9VL09yRUdmVkQzYUcxK3c5NU0zY0ZCRE1JQzNyZi8r?=
 =?utf-8?B?M01EbHEzMUFrV2ZXQ29iakt2NnYwUHZWOElJNmRzZGRQK0ErVFljd1RzTng1?=
 =?utf-8?B?cEVmL2NBU0dVbitBeEdHd0lBV3ZhcXZjTUpvSFJ4aE1lQjVFL2gyZ0ZYandn?=
 =?utf-8?B?d3l4QWo3U0tERzc5bVNXUTJnVjNnUGlaK252NDFlaWZiQ3BEUW4wQ1RLUXR0?=
 =?utf-8?B?UTViTDVnblFOaGR2YUNPalQ0M3p2NkFRQlFXWm93c1F4MEZ1K3Bpa1lrM1Br?=
 =?utf-8?B?NElOZ3MxZ0E1Sk5uNmo5MU8zbzNzVURjMy9TZXFwcHlFTUdYVGNaRHlMSzcv?=
 =?utf-8?B?M0tsenNNTG1jMGUxKzN1L1ViMUx3UVlFcUpzM3lWUGM0TFh4ekZiRGhYNlFI?=
 =?utf-8?B?NnRWcmVuQjZoRTJtVHF5UjZERmFxQ1IvTG52amtCRVhtUkJmc3J0QTlWTS82?=
 =?utf-8?B?TGt6ZWRtSjVsSkFvb0g4SVdDd1dpeG5xdHVRMHlydTF4bURxVXBjaW9CYXZV?=
 =?utf-8?B?bUNBSUpXMmp5bXRKcHQyLy9zcVJEZWdJOHVPeFhxUXRTbnZiMSsxZFk5dTIw?=
 =?utf-8?B?NnFnc1JzT3U4RU9ObnI1Nk9PNmFDU0M5cU5CUFRaOGRDMTFUZUI4MkswNktp?=
 =?utf-8?B?ZmlQU0xXTjhDb2lvbmJTenE2TW9SNlU4RHY1U1VaRzRQTmlSeW1kYlhRSkRI?=
 =?utf-8?B?RzkxWEdhSlB2NXpxVkt6aUs0c1dra2NUUkJPWFQ1bnlqMXB0aXhZd0YyY090?=
 =?utf-8?B?RGdkMENEeE9FTC81Y2hobkVMejZOY2lWaVlFRmdwOUsvM3NjalNxZFdpbk9Z?=
 =?utf-8?B?NE9DQitmOHl0TjR1V0Zhd3Z0ejJ5Y1ZJQ1UrNGNaN0RVVkh4bkRVZ0pGd3Fw?=
 =?utf-8?B?QnY1WEhJQzJIaHRjS2JaQUoyZHVkZnJIVEdnRk9LSXJyWko0U21qYWFCVkRz?=
 =?utf-8?B?SzV2aHNrZGpXSWJSNkt5enZpWk40Ylc5QjJIeTh6QmRkcVhMSDFvL0tiRGJI?=
 =?utf-8?B?RXpSbHoyTnI0TTcra1NrMDRrWmc0WERaem5Id3JjNm55RHNVZ0NHZCtreXh2?=
 =?utf-8?B?UFlZbXlYMElzT2llUDlHckt4QjFCWnZwQnpHOGNRY0lOSStCQzMyeDl5VjVJ?=
 =?utf-8?B?SGlPSDRrMFo5Lzhmc0FXNmx4ZXIydmdocGdtWGw2cGxiOVE5QTluN1orV3E1?=
 =?utf-8?B?RXRJYU4xV1ZJOW1jL3hBZHZTZ2Z6SjFmS0hINXk1a0U3ZGw0WjFRWFlJT1Zp?=
 =?utf-8?B?NUttNklmTVJnR1huU2tKbUV1RUxVSXJxSFJQSEtlTENsazUyamc0WFA0aXFq?=
 =?utf-8?B?aGZEU2NzVkhLT0ZENlU1U2hFMDRRaGw0a2VwMkVXUk1BdWVFQkI1WTRjM3lz?=
 =?utf-8?B?bFZmM25waXdTM0lsT1h0VjdTckZweVczTC9rNFIvN3pKcHErMjg0R1dlYlNO?=
 =?utf-8?B?bUd2SktmeFZsaEpuWnhhdzEzVitIL1orWUk4SFpoanFTekgwOVpCc2ljcHhz?=
 =?utf-8?Q?IgIzQZoTT3a3T5rAThptHGwtt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4064f6-d518-47fa-3c22-08dc7a0295d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 01:57:50.2952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lG+461iEr3i3M+0mRHKJiFecm0nTljMQ9/mOfKG9l8BggyyUhPUDJG1hp7ysQzE/gBlKU+1YtUhtAI+52gZrDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9584
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

On 5/22/24 05:51, Adam Ford wrote:
> On Mon, May 20, 2024 at 8:16 PM Adam Ford <aford173@gmail.com> wrote:
>>
>> In the process of adding support for shared IRQ pins, a scenario
>> was accidentally created where adv7511_irq_process returned
>> prematurely causing the EDID to fail randomly.
>>
>> Since the interrupt handler is broken up into two main helper functions,
>> update both of them to treat the helper functions as IRQ handlers. These
>> IRQ routines process their respective tasks as before, but if they
>> determine that actual work was done, mark the respective IRQ status
>> accordingly, and delay the check until everything has been processed.
>>
>> This should guarantee the helper functions don't return prematurely
>> while still returning proper values of either IRQ_HANDLED or IRQ_NONE.
>>
>> Reported by: Liu Ying <victor.liu@nxp.com>

s/Reported by/Reported-by/

>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>> Signed-off-by: Adam Ford <aford173@gmail.com>
> 
> + Liu
> 
> Sorry about the e-mail address copy-paste error.

No worries.

With this patch, it looks EDID retrieval works ok for me without
interrupt requested.

Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID retrieval w/o IRQ

>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> index ea271f62b214..ec0b7f3d889c 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> @@ -401,7 +401,7 @@ struct adv7511 {
>>
>>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
>>  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
>> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
>> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1);
>>  #else
>>  static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>>  {
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
>> index 44451a9658a3..4efb2cabf1b5 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
>> @@ -119,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511, int rx_buf)
>>         cec_received_msg(adv7511->cec_adap, &msg);
>>  }
>>
>> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>>  {
>>         unsigned int offset = adv7511->info->reg_cec_offset;
>>         const u32 irq_tx_mask = ADV7511_INT1_CEC_TX_READY |
>> @@ -130,17 +130,21 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>>                                 ADV7511_INT1_CEC_RX_READY3;
>>         unsigned int rx_status;
>>         int rx_order[3] = { -1, -1, -1 };
>> -       int i;
>> +       int i, ret = 0;
>> +       int irq_status = IRQ_NONE;
>>
>> -       if (irq1 & irq_tx_mask)
>> +       if (irq1 & irq_tx_mask) {
>>                 adv_cec_tx_raw_status(adv7511, irq1);
>> +               irq_status = IRQ_HANDLED;
>> +       }
>>
>>         if (!(irq1 & irq_rx_mask))
>> -               return;
>> +               return irq_status;
>>
>> -       if (regmap_read(adv7511->regmap_cec,
>> -                       ADV7511_REG_CEC_RX_STATUS + offset, &rx_status))
>> -               return;
>> +       ret = regmap_read(adv7511->regmap_cec,
>> +                       ADV7511_REG_CEC_RX_STATUS + offset, &rx_status);
>> +       if (ret < 0)
>> +               return ret;
>>
>>         /*
>>          * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order of RX
>> @@ -172,6 +176,8 @@ void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1)
>>
>>                 adv7511_cec_rx(adv7511, rx_buf);
>>         }
>> +
>> +       return IRQ_HANDLED;
>>  }
>>
>>  static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enable)
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> index 66ccb61e2a66..56dd2d5a0376 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> @@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>>  {
>>         unsigned int irq0, irq1;
>>         int ret;
>> +       int cec_status;
>> +       int irq_status = IRQ_NONE;
>>
>>         ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
>>         if (ret < 0)
>> @@ -478,38 +480,41 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>>         if (ret < 0)
>>                 return ret;
>>
>> -       /* If there is no IRQ to handle, exit indicating no IRQ data */
>> -       if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>> -           !(irq1 & ADV7511_INT1_DDC_ERROR))
>> -               return -ENODATA;
>> -
>>         regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
>>         regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
>>
>> -       if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder)
>> +       if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.encoder) {
>>                 schedule_work(&adv7511->hpd_work);
>> +               irq_status = IRQ_HANDLED;
>> +       }
>>
>>         if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERROR) {
>>                 adv7511->edid_read = true;
>>
>>                 if (adv7511->i2c_main->irq)
>>                         wake_up_all(&adv7511->wq);
>> +               irq_status = IRQ_HANDLED;
>>         }
>>
>>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
>> -       adv7511_cec_irq_process(adv7511, irq1);
>> +       cec_status = adv7511_cec_irq_process(adv7511, irq1);
>> +
>> +       if (cec_status < 0)
>> +               return cec_status;
>>  #endif
>>
>> -       return 0;
>> +       /* If there is no IRQ to handle, exit indicating no IRQ data */
>> +       if (irq_status == IRQ_HANDLED || cec_status == IRQ_HANDLED)
>> +               return IRQ_HANDLED;
>> +
>> +       return IRQ_NONE;
>>  }
>>
>>  static irqreturn_t adv7511_irq_handler(int irq, void *devid)
>>  {
>>         struct adv7511 *adv7511 = devid;
>> -       int ret;
>>
>> -       ret = adv7511_irq_process(adv7511, true);
>> -       return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
>> +       return adv7511_irq_process(adv7511, true);
>>  }
>>
>>  /* -----------------------------------------------------------------------------
>> --
>> 2.43.0
>>

