Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A68190EE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 20:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9548910E1C8;
	Tue, 19 Dec 2023 19:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E7410E1BF;
 Tue, 19 Dec 2023 19:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpToea8p3DPuxPG2L3ALrCudXoBObtGakfvCy9lMUW70IH+3dGxFBfdHonLagTQPzNQcAAiQQumUB7iG8l+Wqe7Gbu/HJS2IoNMdrqPV3gAfkEPLRJNKy2H7BBFeUTi3qXG/1qZTpKnk7Cs1Pbws048rqsvNu1jbqOGYVXpC1o/BSSnsI+K2ctqFCPeRxJz8yzQ7fdqzXA5G7TntCCaKiaDzedrzZwhWjojurDf+oqYYUVczf5pT717WGFlenWSRUjqHcWyKGgjj3ykbXMz7xj/FwJOAeMLRB/Vp+qrpsogY8E3ddptF6om5Aul8QdVWj95nYKNIy2PGLuwp4wN2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzNf2Z/fcI0Hb+cR7YKt8615sJB4f6/QHI3nXOJ+KiQ=;
 b=GCJGvrFRFxovwgb3Oi3IPugWNvGj5a76UnOlMdqJWKfvvXyF7iOh0rxR5Z3QspXCQ8aqPRC6QSsajciOpKHfC2OMVUnaYV3xdXAu6tx3N4h3uClTBbZV6IbU/GKoAaytEHtQRC/Swzk8zJkJ7jgL1UhSRaJL8ei9Cryeg6sabtASZJ22e35/I6IP6TC7CskaW9AmcX3Mp8WA1A5B8M7ih+k3Mf2v3IPkeoAaxSYw5rbvY+35VG/+DEHln9WdZrD9vUMUJe70F2B0KMYGcD34EH83jYL7VB5fOgjefElGaj2MyoOSqRPykzEq7rr0qPXi1VLU8jVwIFmGvIHYn0J8tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzNf2Z/fcI0Hb+cR7YKt8615sJB4f6/QHI3nXOJ+KiQ=;
 b=BjhwOrkGdLQxEPWzAq+M8XNtQrKirRpVO41cI5jKcGnD18ucqwr9S9dB1hAXnQzL0IPYon9FlhSr3kygiIHDx7LBpmTZYDLj+v5/C405LhfLxhtvXhkBQ+zkHgxgEuKif8s+0eDW+IqJ8c7KFiAx0i4vPzrX612g0cjMGoWg9NQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB9445.namprd12.prod.outlook.com (2603:10b6:8:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 19:36:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 19:36:26 +0000
Message-ID: <7a299db0-41fb-4d09-9bc0-6a717fb884f9@amd.com>
Date: Tue, 19 Dec 2023 14:36:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 04/23] drm/vkms: Add kunit tests for VKMS LUT
 handling
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-5-harry.wentland@amd.com>
 <20231207163017.3fdf0e73@eldfell>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231207163017.3fdf0e73@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0344.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e4cdf4-6430-4e97-2598-08dc00c9ca2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUvmvFdpBwoqnC7mL+aH6wqMQEUWPZ9RY4Mvet/hlfYw/zIrVFcayDVzGoXUhyhYQ9AWS+jToD7k2S0Dy3ByjdUIhhbWrpyD16lNZG9FXxXmZ1UMOtd+HJd0tyi0bKlIUcvSJucRIiHtQOZaxtsxxAASwFrhanDsVSqzREpFr+iNPJoASBbHK5sWbg5X5smKC2DFLMtJZ3xxu1jSSWe+JaNG9rJTQW9rfDa4XwbkbXXZ0fLKSRpYQOIKQAoW3fVdd4zNIcKbs+MRKG/p+imnItzKuk9AmCOurfZ/iR9B8caESCk2TRxExNX5JQUnw2uELnvx4WkqZ2kPfbImpkFuwheufdz2S8ueW7F9Kdh5X37n5t7RmB0dfwfVOpOwx62+7E4roTR6TTP9nRvjMWQAB3W1fj1c24I3DAO8TAZRtyVaQaHK9Ogm36W8e6SSdhNdSAvQ54Amu5RTCc0Ysc9W9LZ5opM+PdXyZzyd94i3CqfLfVHqLfU+Yd0oJ0cmIoZWsyJPCBJAHEvGggStV5dKAsMT/1q75tdg3bbiWort0uMgBrEN8JOFj4Gtx/XzIeJHqi6BYjGAONtMueT9aLCEKsHyn0bzgS/4fS7sRqwTOxMzMcQDqtPRR7iMk3YY8E0tQRyX9Kaft+jri1UL4b1IAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(376002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66556008)(83380400001)(86362001)(41300700001)(31696002)(5660300002)(66946007)(38100700002)(44832011)(6486002)(8936002)(316002)(6916009)(6512007)(53546011)(8676002)(478600001)(26005)(4326008)(2906002)(6666004)(6506007)(2616005)(66476007)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0xiRThFR2V2bUlzK1MydE1iVFdNSitLWThHczhhYzdlSkdvTUtCTlNmc051?=
 =?utf-8?B?RVNvejdRdW5aMjVMZllTSFRaV2RrWkZSdDBrYnJ2YWRiUFQ0Y0h6U0RlaTRh?=
 =?utf-8?B?OUV3VHBvYkhZOHJaQWx3cDRnVm9raVhmN0YzQkxhaURPNDAzem5Gbyt4ZVFK?=
 =?utf-8?B?amtvZk9iYkUwRUNhWG5oNEtDWlI4VzVBQ1JrR2htV1pBZ1lHckMxcEJMSjJU?=
 =?utf-8?B?bVcrbzZ4MXFYdy8wajN3WVgwVlR5OUlJYTVvRU9GNGRiUkpSQndSbmdsSXJE?=
 =?utf-8?B?QXVDWkM2Rnc0T3pNbUt1eGk3MFpDVU1YZmR5SXpsc1pjT2w0OWVmbDAyd0t0?=
 =?utf-8?B?enpiUHdBWWFoQUJCaUE3VjIrL1E2cFZYS0VsUzZGZUx3RC9GQWU2OEpMY0hP?=
 =?utf-8?B?QWRNbXBYcWltQkNmSXZDU2wzOWs4aDBBMFRUenowb3NRYmNzM3J1QndGTnVG?=
 =?utf-8?B?VVdkV2RVUHFONUowaWswK3c0NzhVTW1SbW5pbDhYbTVIdGE4OEc5ZUxsam9S?=
 =?utf-8?B?Z0hEZ0VqN3QwdENCeFhDYmVTL3ZLMXRObkdtQ1N3ZTlWMU5aT25vVnJIUmRX?=
 =?utf-8?B?emp3cGdmbjE2ditIL0w1c0lRVmsyL1NIZ2ZwU0xyaXVoMUhkRlRSOGxJbjBk?=
 =?utf-8?B?a1BsZmJzVTNHSVJzMmk5ZzByVUpHbWEyVjNqNFFEdVE2aTZKTzczVzlEL2po?=
 =?utf-8?B?ei9KNy9BczBESjJxK3dJaFNIdEFqa0FsUjdLTDg0dDhzL3M2bWlaZVpjSW00?=
 =?utf-8?B?RGw3ZDB0VnhqTmR3S3NKOWh3Zi9NSnVqb0YvSUFzQ21BbTd2c0c0dENZK1cx?=
 =?utf-8?B?dGhZcVRtK1FmQXBnaGQ3V0MwWFAwWTNIY3dRRFRvTE1PUW9URkJTQkxRdDBU?=
 =?utf-8?B?RVZKMG9pcXp1ekpGR1RtQ0RGTjhmNC93Z3kvZ0hLanpQazE0dGRrS3RybGVU?=
 =?utf-8?B?TGh0RVFPdE1qMkM5Ni92VWVUNldnZTQrZVYyZ2JjVzAwV0FiTEhrSG10bTY4?=
 =?utf-8?B?a1pVYW8xbEorY3RPcG9FY2x1T0lqYm9DeWNPNHNmaHU5WG8rOEs4NFNWWGZV?=
 =?utf-8?B?UzR4RVBGYitlUW5pUDVVbEFleGxYVkRtTjRzUHgydTYwVkhSTGVXRzV3cm5s?=
 =?utf-8?B?SC8rRjlnSzdSTDVGSXExczlGS2MwR291bkdzdkZrRnZaczg4YXNiK0VkVXRx?=
 =?utf-8?B?MUxSZFgyUHpqWWxZQldDeHUzbU9XY2Q2R2F4eHZCeEs0b3pQZ1Rpdmh6OFVr?=
 =?utf-8?B?dk1IUnVLQnJXNk1ORVVxdVZvSVRLUzRQcCtZR0FSaGtyQzVvTngzdG91RXhU?=
 =?utf-8?B?MFQxUkh6V1pSdDNmZWtydDNRYkFnN2J3SzdqcFdxSVhKeE1HVFdrS0R5MkVZ?=
 =?utf-8?B?bXJxNWFwZFFqVkQyU3E2ZXBNT0FpNmZETkZpSmhUbWVYNmtYV3VTTnpFVkR5?=
 =?utf-8?B?azY4bEtndTk5VlZoaDQrbnB5V2t0SUJRUVY2UkliMDBIZW5vZGt1ZWJMNmxB?=
 =?utf-8?B?NW5wMDU4aHY5bGRVUW4xd0RETUh1VE5QTy9JVDNIRWowYlB2bXpTdGowSlBr?=
 =?utf-8?B?WTNpRkYwNTRRRWR0eGQrZEI3cytKWGVwYmJIb3hVd1R0dndHVmZLZUd2WUgr?=
 =?utf-8?B?akw5WFpTdkl1cTJVRmhVRXRsZzB6Y0lIL2VvaEwrOG50Y01laUVvOG1hTUlx?=
 =?utf-8?B?UCtra1lvL0FxcXhac3B2UzVHbEJNN0V4dVZBS1dLUnJ2N1BVTWc0aFRsQ3BX?=
 =?utf-8?B?Q0ozdU9raVZYMi94MFNaSzM4UkViQVQ2eVVUWUNIanNGZXQ5L2p0N092ejBn?=
 =?utf-8?B?MERweEdUQmxhcmlzR0J0YjQ5bmFHZUV1YjdFYS8yWGROeU10L2hCVHlxblVJ?=
 =?utf-8?B?TWkzNzBWaFpXQjdyS3dNYlMxeFdvQjRZQmxIRGVuaTQxc1hYU0YrNGRyVjA1?=
 =?utf-8?B?TllrL1piN0RHMGFtUnR1WnozNHVZbUVGM3NWQWpSY3doSEpxdjIzRkt3SG1B?=
 =?utf-8?B?NXVML1Z5akJ2MGdZSTVVa0JUajJDaHRmS2J0WWgydVVEWXRZbnRobG8wTjJM?=
 =?utf-8?B?cFhDeEtLWUJCeXhEb0lhK3ZLeHY1OHY5dndkcGE5L3dGSC9MNFpZUXZpcHZP?=
 =?utf-8?Q?CoxhrIc5ORD3e9Ul2wNjZxbQ4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e4cdf4-6430-4e97-2598-08dc00c9ca2b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 19:36:26.3343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fjMOu3ro7D2zcfDAZui18H3FsyxzlX3WtI6PqTciakOeeV+kvME3FAjffWg0IcS6EA4aEXQwv7adyNuKnAyUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9445
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-12-07 09:30, Pekka Paalanen wrote:
> On Wed, 8 Nov 2023 11:36:23 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> Debugging LUT math is much easier when we can unit test
>> it. Add kunit functionality to VKMS and add tests for
>>  - get_lut_index
>>  - lerp_u16
>>
>> v3:
>>  - Use include way of testing static functions (Arthur)
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>>  drivers/gpu/drm/vkms/Kconfig                  |  5 ++
>>  drivers/gpu/drm/vkms/tests/.kunitconfig       |  4 ++
>>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 62 +++++++++++++++++++
>>  drivers/gpu/drm/vkms/vkms_composer.c          |  8 ++-
>>  4 files changed, 77 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
>>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>>
>> diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
>> index b9ecdebecb0b..c1f8b343ff0e 100644
>> --- a/drivers/gpu/drm/vkms/Kconfig
>> +++ b/drivers/gpu/drm/vkms/Kconfig
>> @@ -13,3 +13,8 @@ config DRM_VKMS
>>  	  a VKMS.
>>  
>>  	  If M is selected the module will be called vkms.
>> +
>> +config DRM_VKMS_KUNIT_TESTS
>> +	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
>> +	depends on DRM_VKMS && KUNIT
>> +	default KUNIT_ALL_TESTS
>> diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
>> new file mode 100644
>> index 000000000000..70e378228cbd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
>> @@ -0,0 +1,4 @@
>> +CONFIG_KUNIT=y
>> +CONFIG_DRM=y
>> +CONFIG_DRM_VKMS=y
>> +CONFIG_DRM_VKMS_KUNIT_TESTS=y
>> diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_tests.c b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>> new file mode 100644
>> index 000000000000..b995114cf6b8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +
>> +#include <kunit/test.h>
>> +
>> +#include <drm/drm_fixed.h>
>> +
>> +#define TEST_LUT_SIZE 16
>> +
>> +static struct drm_color_lut test_linear_array[TEST_LUT_SIZE] = {
>> +	{ 0x0, 0x0, 0x0, 0 },
>> +	{ 0x1111, 0x1111, 0x1111, 0 },
>> +	{ 0x2222, 0x2222, 0x2222, 0 },
>> +	{ 0x3333, 0x3333, 0x3333, 0 },
>> +	{ 0x4444, 0x4444, 0x4444, 0 },
>> +	{ 0x5555, 0x5555, 0x5555, 0 },
>> +	{ 0x6666, 0x6666, 0x6666, 0 },
>> +	{ 0x7777, 0x7777, 0x7777, 0 },
>> +	{ 0x8888, 0x8888, 0x8888, 0 },
>> +	{ 0x9999, 0x9999, 0x9999, 0 },
>> +	{ 0xaaaa, 0xaaaa, 0xaaaa, 0 },
>> +	{ 0xbbbb, 0xbbbb, 0xbbbb, 0 },
>> +	{ 0xcccc, 0xcccc, 0xcccc, 0 },
>> +	{ 0xdddd, 0xdddd, 0xdddd, 0 },
>> +	{ 0xeeee, 0xeeee, 0xeeee, 0 },
>> +	{ 0xffff, 0xffff, 0xffff, 0 },
>> +};
>> +
>> +const struct vkms_color_lut test_linear_lut = {
>> +	.base = test_linear_array,
>> +	.lut_length = TEST_LUT_SIZE,
>> +	.channel_value2index_ratio = 0xf000fll
>> +};
>> +
>> +
>> +static void vkms_color_test_get_lut_index(struct kunit *test)
>> +{
>> +	int i;
>> +
>> +	KUNIT_EXPECT_EQ(test, drm_fixp2int(get_lut_index(&test_linear_lut, test_linear_array[0].red)), 0);
>> +
>> +	for (i = 0; i < TEST_LUT_SIZE; i++)
>> +		KUNIT_EXPECT_EQ(test, drm_fixp2int_ceil(get_lut_index(&test_linear_lut, test_linear_array[i].red)), i);
> 
> Hi,
> 
> what about testing with values not directly hitting a LUT element?
> 
>> +}
>> +
>> +static void vkms_color_test_lerp(struct kunit *test)
>> +{
>> +	KUNIT_EXPECT_EQ(test, lerp_u16(0x0, 0x10, 0x80000000), 0x8);
> 
> It would raise much more confidence in lerp_u16() if there were more cases:
> - odd a
> - odd b
> - odd b-a
> - b = a
> - b = a + 1
> 
> For each of the above:
> - t = 0.0
> - t = 1.0
> - t = 0.0 + 1
> - t = 1.0 - 1
> - t chosen so that result must round/truncate
> - t chosen to verify the flipping point of result a (or b) to a+1 (or b-1)
> 
> I think those are the fragile points in a lerp implementation.
> 

Good point. Adding the "t = 1.0 - 1" test actually showed a problem
with the lerp_u16 function. I have a fix for it.

Harry

> 
> Thanks,
> pq
> 
>> +}
>> +
>> +static struct kunit_case vkms_color_test_cases[] = {
>> +	KUNIT_CASE(vkms_color_test_get_lut_index),
>> +	KUNIT_CASE(vkms_color_test_lerp),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite vkms_color_test_suite = {
>> +	.name = "vkms-color",
>> +	.test_cases = vkms_color_test_cases,
>> +};
>> +kunit_test_suite(vkms_color_test_suite);
>> +
>> +MODULE_LICENSE("GPL");
>> \ No newline at end of file
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 3c99fb8b54e2..6f942896036e 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -91,7 +91,7 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
>>  }
>>  
>>  // lerp(a, b, t) = a + (b - a) * t
>> -static u16 lerp_u16(u16 a, u16 b, s64 t)
>> +u16 lerp_u16(u16 a, u16 b, s64 t)
>>  {
>>  	s64 a_fp = drm_int2fixp(a);
>>  	s64 b_fp = drm_int2fixp(b);
>> @@ -101,7 +101,7 @@ static u16 lerp_u16(u16 a, u16 b, s64 t)
>>  	return drm_fixp2int(a_fp + delta);
>>  }
>>  
>> -static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>> +s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
>>  {
>>  	s64 color_channel_fp = drm_int2fixp(channel_value);
>>  
>> @@ -429,3 +429,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>>  
>>  	return ret;
>>  }
>> +
>> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
>> +#include "tests/vkms_color_tests.c"
>> +#endif
> 

