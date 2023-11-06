Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451FF7E1872
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECFE10E121;
	Mon,  6 Nov 2023 02:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E594210E121
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:03:03 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0ACA16607435;
 Mon,  6 Nov 2023 02:03:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699236182;
 bh=xX6wIIpG/Wv5HUsHMt5+qLudM6Mp/o/MT2hir+b8bLg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D35ywBv5iASzkyh/rZJl4h6aiinrXpqjt3tSFXlRoF3TN1lJpoB/HkYmHve2A7qS4
 xHugotys4uc3FBrc76rx1sVTzUuX9elG0F7+tfaOnNgHVjBDkTwfLdTkMXrwj5exOL
 sFiMUxIKhz6IDlkL8O00CnpIGcJ1BLvtsBe++dugML3fBtRZLEdF/nm9w4mPwni7He
 MMvF7+JI6uJYeDPkjFA7iPTGw9svnBwB5iHKzxZ33txcn6ggSXt1zUi3wdblNhuYGV
 dm3LoQTyj/dyEqedBjMrf/Cb8+rdmx4R1PuhRoxByMQB0sjW9jQc7nnLUYxWYo6uDQ
 ruX7NxfY++rAw==
Message-ID: <1228d85a-011b-8b48-61c7-fc760edaf7a1@collabora.com>
Date: Mon, 6 Nov 2023 05:02:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 25/26] drm/virtio: Support shmem shrinking
To: Gurchetan Singh <gurchetansingh@chromium.org>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-26-dmitry.osipenko@collabora.com>
 <CAAfnVBk3gbxVL+WwY9pi27ts8JGPM=0VuOkTo8KOZcuO634UeQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAAfnVBk3gbxVL+WwY9pi27ts8JGPM=0VuOkTo8KOZcuO634UeQ@mail.gmail.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Melissa Wen <mwen@igalia.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/4/23 01:55, Gurchetan Singh wrote:
> On Sun, Oct 29, 2023 at 4:03 PM Dmitry Osipenko <
> dmitry.osipenko@collabora.com> wrote:
> 
>> Support generic drm-shmem memory shrinker and add new madvise IOCTL to
>> the VirtIO-GPU driver. BO cache manager of Mesa driver will mark BOs as
>> "don't need" using the new IOCTL to let shrinker purge the marked BOs on
>> OOM, the shrinker will also evict unpurgeable shmem BOs from memory if
>> guest supports SWAP file or partition.
>>
>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++-
>>  drivers/gpu/drm/virtio/virtgpu_gem.c    | 35 ++++++++++++++
>>  drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 25 ++++++++++
>>  drivers/gpu/drm/virtio/virtgpu_kms.c    |  8 ++++
>>  drivers/gpu/drm/virtio/virtgpu_object.c | 61 +++++++++++++++++++++++++
>>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 40 ++++++++++++++++
>>  include/uapi/drm/virtgpu_drm.h          | 14 ++++++
>>  7 files changed, 195 insertions(+), 1 deletion(-)
...
> 
> Link to open-source userspace?

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/15278

I'll add it to the commit message

> Also, don't you need a VIRTGPU_PARAM_MADVISE_SUPPORTED or is the plan to
> use a DRM version?

The ioctl() returns error if DRM_VIRTGPU_MADVISE unsupported, extra
flags not needed by userspace

> Overall, the series for a generic shrinker seems useful for a wide variety
> of DRM drivers, such as Panfrost.
> 
> For virtio-gpu, it could be a tad VIRGIL specific: since other context
> types (gfxstream gles, DRM, vk contexts) decrease memory consumption by
> either not allocating shadow buffers for textures/buffers, or using blob
> memory.
> 
> Maybe we need to design with blob in mind, since we expect virgl to be
> deprecated.  On Android, it basically is with ANGLE and native contexts.
> On Linux, Zink looks good too.  Even with memory issues fixed, virgl is
> unattractive compared to those solutions.

We should finish shmem first since started with it, then move to blobs.

My rough idea for the blobs is to use a timer-based approach to avoid
frequent virtio syncing with host that will be bad for performance
otherwise. Virtio-gpu kernel driver will maintain a list of purgeable
blobs and will send the list of idling blobs down to host after a period
of inactivity.

Virgl may be not interesting for CrOS, but Qemu will continue supporting
it. I also expect that today's ARM Chromebooks which use Virgl and only
support GL will continue to use Virgl for the next 4 years.

> Android specific idea: I wonder if we could tie GEM blob buffers usage to
> the lmkd and kill based on that ... ?
> 
> https://source.android.com/docs/core/perf/lmkd
> 
> Is there GEM buffer accounting infrastructure already?

Are you talking about killing a guest APP that uses host blobs when host
is under pressure? I'm not familiar with how arcvm works, but may assume
that it runs a VM per APP. In that case VM is just another process from
the lmkd perspective that will be taken down on OOM, i.e. blob buffers
already should be seen as a part of a VM's memory by lmkd when they
reside in sysmem.

-- 
Best regards,
Dmitry

