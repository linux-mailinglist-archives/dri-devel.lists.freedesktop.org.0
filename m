Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DD85EAF6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5095D10E3DE;
	Wed, 21 Feb 2024 21:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="rjlfp4wQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2135.outbound.protection.outlook.com [40.107.6.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCF610E3DE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 21:34:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdJCF1JUL8Gq0d61Gw5g4p/Rjq9TgTgSK+WkqCAMYxPOOgdxpHkWTe9L5xaWXx8NPZm7DcRrQeT8WUd6tYspMlAiURRWSUDRu6UgJC66/hN+P3EOFkBehsJv3Xidpt4eV3aZaUA280XKTkQdmkJtf5NAxUjt/ly9evqOW9wRxe8pDjmxNsjbKRhZg7QODBIrzIl0g8aeUbicr4jenIzV3XimVR7ao1PG8nOXC1+CpEpkcBXSSEMBMNwBPWQA9m4H4vUQnUX7dNOJ31j5MWuVz3Z4PK5XItZ29Ka/gtRAC+icdgs1NjTHF4GKB2Y6GLqmjzEhI4XZXw4NCpnK2F7RmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTC5rKkkP24K9S+TjQREaokE0Lm1WOZkJTluCu6158g=;
 b=hGvfYMaDKpilT0XxWY3FnqZzysHVfNQnVWgYpqBZ6Z0pUAZJKiDstuucdvjVFeHDgvGHmv0oMMRUivfHlLDaU7PIoHixmq33mIoVclAY+fSKdmzlXcn/gTYnd+S824/5Jp2dkgfa1ZokNwMX3YZMwXSOCi8nwmyM+gRjajwPci6fQ+7q9OOJ+hwBtXkNUKeSovcmqAut/qo3kswT5eoW7dzYMQQYdOXBZU0wVJY2uqnkQXVnlDyIhYmec9+hzDktnjpgq2cASZx4oYYcIc47KRymocZEFephyraTb7G/Enw6OyEUr5pkAiSA7oQyxcWhno5BlT84GjbCsyg0J902QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTC5rKkkP24K9S+TjQREaokE0Lm1WOZkJTluCu6158g=;
 b=rjlfp4wQ5pChljfJUpY0IOzIIwUqlD3uL4TistQoyt9ARmO6pXJZ1/0IKfuaCwRIljN2yCmBaQGbMFuBG+BBxPXAZmnTiFlYjoAF9mcOpGsNvpb0GBU+i/MRSsaMRbn7NBAZl+El/PuRAI7WxBlH39mM911ldCkILzD7IvMX0UA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB3PR08MB9036.eurprd08.prod.outlook.com (2603:10a6:10:435::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 21:33:58 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Wed, 21 Feb 2024
 21:33:56 +0000
Message-ID: <6a4f1862-ccb1-4d6d-bab2-f22090a1a08b@wolfvision.net>
Date: Wed, 21 Feb 2024 22:33:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
Content-Language: en-US
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
 <ZdZcLOlSc3FScjLK@google.com>
 <503d9ea9-9812-498b-a5ee-2579ba8a7ecf@wolfvision.net>
 <ZdZokatitviYZ7rg@google.com>
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <ZdZokatitviYZ7rg@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0197.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::7) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB3PR08MB9036:EE_
X-MS-Office365-Filtering-Correlation-Id: f019f5e6-ad4a-4105-5e94-08dc3324cf04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9LkB5i3Qgw8zMzOKvrTSAJ59QFW1h4XjBxqal0O11IfreeO+TvQ9lf0WXzkGhGP7QInnxy/nxwlvoSWmRDJULGZeZgOUTA/GEvWTjCeBOK33s5VFLUjjkyF/h0VK408g3JkN/qsi8HDEBLnl0xx9MHuivhuqxSVSTfPaLb2BL/P553yeVbo6gPHLkeAri4Os7WlROPgOHj44bw8BBlvXP2tH6k2oaEdTXsiGWdnKfTF4L5l6485rDO3k8WLOCT9nT7LcX0jDKqMC5LUOyLV4vcLpMVNbTqLJ2x7T7OmJ1WzBnID7N5gDm7Mt0kIdCMVaUaQ/yovDjtRBGyOdlZf1xgHkNIkKTaGTriLdNu6JDmkwE4J5o+DowhS1m8kqRIVJQfGm38pdOfkxkGFJZ4yHMw0NQTXMShRuIt+tSxKiDdiZd6hgbzakEVNAzAVU+44SCLCB/EAzDPUQqDWBtgFLmG+7XXv4t0SrabEhiWbnLy7VK8A91XE1g0XFoFkuEAlooKrRwtbUXaXkXH3OiFmYh9JE+RsTvdOOjnDf8994CFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDRyVGs3N29zQ0xtV1lJbmRzU2VEMUZwVEk0WlR1a3BzNWtiSzYyWjVqM0FN?=
 =?utf-8?B?NGVHYVNjV05DN2YyWXVETTRxTTQyc3pZVy9Ld05aZmhib2s3TVI5QlZaWDNU?=
 =?utf-8?B?aWY2WVoyQ2RrNlF0c09Vd01pVHlxRGhrbFJ2VDdPSjZzOFc5c3JoSXo1bk5i?=
 =?utf-8?B?RjVQbmVpSW9kZlQraTNSR01pUjlEZmRXaVVGTUc3NTVqMUYrenFFSjhBUzkv?=
 =?utf-8?B?UURMcGZGWXhMemZLcDRDa2tqMTZWSElDMWNHa2NSdEpRNEJ2dUc4czh6ci9M?=
 =?utf-8?B?U0E2M252RnE4b2xQSUsyQlhsOWFoVGtYMjNScXVhNzk1TGxFdmgvd25EdGlV?=
 =?utf-8?B?aU9yTW41MCt3UmxRUWJVTmFOV3JMbXUyYXhmQjlyMzByOU1zQUhxclVuakU3?=
 =?utf-8?B?YzNZdmtkK0ZYVWM5V04vMmFHU0lQcG5RbGZsWGc1NENsUEpXTVFQaW1DNmh1?=
 =?utf-8?B?Y2dOUHJuOUJBTlQwZFJZN3FiRlRiZDVmRExNNVMwdG81OXhMSmIyUFJGSUYr?=
 =?utf-8?B?N1A2M3cxckdSZ2c4THl5ZzdDNzBpRTBXTUk2cG9rT01YSFgwdVpWclorL05j?=
 =?utf-8?B?NURjVEsrZ1E3NzFtV2Uzczk3MkJLckpJZFl0VFZaWUg5Smw3a1FpMWg0VEZY?=
 =?utf-8?B?SGVpcGNNMjduQUFTTXZ6MVVxMEpkRWJzaEFwYndVV1k4eE5WN1hHWWdXYUp6?=
 =?utf-8?B?MW5GQUUxY1A1NUpCMGxVSVFWSlJiTFhSazU0WGVYWEUrSGdQSzdBdjhsNHVU?=
 =?utf-8?B?MDRVNWJ3QkFEdXpHNFdyUk1qMkZwS01yU3podEFWMHJyVEZsRjBvbGxMVnlT?=
 =?utf-8?B?ZnViQnp4b1dSakdocnJQR25KVDRiQ3h1cUoydWRLZWl6YUFNT3EzL3l6OEZN?=
 =?utf-8?B?akVDZ1U5RG5lNklWdEIzWFU4bmVTVXV6SmowSms0eElRcENlM0F3TnlIbnYv?=
 =?utf-8?B?YU1sM0FFZVRGOUV4MWl2WGk4MnpBY0QwMkJUMyszU0RSeG1BL1hOdThvQkw0?=
 =?utf-8?B?RnhmSjdoR3lJaHhhUW8yN2NNN0xGUkVBT2tnREZaVktHSWRaUVhGeFBUNTZR?=
 =?utf-8?B?ZFdITHFPMDRaRmZvdThURkcyUjkwaGFQdE9qSmlGK0NJRU8xZkc0OGJ6N2J1?=
 =?utf-8?B?dnpXYXNudHRic0s2YXExVkRVNzRSdHljMkpDanNGNTdzZ2tGYzlKejNxckNS?=
 =?utf-8?B?U0lNdW5RS1IzT0l1Mk0zZGR2Y2J0bFBSMVNOTFpjRG5pdTR5N3hTWTl5b3hN?=
 =?utf-8?B?RmdBRjFvb0hVVGYrUTVIMDk1SExxS0NNL1loT0UxMWh1V21pWjNZK2pNcGtR?=
 =?utf-8?B?QlZLRmFaUVhKS09mTmlXcG5FS2JkS2ZFcGdPamw1NXZ1eHcxd0RRZEQwLytx?=
 =?utf-8?B?bitNelZJRnJqWmRMM0dYTTNEVENUeEhoRGZpMG0wRmxsaENEc1VWL1F6dmJZ?=
 =?utf-8?B?bVZ4VWF1RnpJU2p0ZkV3ZVRzbWFqNkJWWEk2SEFQSnVRc1pQK1Z0V2t5dTVT?=
 =?utf-8?B?bzFMSkdtcHkyUHpFQmF0cFh5QXV1SUZqNDk3SnZTNFlCM3B6cmY3OVZacU1q?=
 =?utf-8?B?STdIQko2d3E1Zm5CV1RIUkJockw2SjRSUGRBNWpQbVBLOUtUUFRzM1pjL3gv?=
 =?utf-8?B?T2dpNFlOUXNWTCswWm9vM2ltbmRFbWFhWVVadFJyNnRNZDVpS29iM1FUUTJM?=
 =?utf-8?B?UUExVDIxODJJd3hLdmxtWTlLbmZxNTcyb1JyS1pPSlhCWDdvZ3J6SVk2bTRi?=
 =?utf-8?B?bG1NRTJLdC9VREczNm9KcER1akFhKzNLekNkd2w5TFlUN04yV21YTVRON0xx?=
 =?utf-8?B?U3VmNDdvZkQzVWtRQXBHVEJkdEZYOU1aMVNPdjdVd3ZqNk51VCs5VHNHby9o?=
 =?utf-8?B?azQ1cHpNZFd4L1RhbnJYM3RVTVhwQzJSZ3NqUTBaVkRvTG1UKzlKbHZrRkQ1?=
 =?utf-8?B?Z1QyNjFjbjI3c0J5OGh5UUpOSDdIQmJmY1JzTzVOZ2hkc1ByOTgybDVVNWJM?=
 =?utf-8?B?cHV6TUJoY3BiWXRjWkdGbWp1OTZpUEh2TVVWSDBmbWczelV0N1FRK2kweDlx?=
 =?utf-8?B?S001SWdMbVNqajVTQ2xocnZDVHpYY0QwWFpTeUhzV3FuQ0tRNG53SElqb01J?=
 =?utf-8?B?WTM3QXRvZE5KeXVTcjJPT0Uyb3RTR0wrd2wycTlQZUpYL3J5UDNHT1hPOVhS?=
 =?utf-8?B?ZE4wRjY4MitGT28wZm9wV0p2VmtHblBZN0xjNDdkUFlOcUhwZDU3WDhJTUhq?=
 =?utf-8?Q?ZtSj5WG/AZc1uQP++5NUB8ger375RbSAZyycLaPKuc=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f019f5e6-ad4a-4105-5e94-08dc3324cf04
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 21:33:56.6295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQD7ftecaZlNKUyOk/EOo+dlMZd8q2ZBaSTa4BGZqIzSdvcQFI6SBMOO13FEyDs3RTU9brgpiZ/OFlvJhEp0bHNap+dRSo+L4svtXf6X/mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9036
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

