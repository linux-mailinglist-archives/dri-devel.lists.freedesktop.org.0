Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C6F7A8E46
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 23:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E2510E08C;
	Wed, 20 Sep 2023 21:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0A610E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 21:14:00 +0000 (UTC)
Received: from [192.168.2.59] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A50F6607243;
 Wed, 20 Sep 2023 22:13:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695244438;
 bh=AEY7xSy+XlWvC67wCNaiGkWUgOsbIuFYHHmnxBCjy3I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OVtEQlBJBAtJi9tb4FkbfpRmsugl2ETOMWGjfNX2zARe4zatOkyv2qFJys4qpZtAF
 +Pd04c3WENeHGNveAmVQjypZBCeUc+c3fmfZbTJ2yHcQiA7cdicWuFvMkGH+n3TRTC
 xMNh9WWDUw4RunEtbk8xx8tLFjrKDMQJOSJGXl9t3FkCbgj0JSaYOa8v/SiZtqvHp2
 EcMhgaMKvguYPbjpwINvIxme70frCQjPc81NrM7RCkxjaGlNIzwfyrePkf6ASLYE+o
 mf9DkAuGVNsiaI/F26kgzkV66Gg9aLL+UXmsce2VOVwbfv1f+LeTqxhXQFWC8u9ttg
 75roO4Mdw5y1Q==
Message-ID: <e944b37b-87e2-5cd4-1140-f7bb7e28519f@collabora.com>
Date: Thu, 21 Sep 2023 00:13:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/virtio: clean out_fence on complete_submit
Content-Language: en-US
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 airlied@redhat.com, kraxel@redhat.com, skhan@linuxfoundation.org
References: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230912060824.5210-1-jose.pekkarinen@foxhound.fi>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, gurchetansingh@chromium.org,
 linux-kernel-mentees@lists.linuxfoundation.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/12/23 09:08, José Pekkarinen wrote:
> The removed line prevents the following cleanup function
> to execute a dma_fence_put on the out_fence to free its
> memory, producing the following output in kmemleak:
> 
> unreferenced object 0xffff888126d8ee00 (size 128):
>   comm "kwin_wayland", pid 981, jiffies 4295380296 (age 390.060s)
>   hex dump (first 32 bytes):
>     c8 a1 c2 27 81 88 ff ff e0 14 a9 c0 ff ff ff ff  ...'............
>     30 1a e1 2e a6 00 00 00 28 fc 5b 17 81 88 ff ff  0.......(.[.....
>   backtrace:
>     [<0000000011655661>] kmalloc_trace+0x26/0xa0
>     [<0000000055f15b82>] virtio_gpu_fence_alloc+0x47/0xc0 [virtio_gpu]
>     [<00000000fa6d96f9>] virtio_gpu_execbuffer_ioctl+0x1a8/0x800 [virtio_gpu]
>     [<00000000e6cb5105>] drm_ioctl_kernel+0x169/0x240 [drm]
>     [<000000005ad33e27>] drm_ioctl+0x399/0x6b0 [drm]
>     [<00000000a19dbf65>] __x64_sys_ioctl+0xc5/0x100
>     [<0000000011fa801e>] do_syscall_64+0x5b/0xc0
>     [<0000000065c76d8a>] entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> unreferenced object 0xffff888121930500 (size 128):
>   comm "kwin_wayland", pid 981, jiffies 4295380313 (age 390.096s)
>   hex dump (first 32 bytes):
>     c8 a1 c2 27 81 88 ff ff e0 14 a9 c0 ff ff ff ff  ...'............
>     f9 ec d7 2f a6 00 00 00 28 fc 5b 17 81 88 ff ff  .../....(.[.....
>   backtrace:
>     [<0000000011655661>] kmalloc_trace+0x26/0xa0
>     [<0000000055f15b82>] virtio_gpu_fence_alloc+0x47/0xc0 [virtio_gpu]
>     [<00000000fa6d96f9>] virtio_gpu_execbuffer_ioctl+0x1a8/0x800 [virtio_gpu]
>     [<00000000e6cb5105>] drm_ioctl_kernel+0x169/0x240 [drm]
>     [<000000005ad33e27>] drm_ioctl+0x399/0x6b0 [drm]
>     [<00000000a19dbf65>] __x64_sys_ioctl+0xc5/0x100
>     [<0000000011fa801e>] do_syscall_64+0x5b/0xc0
>     [<0000000065c76d8a>] entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [...]
> 
> This memleak will grow quickly, being possible to see the
> following line in dmesg after few minutes of life in the
> virtual machine:
> 
> [  706.217388] kmemleak: 10731 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> 
> The patch will remove the line to allow the cleanup
> function do its job.
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 1 -
>  1 file changed, 1 deletion(-)

Added fixes tag and pushed to misc-fixes

-- 
Best regards,
Dmitry

