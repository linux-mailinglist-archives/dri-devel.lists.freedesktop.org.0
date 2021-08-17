Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC13EE844
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 10:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5836E027;
	Tue, 17 Aug 2021 08:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6F26E027;
 Tue, 17 Aug 2021 08:17:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZOhLLLzdDIjHrgBbk+gOeY6oOIMZmuTI2kRv0fFsbFJs87+dc5yGnxa+sxSsUF4lesCkhkV1E4EeeyGoVj0dxyzhCFtZg9RN7SMsPb29XQYayZYbguX2R/nvTn31Ur3tkcYu3yXdBInBFgHvwb1oZBBZkHZs12+t3UtNqfp7AsuGerrBWIIWSjAkJtYzF5CByNhbUxuhPy9XwUPoaL0RuoYhBHJRX98V5X/6m5rDTIrVYgRFwaTuL6H2v9lgXeYKqoJ3IxeQDcbU+iJpEMXdJIZp6BGl4OyhkoQmY9hBibNvojgulxZvcLeDYlOTxN/+GeeiHDjjNjmTJyyJ5FsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QXppV6HhyCdT+OVNuT8ur73cmZms3ewxldkSqbyrHk=;
 b=BKehqvEXOistNkJIdKoRVjrjGK4qfQ3M6tR+ZXAeCMQWTu21Sao8xLbItXwdMDfC8eXhSMfsYG/ugLWrGFa20qDM6wVgaQutvI53/nF6+Oom5c2R3Atabf6pSSy8LZ8BbvJUqY1jQgs8rCjGZkcENA+BK4d2UYBEKPZXh2xNgS05T+/6g3UpUK2zHGMEa4/2cf1R0DnQ5HGm+UpATN8SZxcF1+EbBpT2oF+uepakj+7e6EK6KFn2MOxb1OTngDDEQ6wXBGX3qoOu9UXrHIGOHpFEecoT2vuV4SzebOGnLpDZ232vJX2QQkvtCgQ4pRcsgkB0REtbloSYmrBx4N3P2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QXppV6HhyCdT+OVNuT8ur73cmZms3ewxldkSqbyrHk=;
 b=O/i3hbjDP62yUga4Y95dYO4WIwnmSxnTPvXc7mcvBG6rlp7DyYyqX76q5cbVe4cH09DekXeG2bIVisjwRITfWHnNXKIKisOVfPxhnnHFPMZXDjS8ZIihVC1s/VCZpX7M4KBvNVK3mKSk6X02vzggFGATaFMdOtecgRLAJ7+I31E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5356.namprd12.prod.outlook.com (2603:10b6:408:105::23)
 by BN9PR12MB5241.namprd12.prod.outlook.com (2603:10b6:408:11e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 08:17:21 +0000
Received: from BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::4804:801b:71a:a8ed]) by BN9PR12MB5356.namprd12.prod.outlook.com
 ([fe80::4804:801b:71a:a8ed%9]) with mapi id 15.20.4415.022; Tue, 17 Aug 2021
 08:17:21 +0000
Subject: Re: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: "Quan, Evan" <Evan.Quan@amd.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210813102920.3458-1-michel@daenzer.net>
 <20210816103506.2671-1-michel@daenzer.net>
 <DM6PR12MB26191A1092AA54AA6405F0DAE4FE9@DM6PR12MB2619.namprd12.prod.outlook.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <2edaef45-504a-b1c7-28e4-adc0d030715a@amd.com>
