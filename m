Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A575C567100
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 16:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BF52B8C5;
	Tue,  5 Jul 2022 14:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560DD2B8A4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 14:27:41 +0000 (UTC)
Received: from [192.168.2.145] (unknown [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C480166018E6;
 Tue,  5 Jul 2022 15:27:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657031259;
 bh=757BlfEAarcDB8teCnXP3bQ++sWI7M4gJpClxrlC6Tc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fAsFTqOvJYrGd2xQrzpm/dbaDi1m8N3QVLox3iMYe5PdwvY8tFS7kTWQNKUKwrwMb
 rU4bNx4CH995+WH4T5Ibp/uKOv3eSw8CYyUjkD5Kkbx0YlB7rHP7XxSQsJ/2c6MCmd
 Egtf1NFGPLUC+ZuwBdruCwIjWARqf9YPHB/VAAJdhuxqvv3TQKLA8FoknCj1EY5ffo
 11M80uepepqQCy8Z+YSr3VXlzo2yRSylu7WYjXHKUPN/Bri3UUXclLiYOGLLrpuEP5
 9up6wmSWsdLukPkXzgj9r7/yXNK76SKqdivQ42+IKCm2EmIlzovZYU8W5K08a1SQfm
 T7skAHXQciYMw==
Message-ID: <d2c64d09-c4bb-9aed-069d-a9b4d07a1f66@collabora.com>
Date: Tue, 5 Jul 2022 17:27:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 7/9] drm/virtio: Improve DMA API usage for shmem BOs
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
 <20220630200726.1884320-8-dmitry.osipenko@collabora.com>
 <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220705135323.emr4gdbcxoisdcxe@sirius.home.kraxel.org>
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
Cc: kernel@collabora.com, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko <digetx@gmail.com>,
 virtualization@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Gerd,

On 7/5/22 16:53, Gerd Hoffmann wrote:
>   Hi,
> 
>> -	 * So for the moment keep things as-is, with a bulky comment
>> -	 * for the next person who feels like removing this
>> -	 * drm_dev_set_unique() quirk.
> 
> Dragons lurking here.  It's not the first attempt to ditch this, and so
> far all have been rolled back due to regressions.  Specifically Xorg is
> notoriously picky if it doesn't find its expectations fulfilled.

I saw the previous attempt. Back then it was a mechanically created
patch that didn't get any testing.

> Also note that pci is not the only virtio transport we have.

The VirtIO indeed has other transports, but only PCI is really supported
in case of the VirtIO-GPU in kernel and in Qemu/crosvm, AFAICT. Hence
only the PCI transport was tested.

> What kind of testing has this patch seen?

The Xorg and virgl work perfectly fine in Qemu (with and without IOMMU
enabled in Qemu) and in crosvm (ChromeOS virtual machine).

-- 
Best regards,
Dmitry
