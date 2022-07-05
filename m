Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FED567A8A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 01:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EAEA112480;
	Tue,  5 Jul 2022 23:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C5411243B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 23:08:52 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EEDD066015C8;
 Wed,  6 Jul 2022 00:08:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657062530;
 bh=WPOS98C1ww0h7wB7KgFVUb6rtlK2oW5qXdt8zEVQLug=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N7LGrGeSOIko5kkF72sygNNFT39CyshZm8kTw0mZ2MqISS2fFDrzoNnac+9PrU5pf
 4eegombBvVeNI/s7PuLSkI3bRvgO+qteC33drFOT/VyMMT4mz4RFpVyDx1NVba1jc/
 hbwksP4piUZr58sEzyF87b00UNBUZOP5MxOSqtAo3bCc1cK8ONDNvXEDMrgKtPPe9H
 MpwjB2D6/wmWjuQ04HLpwt07Hg6vicwf7onlWmvE1nS5PNXG4ErSF2+fXpZMugI88P
 TaS7d5HJczeWywpx3fd2Zwwx6IPIDeEYSkI9enCN9HSrz3BWrqewBqD0TWTtMdI9IU
 7ha4eh69MxKQg==
Message-ID: <005b1bc3-084c-2ae4-e30a-71b0f239cc67@collabora.com>
Date: Wed, 6 Jul 2022 02:08:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] drm/virtio: Improve DMA API usage for shmem BOs
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
 <20220630200726.1884320-8-dmitry.osipenko@collabora.com>
 <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
 <d2c64d09-c4bb-9aed-069d-a9b4d07a1f66@collabora.com>
 <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
 <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
 <CAF6AEGtE+3AbaJnSZ07VY0xMOJMNz6BSQ+mPKmPYLi_Z-CLAig@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGtE+3AbaJnSZ07VY0xMOJMNz6BSQ+mPKmPYLi_Z-CLAig@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/22 00:39, Rob Clark wrote:
> On Tue, Jul 5, 2022 at 10:02 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> On 7/5/22 18:45, Gerd Hoffmann wrote:
>>>   Hi,
>>>
>>>>> Also note that pci is not the only virtio transport we have.
>>>>
>>>> The VirtIO indeed has other transports, but only PCI is really supported
>>>> in case of the VirtIO-GPU in kernel and in Qemu/crosvm, AFAICT. Hence
>>>> only the PCI transport was tested.
>>>
>>> qemu -M microvm \
>>>   -global virtio-mmio.force-legacy=false \
>>>   -device virtio-gpu-device
>>>
>>> Gives you a functional virtio-gpu device on virtio-mmio.
>>>
>>> aarch64 virt machines support both pci and mmio too.
>>> s390x has virtio-gpu-ccw ...
>>
>> Gerd, thank you very much! It's was indeed unclear to me how to test the
>> MMIO GPU, but yours variant with microvm works! I was looking for trying
>> aarch64 in the past, but it also was unclear how to do it since there is
>> no DT support for the VirtIO-GPU, AFAICS.
> 
> just a drive-by note, IME on aarch64 kernels, at least with crosvm,
> virtgpu is also a pci device.. the non-pci things in the guest kernel
> use dt, but devices on discoverable busses like pci don't need dt
> nodes (which is true also in the non-vm case)

Sure, I was only looking how to test MMIO GPU on aarch64. Since I
haven't a found a way to test MMIO back then, I concluded that the MMIO
case wasn't really well supported.

-- 
Best regards,
Dmitry
