Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B976A35B0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 00:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BC510E15F;
	Sun, 26 Feb 2023 23:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3E310E15F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 23:50:39 +0000 (UTC)
Received: from [192.168.2.206] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 187D86602DCD;
 Sun, 26 Feb 2023 23:50:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677455438;
 bh=JYRpxATqvkNno1FwoBgptX7gQvro7kbdKaoh02c9VEQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=TqSCfmh49xkDbtgdLhYXyECizYrDVzOlSc4QBhUnSkdoQBHhIiPRhn8+7lHI9/9li
 e8HZpOK/Mo6d2omwCQIfEe5i7lLxY7GKYfFKKTdInzjMwboFn9AXcDn0KGQf64Vf8A
 Uv0b10EbzFkgDzRcxhD08xlEmcbpLo8Lnr5aO/rkyJqqjvkoFRhZ8eht4eo6Nwi0dC
 /IkZJm1mntY20f3yi75AZkKIuYm+OgpIrU7k+uxVssus+JfPaOq4a72cuHFHlA2VAP
 IuV7JW/2gw/aYpwuuv/nYTRBrrJ5S355O2kkcBhW4kpTmr7mezO+JGiV2Eq+8hnz7G
 02drfzM2+WNlw==
Message-ID: <32f2442d-9150-0288-499c-9206084d8732@collabora.com>
Date: Mon, 27 Feb 2023 02:50:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/virtio: Pass correct device to
 dma_sync_sgtable_for_device()
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
References: <20230224153450.526222-1-olekstysh@gmail.com>
 <4cb50dcb-b877-9602-3802-d651eea57b89@collabora.com>
Content-Language: en-US
In-Reply-To: <4cb50dcb-b877-9602-3802-d651eea57b89@collabora.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/25/23 17:55, Dmitry Osipenko wrote:
> On 2/24/23 18:34, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> The "vdev->dev.parent" should be used instead of "vdev->dev" as a device
>> for which to perform the DMA operation in both
>> virtio_gpu_cmd_transfer_to_host_2d(3d).
>>
>> Because the virtio-gpu device "vdev->dev" doesn't really have DMA OPS
>> assigned to it, but parent (virtio-pci or virtio-mmio) device
>> "vdev->dev.parent" has. The more, the sgtable in question the code is
>> trying to sync here was mapped for the parent device (by using its DMA OPS)
>> previously at:
>> virtio_gpu_object_shmem_init()->drm_gem_shmem_get_pages_sgt()->
>> dma_map_sgtable(), so should be synced here for the same parent device.
>>
>> Fixes: b5c9ed70d1a9 ("drm/virtio: Improve DMA API usage for shmem BOs")
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
...
> Indeed, it's only the vgpu drm device that was moved to use the pci
> parent device. On x86 the vdev always has dma-ops, also
> virtio_has_dma_quirk=true for modern Qemu. So I didn't test this code
> path and apparently it's only testable on Xen, which is good to know.
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Applied to misc-fixes

-- 
Best regards,
Dmitry

