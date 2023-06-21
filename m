Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A78738BB1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20FD10E31D;
	Wed, 21 Jun 2023 16:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BB310E0E6;
 Wed, 21 Jun 2023 16:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLDx3A+a6aPJqVZKEx7tojngtCG1ozYmNULzrel0RYLtaMLqBfKL0dK7+ufntnCc0aC+F+RT0nuafzXvRPpQo7uxOowTh/UaDXVuMLzideQDIokqq/qhKB/w34vbQlzA6bniqKvratYMEfXJTXGcT2+0Utb+cd7ANM4+wIHkhrSSRVHt/5LexmhQUO7uFSxJT7kI6c79B3UgcbGbmwXtNQ3vzKbN3hjokBi3r+oUotEPzt8SVT5tTWH96iIsOjfgXEZ3KJZ3IFqShHcjo/JtTXGskRq26RNDHaG/8RjeK5CEdHuuGOcc4C/PEhvwYs/D9xd65byIa+sDKw7ZByAYHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUYbWrQ+zPB07uR1CBNGW3GRoewV9yYqBIfqGrlcT9M=;
 b=VGr6tTsBWlY3IfeT698xKh6qFzdFOwGk+mFOWFEmZ7icRdZOorPm6MXs7RBym9a55hNKDnc5fe2J+U5/qoZwdWr7aP5F38i7Qw6j22UGgD2YNH8ugBdVq2j2okXtTAFn8I3t27rQWzavL3qK7Cl4kiOA9CBKkmZRNyLyPNZY+Vx84HI/aw+qxQz9G1xOju9J3uXv0javvX3LSTawyNBJ7eeSphL2rl3JNiBKEuFacmtsTrMIBRYZTX+Das3e+Kd7vM+WoxOBhGNPbsRa7Gubgo0DhOvKdbciLq3nBRQV5Gy0f3DvE9ikY+U36D3502fIk/KTE9fvRQCBnJyRfBvIKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUYbWrQ+zPB07uR1CBNGW3GRoewV9yYqBIfqGrlcT9M=;
 b=vTCKrzbOhpvH0nBy0RIfa1P9E5twbtqZBhJACKnGwEvqLo0ZdYbQNAVgWrsB7S6pkiK5KfFlM8tfvf5FLWv7WRW0ScsWFqLwSq4e0wAFlLts29kGy/BvWooIlADB++WHkoY7HwTnzpyjCi6gYg+r2lJdm6BHA8SihEm8ls9sJrY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 16:40:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 16:40:35 +0000
