Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF9394474
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 16:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37BA6F5D4;
	Fri, 28 May 2021 14:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9A26F5D1;
 Fri, 28 May 2021 14:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ1dUpGDrmQEU3c4OMTWO7R4CJEdiTWGAh/dF6rBjQqdrA5WBdLkNbonhHhcgLzGgvqJ+lTpcA6HhwSnBIjLFen6k+S4PEXk+hrYuM7H974u3Ri/+Srbz4HWcGEbssBY19MktOhEGYNEpyRZEP5pCk4pv8wjv1mVu/FTuqrqPABD53VhQq1aw/2ip4iiv5I5O3jsKW8dmRB3DICJaC2Fr2GBqM3H0H0GNAj3qfCS3/IiGaNzJhZvTx4TpmlJ4eoycVIpYSLUtb+TbO8qr7vltBuUEpTy1cDYW9gZLvQvfcGT1CByvLrfLryxoNEhQOxMlE1/yEZzBIP5d3tHvwWVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/bVHe/R/ZTmSPF/40isvvS+0k3+6WlMRZqnNmDic6Y=;
 b=cHQupt9EZwnn4SEVzzjI9eOl1S6qL4Mn0DZZVrjOotS2LH4w8VWcuBbQvoxxtVOLTvB5bPSmTAQJNGoePSnSEfJjV/hNeYvs6kssIiWXvrzv38OvyOrUeru98SwMIMw1K6Kno84FKLnEWBK0W/IUuzAfzpEIU0yNJNBjmkEqdPYSNSZADuQ+HdEvBVFiWuUzdhkOK6XkDAkwsJ/66Huo77YDfv3p5q4uzjqkISdAq5J/bHW0OoEXUqd4LLWRAYjy/VxTrmGL08a6+dqbgnNexEWkbRrgBScQpqtqzDp85VP/nqsXfG5rOxgeJRKQ7kgu8RfiyIBqtTBci6O2uqWwFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/bVHe/R/ZTmSPF/40isvvS+0k3+6WlMRZqnNmDic6Y=;
 b=Ngc7x241OWczLwkIMgADLutUwI9+9UrVGxXXYhFhbjJI5RBVvLb4mExHI0QCgPFEXZiHzrPS04fMda0j6dfzeABzDMEysdCSY5Lw0ynoSrWKMvO/zcsOYxcvqRqEeC+RRCWSZLp0xcW+ANxB9pCQ5YJW3tP6tJTz5ln/Dmh1yfU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5102.namprd12.prod.outlook.com (2603:10b6:5:391::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 14:49:14 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 14:49:14 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: make sure we unpin the UVD BO
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210420105013.6486-1-nirmoy.das@amd.com>
 <cc3630e3-aaa1-c190-8218-1a2ac1ed243d@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <0b85628a-18a6-39a7-1fa9-1c51b16fd2f5@amd.com>
Date: Fri, 28 May 2021 16:49:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <cc3630e3-aaa1-c190-8218-1a2ac1ed243d@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f21:6900:10f4:3065:5814:d1ee]
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f21:6900:10f4:3065:5814:d1ee]
 (2003:c5:8f21:6900:10f4:3065:5814:d1ee) by
 FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.12 via Frontend Transport; Fri, 28 May 2021 14:49:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4de5d18b-12d6-483a-ff19-08d921e7c32c
