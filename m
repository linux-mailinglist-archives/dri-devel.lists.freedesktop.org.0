Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B30F7590EC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 11:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2AA10E441;
	Wed, 19 Jul 2023 09:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8ED10E43E;
 Wed, 19 Jul 2023 09:02:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFmCs9J04kpd8pdmWyomQR3qxv6zRRUtMR0tL/3EKzfET9C27BE8Q5QfO8oxn+BEYa9mPquX2fhppDTE/F2dHyCKpXuClv2hkByJVF40VQL8+r2BKcY8BeZDcrb2OfHzXhCx2ArRyVRLuDXemXR8y+1I1f3iaWPrAQXhzml74qlDCe4XiT+FgtrS3F6oRldbodqLDqPaVoFTaetY3ztVRep/ctcDQa+qBzSSf/d5ubvygiO7Z4AstZQjmhYwntI7e4BQSj9Oy160kT769v5+i4ZsvKd2o0lhlJmkbX/10yQRH2uv6984CDsZm9XKeiQOgs1I8YcJf+X/nzvPAyzEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIIafuyhElVILlICxFywjicdnyVT2JzcmZIBfFPbF9E=;
 b=FY/7/e6pnWZLziCSk5z1GeDYo4ANDsK0izxvRHS71vjW3EVJSTCuMoiCGgS9x1VHvPOlI8eF69rKHquzLJ97z/ZKrG/7bLrKoZ0G+gKS8ypcrb+m7xZM65VndJxEXzlGkUAJkR4PtC7+tgFKZfKzT6Ldwz8Tnuv3MUnToV5wDcV1mMjhpmiSnA5hPVnWQse3B4p7wAYnTpBUtRlmNW0eVhZ1gt887gz9s4o3l3lVqvi1cJ9/8XQnaCWrrGC7suQMBoJ8GPnCBnRQ3HDvH1RNkArz1wB2xfDz1xb59UrPzPWid/+vmdjHFWoOc6ZjNb4me/+TLd/cQEevojzrEk21mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIIafuyhElVILlICxFywjicdnyVT2JzcmZIBfFPbF9E=;
 b=iIzKaZCX7z8OYWDIWl1HLNmmY0xE/ZByCmh6fu+09Z5ipqq+zhjOYddYxN4xeDz/Idx6Cl04IjmkG0tMZAcGPjlnEQ6QiSrwVtUibaDLhUDXZGLEtAGYuGpNIZqSyUeffm6oTOkFgNzHwv63aKJ5i4+0dk1N6xHzN/KLBtfHdIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by MW4PR12MB6999.namprd12.prod.outlook.com (2603:10b6:303:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 09:02:40 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::d457:e33f:9a7:7a10]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::d457:e33f:9a7:7a10%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 09:02:39 +0000
