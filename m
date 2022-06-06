Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C353E550
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDAD10FF44;
	Mon,  6 Jun 2022 15:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6FB0010F45C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:10:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA78CD6E;
 Mon,  6 Jun 2022 08:10:16 -0700 (PDT)
Received: from [10.57.81.38] (unknown [10.57.81.38])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8D793F73B;
 Mon,  6 Jun 2022 08:10:15 -0700 (PDT)
Message-ID: <97e77916-93c9-4be2-a734-2b9f4170276f@arm.com>
Date: Mon, 6 Jun 2022 16:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Content-Language: en-GB
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Simon Ser <contact@emersion.fr>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
 <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
 <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAKMK7uEYncnjbwq6fQMNB_5tupMASrAFEadPg9xBS3ykNgNk4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Greg KH <greg@kroah.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Jason Ekstrand <jason.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-02 07:47, Daniel Vetter wrote:
> On Thu, 2 Jun 2022 at 08:34, Simon Ser <contact@emersion.fr> wrote:
>>
>> On Thursday, June 2nd, 2022 at 08:25, Greg KH <greg@kroah.com> wrote:
>>
>>> On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
>>>
>>>> On Thursday, June 2nd, 2022 at 07:40, Greg KH greg@kroah.com wrote:
>>>>
>>>>> On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
>>>>>
>>>>>> To discover support for new DMA-BUF IOCTLs, user-space has no
>>>>>> choice but to try to perform the IOCTL on an existing DMA-BUF.
>>>>>
>>>>> Which is correct and how all kernel features work (sorry I missed the
>>>>> main goal of this patch earlier and focused only on the sysfs stuff).
>>>>>
>>>>>> However, user-space may want to figure out whether or not the
>>>>>> IOCTL is available before it has a DMA-BUF at hand, e.g. at
>>>>>> initialization time in a Wayland compositor.
>>>>>
>>>>> Why not just do the ioctl in a test way? That's how we determine kernel
>>>>> features, we do not poke around in sysfs to determine what is, or is
>>>>> not, present at runtime.
>>>>>
>>>>>> Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
>>>>>> subsystem to advertise supported features. Add a
>>>>>> sync_file_import_export entry which indicates that importing and
>>>>>> exporting sync_files from/to DMA-BUFs is supported.
>>>>>
>>>>> No, sorry, this is not a sustainable thing to do for all kernel features
>>>>> over time. Please just do the ioctl and go from there. sysfs is not
>>>>> for advertising what is and is not enabled/present in a kernel with
>>>>> regards to functionality or capabilities of the system.
>>>>>
>>>>> If sysfs were to export this type of thing, it would have to do it for
>>>>> everything, not just some random tiny thing of one kernel driver.
>>>>
>>>> I'd argue that DMA-BUF is a special case here.
>>>
>>> So this is special and unique just like everything else? :)
>>>
>>>> To check whether the import/export IOCTLs are available, user-space
>>>> needs a DMA-BUF to try to perform the IOCTL. To get a DMA-BUF,
>>>> user-space needs to enumerate GPUs, pick one at random, load GBM or
>>>> Vulkan, use that heavy-weight API to allocate a "fake" buffer on the
>>>> GPU, export that buffer into a DMA-BUF, try the IOCTL, then teardown
>>>> all of this. There is no other way.
>>>>
>>>> This sounds like a roundabout way to answer the simple question "is the
>>>> IOCTL available?". Do you have another suggestion to address this
>>>> problem?
>>>
>>> What does userspace do differently if the ioctl is present or not?
>>
>> Globally enable a synchronization API for Wayland clients, for instance
>> in the case of a Wayland compositor.
>>
>>> And why is this somehow more special than of the tens of thousands of
>>> other ioctl calls where you have to do exactly the same thing you list
>>> above to determine if it is present or not?
>>
>> For other IOCTLs it's not as complicated to obtain a FD to do the test
>> with.
> 
> Two expand on this:
> 
> - compositor opens the drm render /dev node
> - compositor initializes the opengl or vulkan userspace driver on top of that
> - compositor asks that userspace driver to allocate some buffer, which
> can be pretty expensive
> - compositor asks the userspace driver to export that buffer into a dma-buf
> - compositor can finally do the test ioctl, realizes support isn't
> there and tosses the entire thing
> 
> read() on a sysfs file is so much more reasonable it's not even funny.

Just a drive-by observation, so apologies if I'm overlooking something 
obvious, but it sounds like the ideal compromise would be to expose a 
sysfs file which behaves as a dummy exported dma-buf. That way userspace 
could just open() it and try ioctl() directly - assuming that supported 
operations can fail distinctly from unsupported ones, or succeed as a 
no-op - which seems even simpler still.

Robin.
