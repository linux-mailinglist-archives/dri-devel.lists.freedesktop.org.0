Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B8E56BE7A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 19:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF5C10E98F;
	Fri,  8 Jul 2022 17:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3A710E911;
 Fri,  8 Jul 2022 17:33:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oyv1W7+kJqMaI/GNjr1ibe3JJeFsfk4jQY0XQiQ8cjrWL9rcA+i0bTFX57xkLDz0RKPxKOQAqLv9FvJ2uIJ6+qV4ooSHWOQk6HDW0MtyWNa/42gnhrzKY5NFjEMJsH4ikBteFcUG+WumQNiIDnCYdACKSZc0SK8AIt3W9bDnKwgnQL2xP6e0O/iPn7A7DlDfOEBLxotdhD2upsXE61J/XmI31T1hrjHz+o9EKLoi4QX2VUBkNGGDDldyY8R6RcHTdZZN2XBIOOKhZIqH08TbYvzLhU0Dk8DniWQ+4zntW+jHOkixeCuhgE9Gs2/39rBD5pwtRK1z3JdxqVAxNGWHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc/c+lehQBuWeq7HTH4CWkMtg9sJCAgQPT/nd9BMf+8=;
 b=Tc6fcNfkFxIhx2kaancyH2REssUyx4uvTItkxhbxpd2Bh7RZ16BLTcuILO7ZRx2T6yYaUHHJJRJrJyEAp+g664BsoxszEaRyhxaICuI5RGum1TQLMB64k9BRUILAIYJfDcfjbSln4GEQWPTrEzxhtVQ0xwtwf/rvY6apctK/cKZnCRshfDds8/NiKFyTghtWUzCAxcyPH86mo3BcpRFCYf2v3b/leQoMyopW98g7GVT8cQYo4MGr+mj3aDAsZ05W9gZ3sZoIJHdgqAFMnzvgi1MT9pV6jsYc/u7a9z/1u4UvaAQrugO+hiJeQ4tkVUHg2cNIFX09VTH9tYoWUgqCBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yc/c+lehQBuWeq7HTH4CWkMtg9sJCAgQPT/nd9BMf+8=;
 b=1T/ZPaF0VA/god8labEIYkiG90M3bmEemrdPf7GCTsnHmrlULyY5R52/JChE/Scimub9ZNr4fcHD/RVmR7KXlnnlwe+kotEdrxxeJQhygKPADjKePuIg1f04iMhF235TV8rcb3deSd5rJQ1ssS9Hd1pX3UxAgusv78WEEeM5Bqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6487.namprd12.prod.outlook.com (2603:10b6:8:c4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Fri, 8 Jul
 2022 17:33:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 17:33:00 +0000
Message-ID: <0fe0fc02-1aed-242a-97be-8ec494a6f97b@amd.com>
Date: Fri, 8 Jul 2022 19:32:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC 03/10] drm/i915/vm_bind: Support private and shared BOs
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-4-niranjana.vishwanathapura@intel.com>
 <13a5c5ba-8860-512e-5e92-3f30beca2dc3@amd.com>
 <20220708132307.GV14039@nvishwa1-DESK>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220708132307.GV14039@nvishwa1-DESK>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0202CA0069.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::46) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71caadc1-0261-4b93-6a13-08da6107e78c
