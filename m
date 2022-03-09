Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A639B4D3D40
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 23:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24BC10E517;
	Wed,  9 Mar 2022 22:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039B010E517
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 22:43:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id BF8BE1F40661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646865785;
 bh=jsjzbcmTnfVGkp3QHzcBzKjX2sCnocD0pKPWjEy4458=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YNLTTZpG7z2VY1gTHKOwcdIQtHX7dEHDiMwfH2V+6v+TGwxpzf4t2YsPUrgVPkeDe
 bu4h4nEFokW+YEmKwiXmucWHGLyE0pv9OeNZybfs+hNZepNFkalNT/hpAy7b+f1kUT
 N8EUJ89x5gY/yohavW0kBmYJ9MrkYWGwCVZwzB0UNhPlu05ELkcMgk7cBE/3uASnuL
 k79eaenyTax2o85pGQfuLzWwdQ+qJRlCbDvTsKc0/nGJaA6WLZPRrufAQc8U7SmF2/
 rH4hFdf5Z9gPpM6gn65YBInoRzkP5nsNT46WwwOdxk7nsiIu608i97Vb7tySICvnB8
 t2iHOlETzllew==
Message-ID: <285bf619-8c05-f2f4-3aeb-e013fba8754a@collabora.com>
Date: Thu, 10 Mar 2022 01:43:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <CAF6AEGt=aVJ9nR+Wv+bJEFZrn-cNOSNXG1TaJr=Cx-FTgutwKA@mail.gmail.com>
 <d2290971-ea22-8203-631e-b896c76a994b@collabora.com>
 <CAF6AEGuR8B6z+z=VFQ6y01wbboYS_qpkghD1GYdLES_RZOW1wA@mail.gmail.com>
 <42facae5-8f2c-9c1f-5144-4ebb99c798bd@collabora.com>
 <CAF6AEGtebAbWhkvrxzi4UBLdv2LJPQVPBzH-sXcACs7cxznQ8A@mail.gmail.com>
 <05e1fe61-1c29-152f-414b-cd6a44525af0@collabora.com>
 <CAF6AEGvf81epGOs7Zh4WK-7mkXRApO2p-h4g8dTuk4xtc1HOeg@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGvf81epGOs7Zh4WK-7mkXRApO2p-h4g8dTuk4xtc1HOeg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/10/22 00:51, Rob Clark wrote:
> On Wed, Mar 9, 2022 at 12:06 PM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> On 3/9/22 03:56, Rob Clark wrote:
>>>> If we really can't track madvise state in the guest for dealing with
>>>> host memory pressure, I think the better option is to introduce
>>>> MADV:WILLNEED_REPLACE, ie. something to tell the host kernel that the
>>>> buffer is needed but the previous contents are not (as long as the GPU
>>>> VA remains the same).  With this the host could allocate new pages if
>>>> needed, and the guest would not need to wait for a reply from host.
>>> If variant with the memory ballooning will work, then it will be
>>> possible to track the state within guest-only. Let's consider the
>>> simplest variant for now.
>>>
>>> I'll try to implement the balloon driver support in the v2 and will get
>>> back to you.
>>>
>>
>> I looked at the generic balloon driver and looks like this not what we
>> want because:
>>
>> 1. Memory ballooning is primarily about handling memory overcommit
>> situations. I.e. when there are multiple VMs consuming more memory than
>> available in the system. Ballooning allows host to ask guest to give
>> unused pages back to host and host could give pages to other VMs.
>>
>> 2. Memory ballooning operates with guest memory pages only. I.e. each
>> ballooned page is reported to/from host in a form of page's DMA address.
>>
>> 3. There is no direct connection between host's OOM events and the
>> balloon manager. I guess host could watch system's memory pressure and
>> inflate VMs' balloons on low memory, releasing the guest's memory to the
>> system, but apparently this use-case not supported by anyone today, at
>> least I don't see Qemu supporting it.
>>
> 
> hmm, on CrOS I do see balloon getting used to balance host vs guest
> memory.. but admittedly I've not yet looked closely at how that works,
> and it does seem like we have some things that are not yet upstream
> all over the place (not to mention crosvm vs qemu)

That's interesting, I missed that CrOS uses a customized ballooning.

>> So the virtio-balloon driver isn't very useful for us as-is.
>>
>> One possible solution could be to create something like a new
>> virtio-shrinker device or add shrinker functionality to the virtio-gpu
>> device, allowing host to ask guests to drop shared caches. Host then
>> should become a PSI handler. I think this should be doable in a case of
>> crosvm. In a case of GNU world, it could take a lot of effort to get
>> everything to upstreamable state, at first there is a need to
>> demonstrate real problem being solved by this solution.
> 
> I guess with 4GB chromebooks running one or more VMs in addition to
> lots of browser tabs in the host, it shouldn't be too hard to
> demonstrate a problem ;-)

But then guest also should have a significant amount of BOs in cache to
purge, which potentially could be solved using a timer approach.

> (but also, however we end up solving that, certainly shouldn't block
> this series)

Sure, there is no problem with extending shrinker functionality with
more features later on, so the host's shrinker isn't a blocker.

>> The other minor issue is that only integrated GPUs may use system's
>> memory and even then they could use a dedicated memory carveout, i.e.
>> releasing VRAM BOs may not help with host's OOM. In case of virgl
>> context we have no clue about where buffers are physically located. On
>> the other hand, in the worst case dropping host caches just won't help
>> with OOM.
> 
> Userspace should know whether the BO has CPU storage, so I don't think
> this should be a problem virtio_gpu needs to worry about
> 
>> It's now unclear how we should proceed with the host-side shrinker
>> support. Thoughts?
>>
>> We may start easy and instead of thinking about host-side shrinker, we
>> could make VirtIO-GPU driver to expire cached BOs after a certain
>> timeout. Mesa already uses timeout-based BO caching, but it doesn't have
>> an alarm timer and simply checks expiration when BO is allocated. Should
>> be too much trouble to handle timers within Mesa since it's executed in
>> application context, easier to do it in kernel, like VC4 driver does it
>> for example. This is not good as a proper memory shrinker, but could be
>> good enough in practice.
> 
> I think that, given virgl uses host storage, guest shrinker should be
> still useful.. so I think continue with this series.

Guest shrinker indeed will be useful for virgl today. I was already
questioning why virgl needs both host and guest storages, maybe it will
move to a host-only storage approach in the future.

I think the variant with the timer expiration actually could be
interesting to try because it should allow host to purge its VM BOs by
itself, preventing host OOMs.

> For host shrinker, I'll have to look more at when crosvm triggers
> balloon inflation.  I could still go the MADV:WILLNEED_REPLACE
> approach instead, which does have the advantage of host kernel not
> relying on host userspace or vm having a chance to run in order to
> release pages.  The downside (perhaps?) is it would be more specific
> to virtgpu-native-context and less so to virgl or venus (but I guess
> there doesn't currently exist a way for madvise to be useful for vk
> drivers).

I'll also take a look at what CrOS does, maybe it has some interesting
ideas.
