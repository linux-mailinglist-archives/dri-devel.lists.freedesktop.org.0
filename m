Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B97A75E5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A4C10E453;
	Wed, 20 Sep 2023 08:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFC310E453;
 Wed, 20 Sep 2023 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695198595; x=1726734595;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to;
 bh=RYFPHVDarG79YjCy7M7uRkjv0R2hGKxnblAXj3PyghI=;
 b=K+P1J1+z5EoZifMjBTqDZjrfWTexPKpGgbwEtVKOJinom+5g4q/igfcr
 ZA/lZXFHLIGxfVIdiHlyfhwLrfBPNMGbijxjFQCD0bA7hhR6VwS/ncbvq
 v5TvxYKVau/1STKi4sm0nUFQqQavHb6gRix6c/YMiHV9gxEWKajS+Oa11
 VCdf3MRS1iJwqJVIebmL1Rxp1cstYkiorv4WI+gxJY4pZwPlfdCpPmgH9
 brKeWZDJgyG91RdnTgeibHYodt4Qe0DOX1kwzuNNj8OExIPfUIb4xp18o
 zHh+h1spxZ/dH+L0MloQHaHoQksHMLNSgMSTyHz/e2H8usp/7tbc8fUio w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446631883"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
 d="scan'208,223";a="446631883"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749802632"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
 d="scan'208,223";a="749802632"
Received: from noors55x-mobl1.gar.corp.intel.com (HELO [10.249.254.146])
 ([10.249.254.146])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 01:29:51 -0700
Content-Type: multipart/mixed; boundary="------------DpkaTB002bT55dZkGxNU9ngX"
Message-ID: <dfb0452b-1ad2-1ced-dcf8-a213b15a8e00@linux.intel.com>
Date: Wed, 20 Sep 2023 10:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <ZQCW6wzHYVdxl/IV@pollux>
 <701dfead-e240-b3fb-422c-d49fc7e04595@linux.intel.com>
 <ZQD2FFLP28bFgHXT@pollux>
 <cbff08ca845655dee44fbf498cdb37a3d5251bf3.camel@linux.intel.com>
 <ZQGoNovGz/4Y3xvf@pollux> <96af067a-ca48-891c-2adf-9faf271e3629@amd.com>
 <5f66db4e-f580-bbfb-d9fc-ac78afdbf01a@redhat.com>
 <0ca78a6b-9011-1738-f367-c9e6369f4ad4@amd.com>
 <00ecb16c-5ebb-7122-4e2d-df21e89a0cf1@redhat.com>
 <92c00bc7-1a20-edc3-e36c-7bcf61684a91@amd.com>
 <5f1b8427-1c51-b10f-f41c-a0f068ef3792@linux.intel.com>
 <7d237f39-51cd-6a3c-c010-8d9c4c7061a1@redhat.com>
 <177db5b8-ee94-3b15-3445-7ed1dc7bef2a@linux.intel.com>
 <7577b5c0-a1cf-61b9-5929-f19515b340c4@amd.com>
 <4a60b67f-c67a-ca80-20b6-4af57f6858df@linux.intel.com>
