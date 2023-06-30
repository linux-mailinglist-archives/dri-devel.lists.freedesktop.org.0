Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85B5743AA4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 13:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045A510E44F;
	Fri, 30 Jun 2023 11:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82EF710E44F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 11:18:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W36r6nymmQkSi4vPHfAiwtKNZGaEl4fE/9+a/rLcxS1azKtG7aMqzEOiTbLZGaazJMP5ex4Q8S73AMDAs0ejKQipuF/XaOPSyLuQmme7upVpgxoy6KpjVWov9kcNDJtNYmzIeqgyQC//dtHsBTy1MXUY8Nc6Ck2puRoNNpQEv9xQ4SuxtR+HgFeyBV4VzAiIFxE+eCTdZ1rs0ng1bV8Fe96w/qu0lfTl1n57T+vE+UOZKJXfDUAK7DeLgQ4euoRcYCemJQkyUz9Up0AI9vLqLSITFCfyHl13z95r7x8Z54n9+KmSBYduv/L1rzH39cJaT86i0giTMT2sFcDzK/8yzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV9jEROdMzlo3OfuQhq0vSpP7oPbplD1Z6yvxKn3Juk=;
 b=h9i6dTG0N4ONOYJJhnUkkYgNmcHr/EvBhs0V0Ogm9j3unDOssuOu3USasA3l5mN0LDUoZ9ZwkUc1ZL8piGscm6ijybv5hVKXMepWAOUNZG3N4Y+SjDpBInzeteCGzbq8pVJBlBVuJ3VBonlhAsYbVgbdXbNsbbkIS/yD18Lww8bssxMzjozA8QbUV5D100xCZxYeCmMtsZbfQK/NHFRsDqvcp1zEc683KIKSWmv4j1PvAARQY5qODTkxMTNyFTLgMHCOjLpP+oN+7cqckm9wCe0/Suvd8h0fSgkt8fFDL20aQTobta0Z2HvLvCNvDtWGMSEUirZxsXmOD85n6bzHBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV9jEROdMzlo3OfuQhq0vSpP7oPbplD1Z6yvxKn3Juk=;
 b=aKviumlOjobeBZ8UEY5Nh16pvlw+k3/63nh84sfA2gN6PXQ3dtNJ2/bgGHWAXxVh5rVehN/ziBL1S/pSpED/11VVdvDTn+CgIcSahBpyIrNPmytZ8VJnQxHb1gEAOFsFg+38Z3t/Go0uMr/6odqaabO+1UBvXFouzDMyghJXl50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8135.namprd12.prod.outlook.com (2603:10b6:a03:4f3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 11:18:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 11:18:29 +0000
Message-ID: <f0dd5100-ebf1-92df-cc8d-9a8a3374a843@amd.com>
Date: Fri, 30 Jun 2023 13:18:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC v2 1/3] drm/ttm: Introduce KUnit tests
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1687779215.git.karolina.stolarek@intel.com>
 <ccca4b6f62a5b87d4c8c504209c978266d1425ad.1687779215.git.karolina.stolarek@intel.com>
 <4a99ccf2-da23-b64f-6768-548079b2edbd@amd.com>
 <2721d944-804d-929a-5d63-5119339bdf5b@intel.com>
 <b3b882de-1c41-8521-efc6-dc8f2a2798af@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b3b882de-1c41-8521-efc6-dc8f2a2798af@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef84784-7d15-4079-b15a-08db795bbaec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OVKlzmwfDOwU9qlHfqK0ZyBdI1OLgc7S5mYMHOSIGxoxJr79VRmoH8SmsBd2xhLlBN8TgAYeKDMWtCuu0eDMsc8eu/PwUxyBluBAKheQu0Dai8uREit0Cw+2vNynsFo46m+Ix6FBduANOXs0AlAG7xQA9Giw/UVC9ELLy2Jek32S56ndiYZULEGr4qM6nUAQa4pbyGgmxRzXqgFhqD2iucm93dbRgM/HJocB9cmuAvOiNMlsou9kJUaV7P8DVZCd1oqcO5XxJC6c+9K+fApexDP1yh18OLE9l9FlcUWzmxZWUtjC8VtQ00EoJwozSTcNHInFzWGupytgbFYj5EA3G6voXD7UUX5NrsrReUMwPcByEiUg6xt7ZAF/Mm/NuqoIbGhNmg4AICV780eLc4WOPq6Nm3OkJm5gcvp3+70L8ZtScAMUPbVVeana1YTI0de7I/YxBg/p4EA2JGdoojHTv2MP6GcaXrIZnUByTyVk16C9t5bADOVqpSkHKPXeCiZOkOhIN512sgh2kpJLWHKrlnT+vh6Sm7lShS6z7nzFElUpPZkJuynDJX+84M1uU7Y7Xorwni+74FBQknYVf6nwwv3S7VTHTo72KRyVxrqPq5ce8lhdjPeS5E1dPPGdxngT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(31686004)(66899021)(66946007)(54906003)(66556008)(66476007)(2906002)(30864003)(36756003)(8936002)(316002)(38100700002)(41300700001)(4326008)(478600001)(966005)(6486002)(6666004)(5660300002)(86362001)(6512007)(31696002)(8676002)(2616005)(186003)(53546011)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnpXMG9BREFIU2NRSlc5VVlyS3M0SFZHOW83MDRzanorcVVRT2FNUVFiSHF0?=
 =?utf-8?B?RFgwT3QrN1BpVkI3OE9xOE9FNzl0UENtV0xzNmtQanpwb0tQUVJrQkhaRmky?=
 =?utf-8?B?R0hheEhiNkpRRFA4UWx4ODltdDQ5RC9PNURuTWp3Zm1QY0h6YjNPWG1hejcw?=
 =?utf-8?B?ZkpiWDN1WjkwN1BhYzFVR2xkeUVqYUxzR2pkaVNxa21xWFk2aVdtZXI3UjlQ?=
 =?utf-8?B?NktBQVllSWFDUDhTdlNrSTFoVzVmU2kxSWxrMUpKTXk4TXRUREduSzlRV1dn?=
 =?utf-8?B?WHB6c3V1b2R4emdpV3AzekhSLzZnQkVIeFlYdXlPNmpPWGRVelNLRnZpMVRM?=
 =?utf-8?B?YTZtU0psLzA4MS9yZ0xUYkhwejBKeEZWMFltb2RxRjNjbXpBWHc4V1JoQ29M?=
 =?utf-8?B?OGxWeHQ4UVoxK1lFTklhUGZhRWhyTmNyYjVkZ3JVdFZVMHorME5UMUtaVCt4?=
 =?utf-8?B?ZG9McjZSaHcvVmIveFdpU1BUWGVPMVBoMGZtalJRek90RksrbXhwM3V5MFFZ?=
 =?utf-8?B?SXdBRUJzK0ZUVVFpNUFQTEU0cFlCYWI3RHVndlRWL2IyUUJ1YkkxWmFoZ3lk?=
 =?utf-8?B?dHc1M0Z0TFdicVJTdnZ1Vi9COVkwZVVsOUxmTFgvNU9CREQzK05hMTlqL3pG?=
 =?utf-8?B?VTh6MTZLV3BjRDdUeXhhNmQ5cWhDUGc3SzBGRVE0eWxlU3k1a25zbVFCKzRa?=
 =?utf-8?B?TTFvaU5ZRzZUa2IxK3JXSng2L1pIM0hkYzBQdXJxSFhnUGtRZGl1SDFUWVpj?=
 =?utf-8?B?amM0TEh2K0cwQWgwaEE0MWs1eEkvVzRoZ2IremxsalYzdTduMHI4REk1TkJs?=
 =?utf-8?B?Y1VlMFVTV251VjZ5bU1aZHdCMXJWUGh6cVg3bTVxdFF3d2JoMEh5NjlrbzVB?=
 =?utf-8?B?UGIvL2k5c1FZaW0zYkQ5RFZ3em13aHRmZkVUNHgzeTZQQ1hnMWhFTlFVSXVY?=
 =?utf-8?B?QURwQ2lld3RTRVNoaFFjN3NmaUZFd0pqZVN2QnpuMThOVUhSaFNwWXZoQ3ov?=
 =?utf-8?B?emhMVEJ3VEYwL3dMV0RCM21Oam9TOWxQODgvc3pPYk52UENaM0tQZ0hSSUpW?=
 =?utf-8?B?Wk1vdzhwN2JvNCtKUS9Fa2htOHVpbHVzMlFhdjFaekNpYStScE9FV0daODNI?=
 =?utf-8?B?c3NCQjNOcEZDWFc1eDB2alFHVDd5R2VxN3dOZWNDNDgyZzR2bjhOVmg0MzJZ?=
 =?utf-8?B?d2p4NGo2ZWtCWDIxQ2pkcmJGWGNoeCtWT0pqcWJaZzMrT2JPK2xDaGV3TlJx?=
 =?utf-8?B?ZU5wNXVFNU9QRTY5UGUrRWd1TFJFSjRiTWhvZXRqL0gyVmlOREkrT3djUlRT?=
 =?utf-8?B?NjhiUlF6WGhPaGQ1THV5K1k4dUdqeWVzdzhxQ0liSTFoNVphazMwdU0vNjBQ?=
 =?utf-8?B?cEpYcWRPaURPMjdrTDV4ZlBYSmRYanJVS3VrRXU5MjgxWGRIdkNzeUVyVHRn?=
 =?utf-8?B?MGFWRk9pSHQwV1ZkQkg1SUhFUTgzbU84YUhBZ3lZaFp2Zyt1Vko2RWZCallX?=
 =?utf-8?B?SUNFOEZEMnhlQlhWdlBWSTkzcWtWT1ZCTlhHcnd0Qm9VMDFVRlpNOXRuLzNM?=
 =?utf-8?B?bFFqcjdCdlA3emhiek9sYWJ1R1RwYUJOdmQ3eGZLSTgzaE9PaU1NN3FUaVpJ?=
 =?utf-8?B?SGxPdkFmOUxxRnZ6S0FUNzYra3BxZGpBKzZpdGJ2aWtST0xVR3N4N0MzT3o3?=
 =?utf-8?B?aEE0bUhRemtndUVKemlZbHphc2ZLcG42U2JCQkt3RXJKejRYVGxUTnlEeUx6?=
 =?utf-8?B?dGRaRHlRS1l3Rjhad2tmakFuMVNjVCtGOHFzTlBQNFJrK0hDdVhoY2JRUjZh?=
 =?utf-8?B?bDNha1JNZ29CUmNZS1paWDk1RWhXRzdBbUdzTEtBTC92YU9kbnR1WWdwUWNi?=
 =?utf-8?B?SzhkY2RSZ2lPYXVSaVhRU0dLcWdDS1U2STQ1UW5EZDRYZ0c4N0dkK1RLMWFH?=
 =?utf-8?B?djIxUS9ZcjNUdFBGWXFnaWp0b1pqZTVQYnMzMFg4dUZpKzh3SXorOGE5MUly?=
 =?utf-8?B?YWZKd29wK0Y5WXRtazh0WU15d3BKYlR1UFd1cTNKN2JIbUV2U0dMaWxsOFZW?=
 =?utf-8?B?SUwyRG5nMDk3TlRXY3Rma1ZoenlBNUdkWHJDVDVxQUQwWXBZZFdvSE1NUXd3?=
 =?utf-8?B?UzJXY3pPd29WZUJ0YndkTlU4UEJTUkpLRllKREJEQWtJZjl5d2U3amx1V21M?=
 =?utf-8?Q?hr9y/V2DHOJuyNYceetxNV3VDhECinoARFV0pjmh2K0q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef84784-7d15-4079-b15a-08db795bbaec
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 11:18:28.9990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+h3RMVjuI/ki3vAYlGz1fx84X9PiIP+Q8Cny1txBbUr5Cq02vlqHw1XNQTlYqzH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8135
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Shuah Khan <shuah@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.06.23 um 13:09 schrieb Karolina Stolarek:
> Hi Christian,
>
> I'm taking a second look at this, and I wonder what would be the 
> benefit of combining the initialization of device and ttm_device. 
> (drm_)device can be initialized indepedently from the test params, so 
> we can utilize .init and .exit callbacks offered by KUnit[1] to 
> prepare and release the device indepedently of our setup. If we were 
> to change it so ttm_device is also initialized there, we'd have to 
> manually call init/fini in every single test. What's more, ttm_pool 
> tests don't depend on ttm_device, and I can imagine that some structs 
> can be tested in a similar way.
>
> Would it be fine with you to rename ttm_kunit_helper_alloc_device(), 
> but leave its definition as it is?

