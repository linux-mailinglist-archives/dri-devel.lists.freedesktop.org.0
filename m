Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B9E4D24F2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 00:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A3510E311;
	Tue,  8 Mar 2022 23:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DED010E311
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 23:36:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 601521F427CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646782616;
 bh=kRaFRXBGux+TbENn2Kyrr3Xa4IzJA4fzoh4b5x/nepw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RCLl30ojsnSTZtavefq4yuA7iIUEcgyigjumu75n7L3YhfvPjwuRamXHUgCeAItHh
 XZhNdlsTpbH/OWe0ogEo62R5WKTrp+xRefpWqqCWU4Rie4HKqhsbLC0fhtrhCj+WDg
 lGC2BddpWgP/KIkdTyyET1ABkGkambfn+ld/aqz8xxJg73d0LeytRk5vXZXUviDK29
 3tOB4iJVP+wMkWrpunLzQlgoTaIiV8511jRotqj1k5Lcpb68yGNae14mkPNXHr6luT
 70c2GvE419Q0Fogo2ULSWnyzPqBpDDdYTMbkDkTfJT6jEablCwhYu9kM0NimL5RP/s
 VQ/+yD6+qprMA==
Message-ID: <42facae5-8f2c-9c1f-5144-4ebb99c798bd@collabora.com>
Date: Wed, 9 Mar 2022 02:36:52 +0300
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGuR8B6z+z=VFQ6y01wbboYS_qpkghD1GYdLES_RZOW1wA@mail.gmail.com>
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

On 3/9/22 01:24, Rob Clark wrote:
> On Tue, Mar 8, 2022 at 11:28 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> On 3/8/22 19:29, Rob Clark wrote:
>>> On Tue, Mar 8, 2022 at 5:17 AM Dmitry Osipenko
>>> <dmitry.osipenko@collabora.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
>>>> During OOM, the shrinker will release BOs that are marked as "not needed"
>>>> by userspace using the new madvise IOCTL. The userspace in this case is
>>>> the Mesa VirGL driver, it will mark the cached BOs as "not needed",
>>>> allowing kernel driver to release memory of the cached shmem BOs on lowmem
>>>> situations, preventing OOM kills.
>>>
>>> Will host memory pressure already trigger shrinker in guest?
>>
>> The host memory pressure won't trigger shrinker in guest here. This
>> series will help only with the memory pressure within the guest using a
>> usual "virgl context".
>>
>> Having a host shrinker in a case of "virgl contexts" should be a
>> difficult problem to solve.
> 
> Hmm, I think we just need the balloon driver to trigger the shrinker
> in the guest kernel?  I suppose a driver like drm/virtio might want to
> differentiate between host and guest pressure (ie. consider only
> objects that have host vs guest storage), but even without that,
> freeing up memory in the guest when host is under memory pressure
> seems worthwhile.  Maybe I'm over-simplifying?

Might be the opposite, i.e. me over-complicating :) The variant with
memory ballooning actually could be good and will work for all kinds of
virtio contexts universally. There will be some back-n-forth between
host and guest, but perhaps it will work okay. Thank you for the suggestion.

>>> This is
>>> something I'm quite interested in for "virtgpu native contexts" (ie.
>>> native guest driver with new context type sitting on top of virtgpu),
>>
>> In a case of "native contexts" it should be doable, at least I can't see
>> any obvious problems. The madvise invocations could be passed to the
>> host using a new virtio-gpu command by the guest's madvise IOCTL
>> handler, instead-of/in-addition-to handling madvise in the guest's
>> kernel, and that's it.
> 
> I think we don't want to do that, because MADV:WILLNEED would be by
> far the most frequent guest<->host synchronous round trip.  So from
> that perspective tracking madvise state in guest kernel seems quite
> attractive.

This is a valid concern. I'd assume that the overhead should be
tolerable, but I don't have any actual perf numbers.

> If we really can't track madvise state in the guest for dealing with
> host memory pressure, I think the better option is to introduce
> MADV:WILLNEED_REPLACE, ie. something to tell the host kernel that the
> buffer is needed but the previous contents are not (as long as the GPU
> VA remains the same).  With this the host could allocate new pages if
> needed, and the guest would not need to wait for a reply from host.

If variant with the memory ballooning will work, then it will be
possible to track the state within guest-only. Let's consider the
simplest variant for now.

I'll try to implement the balloon driver support in the v2 and will get
back to you.

>>> since that isn't using host storage
>>
>> s/host/guest ?
> 
> Yes, sorry, I meant that it is not using guest storage.

Thank you for the clarification.
