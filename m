Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2068EB48D42
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9073810E035;
	Mon,  8 Sep 2025 12:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r/4XPl0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016D410E035
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:20:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E42340B87;
 Mon,  8 Sep 2025 12:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F356C4CEF1;
 Mon,  8 Sep 2025 12:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757334040;
 bh=MQo3B3xE2J4C5YV7vElpRMlKdfQxIsL88C+y00Of4+8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=r/4XPl0GYAWlfqhdbB985JBAGviphT2ad3keuexy0YcdL0QHKSGRFk+e0/0SxfvpN
 kkZjHjr2OlGe4afVhWrU3fYSOcoilCKTHSXwvTFzY4RybxPUpEdf/MbAy4/dj9zrd2
 39Nq+y52Qd92QWCsAic348DIwvrUpy57UaaQFzGXvAggLPQO3yCc4vi+gZ2ryV6KhJ
 ZWj2V/z1P4jKD1dNZSGVUEGg8SHdic/VHMlxaLQIL/ddrLCWueHPx0fYta/VL4q85Y
 nnNa435SG5pXsx2UwsFF2ciyLprv0k1QFHcgAbimegJzU08iH8r9h6MIDaWbRilw5h
 BhmSwT7egKKaQ==
Message-ID: <7aa3f464-a3d0-47a0-b044-d8db93f45918@kernel.org>
Date: Mon, 8 Sep 2025 14:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
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
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250908141156.3dbdea0b@fedora>
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

On 9/8/25 2:11 PM, Boris Brezillon wrote:
> On Mon, 08 Sep 2025 13:11:32 +0200
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>> I'm saying exactly what you say: "has to be a special unlink function" ->
>> drm_gpuva_unlink_defer_put(). :)
> 
> I don't see how calling drm_gpuva_unlink() instead of
> drm_gpuva_unlink_defer_put() would leak the vm_bo though.

Initially (i.e. a few mails back), it sounded to me as if you'd propose to drop
the drm_gpuva's vm_bo reference only when it is freed.

>> No, drivers can't iterate the evict/extobj lists directly; or at least this is
>> not intended by GPUVM's API and if drivers do so, this is considered peeking
>> into GPUVM internals, so drivers are on their own anyways.
>>
>> Iterators, such as for_each_vm_bo_in_list() are not exposed to drivers.
> 
> Okay, that's a good thing. I thought Xe was doing some funky stuff with
> the list...

Maybe, I don't know. If they do so, the should send patches adding the
corresponding iterators and provide a rationale why drivers need to access those
lists directly and why we can't provide an API that handles the overall
use-case, such as drm_gpuvm_prepare_objects(), etc.