Date: Tue, 17 Aug 2021 13:47:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <DM6PR12MB26191A1092AA54AA6405F0DAE4FE9@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::14) To BN9PR12MB5356.namprd12.prod.outlook.com
 (2603:10b6:408:105::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Tue, 17 Aug 2021 08:17:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a51d6f-6801-4ba3-a08d-08d961576f53
X-MS-TrafficTypeDiagnostic: BN9PR12MB5241:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5241DD508D93083242ED967297FE9@BN9PR12MB5241.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: isVxoF4JXCJNm+BaHSwJJlSORNOWOJ9QpCwwhS5IsOIWslULT9U0oS+q7fiPohmjmW8XdLC9DxnDmpowua20svF7uIFCYCSFaU/e1JpRkPF5Y3h6+HOTWfAXHlObtOhZ3ts6FhWDjkOOJXyv6mfMrV0sRedqSJcLGxkseE5Is7VLhvpm3yzZbC4/slJ7s8RZU6arHUzHiW/s668UKRZBh6Gu3R0zVjcBfB2X75PTYjMucWOW4jHx1eEBINaPME1oEnAO7UKfbINxWV+dxlkknjH212FoAVq/osO7DwP8MhXCaWra3/OkM4l6CkAR4l2vB2MeT7p2NFn+Bl8sQ7o/yKTKoYyoShJFamhq5w4KOXao4JbEw5DWg6yYL0XP2MqfvwLtILalfVgbSNtHcbBfcUOE+7wqI6+ZaOlSnndVlK0IFh4JQ8MxTySQut8rVhZhU3gqMpxlpeNmKD7G60zXd6obckyTtwazrbpdrL8t3BLTTplbG2hin6p3mQPmJ/5FwS6RLuzR6YPalOlfPm1Qncpt+mTfAzmnS8H/32YRGpehCa52lfPZE5ug/O+FC5aWDgoh67tTP2hx/1W87slOxH9VlA2hgAFUxxZ8dFbcD4gElfEaiQX3kqxb+9uhpCnHsxaK3C+wYaJEr0mmmPwuytSY6UICfwK3HSdO/z0Go2x5ysP9AOkv9OU/hx2CsdejaRW4y6UNTjfjVk/MZkaJw2tagVF016H4NO2PtR0ikCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5356.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(8936002)(86362001)(66476007)(66556008)(6636002)(6486002)(8676002)(2906002)(2616005)(31696002)(956004)(5660300002)(316002)(4326008)(16576012)(53546011)(38100700002)(66574015)(6666004)(36756003)(26005)(83380400001)(110136005)(54906003)(186003)(508600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGJDekJqTkRNQ01UUklxdzZpVnJzcnpDaGVreVQ0STE2aUlJaGdDRDh5M09P?=
 =?utf-8?B?ZnZRM0F0Y2VOeFdINlZlNkxTakN2OVFhVStLN05Vb3dpNFZoYWpMWW9ZL0RY?=
 =?utf-8?B?d3JQN1JheXFmSFV0U3drL0JSbEdNOFFSOStNNi9lY1loOGhySU9rMk1HZjlL?=
 =?utf-8?B?VmRlQ3h2QUcrWlIrbUdwZWdDS0lMQVRQV1IrWklWbXVJeWNRSHF6WkNYdWFy?=
 =?utf-8?B?MVB3a3ZwUFg2dWdoVnovVzdjUGhGT2FKYlFkTS9lSDJXRVZZYUdaM2tIWlVL?=
 =?utf-8?B?bDBLQzV6MWsvR0l4UHNpTzltRUlVQWZWdDVKOTdjZ1ZZMDR3WUg5VnpkR0tG?=
 =?utf-8?B?RXplZjZURUdzNFh3bUlYcDAwNC8vWUN2ZzhScVJ2QWtBUUNQeHVjL1lVQkpv?=
 =?utf-8?B?bnNSbzBZSk1KV1ljMFBLQ2dDZW15U0ZuU2kySXZrdFlJZ0hybjQ1Rmx4dCtP?=
 =?utf-8?B?OS9mR21uNXBLUGIvVWRybnZsR0pTM0RNTG1CUUh3djJJQmVEZ3RwMGp0cHVS?=
 =?utf-8?B?d010TjRxc3krQm5ieXV2RFdhalNDOElheHdaa2RETFlxMm1EUEptTkRqdTl6?=
 =?utf-8?B?KzV0Y0tDUFVlVnM0OGlxd0k0K3JmMi9NT2VCSndYZjdWVFd5NVp2blVoc1Zu?=
 =?utf-8?B?RTVSMUR4VXhvUzBOTzI2dXYyVVhpWFhUMXFxM1NFeVpPNjFqUTl6SnZtTk9X?=
 =?utf-8?B?SHFZUC8zQWUxM2ZrdUJjLytJT1pUZ0Q3RDVXZ0Q4dHdKZVpINzB2dXhlR3g0?=
 =?utf-8?B?UFBzOW9CTkVvTnpPa0xZczZHNFNZRS9iOEo3NlN5YXpTN3B3VzM2Y0kzaW1w?=
 =?utf-8?B?UjBwSm5xSG1STHVnM3hKVy9BbHFJMnpyMmdKNEE2a1AralV5YTY5cUxUbHli?=
 =?utf-8?B?UEhwUVhvTlJJQTVUcDJVKytnenpvMko5Y2pOVU1TSnBoVEpUcDlXSm1Ha052?=
 =?utf-8?B?alI2OG5vWDl1cHl4dlpaS1d4NmVwU1EzV25HUHRIZjN2bUR5Z0h4NldFSUV2?=
 =?utf-8?B?bjdCYzArd2lpNFBIem1PRldEL0dUeGFLUWl1TXZ2YlFKZnYvcVdhalFIL1Ns?=
 =?utf-8?B?SUlLRGtrQTJiZk11bko5S0JIQVpYdjc4MXIwdWVrUzNYZFFZL3lMdFlIYWpL?=
 =?utf-8?B?c0lNbzFnS1luVmZhc1JrcS9RdldVbUJNTStncXRzRm9kNjFZNnNJd1paanZr?=
 =?utf-8?B?Vkh2VG9hZTdjbjl4WjIzYUFWVGx4ZUZLancwZWhxZ1J0NGh3RnlzSUE5L2lk?=
 =?utf-8?B?Q05mRTlFS0ZzSnZ0S09TbkdiVlJJN2NTSlNYdUFUVEJqcEhKellTdm4xSEdJ?=
 =?utf-8?B?VWd5aFlTem83SUZ1b0h5bWRWTmZBVkhiL0NqNUlHNjV6eWpzcWlqU1oxSmo0?=
 =?utf-8?B?SUhoUXIzaExTc09leEZTL2t1bXg3UU9seVlDeUJ1VXNtUDdyNlFGUmt2Q2hn?=
 =?utf-8?B?dTZuQ3Nhb2ljOTZpUWNEeWJUVzdzL1lzbFhIVmZ4dnZidXFNcUJqb2YyNG9F?=
 =?utf-8?B?QmJhMDhzQnZiSjRUUndPZHd1K0xoNWVpeVc3Y0xkOE81Vk44UHZtRjBJclI2?=
 =?utf-8?B?b1VzUG83Q21weU5vV0owZzZ1dDB2SjFQbVdaZDI2Q1ZHMDhsRDEwVFhpZ1RR?=
 =?utf-8?B?WGtGTUlibVZrY3hsdVI4M2ZUWnFaeitUMkxoOHVHc0pYVnFsa0ZsRnpjcldV?=
 =?utf-8?B?NlI4S0pzZnZJUTNjM0taaGJZWHduVDBkRTNKOExjSlRIK0FJVWo5Yjc5U2FJ?=
 =?utf-8?Q?7qXh4qBjYH5NANk6f3+bMcD2NOrzFi3T5wf3dQR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a51d6f-6801-4ba3-a08d-08d961576f53
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 08:17:21.0438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +63qsQWo28Es+7zKjJaO9BLYb+HpeH3P5T1zSDgleR6W9jMvrBW1QRVyBxV/wWTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5241
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



On 8/17/2021 1:21 PM, Quan, Evan wrote:
> [AMD Official Use Only]
> 
> 
> 
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Michel Dänzer
>> Sent: Monday, August 16, 2021 6:35 PM
>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>
>> Cc: Liu, Leo <Leo.Liu@amd.com>; Zhu, James <James.Zhu@amd.com>; amd-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Subject: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is
>> disabled
>>
>> From: Michel Dänzer <mdaenzer@redhat.com>
>>
>> schedule_delayed_work does not push back the work if it was already
>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>> was disabled and re-enabled again during those 100 ms.
>>
>> This resulted in frame drops / stutter with the upcoming mutter 41
>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>> disabling it again (for getting the GPU clock counter).
>>
>> To fix this, call cancel_delayed_work_sync when the disable count
>> transitions from 0 to 1, and only schedule the delayed work on the
>> reverse transition, not if the disable count was already 0. This makes
>> sure the delayed work doesn't run at unexpected times, and allows it to
>> be lock-free.
>>
>> v2:
>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>    mod_delayed_work.
>> v3:
>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++++------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 22 +++++++++++++++++-
>> ----
>>   2 files changed, 22 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index f3fd5ec710b6..f944ed858f3e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2777,12 +2777,11 @@ static void
>> amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>   	struct amdgpu_device *adev =
>>   		container_of(work, struct amdgpu_device,
>> gfx.gfx_off_delay_work.work);
>>
>> -	mutex_lock(&adev->gfx.gfx_off_mutex);
>> -	if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>> -		if (!amdgpu_dpm_set_powergating_by_smu(adev,
>> AMD_IP_BLOCK_TYPE_GFX, true))
>> -			adev->gfx.gfx_off_state = true;
>> -	}
>> -	mutex_unlock(&adev->gfx.gfx_off_mutex);
>> +	WARN_ON_ONCE(adev->gfx.gfx_off_state);
>> +	WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>> +
>> +	if (!amdgpu_dpm_set_powergating_by_smu(adev,
>> AMD_IP_BLOCK_TYPE_GFX, true))
>> +		adev->gfx.gfx_off_state = true;
>>   }
>>
>>   /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> index a0be0772c8b3..ca91aafcb32b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> @@ -563,15 +563,26 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device
>> *adev, bool enable)
>>
>>   	mutex_lock(&adev->gfx.gfx_off_mutex);
>>
>> -	if (!enable)
>> -		adev->gfx.gfx_off_req_count++;
>> -	else if (adev->gfx.gfx_off_req_count > 0)
>> +	if (enable) {
>> +		/* If the count is already 0, it means there's an imbalance bug
>> somewhere.
>> +		 * Note that the bug may be in a different caller than the one
>> which triggers the
>> +		 * WARN_ON_ONCE.
>> +		 */
>> +		if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>> +			goto unlock;
>> +
>>   		adev->gfx.gfx_off_req_count--;
>> +	} else {
>> +		adev->gfx.gfx_off_req_count++;
>> +	}
>>
>>   	if (enable && !adev->gfx.gfx_off_state && !adev-
>>> gfx.gfx_off_req_count) {
>>   		schedule_delayed_work(&adev->gfx.gfx_off_delay_work,
>> GFX_OFF_DELAY_ENABLE);
>> -	} else if (!enable && adev->gfx.gfx_off_state) {
>> -		if (!amdgpu_dpm_set_powergating_by_smu(adev,
>> AMD_IP_BLOCK_TYPE_GFX, false)) {
>> +	} else if (!enable && adev->gfx.gfx_off_req_count == 1) {
> [Quan, Evan] It seems here will leave a small time window for race condition. If amdgpu_device_delay_enable_gfx_off() happens to occur here, it will "WARN_ON_ONCE(adev->gfx.gfx_off_req_count);". How about something as below?
> @@ -573,13 +573,11 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>                          goto unlock;
> 
>                  adev->gfx.gfx_off_req_count--;
> -       } else {
> -               adev->gfx.gfx_off_req_count++;
>          }
> 
>          if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>                  schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
> -       } else if (!enable && adev->gfx.gfx_off_req_count == 1) {
> +       } else if (!enable && adev->gfx.gfx_off_req_count == 0) {
>                  cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
> 
>                  if (adev->gfx.gfx_off_state &&
> @@ -593,6 +591,9 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>                  }
>          }
> 
> +       if (!enable)
> +               adev->gfx.gfx_off_req_count++;
> +
>   unlock:
> 

