Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D0665EEC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECB810E754;
	Wed, 11 Jan 2023 15:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837E210E754;
 Wed, 11 Jan 2023 15:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAIzUYqo5ZD0vQXonB1RZknWuBIEQKS8IFXpj+j1iXY4yVd+9bZQqOCvg7bVsWvEcX4cEDCfzcLh9WyRSWOvbfXmj4UPPNc5x3CyUsQ7ej6EUU1zg9hzrS4YCcLTdJmoq6EuKZPHT6p/u1+d4z4fxnj+Tm05GfXDyKUMW2Z97v3vO14w+vmyxav+D4k8vrGwyMRZLdycKB8NlhZeS2zu8hu53lPrEnonxjXfCpXmCdSOTXG1/X1yoIiAvXYztG9vZ43vZFoeLIlv7d5Lf1kKOu+XaKeMt1RzL+OwUPUTyIYwxdv+LKoKY4p2BYayfeCVuOGB9TH7PfaMNMwhrtMsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsUdLjuI/UdrkuJZS0rK4ndpO7Dlevicr8Ixp7QP+Ws=;
 b=DJqQGjhvGroelpGRy2FSxS2g6UAG8S8EpvQ4M1AMYsu6ln/pDjDAoEokrYcQ1rS6BqPVtv1OXctkx+Ewy67m+Z49BCVVY8Mta2CVvNdTiyeYzsU6CdH4PqsZeRvzPscz+3itdINrqV+NyZKoiOIVCzQGAkOWx0PdCLMVCGE1k1LGu8NLuPSOFgbLmMho4DE3sf3MX/adl3OeBh3/V2+e69oCsj1VTDR/7ZEm7jidwSyn1LSN563RmDtaZyCKEKqyrIg3GH0w85zEX8jHAI/8iQiQpG7v7Avo9alR6iRwXqMqVJZFb/MJ3gIXsuyMYLnVsR22Wvf2iytdgEJbY9pyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsUdLjuI/UdrkuJZS0rK4ndpO7Dlevicr8Ixp7QP+Ws=;
 b=PrmWq+2GEoTcId3APV27nXDbe1mrKtHy8SpyhMINTyQkASrvcLBo3mNe+QP9cT3/3aob6/FFskX8AXo/oLtcJDegRjCdJEfQMPZEpojSefvov9Bm2Sz/EOyfDkyf1mJmEkV2fRs9BP21mQDuP9iE+1N0cXOOiIqhbLkDDpqe9m8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 15:19:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%5]) with mapi id 15.20.6002.013; Wed, 11 Jan 2023
 15:19:11 +0000
Message-ID: <aea4b937-351a-f036-61e5-790af633f5f2@amd.com>
Date: Wed, 11 Jan 2023 10:19:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amd/display: Fix set scaling doesn's work
Content-Language: en-US
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>,
 nicholas.kazlauskas@amd.com, hongao <hongao@uniontech.com>