Message-ID: <059f2d71-92f2-f8d1-bbd8-4112ed75f10c@amd.com>
Date: Wed, 19 Jul 2023 11:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-xe] ttm_bo and multiple backing store segments
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
References: <c886cd42-2a78-fe3e-405b-e531d54449fb@intel.com>
 <ZLV5YmlKu1+obT8L@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZLV5YmlKu1+obT8L@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::15) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|MW4PR12MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a14ab6-c84e-49d2-be1e-08db8836e71b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VySpMo/tDodlEFyWQHg2AUbA/bs6Il3uo+Sm9PD6if7m1DdesArfc7A/r69zmfXdxn8scwbQqNWKXT7vWlNEThWOvqiLFOYbU3K1BQXJvcYh0sjj1BLB8XVCJNpqfR14iFH3/BypuTqVqFETuCgd3wxM9VPfgxFovGoiWLMout1wppcszB8XeHGVn8ULWbLT3HtBllhDJ2hJDc83bfbdZ0fp2JiEtU8id9prws/e4QB9cRni8OZGgzL6lB3DsPJ33pXzb9EPWQleu591dJsi4JqkG51QnfB9Ogyh1XJjspNNSt8OSk8u05lVOUoB6drkBTG9VQAQ4pmRvMEzaFAz10g5OPu7sNPSz8O7QeI65TWhFBY0C0Xubmf6hswGFhuJh5D2gADgS0FzTfQFHisyktcJxfZ0h6eaEVAm8972jwR7W7cJ54sQiLBe2H8Lk2+vYLhB7oX/b7Rw+uvD1y14Z2ypuY/EeViyxEYAXYFHwzpSerpXwRnLPumDKCaoRsvRtrqSB6gn9Tscyk71FVV/ArUtzSGpZqW9k1wsk+DOIdJlA4d+7Khk5ZQA0IYSlG8HY8D+xBtfwrVbZRbty46ywVGTwWp4TgR+pee4J9Swgs/xyj2qMvjFTdTtMlEv6rsI8uabxVo44JV44rqhF9vHDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(6506007)(31696002)(83380400001)(38100700002)(186003)(110136005)(478600001)(6666004)(6486002)(54906003)(66476007)(41300700001)(6512007)(8676002)(8936002)(2906002)(66556008)(66946007)(316002)(4326008)(5660300002)(36756003)(2616005)(86362001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDBEYnd3N2g5YzBYYWM5R3M4ZTJWZVpwVTVTS3h0bEordkpqcGZCaHlHTC8r?=
 =?utf-8?B?QzdEREd0amQ5Z3BkRnErR1FsTzBkTUgxMUx6T2RFMkpmdU5KMXAvSm1rTzBN?=
 =?utf-8?B?KzNkZGdYZzJ4TEQ5WVFyU3ZYMmJyWTNQTzIxYWIvanJHVkI5TVBlYnU4d1ZI?=
 =?utf-8?B?aHlYdGJuMUxnR0pjRjAzUUVTVkNmZ2lVQTJsYi96ejE5VGJIUThKSjc3b0Yz?=
 =?utf-8?B?aC9XeS9aSkRUcElMM0FiRzhOQWFXckdJTEJqc1FWZTU4MTZpWjdZYmkxMUZQ?=
 =?utf-8?B?bWhWNHZVSXJwNVc0b3VFVHJPaVEyY0tDdzJXU2dOTFVZR2V4d0pDSTlSUjU5?=
 =?utf-8?B?T0J2SVFORDczeWdwa1hmY0J1MWJzQ1VISDRyN2tjUi9JTmlGWUplSHhRMmF4?=
 =?utf-8?B?Vk91UkVLZEhiZTJDTVZSREhYNlU4dzVkdmpnMXg2Z3hObFBCUTM3WFVYNEl1?=
 =?utf-8?B?QmRuS0tGUWtyVDlHRlNRSHlJMmVtMjg1cnRlbXVXVm9PdXFkaUhwaUVwaUZu?=
 =?utf-8?B?TEtGRkF4R05VWUl6NnBLd3oydTRJaVE1eDhha2FCMEFNUUwrOHUvYnJsQksv?=
 =?utf-8?B?OHFrak0wcGFpUDYxVEFQcEwyUEFzQ3E3cUxoQTV1QUNWdHZlMEZjbEtXNUUx?=
 =?utf-8?B?Y0pDSTVRSUpyazJoVm5pQWtwTGtoNEhrYnJuYnRnVm9XTm96bWl6ak9hK3hB?=
 =?utf-8?B?K3c1MXFHVDl5NEJ0dEk2eGNyc3JDVjV0QU8wbWJ1dWtpOFlHQkZyYUV2L05t?=
 =?utf-8?B?SGVMMGpmUEN4cGRlakFjb3VVL2xuUUFKRVV2WFcvUmpKdm5vQW1ZWk1uRndT?=
 =?utf-8?B?SW9pUGdMdGxyQjZnZXNDUTNyVjlSMjhFTEF4ang0TFhFa0dMdytUbWNHMG92?=
 =?utf-8?B?VWtMRk9VK1RNTXRLSGVqNSsvNGZZRGhPUGs5dStSSGlpR09DTDZnRHJyOExO?=
 =?utf-8?B?NjkvN2VSRUJiT0ZlT281VTM4QnlMd2lBdVFKeG9tTk9VaDl3eTdOUkw2Ykxj?=
 =?utf-8?B?OGtYSlVDRW9WWm1hdTl5cmFMUnFmeFBZRVZOcHZXMmJZVEp3QUVEWVR5cUpQ?=
 =?utf-8?B?UlI2RWhqUUpXY3hXWEkrMjRiNzgva2FhQkJZYWl4OE9WUERZNUJVbXB1c3Ex?=
 =?utf-8?B?ZTFZWmFEZXhYUE1VZWc4THkxbFU2TDVnQ1VVVHZWUWkybGFmZjNKTzBUc1BD?=
 =?utf-8?B?R3NQdUlhczhGeTNHOTE0YUpmWGVRa0FjSnZnMUY3OGlUb09VeXNkbTl5aDBD?=
 =?utf-8?B?bmZBUm94VmVGelZMVmdrdVNyQ2ZRTWhGTzBwT2pONi9QUjZwUFZVMm0xT1VZ?=
 =?utf-8?B?Sk5aN3VLNFMremxhYnRpUTZrUm02UjY5YnVKSXdRYlYyWnk1SXIvRHVnelN2?=
 =?utf-8?B?T0lqNFVxRFkvQmh3MCtnK3AwbXBDNEFncUEyMTJadTJ5QXAzQlZ0S0RRd0ZL?=
 =?utf-8?B?dDJ5eGxuZlBnclVRMERGYVY0UCtpNThpSDZyU25LR3pEd21Nb0dvRjVMNytu?=
 =?utf-8?B?bmpxQ1hkZ202SEFEbC9qT0o4dDhTaU1qenJEVHYwbytCTzJybUw3UlFwaVo2?=
 =?utf-8?B?MEFNWFplSG12UkF3U1pYdk0rUU5oWGVjcUhMOXVBbnFUaHVuWFA0eXBtREU1?=
 =?utf-8?B?eFFoMGgwOC8yZllvTWovdExRN0w3UnR1R0VwRU1kMGxVTmlRQy9kenB1Z0JS?=
 =?utf-8?B?NEdQVDNCRDN3eHZiUnNhV1B2ZWFYWXlvWkVXYi9vZ0U2N0pCNS9velV6THBs?=
 =?utf-8?B?Y3VFcHlyOTF2N1F0a084dUcwUTA1R21rK3M3ODYzTTlFTlNkQXJ3OUZoeFU0?=
 =?utf-8?B?QXhiRDJ0eTQ5N0RQL09PZG82QlFFZHhqUXZScDRtV3BUeTBNSGZwL3FCUHhB?=
 =?utf-8?B?ZU5DdzF6aE9HRzVQYnNxbDhvQ1ZxUU9lZERLZllPd0U5a09nY1BDdFQzTjBB?=
 =?utf-8?B?aDU3VGZsZ1M1dDFxcFJHMmVyNzI3U3A3Q2drYStTNVBuclBKb2xTaHpkUnRK?=
 =?utf-8?B?eDhLK2F0TVRPaXNlMUhOOFFKd1laSHU5TWt6QnJqWDRvRU9OSUFhZGZtdTFV?=
 =?utf-8?B?dlMrMGlyQUlWd3BmVlFLRFhaV1NaWHovdDhVV0Y1WXkreHZ4NTJWYUNZTkdO?=
 =?utf-8?B?TS9xa1RpSEFyQXF1UjdrOVJIYWN0ZC85dWIxS1RYWmdpZVRMSUE3ZHdFMUlF?=
 =?utf-8?Q?UoB21Imfg1jZKjuZzfoB+kb6LLvs+A9AexiabMzpYeLS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a14ab6-c84e-49d2-be1e-08db8836e71b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:02:39.8903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LF9IF5+lDdaIVhxB1wSqStu8FD1l4hjV8sY2uqYhz3f1Mh8jpaNcYNYqcUXYlzs1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6999
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

massive sorry for the delayed response, this mail felt totally through 
my radar without being noticed.

Am 17.07.23 um 19:24 schrieb Rodrigo Vivi:
> On Thu, Jun 29, 2023 at 02:10:58PM -0700, Welty, Brian wrote:
>> Hi Christian / Thomas,
>>
>> Wanted to ask if you have explored or thought about adding support in TTM
>> such that a ttm_bo could have more than one underlying backing store segment
>> (that is, to have a tree of ttm_resources)?

We already use something similar on amdgpu where basically the VRAM 
resources are stitched together from multiple backing pages.

That is not exactly the same, but it comes close.

>> We are considering to support such BOs for Intel Xe driver.
> They are indeed the best one to give an opinion here.
> I just have some dummy questions and comments below.
>
>> Some of the benefits:
>>   * devices with page fault support can fault (and migrate) backing store
>>     at finer granularity than the entire BO

We've considered that once as well and I even started hacking something 
together, but the problem was that at least at that point it wasn't 
doable because of limitations in the Linux memory management.

Basically the extended attributes used to control caching of pages where 
only definable per VMA! So when one piece of the BO would have been in 
uncached VRAM while another piece would be in cached system system 
memory you immediately ran into problems.

I think that issue is fixed by now, but I'm not 100% sure.

In general I think it might be beneficial, but I'm not 100% sure if it's 
worth the additional complexity.

Regards,
Christian.

> what advantage does this bring? to each workload?
> is it a performance on huge bo?
>
>>   * BOs can support having multiple backing store segments, which can be
>>     in different memory domains/regions
> what locking challenges would this bring?
> is this more targeting gpu + cpu? or only for our multi-tile platforms?
> and what's the advantage this is bringing to real use cases?
> (probably the svm/hmm question below answers my questions, but...)
>
>>   * BO eviction could operate on smaller granularity than entire BO
> I believe all the previous doubts apply to this item as well...
>
>> Or is the thinking that workloads should use SVM/HMM instead of GEM_CREATE
>> if they want above benefits?
>>
>> Is this something you are open to seeing an RFC series that starts perhaps
>> with just extending ttm_bo_validate() to see how this might shape up?
> Imho the RFC always help... a piece of code to see the idea usually draws
> more attention from devs than ask in text mode. But more text explaining
> the reasons behind are also helpful even with the RFC.
>
> Thanks,
> Rodrigo.
>
>> -Brian