On 21.02.24 22:18, Matthias Kaehlcke wrote:
>>>> +/*
>>>> + * Fallback supply names for backwards compatibility. If the device requires
>>>> + * more than the currently supported supplies, add a new one here, and if
>>>> + * possible, the real name supplies to the device-specific data.
>>>> + */
>>>> +static const char * const generic_supply_names[] = {
>>>> +	"vdd",
>>>> +	"vdd2",
>>>> +};
>>>> +
>>>> +#define MAX_SUPPLIES ARRAY_SIZE(generic_supply_names)
>>>
>>> This will have to change when support for a device with more than 2 non-generic
>>> supply names gets added. Please use a literal value for MAX_SUPPLIES instead of
>>> ARRAY_SIZE. If the literal is 2 it would still need to change for future devices
>>> with more supplies, but that change would be more straighforward.
>>>
>>
>> I am not completely sure about this. Someone could increase MAX_SUPPLIES
>> without adding a generic name.
> 
> That's perfectly fine and intended. MAX_SUPPLIES is a max, any list
> shorther than that is valid. Any longer list will result in probe()
> being aborted with a clear error message.
> 
>> Actually two modifications will be necessary for every addition (name
>> and MAX_SUPPLIES). If ARRAY_SIZE is used, only new names are required,
>> and MAX_SUPPLIES is automatically increased.
> 
> As per above it's not necessary to add a new name when MAX_SUPPLIES is
> increased to support more non-generic names. It would only be necessary
> if more generic names were added, my understanding is that this
> should not happen because any newly supported onboard devices are
> supposed to use device specific supply names. I don't like to idea of
> adding unused pseudo supply names to the list, just for the sake of
> using ARRAY_SIZE.
> 
>> I understand that the whole point of this is getting rid of the generic
>> names, but we still have to provide generic names for every extra
>> supply, at least for code consistency and to avoid size mismatches
>> between real an generic supply names.
> 
> Please let me know if you still think the extra names are needed.

Not really, the only case I could come up is if an existing device that
uses generic names might end up requiring a third supply, which would
also be generic. But even such an unlikely event would be cover without
ARRAY_SIZE.

Actually one could argue that every existing device could have "vdd" and
"vdd2" as their supply names and remove checks and the generic array.

Best regards,
Javier Carrasco