In-Reply-To: <4a60b67f-c67a-ca80-20b6-4af57f6858df@linux.intel.com>
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------DpkaTB002bT55dZkGxNU9ngX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/20/23 09:44, Thomas Hellström wrote:
> Hi,
>
> On 9/20/23 07:37, Christian König wrote:
>> Am 19.09.23 um 17:23 schrieb Thomas Hellström:
>>>
>>> On 9/19/23 17:16, Danilo Krummrich wrote:
>>>> On 9/19/23 14:21, Thomas Hellström wrote:
>>>>> Hi Christian
>>>>>
>>>>> On 9/19/23 14:07, Christian König wrote:
>>>>>> Am 13.09.23 um 17:46 schrieb Danilo Krummrich:
>>>>>>> On 9/13/23 17:33, Christian König wrote:
>>>>>>>> Am 13.09.23 um 17:15 schrieb Danilo Krummrich:
>>>>>>>>> On 9/13/23 16:26, Christian König wrote:
>>>>>>>>>> Am 13.09.23 um 14:16 schrieb Danilo Krummrich:
>>>>>>>>>>> As mentioned in a different mail thread, the reply is based 
>>>>>>>>>>> on the assumption
>>>>>>>>>>> that we don't support anything else than GPUVM updates from 
>>>>>>>>>>> the IOCTL.
>>>>>>>>>>
>>>>>>>>>> I think that this assumption is incorrect.
>>>>>>>>>
>>>>>>>>> Well, more precisely I should have said "don't support GPUVM 
>>>>>>>>> updated from within
>>>>>>>>> fence signaling critical sections". And looking at the code, 
>>>>>>>>> that doesn't seem what
>>>>>>>>> you're doing there.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Vulkan is just once specific use case, but this here should 
>>>>>>>>>> probably be able to handle other use cases as well.
>>>>>>>>>>
>>>>>>>>>> Especially with HMM you get the requirement that you need to 
>>>>>>>>>> be able to invalidate GPUVM mappings without grabbing a 
>>>>>>>>>> reservation lock.
>>>>>>>>>
>>>>>>>>> What do you mean with "invalidate GPUVM mappings" in this 
>>>>>>>>> context? drm_gpuvm_bo_evict()
>>>>>>>>> should only be called from a ttm_device_funcs::move callback, 
>>>>>>>>> we should hold the dma-resv
>>>>>>>>> lock there.
>>>>>>>>
>>>>>>>> Well the question is which dma-resv lock do we hold?
>>>>>>>>
>>>>>>>> In the move callback we only hold the dma-resv lock of the BO 
>>>>>>>> which is moved, but when that is a shared BO then that's not 
>>>>>>>> the same as the one for the VM.
>>>>>>>
>>>>>>> Correct, Thomas' idea was to use the GEM's dma_resv lock to 
>>>>>>> protect drm_gpuvm_bo::evicted
>>>>>>> and then actually move the drm_gpuvm_bo to the VM's evicted list 
>>>>>>> once we grabbed all
>>>>>>> dma-resv locks when locking the VM's BOs using drm_exec. We can 
>>>>>>> remove them from the evicted
>>>>>>> list on validate(). This way we never touch the evicted list 
>>>>>>> without holding at least the VM's
>>>>>>> dma-resv lock.
>>>>>>>
>>>>>>> Do you have any concerns about that?
>>>>>>
>>>>>> Scratching my head a bit how that is supposed to work.
>>>>>>
>>>>>> This implies that you go over all the evicted BOs during 
>>>>>> validation and not just the one mentioned in the CS.
>>>>>>
>>>>>> That might work for Vulkan, but is pretty much a no-go for OpenGL.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> See what the eviction lock in amdgpu is doing for example.
>>>>>>>>>
>>>>>>>>> The eviction_lock seems to protect a VM state "evicting" of 
>>>>>>>>> whether any BO that
>>>>>>>>> is associated with the VM is currently evicting. At the same 
>>>>>>>>> time amdgpu protects
>>>>>>>>> the eviceted list of the VM with a different lock. So this 
>>>>>>>>> seems to be entirely
>>>>>>>>> unrelated. Tracking a "currently evicting" state is not part 
>>>>>>>>> of the GPUVM
>>>>>>>>> implementation currently and hence nothing would change for 
>>>>>>>>> amdgpu there.
>>>>>>>>
>>>>>>>> Sorry for the confusion we use different terminology in amdgpu.
>>>>>>>>
>>>>>>>> The eviction lock and evicted state is for the VM page tables, 
>>>>>>>> e.g. if the whole VM is currently not used and swapped out or 
>>>>>>>> even de-allocated.
>>>>>>>>
>>>>>>>> This is necessary because we have cases where we need to access 
>>>>>>>> the VM data without holding the dma-resv lock of this VM. 
>>>>>>>> Especially figuring out which parts of an address space contain 
>>>>>>>> mappings and which doesn't.
>>>>>>>
>>>>>>> I think this is fine, this has nothing to do with lists of 
>>>>>>> evicted GEM objects or external GEM
>>>>>>> objects, right? Marking mappings (drm_gpuva) as invalidated 
>>>>>>> (DRM_GPUVA_INVALIDATED) or accessing
>>>>>>> the VA space does not require any dma-resv locks.
>>>>>>
>>>>>> I hope so, but I'm not 100% sure.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> This is a requirement which comes with HMM handling, you won't 
>>>>>>>> see this with Vulkan (or OpenGL, VAAPI etc..).
>>>>>>>>
>>>>>>>>
>>>>>>>> The invalidation lock on the other hand is what in this 
>>>>>>>> discussion is called eviction lock. This one is needed because 
>>>>>>>> what I wrote above, during the move callback only the dma-resv 
>>>>>>>> of the BO which is moved is locked, but not necessarily the 
>>>>>>>> dma-resv of the VM.
>>>>>>>
>>>>>>> That's yet another thing, right? This is used to track whether 
>>>>>>> *any* BO that belongs to the VM is
>>>>>>> currently being evicted, correct? As mentioned, as by now this 
>>>>>>> is not supported in GPUVM and hence
>>>>>>> would be the same driver specific code with the same driver 
>>>>>>> specifc lock.
>>>>>>
>>>>>> That is most likely a show stopper using this for OpenGL based 
>>>>>> workloads as far as I can see. For those you need to able to 
>>>>>> figure out which non-VM BOs have been evicted and which parts of 
>>>>>> the VM needs updates.
>>>>>
>>>>> We identify those with a bool in the gpuvm_bo, and that bool is 
>>>>> protected by the bo_resv. In essence, the "evicted" list must be 
>>>>> made up-to-date with all relevant locks held before traversing in 
>>>>> the next exec.
>>>>
>>>> What I still miss with this idea is how do we find all the 
>>>> drm_gpuvm_bo structures with the evicted bool set to true? When 
>>>> doing the drm_exec dance we come across all external ones and can 
>>>> add them to the list if needed, but what about the BOs having the 
>>>> VM's dma-resv?
>>>
>>> Oh, they can be added to the evict list directly (no bool needed) in 
>>> the eviction code, like in v3. Since for those we indeed hold the 
>>> VM's dma_resv since it's aliased with the object's dma-resv.
>>
>> Yeah, I wanted to note what Danilo seems to think about as well. How 
>> do we figure out the non-VM BOs evicted?
>>
>> We can't walk over the list of all non-VM BOs on every submission, 
>> that's to much overhead for cases with lots of non-VM BOs.
>>
>> And we can't rely on userspace sending all non-VM BOs as used list 
>> down to the kernel with each submission.
>>
>> Regards,
>> Christian.
>
> No, that's not needed: Mechanism below.
>
> 1) We maintain an evicted list. Typically protected by the vm resv.
> 2) Each gpuvm_bo has a bool "evicted". Protected by the bo resv.
>
> a) Evicting a vm bo: The vm resv is held by the eviction code. Just 
> put it on the evicted list.
> b) Evicting a shared/external bo: The bo resv is held by the eviction 
> code. Set the "evicted" bool
> c) Validating the evicted list on exec: Loop through all 
> *external/shared* bos. Lock them. After locking, check the "evicted" 
> bool, if it's true. put the bo on the evicted list (we hold the VM 
> resv at this point) and clear the "evicted" bool. Note that other vms 
> will have their own gpuvm_bo which is marked evicted.
>
> I have this coded up in a patch for Xe and it seems to be working 
> properly.
>
> /Thomas
>
Something along the lines of the attach patch.


