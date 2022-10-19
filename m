Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DA6038B2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 05:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6893A10EA58;
	Wed, 19 Oct 2022 03:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E083C10EA22;
 Wed, 19 Oct 2022 03:45:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mx78xsEVgkuJPEaEVnM4SFbETQpv51o3XdIWUaAUziS2WpeBDx8thKIcs91MDeZerv7ZKs+jw+T4rmQr6gMOGsGB9Ui3e7XJlEowhnDaOUUUPjUjjtgG/fWC6NZNkX+PRs1+2ssgjZJByPTh2OP8TvBmTF/Z0wW+w9KSfO7rG14KjTZhFJ8TYP0G4JjnB505WeUfIFBLXcRgGue/JE0mXp6lBDMgzO9s0q1ihXjvQwSXo1iNL67L4DIB+niDA3Uyyp0hew9sh0SOXnXsjrS9umfhnRkJ8Fd0PiNd1ENKy7CfgwJmwLIL+in0MvP5Tm4NO8vDu9LbqhEKH3paFExY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWlpAbuO8s7F3FasW3bncPQvgesTQa7aODjIhgLl69o=;
 b=XomMvdLKXCo/VGGdWmotWHf8GSbhNgCRI1/Rs0BXHdtbuyJM6KSlnBMU9w0pjufanYTNsi/nLTr3PY5mihE88qR+YvbcS8iglBjVEKfJQ3BGChSpQzJIn0otuv6NHt8vhxUu9wI7bek5InFrFlEZ8LtxKPdDh7CYaHbzpNLDdE2XXo2MOSPO7nhYwsh8SZUgl1ieHuFLn+RSyF1KODoUOmF43iarxav+/VnVWNVww+3dQBc6u0V2nxyr9mqOLOm5bhxi6pwjQwF3AB2DpVgfuoCz3/lbkqrFHX/dOnn+5sLXSSyKaxkRWqznm6fpnajXgct8K0+2WPZuyv2sBw3AxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWlpAbuO8s7F3FasW3bncPQvgesTQa7aODjIhgLl69o=;
 b=O3b6nz8T1G5SK5EMpNYR8WbwTtZfWO9Pr8DKmNd5/BXZFC9fr0KT0RbrsThgJQx6ebQCoehrmy/ksKM1ObicVs/wwZ6SVvQMJL799WJzkbPGUmgJ//g+amM32uJpsvAH+1oO7+NM5J5gwD7n8QmLLgEeJejeDUdnCKQdy8NIRJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA1PR12MB7317.namprd12.prod.outlook.com (2603:10b6:806:2ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 03:45:07 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 03:45:07 +0000
Message-ID: <c7fda4bd-230b-5e23-2fa4-704ae917e0cf@amd.com>
Date: Tue, 18 Oct 2022 23:45:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/amdgpu/discovery: fix possible memory leak
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
To: Yang Yingliang <yangyingliang@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221018080557.765786-1-yangyingliang@huawei.com>
 <a14b4921-2cc2-3812-5514-e6573388451c@amd.com>
