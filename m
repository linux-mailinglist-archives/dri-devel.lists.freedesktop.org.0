Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E615811462
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 15:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3239410E2C4;
	Wed, 13 Dec 2023 14:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A80910E2C4;
 Wed, 13 Dec 2023 14:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/29kFfB6bPbypQGvk7CFKogbsxNRqzy6dl6k/NUfiglGLeTVaEGfZaYaG3WkxmMD1NFAZe9gwmsa41lTzUisjJ6WNpo+zyPE5rposaEyYkw4uzKW7yOAdYhdAxu+I4x3yDHEWH/aoxjRskWaq6a0lFsWoDqhu7j02W3JhIRLi2+LhcwnaE95+9oVDH5ul0o62Lh8ERxxYvbNx9pn8da4z3SeVD8/PJI9amHGY6XAIc33WRj6x8Vn7lydcF0/Pn89Bgk8KSqrxbzaZs7zkXfWEk8E1AQ5MR58WgI8YYJkYlXLjKx0YcuKEnpqWVW3muZd+R34V3+LrxQUnDrF7lucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyFKaOWMQY9iofJCLL8GyRsls28tVaP91EI/ChS9hOw=;
 b=NrseGh05XcE+djUD2545HxXb0G76zlCaVcJPbnK2O7i+MbxKw4LT+eaLKiqRDk6TNSz4Aiomm5smiVxlOhsMG5eB6Srpczc0pAJkkiuVCHU+7EiPzKY1B4ZziGE4snvh7C405oKx9I78RinFPTcPIP0xmlj8DC23uxD7psWNdxajCcXzdSdcg26TaH5Lme+PS5GO9a+2Rll26Z2MzWZAHXbBhnnMjbzgeBPEwORP7pAWJvT6uTSY0D/GB1vDrT44nML4JaFRgIEmlo4lYOh5S0f2EbssP/NFU4Z3DGtXNLbE2RTJu71iN9VwpIsALQYoaO/kMyaXapXH73CGsjAi5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyFKaOWMQY9iofJCLL8GyRsls28tVaP91EI/ChS9hOw=;
 b=FxYBWGFJlsspfIAaIzEpgISxlDuNIdJVQuozqmsurGYSRg5GEAXzyly6nHTNa8fufkwQjZO2cnOccPMwnGehqjM2ZE8YBOtmVbjFdZ6dK37BnfRuAlEUbxM3IV0I6RUmPK6qx8T6mssKL1Qglq+ndy/fFRb3SeqepI5xBN0M9sY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM8PR12MB5398.namprd12.prod.outlook.com (2603:10b6:8:3f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26; Wed, 13 Dec 2023 14:13:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 14:13:53 +0000
Message-ID: <ae9bc39c-1724-4946-9227-ea74f05ea89e@amd.com>
Date: Wed, 13 Dec 2023 15:13:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/i915: Allow dmabuf mmap forwarding
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230925131638.32808-1-tvrtko.ursulin@linux.intel.com>
 <4da147e7-44bf-4d19-952d-fa3bab141f71@linux.intel.com>
 <26b9d5bf-f895-4237-85fe-04f53040c26c@amd.com>
 <7387ea98-5854-45cc-a6c5-70cfe0febb3a@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7387ea98-5854-45cc-a6c5-70cfe0febb3a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM8PR12MB5398:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e143c8-d3e4-44d0-7f68-08dbfbe5bc9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b/zHA/DZbSewW6YWJCnFR06L7HfJVjvOzDYEwM6NCyrLd5JHJ3UeZKWdl0IWzFqCq0SDPBMaUW3wFC2tmL+YSlbfdspJxYeeB5wzpWrOIHJSxUuIKOojMcjE1BMf4fqC5ZnXTQVUJg0gp4Xc5xTp9fsoMLvIwRF78ZSnj566Vt0PwOVWxQkJVds5S/xu6EW+vbwQo0vawjc+Y8W3d9W1tKqeZB8fRozSUcPOqNbrpr5Xtszs2i/7PZXVMrTNh9JUj/Zs0reKrCXULQuKg99NlS/L4po6hsQmoozHfsc3zkqpVhFOOyvp3p9tqGw8qVtQGl3MWWcMFltd+yQhL36Vlb4UrIO2BeOpsJsLovp+uP1bcjRSAl1uWW4vZWLCcr3D576Xovb69hAeFbu+ooWJ7bCF5ufWow79M+eseBGjKSHPh97qFmitRWXj5AwekYJzC493YwtqNdfISKLxVkHSSLM7axGK0H8jMXm0z/oLAUXb9hjldaj+SlTLwxT6Uu0pRpiGCQpltttvqB20UMMw3SNkL0DSYilNgyM16uYoX2b1PcDQ4dFvoL9H0E5n7vyP3qLcBIi+hKTHNTmd4KCzI71ui9pHj46Egu2iM2VCqxxKJyOSlvjV4EI2oaD5Ac9DKlOSgO3xSpbg64GWjls/BA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(26005)(66574015)(6666004)(478600001)(6486002)(6512007)(2616005)(6506007)(53546011)(41300700001)(4326008)(8936002)(8676002)(38100700002)(5660300002)(31686004)(30864003)(36756003)(2906002)(66476007)(66556008)(31696002)(66946007)(86362001)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0IvbGZJdWdBOHdtWTJHY0hLWXU1K08vT1ZsUzNnMjQ5ei9IWjcxN3JnNmF0?=
 =?utf-8?B?aWdTelE3TTZTSGtHMDNqWmJlZWhhTHRJcVNwbW43NHdEci8wN2pLQ0Z1ay9Z?=
 =?utf-8?B?WldOQ0NFNmYwM3VQbDZZd2FwWFNwd1ROU0IzY2NVekJFVlNzNUNYUDVqWlRa?=
 =?utf-8?B?SkovQ0tNSEdYL2NLSWIrT0trMTFBcjhrejRRUUhoeDQvWTJRTDJnREUyaFNN?=
 =?utf-8?B?bStFL01KdG10REhuTW43YVlJU0FadEdLRW1sbThPY2FQSER6QW5sRE8yQWV5?=
 =?utf-8?B?czk0eUFDNGlrVmo2QkkwRjJwdEU1NFdXbjdmM1lPbWovRmNQVm1FTm16Z3B0?=
 =?utf-8?B?aWFrMW9KRCs5em9GTTlBenVxbHJxVTloNjZKWC9CTXBqZTBWM3NiRUxlQTU0?=
 =?utf-8?B?REczd3Qva2xqWm5mZmxUM3o2ZEVWVmIzMTVTU3hTMml2ckFZR0Z3bkZDU09Z?=
 =?utf-8?B?Nm13QmFncDFIOWhzaWtaWFlUc2pud0JqRHlaOWZtNldCQWFXc1JXS1MyMXFL?=
 =?utf-8?B?OGRUVXJZTk9uWTJrNVBnQ0pUSnhPSTA3bFpxVThEV1luVktvcGJCUkl4TjR2?=
 =?utf-8?B?QkxzTS9yL2FqYmUrdHQ4WU1wSDhpZkdNbHltRkd2WEtialRSY1Boc2JQUjV4?=
 =?utf-8?B?M0ZZWlg1UWpiWkFCeStnb29WYzl2WU1XRUNsZDN4MzZjYm81TWdvQzJnODBM?=
 =?utf-8?B?RVZrYzMvNURIZUFjd3FuN1ZUYTY2OWFuQVRjc3BMbEIxdjF2aGF2MEJiTFdi?=
 =?utf-8?B?aXBVTUh0VnBwaGY1MEhDYXF4K1gvYldTWm1VT0ZlSG5FZzRqWW0wTVM0ak9B?=
 =?utf-8?B?dmk4djVWeFRLK1dFR0Z4NlVpZ2FXbWltRzd3QWJnY2xqQUJsU3ZRQi9LQmk0?=
 =?utf-8?B?SDF1di9HaS93d1hlazFVdnB5SzQ1TFo1bEx2blRvM09rQUFpcC95KzBoNEFs?=
 =?utf-8?B?aDBtbExOU2NDSVFtb1BGVnZPK0lCbDc3UDRJUnZtNitlelk0RlFhUE0rcXB0?=
 =?utf-8?B?RjRCdlIzM1ZWN2syeTZaSGFXMVRpbkZDNGg5czhGNWFBRFBZSmtmajB2TmVQ?=
 =?utf-8?B?c3pwSVp6TysxZmZGSFJLZHBpWXhPOE1TLy9yQ2hjYjA0c2NDNHUzY2VGVndQ?=
 =?utf-8?B?WHRyOHo2RHUwKzhyTytlcW1YcEozVjBsejhjN05waEpkRmVuY1M4anJNOU44?=
 =?utf-8?B?SXc3MWZzWThKM3o2UTFaL2d2c1R0UWxaZHQ1bmlUYnZGQUQzRkhuN1VVTHpC?=
 =?utf-8?B?SFh4bERNQXcwM2NISnBtNkFkdE1MQTlWcEQvMHh6YzU1TDZhODBHZkVqRTcy?=
 =?utf-8?B?eCtWczZCS0M2MWRPRi9wZVZId25Ocm9ISEQ4YUhhNGNETzVVUnRoZDlvMHpr?=
 =?utf-8?B?bVMrYUVGMmlsZHdQRzVFeFZmck05NG5Od05seEw0b1k2U3o0alJRNTRYUjlj?=
 =?utf-8?B?UXQ1ZEIzT293OFNXTDZDaGhVaTRIaG4rdWNKVU1BQ24rTFl2eXNhU2JEdDZj?=
 =?utf-8?B?emwxcEdsMkRVYllYaGVHMURIOThhWUFlNXVWQnU4ekhCc2RpdStVNXJqWEdi?=
 =?utf-8?B?a21mcVNvRndqNUNBa21EYzFUbFhJRFJOVTNXaTVzSlBNbjlCaUxyN3ZPRG9y?=
 =?utf-8?B?bS8wbEpHUjQ1NUZ4Zkk4ZHgvSS9jMFNnT1RtcjRMcUMwcXhEc1JqMUFXTWRZ?=
 =?utf-8?B?cnJyUGJoR09OeGsvc0hOOHA5RUxuUkhMVFVEU05MZ2lMa3A0QklSVnQxRWp6?=
 =?utf-8?B?T2RGdEt4emF1M2JEdE5YQzZTVThkQks1YWp3WGpNWlUzeWMyN3dvVHY0STFO?=
 =?utf-8?B?ZTFWR1VyM3pGa21OazIwYTJKK09yQlF5TGlpdGRsVkFLZWRwdFAxekJ5a2kx?=
 =?utf-8?B?MkplNnFMNW81VE9TZFJMMVBGQlE2eCtobTNjb1lSSDN1dHJLbHpHRVJLUjc0?=
 =?utf-8?B?YjBDdVZZbW50bHZwOGJvblY1N0crdFpFekxHbFVuenl5UWxpK2tpbm1LWHlG?=
 =?utf-8?B?aVlzTlA5RHF3Vm5YYXJZUXZIR2RDa21xRTVSK2ZZZCtEOFZyVFBiNys3WHpL?=
 =?utf-8?B?dFVOVCs4dnVCcHo4WjJiV2hjVFFmV3J0SUhreG45RWpzQ1dXZVQvTlVIR3l1?=
 =?utf-8?Q?P2od9tWRfnCwz3gRuvzqx+V5U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e143c8-d3e4-44d0-7f68-08dbfbe5bc9f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 14:13:53.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgWoIaqcayIcz4fASwLPnCFxw29vJJCi4ssOS7MYltK+WZ7LpVf/kPbjS9TH+xOA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5398
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.12.23 um 12:46 schrieb Tvrtko Ursulin:
>
> Hi,
>
> On 12/12/2023 14:10, Christian König wrote:
>> Hi Tvrtko,
>>
>> Thanks for pointing this mail out once more, I've totally missed it.
>
> That's okay, if it was really urgent I would have re-raised the thread 
> earlier. :) As it stands so far it is only about acceptance test 
> suites failing and no known real use cases affected.
>
>> Am 12.12.23 um 11:37 schrieb Tvrtko Ursulin:
>>>
>>> On 25/09/2023 14:16, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Allow mmap forwarding for imported buffers in order to allow 
>>>> minigbm mmap
>>>> to work on aperture-less platforms such as Meteorlake.
>>>>
>>>> So far i915 did not allow mmap on imported buffers but from minigbm
>>>> perspective that worked because of the DRM_IOCTL_I915_GEM_MMAP_GTT 
>>>> fall-
>>>> back would then be attempted, and would be successful.
>>>>
>>>> This stops working on Meteorlake since there is no aperture.
>>>>
>>>> Allow i915 to mmap imported buffers using forwarding via 
>>>> dma_buf_mmap(),
>>>> which allows the primary minigbm path of 
>>>> DRM_IOCTL_I915_GEM_MMAP_OFFSET /
>>>> I915_MMAP_OFFSET_WB to work.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>>> ---
>>>> 1)
>>>> It is unclear to me if any real userspace depends on this, but 
>>>> there are
>>>> certainly compliance suites which fail.
>>
>> Well that is actually intentional, but see below.
>>
>>>>
>>>> 2)
>>>> It is also a bit unclear to me if dma_buf_mmap() is exactly 
>>>> intended for
>>>> this kind of use. It seems that it is, but I also found some old 
>>>> mailing
>>>> list discussions suggesting there might be some unresolved questions
>>>> around VMA revocation.
>>
>> I actually solved those a few years back by introducing the 
>> vma_set_file() function which standardized the dance necessary for 
>> the dma_buf_mmap() function.
>>
>>>>
>>>> 1 + 2 = RFC for now.
>>>>
>>>> Daniel and Christian were involved in 2) in the past so comments would
>>>> be appreciated.
>>>
>>> Any comments on this one? I don't have all the historical knowledge 
>>> of when this was maybe attempted before and what problems were hit, 
>>> or something. So would there be downsides or it is fine to forward it.
>>
>> It works technically inside the kernel and Thomas Zimmerman suggested 
>> a patch set which made it possible to use for all DRM drivers.
>>
>> But IIRC this patch set was rejected with the rational that while 
>> doing an mmap() on an imported DMA-buf works when userspace actually 
>> does this then there is a bug in userspace. The UMD doesn't seems to 
>> be aware of the fact that the buffer is imported and so for example 
>> needs to call dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().
>>
>> UMDs can trivially work around this by doing the mmap() on the 
>> DMA-buf file descriptor instead (potentially after re-exporting it), 
>> but the kernel really shouldn't help hide userspace bugs.
>
> Hm right, however why does drm_gem_shmem_mmap:
>
>     if (obj->import_attach) {
>         ret = dma_buf_mmap(obj->dma_buf, vma, 0);

Honestly I have absolutely no idea.

> Isn't that allowing drivers which use the helper to to forward to 
> dma_buf_mmap?

Yes, Daniel mentioned that some drivers did this before we found that 
it's actually not a good idea. It could be that this code piece was 
meant with that and we only allow it to avoid breaking UAPI.

Never the less I think we should add documentation for this.

> Maybe I am getting lost in the forest of callbacks in this area.. 
> Because it is supposed to be about shmem objects, but drivers which 
> use the helper and rely on common prime import look and also use 
> drm_gem_shmem_prime_import_sg_table can get there.

I don't fully understand it either of hand.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>>>
>>>> Test-with: 20230925131539.32743-1-tvrtko.ursulin@linux.intel.com
>>>>
>>>> ---
>>>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 78 
>>>> +++++++++++++++----
>>>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
>>>>   2 files changed, 65 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>> index aa4d842d4c5a..78c84c0a8b08 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>> @@ -5,6 +5,7 @@
>>>>    */
>>>>     #include <linux/anon_inodes.h>
>>>> +#include <linux/dma-buf.h>
>>>>   #include <linux/mman.h>
>>>>   #include <linux/pfn_t.h>
>>>>   #include <linux/sizes.h>
>>>> @@ -664,6 +665,7 @@ insert_mmo(struct drm_i915_gem_object *obj, 
>>>> struct i915_mmap_offset *mmo)
>>>>   static struct i915_mmap_offset *
>>>>   mmap_offset_attach(struct drm_i915_gem_object *obj,
>>>>              enum i915_mmap_type mmap_type,
>>>> +           bool forward_mmap,
>>>>              struct drm_file *file)
>>>>   {
>>>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>>>> @@ -682,6 +684,7 @@ mmap_offset_attach(struct drm_i915_gem_object 
>>>> *obj,
>>>>         mmo->obj = obj;
>>>>       mmo->mmap_type = mmap_type;
>>>> +    mmo->forward_mmap = forward_mmap;
>>>>       drm_vma_node_reset(&mmo->vma_node);
>>>>         err = drm_vma_offset_add(obj->base.dev->vma_offset_manager,
>>>> @@ -714,12 +717,25 @@ mmap_offset_attach(struct drm_i915_gem_object 
>>>> *obj,
>>>>       return ERR_PTR(err);
>>>>   }
>>>>   +static bool
>>>> +should_forward_mmap(struct drm_i915_gem_object *obj,
>>>> +            enum i915_mmap_type mmap_type)
>>>> +{
>>>> +    if (!obj->base.import_attach)
>>>> +        return false;
>>>> +
>>>> +    return mmap_type == I915_MMAP_TYPE_WB ||
>>>> +           mmap_type == I915_MMAP_TYPE_WC ||
>>>> +           mmap_type == I915_MMAP_TYPE_UC;
>>>> +}
>>>> +
>>>>   static int
>>>>   __assign_mmap_offset(struct drm_i915_gem_object *obj,
>>>>                enum i915_mmap_type mmap_type,
>>>>                u64 *offset, struct drm_file *file)
>>>>   {
>>>>       struct i915_mmap_offset *mmo;
>>>> +    bool should_forward;
>>>>         if (i915_gem_object_never_mmap(obj))
>>>>           return -ENODEV;
>>>> @@ -735,12 +751,15 @@ __assign_mmap_offset(struct 
>>>> drm_i915_gem_object *obj,
>>>>       if (mmap_type == I915_MMAP_TYPE_FIXED)
>>>>           return -ENODEV;
>>>>   +    should_forward = should_forward_mmap(obj, mmap_type);
>>>> +
>>>>       if (mmap_type != I915_MMAP_TYPE_GTT &&
>>>>           !i915_gem_object_has_struct_page(obj) &&
>>>> -        !i915_gem_object_has_iomem(obj))
>>>> +        !i915_gem_object_has_iomem(obj) &&
>>>> +        !should_forward)
>>>>           return -ENODEV;
>>>>   -    mmo = mmap_offset_attach(obj, mmap_type, file);
>>>> +    mmo = mmap_offset_attach(obj, mmap_type, should_forward, file);
>>>>       if (IS_ERR(mmo))
>>>>           return PTR_ERR(mmo);
>>>>   @@ -936,6 +955,32 @@ static struct file *mmap_singleton(struct 
>>>> drm_i915_private *i915)
>>>>       return file;
>>>>   }
>>>>   +static void
>>>> +__vma_mmap_pgprot(struct vm_area_struct *vma, enum i915_mmap_type 
>>>> mmap_type)
>>>> +{
>>>> +    const pgprot_t pgprot =vm_get_page_prot(vma->vm_flags);
>>>> +
>>>> +    switch (mmap_type) {
>>>> +    case I915_MMAP_TYPE_WC:
>>>> +        vma->vm_page_prot = pgprot_writecombine(pgprot);
>>>> +        break;
>>>> +    case I915_MMAP_TYPE_FIXED:
>>>> +        GEM_WARN_ON(1);
>>>> +        fallthrough;
>>>> +    case I915_MMAP_TYPE_WB:
>>>> +        vma->vm_page_prot = pgprot;
>>>> +        break;
>>>> +    case I915_MMAP_TYPE_UC:
>>>> +        vma->vm_page_prot = pgprot_noncached(pgprot);
>>>> +        break;
>>>> +    case I915_MMAP_TYPE_GTT:
>>>> +        vma->vm_page_prot = pgprot_writecombine(pgprot);
>>>> +        break;
>>>> +    }
>>>> +
>>>> +    vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>> +}
>>>> +
>>>>   static int
>>>>   i915_gem_object_mmap(struct drm_i915_gem_object *obj,
>>>>                struct i915_mmap_offset *mmo,
>>>> @@ -953,6 +998,20 @@ i915_gem_object_mmap(struct 
>>>> drm_i915_gem_object *obj,
>>>>           vm_flags_clear(vma, VM_MAYWRITE);
>>>>       }
>>>>   +    /* dma-buf import */
>>>> +    if (mmo && mmo->forward_mmap) {
>>>> +        __vma_mmap_pgprot(vma, mmo->mmap_type);
>>>> +        vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP 
>>>> | VM_IO);
>>>> +
>>>> +        /*
>>>> +         * Don't have our vm_ops to drop the reference in this 
>>>> case so
>>>> +         * drop it now and if object goes away userspace will fault.
>>>> +         */
>>>> +        i915_gem_object_put(mmo->obj);
>>>> +
>>>> +        return dma_buf_mmap(obj->base.dma_buf, vma, 0);
>>>> +    }
>>>> +
>>>>       anon = mmap_singleton(to_i915(dev));
>>>>       if (IS_ERR(anon)) {
>>>>           i915_gem_object_put(obj);
>>>> @@ -982,34 +1041,25 @@ i915_gem_object_mmap(struct 
>>>> drm_i915_gem_object *obj,
>>>>         vma->vm_private_data = mmo;
>>>>   +    __vma_mmap_pgprot(vma, mmo->mmap_type);
>>>> +
>>>>       switch (mmo->mmap_type) {
>>>>       case I915_MMAP_TYPE_WC:
>>>> -        vma->vm_page_prot =
>>>> - pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>           vma->vm_ops = &vm_ops_cpu;
>>>>           break;
>>>> -
>>>>       case I915_MMAP_TYPE_FIXED:
>>>>           GEM_WARN_ON(1);
>>>>           fallthrough;
>>>>       case I915_MMAP_TYPE_WB:
>>>> -        vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>>>>           vma->vm_ops = &vm_ops_cpu;
>>>>           break;
>>>> -
>>>>       case I915_MMAP_TYPE_UC:
>>>> -        vma->vm_page_prot =
>>>> - pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>>>>           vma->vm_ops = &vm_ops_cpu;
>>>>           break;
>>>> -
>>>>       case I915_MMAP_TYPE_GTT:
>>>> -        vma->vm_page_prot =
>>>> - pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>>>           vma->vm_ops = &vm_ops_gtt;
>>>>           break;
>>>>       }
>>>> -    vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>>>         return 0;
>>>>   }
>>>> @@ -1084,7 +1134,7 @@ int i915_gem_fb_mmap(struct 
>>>> drm_i915_gem_object *obj, struct vm_area_struct *vma
>>>>       } else {
>>>>           /* handle stolen and smem objects */
>>>>           mmap_type = i915_ggtt_has_aperture(ggtt) ? 
>>>> I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
>>>> -        mmo = mmap_offset_attach(obj, mmap_type, NULL);
>>>> +        mmo = mmap_offset_attach(obj, mmap_type, false, NULL);
>>>>           if (IS_ERR(mmo))
>>>>               return PTR_ERR(mmo);
>>>>       }
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> index 0c5cdab278b6..b4f86fa020aa 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>> @@ -225,6 +225,7 @@ struct i915_mmap_offset {
>>>>       struct drm_vma_offset_node vma_node;
>>>>       struct drm_i915_gem_object *obj;
>>>>       enum i915_mmap_type mmap_type;
>>>> +    bool forward_mmap;
>>>>         struct rb_node offset;
>>>>   };
>>

