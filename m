Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E840738AF1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6531010E272;
	Wed, 21 Jun 2023 16:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BDB10E31B;
 Wed, 21 Jun 2023 16:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+ow/TwN8XwpsWGVk4ZQ+dzozzq01gleJd9ZNfU7ewqHSIz5++GBaRgOWNramiCdQRkHrIrVCPjJ7k+ojrw2PVs3QS1N5IpkovtCJigfiurIecfKyw32zszvZ77RxDmL+WwiTRV5VMEtk3BuhFHrT/dE/glfV6Af8GN9ugO2gqK3mxtoUG/TfvAkZDilz5OXt62ljNwjOJbF1qo9+mjHc1dz7/Pc78h3je9KU2uw2sqRIsyOOU78HlE9XoTAjIgFT+FTv28nd4xXd9TI5dYW3+9o/1iImz7TSv7YWCF8V/ZZRxjObjGZczL0nfWSk1nenIrpyMmDCRYrx+qz6pkrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3a5xOi3G+vEGom6/mlC/alCWP8iJq4Ln7/GSF7VQHs=;
 b=NcGQsoc6sDXU/xWyncyHQwYNz8Yq1uoazCuuhwCffiD1oJzibJ1jE5hUPwfpv1LL1UCBbu9fMdZt8ymRduEaqxBbHOrGFxe8h8cXaaRnJaihZv4sqGW7k+2gWd3BklHA0B7Ew+5GLQ6ZLNNLXE3d/QHfLrAsufW9cWD7GZrf2F/rzuqIUkY+UA6GsGZoCeyspLwdzrSQhL1D/KT/4uV7mLXg0tbih208RbJvnlD1ll39PV1CGLfsupGU92PXalpiwL960ayfLc8UZrj/bAdtXnw6/zqvsM0Z0SnIGuQCeXysNk7E6yLm3OaR3xtVoAoCiUr8Z8lNJlAkca2gS1Tmqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3a5xOi3G+vEGom6/mlC/alCWP8iJq4Ln7/GSF7VQHs=;
 b=ydtnyn6MPWptlxDCCVbWmxao018a4NHzQlp4JXLDtHFKAomhrCtCKqj24oKN2stuB9iJXw4/v6uxVHE0FRODWsIzzoa6YPjw6rW7qplFFz99Zabk9fiS8ymFgK0EgFwofK59qfFYOLTiEAfQrGdkhoU16tTvBnTYWt645or6g8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB9162.namprd12.prod.outlook.com (2603:10b6:a03:555::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.39; Wed, 21 Jun
 2023 16:23:18 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 16:23:18 +0000
Message-ID: <98c858e6-fb18-d50f-6eea-eddc63ba136f@amd.com>
Date: Wed, 21 Jun 2023 11:23:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Johannes Berg <johannes@sipsolutions.net>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <d2dba04d-36bf-4d07-bf2b-dd06671c45c6@lunn.ch>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <d2dba04d-36bf-4d07-bf2b-dd06671c45c6@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:806:f2::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB9162:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abf2f19-a929-4efe-deae-08db7273d2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CtWJRCiaOVSNFWFeX4W0f2cSGNbTHgQUyzlMISbUYYMpS9iqfyrqyFLRi0yqVuELenI8qoxjAAX3pWgPVRNpGth9m7+M8QIUJ9Xtz0dugjEMme/xuoEXOr5vJnKv5KcsS9DsrOJsF3czCCgHD1YBdHBDhBbVyK0hTDYYd2KZKerEnkai74/2QPG8D5SNagdc2wMGQ/u7Jj52pPz7SuEwhTRfyrRIoh1pLkGnK7bUhJ00JgmOq/uN/zHo3nFTd6RKafstP2jGgAXvwYfrRDxUDUDxAusS8+G2J/MsvA1riCR9ztP3NDBn0wRHY0OR7nV+jsJKsOp9viW+Ez8BBZoOqmZ+OoIp6pFwhZQQiryl/RlzUmuI7tvMVYoXasYNN63z/16Gm42sy7vcrpIEikXSBhFePMCl9f6ofexV4mWERp7lolUiJQSU9JN5si5zfqClgYaqvhcon7k8WR7DtrGL0/WuagZO8RNpW578Rxo4q3mgomzp/gG7CGN/8jdX0bfwnZmmyFS2JEWlDjkApwmWPctLYCbeLSlcseHriNSkm1varl9GZGw8cYLh7jd67YwzLruZDh4Ijc5IHLRh4cuxVlhDzSEydjmr541W3SGBN73FC00/DDsrisHUl2/LFu9cS4GgjgNRzVRz5lByZmYx2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(6486002)(8676002)(8936002)(7416002)(83380400001)(6666004)(2616005)(5660300002)(66946007)(4326008)(66476007)(66556008)(478600001)(110136005)(316002)(36756003)(38100700002)(41300700001)(26005)(6506007)(31696002)(31686004)(186003)(6512007)(2906002)(86362001)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUxuZ1lpVm9rVWhxV2VDZGJxdnpYN0hnZ1N0L25CSlFTVHRmUFFBRUtTWmRW?=
 =?utf-8?B?Zld6OU9YOE9hYVY4RFFuRmU5UkZTSWZQWFhXdXlySkp2U0RZUmtZMVVLSWt5?=
 =?utf-8?B?UnJ4NG5CQVhCUTAzN2dINWJYbkY4OGk1K0RodG1rY2xoc2VLNHJZNDNYYzRt?=
 =?utf-8?B?M2pVY2U1WVlEbzI0YnYzZXBNNk5IcHNnTUV1ZXBKSkczU2h2MFBWcHN2Z2FO?=
 =?utf-8?B?SnlIYkFwUlB5dlhXdWg5NXZrM2pJSkR5TWt1SlNiVVNtYnRGaTBzSzNwTmFm?=
 =?utf-8?B?Ym0xZk82NldQOTRFbWlNRHBra1hEWTVOeWozeDJXbzdJQ3NOSmViaXJoc3JH?=
 =?utf-8?B?aDNFVWdncVF5dVB5eGxSeEV3RXRRMHhxUFFHQXh5akxtaURmazZzTnhRUHNr?=
 =?utf-8?B?RDk1QXRaZ291c09UejJDSkQyV1JXSXMvcVBPRDJ0N0dZQW9jSzdZdWQvYkpF?=
 =?utf-8?B?Uk5sNGxpdFJOdHY0cmZuYnNGN1IvUkJzNW56cS9oY0FxellkY3ZzMFRDZkpY?=
 =?utf-8?B?d2xlNGE0Z1hxQmNHMnd2RUZZQnV1QkpsQjYzaHRUR2o4RzQxem1ScVhNRjYv?=
 =?utf-8?B?cXMreGVjTGhiNEV0ZHZBTGthdSt6b1M3YmxiSjBIcVlMQVdoVzVQZTFqQlJ0?=
 =?utf-8?B?Q28rNXlIY2hEenRtTUluVFduSTNOOHBsVUF1VTNwYklwOTdDSnNuTlRJNUNi?=
 =?utf-8?B?c2VhTWlKUE8xN2xjbnRueGo0bTZscEVMQVJQM3VWbHg1WmtVY2JBcklxcDZz?=
 =?utf-8?B?cUtIS3NqMklmRHphSmpIQ09UM3p1MTk4Ty9HczRtQzJHYWJIRmJkTWgvb0xh?=
 =?utf-8?B?UTdIcDlWQmhTNk5OYTZNVjc4QWkzUm5BSGxyQU1uQ0JnYU13MURaVXpTaHhl?=
 =?utf-8?B?Sk9iTDNVVytKNnVoUjVVdzRjMWpHQzZPamRSZldWN2dUZ2pBQlBjT0ZtZ2Nz?=
 =?utf-8?B?dlJMelVrQ0VSUTVsQ3pyRE9sUlpMUE5mam1zTE9xdFN1aVA5M2FoR1FTQko2?=
 =?utf-8?B?aTh5QlVqbnBnV3ZpSnlMU3ZYRjFvNVIwdlA2NGlyM2xjYk0xblhjamZuZC9B?=
 =?utf-8?B?dm5FNVFIVE5rMm0ySzZoSXdYUFIxNE50VExEMGpyTXlnZFJHSFlaWk1mT0Mr?=
 =?utf-8?B?dkI2NmlnZWJIcUJLbDNIRmZqL1JUMk1MVUVUZnpvNUNJYTFDOFRDcytlcGV6?=
 =?utf-8?B?Z01mQk9PRTFvaW5HVURmM2ZHTjVsUUZwM2xvNGZJdEhzQUoxei9yV1g4UHlE?=
 =?utf-8?B?YnNNYytPaWY5azlrUHAxUi90WHU4dk9ob2VXa3duMU91bGxTY2NaYndmVGt5?=
 =?utf-8?B?aTZWVmVjRUFEYlAzbW5FSjFxRDBsOWRMcUpINmNIQVkxUjFWSXNzMHk1L0pQ?=
 =?utf-8?B?eC9wb0M1MWpQR0ZMNlhMN09uN251TXlHQXJUakdEWE1rZFhiYmZUN0VhN3Vk?=
 =?utf-8?B?eDdTSDZqN3pzUEprSFVZNk0vNUJ3bWZ3Y1dFN1lUZVMxaXBoeHIwdnNKNEh3?=
 =?utf-8?B?c1R2QU85eWtiUU9heFRZNHVKSE1rSGRuakgvL1lWcDVHZ2NUbkM5QzFqeWV6?=
 =?utf-8?B?ZnVFUzUvajU1TGk1L2FUc0tHTjdhUHpTYTROSjl3QXNNRnhocEcxM3lqODc3?=
 =?utf-8?B?MlRsdmkzaGpXVFVya0ZOU0lvWlJVYTJMcFVtMFpiNnRESlNjdjg5K0dQelp2?=
 =?utf-8?B?MFBJQ2pRQitGK3gxRFB6am05TnVPNnVzSXpadVEzNWR3R2tSNmtqTmJMdTc2?=
 =?utf-8?B?dTU5d3p6N0VtZmdxM2x6bjNDRzFteS9zckN6bGFMckVzemJmNXcybzdnU1V2?=
 =?utf-8?B?bFpCUlhXdFgyTnRtQ3ZyVkdwamV5UjU0VmFVWHhzd1d1ZU1NU0N5Z1QvMS8w?=
 =?utf-8?B?cE5CbDhIcjBiK1MvZXlmT0dpeWRZeVBaTzlqMWo3ZmVoRG83ZUI4WXZQNzlh?=
 =?utf-8?B?R3Y3eXVQMGMxUWpyVXJmcnBMeS9EWnJ2aUpack9CZng0MmtaU3lQUUN2U1NQ?=
 =?utf-8?B?K3BlVHFZeUtKanQ4TUZQUXQwR1hoa21LTXJuUUs4Z2g0ZVlDSys3Zy9vVzU0?=
 =?utf-8?B?TXNraEZrMFJCcXhuUWdibjJlb0I3VzdPZUhMbzMwVlVFVGpTNk9PTHV0ZEVV?=
 =?utf-8?Q?5Ldg+gyj2xxeXO1kuPKwK869A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abf2f19-a929-4efe-deae-08db7273d2bf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:23:18.7235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLSJKGWkpJknsbN8tQRioPWmonVgCFP+Mckzn+0Z6/3PwdHPQy2HAa8oUiOxvrPar59F9hXvYPvrtuZDA7/MXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9162
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, rafael@kernel.org,
 trix@redhat.com, lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, Evan Quan <evan.quan@amd.com>, netdev@vger.kernel.org,
 Xinhui.Pan@amd.com, linux-wireless@vger.kernel.org, edumazet@google.com,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2023 11:14 AM, Andrew Lunn wrote:
>>> Do only ACPI based systems have:
>>>
>>>     interference of relatively high-powered harmonics of the (G-)DDR
>>>     memory clocks with local radio module frequency bands used by
>>>     Wifi 6/6e/7."
>>>
>>> Could Device Tree based systems not experience this problem?
>> They could, of course, but they'd need some other driver to change
>> _something_ in the system? I don't even know what this is doing
>> precisely under the hood in the ACPI BIOS
> If you don't know what it is actually doing, it suggests the API is
> not very well defined. Is there even enough details that ARM64 ACPI
> BIOS could implement this?
I think there is enough details for this to happen. It's done
so that either the AML can natively behave as a consumer or a
driver can behave as a consumer.
>>>> +/**
>>>> + * APIs needed by drivers/subsystems for contributing frequencies:
>>>> + * During probe, check `wbrf_supported_producer` to see if WBRF is supported.
>>>> + * If adding frequencies, then call `wbrf_add_exclusion` with the
>>>> + * start and end points specified for the frequency ranges added.
>>>> + * If removing frequencies, then call `wbrf_remove_exclusion` with
>>>> + * start and end points specified for the frequency ranges added.
>>>> + */
>>>> +bool wbrf_supported_producer(struct acpi_device *adev);
>>>> +int wbrf_add_exclusion(struct acpi_device *adev,
>>>> +		       struct wbrf_ranges_in *in);
>>>> +int wbrf_remove_exclusion(struct acpi_device *adev,
>>>> +			  struct wbrf_ranges_in *in);
>>> Could struct device be used here, to make the API agnostic to where
>>> the information is coming from? That would then allow somebody in the
>>> future to implement a device tree based information provider.
>> That does make sense, and it wouldn't even be that much harder if we
>> assume in a given platform there's only one provider
> That seems like a very reasonable assumption. It is theoretically
> possible to build an ACPI + DT hybrid, but i've never seen it actually
> done.
>
> If an ARM64 ACPI BIOS could implement this, then i would guess the low
> level bits would be solved, i guess jumping into the EL1
> firmware. Putting DT on top instead should not be too hard.
>
> 	Andrew

To make life easier I'll ask whether we can include snippets of
the matching ASL for this first implementation as part of the
public ACPI spec that matches this code when we release it.