Message-ID: <d1e01e52-df5f-a595-eaa1-95466f7b4ff8@amd.com>
Date: Wed, 21 Jun 2023 11:40:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <3a7c8ffa-de43-4795-ae76-5cd9b00c52b5@lunn.ch>
 <216f3c5aa1299100a0009ddf4e95b019855a32be.camel@sipsolutions.net>
 <d2dba04d-36bf-4d07-bf2b-dd06671c45c6@lunn.ch>
 <98c858e6-fb18-d50f-6eea-eddc63ba136f@amd.com>
 <9435a928-04c4-442f-89f2-e76713c908a5@lunn.ch>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <9435a928-04c4-442f-89f2-e76713c908a5@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0101.namprd05.prod.outlook.com
 (2603:10b6:803:42::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 88bd5afb-c3ab-436d-03dc-08db72763c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rrJGKmgiOmYvnVX85sMbqiEMi3hGo9mWNoMIhPP/bMLY97F0yljN11eZbwVj6SBpdTApbmda1Du4Bi44u+N7oZML9slefrpaefSp6sYYbWDza2JQQtTr55jkoYjQ2oJFQA5QEFsfDjolXAOD4Bd5gUWJULKMXDnuBaCM+VXV54ZHalkdfoW0bS+nVzsU0OJAEJ5tsoDJ3ndoYo6/2E5VJaiZsmYH25CEFt1O98ZnFWlI3G2TY3hkilk4ZO9ukwOYT9JFXM9n4mcUtp0kZ1hbA7DgSOWpjfhg17VMlNiwEgu1ke1ajJtcRExW1D2Bx9SWW8fiDXSTdT47eaBKJUy7uJKEmFpRfDdKDGtNwm17vtGeaXmmb/mc9Cj4Vp7qMZ0PqV8/YaaBwDsb8LYk3zcOWgdmO3sdJ3lAODYv6oj9GoMhCkA+fjWyP2PEZaxUFQRqCPyMTruMvmlJ255VmrqA7uXN+a4AS0aYyRQTyC0gv5C9bYgp8azCb/MRM8NwU7+3kp1hC6/8ht1uHp9artILlc/c/8p/oak3p/0//tD+Mm4DP7B3AscR8DLNrcaGvliV+8agOQbrQKNswlYmXyrVsizG43sj89P9Ul6hwZ6I39ITmiLsarPM7D3DSldSkuEgeZzdX6k6xT9acALxQV7O9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(54906003)(6666004)(66946007)(66556008)(66476007)(478600001)(26005)(186003)(6512007)(2616005)(6506007)(53546011)(6486002)(4326008)(6916009)(316002)(41300700001)(8676002)(5660300002)(8936002)(2906002)(7416002)(38100700002)(36756003)(31696002)(31686004)(86362001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkxUU3VkYzlSN2VyNVNJSTVSc1F3MDQ5Y1FoQ3N2eTNLZEU3cllqbDZnbEFO?=
 =?utf-8?B?ZVY2cTJFY3N3WGpJNE1YaDgzdnlhdHQ4OTUxQm1xYnFyYWtRb29HTHNNUHU2?=
 =?utf-8?B?YmE3WXhzWUM0TTRmcGlram00OTFUSlZ4K1FxWkhqNGNoZHVHRGlhRmRWZWpI?=
 =?utf-8?B?bzQ3d2J1MzFDcndVRFpYdGhOZ3N4d1RFVzVVWEluSG5KbjQ2MmcyRVJDN0Ey?=
 =?utf-8?B?UXJZcFp2N1pWM0Y1WjRXV25TZFJ5V3BCcFlLM0l5RyszS1ROT1VldTFKZTA2?=
 =?utf-8?B?c2F5SXdSbFpLMkdTRDFQaHgza0UzMUtmVDlGejlJQnlBcmhadjc1RnEyL0NW?=
 =?utf-8?B?dDZ0aXpGS25RcGFaYm5XeXhFNzZLZGY5T2J2TUNyeW84a2FvbDY2eHNvUFpQ?=
 =?utf-8?B?ZEJLWG0rVHhrRStMYTBLa1dIcVN2MWhPclJuWEg2UldIb0lvbHdUQm9pdjJV?=
 =?utf-8?B?T2Q4OFdjZURadHErUi9QT1poNHBycjIvRk9RQjZzSDN6d0ZScFBSYzRjQy9N?=
 =?utf-8?B?Y1dGVHdNNXVpdXRta2tXa044NXdlTVZkMUQyd2I2eXQ4MGo4UU9sVjEwL05M?=
 =?utf-8?B?YlV6TE5CQ3RXa212M3plbFZMU2NrSWJ5ZU1vTHlxY09BNXY3UzVWYmxMdlpY?=
 =?utf-8?B?eG1hNmltZjRSY0ZUNDhraGw5emxDWjBpQ2RSaE1JaUliOUkweVZHQ3ZlLzNk?=
 =?utf-8?B?akpId3JzUUIzei9BZXVnbFh3UDgxQmExRGZET0FtMEZueE9ZOTRmcDVmajl5?=
 =?utf-8?B?UEZVY2pHZURFUlgxRjBmZW5FWnZjS01IYVdvR2lQNk9TN2FpMWxKOTBmMmZR?=
 =?utf-8?B?RDJTaFFUbWQ3b3F1ZUxCM1RBakI3Y01URnpKUWxoSVVxZ3NmZEFGQWR2OE0r?=
 =?utf-8?B?bURMdkVnMW1uWHJrclQwSmN4bTdUTW9BTk9xMzZHNGswR0NQUlN1WjFhYWpt?=
 =?utf-8?B?dmdwbDg2MVdYUjJjVlFaOU83eHlUVmpiWk95bS9JbUF2ZkRIcG8vdDZpdzUw?=
 =?utf-8?B?eTF2Q2hTcTd6d2FMazNSdE9iOThIdFY2ODVveU1oWVV1MWhkSHlydVhadEV0?=
 =?utf-8?B?S2drdS9TL01BK1pVMjd3V0lJY2xucFM0eFBSeFZuSi9yUzgrQnZZcjkvRzRZ?=
 =?utf-8?B?MGZwMFJFQ0IrcmRRZ2NhK25oRTlKakFDUXhaWFgwdFJ4ZVU1Z09FTEVlYVI5?=
 =?utf-8?B?UUJyalI4TzNuYjZFRVJYUEVzaTJUdlBCa0w2VzB4ZFpzZDZiMG55L1R1STZD?=
 =?utf-8?B?K2RYU0tSQTRBQWo5Q3FETFhLTjE3NWNPRTFkbTROS1NTNFF5dTVWQmRXRHVl?=
 =?utf-8?B?enJKZk9zR01jZ3l6NjBSWTJtNUNtWkR0MDVTblVDemNmeExsQi9VUmxxRHRK?=
 =?utf-8?B?azUvNGVNcUllMjZMQWtIUE1CVUpPYmMrcDJFTmRaQ1NnUnZPMG1hZWhoTk9y?=
 =?utf-8?B?SDBaNXltT2dvSzRnY3pESjZleDNXZnFtWGVocTlxM2N2a2NKSTJ3Mmlqb3NN?=
 =?utf-8?B?cEtoQTN4aytrSGVNKzFHYU9pU295dVR4WXFJMTFaVUdhT0ltakZkQXNucEJP?=
 =?utf-8?B?cUxrUGhsOW9UTHYrV1NvZ280OVY3UnI2TUFCVjUyaDNuWDY1US9Ub1F4MU10?=
 =?utf-8?B?Wjg4cnpXYlJranN6Ym1NMElqN1Z3Q0hDa3A4b3dwaWhha0JvWXJhMEpHN3NL?=
 =?utf-8?B?Zkx4RDBNNitjTnRWWHI2d05kbWc0RzB0RjNtZks3MGxpSVk5cU9jd2hmMzIz?=
 =?utf-8?B?UE9ycDRKVEdmMGJ4VVplWGY4THRDYzJwSGVVQm8wazNGZGRJM0p0REdUanll?=
 =?utf-8?B?TjhEQzB0N3YxSWtISFRoV1k3SDhoeStnbS9tck1EdlVHS21pek8zWXpGZnlL?=
 =?utf-8?B?WENpeVFpaW9IR3NxR1kyOXRqSzlMUkc1UTY2NFBabUN4ZXZCcEhCcDZmN0hM?=
 =?utf-8?B?OU1nU1JmaWdCK3A1amdHYTZsV3JyQUFyeGJZcnQvUndkMm8yZmNib1NoU3FN?=
 =?utf-8?B?L2IzY3NTMEE0eGMxQXd1SmZCVFZBczhmUDc1YmNsaXhteGNJY0ZOcE1YVXpF?=
 =?utf-8?B?cXJKZVB0Skd5L2k5Vm1UZnhxUlJOS1d0SmdLSE1qdHE5UVVtS1Y3RGdEd015?=
 =?utf-8?Q?zHh+m6C+f3eDrkNaW3eqi/FCB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bd5afb-c3ab-436d-03dc-08db72763c9e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 16:40:35.3138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hnGOwTfL4HBw/eBTE8th0fofnMCVxyS3Fwj13cYt4a+a9u1zuRojGRQm4va5yNShydoWuZBjbN8BrXeN8Y1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484
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
 Johannes Berg <johannes@sipsolutions.net>, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/21/2023 11:31 AM, Andrew Lunn wrote:
>> I think there is enough details for this to happen. It's done
>> so that either the AML can natively behave as a consumer or a
>> driver can behave as a consumer.
>>>>>> +/**
>>>>>> + * APIs needed by drivers/subsystems for contributing frequencies:
>>>>>> + * During probe, check `wbrf_supported_producer` to see if WBRF is supported.
>>>>>> + * If adding frequencies, then call `wbrf_add_exclusion` with the
>>>>>> + * start and end points specified for the frequency ranges added.
>>>>>> + * If removing frequencies, then call `wbrf_remove_exclusion` with
>>>>>> + * start and end points specified for the frequency ranges added.
>>>>>> + */
>>>>>> +bool wbrf_supported_producer(struct acpi_device *adev);
>>>>>> +int wbrf_add_exclusion(struct acpi_device *adev,
>>>>>> +		       struct wbrf_ranges_in *in);
>>>>>> +int wbrf_remove_exclusion(struct acpi_device *adev,
>>>>>> +			  struct wbrf_ranges_in *in);
>>>>> Could struct device be used here, to make the API agnostic to where
>>>>> the information is coming from? That would then allow somebody in the
>>>>> future to implement a device tree based information provider.
>>>> That does make sense, and it wouldn't even be that much harder if we
>>>> assume in a given platform there's only one provider
>>> That seems like a very reasonable assumption. It is theoretically
>>> possible to build an ACPI + DT hybrid, but i've never seen it actually
>>> done.
>>>
>>> If an ARM64 ACPI BIOS could implement this, then i would guess the low
>>> level bits would be solved, i guess jumping into the EL1
>>> firmware. Putting DT on top instead should not be too hard.
>>>
>>> 	Andrew
>> To make life easier I'll ask whether we can include snippets of
>> the matching ASL for this first implementation as part of the
>> public ACPI spec that matches this code when we release it.
> So it sounds like you are pretty open about this, there should be
> enough information for independent implementations. So please do make
> the APIs between the providers and the consumers abstract, struct
> device, not an ACPI object.
>
> 	Andrew
Think a little more about what a non-ACPI implementation
would look like:

1) Would producers and consumers still need you to set CONFIG_ACPI_WBRF?
2) How would you indicate you need WBRF support?
3) How would notifications from one device to another work?

I don't think those are trivial problems that can be solved by
just making the pointer 'struct device' particularly as with the
ACPI implementation consumers are expecting the notification from
ACPI.

