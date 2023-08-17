Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04D377FA2F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 17:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FF010E4CB;
	Thu, 17 Aug 2023 15:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E75C10E4CB;
 Thu, 17 Aug 2023 15:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/ew+atC5yPJzu3eiv/9VprmXU1LGg0Hw7nJSn8TKAO4ZU8P/iKabRBgT5J/7aPhuz/ywkYrVBovs/aKgi7qsZ7tX1g+rZrBI+BtN55zxD67c9YPEKS9K3z3vYV6uF2lDiLnLVF5IOA3aBbEAdh6v3528gftk3diNwJiZzSdab7PqPAVrNZsYxYnR3J5HHew7+zlF6N2qcLY5RbRQZFmbXPDUqSqc/j87xzoPKGZPn9Wsxeq7Nqdu80RGqlnqu9cD/dVnx3hXWpM0yebw2ddWBsavypFG4TbFS1ZTqgrPO25WqTO58C6pkxatIsBqnyuBVvA8Gmm0vX418zrSk2ldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sdXfFhqwbEsnPKe+XhlYXx0isGNScnj8qVlMIZFIRo=;
 b=gy+9Vkkw2Xv6i80qlR3ndRrdzOIZVgLxZPqlh5GKHjh/+QvtnbWF8g/YLfAlAg6JI8ow1ntF/XY0D6AkRyOIVVYmIrC5o5Tgw4Lvb82cL3vmhU2MNzXzal1QA1Ulium6YgWy4NO6X/vhycKN+B606w35qp01Pp5kYCg0sSdv0m5yJNnhs3cJjkmzoLye0EVyx9jkiUaqTE9IFF1w7cLotnsGlypPac//8pttZlEVhMNsbhD5EnKZU6PGYvUS2kki/i+w8CrhAGLtu7t/voZ9MDEHp7VU6/4c9ltImewVuZxAQvL+kxVCyfUOOnkjg3tBxuwHGlrnHgS1rU7FFsrd5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sdXfFhqwbEsnPKe+XhlYXx0isGNScnj8qVlMIZFIRo=;
 b=e/4DbOFJgDr0vpkTiuNl1hzUtwLsJyxqcmR2cMYDOnB4cY7z8AtcZHMzrWxfZDGwxzWREHzyLa2CgH6xM9J4E6UXlvzmXJlO5Wx6VjLpOPAjLZ8mMLqsxpHY2x0DWercJDP70RTr1h4f58VCCcCYwsBiuyjxpH/RdBYOu0Jxx4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by SJ0PR12MB5440.namprd12.prod.outlook.com (2603:10b6:a03:3ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:04:13 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:04:13 +0000
Message-ID: <eaef1599-4da3-ac10-a03e-4f2d8304c60d@amd.com>
Date: Thu, 17 Aug 2023 17:04:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Rework coredump to use memory
 dynamically
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20230815195100.294458-1-andrealmeid@igalia.com>
 <20230815195100.294458-3-andrealmeid@igalia.com>
 <07ef59db-da17-15cf-789a-7f5d01b2c9c9@amd.com>
 <a6e90991-91bb-4da9-ab67-d0ec28a29680@igalia.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <a6e90991-91bb-4da9-ab67-d0ec28a29680@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::7) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|SJ0PR12MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: 767aee26-6b94-4b17-a703-08db9f3337f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHbFsrOhPgPTHNFnMP3CjnggcD1T0PObIpWyPZaYhfDLs5pZiwkpib/Vua4d2JvRYTZ8BBJe1kNnljdc3LMYDf2yyRJ6rrgnaVmMqWzccuLwz59Q4/Re9Xkvswb+IPQpBm9qrus0Xg1q2WOjnNfYUMwzTEDO1qNuVRJuML6sM2nmp/aey2IHZEdq2Eq5Q7k6rMPr0mFlkHypd2sWg6Es65iAZXO95LcRkbf3PhqiwmnURVOcNxVn70nQkBjzk/Eax8jmeCZb+pMLdJx5nHnWOYf+g5tWZohkx5YQBnMaHRAuWQLiR4TWsFrxY2YALRT/U3kseyBvAOiN5hSKD3dAAGlMcOsNIQDNM/ei4SbpPwYlJk1yxt39/qrl2N5iDfYJZ6sz7pKCaFZwiRvJaSI6v8OPxoT9IUpoVhk+iZ710V+/jGsCVnAtpoBBIrWeYyF1qBn4XX0peB+j8DY0O6HQ+9engQoQ4r2UO/SkyV64mLY8usRQ5LYB6KLgSUoU0OZSG8m6nYfvnB0Nqjl+QuXkZuIAHwBrPd5VhU34nLLDRZjtWXptpINSJwJEgP3NYAILYAeLqqzy2xE2feXXXJEO+kfAWDnPoe5jDBtAjxj24bh9mX/DvD8e/sizclOLIrHlGYqm1MvKFoMet1VMr/zfZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(31686004)(36756003)(86362001)(31696002)(38100700002)(5660300002)(44832011)(2616005)(66946007)(66556008)(66476007)(478600001)(6506007)(316002)(6666004)(54906003)(6486002)(6916009)(53546011)(8936002)(4326008)(41300700001)(6512007)(26005)(8676002)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXAwMHVML296N1FCc29JaXh1REkyZVk3ZnlsT0hIR3ljQ2ltZXBqRjR2U05h?=
 =?utf-8?B?MXQ4YzVjanFrU0R0N1J2SklKMTNaYklGWW1YV2ZES0M4TFpiR0NPQm4rN01a?=
 =?utf-8?B?NU5URVI0b2NNOFkydXNzMndZOUxtSzFKcWR6a2VoRU5XODNYcmRwOTRsd1dm?=
 =?utf-8?B?WGd1VTIzc29uNVZ6VDN0dVkrREREQjRMcVJNRFRCWnVKUUQ4VmdFSzVUREJP?=
 =?utf-8?B?RUkvazFNeVIvSUpseFE3ZE9tdXZ4NnFGTzFSOGVFaFZFMFNNSTBOTnJHWFlj?=
 =?utf-8?B?RVhQd1ZKaGNOMU1iTUZteDg2SjVUWENGQm9vKzdDQ3MvQ3NhUDZ0SXk1eVBm?=
 =?utf-8?B?M1U1MXoyY3N2Zk9XVy8rZE5pRjdGajF6ZHRBbjVQWTJNUVo3NG1HNjBqZzMz?=
 =?utf-8?B?dzFaSmc1MDhCU1ROOWpCVm1QV3VxM2hOZTF0SGlUNVEwSm9WKzB3UHBOQitQ?=
 =?utf-8?B?RHZPOFdYcWhPT0NIc2M0YW5NSnpWVlRmaVNFejVZaXoyVTg2NTRnVXUvdmlu?=
 =?utf-8?B?OXJKRkcvNVdQTDVoOWZDMzJLaWZIanpzOWVSQlZKa1pZT09ReGpIY2FaSHZN?=
 =?utf-8?B?WHdWN2pxM3RWU2I0TmtXeU5BZEFueTk4TSszcjNoV1U1bzVya2ovSEMwOGRo?=
 =?utf-8?B?NThnNkltdlRSeUxhckl3ZzVHUXpEU296VlJadGF0NHF5US9OV1QrL29YR3ZF?=
 =?utf-8?B?bUpHTWgrMnVuaHNpdTJ0LzVSc2FMNHNHMEVoSmhuRUxNMmoxbkdnTU1CM3hE?=
 =?utf-8?B?YkczSzVJSE8vSW5PZHhDWVpva3JBRUhvWGlvcXZ0TW9vWUYwMk1mcVBhMzhK?=
 =?utf-8?B?cnBBL1lkMU8xeTlWeVdqbXJ4bGxQaCtJcmJ4SnFnM0tFTUZEeHM1dkNrclVz?=
 =?utf-8?B?VWhPa1hFZzJVVDhlNlRsYng1QmpkSHV0S24zckZKc2N5SUxWakFzaFVodEtG?=
 =?utf-8?B?aWlSS1cweW8zMzQxMHhxMEt4ZUVvNWdqdGNmSC81RUUvcVNFci8zbmx1NnBR?=
 =?utf-8?B?eWk3Q3N3S3NRTGZlSEhQdzlFN011RVI4cWtRbEIyS3F6ZkJkSTRFRGdaa0E5?=
 =?utf-8?B?OUhSY01wTUdVZkE4MTJWRzROZk00b3h3SSttTkxML3BIc2VHQ1Evbi9pQmdK?=
 =?utf-8?B?NjJNNlZ6QmxVTDBkYzVoRjFMQ1gwSFJQeTVPSzBIQmNZRXJPZzRwQXhDUkg0?=
 =?utf-8?B?a0RhM3U1MkFGS2lka2dVY2s1QTlrSXE5OUpQRThUY2gxTUFKaXZueVFOQmVU?=
 =?utf-8?B?SlJSQ2o3cnNJaFRxbytzcXJKcjZOcFMwdlhUOVhjRkxVOThoY0ZxQ0wzeWt4?=
 =?utf-8?B?R2NuTXBrNXdqOSsvOTRkWlMzSXhoRzBTN25DSHZLN3dhN2IvN3FEL25FLzhh?=
 =?utf-8?B?VGRFOENNK25tZUN4Z0ZXMnkydEFqVWRtSkNkWnhMUjRJSmFPNy9pbVZVVkRu?=
 =?utf-8?B?RzhmbjFBU1VlTkc2V2lyaUt3RU11WnRLTFl3QkpnUVk4T1FTeE9ta01XejZQ?=
 =?utf-8?B?bTJXajB2MjBnTjhGMndqWmtCZEVBc25OOHBCRGN1TkhlcWZldFBxdjcxNE1Y?=
 =?utf-8?B?QUxFTHVBaW4yVHpVSXBSbFBrcG1ZVnVybTI0ZHJ0QTJGUXBuVmdGNjBLUmxP?=
 =?utf-8?B?RmJMUHd0ejVtSTJ2dWgxMmVKSmZLcmkwcjNJcnhYNkpwZ0JyR2xVVkNUM3Bn?=
 =?utf-8?B?QVc0WTNqVk5MaC9lMXYrVW91Qk53azdHV1ViaDdPMGk2VDFsTjNpbzlkblNQ?=
 =?utf-8?B?M2RqOGtCY2U4MFlvbEVzc2E4Y09xUG1nSGlJNUhZa29LOEFTTnlKbWxSWVNS?=
 =?utf-8?B?a2VZb29weHpIT0tTbzNvT05ONGQwMXMvR3RPNkc3cTU4N294VEdJUHlKSHBF?=
 =?utf-8?B?R0ZVUitBM05xMTZlSFg5eG50Z21mZmwvRWhTTWM0TWtLOUJqWEVEeTVXVFlB?=
 =?utf-8?B?eW1jdVhqY1ZjL1lSU2Q0bk9Pc0hUdXhBSlVnWXhjZTNLdnZSZm1JOFVWVEQ3?=
 =?utf-8?B?L21qbnlBWUpPTW40ZEFtc3NDMGhDck9ES2VQMlRuZmtmNFpZR2UvQ3U2czlw?=
 =?utf-8?B?WnBRVG9BbUxxOEk0K0N6MnpqL08vL2g0ZmxPci96aWNVZ3ZaNHlrTGg4Uzh5?=
 =?utf-8?Q?nhZAu7fzjg9qQhC7bftVQhm8X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767aee26-6b94-4b17-a703-08db9f3337f7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:04:13.7953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QugKkbGNcbjAVfnHjcmVrQsEngNgWs4DH1syxrINiVXL2J2b38e0WGI+7OP+mtytRzet/36IqQY7nkG2Bx2Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5440
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 17/08/2023 15:45, André Almeida wrote:
> Hi Shashank,
>
> Em 17/08/2023 03:41, Shashank Sharma escreveu:
>> Hello Andre,
>>
>> On 15/08/2023 21:50, André Almeida wrote:
>>> Instead of storing coredump information inside amdgpu_device struct,
>>> move if to a proper separated struct and allocate it dynamically. This
>>> will make it easier to further expand the logged information.
>>>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>> ---
>>> v4: change kmalloc to kzalloc
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 63 
>>> ++++++++++++++--------
>>>   2 files changed, 49 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 9c6a332261ab..0d560b713948 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -1088,11 +1088,6 @@ struct amdgpu_device {
>>>       uint32_t                        *reset_dump_reg_list;
>>>       uint32_t            *reset_dump_reg_value;
>>>       int                             num_regs;
>>> -#ifdef CONFIG_DEV_COREDUMP
>>> -    struct amdgpu_task_info         reset_task_info;
>>> -    bool                            reset_vram_lost;
>>> -    struct timespec64               reset_time;
>>> -#endif
>>>       bool                            scpm_enabled;
>>>       uint32_t                        scpm_status;
>>> @@ -1105,6 +1100,15 @@ struct amdgpu_device {
>>>       uint32_t            aid_mask;
>>>   };
>>> +#ifdef CONFIG_DEV_COREDUMP
>>> +struct amdgpu_coredump_info {
>>> +    struct amdgpu_device        *adev;
>>> +    struct amdgpu_task_info         reset_task_info;
>>> +    struct timespec64               reset_time;
>>> +    bool                            reset_vram_lost;
>>> +};
>>
>> The patch looks good to me in general, but I would recommend slightly 
>> different arrangement and segregation of GPU reset information.
>>
>> Please consider a higher level structure adev->gpu_reset_info, and 
>> move everything related to reset dump info into that, including this 
>> new coredump_info structure, something like this:
>>
>> struct amdgpu_reset_info {
>>
>>      uint32_t *reset_dump_reg_list;
>>
>>      uint32_t *reset_dump_reg_value;
>>
>>      int num_regs;
>>
>
> Right, I can encapsulate there reset_dump members,
>
>> #ifdef CONFIG_DEV_COREDUMP
>>
>>     struct amdgpu_coredump_info *coredump_info;/* keep this dynamic 
>> allocation */
>
> but we don't need a pointer for amdgpu_coredump_info inside 
> amdgpu_device or inside of amdgpu_device->gpu_reset_info, right?

I think it would be better if we keep all of the GPU reset related data 
in the same structure, so adev->gpu_reset_info->coredump_info sounds 
about right to me.

- Shashank

>
>>
>> #endif
>>
>> }
>>
>>
>> This will make sure that all the relevant information is at the same 
>> place.
>>
>> - Shashank
>>
>        amdgpu_inc_vram_lost(tmp_adev);
