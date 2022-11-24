Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2887E637DB2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 17:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F7C10E0F4;
	Thu, 24 Nov 2022 16:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E970D10E122;
 Thu, 24 Nov 2022 16:44:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uef90dxq155xy22BBAgmlYZHuHgtwqaBemt8S8lMu04S0lp7d5uERgNJYOyiwhXlI1of/fIlAoR4sqkMtbIhwhnl9HJePX/Q0tKo9aTzMN+/+aY4kH5ZnkP4zQYNBRoREpWUz+CYxdmcZFFNuLGYk5t5lTFvz+f9KnBtaAqmZ/VaUtzTbZU8lk+wgKnUHkCqh0lodUlTk+xj3b4QXwx2bMoVQrqHrqa7a79/fy9uuW0ghdY7pFIOXFj8owXL2T2yUT37kPh2g0Q19dBbhWN80U2rw2verimfV76ZIlVFMVgYBl1PmqoHe8hQfjFShcWnCIBYB2oAAqW0+ZJrrcsHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pTwa5t+P3zEoo+1hvjDJdNbOAbH08TY3eaXJS7qQSs=;
 b=KphQJwAJ2U5xMR8nLll5jOC/lp+9lIUxY7SYitPRPOzdgp/VScEmXanlPZzeZ7acl0P4BK2r83dSRqoHoWW8+dDPQAuldeqU5wGSEUlewzaYoyz56EydKTfR2oOdzB2504G+q9KFkYpcfcJLA8HX1bbKRoCXzDWJy6eYPMogqYgMhlBRY3gik9+NPgD2hv4is4ZN1YkzHx+NmUZoBT6pQQ4BHrDyijSPBMOzo5iIJ5reF/RJ30uMiybb1VCC9rJ9cxI5iPQx4CC8Mx/39l5m5f/tWcaUccA7lwF7KYq42fSu5CiFGdsM0MP5dKKDd1sNE27+aicQhst1J+CMe0uZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pTwa5t+P3zEoo+1hvjDJdNbOAbH08TY3eaXJS7qQSs=;
 b=GjB8lELppZQyDu2NaV2QXQeGw/MdZ7vkV1tO9jwrTWtf2sseBJwLMqJOpqqs+s4r3uv9g5Hf2UJBmZSQ0crv23y2M9ukNBLquXpEayBSWopFf0JX1oV00j3kr7iTOI+NgoVPkYceXIxUWaRNU0uRnZKo7GgWz8NrPvrWHcav3PI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19; Thu, 24 Nov 2022 16:44:08 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 16:44:08 +0000
Message-ID: <d0d0f207-fb3b-fb23-454f-0c3080f6974c@amd.com>
Date: Thu, 24 Nov 2022 11:44:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] drm/amdgpu: Fix potential double free and null pointer
 dereference
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
To: Liang He <windhl@126.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, sumit.semwal@linaro.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221122042849.1097369-1-windhl@126.com>
 <549f659b-4121-d14d-fe84-352a0b5096f3@amd.com>
