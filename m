Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC0567517
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 19:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7745D9286D;
	Tue,  5 Jul 2022 17:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C33F9283E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 17:02:14 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F238A660166D;
 Tue,  5 Jul 2022 18:02:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657040532;
 bh=l3lVYraeVRjfudV5BktsYjuOavhLJKEFAe1rgIjHK58=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mWg/MwfgtEriDXF2t98MRae4d5bqs3kk7Js+amAsZGsV6Ctdl6bGY1cpzpl+C4IPN
 PGzD493+kFEltUPLTV9RQFLOf3G7jZf/9eTxosnWS8/Vlu9LMt8RJFIentc/p8hnH8
 RjYB6oNaba4T5dh++v6AIuwpWcX9Dh61kglQ06dHR6i7/X9EKzaLQh5nTTAMCBzoTI
 LOoax3z6f5YnwXzPFvuxi8L9x9UQCDpS2WpBNR/rIINOOiLBfAki3t28B0CDXL7w03
 Pc352NJgO6eOyoOVWrcPjN26G0/gaw100OTLvr3yLiXjZyFkg35PeqvjvYMDenn0iq
 IrMEg7wGfO68A==
Message-ID: <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
Date: Tue, 5 Jul 2022 20:02:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] drm/virtio: Improve DMA API usage for shmem BOs
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
 <20220630200726.1884320-8-dmitry.osipenko@collabora.com>
 <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
 <d2c64d09-c4bb-9aed-069d-a9b4d07a1f66@collabora.com>
 <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/5/22 18:45, Gerd Hoffmann wrote:
>   Hi,
> 
>>> Also note that pci is not the only virtio transport we have.
>>
>> The VirtIO indeed has other transports, but only PCI is really supported
>> in case of the VirtIO-GPU in kernel and in Qemu/crosvm, AFAICT. Hence
>> only the PCI transport was tested.
> 
> qemu -M microvm \
>   -global virtio-mmio.force-legacy=false \
>   -device virtio-gpu-device
> 
> Gives you a functional virtio-gpu device on virtio-mmio.
> 
> aarch64 virt machines support both pci and mmio too.
> s390x has virtio-gpu-ccw ...

Gerd, thank you very much! It's was indeed unclear to me how to test the
MMIO GPU, but yours variant with microvm works! I was looking for trying
aarch64 in the past, but it also was unclear how to do it since there is
no DT support for the VirtIO-GPU, AFAICS.

I booted kernel with this patchset applied and everything is okay, Xorg
works.

 [drm] Initialized virtio_gpu 0.1.0 0 for LNRO0005:01 on minor 0
 virtio-mmio LNRO0005:01: [drm] drm_plane_enable_fb_damage_clips() not
called
 virtio-mmio LNRO0005:01: [drm] fb0: virtio_gpudrmfb frame buffer device

There is no virgl support because it's a virtio-gpu-device and not
virtio-gpu-device-gl that is PCI-only in Qemu. Hence everything seems good.

I'd appreciate if you could give s390x a test.. I never touched s390x
and it will probably take some extra effort to get into it.

-- 
Best regards,
Dmitry
