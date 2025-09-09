Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC3B4AAE4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 12:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2FA10E243;
	Tue,  9 Sep 2025 10:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qyym0s+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E0A10E243
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 10:47:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8DDF7601E2;
 Tue,  9 Sep 2025 10:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D3FC4CEF5;
 Tue,  9 Sep 2025 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757414875;
 bh=bmhTPFMKRiQCz4gQV8Fjuf7q7QGKh0xTa7e+3ea1Fy0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qyym0s+Z7gvlQR9Q+U7sH2VTi4H7dP2O2a6fbFiY4tvzDh83T/fRHHjI5nkNrplWX
 oMrW233YvxUetjpxjRDCkCjMBqgRVbKrxzBqgZ30CcST+ffef2PYZwY7DE30qqNPPz
 F2RkltCOqiIgLrH92kJolxl6xKVCgSndaWan+lBREoAhEIfzWDJ/Mpz9CobOJa49RP
 roMDG333OUTA1Rov2FkuiFicQ2J8Z8m5cJ9UyMwsauAPQoxGbwjUnQYZaO8HEDO9rH
 XqFL8OpJLRmjxfnhGuxsVTexR56u2SuZOQNhl+H5DWbqzW2f06IUPEq0dbkusP6f/v
 g+17sZx4zBCzw==
Message-ID: <8078cad2-d5d3-4e20-9848-034c2a503f3d@kernel.org>
Date: Tue, 9 Sep 2025 12:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Matthew Brost <matthew.brost@intel.com>,
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
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <a2006f74-75bb-48ac-ac9c-0a71c8f9d510@linux.intel.com>
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

On 9/9/25 12:39 PM, Thomas Hellström wrote:
> On 9/8/25 14:20, Danilo Krummrich wrote:
>> On 9/8/25 2:11 PM, Boris Brezillon wrote:
>>> On Mon, 08 Sep 2025 13:11:32 +0200
>>> "Danilo Krummrich" <dakr@kernel.org> wrote:
>>>> I'm saying exactly what you say: "has to be a special unlink function" ->
>>>> drm_gpuva_unlink_defer_put(). :)
>>> I don't see how calling drm_gpuva_unlink() instead of
>>> drm_gpuva_unlink_defer_put() would leak the vm_bo though.
>> Initially (i.e. a few mails back), it sounded to me as if you'd propose to drop
>> the drm_gpuva's vm_bo reference only when it is freed.
>>
>>>> No, drivers can't iterate the evict/extobj lists directly; or at least this is
>>>> not intended by GPUVM's API and if drivers do so, this is considered peeking
>>>> into GPUVM internals, so drivers are on their own anyways.
>>>>
>>>> Iterators, such as for_each_vm_bo_in_list() are not exposed to drivers.
>>> Okay, that's a good thing. I thought Xe was doing some funky stuff with
>>> the list...
>> Maybe, I don't know. If they do so, the should send patches adding the
>> corresponding iterators and provide a rationale why drivers need to access those
>> lists directly and why we can't provide an API that handles the overall
>> use-case, such as drm_gpuvm_prepare_objects(), etc.
> 
> We're using the drm_gpuvm_*for_each* macros in drm_gpuvm.h, assuming from name
> and docs they are driver api.
> 
> Also the drm_gem_for_each_gpuvm_bo(), although this usage could easily be
> converted to a helper.

We were talking about the extobj/evict lists, the ones you mention are fine of
course. :)

