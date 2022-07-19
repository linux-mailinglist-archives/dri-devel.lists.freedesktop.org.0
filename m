Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7810579882
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 13:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6994118A5A1;
	Tue, 19 Jul 2022 11:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E819618A59C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 11:30:16 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 26F1E6601A84;
 Tue, 19 Jul 2022 12:30:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658230215;
 bh=rpzY+Hd9YfT45BgcKVJ7OOuh8FXmtUnkCtfOS2g4cH8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QY4weZnoEpTNCE+75cy9Q/HJl98aGY9Zv/JSVZHs0E0CtgRq75NDF5KuQBzU5/D+H
 sJeG185T0kStxcAfzXU4gcWEiNinbxubFJnE7aONh+hIHd3uynT7rfcGBpBDOLEfAl
 hj14oE8wBkOeVrnfYSDqslFkU+A+AOkzEcsrbwUcbl9NK0/79nC4p3gQeGCouYevGq
 Pnq/TpE8dnfDsYqRmQN4yEtfhNpiXysp8BG1usKYlTm5d0yhIOS+3NOh+yE7CLuxBF
 C2233Yf7sX/a18TWz3s8ttH4nmqkKa9kdeueq/S2J4jUgoBS/K3vVKMcFY9uXNeaLS
 SHWWg8Su6nv5g==
Message-ID: <aa3cf379-c191-bcdd-4cb9-ab7a37f30e5a@collabora.com>
Date: Tue, 19 Jul 2022 14:30:11 +0300
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
 <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
 <20220706071301.43fvbioka4iksqup@sirius.home.kraxel.org>
 <05a5608b-899d-71de-a7d7-406334c5604b@collabora.com>
 <20220719103106.gttro4tjjbis6pgg@sirius.home.kraxel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220719103106.gttro4tjjbis6pgg@sirius.home.kraxel.org>
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

On 7/19/22 13:31, Gerd Hoffmann wrote:
> On Wed, Jul 06, 2022 at 10:22:52AM +0300, Dmitry Osipenko wrote:
>> On 7/6/22 10:13, Gerd Hoffmann wrote:
>>>   Hi,
>>>
>>>> Gerd, thank you very much! It's was indeed unclear to me how to test the
>>>> MMIO GPU, but yours variant with microvm works! I was looking for trying
>>>> aarch64 in the past, but it also was unclear how to do it since there is
>>>> no DT support for the VirtIO-GPU, AFAICS.
>>>
>>> aarch64 uses acpi by default (can be disabled via 'qemu -no-acpi').
>>> Not fully sure about arm(v7).
>>>
>>> Even with DT it should work because DT only describes the virtio-mmio
>>> 'slots', not the actual virtio devices.
>>>
>>>> There is no virgl support because it's a virtio-gpu-device and not
>>>> virtio-gpu-device-gl that is PCI-only in Qemu. Hence everything seems good.
>>>
>>> It's named 'virtio-gpu-gl-device'
>>
>> Ah, thanks again! Just quickly tested virtio-gpu-gl-device and
>> everything works too for MMIO GPU on microvm, including virgl and Xorg
>> (glamor).
>>
>> [drm] features: +virgl +edid -resource_blob -host_visible
>> [drm] features: -context_init
>> [drm] number of scanouts: 1
>> [drm] number of cap sets: 2
>> [drm] cap set 0: id 1, max-version 1, max-size 308
>> [drm] cap set 1: id 2, max-version 2, max-size 696
>> [drm] Initialized virtio_gpu 0.1.0 0 for LNRO0005:01 on minor 0
>> virtio-mmio LNRO0005:01: [drm] drm_plane_enable_fb_damage_clips() not called
> 
> Cool.  Havn't found the time to try s390x, so I'm taking that as good
> enough test that we don't have any unnoticed dependencies on pci.
> 
> Queued up.  I'll go over a few more pending patches, and assuming no
> issues show up in testing this should land in drm-misc-next in a few
> hours.

Great, thank you.

-- 
Best regards,
Dmitry
