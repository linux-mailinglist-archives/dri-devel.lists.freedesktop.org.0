Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD180EE65
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41D110E1F0;
	Tue, 12 Dec 2023 14:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5960710E1ED;
 Tue, 12 Dec 2023 14:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONHeYN/nUFKmXZIW8AGGXa3ne+QN+zUZO3sMVTSLeA06dXm0K49773GsjY0vNPCKIJd2x70VGpsfovbAJGjxfT/dSU2HuzfoCTM4+kREgjFewT+R0fQAjXllsGsu1sCdrnuber7et5mZ9nqk4BGS8xlFTfWdHAULf7NIjkshVvpDbi/Jm2nzMuDGmRnORG5RnFmOD6pwAphfOTRPBINiN1qCPKreFFB2G6wFHY5tUqas5YBT1DcP/xw18u+syo5NnMaMAs1t27HkFNHW/reRhnw/BWU18iMoUGEdwBUY3fFLuKHBZ3kng0xF6c4W95zBJH84QZMf2q54DPPwh3kNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4p4repF1bRLZp9DekzIGiqSsFyRlRpeAHN31WkO48QM=;
 b=gfPJAy13kShl5YRzubmjbSi0lMuSnt8aR6m1byhc4qV1ydLYdGyqvLiJPqH8TMz3eELq1M1UtdqLmMmvJf+yhwMyjn72t7V8Egse5IZRa7J4ePeH+e7GcNQBSEcT2PTlD51yFLcteiG7wv/+0yg4S8bB5k5Z9HrUVsqgbb4PKnZCb87prCUobBGcpWhDt8NrM7UDbwsMpkmCUeQJuEtJAFGS3havc6O4FLcowIljuf7LgQMt0qnE/XCF9mf/5I6VAyYewq3K8zNljK8kAPvUKz2YofHwgIKaql+PTr7QMEJrWaTmpoeogMJZ1zshWTqXtkvIQVxuxEpHnbiL+rt2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4p4repF1bRLZp9DekzIGiqSsFyRlRpeAHN31WkO48QM=;
 b=y0IJpXedgverhcW0fZ79Kj+InHbrY/vsQsFzoafFnGYxcwjZhSQ0TBPGKT/sYSck/S0MdqUC3Pwsd9ouGeuXPun7aace16uvdoSHfEWeGB1rDjsHhzlR5LYHaA+4mtU1mOFVp22nWUxzfejEGRzmZu9EcWec7fLUS9NTjOw6brA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB8041.namprd12.prod.outlook.com (2603:10b6:8:147::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 14:10:52 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 14:10:52 +0000
Message-ID: <26b9d5bf-f895-4237-85fe-04f53040c26c@amd.com>
Date: Tue, 12 Dec 2023 15:10:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/i915: Allow dmabuf mmap forwarding
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230925131638.32808-1-tvrtko.ursulin@linux.intel.com>
 <4da147e7-44bf-4d19-952d-fa3bab141f71@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4da147e7-44bf-4d19-952d-fa3bab141f71@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0321.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS0PR12MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fc4c60-0baf-4ed5-c98f-08dbfb1c2654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TuYJIxlEmJIlQLsuI98zHgtTjsxMBXdGY1M5jcywX/h8v3jKli2y3urFk+kXuNIE9/5SndkgiBbMvyiJ5BMrFQkS/68gXhjLO02j0HUboP9zPhUqzGBF9wEjEimUtTTx+tLYGWjUv3FgB4LuBFoWgOcdRVop0Kq3hPpnCb7HgM81QjBDvefT2pR6eWflvZujL7afjhZi4o/ZJSE/4MWTrPkNiOP1Wg5aYX5fFdvHvFKbj/ZAlbTZOCv5St7Tg4NKdCJpAJodN68ofATQKqzPQJ8TeFX2sLTr7AypTzaK1JRIPKCcvs5P+ICE5yLeupjrXtee0Ks24MC1f0FvMDDWHUX3V4cxF5qHvEtLWyR5KYdDmCBIh0keKMEwaoB/M1HdZuTKMqQMw7f8XdepXMBytegvdW4iKQ/bKaAcxwrR+b122mnz3o07DtuDyuz/QE8SZVXD3MU7rRkwfYGLScQ9hoAr8IsA1jKCl2ecYdQEbv2J1ytUoPhyu++PGcqGGnzPYCP/WxJ681um7uBPFlQPOl6XSr7dEWmQofrQ9PxTfIrzP57QsfYut+K3+J695JouTQq6JmslK9RangHLEFiom60KTHL7002K57PR6p3MNfbKj3R+/+/0lnTh1uyvZ0lqESlQQFw8zYDsX7XKW/ShcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(66574015)(41300700001)(2616005)(26005)(83380400001)(86362001)(31696002)(38100700002)(5660300002)(8676002)(8936002)(316002)(4326008)(2906002)(6666004)(6512007)(6506007)(53546011)(66476007)(66556008)(66946007)(54906003)(36756003)(478600001)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2FOVWxTVVBuOU82bHJnODRlVTF4Nm9JMXRqSlFkdDdBOC9WZHpIc1NVQTJu?=
 =?utf-8?B?ZGc4Vk1nWmdtanRuRjNKdTBqcGR0NGo5RGRUa0NKU2U5ZVoxTnI2SWpvWDRp?=
 =?utf-8?B?ZW1BZkcvZ2VLa3RQcEhQMmZya0FPa2FIaTJYN2IreWhWTkNVbWp5dHFSK202?=
 =?utf-8?B?RWZGcnZ5YTJrZzFMVG9Bb0FBZHpjalJlb0FPL0ZpcFNzMnN3ZkJ6NmJWbmNY?=
 =?utf-8?B?ay9oZ2t6a0NnV2R3cURtWkVDdW5hbXQ4RW54LzhYVFdJSFlZUW9FU0RwYjFl?=
 =?utf-8?B?YkQ2c3NXWkFERUJSdmNxZVJOeGJpSHlLbmVPTEhkdkZGM1lFSUtmbm8va0dk?=
 =?utf-8?B?SCt6T3ZrWlRmSHhOaFNqVG9FMHpicTBOQWMxVjRUQWpxUFVpb3RPMXBmbG15?=
 =?utf-8?B?aHFmWitlNHFvMXFVdzh5cTd2RFVzaElBeDNpTXlsSkZiNzFtenFxeVFwQWVs?=
 =?utf-8?B?c2IyMnJpUUJaN1l2UnBZTTRRWFdheWFKV1pscG95Nzc0QkNMY2NRM1VTZXFO?=
 =?utf-8?B?RnBlSmZxYkFrK3c4QmxXTFpDb2g3NTN3M3F6eEVaRkJLaGNCV3hGYVB6QUlB?=
 =?utf-8?B?U0xCS2JFUUVoNU5mOWE4QXN0d01KVGFUMEY3REhIR1RuazZBQ3RnbjRPNFhk?=
 =?utf-8?B?ZHlNWmdrMXB1L2oyRUdoV2xqODNpdlE0QnZDeFRKQWxDTDRDdFdYRmtTUVVt?=
 =?utf-8?B?enVhUVlxT3BUeDE4dFJHMXRHVm02NFRpTERFUlExdEUvSDhOOHdFdkhNUTZU?=
 =?utf-8?B?aWJsVzNqNXV6ZEJGeE9jR2IvWFJXN3RoNlQ2Z2JpcXN5SzhCZWhlZnBZcFR3?=
 =?utf-8?B?MUErRGRxNklwWnpHMnFIVHBvQVFnSWxDNFFmZUxBNjdyRnFvcnl2bi9OMTJ4?=
 =?utf-8?B?Zm9QQTUyRG5KVU9Bd291cXcwZXdoR3lrRnlmL3NQOWxOM1k5TEg4UmlhRi80?=
 =?utf-8?B?eFdxS05CWktsdXlzcDhpY2xSMWxucm1WWWNMR1VoRWE4OFFIQXQ0NTRxUmpu?=
 =?utf-8?B?MVZWTkJnbjNLVlRGQmRjMk5ySTk0dS9NdmpqanFxYTJGU0ZpcEJUdkgzamk1?=
 =?utf-8?B?VnN5aCsrYkJXWGZrcWIxV0locXMrQUtpSUhtY1JDZDFnZGgweU5lZXAwSmRR?=
 =?utf-8?B?bktXdUpQakRSajJYeTlHZEN1cHk1ZStzNUQxODRZQ1k0c1BaVVJSM0hoK0tp?=
 =?utf-8?B?YWhhVndNbXVLeFVJbUlVYjlZR3ZJbjNGcTJKNzNnS0FTMUZzTUpPcWtqbkNQ?=
 =?utf-8?B?QlVVKzVVZk5kb3hRYmtjU2p3MXdocU15YUNDemhieHV0YUZ2NVQxR2ZPM3hD?=
 =?utf-8?B?eUtRU2FOQlF4WHJTVGJXR05qcXpKQ0lNUGZQcUpjZTJIeGxkNmRlVlR1am1h?=
 =?utf-8?B?Q2N0cERYbXhjeGx5djJGU3dwYjEwN3p0TVl6L1l4SmJCK3Z1WWpuNElBZDhV?=
 =?utf-8?B?WVVRdGgrZ3VOcE1hOWpiVStNTm93UFhDQjRzRWNCc0ZZbTNOT3BpSUV4STVO?=
 =?utf-8?B?c3FUY2VxQjRGUjE4MjFyZHRtT3dxY2VxbnY1bFoyUUhFTUFQdVVkNS9SaTBh?=
 =?utf-8?B?WjdDL1Z5ZTJYVDRUcjBQVjJDWE8zRzhXOEhXVHc0SzU4ZzU2KzNuTGsyWUhr?=
 =?utf-8?B?UTJkT3pTWFUyTXhOL0VJK0I1elVHY1FqS0k2MHI2WTkwTkh1MUlqVGxQYnU2?=
 =?utf-8?B?bkhFM2dZU1d6eHA3d0sxVm51ZEtOdFE3MzBMRWdZL3dkbFFlZlBhVUhLNzZ1?=
 =?utf-8?B?WC9rQ3A2dzNSWkFSWG9KSFBkbmFiZkZ4QmFWenRRc1VpaUcxZnc5UmxVZ1Z5?=
 =?utf-8?B?NXJ1SHdYajNMaGpseks3NEpHUU1wOFhOSUNQU3lYcnV6STltUTdYNVcydXpJ?=
 =?utf-8?B?VTdRRWFGRlRlS3RFOUpGUHFXMklHSHN5TERuME44TU0wdFFYUUJ6cS9OWkhW?=
 =?utf-8?B?YVBYeEl0VmQ5NWhPbFBwL09nOWlBRVBMOFVFOTVHbkdGdXR1OVFCejdCZHpD?=
 =?utf-8?B?VlFnbVpzR09MUnYxTG9OeGs5c003RWxkT2ZPYlRxeDBhVmhqRzZrSFhRc1RI?=
 =?utf-8?B?N0J0S0I0bFJpWDJWdVlicU5zKzJCRGo5SUsrbjE1Rnd4cFkvVjZ0WjVoOEVR?=
 =?utf-8?Q?flXQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fc4c60-0baf-4ed5-c98f-08dbfb1c2654
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 14:10:52.6142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfPOS3ceA1Gflq/KvM0pzHDn7+cn988m5nsVqRmruxuDl/3SfipXZeEp4I5y3HX4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8041
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

Hi Tvrtko,

Thanks for pointing this mail out once more, I've totally missed it.

Am 12.12.23 um 11:37 schrieb Tvrtko Ursulin:
>
> On 25/09/2023 14:16, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Allow mmap forwarding for imported buffers in order to allow minigbm 
>> mmap
>> to work on aperture-less platforms such as Meteorlake.
>>
>> So far i915 did not allow mmap on imported buffers but from minigbm
>> perspective that worked because of the DRM_IOCTL_I915_GEM_MMAP_GTT fall-
>> back would then be attempted, and would be successful.
>>
>> This stops working on Meteorlake since there is no aperture.
>>
>> Allow i915 to mmap imported buffers using forwarding via dma_buf_mmap(),
>> which allows the primary minigbm path of 
>> DRM_IOCTL_I915_GEM_MMAP_OFFSET /
>> I915_MMAP_OFFSET_WB to work.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>> 1)
>> It is unclear to me if any real userspace depends on this, but there are
>> certainly compliance suites which fail.