X-MS-TrafficTypeDiagnostic: DS0PR12MB6487:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oroVIsreTAFWhaCLaeDqCpXIbXqVVMbOGr3p0Wjxa+/afyTVRxcFxXwPSeMDA9wqRG+C3vtSGGDbYndZIt7fN6j+k8VyWi3XAQGDxDNzg8H4jgvH7R0iGTHXK2il8nevGYbIy4PkOHAnt48rX194k5z7ExH1tTTW6dGW26BNgJLmISEvz+LFbLpD6etzvQP3tRBlqWBJ6r4IWxbx5bV4lyf3uHyjV/vpm0hrkWG44xdM8CpH7ii/TzYw2C7D3GbDV48jb7Dz3p33GA/sBCtCE90RcoybtBVRkHpJikiHuw8CiqvUZDF8rCloBZaa87NYVugyOmUb7w6TvBrSkU92WF4s48Y6lXTQJNzgXLxaP+/y0xUNdiOHQWVn5TSBPQPFnZMHCMNSEon+BKSAez9mbsFiwPYI3iOh8OA75SrWnZUIV2AoSEkdKis9lyxrIlonwR5m3tvjY7ZFug/qsReKzagUPyhxJwkyIIssBKfsTHz2RQSpUIJhz+bwfuwynbF0OsPoj7TwrTAf9D3DyAAaDgh/1k9pmui05XwdnPOFCacaLlEv+Sg2b5Uz5EKYjsPL1quf88TT1w06uBpW4AAbVbteyx587feVNZceZ4zPgwC4LUWDgwE1KE3yKnLMQYLhFDi1iMQ/l0LHfmWMjLPt9wRNX6cgegJzikHmRCd0aoxaigyCdw66sIYVSH1Z1raE4bgi29sQmKHyi7rDPFs9qSlPMATW+rkNrDBHHn4m1nHZiD//vzMFqnEwxtDociNEsRJm8L29fY8tZ2BbYsXtLXXth8HZ4RvaiI2Dv0r6NnBAbeptvhrcbbY6bTLceImrBqTgYLorMEpwpsgUVE7FWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(30864003)(86362001)(6666004)(31696002)(6506007)(8676002)(6512007)(2616005)(66476007)(66946007)(7416002)(83380400001)(478600001)(6486002)(5660300002)(2906002)(186003)(8936002)(41300700001)(38100700002)(66574015)(31686004)(36756003)(4326008)(6916009)(66556008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVhUkp0dkZZdk9rZ1h3Q1lPWWlQam5GQ1QxNUkxd3FQNWgxSERPbGp2Z2RL?=
 =?utf-8?B?cEY3ZnF3U0ZxQkhuenN5UUNmS3Y2OTJXMU1kWjU0REtlNERTcjdJK0tTSk5o?=
 =?utf-8?B?em55TUI1c3lsZHhrT1I5YkJSSC9zOU0yL3lNRXlsWXdBems3UDZpMTRweDNt?=
 =?utf-8?B?NjlyNGE1QWd4QXRoWHoxc3RqK2VPYWtEaWJoS2RDUVZnKytWc1g5SkgzUWx3?=
 =?utf-8?B?SFhmdEFIeG5LdUlINktva1J3dFJNdDd6cTVkMDU2RjExUTQ2VVhSdEhUK0Qr?=
 =?utf-8?B?NjRhMlcxY0d0UnVpSmVVU1JBQ25rSkJhUUdHQ2haWHRha1RQaWdOemFZbDBi?=
 =?utf-8?B?cmZIVW51NlhzbnptQkhmQmFWcWxxUlp4eVpuZ0c0MHM0KzFWdldFbkEyaUMx?=
 =?utf-8?B?a0szVStOM0pkNVZJTUlITEdRNDVoOW9tKzg1NEF2OHdGanBGRnlvTDEwNWI1?=
 =?utf-8?B?KytXaGVVb2p0Mzh6N0JnZjUvaTdNQ3JsaHJEb3VqZSs4U0t3dlZBbXQ2WGhM?=
 =?utf-8?B?YUlDYmpZaUVwcENrcUx2QTdNeVhuVmcvTzVLUmoyeXFMaVJpcytnMUFKa01a?=
 =?utf-8?B?bjZsczhOT2wxNmpqODZ5N0x4OTNWVlFHZ2o4MDUyZDU0Y0UwOXpDYkxiQkR4?=
 =?utf-8?B?d1pYTzROWm1SWDZ6ZUh6eFFRbzc5aGZycFhxK0c2WEw0S2UzSWJQVGxNcmtz?=
 =?utf-8?B?RmQ2QW9KTGY2aXg1cEl5QXRlYklBcEo4aDEvRHNJb0FhRktsMHNEbi9Zb2VJ?=
 =?utf-8?B?RjNOQU1DdHhHaXdNQnUxVlNZaUhsWG1waHVGVWFHQ1ZZeWY2c2h5Q0VrSDNQ?=
 =?utf-8?B?dDNlN2o2SmVxdGVLYWZSRnEvN3hCZUZiaWIvNjJpem5hbVozS3hET2ZzcEE3?=
 =?utf-8?B?OWJ3TFMwTnJVM0NQOVJvdjNWT0FGZWxNNWc1TzgyWE1ZTHJKVXBLZ00wYXE4?=
 =?utf-8?B?cmk1dUpCcjFST1YzVHcwRngyc0srdWRVbWQwUXhQWExNR1h3bXkwSkIzdnpp?=
 =?utf-8?B?eFl5S1RISVliaWk0SlE5WnZ0aUVWSWRvYjFkUm05RlhXSDRRNDh6NWJIMzRo?=
 =?utf-8?B?RHBwMy9xZUE5MlVLUElkRGp6TUpEc3k0TDhHRG5VeGxkL3hiZkI1N2prQUsw?=
 =?utf-8?B?NENibWdPMmdmdnV3ZzAvVlBkTXpoK1ZYSXdNN3BpQmFqT29VN24rYk5JbzhF?=
 =?utf-8?B?SzdRakVodGdvRmRtMnhIY3VQOEw1QnBCaUNnaHN0UnN3L0ZDVFpPOVRlL3dS?=
 =?utf-8?B?TnNUZkZLN0lPR0MydittMlZYM0lKaEZnYnRoY2hURFFXQVNaMG9EbFhqQjVV?=
 =?utf-8?B?OUJremtRcElLZWhiT0FaZEJJa2VlZzVBU01VZEhBM0xPU3Y2bysxWFowUmIv?=
 =?utf-8?B?bEYyaHlrUmIxZy9SbU1HSWd3UEJMbjRWVWFHbnMvdG1aVjMyZERQUmFNSkZC?=
 =?utf-8?B?WVZYZEFjS3gzdzlYMnA0OW5qV2JLRlJrTFlBSEp0cDArQ2xZSXhFWXJZZ2Uv?=
 =?utf-8?B?ejY3MWJrZUZqckwvWmdoOE1QL1M2andMK0tDM0tPb0RqWS9PSmduS2F0emYy?=
 =?utf-8?B?Q1ZjZEJUSlByYzJBM05HR21UZ0RDRXArQ3ZZd2Y5K1QzeWdNZ3ByOS83VjE4?=
 =?utf-8?B?bzdYZXlZd05ZNUxvTHpxdkN1YmlaL0dLVDYwQktxMkt3NUl3TTJ2NTdMeFlp?=
 =?utf-8?B?OW5vUmdLSUpQcDRROTdsdUwrQmozU0ZzNUNkNTVWRnpwOVNaNDVkWmdYMzJZ?=
 =?utf-8?B?V21OTmVKZlNIVHZDS1l2bEF1amg2ODR1WVR5TUdySGo2V0V3VGRtY2kwSkg2?=
 =?utf-8?B?bEVFWmJVWjQxeWVXRnBUVEtpVjkwZzArQjlpZG9Zd2kyb2liVXp5aU04VnlX?=
 =?utf-8?B?aWdNaWtWYkJtbnZXa0hnT3hMUlljN2ZQTXd4dEprcWQ1YzZtUDFuUGNQcWNh?=
 =?utf-8?B?T2F1THV4UUdINjZlUmhxMDdMcW9aenZIWWtUYm1pZlNJUVVoSHlCemJNN2xR?=
 =?utf-8?B?YjVSemRmWDFUemwwYVllQWxJQ3RFZmh4Q2VPV0p4eWY2WVZEbitSSERLNHZD?=
 =?utf-8?B?N3FoK2tmL2tyYzJMWmtxZEpjOVp4ZG80L0FmU1pMRWFVY0V5ZHdieWlNTWVy?=
 =?utf-8?B?SEFsWkdHbkhBRThzUGp4clhpWVhWY0JPU2x2elZtTFZidWYwSjRQcU9iOGZo?=
 =?utf-8?Q?q6UUOtL7Yn+VSk61jYBu3VmtLmjdYPa/99Yln+Kba80a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71caadc1-0261-4b93-6a13-08da6107e78c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 17:33:00.7656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQlUve+gDhAVAgbm6B9KsDVvXERhlb2WsseDjkMV3zZzYTRCW8lmkANxkSn26nLd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6487
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, dri-devel@lists.freedesktop.org,
 jason@jlekstrand.net, daniel.vetter@intel.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.22 um 15:23 schrieb Niranjana Vishwanathapura:
