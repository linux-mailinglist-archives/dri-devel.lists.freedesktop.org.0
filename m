Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5E3F6DB3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 05:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1022E6E104;
	Wed, 25 Aug 2021 03:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528246E104;
 Wed, 25 Aug 2021 03:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmTqTfgFH3ev55l8vevYDqNMEgPuf6OWZaNum4xEzzLj4PfXq/5stVYIOAdaEscP7mFUIe4VR8dn5ZEc/8MkVwGtj/k6B6kFJ25FsG3a07VsA451/uW00YlfavvLgHpuBanm70kkbtk9GhzPw4RE9fIGUWgb+NdDlP3Jo2KK4pWlYv1mKYUQfhnzjJhZ3HGf6EFM9kgAXLkrTVbOQ+m/w5gw3RQKE8YWpKQpn2d7OoKKZ/s8SHTb7SbSvd6x6UH5IhvewimxcqXl62VCOTaBUTHXPS9GHXq2PS3+Qlif23HkMDIo5Oxq7glvX1DT29P+WrGbrJfb2QTcE+xpvPKWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0j3cWIIkNSfGwdTnywoxISDIcRMZPTewF2Yw/D3ET4=;
 b=h3zyzM1UVV5jYhtUJiTtORLKOz2mSy2enu7HuIRK/lxrL4rQc2A78wczLWhDoH7apUeK19FNBRQ+MmvPgKzgj4QlPVXlMY9rnoAXfWfF4tve2PhSYkOSx9Qmsp7AP/dZRmZTV6XUP3p23qddjS2YjSVAL7d1tfyJlOKcPTyrypiFIcA0unVA8HTwwwCvNTyuVyUrDU3Z0ejZSeAd50eBpk7NxSruU1+14aG1tXuea+lewj414rNuTjO+d/uoP4i4GViqGKgfCl+/bUBGPWHTy18WIxl5s+iLWkGmkg37oJGCdXxNMIJCtJchiU+remhYmjxz874CFvIu4YJWI0WPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0j3cWIIkNSfGwdTnywoxISDIcRMZPTewF2Yw/D3ET4=;
 b=LE+cYdqtbY0TBbrc1dlfBJfuFrsf/zVlQi3rvMbY4JMicxA6w7CDtG8Zf9cSTypaQJLQzqv5ASpFHO4qjpRNw3OGnPy3hKxLY2yqhn7DZo+tHnSmNMWGN0jnYB7aDu2436If+OJ1+RWZnem66gYdN2eHMZLL4TL0a233+U/e7r0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4591.namprd12.prod.outlook.com (2603:10b6:806:9d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 03:20:13 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 03:20:13 +0000
Subject: Re: [PATCH 1/4] drm/amdgpu: Move flush VCE idle_work during HW fini
To: "Quan, Evan" <Evan.Quan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
 <20210824210120.49812-2-andrey.grodzovsky@amd.com>
 <DM6PR12MB26194A97EA61197582FF4742E4C69@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <f7a27b4b-6388-0b3a-bc01-30772b9dfe15@amd.com>
Date: Tue, 24 Aug 2021 23:20:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <DM6PR12MB26194A97EA61197582FF4742E4C69@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::29) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:47f:f42a:1ec9:aa6a]
 (2607:fea8:3edf:49b0:47f:f42a:1ec9:aa6a) by
 YT3PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 03:20:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c36012bc-7c3a-49ab-1d7b-08d9677740a0