--------------DpkaTB002bT55dZkGxNU9ngX
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-gpuvm-Adjustment-for-extobj-eviction.patch"
Content-Disposition: attachment;
 filename="0001-drm-gpuvm-Adjustment-for-extobj-eviction.patch"
Content-Transfer-Encoding: base64

RnJvbSAxMjc3OGEzZjFiMmNhMDU1ZmY2NTg4NjRjNTM4Zjk0NDU1MGM5YWRmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/VGhvbWFzPTIwSGVsbHN0cj1DMz1C
Nm0/PSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+CkRhdGU6IFRodSwgMTQg
U2VwIDIwMjMgMTA6MjM6NTIgKzAyMDAKU3ViamVjdDogW1BBVENIXSBkcm0vZ3B1dm06IEFk
anVzdG1lbnQgZm9yIGV4dG9iaiBldmljdGlvbi4KTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5j
b2Rpbmc6IDhiaXQKClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMu
aGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dw
dXZtLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogaW5jbHVkZS9k
cm0vZHJtX2dwdXZtLmggICAgIHwgIDcgKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAzMCBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ3B1dm0uYwppbmRleCAx
MWEwYWVlMWMwMzguLjAyOWMzOGQ3ZmE0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9ncHV2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ3B1dm0uYwpAQCAtOTU2
LDYgKzk1NiwxMSBAQCBkcm1fZ3B1dm1fcHJlcGFyZV9vYmplY3RzKHN0cnVjdCBkcm1fZ3B1
dm0gKmdwdXZtLAogCQlyZXQgPSBkcm1fZXhlY19wcmVwYXJlX29iaihleGVjLCB2bV9iby0+
b2JqLCBudW1fZmVuY2VzKTsKIAkJaWYgKHJldCkKIAkJCWJyZWFrOworCisJCWlmICh2bV9i
by0+ZXZpY3RlZCkgeworCQkJZHJtX2dwdXZtX2JvX2xpc3RfYWRkKHZtX2JvLCBldmljdCk7
CisJCQl2bV9iby0+ZXZpY3RlZCA9IGZhbHNlOworCQl9CiAJfQogCS8qIERyb3AgcmVmIGlu
IGNhc2Ugd2UgYnJlYWsgb3V0IG9mIHRoZSBsb29wLiAqLwogCWRybV9ncHV2bV9ib19wdXQo
dm1fYm8pOwpAQCAtMTQzMSw2ICsxNDM2LDIxIEBAIGRybV9ncHV2bV9ib19leHRvYmpfYWRk
KHN0cnVjdCBkcm1fZ3B1dm1fYm8gKnZtX2JvKQogfQogRVhQT1JUX1NZTUJPTF9HUEwoZHJt
X2dwdXZtX2JvX2V4dG9ial9hZGQpOwogCit2b2lkCitkcm1fZ3B1dm1fYm9fZXZpY3Qoc3Ry
dWN0IGRybV9ncHV2bV9ibyAqdm1fYm8sIGJvb2wgZXZpY3QpCit7CisJaWYgKGRybV9ncHV2
bV9pc19leHRvYmoodm1fYm8tPnZtLCB2bV9iby0+b2JqKSkgeworCQl2bV9iby0+ZXZpY3Rl
ZCA9IGV2aWN0OworCQlyZXR1cm47CisJfQorCisJaWYgKGV2aWN0KQorCQlkcm1fZ3B1dm1f
Ym9fbGlzdF9hZGQodm1fYm8sIGV2aWN0KTsKKwllbHNlCisJCWRybV9ncHV2bV9ib19saXN0
X2RlbCh2bV9ibywgZXZpY3QpOworfQorRVhQT1JUX1NZTUJPTChkcm1fZ3B1dm1fYm9fZXZp
Y3QpOworCiAvKioKICAqIGRybV9ncHV2bV9ib19ldmljdCgpIC0gYWRkIC8gcmVtb3ZlIGEg
JmRybV9nZW1fb2JqZWN0IHRvIC8gZnJvbSBhCiAgKiAmZHJtX2dwdXZtcyBldmljdGVkIGxp
c3QKQEAgLTE0NDEsMTggKzE0NjEsMTQgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZHJtX2dwdXZt
X2JvX2V4dG9ial9hZGQpOwogICogbGlzdCBjb250YWluaW5nIGEgbWFwcGluZyBvZiB0aGlz
ICZkcm1fZ2VtX29iamVjdC4KICAqLwogdm9pZAotZHJtX2dwdXZtX2JvX2V2aWN0KHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqLCBib29sIGV2aWN0KQorZHJtX2dwdXZtX2dlbV9ldmlj
dChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgYm9vbCBldmljdCkKIHsKIAlzdHJ1Y3Qg
ZHJtX2dwdXZtX2JvICp2bV9ibzsKIAotCWRybV9nZW1fZm9yX2VhY2hfZ3B1dm1fYm8odm1f
Ym8sIG9iaikgewotCQlpZiAoZXZpY3QpCi0JCQlkcm1fZ3B1dm1fYm9fbGlzdF9hZGQodm1f
Ym8sIGV2aWN0KTsKLQkJZWxzZQotCQkJZHJtX2dwdXZtX2JvX2xpc3RfZGVsKHZtX2JvLCBl
dmljdCk7Ci0JfQorCWRybV9nZW1fZm9yX2VhY2hfZ3B1dm1fYm8odm1fYm8sIG9iaikKKwkJ
ZHJtX2dwdXZtX2JvX2V2aWN0KHZtX2JvLCBldmljdCk7CiB9Ci1FWFBPUlRfU1lNQk9MX0dQ
TChkcm1fZ3B1dm1fYm9fZXZpY3QpOworRVhQT1JUX1NZTUJPTF9HUEwoZHJtX2dwdXZtX2dl
bV9ldmljdCk7CiAKIHN0YXRpYyBpbnQKIF9fZHJtX2dwdXZhX2luc2VydChzdHJ1Y3QgZHJt
X2dwdXZtICpncHV2bSwKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9ncHV2bS5oIGIv
aW5jbHVkZS9kcm0vZHJtX2dwdXZtLmgKaW5kZXggZGNlMjZhOTIzZDVkLi5jMjIxNmYxODI0
M2YgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9ncHV2bS5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9ncHV2bS5oCkBAIC01NTAsNiArNTUwLDkgQEAgc3RydWN0IGRybV9ncHV2bV9i
byB7CiAJICovCiAJc3RydWN0IGtyZWYga3JlZjsKIAorCS8qKiBAZXZpY3RlZDogV2hldGhl
ciB0aGUgYm8gbmVlZHMgcmV2YWxpZGF0aW9uIGFuZCByZWJpbmRpbmcuICovCisJYm9vbCBl
dmljdGVkOworCiAJLyoqCiAJICogQGxpc3Q6IFN0cnVjdHVyZSBjb250YWluaW5nIGFsbCAm
bGlzdF9oZWFkcy4KIAkgKi8KQEAgLTYxNSw3ICs2MTgsOSBAQCBzdHJ1Y3QgZHJtX2dwdXZt
X2JvICoKIGRybV9ncHV2bV9ib19maW5kKHN0cnVjdCBkcm1fZ3B1dm0gKmdwdXZtLAogCQkg
IHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKIAotdm9pZCBkcm1fZ3B1dm1fYm9fZXZp
Y3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIGJvb2wgZXZpY3QpOwordm9pZCBkcm1f
Z3B1dm1fYm9fZXZpY3Qoc3RydWN0IGRybV9ncHV2bV9ibyAqdm1fYm8sIGJvb2wgZXZpY3Qp
OworCit2b2lkIGRybV9ncHV2bV9nZW1fZXZpY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmosIGJvb2wgZXZpY3QpOwogdm9pZCBkcm1fZ3B1dm1fYm9fZXh0b2JqX2FkZChzdHJ1Y3Qg
ZHJtX2dwdXZtX2JvICp2bV9ibyk7CiAKIC8qKgotLSAKMi40MS4wCgo=

--------------DpkaTB002bT55dZkGxNU9ngX--
