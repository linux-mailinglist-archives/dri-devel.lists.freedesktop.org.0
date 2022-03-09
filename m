Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869BC4D3ACB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 21:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5A910E35A;
	Wed,  9 Mar 2022 20:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F4210E35A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 20:06:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 514EB1F41CDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646856397;
 bh=upzAnz+AemcOXDgluXZyqh6OsAIdv9e6PtW9m0nL/eY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gAc0WsraZucHzFdCM5DkNgzQK3fhxUgZGbi3q9C2S0WkfH62pOsS7vE5qTN6asQ8p
 eFNBCuz7uqtDfjh0K79h7YNLUAY6T6Ga0700BpxFPZiMcFKxpGQOPZKOPl3xF9uy3h
 MwoWvvnGfTUZg9E+wzjsDD3AOKgqjp20vd+OozepoSgbhSt3MgwBEscof+o+96DjTH
 8dNA+xA9OK4KaeNqwvc5TQijt0/npkRPawqTws+CgwlsiffeFl7pBBV5HhoO6Dsflq
 3e7HPo5NSfmqYFOu9ubN/OIdAwyka4neXLHb86PqF/xfcQdjLPqPXxM6eF0D0r5ftl
 gnBZuijXaUiIQ==
Message-ID: <05e1fe61-1c29-152f-414b-cd6a44525af0@collabora.com>
Date: Wed, 9 Mar 2022 23:06:33 +0300
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
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGtebAbWhkvrxzi4UBLdv2LJPQVPBzH-sXcACs7cxznQ8A@mail.gmail.com>
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

On 3/9/22 03:56, Rob Clark wrote:
>> If we really can't track madvise state in the guest for dealing with
>> host memory pressure, I think the better option is to introduce
>> MADV:WILLNEED_REPLACE, ie. something to tell the host kernel that the
>> buffer is needed but the previous contents are not (as long as the GPU
>> VA remains the same).  With this the host could allocate new pages if
>> needed, and the guest would not need to wait for a reply from host.
> If variant with the memory ballooning will work, then it will be
> possible to track the state within guest-only. Let's consider the
> simplest variant for now.
> 
> I'll try to implement the balloon driver support in the v2 and will get
> back to you.
> 

I looked at the generic balloon driver and looks like this not what we
want because:

1. Memory ballooning is primarily about handling memory overcommit
situations. I.e. when there are multiple VMs consuming more memory than
available in the system. Ballooning allows host to ask guest to give
unused pages back to host and host could give pages to other VMs.

2. Memory ballooning operates with guest memory pages only. I.e. each
ballooned page is reported to/from host in a form of page's DMA address.

3. There is no direct connection between host's OOM events and the
balloon manager. I guess host could watch system's memory pressure and
inflate VMs' balloons on low memory, releasing the guest's memory to the
system, but apparently this use-case not supported by anyone today, at
least I don't see Qemu supporting it.


So the virtio-balloon driver isn't very useful for us as-is.

One possible solution could be to create something like a new
virtio-shrinker device or add shrinker functionality to the virtio-gpu
device, allowing host to ask guests to drop shared caches. Host then
should become a PSI handler. I think this should be doable in a case of
crosvm. In a case of GNU world, it could take a lot of effort to get
everything to upstreamable state, at first there is a need to
demonstrate real problem being solved by this solution.

The other minor issue is that only integrated GPUs may use system's
memory and even then they could use a dedicated memory carveout, i.e.
releasing VRAM BOs may not help with host's OOM. In case of virgl
context we have no clue about where buffers are physically located. On
the other hand, in the worst case dropping host caches just won't help
with OOM.

It's now unclear how we should proceed with the host-side shrinker
support. Thoughts?

We may start easy and instead of thinking about host-side shrinker, we
could make VirtIO-GPU driver to expire cached BOs after a certain
timeout. Mesa already uses timeout-based BO caching, but it doesn't have
an alarm timer and simply checks expiration when BO is allocated. Should
be too much trouble to handle timers within Mesa since it's executed in
application context, easier to do it in kernel, like VC4 driver does it
for example. This is not good as a proper memory shrinker, but could be
good enough in practice.
