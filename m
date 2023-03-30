Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169A6D0238
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1105C10E170;
	Thu, 30 Mar 2023 10:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF8610E170
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8c76S1m8068GT3XxUneb0MyFOl8pw6hB3I79qhLC5LbG+H1KRZzN6w1n7nKI4SEN1IF4tIiPJfp8OPQeyNf7wfX/YVtfFtZKiZ0rRi7YMC6N19syMwYU6HReRBzRRzvwHiPQJb9oy7Nt+PyV0/6/5qtqdTH8Ku/IPJX+E2pvEJ9+WGRoTSsHRzokvdWyp+bi42NaNf5XAWMyyToJsrunhxoWsGopCnNSLelIfMiQMvbcCDXeN9dp6ifsdD0/qvW9gvwaiQ3f+L75hAdp1Hmg/mqvEcIzGumy3FKvhM0CW6SC/2NH7sqGNoqxm5Lv7ghBzJrsPnsTlVd+Nmhzd0J+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBKJgTvVMUw6WSjprv+iFaGtvY7zpB1L8rMB2wzx57g=;
 b=IDHN6l+CRFZLkJBXVS5FVJvMHK4cutOyTodA0zjmXaw2mo1l9zarfZ/zbddcdGuyWs5BYhfmv8BslSpTR1KY/Q7ZudKq7bDaibtuyh6dGYg1Okusduy4OXcI5CNOc3Q9lxyhO3jiC50odTT9NlHytutbSzwHL/N+4dHr7PTO1qMK2P9VkvmrE+GrVdsxgPpe7/UwdVViQt7kwGqSTcz4OV7ws6/eWumChThOHEteNUniUY3jk+L+CApHjB9ER6ga3NUz8jyb9saH/Cbfa/kboDP5vOO5aVwGNXnMYPH8Q5uB+Ve6kMj6vJgDftMcpU/TBydh8e8gMzeWTJALJlAMAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBKJgTvVMUw6WSjprv+iFaGtvY7zpB1L8rMB2wzx57g=;
 b=qeA8kCNRSurGDHZjsoUJjoBWCprKjVIfiQQP5VIO3zrU2GBHqnPciZlTyVLxG/n6TgJPYJ74jspNm4sbzH729T0cMCI0ll9eUng3ZzUF+pFdXBFgANvqpykaWGfauW3ghBEq3r+NFtrvlHmqUqyPdMWKMAD7dNdF8n7jrKO6F+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 10:56:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 10:56:32 +0000