> On Thu, Jul 07, 2022 at 03:27:43PM +0200, Christian König wrote:
>> Am 02.07.22 um 00:50 schrieb Niranjana Vishwanathapura:
>>> Add uapi allowing user to specify a BO as private to a specified VM
>>> during the BO creation.
>>> VM private BOs can only be mapped on the specified VM and can't be
>>> dma_buf exported. VM private BOs share a single common dma_resv object,
>>> hence has a performance advantage requiring a single dma_resv object
>>> update in the execbuf path compared to non-private (shared) BOs.
>>
>> Sounds like you picked up the per VM BO idea from amdgpu here :)
>>
>> Of hand looks like a good idea, but shouldn't we add a few comments 
>> in the common documentation about that?
>>
>> E.g. something like "Multiple buffer objects sometimes share the same 
>> dma_resv object....." to the dma_resv documentation.
>>
>> Probably best as a separate patch after this here has landed.
>
> :)
> Sounds good. Probably we need to update documentation of
> drm_gem_object.resv and drm_gem_object._resv here, right?

Yes, I would also add a word or two to the dma_resv object. Something 
like "Multiple buffers are sometimes using a single dma_resv object..."

Christian.

>
> Doing it in a separate patch after this series lands sounds good to me.
>
> Thanks,
> Niranjana
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 41 ++++++++++++++++++-
>>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  6 +++
>>>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 ++
>>>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  3 ++
>>>  drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h   | 11 +++++
>>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  9 ++++
>>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  4 ++
>>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +
>>>  drivers/gpu/drm/i915/i915_vma.c               |  1 +
>>>  drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
>>>  include/uapi/drm/i915_drm.h                   | 30 ++++++++++++++
>>>  11 files changed, 110 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> index 927a87e5ec59..7e264566b51f 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>> @@ -11,6 +11,7 @@
>>>  #include "pxp/intel_pxp.h"
>>>  #include "i915_drv.h"
>>> +#include "i915_gem_context.h"
>>>  #include "i915_gem_create.h"
>>>  #include "i915_trace.h"
>>>  #include "i915_user_extensions.h"
>>> @@ -243,6 +244,7 @@ struct create_ext {
>>>      unsigned int n_placements;
>>>      unsigned int placement_mask;
>>>      unsigned long flags;
>>> +    u32 vm_id;
>>>  };
>>>  static void repr_placements(char *buf, size_t size,
>>> @@ -392,9 +394,24 @@ static int ext_set_protected(struct 
>>> i915_user_extension __user *base, void *data
>>>      return 0;
>>>  }
>>> +static int ext_set_vm_private(struct i915_user_extension __user *base,
>>> +                  void *data)
>>> +{
>>> +    struct drm_i915_gem_create_ext_vm_private ext;
>>> +    struct create_ext *ext_data = data;
>>> +
>>> +    if (copy_from_user(&ext, base, sizeof(ext)))
>>> +        return -EFAULT;
>>> +
>>> +    ext_data->vm_id = ext.vm_id;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>  static const i915_user_extension_fn create_extensions[] = {
>>>      [I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>>>      [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
>>> +    [I915_GEM_CREATE_EXT_VM_PRIVATE] = ext_set_vm_private,
>>>  };
>>>  /**
>>> @@ -410,6 +427,7 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>> *dev, void *data,
>>>      struct drm_i915_private *i915 = to_i915(dev);
>>>      struct drm_i915_gem_create_ext *args = data;
>>>      struct create_ext ext_data = { .i915 = i915 };
>>> +    struct i915_address_space *vm = NULL;
>>>      struct drm_i915_gem_object *obj;
>>>      int ret;
>>> @@ -423,6 +441,12 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>> *dev, void *data,
>>>      if (ret)
>>>          return ret;
>>> +    if (ext_data.vm_id) {
>>> +        vm = i915_gem_vm_lookup(file->driver_priv, ext_data.vm_id);
>>> +        if (unlikely(!vm))
>>> +            return -ENOENT;
>>> +    }
>>> +
>>>      if (!ext_data.n_placements) {
>>>          ext_data.placements[0] =
>>>              intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
>>> @@ -449,8 +473,21 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>> *dev, void *data,
>>>                          ext_data.placements,
>>>                          ext_data.n_placements,
>>>                          ext_data.flags);
>>> -    if (IS_ERR(obj))
>>> -        return PTR_ERR(obj);
>>> +    if (IS_ERR(obj)) {
>>> +        ret = PTR_ERR(obj);
>>> +        goto vm_put;
>>> +    }
>>> +
>>> +    if (vm) {
>>> +        obj->base.resv = vm->root_obj->base.resv;
>>> +        obj->priv_root = i915_gem_object_get(vm->root_obj);
>>> +        i915_vm_put(vm);
>>> +    }
>>>      return i915_gem_publish(obj, file, &args->size, &args->handle);
>>> +vm_put:
>>> +    if (vm)
>>> +        i915_vm_put(vm);
>>> +
>>> +    return ret;
>>>  }
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> index f5062d0c6333..6433173c3e84 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> @@ -218,6 +218,12 @@ struct dma_buf *i915_gem_prime_export(struct 
>>> drm_gem_object *gem_obj, int flags)
>>>      struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
>>>      DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>>> +    if (obj->priv_root) {
>>> +        drm_dbg(obj->base.dev,
>>> +            "Exporting VM private objects is not allowed\n");
>>> +        return ERR_PTR(-EINVAL);
>>> +    }
>>> +
>>>      exp_info.ops = &i915_dmabuf_ops;
>>>      exp_info.size = gem_obj->size;
>>>      exp_info.flags = flags;
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> index 5cf36a130061..9fe3395ad4d9 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>> @@ -241,6 +241,9 @@ struct drm_i915_gem_object {
>>>      const struct drm_i915_gem_object_ops *ops;
>>> +    /* Shared root is object private to a VM; NULL otherwise */
>>> +    struct drm_i915_gem_object *priv_root;
>>> +
>>>      struct {
>>>          /**
>>>           * @vma.lock: protect the list/tree of vmas
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index 7e1f8b83077f..f1912b12db00 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -1152,6 +1152,9 @@ void i915_ttm_bo_destroy(struct 
>>> ttm_buffer_object *bo)
>>>      i915_gem_object_release_memory_region(obj);
>>>      mutex_destroy(&obj->ttm.get_io_page.lock);
>>> +    if (obj->priv_root)
>>> +        i915_gem_object_put(obj->priv_root);
>>> +
>>>      if (obj->ttm.created) {
>>>          /*
>>>           * We freely manage the shrinker LRU outide of the mm.pages 
>>> life
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>> index 642cdb559f17..ee6e4c52e80e 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind.h
>>> @@ -26,6 +26,17 @@ static inline void i915_gem_vm_bind_unlock(struct 
>>> i915_address_space *vm)
>>>      mutex_unlock(&vm->vm_bind_lock);
>>>  }
>>> +static inline int i915_gem_vm_priv_lock(struct i915_address_space *vm,
>>> +                    struct i915_gem_ww_ctx *ww)
>>> +{
>>> +    return i915_gem_object_lock(vm->root_obj, ww);
>>> +}
>>> +
>>> +static inline void i915_gem_vm_priv_unlock(struct 
>>> i915_address_space *vm)
>>> +{
>>> +    i915_gem_object_unlock(vm->root_obj);
>>> +}
>>> +
>>>  struct i915_vma *
>>>  i915_gem_vm_bind_lookup_vma(struct i915_address_space *vm, u64 va);
>>>  void i915_gem_vm_bind_remove(struct i915_vma *vma, bool release_obj);
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c 
>>> b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>> index 43ceb4dcca6c..3201204c8e74 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_vm_bind_object.c
>>> @@ -85,6 +85,7 @@ void i915_gem_vm_bind_remove(struct i915_vma *vma, 
>>> bool release_obj)
>>>      if (!list_empty(&vma->vm_bind_link)) {
>>>          list_del_init(&vma->vm_bind_link);
>>> +        list_del_init(&vma->non_priv_vm_bind_link);
>>>          i915_vm_bind_it_remove(vma, &vma->vm->va);
>>>          /* Release object */
>>> @@ -185,6 +186,11 @@ int i915_gem_vm_bind_obj(struct 
>>> i915_address_space *vm,
>>>          goto put_obj;
>>>      }
>>> +    if (obj->priv_root && obj->priv_root != vm->root_obj) {
>>> +        ret = -EINVAL;
>>> +        goto put_obj;
>>> +    }
>>> +
>>>      ret = i915_gem_vm_bind_lock_interruptible(vm);
>>>      if (ret)
>>>          goto put_obj;
>>> @@ -211,6 +217,9 @@ int i915_gem_vm_bind_obj(struct 
>>> i915_address_space *vm,
>>>      list_add_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>>      i915_vm_bind_it_insert(vma, &vm->va);
>>> +    if (!obj->priv_root)
>>> +        list_add_tail(&vma->non_priv_vm_bind_link,
>>> +                  &vm->non_priv_vm_bind_list);
>>>      /* Hold object reference until vm_unbind */
>>>      i915_gem_object_get(vma->obj);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> index 135dc4a76724..df0a8459c3c6 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>> @@ -176,6 +176,7 @@ int i915_vm_lock_objects(struct 
>>> i915_address_space *vm,
>>>  void i915_address_space_fini(struct i915_address_space *vm)
>>>  {
>>>      drm_mm_takedown(&vm->mm);
>>> +    i915_gem_object_put(vm->root_obj);
>>>      GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>>>      mutex_destroy(&vm->vm_bind_lock);
>>>  }
>>> @@ -289,6 +290,9 @@ void i915_address_space_init(struct 
>>> i915_address_space *vm, int subclass)
>>>      INIT_LIST_HEAD(&vm->vm_bind_list);
>>>      INIT_LIST_HEAD(&vm->vm_bound_list);
>>>      mutex_init(&vm->vm_bind_lock);
>>> +    INIT_LIST_HEAD(&vm->non_priv_vm_bind_list);
>>> +    vm->root_obj = i915_gem_object_create_internal(vm->i915, 
>>> PAGE_SIZE);
>>> +    GEM_BUG_ON(IS_ERR(vm->root_obj));
>>>  }
>>>  void *__px_vaddr(struct drm_i915_gem_object *p)
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h 
>>> b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> index d4a6ce65251d..f538ce9115c9 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>> @@ -267,6 +267,8 @@ struct i915_address_space {
>>>      struct list_head vm_bound_list;
>>>      /* va tree of persistent vmas */
>>>      struct rb_root_cached va;
>>> +    struct list_head non_priv_vm_bind_list;
>>> +    struct drm_i915_gem_object *root_obj;
>>>      /* Global GTT */
>>>      bool is_ggtt:1;
>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c 
>>> b/drivers/gpu/drm/i915/i915_vma.c
>>> index d324e29cef0a..f0226581d342 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>> @@ -236,6 +236,7 @@ vma_create(struct drm_i915_gem_object *obj,
>>>      mutex_unlock(&vm->mutex);
>>>      INIT_LIST_HEAD(&vma->vm_bind_link);
>>> +    INIT_LIST_HEAD(&vma->non_priv_vm_bind_link);
>>>      return vma;
>>>  err_unlock:
>>> diff --git a/drivers/gpu/drm/i915/i915_vma_types.h 
>>> b/drivers/gpu/drm/i915/i915_vma_types.h
>>> index b6d179bdbfa0..2298b3d6b7c4 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma_types.h
>>> +++ b/drivers/gpu/drm/i915/i915_vma_types.h
>>> @@ -290,6 +290,8 @@ struct i915_vma {
>>>      struct list_head vm_link;
>>>      struct list_head vm_bind_link; /* Link in persistent VMA list */
>>> +    /* Link in non-private persistent VMA list */
>>> +    struct list_head non_priv_vm_bind_link;
>>>      /** Interval tree structures for persistent vma */
>>>      struct rb_node rb;
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index 26cca49717f8..ce1c6592b0d7 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -3542,9 +3542,13 @@ struct drm_i915_gem_create_ext {
>>>       *
>>>       * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
>>>       * struct drm_i915_gem_create_ext_protected_content.
>>> +     *
>>> +     * For I915_GEM_CREATE_EXT_VM_PRIVATE usage see
>>> +     * struct drm_i915_gem_create_ext_vm_private.
>>>       */
>>>  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
>>>  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
>>> +#define I915_GEM_CREATE_EXT_VM_PRIVATE 2
>>>      __u64 extensions;
>>>  };
>>> @@ -3662,6 +3666,32 @@ struct 
>>> drm_i915_gem_create_ext_protected_content {
>>>  /* ID of the protected content session managed by i915 when PXP is 
>>> active */
>>>  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
>>> +/**
>>> + * struct drm_i915_gem_create_ext_vm_private - Extension to make 
>>> the object
>>> + * private to the specified VM.
>>> + *
>>> + * See struct drm_i915_gem_create_ext.
>>> + *
>>> + * By default, BOs can be mapped on multiple VMs and can also be 
>>> dma-buf
>>> + * exported. Hence these BOs are referred to as Shared BOs.
>>> + * During each execbuf3 submission, the request fence must be added 
>>> to the
>>> + * dma-resv fence list of all shared BOs mapped on the VM.
>>> + *
>>> + * Unlike Shared BOs, these VM private BOs can only be mapped on 
>>> the VM they
>>> + * are private to and can't be dma-buf exported. All private BOs of 
>>> a VM share
>>> + * the dma-resv object. Hence during each execbuf3 submission, they 
>>> need only
>>> + * one dma-resv fence list updated. Thus, the fast path (where 
>>> required
>>> + * mappings are already bound) submission latency is O(1) w.r.t the 
>>> number of
>>> + * VM private BOs.
>>> + */
>>> +struct drm_i915_gem_create_ext_vm_private {
>>> +    /** @base: Extension link. See struct i915_user_extension. */
>>> +    struct i915_user_extension base;
>>> +
>>> +    /** @vm_id: Id of the VM to which the object is private */
>>> +    __u32 vm_id;
>>> +};
>>> +
>>>  /**
>>>   * struct drm_i915_gem_vm_bind - VA to object mapping to bind.
>>>   *
>>