X-MS-TrafficTypeDiagnostic: SA0PR12MB4591:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4591CFE8F8DEB69BEB461A09EAC69@SA0PR12MB4591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PR4oBBQHYioH2oex/+xnCBTY94a+dhIoe5KI3hVT71DhGtS6M6ae9+QOsyWFGXUA+nr/CZ/BguqNWt3WEdznvzhHo4S/6qtxV2GsN95MxIcI+FqcDcVA+VmxawoiP0ZAdiSxQcqm2k0rtRQip2mSeSBUk1BOuKZO0K38vzCOo2s0sXigUWlqnUZz6TqC2VnQCAkBTco4xIYPcSYOjHi9hw97mXo8fTqaRrMwgeICIWh6SyE0cWDBqyr224c52j+2V7Y/RCWgD++Nr2tf/6V+27hfmELA3uwAkbZezX4AIYBbUOeTVWKo0P9qa52dgxxauT8aQe25aHDOG+/cKXtO9CBA8zzgwcDNih4Ov9k5iyEQorIUof8E14RqdXhWhT2c6iDKQrREMGU+8gwB7nTyWdrc0eC+hggKqQN6Y1gM+A/QOIRmz6DvwtI5GDoS92rmIhxyaI7NLvJ0in99Q+dzRdlKV4JC0/G0g7bRFgCgWvJIa6JV05YaE8y2YPTkJBGxYyxv6a2iUJKAVtJ5/wc28IGxjpKfxzNOnnPPTEmmURKlvGxlKKY82t1Lj/auaUYGXQYYowXp1x7jZ/4mD5kzMQBmEjASD7m94QhcFFbUV1OZlENMS0Q29Y8j1iGz8Dqxj13ZhJEbXf1wvHDCmofUjP7SOAS7DLjano9YQuKGLS5C8w4SjedTt2h0c9Efkl/FZ/wiFwIYSCdud2RAoBm7fd6Le5i7DQ2h9GZynIM+xOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(66476007)(8936002)(66946007)(66556008)(44832011)(316002)(4326008)(2906002)(53546011)(86362001)(110136005)(8676002)(5660300002)(478600001)(6486002)(36756003)(186003)(31696002)(966005)(38100700002)(31686004)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z013SzFBRXhHcmk2a2JSNjdQeUpQUEp1aGFWVnpET0ZVa0p2b2hwMllTOTVp?=
 =?utf-8?B?SXpzYXZSRUNhdkk2K3VGeWg3cW1iVVJzSXY4M2VJdDNRM0NHSkdMd1h3UkJ5?=
 =?utf-8?B?MjRnYm1WU005TTFSbWIwMzJFbUNWd0FBdTBQUzZ0TGxrMlRDajJLOEo5cjdI?=
 =?utf-8?B?YVc0dys1aVBLT2w1eURiTzRVNExYN0krM1pzMXZWK3g4YWpDTVpTWW9qaDhL?=
 =?utf-8?B?dFNTak52dnY0SzJmbDNiY25BZWZ6emVkTUNmOW1lcUliTjZ6aXQ5bklIR0FO?=
 =?utf-8?B?NFljZmx2K28wd203MDRFRVhmZUpCbTNVc01hd2hyWTA0RG9FWUdCYmxXOGU4?=
 =?utf-8?B?UEJBRXZvNHpQRVliT1BRcDF3R0lvbFhEUDk5Wmt0dXhWTi93ZHRKQk9CZG1q?=
 =?utf-8?B?NkNmb3dqSUtKU0lCZlRXUkYzZnh0VjdzVDJmVXhhYXIyVkZjaFc5OGFUajZX?=
 =?utf-8?B?R3JHMmQ2VjVxVlZPQ0dlYkRGVWlzUnJ4NDR0MmdMQ04weHhCYWZuL1QreGpL?=
 =?utf-8?B?cjEwUkNYdXZybkhCcGdDcFA3NzloQWQza01IUG5vVjBRZzNaVDJJL2UwZ1hm?=
 =?utf-8?B?MUNQZzNLdGs2L0QvbzhCcUtRWWEzZzVWYlozUjVhUEprR3dWc0F1QmhDalVk?=
 =?utf-8?B?VGdBV0VZZGNZSXV6aHEyVjltZmpxamFWWk5rQlJZdWM5a2J2S0VxMDVXY3Y0?=
 =?utf-8?B?M0syT29QU1NWVHRLdlZJNlZtN0xkRDFJK1laV3IyRW9OMkk4NGt6K0dYeXJy?=
 =?utf-8?B?SGl1S0ZLN3kydkNoQWplblR1eDNMNXZWc2xaRnRyTktSTnYyLzBKdzJTSGF1?=
 =?utf-8?B?ZVBmZnJCbEk0elpZc2ZJN1M2a0pQd0FUd0dVZGIvbHFNaWtTNUFzR0RPMHl3?=
 =?utf-8?B?aGZiNFJNRmM2elNZTXpLR09qUWY3bDczbjVFQ1ovRkZGdjlqVzN5M2hLUm9j?=
 =?utf-8?B?L2hoMWhiQllLTUl3amkrNFk4TGVsOHNXS0FMZCtNdk5tREE2Um1rblpmeUsy?=
 =?utf-8?B?K3pzMzNNaHh2YWVWdG9VRTlqbDJKbzA1bHErQ040dGRjSUhERVp3TTdONTJR?=
 =?utf-8?B?ZHNPNmFkSUhpRWd3eHRCQno5elZPREJ3V2FoeWsxZVBWLzMrYkNOUnl4a09u?=
 =?utf-8?B?aWwwdzQ0ekhNNmlBM1NVa1JjYUJ0US9UeFVxWGFwbVVsM3FULzh3eWVYQWda?=
 =?utf-8?B?VVVGVW1PVlJVelRqOGthM1d5eSs4Wi9EdGtOeVJKSUNUQnhDVDlxSUczbXBZ?=
 =?utf-8?B?TTdwUE10Sjc2eXgxdWZ5VlkrY015NTUxaVRaa21VVlRud1hwbzNteWZqNjJp?=
 =?utf-8?B?aVNrenZtY2E0c2UzV212bXFGeVR0SFhWbHhoNHNzRmtLMjN0WjZHbmhPYmlu?=
 =?utf-8?B?Y2NybmpabEwxWExVRXFzSktjeEVZMkhtWmRiVU1xaCtVeUhGUUhvbXFJZS91?=
 =?utf-8?B?RkxXWVcvSWI2SDQxcTJZK2lVNlVNblBBS0VhOG9QcVNBYW42NWxMaFl0MFV4?=
 =?utf-8?B?Vnc5cTlIM205ak91YktmU3ZMdlJIMklueHc3NTZMZ0k2RXFncFAzZFl5WDVZ?=
 =?utf-8?B?dDhBeks3NE5BYXE3TGtac2hGT085emJ6U1hvWURyeW9ScWNWeG9oZG1xTmh3?=
 =?utf-8?B?SktSQkFKVC9tMTJIU2hURWhRelFCeFpVWEtpWVZHK2RhQ0oyV0Q1cGs5UnZt?=
 =?utf-8?B?NklwYlJCZ3EyWVY2azg0WXltaTlpczBDS21IV2NlQkp2aGxoQWFwa3NlQ3Fy?=
 =?utf-8?B?R1pveWRYaWJ5RnpadlkySmpteGhLMGg3KzIxYUtuRUVpVm9vMGdLNzNwZHlM?=
 =?utf-8?B?dW9rQVB3L1U4ZGQ3QmFUemROSkVXUEg2cmxneGhjWUhtR0JKVE96dWVPZGdl?=
 =?utf-8?Q?prexCldtI77gc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36012bc-7c3a-49ab-1d7b-08d9677740a0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:20:13.4199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qbMuaPVT/ACvfXjCGc1SDbh9+ldWj7DgL7C3KFMvZXtDaz+Qvzl83x03t1WlY05lsxocPIaAX14oo0ItkpDMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4591
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

