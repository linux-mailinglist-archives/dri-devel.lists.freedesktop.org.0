Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 241A2769248
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 11:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E713D10E192;
	Mon, 31 Jul 2023 09:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE2E10E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 09:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCEUk35HH7EjLcF+tuMvSOeRWTpkkDfQtmUTuxfb04abDmyt6u/XuIY9SZca17XYsAmUtWsVlyCojkc4h0JZ2Krxc1vXgNz/SLKO1UpfSCeuVnXt3u/ZsxCKz0te65kwwHo9q/xtmGNDNUGn479YqqTA99e+80qdJwfSBYuey0h4lwOTC6NFJPfOvWlEyhVGhmRTTGbCxSCuIz6/e43oRN2UZVF2meTqASzh+wKTW+xuq/jPADTgE84L7ga7VmVHzg5bHnCMBTdbCz+rs2lmHwII1Fsd9hv3dUDa5Hv/nkVD/QoMj/EVVUBsNQfpl/53r9xt3tIJkeUbSksOI3hX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLZOTVwylvEOphPfXja+wP0hID7tVIFJRmSGTd+pnkw=;
 b=E1noXRx8lu24+nrHAlpnaz+m25SQCVEyHRtIF6m6c2gKS6ITOVSDRfG0hcIMJTYrQejP0e3titCkV9DIppKQS5vnrnHpTd/gDU44KPzIh+DcGtKN1jmKbTSPowRPFT/hlmOhnk9ORpxa4HhCdF3F3cXJ1tVcpI2YszSIX1XH+7XHUCiOeQ5LNO8E5HKcAoo9SZ/qrXuTMQeC7k1HS/5Qbsq3b2WXnhZYu3NRO3D/tFk5QBy84ajyDmnR1q859lTaZ0WVxJ2FcTahqwQC6bpLzhTpqOickWUCUGw++wIZVTwJiymWFdNmeXzv59XlzhgWfDf8/vGRULEC2ZmcurnpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLZOTVwylvEOphPfXja+wP0hID7tVIFJRmSGTd+pnkw=;
 b=1fEmf+zVpuLTMnZHUxL4FV+kWu5SiJf9LjN4KznFp/iv4kR6hgpJg5acs41uHOtuPJSJBm3o8PzGNpW9kaJ7JBvJfEMsG5tXZKIrFaQUUiSDTal8eRp5DzuAGj+xaxt2MBMqz3psXepolSgdQ2kx+uY5FgthThQQFdox3DJTW1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5794.namprd12.prod.outlook.com (2603:10b6:8:61::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 09:51:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 09:51:00 +0000
Message-ID: <e793343b-b97d-3eb8-6c19-bf5ba4074408@amd.com>
Date: Mon, 31 Jul 2023 11:50:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm: fix indirect goto into statement expression UB
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Nathan Chancellor <nathan@kernel.org>
References: <20230727-amdgpu-v2-1-7fc66bc52bf6@google.com>
 <20230728171757.GA433645@dev-arch.thelio-3990X>
 <20230731090353.1cd5e2d5@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230731090353.1cd5e2d5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d4a422-f78c-43d5-2269-08db91aba4e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Or9L1LYch7iGI0GpvBNRA+htl/al/84ygBmTvWZ5NDCyhKOLpSvVA5QijV7qgpnrP1dl6dtmI/X0XC6STu4v0B7hAOCdGjf9FKxJe+0XR7D4LbRaQxgCs6BYL1e/ycryUZaZVMp4VBLW60pcGgsTzsgJ2EfZ85iz9gp9+zo5flmEkxjv8cX3w0C5yKnXoJhjH4sfdOeeGnQ9feWuulc8p6Jb+CH/NsXKoyadk9Zg3GzulMFtXU0RDcVqlGNXEqeFgCP4dpKnJogwS3uUCaJ2xX0JwIMn5FyJ7dEtHcv7cIbd6DkQXFGTKJyfONW7K1ku/9XrnfjCdVipxZ3O+X/XcUuVC6a9ixC6DgBNSroXtqXSyfkFXmJ3xEsYZGECIdc+76S1ATGR7Ws6cjUHxm4+ZGc1vlHts52nj6nb3aDRL1MkmWm5DSaWkOyjV6wCVioJSa1MoaaWyPgJuplGq7T3o3nZg1naiy+IGYrk4Y7plA4bO7JBQofHWOAi6kCgcF6aYYfa3Ko6QCsVDMYabd9oMlHV3iBi8ssBMZMSzHT8UE5O19pOig3GAJhhIA9wVJEr02BCJoe9XgFyXI5ERGM2ODyFtBa2XalTbz51LrkGG9NR4nHP6ScRzzaHCTH4jl51N/m8N5j30hoEk4ECO1VYe2SoHTT4MG0ThrXMUBBXvVwNlZYot19USXMWeXGNuoAv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199021)(6512007)(966005)(6486002)(36756003)(2616005)(6506007)(83380400001)(186003)(66946007)(66556008)(7416002)(54906003)(110136005)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(8676002)(8936002)(31686004)(41300700001)(38100700002)(2906002)(6666004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0NYd0xDNFhKSHhueURNOU9DU1NwcWJ3OVBCcmswWWZOczA4UUxkUXQzWU81?=
 =?utf-8?B?UHVSc2l2eFI1NGsvaFpRa1BzV3lYMXA3UFVSU0h5R0RlZkQ0K0sxc0N4a3pl?=
 =?utf-8?B?aGZENGxCUmE0bTV2cE12QjBVL2VyOHpLbC9DRnR6bFNPZDFPVVBxVzdHVDUy?=
 =?utf-8?B?M3c4U1IwZ2crU0dnZkdrM055MHhPNVRRVVJLSkFCSzRYd3YycWxXaG1qZVYz?=
 =?utf-8?B?VDBZUUx6dCtpb0JZd2pGV0krV2VVaGVVZWY1MTNDSmgrNExpRDdabkxkaFFi?=
 =?utf-8?B?b0Z4UDZVNVl0RDdadngwb3JIcGRjaE0wbEVLSTVkS2l2WmpibHJCRXUvLzNK?=
 =?utf-8?B?ckloWEJod3YyOXNpRmpFdDBZSlU3Z2IxSHNzMGVZUWIwQTRqVzRWcWowWVd6?=
 =?utf-8?B?MjRPa3BFdmNXWDNDSnI2RUV0L09iMHZMdlFVOUw3MlN6RE9jSTFiK3BMdGEx?=
 =?utf-8?B?dHdVT1pNTlMyS1NyS1NpYnFoVFBLUE5qSFp3U3NNSzBTckZCMWZ2Q2ZXS0px?=
 =?utf-8?B?aEUvZm1HMCtaZkNSb2xSVCtadGk0Ym1ReVFLK2grU1NBU0VxbE5zMS9wTVJG?=
 =?utf-8?B?MDRHOXNqOE9vazZ5ejNxTytKZXlFOVdyNUpDN0NyZW5nZjdqN05tMzJSSFNl?=
 =?utf-8?B?U0Jhb0pqcmE0cW1ZbHpjYnU3SW1oVytVT0FWRUljdVlVNFYxSlpSNklQNkdM?=
 =?utf-8?B?SzB6L1BxTzRqZ2xSRGk5dmRDcG5mQ2lnOGxyNDVFVjVOeTE3T3RpK09Ob004?=
 =?utf-8?B?S1A3bjJ2WlM2ZEprZVVNZ0tLQkZiSU45SVUzR0FiL2t0dHVwdkU3aDU0ZHY0?=
 =?utf-8?B?aVVNbUtlS1FtSVFXQzhua2pFYXRRMFdBbnBLU21oTGU3a0RScjBCNmdIcFFK?=
 =?utf-8?B?SE9aWU5PQnpwZ0d0aHI1bkZROWhGeTZJcm1YZDN6UEp6NnpuZ0VjcDFhSnQ1?=
 =?utf-8?B?VjRkckFHUUdEZXh3R0FwWlF1cW80eGVzN0VjVmtNbHk5TytSV0tqWkpQY3o2?=
 =?utf-8?B?d04rZjJodU5LZ1NSMjgxakpEREJLbjJQYVRIZy9VaTFkbXRHRU1LTC9sWEQ0?=
 =?utf-8?B?cHlRK0h2cW5SRmlhZDZlYldVWEo4Tm16RFZ4Y3FFNm9TNE9LajU4TTh4ZHhl?=
 =?utf-8?B?a2ZKQlliazdFNEdrdThwQUY1QzNsTFJnTFdkNnNDRVdHanRGWk1NcjNZVnZ6?=
 =?utf-8?B?MHlER2lVU3J6dGJQckVtbVg3V210a3hkUlBPTHNzd1hQVUFleVBIc0xjbUR6?=
 =?utf-8?B?RFRaTWwvMXQyQ3g2emdTZzM4ZDY3cVp5R2lSZk4wS1hyNWdubnBLOVp2blZY?=
 =?utf-8?B?NE4zVXRoZjBHbHo3a3dmcmFQRVJYKzB1ZlZ2ZmJKc0syMlhoRXBBNE9sSFRB?=
 =?utf-8?B?elZyd1lUd3RtOVdqc2QvcXRCc1JaWE1KOWx1WTUzQXphK2RxNG1zeVByVFRI?=
 =?utf-8?B?Z1l6ZmdhL3pzZzBSamJNaEV2Z1BVRmRIOFJVNnBvSkpReElOa25OUmVYT0dZ?=
 =?utf-8?B?WjlqQ1c1VnNJWENCV05wUUU5OGpiMU9KWld1MUZzYk5kVVhmQjEreVJUY2Vk?=
 =?utf-8?B?VFpwSDQ1dEszUlI2azhQT0dNTFBIcUhKb2JCbk9xaytqcWI4YjVEd05RVnVT?=
 =?utf-8?B?TGpQRENhQnBDZzA4OEFFenVEV2ZrUTZMYytIRGtFNGtScmZ1NU1MNVRCWjBG?=
 =?utf-8?B?V1NpWE4yUUI0cFg5bTJ2YXJzclJ1WUFVNGx0MkVSSzlSTk8yMFordXhkRkI2?=
 =?utf-8?B?S1l5dkVkQitEZ1R2Q09zTERRYjE4RUdIa3NNbFM1d3JxSWM4ZFEzdkdBMGdR?=
 =?utf-8?B?MzhxeklNQ3MwRzdJT0F4TDVPTnRFYkpseG8ydEpGWVVIOVhGTitleHNtSG1F?=
 =?utf-8?B?TDRiSzQxTHAxQ0pRVXdHc2gwMlBlNnVlRHIvSi9xOEtFYUJPSkREYi9DMVpS?=
 =?utf-8?B?QXVMc3hqMGl3Snp2NE55bThrTnhLZDNwTHVGU0NERy9xMUw2NmNnSExONmpo?=
 =?utf-8?B?blJGdUVNOWRBZSszb0gvUUluU1JGNU5TZWw2Z05RajR6MVd4R3FtUEdJL1VO?=
 =?utf-8?B?eFJWc2ZzbFJNNjZSa2hYWW5wYjR1R1QwdUVFTUYxZ1BxVTNzMDBzbm03Snhs?=
 =?utf-8?B?cHNMVzVVamlQb2hJOG5hT2xCVUNjN2xkQUUrWUVkeklUMFZwb3pLdUVsRUU2?=
 =?utf-8?Q?svrvyt3UUNvgri1gIor45yLMEBGj3NT2/5Zxpq9h75nq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d4a422-f78c-43d5-2269-08db91aba4e6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 09:50:59.6799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akpM1TGLMd/1DVeuMEJegVAbQbG14GjsDUkLdjEmzGz5HvsA5TmbHdH2i40yk+De
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5794
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, ndesaulniers@google.com,
 Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dakr@redhat.com, dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.07.23 um 09:03 schrieb Boris Brezillon:
> On Fri, 28 Jul 2023 10:17:57 -0700
> Nathan Chancellor <nathan@kernel.org> wrote:
>
>> + people from trailers of 09593216bff1
>>
>> On Thu, Jul 27, 2023 at 03:50:58PM -0700, ndesaulniers@google.com wrote:
>>> A new diagnostic in clang-17 now produces the following build error:
>>>
>>> drivers/gpu/drm/tests/drm_exec_test.c:41:3: error: cannot jump from this
>>> indirect goto statement to one of its possible targets
>>>     41 |                 drm_exec_retry_on_contention(&exec);
>>>        |                 ^
>>> include/drm/drm_exec.h:96:4: note: expanded from macro
>>> 'drm_exec_retry_on_contention'
>>>     96 |                         goto *__drm_exec_retry_ptr;
>>>        |                         ^
>>> drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: possible target of
>>> indirect goto statement
>>>     39 |         drm_exec_until_all_locked(&exec) {
>>>        |         ^
>>> include/drm/drm_exec.h:79:33: note: expanded from macro
>>> 'drm_exec_until_all_locked'
>>>     79 |                 __label__ __drm_exec_retry;
>>> drivers/gpu/drm/tests/drm_exec_test.c:39:2: note: jump enters a
>>> statement expression
>>>
>>> The GCC manually currently states that:
>>            ^ manual
>>
>>>>> Jumping into a statement expression with a computed goto (see Labels
>>>>> as Values) has undefined behavior.
>>> So the diagnostic appears correct, even if codegen happened to produce
>>> working code.
>>>
>>> Looking closer at this code, while the original combination of statement
>>> expression, local label, and computed/indirect goto GNU C expressions
>>> were clever, a simple while loop and continue block might have sufficed.
>>>
>>> This approach might not work as expected if drm_exec_until_all_locked
>>> "loops" can be nested, but that doesn't appear to be an existing use
>>> case in the codebase.
> Hm, that's exactly the sort of things we were trying to be robust
> against with the original approach. With this version, we're back to a
> situation where
>
> 	drm_exec_until_all_locked(exec) {
> 		for (...) {
> 			drm_exec_retry_on_contention(exec);
> 		}
> 	}
>
> doesn't do what we expect it to do, and that's a use case we want to
> support.

Yeah, agree that isn't what's supposed to happen here and would break a 
couple of use cases.

As a workaround we could define the label before the loop, but that 
makes the label local to the enclosing block, e.g. allows for using 
drm_exec_retry_on_contention() outside of drm_exec_until_all_locked().

Going to work on a patch, thanks for the notice.

Regards,
Christian.

>
>>> Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
>>> Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1890
>>> Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d096eb3aed7b712f5067
>>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> Thanks for the patch!
>>
>> Tested-by: Nathan Chancellor <nathan@kernel.org> # build
>>
>>> ---
>>> Changes in v2:
>>> Fix the continue to be outside of the do while
>>> - Link to v1: https://lore.kernel.org/r/20230727-amdgpu-v1-1-a95690e75388@google.com
>>> ---
>>>   include/drm/drm_exec.h | 21 +++++----------------
>>>   1 file changed, 5 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>> index 73205afec162..fa1cc5c3d021 100644
>>> --- a/include/drm/drm_exec.h
>>> +++ b/include/drm/drm_exec.h
>>> @@ -70,18 +70,8 @@ struct drm_exec {
>>>    * Core functionality of the drm_exec object. Loops until all GEM objects are
>>>    * locked and no more contention exists. At the beginning of the loop it is
>>>    * guaranteed that no GEM object is locked.
>>> - *
>>> - * Since labels can't be defined local to the loops body we use a jump pointer
>>> - * to make sure that the retry is only used from within the loops body.
>>>    */
>>> -#define drm_exec_until_all_locked(exec)				\
>>> -	for (void *__drm_exec_retry_ptr; ({			\
>>> -		__label__ __drm_exec_retry;			\
>>> -__drm_exec_retry:						\
>>> -		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
>>> -		(void)__drm_exec_retry_ptr;			\
>>> -		drm_exec_cleanup(exec);				\
>>> -	});)
>>> +#define drm_exec_until_all_locked(exec)	while(drm_exec_cleanup(exec))
>>>   
>>>   /**
>>>    * drm_exec_retry_on_contention - restart the loop to grap all locks
>>> @@ -90,11 +80,10 @@ __drm_exec_retry:						\
>>>    * Control flow helper to continue when a contention was detected and we need to
>>>    * clean up and re-start the loop to prepare all GEM objects.
>>>    */
>>> -#define drm_exec_retry_on_contention(exec)			\
>>> -	do {							\
>>> -		if (unlikely(drm_exec_is_contended(exec)))	\
>>> -			goto *__drm_exec_retry_ptr;		\
>>> -	} while (0)
>>> +#define drm_exec_retry_on_contention(exec)		\
>>> +	if (unlikely(drm_exec_is_contended(exec)))	\
>>> +		continue;				\
>>> +	do {} while (0)
>>>   
>>>   /**
>>>    * drm_exec_is_contended - check for contention
>>>
>>> ---
>>> base-commit: 451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
>>> change-id: 20230727-amdgpu-93c0e5302951
>>>
>>> Best regards,
>>> -- 
>>> Nick Desaulniers <ndesaulniers@google.com>
>>>    

