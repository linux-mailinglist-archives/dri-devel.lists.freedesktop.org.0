Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914A6746826
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 05:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B5310E288;
	Tue,  4 Jul 2023 03:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B55D10E286;
 Tue,  4 Jul 2023 03:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiTqrfnpMSeLDLw23jzitj9YmiP2wm52dl+N3pd8LWBI9KHibWkHxyHXJKArKLxDRQ5rjhJ1WrXyU1x2Q6+gKa2VmNk/u/BUPIhoxoF4WxnwUzZl/HTLDvnhenjuwfeIed13sr9AUIQfgt0K2xQoB70uWnjTw79cj5iZQFL4TPJ6Wx60uV0tnOgSlW3hkTbrR44vhu+LB7+2nHdNnD4TWxVZ9cR/GThjP5pwS74piGB0JBaviSek3QJ4kd5CsEtT6hXs0cSXqoiAP2vIFkbX3IMFwOQdNkhigxrZLwqGMYDKyol0zcD7sglfhvs5EcVcx7M8iPcna4Z9Pbx+E5lhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o34C41h5Iv55/2XOjURxyJ2WfV/WeqrR4pVKVmszKk0=;
 b=H8f8N0EBCoN8L5RVK58sb4yur7M18z225xrxoMzTWNdeEfLh6fEIP6nTU5wzisKvnIoD+kpgvcdst2DWUqPeGAEqu/niAt/69BxaK/n1RqZQU4OAvSWt+Ne0hx4m8F5bIx0gSrx0doJ3xLg8SNzkMGrs5Z284Biyf5txhAzf9wvrGBiFbienlOY8IGpsBK1h2oGVoC4cwwA9uTCGBz5j/KysJK9U6WBlZ1UedLa5HPckxDot7vI9YxmDNh5/KSin8TQcOBHdmOggWuYiogH4qSmNBXT7aVxsfhnn16WRNobUD6DT2BD7js92qx6yDyQGGSAd90YekBSzXhZUJm+d+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o34C41h5Iv55/2XOjURxyJ2WfV/WeqrR4pVKVmszKk0=;
 b=rKyNk0htfJ7Q1nnQhuanQL8msqj9KpE6QVGBke4uf1UwrHj6bUr2w46aQURKgT5z/Y27I/x8GWWfMQ9Qcc0l1RJdq2bUW6CEENtXx6yWZjqnFY82n6m8xNRs/rUCH5fWdA0jdGmnux/rZ9pReHJnwzCKZq7BiHdPFFILJ3yGdlg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7995.namprd12.prod.outlook.com (2603:10b6:8:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 03:53:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 03:53:30 +0000
Message-ID: <e7fcc973-e829-df94-04e3-24c254ff1b3e@amd.com>
Date: Mon, 3 Jul 2023 22:53:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
 mitigations
To: "Quan, Evan" <Evan.Quan@amd.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "jingyuwang_vip@163.com" <jingyuwang_vip@163.com>,
 "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "jim.cromie@gmail.com" <jim.cromie@gmail.com>,
 "bellosilicio@gmail.com" <bellosilicio@gmail.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "trix@redhat.com" <trix@redhat.com>, "jsg@jsg.id.au" <jsg@jsg.id.au>,
 "arnd@arndb.de" <arnd@arndb.de>
References: <20230630103240.1557100-1-evan.quan@amd.com>
 <20230630103240.1557100-2-evan.quan@amd.com>
 <3e095621-d7dc-9069-45dc-498c8f3bb4f4@amd.com>
 <DM6PR12MB26192D7A98B397CA9C8997F9E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <DM6PR12MB26192D7A98B397CA9C8997F9E42EA@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0002.namprd21.prod.outlook.com
 (2603:10b6:805:106::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d1d913a-0a1d-48cc-48b8-08db7c423a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U8d1dn82IY95i54JgXlCL7vDmvOAKF0nl8EF1yAoMr6/S31avdGx7P4fk/3XWOwUk6kJY9QTmE6tWlGbLsxn9PAJ7Z+isHEx3HlIOQckfImzvk+qBrHNuWordahzkvs+8sfhsIsxiXP/tmfzjpo57VFDfTtzESr1UFN88Jrcq03mf3Kj3dLmEqUongLfmxx8Redi1GoPWfmZHPTt5Zt9u/0o0f6w7XlvUNOTdouJ3aLESLfWz8HhnAkCsoucYMMpnBpWCXcRKw4+D/rw8RdAM0T/P/BblP8bQ0a+sOeKrRCiWk0E10W1aONP014V5AFhuMxWzpznuJUDXp1fYTiuXoYmmLDGKHn46MLy19pKp6u6S2fGfjBfHW+bDzMP3p543N8LgUiHxGTNsU73cEwHdgdYXBys4cKmEjdM37ScIKpItd6NpiJUB5Ts4YiRcYeL7KYOZpLIaJetkN7SentEOLUZhjuA2c9Mg/mizxWL6zpU162Aoan2QK2cRo1r3FzQIwBo8osMtQPCqn0KlLtS7Sn2AxXwM6WNn+UvAfQUsyaOF5Eo89J2nTh/Vu19IA0dEgGdgklQj5D+t8s3jXmaW4nyptPrU6fbx2X/63MM9wE5TFgUa//Rc6PX/I4ognIJdySMDweWfJGdncbcpX4fU/NoV5KAnbM6RG7230eVUek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(30864003)(2906002)(41300700001)(5660300002)(8676002)(8936002)(44832011)(7416002)(36756003)(86362001)(31696002)(186003)(2616005)(31686004)(478600001)(6512007)(6506007)(6666004)(53546011)(6486002)(316002)(66556008)(4326008)(66946007)(38100700002)(54906003)(66476007)(921005)(110136005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkk0ODZIT2pxWnJiemdRQzhpb1BWVGVCNTVodDVnVGQ0QmVCNWM4SHBKS1Rw?=
 =?utf-8?B?Vncwb0I1aUFqT3ZJVTA1VUdBTnZ4eG5Nbzd2MUdOaEhrUU1vbEJtbHNROEk0?=
 =?utf-8?B?ZHNjdkIzYkNZS29JdFY4M2FpZmoyNDFLUXByYnVxSU1udDcwbE9Qc0l5Tkpk?=
 =?utf-8?B?SzZmeU5neXZuanJha3QvL1pVOUVmZGV2bTZhRVNmMHBkSjdWeHQ2SmxqYnJo?=
 =?utf-8?B?dkpSMWpCM3VZcjJjb0VQVXk2RStYdUhnQ01UdHFSdzRrS2c0ODZCMklsSHlv?=
 =?utf-8?B?WjJWVG9EdHN4U1MyM2oyRkFKdTE4RG1WNkZUNm4ycUZ0MllJSEtYS1Yram5E?=
 =?utf-8?B?STBLV1I3amo5YkdpdUFmSXlIZ0ZWbkMzQWNVNU5JK1g3cGlYNnFMUjk5NXJ5?=
 =?utf-8?B?RGVuZGxCSUpvbTJtc2IreURhUFkzbS8veWYwODdoNGxYSXJXVnl5SloxbXVW?=
 =?utf-8?B?UVFraWRueU1sNHhyWXJZd2trZTFBYlJ5NFdWL29jSzc2eWhCaWNha1lPbTdx?=
 =?utf-8?B?c1A2NUJwelhoZmFBRU81TFBHRk5ZNkl4TTVBV0NocUYvWFZkeFFtNFhlSDQv?=
 =?utf-8?B?bElKaSs3RUUwUWxCK0JyazlCS3FuUkNsS0h0dkhtU3JSOUM0MDhLcFBrdkxt?=
 =?utf-8?B?dEJaMnVwSis5NXVWMDl5WWplTDVSd3BYcTVjMDY2OTFpWGFXaEJodGQwWEZP?=
 =?utf-8?B?eU1ieXgrSFFDcXk3WFpIQ1V1djZ0d0hiRTZHcXlBdkRwMjV6bUZuQ1BQZUZi?=
 =?utf-8?B?WHplOWE3SWxMNzJyVysvcDg2Sk5aS3Z6Q3BaNHRyZWVGaXR0UTl1SDhEbk00?=
 =?utf-8?B?dnlRczVNOWU2dDdzak9UZEFTMU0vQ1E0YUJvM1p6NDRFMUhRREp6bUlWeDNU?=
 =?utf-8?B?bW53TUc0Rm90M2ZoL04yL3k0enRSU09ROXp2cXJhZDZZM2U1QTk5T3p0SXdM?=
 =?utf-8?B?N0dWcFFQcHJNMVpSKzRKeDVBSlZtM3JjVnFpUmt0blZ0Zm1xNTdmckprWGE2?=
 =?utf-8?B?bDlrTHhEbXZqZ2Q5NitxRFJtaW1NN2dQQTM3KytxUm5oREJsOTl6bmpyUHBH?=
 =?utf-8?B?Nk1QVCt3NXd0TTVxWlFQRDZLV2xvZWE5NEZJUWtxTXp0NjB5ejAzRll1eWho?=
 =?utf-8?B?QldDQTN3bzFacWNkWW5xeW00VTI4U244L1NXRENzN0lPUVFqUk1oekVlbjc1?=
 =?utf-8?B?UXczMGRVZ3pJY2ZXdmR2aVNxdE9ZMUNTSjdFY3RvaTU0T0hWNktzbkllMkRK?=
 =?utf-8?B?UU1PWXBSV0lreVphYmJXSlA2VEdCUWEvb1hhc0l3Si9NOVZ0UVZWeTRtRTM5?=
 =?utf-8?B?SFdDUHhvQlFNc3lJcjFtMnFxVEZTSC9ZMDNNRW02UGlxZ1B5UTlKMDg0RVVt?=
 =?utf-8?B?R3A3dTlveWdmL3l4YXlhclgrLzZod0p0Z09SVEtiR0Nrb3VQSjJBMW1UYkNS?=
 =?utf-8?B?cWIrSWVEZUhpaGpHdWpyNElRNjFWV1pFL2pFZGVUSDdtbzA4bVhFbjFxVHk2?=
 =?utf-8?B?NjFtWFZyZ0dTSHI4VEUzbEloY3R6ZUIyaFU1bmhNQ3oyWnZVVVNGRnlMRFlV?=
 =?utf-8?B?TlU3WjE5dFFyeUdFVVlGTlV2Qzk4ODFZYzdBcmtqSUFRNHBSVFhpUm11cFln?=
 =?utf-8?B?QjlXNXJyRGZ5bytWNHpXcit2SFdjSlI4QlJzQXRaK0MyM2VQOFo2Yy9laGVz?=
 =?utf-8?B?RnVHUHZYdXZnZHJlWlZlMGdaTnh4bHhXN2lnOGlaME1aV0FUTkRXWDB3amJX?=
 =?utf-8?B?dkJMTHJ3emxCbUlMMWNNcjd4Mk0xMFo0UitFZFFzYVNiK2UyWXRLWHdCNVlP?=
 =?utf-8?B?N2cwTXdYNjBtWkdhVkE0NVhCTlE5TmxUOTR5TjkveEdvS3hTU2tybm9uMUha?=
 =?utf-8?B?bmtKckwvRmhRUVZ0Z3NOalZYbWdncCtkOU5jQUU3OWJvWFV6ZkRkcVhCTThU?=
 =?utf-8?B?a2liQm5KNEZIUFRVU0RHVzJML09BMTUxU0lNNUtuTWM4QU1vQ041ektSZVVJ?=
 =?utf-8?B?OVJzV0tZL3hJeEQrdlV6NnFsdE1CWGhKN2JzWGU5djlUaUlIdHg2WGRsRXBl?=
 =?utf-8?B?QitsODc0aFFqeVNETmpMVHRvbk9vMDJjT2VtZGFMQTNzMElqbk5RTjJMZzBR?=
 =?utf-8?B?OCs0b2pCWHh1VU55NzFMMk9GOWFES0szL0lqemwvNm0rSnZtQWx3UXN0b1ZK?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1d913a-0a1d-48cc-48b8-08db7c423a85
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 03:53:29.6064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8JrKDXE37jaaK1v5R9cQ91pugc43NWDKWNAkHg+tmJCM+ME7skWF2rzAkAr26j0dsaGURjFOysDgJyXsHhvJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7995
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/3/23 22:40, Quan, Evan wrote:
> [AMD Official Use Only - General]
> 
>> -----Original Message-----
>> From: Limonciello, Mario <Mario.Limonciello@amd.com>
>> Sent: Saturday, July 1, 2023 12:41 AM
>> To: Quan, Evan <Evan.Quan@amd.com>; rafael@kernel.org; lenb@kernel.org;
>> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> airlied@gmail.com; daniel@ffwll.ch; johannes@sipsolutions.net;
>> davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
>> pabeni@redhat.com; mdaenzer@redhat.com;
>> maarten.lankhorst@linux.intel.com; tzimmermann@suse.de;
>> hdegoede@redhat.com; jingyuwang_vip@163.com; Lazar, Lijo
>> <Lijo.Lazar@amd.com>; jim.cromie@gmail.com; bellosilicio@gmail.com;
>> andrealmeid@igalia.com; trix@redhat.com; jsg@jsg.id.au; arnd@arndb.de
>> Cc: linux-kernel@vger.kernel.org; linux-acpi@vger.kernel.org; amd-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
>> wireless@vger.kernel.org; netdev@vger.kernel.org
>> Subject: Re: [PATCH V5 1/9] drivers core: Add support for Wifi band RF
>> mitigations
>>
>> On 6/30/2023 05:32, Evan Quan wrote:
>>> Due to electrical and mechanical constraints in certain platform
>>> designs there may be likely interference of relatively high-powered
>>> harmonics of the (G-)DDR memory clocks with local radio module
>>> frequency bands used by Wifi 6/6e/7.
>>>
>>> To mitigate this, AMD has introduced a mechanism that devices can use
>>> to notify active use of particular frequencies so that other devices
>>> can make relative internal adjustments as necessary to avoid this resonance.
>>>
>>> In order for a device to support this, the expected flow for device
>>> driver or subsystems:
>>>
>>> Drivers/subsystems contributing frequencies:
>>>
>>> 1) During probe, check `wbrf_supported_producer` to see if WBRF
>> supported
>>>      for the device.
>>> 2) If adding frequencies, then call `wbrf_add_exclusion` with the
>>>      start and end ranges of the frequencies.
>>> 3) If removing frequencies, then call `wbrf_remove_exclusion` with
>>>      start and end ranges of the frequencies.
>>>
>>> Drivers/subsystems responding to frequencies:
>>>
>>> 1) During probe, check `wbrf_supported_consumer` to see if WBRF is
>> supported
>>>      for the device.
>>> 2) Call the `wbrf_retrieve_exclusions` to retrieve the current
>>>      exclusions on receiving an ACPI notification for a new frequency
>>>      change.
>>>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Co-developed-by: Evan Quan <evan.quan@amd.com>
>>> Signed-off-by: Evan Quan <evan.quan@amd.com>
>>> --
>>> v4->v5:
>>>     - promote this to be a more generic solution with input argument taking
>>>       `struct device` and provide better scalability to support non-ACPI
>>>       scenarios(Andrew)
>>>     - update the APIs naming and some other minor fixes(Rafael)
>>> ---
>>>    drivers/base/Kconfig  |   8 ++
>>>    drivers/base/Makefile |   1 +
>>>    drivers/base/wbrf.c   | 227
>> ++++++++++++++++++++++++++++++++++++++++++
>>>    include/linux/wbrf.h  |  65 ++++++++++++
>>>    4 files changed, 301 insertions(+)
>>>    create mode 100644 drivers/base/wbrf.c
>>>    create mode 100644 include/linux/wbrf.h
>>>
>>> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig index
>>> 2b8fd6bb7da0..5b441017b225 100644
>>> --- a/drivers/base/Kconfig
>>> +++ b/drivers/base/Kconfig
>>> @@ -242,4 +242,12 @@ config FW_DEVLINK_SYNC_STATE_TIMEOUT
>>>        command line option on every system/board your kernel is expected
>> to
>>>        work on.
>>>
>>> +config WBRF
>>> +   bool "Wifi band RF mitigation mechanism"
>>> +   default n
>>> +   help
>>> +     Wifi band RF mitigation mechanism allows multiple drivers from
>>> +     different domains to notify the frequencies in use so that hardware
>>> +     can be reconfigured to avoid harmonic conflicts.
>>> +
>>>    endmenu
>>> diff --git a/drivers/base/Makefile b/drivers/base/Makefile index
>>> 3079bfe53d04..c844f68a6830 100644
>>> --- a/drivers/base/Makefile
>>> +++ b/drivers/base/Makefile
>>> @@ -26,6 +26,7 @@ obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
>>>    obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
>>>    obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
>>>    obj-$(CONFIG_ACPI) += physical_location.o
>>> +obj-$(CONFIG_WBRF) += wbrf.o
>>>
>>>    obj-y                     += test/
>>>
>>> diff --git a/drivers/base/wbrf.c b/drivers/base/wbrf.c new file mode
>>> 100644 index 000000000000..2163a8ec8a9a
>>> --- /dev/null
>>> +++ b/drivers/base/wbrf.c
>>> @@ -0,0 +1,227 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Wifi Band Exclusion Interface
>>> + * Copyright (C) 2023 Advanced Micro Devices
>>> + *
>>> + */
>>> +
>>> +#include <linux/wbrf.h>
>>> +
>>> +static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
>>> +static DEFINE_MUTEX(wbrf_mutex);
>>> +static struct exclusion_range_pool wbrf_pool;
>>> +
>>> +static int _wbrf_add_exclusion_ranges(struct wbrf_ranges_in *in) {
>>> +   int i, j;
>>> +
>>> +   for (i = 0; i < ARRAY_SIZE(in->band_list); i++) {
>>> +           if (!in->band_list[i].start &&
>>> +               !in->band_list[i].end)
>>> +                   continue;
>>> +
>>> +           for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
>>> +                   if (wbrf_pool.band_list[j].start == in-
>>> band_list[i].start &&
>>> +                       wbrf_pool.band_list[j].end == in->band_list[i].end) {
>>> +                           wbrf_pool.ref_counter[j]++;
>>> +                           break;
>>> +                   }
>>> +           }
>>> +           if (j < ARRAY_SIZE(wbrf_pool.band_list))
>>> +                   continue;
>>> +
>>> +           for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
>>> +                   if (!wbrf_pool.band_list[j].start &&
>>> +                       !wbrf_pool.band_list[j].end) {
>>> +                           wbrf_pool.band_list[j].start = in-
>>> band_list[i].start;
>>> +                           wbrf_pool.band_list[j].end = in-
>>> band_list[i].end;
>>> +                           wbrf_pool.ref_counter[j] = 1;
>>> +                           break;
>>> +                   }
>>> +           }
>>> +           if (j >= ARRAY_SIZE(wbrf_pool.band_list))
>>> +                   return -ENOSPC;
>>> +   }
>>> +
>>> +   return 0;
>>> +}
>>> +
>>> +static int _wbrf_remove_exclusion_ranges(struct wbrf_ranges_in *in) {
>>> +   int i, j;
>>> +
>>> +   for (i = 0; i < ARRAY_SIZE(in->band_list); i++) {
>>> +           if (!in->band_list[i].start &&
>>> +               !in->band_list[i].end)
>>> +                   continue;
>>> +
>>> +           for (j = 0; j < ARRAY_SIZE(wbrf_pool.band_list); j++) {
>>> +                   if (wbrf_pool.band_list[j].start == in-
>>> band_list[i].start &&
>>> +                       wbrf_pool.band_list[j].end == in->band_list[i].end) {
>>> +                           wbrf_pool.ref_counter[j]--;
>>> +                           if (!wbrf_pool.ref_counter[j]) {
>>> +                                   wbrf_pool.band_list[j].start = 0;
>>> +                                   wbrf_pool.band_list[j].end = 0;
>>> +                           }
>>> +                           break;
>>> +                   }
>>> +           }
>>> +   }
>>> +
>>> +   return 0;
>>> +}
>>> +
>>> +static int _wbrf_retrieve_exclusion_ranges(struct wbrf_ranges_out
>>> +*out) {
>>> +   int out_idx = 0;
>>> +   int i;
>>> +
>>> +   memset(out, 0, sizeof(*out));
>>> +
>>> +   for (i = 0; i < ARRAY_SIZE(wbrf_pool.band_list); i++) {
>>> +           if (!wbrf_pool.band_list[i].start &&
>>> +               !wbrf_pool.band_list[i].end)
>>> +                   continue;
>>> +
>>> +           out->band_list[out_idx].start = wbrf_pool.band_list[i].start;
>>> +           out->band_list[out_idx++].end = wbrf_pool.band_list[i].end;
>>> +   }
>>> +
>>> +   return 0;
>>> +}
>>> +
>>> +/**
>>> + * wbrf_supported_producer - Determine if the device can report
>>> +frequencies
>>> + *
>>> + * @dev: device pointer
>>> + *
>>> + * WBRF is used to mitigate devices that cause harmonic interference.
>>> + * This function will determine if this device needs to report such
>> frequencies.
>>> + */
>>> +bool wbrf_supported_producer(struct device *dev) {
>>> +   return true;
>>> +}
>>> +EXPORT_SYMBOL_GPL(wbrf_supported_producer);
>>> +
>>> +/**
>>> + * wbrf_add_exclusion - Add frequency ranges to the exclusion list
>>> + *
>>> + * @dev: device pointer
>>> + * @in: input structure containing the frequency ranges to be added
>>> + *
>>> + * Add frequencies into the exclusion list for supported consumers
>>> + * to react to.
>>> + */
>>> +int wbrf_add_exclusion(struct device *dev,
>>> +                  struct wbrf_ranges_in *in)
>>> +{
>>> +   int r;
>>> +
>>> +   mutex_lock(&wbrf_mutex);
>>> +
>>> +   r = _wbrf_add_exclusion_ranges(in);
>>> +
>>> +   mutex_unlock(&wbrf_mutex);
>>> +   if (r)
>>> +           return r;
>>> +
>>> +   blocking_notifier_call_chain(&wbrf_chain_head, WBRF_CHANGED,
>> NULL);
>>> +
>>> +   return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(wbrf_add_exclusion);
>>> +
>>> +/**
>>> + * wbrf_remove_exclusion - Remove frequency ranges from the exclusion
>>> +list
>>> + *
>>> + * @dev: device pointer
>>> + * @in: input structure containing the frequency ranges to be removed
>>> + *
>>> + * Remove frequencies from the exclusion list for supported consumers
>>> + * to react to.
>>> + */
>>> +int wbrf_remove_exclusion(struct device *dev,
>>> +                     struct wbrf_ranges_in *in)
>>> +{
>>> +   int r;
>>> +
>>> +   mutex_lock(&wbrf_mutex);
>>> +
>>> +   r = _wbrf_remove_exclusion_ranges(in);
>>> +
>>> +   mutex_unlock(&wbrf_mutex);
>>> +   if (r)
>>> +           return r;
>>> +
>>> +   blocking_notifier_call_chain(&wbrf_chain_head, WBRF_CHANGED,
>> NULL);
>>> +
>>> +   return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(wbrf_remove_exclusion);
>>> +
>>> +/**
>>> + * wbrf_supported_consumer - Determine if the device can react to
>>> +frequencies
>>> + *
>>> + * @dev: device pointer
>>> + *
>>> + * WBRF is used to mitigate devices that cause harmonic interference.
>>> + * This function will determine if this device needs to react to
>>> +reports from
>>> + * other devices for such frequencies.
>>> + */
>>> +bool wbrf_supported_consumer(struct device *dev) {
>>> +   return true;
>>> +}
>>> +EXPORT_SYMBOL_GPL(wbrf_supported_consumer);
>>> +
>>> +/**
>>> + * wbrf_register_notifier - Register for notifications of frequency
>>> +changes
>>> + *
>>> + * @nb: driver notifier block
>>> + *
>>> + * WBRF is used to mitigate devices that cause harmonic interference.
>>> + * This function will allow consumers to register for frequency notifications.
>>> + */
>>> +int wbrf_register_notifier(struct notifier_block *nb) {
>>> +   return blocking_notifier_chain_register(&wbrf_chain_head, nb); }
>>> +EXPORT_SYMBOL_GPL(wbrf_register_notifier);
>>> +
>>> +/**
>>> + * wbrf_unregister_notifier - Unregister for notifications of
>>> +frequency changes
>>> + *
>>> + * @nb: driver notifier block
>>> + *
>>> + * WBRF is used to mitigate devices that cause harmonic interference.
>>> + * This function will allow consumers to unregister for frequency
>> notifications.
>>> + */
>>> +int wbrf_unregister_notifier(struct notifier_block *nb) {
>>> +   return blocking_notifier_chain_unregister(&wbrf_chain_head, nb); }
>>> +EXPORT_SYMBOL_GPL(wbrf_unregister_notifier);
>>> +
>>> +/**
>>> + * wbrf_retrieve_exclusions - Retrieve the exclusion list
>>> + *
>>> + * @dev: device pointer
>>> + * @out: output structure containing the frequency ranges to be
>>> +excluded
>>> + *
>>> + * Retrieve the current exclusion list  */ int
>>> +wbrf_retrieve_exclusions(struct device *dev,
>>> +                        struct wbrf_ranges_out *out)
>>> +{
>>> +   int r;
>>> +
>>> +   mutex_lock(&wbrf_mutex);
>>> +
>>> +   r = _wbrf_retrieve_exclusion_ranges(out);
>>> +
>>> +   mutex_unlock(&wbrf_mutex);
>>> +
>>> +   return r;
>>> +}
>>> +EXPORT_SYMBOL_GPL(wbrf_retrieve_exclusions);
>>> diff --git a/include/linux/wbrf.h b/include/linux/wbrf.h new file mode
>>> 100644 index 000000000000..3ca95786cef5
>>> --- /dev/null
>>> +++ b/include/linux/wbrf.h
>>> @@ -0,0 +1,65 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Wifi Band Exclusion Interface
>>> + * Copyright (C) 2023 Advanced Micro Devices  */
>>> +
>>> +#ifndef _LINUX_WBRF_H
>>> +#define _LINUX_WBRF_H
>>> +
>>> +#include <linux/device.h>
>>> +
>>> +/* Maximum number of wbrf ranges */
>>> +#define MAX_NUM_OF_WBRF_RANGES             11
>>> +
>>> +struct exclusion_range {
>>> +   /* start and end point of the frequency range in Hz */
>>> +   uint64_t        start;
>>> +   uint64_t        end;
>>> +};
>>> +
>>> +struct exclusion_range_pool {
>>> +   struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
>>> +   uint64_t
>>        ref_counter[MAX_NUM_OF_WBRF_RANGES];
>>> +};
>>> +
>>> +struct wbrf_ranges_in {
>>> +   /* valid entry: `start` and `end` filled with non-zero values */
>>> +   struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
>>> +};
>>> +
>>> +struct wbrf_ranges_out {
>>> +   uint32_t                num_of_ranges;
>>> +   struct exclusion_range  band_list[MAX_NUM_OF_WBRF_RANGES];
>>> +} __packed;
>>> +
>>> +enum wbrf_notifier_actions {
>>> +   WBRF_CHANGED,
>>> +};
>>> +
>>> +#ifdef CONFIG_WBRF
>>> +bool wbrf_supported_producer(struct device *dev); int
>>> +wbrf_add_exclusion(struct device *adev,
>>> +                  struct wbrf_ranges_in *in);
>>> +int wbrf_remove_exclusion(struct device *dev,
>>> +                     struct wbrf_ranges_in *in);
>>> +int wbrf_retrieve_exclusions(struct device *dev,
>>> +                        struct wbrf_ranges_out *out); bool
>>> +wbrf_supported_consumer(struct device *dev);
>>> +
>>> +int wbrf_register_notifier(struct notifier_block *nb); int
>>> +wbrf_unregister_notifier(struct notifier_block *nb); #else static
>>> +inline bool wbrf_supported_producer(struct device *dev) { return
>>> +false; } static inline int wbrf_add_exclusion(struct device *adev,
>>> +                                struct wbrf_ranges_in *in) { return -
>> ENODEV; } static inline
>>> +int wbrf_remove_exclusion(struct device *dev,
>>> +                                   struct wbrf_ranges_in *in) { return -
>> ENODEV; } static inline int
>>> +wbrf_retrieve_exclusions(struct device *dev,
>>> +                                      struct wbrf_ranges_out *out)
>> { return -ENODEV; } static
>>> +inline bool wbrf_supported_consumer(struct device *dev) { return
>>> +false; } static inline int wbrf_register_notifier(struct
>>> +notifier_block *nb) { return -ENODEV; } static inline int
>>> +wbrf_unregister_notifier(struct notifier_block *nb) { return -ENODEV;
>>> +} #endif
>>> +
>>
>> Right now there are stubs for non CONFIG_WBRF as well as other patches are
>> using #ifdef CONFIG_WBRF or having their own stubs.  Like mac80211 patch
>> looks for #ifdef CONFIG_WBRF.
>>
>> I think we should pick one or the other.
> Right..
>>
>> Having other subsystems #ifdef CONFIG_WBRF will make the series easier to
>> land through multiple trees; so I have a slight leaning in that direction.
> I kind of expecting to use the other way. That is to make CONFIG_WBRF agnostic to other subsystems or drivers.
> They (other subsystems or drivers) can always assume those wbrf_xxxxx interfaces are available.
> What they need to care only are the return values of those interfaces.
> How do you think?

That's fine, thanks.

> 
> Evan
>>
>>> +#endif /* _LINUX_WBRF_H */
> 