Right, they will cover my use case, when are they landing ? I rebased 
today and haven't seen them.

Andrey

On 2021-08-24 9:41 p.m., Quan, Evan wrote:
> [AMD Official Use Only]
>
> Hi Andrey,
>
> I sent out a similar patch set to address S3 issue. And I believe it should be able to address the issue here too.
> https://lists.freedesktop.org/archives/amd-gfx/2021-August/067972.html
> https://lists.freedesktop.org/archives/amd-gfx/2021-August/067967.html
>
> BR
> Evan
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Andrey Grodzovsky
>> Sent: Wednesday, August 25, 2021 5:01 AM
>> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>> Cc: ckoenig.leichtzumerken@gmail.com; Grodzovsky, Andrey
>> <Andrey.Grodzovsky@amd.com>
>> Subject: [PATCH 1/4] drm/amdgpu: Move flush VCE idle_work during HW fini
>>
>> Attepmts to powergate after device is removed lead to crash.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 1 -
>>   drivers/gpu/drm/amd/amdgpu/vce_v2_0.c   | 4 ++++
>>   drivers/gpu/drm/amd/amdgpu/vce_v3_0.c   | 5 ++++-
>>   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c   | 2 ++
>>   4 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> index 1ae7f824adc7..8e8dee9fac9f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
>> @@ -218,7 +218,6 @@ int amdgpu_vce_sw_fini(struct amdgpu_device
>> *adev)
>>   	if (adev->vce.vcpu_bo == NULL)
>>   		return 0;
>>
>> -	cancel_delayed_work_sync(&adev->vce.idle_work);
>>   	drm_sched_entity_destroy(&adev->vce.entity);
>>
>>   	amdgpu_bo_free_kernel(&adev->vce.vcpu_bo, &adev-
>>> vce.gpu_addr,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> index c7d28c169be5..716dfdd020b4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> @@ -477,6 +477,10 @@ static int vce_v2_0_hw_init(void *handle)
>>
>>   static int vce_v2_0_hw_fini(void *handle)
>>   {
>> +	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +
>> +	cancel_delayed_work_sync(&adev->vce.idle_work);
>> +
>>   	return 0;
>>   }
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> index 3b82fb289ef6..49581c6e0cea 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> @@ -495,7 +495,10 @@ static int vce_v3_0_hw_fini(void *handle)
>>   		return r;
>>
>>   	vce_v3_0_stop(adev);
>> -	return vce_v3_0_set_clockgating_state(adev,
>> AMD_CG_STATE_GATE);
>> +	r =  vce_v3_0_set_clockgating_state(adev, AMD_CG_STATE_GATE);
>> +	cancel_delayed_work_sync(&adev->vce.idle_work);
>> +
>> +	return r;
>>   }
>>
>>   static int vce_v3_0_suspend(void *handle)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> index 90910d19db12..3297405fd32d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> @@ -550,6 +550,8 @@ static int vce_v4_0_hw_fini(void *handle)
>>   		DRM_DEBUG("For SRIOV client, shouldn't do anything.\n");
>>   	}
>>
>> +	cancel_delayed_work_sync(&adev->vce.idle_work);
>> +
>>   	return 0;
>>   }
>>
>> --
>> 2.25.1