In-Reply-To: <a14b4921-2cc2-3812-5514-e6573388451c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA1PR12MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 86afaff0-b232-465f-f5c0-08dab18450d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a3+o9JJHHKfhhVW8Zwogww3r1LvHRa3JPG/knuX35Evtd9BSJ4aby15RhSlilr/Hc9hoRpPFzFC+dURUoopcmIGnkGzkW/jIO9PhrrQpBdQYlR4xBuHIDxSuRtfTMW3M+RBicZ8Y0wSi6ouHp0E6YpVR72zXG7ZUaFEzP+tJ+B7gGE6Hrw2RYI1ijeil8HAAW2gDz9EKEyHEShoTErSvV78e7SUcyqLiZJNRGIH9Za2nstmO7XRvONemqnl0ZypW+CvGI9hLOuYtzD+sQVB2aalqPr/zGwr7TRzxFC5bxqPMdTFiWhSsMaLBkUgqAQLg3VPlDrXjajMDO5TdGsLeHBHINPjNIiVHOrh9EYxBBStE5UX9JDpwGUAyZfCeTw+ktghoajXhjTDT0J71IXuqx58NioK00KNNZ5OMt2h0w0ToHgrhZ5u7L7hvhb1fuhyk/J1TWgo4kwbXXhUWZ/y7LkL200JSwjV/p9a5ohrils6hut98lCcDbeE5U+/NMhzQLWKAioHek5ZVTHbu+GwcQCdRl8lBWk8zBNKH0DzE1jFSe9H226soaYI5ru18ljaVLIVhIulLL5MxP0NB4bc/KEo8L6pKcO6DWf6ryB612x9SCZOBqXLcyb2FSGuamFQaJjmFK33GpT00D/vnPDZAl995bq0W7fgcMgeIF+avVM0GzD0kyXG9VsVkxU7Nz+xLdImG9Ai5cvhhWF3fQxuHLohECYLweQXnagmlbZiFN2NhdQHdg6aVfNaDrldwYhv9SM5BOm6qcCIdjUkkSDjO4gTVaxwzO+d6//6foWt/dNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(4326008)(31696002)(8676002)(6666004)(53546011)(66476007)(66556008)(36756003)(6506007)(41300700001)(5660300002)(26005)(316002)(6512007)(86362001)(8936002)(83380400001)(2906002)(4001150100001)(31686004)(186003)(38100700002)(66946007)(2616005)(6486002)(44832011)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXNtK2xrcWNvNERCa2tsM20yeUp6N3ZYa3cxNnFtTS9DdDB0SERGOGlOOGp3?=
 =?utf-8?B?WU1UOWl0eExIcVVHVXpudTVoWkU1SkZIL2VhYUtVc1RkM3djSDhIcVZJc0xG?=
 =?utf-8?B?ZmZUWnZTTlpGVUVUejYrMkYwMXQ0aW1vbllRZ2s5YVpaODFoQW9BcmZieG0r?=
 =?utf-8?B?MWcrMjhTR3BCTTFJWE5wKytYeUo3ZkR5dE9DRERaZ0Q1cjZ6TjFMVTZvdURB?=
 =?utf-8?B?M0VMdWhQamQrRDdRMlZNQ09iUk9NRFNiMk5XTGpscjNJYjhQbkpMQWZaYnVU?=
 =?utf-8?B?TjhJamdaVng5cCtNMjk4QkNPNTA5TGhyTlRRd3JHeVllMEhjMGpnNFkwQXlG?=
 =?utf-8?B?dnY4NU1FNVN5MnBrejhXOHVSVENQRnpXUU5IaTR3ZU80c0g2YTh2enlkTHVs?=
 =?utf-8?B?dDhydFNrOVN4V1JyaUthbFpRbEFSOE5nYmQ5TUIvUkpuR2xEYVdIVFo2bXhi?=
 =?utf-8?B?MDhUWjN5bExlQjZSbW9TZEJ3ZEpGZjEyb2orUks3ZXVWNmdFNFA1UUZMQWxz?=
 =?utf-8?B?Q2ZaTHFNMy9IMHdtSkNyZjFIaUZlK3B0UjB0NDJBV2lrdDcwQjRidm1CdHRH?=
 =?utf-8?B?cTd3OUtFTCtGbXdHZ3krSkN1ODY1SFV1NVdiVXErTEdpWXFOYXRwL0REbXdE?=
 =?utf-8?B?NkxJem5qRFFzcUdYUDQ3ME56elR2VkR6bjlZVDZoZzRoTjdySWRtak01T3Mw?=
 =?utf-8?B?WVltcDFtbitGSjk5TVFHZmt0MGlUK05NVXE5bWVvSVRaMnhncGRJNjUraERn?=
 =?utf-8?B?ZmJzUnY3b1d3UDFWUFM5bFdSZms0U244clNiWGVxdHhHOG5Oazl2eTRxaHAv?=
 =?utf-8?B?WEM4MktSNEF0cWJQeHA3WENKVUxEd0FXWGJaT2VJanhMaEMwMkpTWThLTGFj?=
 =?utf-8?B?UGt1dnJucStROSsxY1RpbkVENDZJMk5DelQ5T212eDlFY296QUtUR2VHLzBJ?=
 =?utf-8?B?eXgweXBwaDZ1Q011T2hwVG5ZMnNEWUFKVXlZKzZZM05lSk56c3FlK2U1ZzVa?=
 =?utf-8?B?czVWQkVRdGJKdHJGd20wL2pHNDd4N3YzWE1uR1FWc00wcjZWa3Q4eXZDRTlk?=
 =?utf-8?B?L0RUTHRzMElOREJnUDJIUVRXZHR0YUc1ZFREZ25UajVSanAvOHZsUVNPS08w?=
 =?utf-8?B?bDg5b3Q3SjUyZjdPeVlzOHZuUFlRNnQyemtLQUtyalYzVHp6N3o5NlZ0amlU?=
 =?utf-8?B?MUlrS2t2eUQvZkZ2ek1TZndxL0tpdm80MWVGdnZzbFl3SCthVHkwdzZWdVdF?=
 =?utf-8?B?dzYybytCT2FweldZM05TOFBqSVJKSDUrdGJkaExwbXZIMGsrd2ZhKzQ2dWRo?=
 =?utf-8?B?R2dQNTAwVUhHa1U1bkdBdzNXRXBjK1R0NFI5YzdrOTBma1JBTzZ4RFZRNlJU?=
 =?utf-8?B?MzREQnUyOVFMQ3FBWit6ejcxNXMzZVo3UVd4SGU1T1FJWGdZNVNDYzFaQWhY?=
 =?utf-8?B?UWVrK1BaN04zZkNFTzRaRXlwbHlXUGtXT2gvY1pyeUIyTXovZjFselJHNXFy?=
 =?utf-8?B?bHFxYS8rZ3VXdkZmeTBxQW5KWk5UWnJnSDlMT0tRdk9BcEZHTExUQmZBK2gr?=
 =?utf-8?B?WG5LaEtSbmtvYzVSSll3a0p2N3RZNnM5MnB2bCt5THB5MkxpYWE0d2dEYW5T?=
 =?utf-8?B?dkMrUC9LVmV1cDllK3R5aHU4d3ZOOUVXNkoyVjdVV1NrU0MybHhjWXRHdk1V?=
 =?utf-8?B?V01COFJSWUhGZVNxUlRVdEJUZkxaNGV0S01mZENXYk5BaWNjalkrWlVUWG1u?=
 =?utf-8?B?ZTM2VC9lZjErNTNnMnlwNGdZcmZLS2VCM1c1aHZRa0pWSE95WENvWi9tdWV2?=
 =?utf-8?B?TDF6WjdTVVhiNitvWmRLbU9NOUZsZWlVcytPNXpGZTB5eW9CWWQyd1BzK0x0?=
 =?utf-8?B?Y0NjNDRya0RlL0JDRHBXd0NEc05vTzVMQnRNL2NBeXBUZHZ5M3JQK2JFYlF0?=
 =?utf-8?B?V3Nkbkp5aFBZVDQ0ZS8xSndpZ3lmcjRPMmRVNVlJTng4S2gxWnhJb3NiMU1W?=
 =?utf-8?B?VVpYa1NtazB1aGMzSkY2M3FSd0p2Sk1LbmdKY1AvQjd2L1ErWXlFVVN0R1B5?=
 =?utf-8?B?eklSMzZURTVwYkhqbk03Z3RBSDFqcFRodFZ3QXhHTmNRWFhIdk54RitQVFdT?=
 =?utf-8?Q?FPJd6R5FZubweF0fQz6nzB5eR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86afaff0-b232-465f-f5c0-08dab18450d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 03:45:07.7570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PMk1c/6YzVmYorWoYr5WaG5jSJl2opXfX3GPD/sbksbV5NNbtPF73I208Xpz0I0V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7317
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
Cc: alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-18 23:37, Luben Tuikov wrote:
> On 2022-10-18 04:05, Yang Yingliang wrote:
>> If kset_register() fails, the refcount of device is not 0, the name allocated
>> in dev_set_name() is leaked. Fix this by calling kset_put(), so that it will
>> be freed in callback function kobject_cleanup().
>>
> 
> Good catch, but looking at the code it seems that what is being
> leaked is the memory pointed to by kset.kobj.name which is allocated
> in kobject_set_name(&kset.kobj, ...), which is called right
> before the call to kset_register().
> 
> Modify the description with this explanation and repost the patch and I'll R-B it then.
> Something like:
> 
>> If kset_register() fails, the refcount of the device is not 0, and the name allocated
>> in kobject_set_name(&kset.kobj, ...) is leaked. Fix this by calling kset_put(),
>> so that kset.kobj.name is freed in the callback function kobject_cleanup().
> 
> Now, if there's a leak of dev_set_name(), then that would be something
> else/another patch.
> 
> The rest below looks good.
> 
> Since this patch touches only files under drm/amd/amdgpu/ and for a highly AMD-specific
> feature, you didn't need to spam the dri-dev ML--amdgfx ML should be plenty enough.

