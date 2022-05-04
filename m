Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC2B51A4AE
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 17:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F50B10FA26;
	Wed,  4 May 2022 15:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BDD10FB78
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 15:56:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 478DB1F40634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651679773;
 bh=1dbN4nFjs1ZU9AbwFTQVSVGVTTZaAX6p2stgC9p4AV4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=UQolCib8xbSbTeRXQmvUImT32XDSpm/uvRyIuMMP4d/dxUvk0i6JxUwZUPoiP/TxM
 SKXMbJXhcqXETLEi35HVHtdqEy68kIHwEuOasD9rk/EIOoqcy1uxZex4kFHCE2Sy2Z
 zptiu4Jhl6OYeI1PrIkGxGatt1j7I0fso8Y5hVZFL+SfrfYpaCffF7UmwxQGsWlGDQ
 dFVRZUC1uC362HNlpM9dxFx4gH0rKIyyKAah2Q2+IOouSG1s4nzu31tLh0XBCBd7qr
 rkb2v4xFV6WS1QWMdVhM5evhoLdcSpG8GUeexXWS9lFGs4tg5dV8bsKvBg5ONixtrr
 iLpRv2noMdRyg==
Message-ID: <01506516-ab2f-cb6e-7507-f2a3295efb59@collabora.com>
Date: Wed, 4 May 2022 18:56:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 10/15] drm/shmem-helper: Take reservation lock instead
 of drm_gem_shmem locks
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-11-dmitry.osipenko@collabora.com>
 <248083d2-b8f2-a4d7-099d-70a7e7859c11@suse.de>
 <d9e7bec1-fffb-e0c4-8659-ef3ce2c31280@collabora.com>
 <YmlYHNlcmNMfOeyy@phenom.ffwll.local>
 <8f932ab0-bb72-8fea-4078-dc59e9164bd4@collabora.com>
 <YnI3lE0TxLfZaQjE@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <YnI3lE0TxLfZaQjE@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/22 11:21, Daniel Vetter wrote:
...
>>> - Maybe also do what you suggest and keep a separate lock for this, but
>>>   the fundamental issue is that this doesn't really work - if you share
>>>   buffers both ways with two drivers using shmem helpers, then the
>>>   ordering of this vmap_count_mutex vs dma_resv_lock is inconsistent and
>>>   you can get some nice deadlocks. So not a great approach (and also the
>>>   reason why we really need to get everyone to move towards dma_resv_lock
>>>   as _the_ buffer object lock, since otherwise we'll never get a
>>>   consistent lock nesting hierarchy).
>>
>> The separate locks should work okay because it will be always the
>> exporter that takes the dma_resv_lock. But I agree that it's less ideal
>> than defining the new rules for dma-bufs since sometime you will take
>> the resv lock and sometime not, potentially hiding bugs related to lockings.
> 
> That's the issue, some importers need to take the dma_resv_lock for
> dma_buf_vmap too (e.g. to first nail the buffer in place when it's a
> dynamic memory manager). In practice it'll work as well as what we have
> currently, which is similarly inconsistent, except with per-driver locks
> instead of shared locks from shmem helpers or dma-buf, so less obvious
> that things are inconsistent.
> 
> So yeah if it's too messy maybe the approach is to have a separate lock
> for vmap for now, land things, and then fix up dma_buf_vmap in a follow up
> series.

The amdgpu driver was the fist who introduced the concept of movable
memory for dma-bufs. Now we want to support it for DRM SHMEM too. For
both amdgpu ttm and shmem drivers we will want to hold the reservation
lock when we're touching moveable buffers. The current way of denoting
that dma-buf is movable is to implement the pin/unpin callbacks of the
dma-buf ops, should be doable for shmem.

A day ago I found that mapping of imported dma-bufs is broken at least
for the Tegra DRM driver (and likely for others too) because driver
doesn't assume that anyone will try to mmap imported buffer and just
doesn't handle this case at all, so we're getting a hard lockup on
touching mapped memory because we're mapping something else than the
dma-buf.

My plan is to move the dma-buf management code to the level of DRM core
and make it aware of the reservation locks for the dynamic dma-bufs.
This way we will get the proper locking for dma-bufs and fix mapping of
imported dma-bufs for Tegra and other drivers.

-- 
Best regards,
Dmitry
