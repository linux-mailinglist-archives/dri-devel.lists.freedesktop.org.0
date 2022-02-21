Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 597044BD6C0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 08:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E782410E9EF;
	Mon, 21 Feb 2022 07:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB47B10E9EF;
 Mon, 21 Feb 2022 07:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/6fdf83mJaGs/UkbK7l6ByRloRBLDO8irr0zKx9XJbIg4m6bQ+RmsiKG9C4HsGmuGqt3re9WXLYTdk5N0iaMPh/8OBvUVRMR8YJwcPhi5pdIYkASQDim4lI8UEczZ87O0L8+PC4I8wfk+I+D9MtwyPMuL1SFZDTXocvPKE8/HZjlT2eykzo6SudjqUARXUYEsaCjIKkQRh1VtjECcjyfZqGz15O93ufbjD+qVhLwU4Uyc7xjPE0oDgXOQBqA5DPZJloy3bKHsQj6S24j/u2f6q7c8viiS7lycLh/pkGNMwyvvwlt0zM/iWFf3cJ05Z9xwBb3GMEV8H5pLoZeljbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7bF0CYylTMgEKBBL85gDObCebEx5bOVQnpwBjsKFuA=;
 b=YBsOUfKK8U/0gCtDD3O4bRbsZnnG2E2k28dCi+6c9U0wXP7+U+KUuv3sxWfIRvExJoTNV1tNbsP+B2cPL0CunSaUGFd8/0YhcjAwjAuN9AQs7J0gEErUAskms7Ky8QAiUa9LfZtrz1bebHkT+MtKMJC8FtIWz+DE05z7rfVyIivSetNxmb9joaSQQZNrE4PJBGpDpZn8M7JzQcNUabbiTgDOM/CR2m2JsFwrMIwre50TUlPr1dSdJvZDddhwbltiy1JVBJuCGFqcD42x4exVu4qHfVWQrevizaukfXwnp1Z8phRbJ22BigbYjPdMCCcAc0WRESubilHIIx6b1JIYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7bF0CYylTMgEKBBL85gDObCebEx5bOVQnpwBjsKFuA=;
 b=bOEfLmYZ/f1PEg4llHv+Qz+nwW4P+tS8NXhQYD5bdo8FHTs24Q3DTvmd7ZAiUUal3woP5MWIKkYC9dUMGJ+W+Q7biUgGH7RjIDRmYOy19liIyE5Y5WGBXhU3ueFCqNzNAkGXAZVaePD5rW4eF2knRV+nWQPv0znAuE1pb4co530=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB5557.namprd12.prod.outlook.com (2603:10b6:a03:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 07:09:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 07:09:20 +0000
Message-ID: <79fabdf4-8755-e5b7-f306-0440b6f55eee@amd.com>
Date: Mon, 21 Feb 2022 08:09:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: rework criu_restore_bos error handling
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, trix@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 david.yatsin@amd.com, rajneesh.bhardwaj@amd.com
References: <20220218173913.3376948-1-trix@redhat.com>
 <b98981f4-358b-ebdd-dade-4027c57a1a7e@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b98981f4-358b-ebdd-dade-4027c57a1a7e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0051.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2333fe4e-b9b3-4025-2483-08d9f50914c3
X-MS-TrafficTypeDiagnostic: BY5PR12MB5557:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB55570F70826C81ED6065935A833A9@BY5PR12MB5557.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jhgmbIPzEBSfxLwXlwPhlpW8seIbfUZ+4nj88YIxJv4EjtnVuSMUpcgCe3qqvJk5DvAnK8yLI9CgGjHRxyx4XcQ6oXqeejcVI9/VE4iLCiUkpFs5oYR6J6H+L+pAfo29NHqq6u1tnUBNt9gO2/xsKfxXQ//ipFqSEWsxBfxE0fBAhrCLKkwmKrDnwTw07LEDVSxKSQeatfO0RvsLJ/f+wHAC3/AtxQzIhKeiS/Iex3YG/uXQsAG0LeUkMJ2kpiUwjQwN3e1oP1rUOQtbQ7kh0JNZYYlzH7PBrwmiB7mKqBqtS5AXlmC5htIkBe9viMZ1pC1wLxY8OzLbzj3MpIcVCAycz2DpTaRjcXOdWpv3nZqvdHFEZ+x0aYi+GoqoXOt7Zb0xpStJ+J4Y2U1vRPb0OYOe3mhpw8bko+OryGMjY5zliQD08eljub/nC44AirlG7nMLuh6MQCqphHrGgwHi6lLk/nYHF228hynQf5B3DBTJOGRb59qcgsCnwJ9RmtC7LpcO3zYnJoV6kKFoawqLkHmZKh9D7h4nZobeETVCxJOpcxcBLtznv6ybPeTYZz43Rj8D9MGb+QHmbmEBs8rLikoh0vQZEUarAkUfFo/1qD9BPiaMgt8TIAMG6YhS2GCmieBMLP2+LpPuV/JK3RM52RqEN9me+GkUdxu/OVnjkFKzRz1l4PHaJcD87w4eEEaCxqxQpQOyIQ+LIy5kwtYCniWxQ3Us78OD826o2uqSD4ULR/mQablbL3LOyADB5abS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(508600001)(6486002)(6636002)(31696002)(8936002)(86362001)(83380400001)(2906002)(921005)(316002)(5660300002)(2616005)(4326008)(36756003)(66556008)(66946007)(66476007)(31686004)(186003)(8676002)(6506007)(6666004)(26005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czZjdGNmLzNTUm9XWmR1OHZESXAzZjl5eDg4aVd0M2psYmdabzkrakVXcjFE?=
 =?utf-8?B?RlhuT3VoMkVEMEIyYXlPZ0pQOU0yL0FTRm9lU1dkbVFtSEZkeVoyak5KOFpy?=
 =?utf-8?B?WkFtelA3cjJMKzJuSFBCbCs5OHZWRHY5eU1DMUJEdCtVOUVMR0xldUd2UXR2?=
 =?utf-8?B?SjFzaGFHdWh1R1dEcWZ1OERIUXg2MWdUYTliUkhMMHJ3bnkxbXBMdDJhcHhD?=
 =?utf-8?B?aFJJOUlxZmc5N3hSVEhUdFAyNWVqWkFWVGM4UElLY3FVS1Z5dWRZbjJnK2U3?=
 =?utf-8?B?NHFFa2JvYTc2NWhFSFc5NUNETXhVNmpadlhKN0ZXMXRnQ0U2elYvM1NJRVAw?=
 =?utf-8?B?M2tPRGRiMXZDQWdsVzdicUtvdzRDNllvNGdrZUdXMkl4UzJNYXJmbkV6Uzhz?=
 =?utf-8?B?YWpLTVhIWGJ5NS9xajVqR2xKZjZuMllJUnZrdm5YRmZCcnh3dE14aHVOZlBw?=
 =?utf-8?B?aHpsTVVDOEpVRjc1azMvQWdLZDRSTTVaaWNFcjZPRGc3aG9LUHZwajNpdmls?=
 =?utf-8?B?cWI0aDVBMm1JR2ZnUWxNT3pNRmdxWVMrUHlBZVFJSkcvL09OLzI5VHFuMWMv?=
 =?utf-8?B?Zml2QXE1ODVXaFlhUEtHVGFkeTFCQ3d4K1JrTkdyNFlnNndkR0FMRTZxWWk3?=
 =?utf-8?B?NDV2ZFNheHdPRk5nRWtUeGhxZFhtam13Y2paZG1PYUpHQ3R1QmhEVTVTbDZa?=
 =?utf-8?B?QlBEV2tqcWdXdEgzZWVFMGxRYWtmaks3ZjQyeVdoeFduTjBFZEUvMitmTElN?=
 =?utf-8?B?bjhKWnR4Tk94TzRTVGhkZ3BYZVo5TVp2cjlrZVZueHNicTc1TzJXZEtjUnZI?=
 =?utf-8?B?eW5uaWpDSmFzT0JCTWl6aFd1VGp2R2toTndKTWg5cStkaWZSY29LSmxmZEdO?=
 =?utf-8?B?MExHQ2lVcmxxeWNVQ1ZYdWk3YzZCNnBhenZ3RDFlclJBMXFJMVltdEE5VElV?=
 =?utf-8?B?VUxGaGx1Q0xqTkVFSVhwZDFjcVVJd3F3Skl0Y2RJbzJJaTFsekRldlRqNmYx?=
 =?utf-8?B?NTYwYSttS0VoV0tIUkcwRmdkSnlublBjcURpTm9oVS9CbFI1bjZyUUcrMlJQ?=
 =?utf-8?B?eXZVbzRGa1pGU0lHWktRL2FTOEVpYUVYWElHeU1FQlZLck5CUkt6Q1FJeCt4?=
 =?utf-8?B?cDFWR3NKMVVrc1crNm1aZGNRK1FsMm9JcnlFRSt4aE4yREFQdS9SS3VPRHN2?=
 =?utf-8?B?OWhmMGk0c3NSNlpTdHFYTWhvVmttdlJnU3d5bkVVcXQyb2pTWEtWTnVoSENX?=
 =?utf-8?B?YkxOK2dLdUdjQUZBNzV2QXZZY1Ztd2R5Szl2MjcrOW0rdlJ5bllFY3I3THBU?=
 =?utf-8?B?cFZGWElRYU5ldUdWM2RteWVnRUQ1c2hueU40Q0U1cDEyNEpaSkxQVjg1WHdv?=
 =?utf-8?B?Y29IS2RldWpYTGpPRVdieGd2WXhzampxZGNvOUFUSS9pd2JXTUdPMWwzWUZV?=
 =?utf-8?B?MjExTWp6dmthMzlwMy9xVURzZXZzeXhMYXpuemlHNUN2eFYwNFQ5dytNM0Fj?=
 =?utf-8?B?eGErWFBYMGNkdC9xUng5R0d4L3NzK3FrT2kwb2VGb2U1L3ZMNDdPUE95WHc1?=
 =?utf-8?B?eUZwWlRYTDdOSDA2QUkvS0xyR0gzREVOR1MxK21LcTRET2VBMGR0WVJCdjNi?=
 =?utf-8?B?WGkyZGpxR0xGbDgrU29UbzAraGxNWDMrQ1ZmdC9pdis3MnZjWU1RVDFReXZj?=
 =?utf-8?B?OWE0ZDdmNWdxV1VvUkFKTWVJdTltQ1JwaUw3UjA2Zi8rV1J3ZCtBRENCMFpQ?=
 =?utf-8?B?UHlsRS84dElzcXE5clMwWWtNbmJEeXVDUGlpbEhFSTJsbWJWblhBQlpUK3N2?=
 =?utf-8?B?cllXUzUvWWV3RVh1N3YvVmg1MVFxbFJtTDI4c2JLR2JsNFhBdjl4MFhlMm1L?=
 =?utf-8?B?NjRyZjdCcVdtQ0V3dGpaV29jOG1iRXdCVkNqQ0Y3RkFEV3c2cTVKRE9BM2R6?=
 =?utf-8?B?YXBLSERmQ2xRTmlyNnVkYllBQWRXYitoanZ3bExlaVBqaUkvVDhqRlR1YVo1?=
 =?utf-8?B?VnFEbHFBRTFjZlY3ek11VlNpUUdMQ1duRnRwTUsybmMyb3FMWEhNdy9sbDln?=
 =?utf-8?B?ZXQ0Y3NNNldYRDlSdlVLM2lUZVZHQkFSb2JZY08ySldUZmovSUx0bnJxZ2hz?=
 =?utf-8?Q?h5+A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2333fe4e-b9b3-4025-2483-08d9f50914c3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 07:09:20.3823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNNk9xlqcG2QnVk7pwMhcxC1T/IopsSpOLFemyMFnG1scGDEJDsG5CZFblW0gP47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5557
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.22 um 19:35 schrieb Felix Kuehling:
> Am 2022-02-18 um 12:39 schrieb trix@redhat.com:
>> From: Tom Rix <trix@redhat.com>
>>
>> Clang static analysis reports this problem
>> kfd_chardev.c:2327:2: warning: 1st function call argument
>>    is an uninitialized value
>>    kvfree(bo_privs);
>>    ^~~~~~~~~~~~~~~~
>>
>> If the copy_from_users(bo_buckets, ...) fails, there is a jump to
>> the generic error handler at exit:.  The freeing of bo_privs and
>> unwinding of the dmabuf_fd loop do not need to be done.
>>
>> Add some specific labels for the early failures.
>> Reorder the frees to be the reverse of their allocs.
>>
>> Move the initialize of 'i' back to the loop.
>> The problem with the early frees predates the loop
>> unwinding problem.
>
> I think the existing error handling strategy in this function is fine. 
> Having only one exit label avoids potential issues when using the 
> wrong label. Freeing NULL pointers is not a problem. The loop becomes 
> a noop if i==0 (this was fixed by you in a previous patch). The only 
> real problem I see is that bo_privs is not initialized. So this should 
> really be a one-line or maybe two-line fix:
>
>     struct kfd_criu_bo_bucket *bo_buckets = NULL;
>     struct kfd_criu_bo_priv_data *bo_privs = NULL;

That is usually seen as very bad practice and there is a strongly 
discourage against that.

Using multiple error handling labels is preferred because it reflects 
the cleanup procedure you need to do for each step.

In other words one error label and one kfree() for each kmalloc() (or 
other function which can go wrong) is the desired way to go.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Fixes: 73fa13b6a511 ("drm/amdkfd: CRIU Implement KFD restore ioctl")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c 
>> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index 965af2a08bc0..1d5f41ac3832 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -2102,7 +2102,7 @@ static int criu_restore_bos(struct kfd_process *p,
>>       const bool criu_resume = true;
>>       bool flush_tlbs = false;
>>       int ret = 0, j = 0;
>> -    uint32_t i = 0;
>> +    uint32_t i;
>>         if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > 
>> max_priv_data_size)
>>           return -EINVAL;
>> @@ -2119,13 +2119,13 @@ static int criu_restore_bos(struct 
>> kfd_process *p,
>>       if (ret) {
>>           pr_err("Failed to copy BOs information from user\n");
>>           ret = -EFAULT;
>> -        goto exit;
>> +        goto free_buckets;
>>       }
>>         bo_privs = kvmalloc_array(args->num_bos, sizeof(*bo_privs), 
>> GFP_KERNEL);
>>       if (!bo_privs) {
>>           ret = -ENOMEM;
>> -        goto exit;
>> +        goto free_buckets;
>>       }
>>         ret = copy_from_user(bo_privs, (void __user *)args->priv_data 
>> + *priv_offset,
>> @@ -2133,12 +2133,12 @@ static int criu_restore_bos(struct 
>> kfd_process *p,
>>       if (ret) {
>>           pr_err("Failed to copy BOs information from user\n");
>>           ret = -EFAULT;
>> -        goto exit;
>> +        goto free_privs;
>>       }
>>       *priv_offset += args->num_bos * sizeof(*bo_privs);
>>         /* Create and map new BOs */
>> -    for (; i < args->num_bos; i++) {
>> +    for (i = 0; i < args->num_bos; i++) {
>>           struct kfd_criu_bo_bucket *bo_bucket;
>>           struct kfd_criu_bo_priv_data *bo_priv;
>>           struct kfd_dev *dev;
>> @@ -2323,8 +2323,11 @@ static int criu_restore_bos(struct kfd_process 
>> *p,
>>           if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
>>               close_fd(bo_buckets[i].dmabuf_fd);
>>       }
>> -    kvfree(bo_buckets);
>> +free_privs:
>>       kvfree(bo_privs);
>> +free_buckets:
>> +    kvfree(bo_buckets);
>> +
>>       return ret;
>>   }

