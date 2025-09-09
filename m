Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ED3B4ABE7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7010210E6BD;
	Tue,  9 Sep 2025 11:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DC1L2hov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4D210E6BC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2601460224;
 Tue,  9 Sep 2025 11:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04505C4CEF4;
 Tue,  9 Sep 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417336;
 bh=3qTkpRYPWhJIrFaIbetCRPgmK97ch9BSZ6ogh5fYb/E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DC1L2hovSrIM4jHOwEoyNSiErADcDr3cBuZY5IwjbHWa+eFIpPWsq2G07AeK9w7Ig
 RAj2hlIHA/4uC0CSlRgqbHZp7VpoM/58Ms1UBu/BM/wYjgGYatrcK/kA5T7EQIs7t8
 B6S1iwZp8NR6YED+3gnKcNucAFdOx8olD/GcPMExs0qVA936ZXsRqky7uabkTAl1nN
 FOhBb5CEMx95/LeLSog2Qzm70D6RBuLgepFF7zm4xtN487i9vo8m5Hc7L6C/M5c+az
 KQRzFesv1XBg2lGLsmp7ufWyGXXXWgDp94D9uEE5Fapt9gEfWnJ8sp4Fuh3sfOldds
 FJNKIbtPSAZrA==
Message-ID: <e5afeb60-96cc-4a9b-a360-2da03e4e236e@kernel.org>
Date: Tue, 9 Sep 2025 13:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
 <20250905152505.005a610d@fedora>
 <CAH5fLghgqv0mNYf8r-rdeBaCGxYsdkBouqgo_ohx3DYHwpcZRQ@mail.gmail.com>
 <DCL8DQV23FIZ.KJ74UQ9YOFZV@kernel.org> <aL1pSFB9iBsfHFM_@google.com>
 <DCMJ6K06T63T.2UBTM1RL4YJ0A@kernel.org> <aL1u_YxOkuj1kIq6@google.com>
 <20250908091140.44856fde@fedora> <aL6TJYRmWIkQXujj@google.com>
 <DCNAE3CJMEJ0.JH1F0MJABXQI@kernel.org> <20250908122002.2c80dd3a@fedora>
 <DCNDGFE7RR5Q.X3PCDW0KIX89@kernel.org> <20250908141156.3dbdea0b@fedora>
 <7aa3f464-a3d0-47a0-b044-d8db93f45918@kernel.org>
 <a2006f74-75bb-48ac-ac9c-0a71c8f9d510@linux.intel.com>
 <8078cad2-d5d3-4e20-9848-034c2a503f3d@kernel.org>
 <cbd5c99d2394335ac4aeb2740994ab14508e2553.camel@linux.intel.com>
 <CAH5fLghY8o0ouvaz48D4bsWMJ7A06L750xdKibaoe=bKjVOpzg@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAH5fLghY8o0ouvaz48D4bsWMJ7A06L750xdKibaoe=bKjVOpzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 9/9/25 1:24 PM, Alice Ryhl wrote:
> On Tue, Sep 9, 2025 at 1:11 PM Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>>
>> On Tue, 2025-09-09 at 12:47 +0200, Danilo Krummrich wrote:
>>> On 9/9/25 12:39 PM, Thomas Hellström wrote:
>>>> On 9/8/25 14:20, Danilo Krummrich wrote:
>>>>> On 9/8/25 2:11 PM, Boris Brezillon wrote:
>>>>>> On Mon, 08 Sep 2025 13:11:32 +0200
>>>>>> "Danilo Krummrich" <dakr@kernel.org> wrote:
>>>>>>> No, drivers can't iterate the evict/extobj lists directly; or
>>>>>>> at least this is
>>>>>>> not intended by GPUVM's API and if drivers do so, this is
>>>>>>> considered peeking
>>>>>>> into GPUVM internals, so drivers are on their own anyways.
>>>>>>>
>>>>>>> Iterators, such as for_each_vm_bo_in_list() are not exposed
>>>>>>> to drivers.
>>>>>> Okay, that's a good thing. I thought Xe was doing some funky
>>>>>> stuff with
>>>>>> the list...
>>>>> Maybe, I don't know. If they do so, the should send patches
>>>>> adding the
>>>>> corresponding iterators and provide a rationale why drivers need
>>>>> to access those
>>>>> lists directly and why we can't provide an API that handles the
>>>>> overall
>>>>> use-case, such as drm_gpuvm_prepare_objects(), etc.
>>>>
>>>> We're using the drm_gpuvm_*for_each* macros in drm_gpuvm.h,
>>>> assuming from name
>>>> and docs they are driver api.
>>>>
>>>> Also the drm_gem_for_each_gpuvm_bo(), although this usage could
>>>> easily be
>>>> converted to a helper.
>>>
>>> We were talking about the extobj/evict lists, the ones you mention
>>> are fine of
>>> course. :)
>>>
>>
>> Hmm. Now on closer inspection it looks like we're checking for evict
>> list empty, It looks like rebinding after validation may in theory
>> evict some bos to system memory and then we'd rerun the validation step
>> if the evict list was not empty.
>>
>> We could of course add a helper for that or if there are better
>> suggestions to handle that situation, that'd be fine as well.
> 
> I don't think evict list empty means that there are no evicted GEMs.
> It's possible for an extobj to be missing from the evict list in some
> scenarios. That's why drm_gpuvm_prepare_objects_locked() checks
> evicted on the extobj list to ensure that the evicted list is
> up-to-date when you call into drm_gpuvm_validate_locked().

Indeed, though I would expect that Xe considers that? It was Thomas who proposed
the logic you describe here back then IIRC. :)