Well that is actually intentional, but see below.

>>
>> 2)
>> It is also a bit unclear to me if dma_buf_mmap() is exactly intended for
>> this kind of use. It seems that it is, but I also found some old mailing
>> list discussions suggesting there might be some unresolved questions
>> around VMA revocation.

I actually solved those a few years back by introducing the 
vma_set_file() function which standardized the dance necessary for the 
dma_buf_mmap() function.

>>
>> 1 + 2 = RFC for now.
>>
>> Daniel and Christian were involved in 2) in the past so comments would
>> be appreciated.
>
> Any comments on this one? I don't have all the historical knowledge of 
> when this was maybe attempted before and what problems were hit, or 
> something. So would there be downsides or it is fine to forward it.

It works technically inside the kernel and Thomas Zimmerman suggested a 
patch set which made it possible to use for all DRM drivers.

But IIRC this patch set was rejected with the rational that while doing 
an mmap() on an imported DMA-buf works when userspace actually does this 
then there is a bug in userspace. The UMD doesn't seems to be aware of 
the fact that the buffer is imported and so for example needs to call 
dma_buf_begin_cpu_access() and dma_buf_end_cpu_access().

UMDs can trivially work around this by doing the mmap() on the DMA-buf 
file descriptor instead (potentially after re-exporting it), but the 
kernel really shouldn't help hide userspace bugs.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>
>> Test-with: 20230925131539.32743-1-tvrtko.ursulin@linux.intel.com
>>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 78 +++++++++++++++----
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
>>   2 files changed, 65 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index aa4d842d4c5a..78c84c0a8b08 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -5,6 +5,7 @@
>>    */
>>     #include <linux/anon_inodes.h>
>> +#include <linux/dma-buf.h>
>>   #include <linux/mman.h>
>>   #include <linux/pfn_t.h>
>>   #include <linux/sizes.h>
>> @@ -664,6 +665,7 @@ insert_mmo(struct drm_i915_gem_object *obj, 
>> struct i915_mmap_offset *mmo)
>>   static struct i915_mmap_offset *
>>   mmap_offset_attach(struct drm_i915_gem_object *obj,
>>              enum i915_mmap_type mmap_type,
>> +           bool forward_mmap,
>>              struct drm_file *file)
>>   {
>>       struct drm_i915_private *i915 = to_i915(obj->base.dev);
>> @@ -682,6 +684,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
>>         mmo->obj = obj;
>>       mmo->mmap_type = mmap_type;
>> +    mmo->forward_mmap = forward_mmap;
>>       drm_vma_node_reset(&mmo->vma_node);
>>         err = drm_vma_offset_add(obj->base.dev->vma_offset_manager,
>> @@ -714,12 +717,25 @@ mmap_offset_attach(struct drm_i915_gem_object 
>> *obj,
>>       return ERR_PTR(err);
>>   }
>>   +static bool
>> +should_forward_mmap(struct drm_i915_gem_object *obj,
>> +            enum i915_mmap_type mmap_type)
>> +{
>> +    if (!obj->base.import_attach)
>> +        return false;
>> +
>> +    return mmap_type == I915_MMAP_TYPE_WB ||
>> +           mmap_type == I915_MMAP_TYPE_WC ||
>> +           mmap_type == I915_MMAP_TYPE_UC;
>> +}
>> +
>>   static int
>>   __assign_mmap_offset(struct drm_i915_gem_object *obj,
>>                enum i915_mmap_type mmap_type,
>>                u64 *offset, struct drm_file *file)
>>   {
>>       struct i915_mmap_offset *mmo;
>> +    bool should_forward;
>>         if (i915_gem_object_never_mmap(obj))
>>           return -ENODEV;
>> @@ -735,12 +751,15 @@ __assign_mmap_offset(struct drm_i915_gem_object 
>> *obj,
>>       if (mmap_type == I915_MMAP_TYPE_FIXED)
>>           return -ENODEV;
>>   +    should_forward = should_forward_mmap(obj, mmap_type);
>> +
>>       if (mmap_type != I915_MMAP_TYPE_GTT &&
>>           !i915_gem_object_has_struct_page(obj) &&
>> -        !i915_gem_object_has_iomem(obj))
>> +        !i915_gem_object_has_iomem(obj) &&
>> +        !should_forward)
>>           return -ENODEV;
>>   -    mmo = mmap_offset_attach(obj, mmap_type, file);
>> +    mmo = mmap_offset_attach(obj, mmap_type, should_forward, file);
>>       if (IS_ERR(mmo))
>>           return PTR_ERR(mmo);
>>   @@ -936,6 +955,32 @@ static struct file *mmap_singleton(struct 
>> drm_i915_private *i915)
>>       return file;
>>   }
>>   +static void
>> +__vma_mmap_pgprot(struct vm_area_struct *vma, enum i915_mmap_type 
>> mmap_type)
>> +{
>> +    const pgprot_t pgprot =vm_get_page_prot(vma->vm_flags);
>> +
>> +    switch (mmap_type) {
>> +    case I915_MMAP_TYPE_WC:
>> +        vma->vm_page_prot = pgprot_writecombine(pgprot);
>> +        break;
>> +    case I915_MMAP_TYPE_FIXED:
>> +        GEM_WARN_ON(1);
>> +        fallthrough;
>> +    case I915_MMAP_TYPE_WB:
>> +        vma->vm_page_prot = pgprot;
>> +        break;
>> +    case I915_MMAP_TYPE_UC:
>> +        vma->vm_page_prot = pgprot_noncached(pgprot);
>> +        break;
>> +    case I915_MMAP_TYPE_GTT:
>> +        vma->vm_page_prot = pgprot_writecombine(pgprot);
>> +        break;
>> +    }
>> +
>> +    vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>> +}
>> +
>>   static int
>>   i915_gem_object_mmap(struct drm_i915_gem_object *obj,
>>                struct i915_mmap_offset *mmo,
>> @@ -953,6 +998,20 @@ i915_gem_object_mmap(struct drm_i915_gem_object 
>> *obj,
>>           vm_flags_clear(vma, VM_MAYWRITE);
>>       }
>>   +    /* dma-buf import */
>> +    if (mmo && mmo->forward_mmap) {
>> +        __vma_mmap_pgprot(vma, mmo->mmap_type);
>> +        vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | 
>> VM_IO);
>> +
>> +        /*
>> +         * Don't have our vm_ops to drop the reference in this case so
>> +         * drop it now and if object goes away userspace will fault.
>> +         */
>> +        i915_gem_object_put(mmo->obj);
>> +
>> +        return dma_buf_mmap(obj->base.dma_buf, vma, 0);
>> +    }
>> +
>>       anon = mmap_singleton(to_i915(dev));
>>       if (IS_ERR(anon)) {
>>           i915_gem_object_put(obj);
>> @@ -982,34 +1041,25 @@ i915_gem_object_mmap(struct 
>> drm_i915_gem_object *obj,
>>         vma->vm_private_data = mmo;
>>   +    __vma_mmap_pgprot(vma, mmo->mmap_type);
>> +
>>       switch (mmo->mmap_type) {
>>       case I915_MMAP_TYPE_WC:
>> -        vma->vm_page_prot =
>> - pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>           vma->vm_ops = &vm_ops_cpu;
>>           break;
>> -
>>       case I915_MMAP_TYPE_FIXED:
>>           GEM_WARN_ON(1);
>>           fallthrough;
>>       case I915_MMAP_TYPE_WB:
>> -        vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>>           vma->vm_ops = &vm_ops_cpu;
>>           break;
>> -
>>       case I915_MMAP_TYPE_UC:
>> -        vma->vm_page_prot =
>> - pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>>           vma->vm_ops = &vm_ops_cpu;
>>           break;
>> -
>>       case I915_MMAP_TYPE_GTT:
>> -        vma->vm_page_prot =
>> - pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>           vma->vm_ops = &vm_ops_gtt;
>>           break;
>>       }
>> -    vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>>         return 0;
>>   }
>> @@ -1084,7 +1134,7 @@ int i915_gem_fb_mmap(struct drm_i915_gem_object 
>> *obj, struct vm_area_struct *vma
>>       } else {
>>           /* handle stolen and smem objects */
>>           mmap_type = i915_ggtt_has_aperture(ggtt) ? 
>> I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
>> -        mmo = mmap_offset_attach(obj, mmap_type, NULL);
>> +        mmo = mmap_offset_attach(obj, mmap_type, false, NULL);
>>           if (IS_ERR(mmo))
>>               return PTR_ERR(mmo);
>>       }
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 0c5cdab278b6..b4f86fa020aa 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -225,6 +225,7 @@ struct i915_mmap_offset {
>>       struct drm_vma_offset_node vma_node;
>>       struct drm_i915_gem_object *obj;
>>       enum i915_mmap_type mmap_type;
>> +    bool forward_mmap;
>>         struct rb_node offset;
>>   };