Hi Evan,

It's not a race per se, it is just an undesirable condition of Enable 
Gfxoff immediately followed by a Disable GfxOff. The purpose of the WARN 
is to intimate the user about it.

There are other cases - for ex: if amdgpu_device_delay_enable_gfx_off() 
called amdgpu_dpm_set_powergating_by_smu() already at the same place you 
pointed out. In this case WARN doesn't get printed, but it's not an 
optimal situation either. Probably it makes sense to move the WARN_ON as 
the last line of amdgpu_device_delay_enable_gfx_off. Either way, I don't 
think it's a race condition.

Thanks,
Lijo


> BR
> Evan
>> +		cancel_delayed_work_sync(&adev-
>>> gfx.gfx_off_delay_work);
>> +
>> +		if (adev->gfx.gfx_off_state &&
>> +		    !amdgpu_dpm_set_powergating_by_smu(adev,
>> AMD_IP_BLOCK_TYPE_GFX, false)) {
>>   			adev->gfx.gfx_off_state = false;
>>
>>   			if (adev->gfx.funcs->init_spm_golden) {
>> @@ -581,6 +592,7 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device
>> *adev, bool enable)
>>   		}
>>   	}
>>
>> +unlock:
>>   	mutex_unlock(&adev->gfx.gfx_off_mutex);
>>   }
>>
>> --
>> 2.32.0