References: <20221122112034.30080-1-hongao@uniontech.com>
 <789c2c61-4959-c3c1-0916-d1cc7f659247@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <789c2c61-4959-c3c1-0916-d1cc7f659247@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTBP288CA0029.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 081897ea-6d9c-495a-6280-08daf3e730db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tyKc2pboCJkq//jXXL/7ouIVI85FwFz/xVVORSE960ildsRWb7EpQPz6nmtA4Yql00Hgs4bdO5hnuGp+XTJ94WuYobsuJKZuRPY7OEoGH9li/ESTEN3eQqum6Ehy4Oa3gf3zHOGTAiJAOQWkLGImX7sy/TqcWGdJ2Rnw9Fpw9zulolRrmZgxEeuygOt14ct+yzBlZtFUkTIbho3ZtHLlspwiEaUoYQTHsWh/D0DEEnv02waqEeUb2ovi0Aq1bt3FB1z2MrzBzFdnvBTaDA5FAr79J32/0uw94RPa8CiUORqXIgWN14/ndbhoEscdav0N7WZT2RnD3b24gv+bDqKqPR6qYXprxqJW4XM5gVMw4o+zyCtvvdkKysxatGb8Vq/7HveT3+mmYs2hHHRxtHf8cmuDa8JO3/YTL2NPcaWEIvB/IVb4JpPY9e8GRQdLLYydwzVvy+L534smcA+u/bULk/Ri/4dTx+XT666MYwh2bY2RUnjqY0444Rui3nQrA+pIYZLdnK9ti2IGjCHS+edu9Hrf5cqy0fpAAmJbt8xojBZwnhNeHeldyI1nhSl1WyScQ/y2+f+cK5+f9p4j4gAtJT9xMWV5HJKHZ3pBeCU2K0lwsVdb9L4qB9LcDjsUnVJAZO/rM+IgqN7CbxQa1flkaSzgqQ8pjFdZLLJ0oxkimtvMuLcQYtwneeioF/yBpWZGyTk7JgEyKHrwZlWVVd+NotkusqrJHnnzxFLiMOlCv0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(31686004)(110136005)(2906002)(66946007)(5660300002)(6486002)(36756003)(31696002)(86362001)(44832011)(8936002)(66476007)(41300700001)(316002)(66556008)(4326008)(8676002)(38100700002)(53546011)(6506007)(83380400001)(2616005)(6666004)(6512007)(186003)(26005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3Vza2g1eHVWZi9KcTNNbUQwYWdHQzJUbWRjY2ZiQ2ViT1ZOWWtURXgzb2FW?=
 =?utf-8?B?bU9NcFY3YmxtOHZRSEFCcmZPL0RLdWRyWHdsWkwyOVpnVXJnVWFYZmZIdEVQ?=
 =?utf-8?B?enQ2dFpJMHVtRUhobTdyZnVhT2k5S1dCWk9rWC9lWjFTVUNYcHlnTjl4ZGdQ?=
 =?utf-8?B?QkZHM05ibzlCUmFncllYTlJidzhoMDFKd29TTnQ3b3lGWDFwUHIzZ09reXVS?=
 =?utf-8?B?V29nMGJTZXV0YlJSdXZoQnRmc0Z3Z0ZSSVpGU0h4TEtISmwybmF5cWdCalFR?=
 =?utf-8?B?L1VWV3hxS0htOWhPQnBJREpGNWJvV3lMYVVtVFNaa1gzaVNvLzR1amJnS2c1?=
 =?utf-8?B?N3BOWTJJOXN4UVdYeFJuak9wY0JhYTN3TU9rK3c1NC9yREhDSldJYVJ4NTVG?=
 =?utf-8?B?ajVuVys2WHV3YVFUaGVNeWNCMnoxK1g5MjZaSGRraVBnMVkwWk9tTHZhVDhm?=
 =?utf-8?B?eThvbnBSTnpTWFY5K0ticnBsNWZpRXp6NWtzeVdhNHZlcFEzOUR6dEFGYitT?=
 =?utf-8?B?RDF1Rml4Y2pxUnVOSnRjMDN0MmdtdGdwYkQxamMxWXdkMEFaTlN6b3pxb0dn?=
 =?utf-8?B?VTNLclJ4UXhaVUx2SWFYK0lyc2ZXVld6MlR6bUFjYUNMV3dwQU5UbmdJZStF?=
 =?utf-8?B?ekFKbFpvTzVMMDFSYno1LzA3bE9FNmEyUTA0Z0RoWm5VV3NrWktHYTB5cW1O?=
 =?utf-8?B?ZGFMNVNOUHlWQkxPUGoxTzVMRTVQOUVUa2hPTFB4L2RHWHdjaVFSa0dyVW54?=
 =?utf-8?B?c2l2d3JBM1c0ZzM5eXpJOVJVSUtzdVV2OXBYZDZyMkxEekh3OGV2eFQvbytv?=
 =?utf-8?B?dS9waUVnaGs1RWNyV2I2NkpsNnRJNHFOMXRYa3ZTZ2RxVmREU2lveFI4ZEZu?=
 =?utf-8?B?eURkaGJ2NzVXbUdCQ3lJRmNra2loYmtMeTN0KytaUUk5TFJ4Z0pQNUZqM3hP?=
 =?utf-8?B?RllzRlF5RlVmMmJ3ODE0NUU2eUpGbEJsaGdSdnNHREk2VmpxOG1tRWRGOXJU?=
 =?utf-8?B?Qy82aktZNFRHR2oxQnNMUWRmRUMycDZUcUpLS2lFT09WeWx0Ry80Q0dndU1G?=
 =?utf-8?B?NDFZSVB2anZmUEoxYy9POUJ2VUZqa210dm9yT1REOTNHejlUSkkwaTJBeEhW?=
 =?utf-8?B?S0NtM2dpZmljQWs5WW5hTFIzOFo2T1J5NEtMT3J0MFVBQTZsYWhzSEVhMHpv?=
 =?utf-8?B?SDBuWUtaeGh4NjA1dXVMdkpsZHZveW9jY3Fadm0vR0haWjROUHNrSmxoNE16?=
 =?utf-8?B?YlRZQU9YY01nOGF3aTE1dUJEbm1hNW1WajE1a3g2LzNaVUdSRjd4Z3pBNW9y?=
 =?utf-8?B?OHlkbWY0TmRZNnp6NnRSUllWbHlPTmQ2U1lackVKQlhEU2lxL2QzMWtIOGNZ?=
 =?utf-8?B?bjNSazVGaDdTZjVRUk01OEFtZUlpUW9kdVA1aDYxbWpjZzNPV29VOHAxcjNI?=
 =?utf-8?B?bEowQThkbnE3czlCYnVUUGlQREVNMUlMa014cGcwMTR5dTFCYVBmOGdhaG9r?=
 =?utf-8?B?dHVOdFBhVW9DalVNYVlLTElTNnJQY2dVcE53UER4eWxPVHhOejZOQkx0c2dX?=
 =?utf-8?B?ZzVuc1BEZkJoaUIyaVUrWkwvRnc5SEo4WFVTK0grRkplUmZzYi9UR3VFYTBM?=
 =?utf-8?B?dHRuN1pUMmxKM3VYUUxHWkpITEpqZWcrc3FwSysvcWNCSy9vbEFWV2ovNGl6?=
 =?utf-8?B?THdmNjNDcEJ3ZzFBWElmYTV5aTVIc1pvc21VMGQ2UkNLQW50cTBTeGFWUDlX?=
 =?utf-8?B?Ym5lSDlSaFdVa2w5VGlsb3VxMjRVVzRkQzFBVERldUNKVUdnMSt3ajc4REhF?=
 =?utf-8?B?c3dzNEpvZm9LeXd5c0RaZEZUZ3FWV0U0RVltUzJWL3hzR3ptbDZzSmxRRll4?=
 =?utf-8?B?bXV0aFNvMG8yVU5qSHhYWmZrWWZEVXNxZHBzM1ErM2Z0enU5bUFwbk5JSkNV?=
 =?utf-8?B?NEkrL05OVi9ZUGZybWhXY3dWdld3OW9VcktUelBIL2M3aE9aMVFPNDRqaFZU?=
 =?utf-8?B?aTF4N3hHTzVHRnoxUGNtckM4U3o0QTFMNmxOZWplS2lHYklSVXRha1owNU42?=
 =?utf-8?B?dlZWTFNqdFpIcDJiWHh0Rm4xMkh6UkxVL1NqcmttUnM2OEFmYWg3ZnN1UHk5?=
 =?utf-8?Q?k97vuJUBxMO49U31yJCUCb/J6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081897ea-6d9c-495a-6280-08daf3e730db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 15:19:11.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiWUtaG9TmKpXF51+KJQQnxdkli+wA5Eh011v1H3jE1tXDlTTJB0MIrcolewXzo35Wg83XD1mz7pRtffhSjfGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, roman.li@amd.com, Jerry.Zuo@amd.com,
 aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/23 10:58, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 11/22/22 06:20, hongao wrote:
>> [Why]
>> Setting scaling does not correctly update CRTC state. As a result
>> dc stream state's src (composition area) && dest (addressable area)
>> was not calculated as expected. This causes set scaling doesn's work.
>>
>> [How]
>> Correctly update CRTC state when setting scaling property.
>>
>> Signed-off-by: hongao <hongao@uniontech.com>
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 3e1ecca72430..a88a6f758748 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -9386,8 +9386,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>>               goto fail;
>>           }
>>   -        if (dm_old_con_state->abm_level !=
>> -            dm_new_con_state->abm_level)
>> +        if (dm_old_con_state->abm_level != dm_new_con_state->abm_level ||
>> +            dm_old_con_state->scaling != dm_new_con_state->scaling)
>>               new_crtc_state->connectors_changed = true;
>>       }
>>   
> 
> Hi,
> 
> This change lgtm, and I also run it in our CI, and from IGT perspective, we are good.
> 
> Harry, do you have any comment about this change?
> 

LGTM

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Thanks
> Siqueira