In-Reply-To: <549f659b-4121-d14d-fe84-352a0b5096f3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a17a482-1d6a-4b5d-d72b-08dace3b1b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dmojsf8wh/UNw8LhQB+UTNSTCVF5BSCFgYMXCigea4cAQ3tZOvROOs549qA8aD0tCNrtnoUjfI+BMGvieDFIT2wNmQqis/fmuyrfn0Ws6dBADvl7JGRqXU8mhxGQoEYQXf2lECz9BLFgjzLZLkX00R5gZv0EIZYNY2tLrBfiYf7AhDW7q4Vz6bVWW5hG6MzJCaLcTMJeWg9zvTGRSlmsMYnLv7hEyLg0tUHZhdBHhkhOb05gSy4EPo13G5zGJHIZPgDmv/HRNyMQDs8jw6rgYSwOTe7KuPasMF9MtrvIKoSRYgcrIcMa58fyi9w+Un0SHOPFqdReCU310j/VDkhsaCp+9H+AgxrAN/2/hE5jB5CL2CFQng3HW/500A//vHzC1sDK+PIrHu3dHt4kFkHVjJPLIFuDIO9lxePJ2/emiC3gX7b4tTU2oamlI2b5VWoeSAYPPhuYXhiWHQdLBSCOsjpI9cFMEm+aFwb8tfw462kd901I+TlfmuN6lcpulQhee6GijysK3rsBPsONbhYSr01RoRR5jNSkrKGBw+u6/KqCIEe8x/xYn9dDlFFJZk/bOlYYX88uCWW9d3HVr/ffxZWIzLr+uTypb0nDw6JT/ETx+ZMPpqif2gheRSUcaLjvQ2hsXOIKMdr79N9G74dVbvIqpO37f+WM9pfsjtd7sgmVzXA0VA43qaLbJYyzX6St4+iVjPwgqh+7TJBYDQNT3L46vrLQGfGc9LPRGsz785zZJ1B/WAJqfMHaRRRmuMnd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199015)(44832011)(5660300002)(2906002)(4001150100001)(31686004)(83380400001)(66946007)(36756003)(66476007)(8676002)(66556008)(86362001)(31696002)(316002)(8936002)(41300700001)(6486002)(478600001)(6506007)(26005)(6512007)(53546011)(2616005)(186003)(38100700002)(525324003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWZlazcrc3U1OEFOSFh6aE9pZHV1cFJ1dUZnUlBSQkdzTkRoMDMyNzZpQ2ty?=
 =?utf-8?B?SURic1hobHhvUTdvbWdyM29vK1FsOERDYmtqMkdtUlZTS1NqYlhhTE5qbWll?=
 =?utf-8?B?UDNIUkR1QURpbi9uY2N2cTRkbmtqOW8xV3h1S0JZVGRzV0hpNXZ6YS9OZTR3?=
 =?utf-8?B?aXVMMTBiWk1KcFI0T2o3cldyVWJBak1SZEJUWUxwZ2NkTytjaEFYU3FGVlN3?=
 =?utf-8?B?VitSckFPNWJrUExPc2VzTENLVlcySDV0WDZjWUNFUXpXblh5RmpaOWdwZFFV?=
 =?utf-8?B?RnIyZVN4YmVpbnBYUWxwdmR6NWFNOTg2QWlJSmM0RnpuVmd2TS9Db1orbHhn?=
 =?utf-8?B?L05BWXFrcEFUbmxwWXMyM3FLemJHMWNNaUtqTXRTQWZBSlZ6aEQyNVgyN3Nx?=
 =?utf-8?B?MkdSNVhLYmVNZGlMUlFiL1JnTGp0T2FZdzBJVVNLakxoaWFiRXJzYmRLb0M5?=
 =?utf-8?B?RmFMeTlnd25oYlJzR2hxWmF6c0JtbTlQeGdzOW1IczF6Z29VeTdvLzgzSWdG?=
 =?utf-8?B?UmNsa2VEL0pQRG54NWMweHZLS1dOVmljaDZTR3J4MllHOTR4TVZmamtvYzZR?=
 =?utf-8?B?VzVrVzhuR1NtdGhPemhLYzFOQ0lKWENUcEVYemtnMER2NGpCY0VxNlF5RlhO?=
 =?utf-8?B?amk5TkxFM00zRTNUMkZjbjdCVmVSbWF5NjJPa25vV3hTVGxIMDZlSlBCSzlK?=
 =?utf-8?B?TFdVdkZmRkE5SEZ1cDAxMXJnOUk4UHJkbitUU1l5ck04VWFZTERpekE1bXNK?=
 =?utf-8?B?eUcvUkVFdXA1bnoyb0xqcE05ODRhcnMvNUxBU1RlYy9CNDIySWxCcHRDUjdC?=
 =?utf-8?B?M1JYUzl5dkxscGZXdVZva3A2MmJIamMxeUV5Vjk4Tmw1WHZsTkhUN0phZTZ0?=
 =?utf-8?B?RDZadjBObXpMamxXTU1wdFdVWEIzaGt4UzBYd3NqSTY0Y01VeU1UanRPa0Ju?=
 =?utf-8?B?YUl5TU1wMUNzUWNmYnF4VVBKTldSV29XaVlvNXVMbWcrS09uUk4rTkZYNmdZ?=
 =?utf-8?B?QUhuRVBtSDNmYzVvQ25ZY3lNUVhibWt3Y3IvWDI0U01aSjNzWXhNNUN2djYz?=
 =?utf-8?B?c0RDN1A5QWtnTmJ2bDM2VnN0QUxpYXdvL25pR01VSzdFMUhpRllEbGt1ZVkw?=
 =?utf-8?B?QytKRWtTMWhVaUZEaCtJeGR4aXFqOWZsWGlmeHlYN3E5ZCtYTkcwbUxUczZm?=
 =?utf-8?B?OXRTYXdCRVpmamlMUXV5YUZBMWJSZGZyakZrMEF4Y283SzI3eUdTdjR6NnVl?=
 =?utf-8?B?Sy9GRjN5dUlDT2t1cWoxdlM5Vmo2SjcxR1lNRHBlSkxmODFWVU1MZkx1YjlK?=
 =?utf-8?B?ajQ0TjhwYXJnN0llVW1wK2wvSkFydHRQL0kwek1KdHRtY1NSSlFVbU5BS1Bu?=
 =?utf-8?B?Z0puWHZ5ekU5SEdaR2JRVDA3R0ZRWlhDbisvd3dJNFZBYys2SzNVZlkrTGtC?=
 =?utf-8?B?TnVSdmUvYStNK2tPT2t5VTVjcnltK2pQQktucmVlV1hOZFNONWNKTjFzQWJ5?=
 =?utf-8?B?NlN6SnBpR25HZnZaU1VKbnV2WGFYWlNoalhiMEdqVXdVOFEzYWxHb2JQYjBl?=
 =?utf-8?B?VmR2UW4xODBMR2F1YXBMVlkzU0Zjbm02Nm4xYzU1WTZnMDVESCtjaVF4eVho?=
 =?utf-8?B?UmhCdEhObTc4Z1NyTzdDMml1TjB5SDVvNVJrelRQa3VMLzd3M3gyZ3Z0M1Nz?=
 =?utf-8?B?Q1FJQjNGRGU0QlYyajdYbTdCNk1kSisyUDVGTi9EQUpoT2o5aUpwMXd5NmhI?=
 =?utf-8?B?eHNjb2VRSWhaeUdwQ3AxT0tuaWd6OE1VYk5ucjlWTFhuSUR1MkJ5RWtkczNL?=
 =?utf-8?B?eHVrdDBHanl3dG1FZ1o1dkkvajAzT3pUYU82OGhhTU8xaVI0Sk9td29tTVdp?=
 =?utf-8?B?dTVQZHZpbktTNzhBL3lBWExnblgxbVVYMDU0UzlENXBQMDdWYkt3Z045NFk5?=
 =?utf-8?B?MVhaTHIxUkhvTTJFczZKUHoybmFldVlvKzlxcW02MVdVZ0xjbnZnTjZxU1U1?=
 =?utf-8?B?aXZHTGNQMS8vNThuVUFQRDdDZVhobURhUDlhcGt1VEVlY1VIMiszcnZ0MXJP?=
 =?utf-8?B?WW5sSy9nclZza3pYekQ4QWVIWmxoaGM2K3p2WlA5bTJGUXUwaERoL3lwN0NB?=
 =?utf-8?Q?pfEama/K1OftG/CQBOBIfcnQ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a17a482-1d6a-4b5d-d72b-08dace3b1b67
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 16:44:08.6560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQic4yIWUfLbhhwY+2MXlghK4w26jMTNDAjCJNNMvMgFj7ta6eUhmjBbafcLeujA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580
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