Yeah, sure. It's perfectly up to you how to structurize that, I wasn't 
even aware that there are .init and .exit callbacks.

I just found that the function name didn't match what the function was 
doing.

Regards,
Christian.

>
> All the best,
> Karolina
> -------------------------------------------------------------------
> [1] - 
> https://kunit.dev/third_party/kernel/docs/api/test.html#c.kunit_suite
>
> On 29.06.2023 12:05, Karolina Stolarek wrote:
>> Hi Christian,
>>
>> Thanks a lot for taking a look at my patches.
>>
>> On 29.06.2023 09:50, Christian König wrote:
>>> Am 27.06.23 um 10:32 schrieb Karolina Stolarek:
>>>> Add the initial version of unit tests for ttm_device struct, together
>>>> with helper functions.
>>>>
>>>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/Kconfig                       | 15 +++++
>>>>   drivers/gpu/drm/ttm/Makefile                  |  1 +
>>>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |  4 ++
>>>>   drivers/gpu/drm/ttm/tests/Makefile            |  5 ++
>>>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 54 +++++++++++++++++
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 59 
>>>> +++++++++++++++++++
>>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h | 29 +++++++++
>>>>   7 files changed, 167 insertions(+)
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/.kunitconfig
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>>
>>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>>> index afb3b2f5f425..53024e44a2d5 100644
>>>> --- a/drivers/gpu/drm/Kconfig
>>>> +++ b/drivers/gpu/drm/Kconfig
>>>> @@ -194,6 +194,21 @@ config DRM_TTM
>>>>         GPU memory types. Will be enabled automatically if a device 
>>>> driver
>>>>         uses it.
>>>> +config DRM_TTM_KUNIT_TEST
>>>> +        tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
>>>> +        default n
>>>> +        depends on DRM && KUNIT
>>>> +        select DRM_TTM
>>>> +        select DRM_EXPORT_FOR_TESTS if m
>>>> +        select DRM_KUNIT_TEST_HELPERS
>>>> +        default KUNIT_ALL_TESTS
>>>> +        help
>>>> +          Enables unit tests for TTM, a GPU memory manager 
>>>> subsystem used
>>>> +          to manage memory buffers. This option is mostly useful 
>>>> for kernel
>>>> +          developers.
>>>> +
>>>> +          If in doubt, say "N".
>>>> +
>>>>   config DRM_BUDDY
>>>>       tristate
>>>>       depends on DRM
>>>> diff --git a/drivers/gpu/drm/ttm/Makefile 
>>>> b/drivers/gpu/drm/ttm/Makefile
>>>> index f906b22959cf..dad298127226 100644
>>>> --- a/drivers/gpu/drm/ttm/Makefile
>>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>>> @@ -8,3 +8,4 @@ ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o 
>>>> ttm_bo_vm.o ttm_module.o \
>>>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>>>   obj-$(CONFIG_DRM_TTM) += ttm.o
>>>> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>>>> diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig 
>>>> b/drivers/gpu/drm/ttm/tests/.kunitconfig
>>>> new file mode 100644
>>>> index 000000000000..75fdce0cd98e
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
>>>> @@ -0,0 +1,4 @@
>>>> +CONFIG_KUNIT=y
>>>> +CONFIG_DRM=y
>>>> +CONFIG_DRM_KUNIT_TEST_HELPERS=y
>>>> +CONFIG_DRM_TTM_KUNIT_TEST=y
>>>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile 
>>>> b/drivers/gpu/drm/ttm/tests/Makefile
>>>> new file mode 100644
>>>> index 000000000000..7917805f37af
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ttm/tests/Makefile
>>>> @@ -0,0 +1,5 @@
>>>> +# SPDX-License-Identifier: GPL-2.0 AND MIT
>>>> +
>>>> +obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>>>> +        ttm_device_test.o \
>>>> +        ttm_kunit_helpers.o
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>> new file mode 100644
>>>> index 000000000000..08d7314b1e35
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
>>>> @@ -0,0 +1,54 @@
>>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +#include <drm/ttm/ttm_resource.h>
>>>> +#include <drm/ttm/ttm_device.h>
>>>> +#include <drm/ttm/ttm_placement.h>
>>>> +
>>>> +#include "ttm_kunit_helpers.h"
>>>> +
>>>> +static void ttm_device_init_basic(struct kunit *test)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>> +    struct ttm_device *ttm_dev;
>>>> +    struct ttm_resource_manager *ttm_sys_man;
>>>> +    int err;
>>>> +
>>>> +    ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
>>>> +
>>>> +    err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
>>>> +    KUNIT_ASSERT_EQ(test, err, 0);
>>>> +
>>>> +    KUNIT_EXPECT_PTR_EQ(test, ttm_dev->funcs, &ttm_dev_funcs);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev->wq);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
>>>> +
>>>> +    ttm_sys_man = &ttm_dev->sysman;
>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man);
>>>> +    KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_tt);
>>>> +    KUNIT_EXPECT_TRUE(test, ttm_sys_man->use_type);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, ttm_sys_man->func);
>>>> +
>>>> +    KUNIT_EXPECT_PTR_EQ(test, ttm_dev->dev_mapping,
>>>> +                priv->drm->anon_inode->i_mapping);
>>>> +
>>>> +    ttm_device_fini(ttm_dev);
>>>> +}
>>>> +
>>>> +static struct kunit_case ttm_device_test_cases[] = {
>>>> +    KUNIT_CASE(ttm_device_init_basic),
>>>> +    {}
>>>> +};
>>>> +
>>>> +static struct kunit_suite ttm_device_test_suite = {
>>>> +    .name = "ttm_device",
>>>> +    .init = ttm_test_devices_init,
>>>> +    .exit = ttm_test_devices_fini,
>>>> +    .test_cases = ttm_device_test_cases,
>>>> +};
>>>> +
>>>> +kunit_test_suites(&ttm_device_test_suite);
>>>> +
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> new file mode 100644
>>>> index 000000000000..d03db0405484
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>>>> @@ -0,0 +1,59 @@
>>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +#include "ttm_kunit_helpers.h"
>>>> +
>>>> +struct ttm_device_funcs ttm_dev_funcs = {
>>>> +};
>>>> +EXPORT_SYMBOL_GPL(ttm_dev_funcs);
>>>> +
>>>> +int ttm_kunit_helper_alloc_device(struct kunit *test,
>>>
>>> Since this function is only initializing the ttm device I think we 
>>> should name it ttm_kunit_helper_init_device().
>>>
>>> On the other hand I don't see a good reason why it can't also 
>>> allocate the device.
>>
>> I believe that's a leftover from times when I thought I'll reuse DRM 
>> device between the tests. No problem, I can put them into one function.
>>
>> All the best,
>> Karolina
>>
>>>
>>> Apart from that looks like a good start,
>>> Christian.
>>>
>>>> +                  struct ttm_device *ttm,
>>>> +                  bool use_dma_alloc,
>>>> +                  bool use_dma32)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>> +    struct drm_device *drm = priv->drm;
>>>> +    int err;
>>>> +
>>>> +    err = ttm_device_init(ttm, &ttm_dev_funcs, drm->dev,
>>>> +                  drm->anon_inode->i_mapping,
>>>> +                  drm->vma_offset_manager,
>>>> +                  use_dma_alloc, use_dma32);
>>>> +
>>>> +    return err;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(ttm_kunit_helper_alloc_device);
>>>> +
>>>> +int ttm_test_devices_init(struct kunit *test)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv;
>>>> +
>>>> +    priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
>>>> +    KUNIT_ASSERT_NOT_NULL(test, priv);
>>>> +
>>>> +    test->priv = priv;
>>>> +
>>>> +    priv->dev = drm_kunit_helper_alloc_device(test);
>>>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->dev);
>>>> +
>>>> +    priv->drm = __drm_kunit_helper_alloc_drm_device(test, priv->dev,
>>>> +                            sizeof(*priv->drm), 0,
>>>> +                            DRIVER_GEM);
>>>> +    KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv->drm);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(ttm_test_devices_init);
>>>> +
>>>> +void ttm_test_devices_fini(struct kunit *test)
>>>> +{
>>>> +    struct ttm_test_devices_priv *priv = test->priv;
>>>> +
>>>> +    drm_kunit_helper_free_device(test, priv->dev);
>>>> +    drm_dev_put(priv->drm);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(ttm_test_devices_fini);
>>>> +
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h 
>>>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>> new file mode 100644
>>>> index 000000000000..69fb03b9c4d2
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
>>>> @@ -0,0 +1,29 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>>>> +/*
>>>> + * Copyright © 2023 Intel Corporation
>>>> + */
>>>> +#ifndef TTM_KUNIT_HELPERS_H
>>>> +#define TTM_KUNIT_HELPERS_H
>>>> +
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/ttm/ttm_device.h>
>>>> +
>>>> +#include <drm/drm_kunit_helpers.h>
>>>> +#include <kunit/test.h>
>>>> +
>>>> +extern struct ttm_device_funcs ttm_dev_funcs;
>>>> +
>>>> +struct ttm_test_devices_priv {
>>>> +    struct drm_device *drm;
>>>> +    struct device *dev;
>>>> +};
>>>> +
>>>> +int ttm_kunit_helper_alloc_device(struct kunit *test,
>>>> +                  struct ttm_device *ttm,
>>>> +                  bool use_dma_alloc,
>>>> +                  bool use_dma32);
>>>> +
>>>> +int ttm_test_devices_init(struct kunit *test);
>>>> +void ttm_test_devices_fini(struct kunit *test);
>>>> +
>>>> +#endif // TTM_KUNIT_HELPERS_H
>>>