Message-ID: <e1af591e-a183-9b22-f533-297934e15e30@amd.com>
Date: Thu, 30 Mar 2023 12:56:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] drm: buddy_allocator: Fix buddy allocator init on
 32-bit systems
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, David Gow
 <davidgow@google.com>, =?UTF-8?Q?Lu=c3=ads_Mendes?=
 <luis.p.mendes@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20230329065532.2122295-1-davidgow@google.com>
 <878rfe4iis.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <878rfe4iis.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::14)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fecfa18-a45c-4845-206f-08db310d6bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hYTZXPhQgANCBTKvrU+khI5dmp0xwuU3+yrTCezmP8LuHcxbPhR4dBw/0vzQzhmtofqWKtiQe/o9sl9hfYigk0MmtV4cetT8y++4jdmyaa5bAKZoHom4uXup5cvpB04LSQ23Kryje2FnJbyjkQwuPVGKRwFEb/3kTnzvJEWzYTmZZInvrbKoFQYpRoYg8TeRfkO9RZIWLMpHIHFlKVv8MvlqwNCr5tyUKm0F/kLvw6LP2Wnd2RdTTltv0ZtwkQNKCY3gfTQerWk1rbbsfCcAdJgGJ/xaerk91zlOxECV/yjOMttXbfH6WqKD7ZiNS/g0umIEhfyhspS+IYCsL1YhW4NjUtKC8dAfKxbuvNVWg6AIsqTU+dY02hrDjSDRl1fWVKfdncVgPrPYHwIrTFFeQsIND8TwuzraSOginkvlgSvFDH3eauf0IWNBMkc2s7Zk4CvpXpZYeKtIuyFGxAYxUfu2jRpSpmsMzIN3QUfEV+FBabxGJhQyBuebHxR22J74bdqPQ04KNpuwwc2Adnz6AGnb1tFYnl5hbset/vRvDImZqae9g9izAgXgpaWD3yA3DoyF9+iZ8VNMdZ/ckxiQ4YzcM4RVV03pYD//oSCz2heUw3y1UQthm0b8wvNCAM4CJk3ay9mXRwT4QaYQ+ywSPWsiCrgqnl4PdMc9McpFUWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(31686004)(2906002)(83380400001)(66574015)(7416002)(26005)(8936002)(5660300002)(6506007)(6666004)(316002)(36756003)(966005)(6486002)(110136005)(66946007)(478600001)(6512007)(66476007)(2616005)(186003)(66556008)(4326008)(38100700002)(8676002)(41300700001)(31696002)(921005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmp5YVBId0Z6VFpPSjFIdTZmTFVsYmgzaXNmaFJ1THRwcFhnbmhZcHpZWlhR?=
 =?utf-8?B?VXE1TWZ6dHBrTEZoSzBFM01mbnBBOUZpY3A3R2ZTUW02M05DQkRWS3lyemFm?=
 =?utf-8?B?ZkhqRW1uUWRYc3BGWFhVUVU2dHZLenNDTnAyVS9rd1BrN1Zmb1ByVU1KcGxh?=
 =?utf-8?B?NGlpL0dST2Q4M3Qrck8rY2hRRWlZK1hNQXVmSng1MGsrWTJrTnR5L3lVRjVn?=
 =?utf-8?B?SmoydHAzQlJHcDFrbjg5eExQejlhQ1cxeEs1cVdjZUVGSkJEL2MzWklpS3lx?=
 =?utf-8?B?bUpyNnNLNG1odW5uZDEzMEh2TGdvdGZmbU85NFFZcThlYmovQnRHSHZISk12?=
 =?utf-8?B?Qko0ZllZTlh4d0hqUXllSFBPeWdnZ3lxOWlEZTN4K2ZwMUpUSitJR2tDQUxB?=
 =?utf-8?B?N3ZrUHdRcTRpNldvSyttYjBQRUg1dDd2a21ObVM5VEJVZVo0ckZabHJvRzE3?=
 =?utf-8?B?djhRSEVVVGVKRXZBeFV5aFVOVTgvdTg2MVJwTUtrUStzRkF0b2RtbStoQi9y?=
 =?utf-8?B?amRaR3ZGMVA0VU1NMVY1Q1lmeWt6YXNLN2w2MitDNnE4WmwrNDg2L3J4aDdx?=
 =?utf-8?B?TTRWbnN4YVoveEFBMC9HanpUR3BmdnRhQ1R1MjkvY0FlT2VnMFRJaUFqWXVS?=
 =?utf-8?B?WHJ4VVdhYkpUNzQwa3JKdFYyaTlvekFvSlRLM2dIZGs4Y2J3UUF4V3gwYVNt?=
 =?utf-8?B?NEh5ME10Sit2LytJdWdPejJmZEZQVUtsSXQyUEpXM28veUNuRmxNWVhEVFlP?=
 =?utf-8?B?RFJiTXFxcFJlWkNHS1lWR0ZRTEZrYmVUKytFcit0RVY3cE9yNUJ0NGxKOXZl?=
 =?utf-8?B?aWR2VEhJVjUwa3dpNWpRc3cyY0twV0hhd0o4ejl4R0FFMDF3bTBiUHFWOE1o?=
 =?utf-8?B?SE5qOXEyS0FBNEZDd0N0dGY1WTVhZUFoNy9iVDF5VzBsWFhVWEEvMTlocitw?=
 =?utf-8?B?NWoraGNPUTRiaXJDeU9lWVBUK1pvL0ttZ0EzUWtrbWd4ajZFZ0E5UjFwd0hX?=
 =?utf-8?B?eEwwSFgxeDN5TXdLWU41dVVkRkxpdHVQck84RytaRlFIS2VjSGJuenlQTWd3?=
 =?utf-8?B?YnJQQlR3U1E2bXNwaURLQ0UrWTN5M0VwNVdQYU8xbmZRN1ViNG55VzVEclk1?=
 =?utf-8?B?VzB5UGtGcThHUXdoTVp6OGJiWWxsMFVOQmpIMmpDWXB4ajRpVGlHcURFQVFL?=
 =?utf-8?B?T2FSU3dDNHdPcExxaVJ5dVl4djY4Sm5aSm4rS1VJMVBVcTFEclRzQ3p6bTFF?=
 =?utf-8?B?ZUk2Mm9kVm02dWZoMVM0Sno0RUphMVg0VWYweEszK09wY2ZIdDJOZlh1NHhM?=
 =?utf-8?B?Nk54S09QeXZkYnVkbmovKzNJdkhyZkpLSXlvSjcxQlFXdUY2K2ZNZWJjZnBj?=
 =?utf-8?B?aFJtandsdmVzUkhidkl2OHlrWGlWZFFzb2x3S0Y5ckIxZjF6dWo3WVpWQjZq?=
 =?utf-8?B?L0ZNT05lQ2pLNE45U3A5dzNGa2ZiY0RSTkZFL3dQYnpzandSZUtTbEFydHB6?=
 =?utf-8?B?amp3VmozRzJudnQ1RzZKR0FSclJIZGRKT2QwTWZBdnNSTmw4QUlBM2QrMkVy?=
 =?utf-8?B?SDkxalc0V0ZyN0FhSHgrNTVuSlg2QlV0Wm9rd2tVcUxUa29MYk9tTWMrYkZL?=
 =?utf-8?B?WHFNeEQrVzB3ekQvS29ZeE00WXdGRHhRWFdDZFdDc2k5aHNHMXM4ZmFuWUFw?=
 =?utf-8?B?ZTZCQzRMRE9tRzE5VUl5eXRJTDhtalFqT0dCSm5NTUtWS0QyR25md1ZjVHJo?=
 =?utf-8?B?OTEzN0NIazlobUNWOEYzZVV5bkErdThNWFh6NERub2ZmRGlOd0hKUS9ZZ1h4?=
 =?utf-8?B?S3g2ZVd4WGNVOWN5VlNmNXZyaWk2UXdoUUU0QTBoSkpvaXdueEtYY0luYi96?=
 =?utf-8?B?ek1Na0dDUUZ2RCtFeU1qVWJ6NVo4NG80Z3EzNlNrNEFMTVkrNkhzc0pwWHdD?=
 =?utf-8?B?Vm55bVFEZVRKbDJMUFhRM2NjOUdTVzFIcTdXQWhsTzZJWGV5d2RFS3NsY2NS?=
 =?utf-8?B?TDl1bDVFTVFMd1dUQ0JHRnRIbzJ1QjlXV1cvam82K1o3OGlMdXBlUTNzcUg3?=
 =?utf-8?B?UHdOcmtZQkNzTnJhUDQ3Uk91cFdWR2FhMTBUZGVxdGJNRHA4MW1jWjdFTk9I?=
 =?utf-8?Q?hQDI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fecfa18-a45c-4845-206f-08db310d6bed
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 10:56:32.0399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNRadyi83x+X2Mk7L+EoIz682MNWjFaBT/bj8nKhTxZEX/EgmVmnVMZ84h6wv0Qo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.03.23 um 12:53 schrieb Jani Nikula:
> On Wed, 29 Mar 2023, David Gow <davidgow@google.com> wrote:
>> The drm buddy allocator tests were broken on 32-bit systems, as
>> rounddown_pow_of_two() takes a long, and the buddy allocator handles
>> 64-bit sizes even on 32-bit systems.
>>
>> This can be reproduced with the drm_buddy_allocator KUnit tests on i386:
>> 	./tools/testing/kunit/kunit.py run --arch i386 \
>> 	--kunitconfig ./drivers/gpu/drm/tests drm_buddy
>>
>> (It results in kernel BUG_ON() when too many blocks are created, due to
>> the block size being too small.)
>>
>> This was independently uncovered (and fixed) by Luís Mendes, whose patch
>> added a new u64 variant of rounddown_pow_of_two(). This version instead
>> recalculates the size based on the order.
>>
>> Reported-by: Luís Mendes <luis.p.mendes@gmail.com>
>> Link: https://lore.kernel.org/lkml/CAEzXK1oghXAB_KpKpm=-CviDQbNaH0qfgYTSSjZgvvyj4U78AA@mail.gmail.com/T/
>> Signed-off-by: David Gow <davidgow@google.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 3d1f50f481cf..7098f125b54a 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -146,8 +146,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>   		unsigned int order;
>>   		u64 root_size;
>>   
>> -		root_size = rounddown_pow_of_two(size);
>> -		order = ilog2(root_size) - ilog2(chunk_size);
>> +		order = ilog2(size) - ilog2(chunk_size);
>> +		root_size = chunk_size << order;
> Just noticed near the beginning of the function there's also:
>
> 	if (!is_power_of_2(chunk_size))
> 		return -EINVAL;
>
> which is also wrong for 32-bit.

Yeah, but that isn't vital. We just use u64 for the chunk_size for 
consistency.

In reality I wouldn't except more than 256K here.

Regards,
Christian.

>
>
> BR,
> Jani.
>
>
>>   
>>   		root = drm_block_alloc(mm, NULL, order, offset);
>>   		if (!root)