Applied.

Regards,
Luben

On 2022-11-22 19:10, Luben Tuikov wrote:
> amdgpu_xgmi_hive_type does provide a release method which frees the allocated "hive",
> so we don't need a kfree() after a kobject_put().
> 
> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
> 
> Regards,
> Luben
> 
> On 2022-11-21 23:28, Liang He wrote:
>> In amdgpu_get_xgmi_hive(), we should not call kfree() after
>> kobject_put() as the PUT will call kfree().
>>
>> In amdgpu_device_ip_init(), we need to check the returned *hive*
>> which can be NULL before we dereference it.
>>
>> Signed-off-by: Liang He <windhl@126.com>
>> ---
>>  v1->v2: we need the extra GET to keep *hive* alive, it is
>>  my fault to remove the GET in v1.
>>
>>
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 +++++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 2 --
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index f1e9663b4051..00976e15b698 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2462,6 +2462,11 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>>  			if (!amdgpu_sriov_vf(adev)) {
>>  				struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev);
>>  
>> +				if (WARN_ON(!hive)) {
>> +					r = -ENOENT;
>> +					goto init_failed;
>> +				}
>> +
>>  				if (!hive->reset_domain ||
>>  				    !amdgpu_reset_get_reset_domain(hive->reset_domain)) {
>>  					r = -ENOENT;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> index 47159e9a0884..4b9e7b050ccd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>> @@ -386,7 +386,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>>  	if (ret) {
>>  		dev_err(adev->dev, "XGMI: failed initializing kobject for xgmi hive\n");
>>  		kobject_put(&hive->kobj);
>> -		kfree(hive);
>>  		hive = NULL;
>>  		goto pro_end;
>>  	}
>> @@ -410,7 +409,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>>  				dev_err(adev->dev, "XGMI: failed initializing reset domain for xgmi hive\n");
>>  				ret = -ENOMEM;
>>  				kobject_put(&hive->kobj);
>> -				kfree(hive);
>>  				hive = NULL;
>>  				goto pro_end;
>>  			}
> 