X-MS-TrafficTypeDiagnostic: DM4PR12MB5102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5102A85F3AB621761C4C42238B229@DM4PR12MB5102.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JmaDFWDt6VklMp23BcQsfZz5FYsdpKVV31+Uz9xibKHxoPS1LatajTdvaH0J0LAttLtrXWqgwqXqyDy6Vfs7lE7fBa6j54x+ACepyxbu1C4PW3a+Dx/sm1Kf3twK4VqVil6cUFxdcWs3RM4QlAhsg7tTNfXe9yJHshPsaqrob4FaBj/f0AhuRK7/r4xIs4ziHTBxxapEWNGKOnKiB26NDq8rxLyrLIPpesIfEqzw+EvJZN+7dvVjSyVFSOJnmAyUKkv3n6H1f0/mLryQb7jkknFALNEqwcfKK+d2dfAs+BWoSr/3oFAAfofMEpzBsGvHxUt/+xRnvL13Wo2crRB91M0gCj2MRd5WrvwZt7XwnW4wVXpjNhf3KxZyquEsnViJAKzp2kI+wDnXICWcXcitqkjiJA9lNlJIgaZh+ygfYfNdhJGhV/aaQqG6WNA9F+moxsEG35DSKo/KBEaq7vksVYm6Tm5+DdUzSl8dSDfFhd16MNvzvkA2LnSdSbleH4QVatcOStZAwX3JnMiBWwKQrW2NiHjuq4J2jZcH9RAWzPW9Phpx+e+PhaaKqQ66mQTDMLZbK0/s7j6iNh2tkQaw2ix0CGFuZqyasbYVz2FbhVKAj2CoUeAIYNhq5pOeA8dQbx2RhwXR9u2SHHk7fI8mZ4g46NJjmadztRpJWNa/fkY+4GZE9ACy2hV8SqTzSz+a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(186003)(6636002)(5660300002)(8676002)(31696002)(53546011)(16526019)(31686004)(2616005)(6862004)(316002)(66476007)(66556008)(37006003)(66946007)(450100002)(66574015)(38100700002)(2906002)(4326008)(36756003)(86362001)(52116002)(478600001)(6486002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkRhVi92T3hBUzlKTjFIWWIxRU5nMEp3cENvb204UTJ3eVY2YjExOHprbThl?=
 =?utf-8?B?T0drN0lUL29UWEE3WnBZZTNXWU9nUHQvSXRPaGNYMnc1bFFsemlmYlhUVEp5?=
 =?utf-8?B?VEVxdGJYaW9acXdLSDZJZ3NNaFJwSXJFYmF6dS9KNFY3WUEybis2REFwRzgy?=
 =?utf-8?B?RGRjQVdzKzlobmVkZUJqZ3dmSmpEaXRxTVg4KzRFR3AzaGpzTGJXT25CQmJ1?=
 =?utf-8?B?d0pLR1B2ME5hVUIvWFdKOFBNdUJCcERKWjgxcTIzZXhCQkxvc2s4d00wM3Yy?=
 =?utf-8?B?VUtLMUNiUmJ3eDJRZ3VGczdMa3dGRGFldGFBNTZkL25TeXRzUTV1eStnZWFR?=
 =?utf-8?B?TnN5ckwveEdJTU92RmZsb0dFQ3R2eFdEQjJ3bFhoK1BHc1QvN2lESHVZVU84?=
 =?utf-8?B?N0RoLzRWOG1jK09sUmh2eExnVU5Ic2I2VmIrT09sckhKZUVjWWozMDUwdEp1?=
 =?utf-8?B?elhvdHhOb2dybW5oYkJNZUxnc05KTnJsQzA3cXl6RXV5T0pqajlnUllJVnhU?=
 =?utf-8?B?MWlHQy9VUHk2WVNCUFJHMDFEd0o3bjNscDZtTjMyd2hkd2hhczRjWXc2ajNk?=
 =?utf-8?B?TFJDZ3J3L0xQQWh1NVBBSUJOTUVTb1lrQWVCaytLdlJOdTgrblp2QU9VYVhG?=
 =?utf-8?B?WFB4cDBRNGx1SWludElxaVVhNnF4azRxaEFDSjVzYS9tSk5GS0pRdUxwZGdq?=
 =?utf-8?B?UkJrM2ZTMXVVUENWK2JqTDlzZE9KS2EzRlIycXZMa2FQQnM5d1pTSVNRa1dl?=
 =?utf-8?B?RURjSmlGODhkNURpWmpUZDArQjNKTS8xVmcwQ1BxdG9jR1NRMW83OTUrL1NB?=
 =?utf-8?B?SUd1K0FNZldhdTVDME5OaUJrdlJWZlVzdVdqNytLY0NQaE5XemNvUXV3UFV0?=
 =?utf-8?B?VXBMVytXQ0FGbkxEMkxhV2VTeHp3cmg0SXlsVzhaL2l3d0NPVTg4Q01WcEVa?=
 =?utf-8?B?bzJZNk1WQVFSbWVZY1RKSFo1TzFUTDhocmZVdURGcjhKTENsVENPbTBaZkZS?=
 =?utf-8?B?NWxZQ25URXVGTWhvZnI2d3p4a1ZiK1lud01xUE1veFZGUG9paDdsdHhpMXlm?=
 =?utf-8?B?WFM2Q2Z5NnJaYzN2SFFaN3dTU21JdUcvaDJrbzVOcFBtdWhucjFkWHJQck1p?=
 =?utf-8?B?dlBucXZjeG9objBFdjJja1k4ekhjTGliU3VtV1lVc1l6T2VNbCtHQ0Z3c1J4?=
 =?utf-8?B?akx5OTVJOW9RWTNZN1FaV1J4bnFDczFqUnBqYkJsN3VQdUVZVm1PQkdLUnkx?=
 =?utf-8?B?bkE5bkRhSVVXQ0xtQjg2T1k0d0FVbURIZzZXQllScWhlNUtKWDJZOFd1Rjgz?=
 =?utf-8?B?OXgrbVZoeURVT1lPSHZrbjlDL3NBU2lxSE15Y0pBd0tXb0NoVTRodmdCeXg0?=
 =?utf-8?B?WlBQTEVxaEI5aFlycjZsTjluZ2NtRStxWUZGSWY2c1Y4Z2R4N3IzUksrT2M1?=
 =?utf-8?B?UUJBUjV4L25UMWpiSUxnR0I3MFI1bUNXdTJRdUt3NTQ2NnIzRS9ITlFOSU5n?=
 =?utf-8?B?T3ZBQkEyNjVweU12SVRqUnVsWU9YTXRzK0N2NFZRdExWWCt2KzNPZjM2QVBO?=
 =?utf-8?B?RFJpOVlubG10RkMxQVd0QjVJQ0RiMjhNOU5FU3VJd01SY2F4R0RWZkZEOVkv?=
 =?utf-8?B?cHAzS0ZUSFA4aks4Z1lNaDRuM0k5QVVsR0pEZkFvYmV2UnppaS9CbHZDeHFU?=
 =?utf-8?B?ZE1TSTd4dVhWYVVyZEhZMnJscVkxMkpyd0hWeUhDYWlHRk9PQzAyTWR4QjBF?=
 =?utf-8?B?Q2ZCQmRyNHFyWWxWMVNDSDFiaUx2ZkZiZ2RGWlMvc1hYQlNPMWxKZ3V5bUFI?=
 =?utf-8?B?eEI2bm91bmx3MEprTHI4T3Z0VUI2VHFmZmkrN2IrRzROajQ3b2FhZHdMODJq?=
 =?utf-8?Q?QfsMX/HzpbNz0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de5d18b-12d6-483a-ff19-08d921e7c32c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 14:49:14.6189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZFUNu9nSQAFNRyotqUQWdKFF8/Kc6HvSFks9SkHzKtAdcS5PpXK6i80H8FbWK4hpJiyZcb2JeFG2FL+k5+Zow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5102
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/28/2021 4:36 PM, Christian König wrote:
> Am 20.04.21 um 12:50 schrieb Nirmoy Das:
>> Releasing pinned BOs is illegal now.
>> UVD 6 was missing from:
>> commit 2f40801dc553 ("drm/amdgpu: make sure we unpin the UVD BO")
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Maybe add a CC:stable tag as well.
>
> Sorry I somehow overlooked this patch. Can you make sure that it lands 
> in amd-staging-drm-next ASAP? We have an user complaining.
>

No worries, I will push it now with CC:stable.


Thanks,

Nirmoy


> Thanks,
> Christian.
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> index 760859880c1e..4eebf973a065 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> @@ -357,6 +357,7 @@ static int uvd_v6_0_enc_ring_test_ib(struct 
>> amdgpu_ring *ring, long timeout)
>>     error:
>>       dma_fence_put(fence);
>> +    amdgpu_bo_unpin(bo);
>>       amdgpu_bo_unreserve(bo);
>>       amdgpu_bo_unref(&bo);
>>       return r;
>