Also, don't forget to CC stable (by a tag in the commit description).

Regards,
Luben

> 
> Regards,
> Luben
> 
>> Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> index 3993e6134914..638edcf70227 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>> @@ -863,7 +863,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>>  				res = kset_register(&ip_hw_id->hw_id_kset);
>>  				if (res) {
>>  					DRM_ERROR("Couldn't register ip_hw_id kset");
>> -					kfree(ip_hw_id);
>> +					kset_put(&ip_hw_id->hw_id_kset);
>>  					return res;
>>  				}
>>  				if (hw_id_names[ii]) {
>> @@ -954,7 +954,7 @@ static int amdgpu_discovery_sysfs_recurse(struct amdgpu_device *adev)
>>  		res = kset_register(&ip_die_entry->ip_kset);
>>  		if (res) {
>>  			DRM_ERROR("Couldn't register ip_die_entry kset");
>> -			kfree(ip_die_entry);
>> +			kset_put(&ip_die_entry->ip_kset);
>>  			return res;
>>  		}
>>  
>> @@ -989,6 +989,7 @@ static int amdgpu_discovery_sysfs_init(struct amdgpu_device *adev)
>>  	res = kset_register(&adev->ip_top->die_kset);
>>  	if (res) {
>>  		DRM_ERROR("Couldn't register die_kset");
>> +		kset_put(&adev->ip_top->die_kset);
>>  		goto Err;
>>  	}
>>  
