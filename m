Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49921A9CC29
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 16:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619B410E318;
	Fri, 25 Apr 2025 14:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F75D10E318
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 14:57:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB81106F;
 Fri, 25 Apr 2025 07:57:00 -0700 (PDT)
Received: from [10.1.36.15] (e122027.cambridge.arm.com [10.1.36.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9C263F59E;
 Fri, 25 Apr 2025 07:57:02 -0700 (PDT)
Message-ID: <3b6235d6-67e3-47dc-b1a5-f30a726d0bdb@arm.com>
Date: Fri, 25 Apr 2025 15:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] drm/panthor: Test for imported buffers with
 drm_gem_is_imported()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-10-tzimmermann@suse.de>
 <bd83794c-17a9-4e28-bf62-7a62bef57c22@arm.com>
 <20250425163017.050f94f0@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250425163017.050f94f0@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2025 15:30, Boris Brezillon wrote:
> On Fri, 25 Apr 2025 14:34:53 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 17/03/2025 13:06, Thomas Zimmermann wrote:
>>> Instead of testing import_attach for imported GEM buffers, invoke
>>> drm_gem_is_imported() to do the test. The helper tests the dma_buf
>>> itself while import_attach is just an artifact of the import. Prepares
>>> to make import_attach optional.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Steven Price <steven.price@arm.com>
>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_gem.c |  2 +-
>>>  drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++-----
>>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
>>> index 8244a4e6c2a2..fd014ccc3bfc 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
>>> @@ -155,7 +155,7 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
>>>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>>  	enum drm_gem_object_status res = 0;
>>>  
>>> -	if (bo->base.base.import_attach || bo->base.pages)
>>> +	if (drm_gem_is_imported(&bo->base.base) || bo->base.pages)
>>>  		res |= DRM_GEM_OBJECT_RESIDENT;
>>>  
>>>  	return res;
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index 12a02e28f50f..3e123159ac10 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -1103,7 +1103,7 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
>>>  	/* If the vm_bo object was destroyed, release the pin reference that
>>>  	 * was hold by this object.
>>>  	 */
>>> -	if (unpin && !bo->base.base.import_attach)
>>> +	if (unpin && !drm_gem_is_imported(&bo->base.base))
>>>  		drm_gem_shmem_unpin(&bo->base);  
>>
>> I'm seeing issues on cleanup where drm_gem_is_imported() doesn't return 
>> the same as !!import_attach in the above code. Specifically this appears 
>> to be caused by drm_gem_object_exported_dma_buf_free() setting ->dma_buf 
>> to NULL which makes the BO look like it isn't imported.
>>
>> Stashing the imported state in the BO fixes the problem (see below 
>> hack), but it would be nice to fix this more generally in case there are 
>> other drivers that need to know the imported state during cleanup.
>>
>> Any suggestions for how drm_gem_is_imported() can more accurately report 
>> the state during cleanup?
> 
> This should be fixed by [1], but I wonder why it's not been merged in
> drm-misc-next yet.

Ah, yes that's exactly the bug I'm seeing - I missed the patch being
posted. Thanks for the link!

Steve

> [1]https://patches.linaro.org/project/linux-media/patch/20250416065820.26076-1-tzimmermann@suse.de/

