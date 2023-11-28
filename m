Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A367FC90A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B938310E0D9;
	Tue, 28 Nov 2023 22:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785810E0D9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 22:05:22 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B3B516606F5E;
 Tue, 28 Nov 2023 22:05:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701209121;
 bh=7xgiiHIZkyd3bNeww2hca8PoCyeMwxX6P4rjuWlBVFI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n8dwM/TCV3O6RarGRKcaHc2GVNFP2eV8mBM9p+GTAY9OtPs5odN7Rve38Z40SF0YW
 uJDWRbOp2AIjdieZ62k6hadUKjCOJr5Ve/5E+Pc5zmNmxnTjkw5R+CB2rFVtPKmcp7
 tLqEftMuTH//JGYMvXc9rcRYqLezXl6sncBpcuf33pGc97/j6Ig762QhNPecsOtIKw
 HEsu5xLB7cOoZf1xEXVTM4J0lKhF2ZhjjrLF4Z5fJF+t3ADstCP5BEAY5EIfLUHRtC
 HuHHKuQBIjPL7hRlZPD0OjFFlpY/0cXcRRY6I+27jM9eVsT4ouhKvGqYD/DYUyuBG9
 ISVlewrxM0AiA==
Message-ID: <37208c72-7908-0a78-fc89-2fa9b8d756a5@collabora.com>
Date: Wed, 29 Nov 2023 01:05:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 04/26] drm/shmem-helper: Refactor locked/unlocked
 functions
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-5-dmitry.osipenko@collabora.com>
 <wboljiwogeus7pwgaqzxaltt3xdavy2dzisygn6pdpoiwlnwgc@mwaiukjguzat>
 <20231124115911.79ab24af@collabora.com>
 <kw5bho3jx73d3glvtewmjvqt4qty4khju6dcwypuh25ya3gi4b@7slmijjqdi4p>
 <20231128133712.53a6f6cb@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231128133712.53a6f6cb@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/23 15:37, Boris Brezillon wrote:
> On Tue, 28 Nov 2023 12:14:42 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
> 
>> Hi,
>>
>> On Fri, Nov 24, 2023 at 11:59:11AM +0100, Boris Brezillon wrote:
>>> On Fri, 24 Nov 2023 11:40:06 +0100
>>> Maxime Ripard <mripard@kernel.org> wrote:
>>>   
>>>> On Mon, Oct 30, 2023 at 02:01:43AM +0300, Dmitry Osipenko wrote:  
>>>>> Add locked and remove unlocked postfixes from drm-shmem function names,
>>>>> making names consistent with the drm/gem core code.
>>>>>
>>>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>    
>>>>
>>>> This contradicts my earlier ack on a patch but...
>>>>   
>>>>> ---
>>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c        | 64 +++++++++----------
>>>>>  drivers/gpu/drm/lima/lima_gem.c               |  8 +--
>>>>>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 +-
>>>>>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  6 +-
>>>>>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  2 +-
>>>>>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |  2 +-
>>>>>  drivers/gpu/drm/v3d/v3d_bo.c                  |  4 +-
>>>>>  drivers/gpu/drm/virtio/virtgpu_object.c       |  4 +-
>>>>>  include/drm/drm_gem_shmem_helper.h            | 36 +++++------
>>>>>  9 files changed, 64 insertions(+), 64 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> index 0d61f2b3e213..154585ddae08 100644
>>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> @@ -43,8 +43,8 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>>>>>  	.pin = drm_gem_shmem_object_pin,
>>>>>  	.unpin = drm_gem_shmem_object_unpin,
>>>>>  	.get_sg_table = drm_gem_shmem_object_get_sg_table,
>>>>> -	.vmap = drm_gem_shmem_object_vmap,
>>>>> -	.vunmap = drm_gem_shmem_object_vunmap,
>>>>> +	.vmap = drm_gem_shmem_object_vmap_locked,
>>>>> +	.vunmap = drm_gem_shmem_object_vunmap_locked,    
>>>>
>>>> While I think we should indeed be consistent with the names, I would
>>>> also expect helpers to get the locking right by default.  
>>>
>>> Wait, actually I think this patch does what you suggest already. The
>>> _locked() prefix tells the caller: "you should take care of the locking,
>>> I expect the lock to be held when this is hook/function is called". So
>>> helpers without the _locked() prefix take care of the locking (which I
>>> guess matches your 'helpers get the locking right' expectation), and
>>> those with the _locked() prefix don't.  
>>
>> What I meant by "getting the locking right" is indeed a bit ambiguous,
>> sorry. What I'm trying to say I guess is that, in this particular case,
>> I don't think you can expect the vmap implementation to be called with
>> or without the locks held. The doc for that function will say that it's
>> either one or the other, but not both.
>>
>> So helpers should follow what is needed to provide a default vmap/vunmap
>> implementation, including what locking is expected from a vmap/vunmap
>> implementation.
> 
> Hm, yeah, I think that's a matter of taste. When locking is often
> deferrable, like it is in DRM, I find it beneficial for funcions and
> function pointers to reflect the locking scheme, rather than relying on
> people properly reading the doc, especially when this is the only
> outlier in the group of drm_gem_object_funcs we already have, and it's
> not event documented at the drm_gem_object_funcs level [1] :P.
> 
>>
>> If that means that vmap is always called with the locks taken, then
>> drm_gem_shmem_object_vmap can just assume that it will be called with
>> the locks taken and there's no need to mention it in the name (and you
>> can probably sprinkle a couple of lockdep assertion to make sure the
>> locking is indeed consistent).
> 
> Things get very confusing when you end up having drm_gem_shmem helpers
> that are suffixed with _locked() to encode the fact locking is the
> caller's responsibility and no suffix for the
> callee-takes-care-of-the-locking semantics, while other helpers that are
> not suffixed at all actually implement the
> caller-should-take-care-of-the-locking semantics.
> 
>>
>>>> I'm not sure how reasonable it is, but I think I'd prefer to turn this
>>>> around and keep the drm_gem_shmem_object_vmap/unmap helpers name, and
>>>> convert whatever function needs to be converted to the unlock suffix so
>>>> we get a consistent naming.  
>>>
>>> That would be an _unlocked() prefix if we do it the other way around. I
>>> think the main confusion comes from the names of the hooks in
>>> drm_gem_shmem_funcs. Some of them, like drm_gem_shmem_funcs::v[un]map()
>>> are called with the GEM resv lock held, and locking is handled by the
>>> core, others, like drm_gem_shmem_funcs::[un]pin() are called
>>> without the GEM resv lock held, and locking is deferred to the
>>> implementation. As I said, I don't mind prefixing hooks/helpers with
>>> _unlocked() for those that take care of the locking, and no prefix for
>>> those that expects locks to be held, as long as it's consistent, but I
>>> just wanted to make sure we're on the same page :-).  
>>
>> What about _nolock then? It's the same number of characters than
>> _locked, plus it expresses what the function is (not) doing, not what
>> context it's supposed to be called in?
> 
> Just did a quick
> 
>   git grep _nolock drivers/gpu/drm
> 
> and it returns zero result, where the _locked/_unlocked pattern seems
> to already be widely used. Not saying we shouldn't change that, but it
> doesn't feel like a change we should do as part of this series.
> 
> Regards,
> 
> Boris
> 
> [1]https://elixir.bootlin.com/linux/v6.7-rc3/source/include/drm/drm_gem.h#L155

I'm fine with dropping the _locked() postfix from the common GEM helpers
and documenting the locking rule in drm_gem. Thank you all for the
suggestions :)

-- 
Best regards,
Dmitry

