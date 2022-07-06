Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20324568597
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DB110E5DE;
	Wed,  6 Jul 2022 10:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0BE10E5DE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657103451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ui9lVcAZsrGbvPVS6CAZzPnKKC1Klf1sd+F6uPmz44s=;
 b=ELu27QcwWTSxi/PRHaLG4fp5PD3eSaJgaKx0v75JJ8MXA8I1nUkzc5zUfwZlEtlvHQTFFx
 FnNwR1fDFmP7ZKDzNiBxL3cajPGDoRaY/R36JEHAqVbmKvsJu0P3p0GNSe8wJQbCzkPnTp
 0y6DD3KJxQwHJqFGJEBUGprXSDJKRJI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-wVju4HtROw-Fx_EFFXn8AQ-1; Wed, 06 Jul 2022 06:30:48 -0400
X-MC-Unique: wVju4HtROw-Fx_EFFXn8AQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6B28101A54E;
 Wed,  6 Jul 2022 10:30:47 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.194.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96FF6492C3B;
 Wed,  6 Jul 2022 10:30:44 +0000 (UTC)
Subject: Re: [PATCH v7 7/9] drm/virtio: Improve DMA API usage for shmem BOs
To: Emil Velikov <emil.velikov@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
 <20220630200726.1884320-8-dmitry.osipenko@collabora.com>
 <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
 <d2c64d09-c4bb-9aed-069d-a9b4d07a1f66@collabora.com>
 <20220705154507.67ovlun4m26xzppn@sirius.home.kraxel.org>
 <1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com>
 <YsSlcStOXz2fnlON@arch-x1c3>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b2682447-cccd-18cb-865b-3cfd8d8b4125@redhat.com>
Date: Wed, 6 Jul 2022 12:30:42 +0200
MIME-Version: 1.0
In-Reply-To: <YsSlcStOXz2fnlON@arch-x1c3>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

On 07/05/22 22:56, Emil Velikov wrote:
> On 2022/07/05, Dmitry Osipenko wrote:
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
>>
>> I booted kernel with this patchset applied and everything is okay, Xorg
>> works.
>>
>>  [drm] Initialized virtio_gpu 0.1.0 0 for LNRO0005:01 on minor 0
>>  virtio-mmio LNRO0005:01: [drm] drm_plane_enable_fb_damage_clips() not
>> called
>>  virtio-mmio LNRO0005:01: [drm] fb0: virtio_gpudrmfb frame buffer device
>>
>> There is no virgl support because it's a virtio-gpu-device and not
>> virtio-gpu-device-gl that is PCI-only in Qemu. Hence everything seems good.
>>
>> I'd appreciate if you could give s390x a test.. I never touched s390x
>> and it will probably take some extra effort to get into it.
>>
> 
> Adding Laszlo Ersek, who debugged and tested this the last time.
> 
> Laszlo Ersek do ypu have some tips for Dmitry? Xorg seems to be
> working on his end with the drm_drv_set_unique(... "pci:...") call
> removed.
> 
> Original patch can be found at:
> https://lore.kernel.org/dri-devel/1380526d-17fb-6eb2-0fd5-5cddbdf0a92e@collabora.com/T/#mbc1a1bedc91d1855007188a725c5c75bbc771cf0

thanks for recalling this, but... I've moved to different projects, and
I'm already scraping the bottom of the barrel for every chunk of time I
can find :(

Laszlo

