Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D58847745F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7DE11225C;
	Thu, 16 Dec 2021 14:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 790E911225B;
 Thu, 16 Dec 2021 14:23:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BD1A1435;
 Thu, 16 Dec 2021 06:23:05 -0800 (PST)
Received: from [10.57.5.127] (unknown [10.57.5.127])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187A23F73B;
 Thu, 16 Dec 2021 06:23:03 -0800 (PST)
Subject: Re: [bug report] new kvmalloc() WARN() triggered by DRM ioctls
 tracking
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20211216120806.GA3691@kili>
 <8b02c4d8-cf36-6558-6e1d-9a0955483f4e@arm.com>
 <20211216151513.14ca3e8c@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <efd97179-881c-331f-dd5c-cf2fe3db33ec@arm.com>
Date: Thu, 16 Dec 2021 14:23:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216151513.14ca3e8c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: lima@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/12/2021 14:15, Boris Brezillon wrote:
> Hi Steve,
> 
> On Thu, 16 Dec 2021 14:02:25 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> + Boris
>>
>> On 16/12/2021 12:08, Dan Carpenter wrote:
>>> Hi DRM Devs,
>>>
>>> In commit 7661809d493b ("mm: don't allow oversized kvmalloc() calls")
>>> from July, Linus added a WARN_ONCE() for "crazy" allocations over 2GB.
>>> I have a static checker warning for this and most of the warnings are
>>> from DRM ioctls.
>>>
>>> drivers/gpu/drm/lima/lima_drv.c:124 lima_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/radeon/radeon_cs.c:291 radeon_cs_parser_init() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/v3d/v3d_gem.c:311 v3d_lookup_bos() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/v3d/v3d_gem.c:319 v3d_lookup_bos() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/v3d/v3d_gem.c:601 v3d_get_multisync_post_deps() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:476 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:477 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:478 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:479 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/virtio/virtgpu_ioctl.c:186 virtio_gpu_execbuffer_ioctl() warn: uncapped user size for kvmalloc() will WARN
>>> drivers/gpu/drm/panfrost/panfrost_drv.c:198 panfrost_copy_in_sync() warn: uncapped user size for kvmalloc() will WARN  
>>
>> I believe this one in Panfrost would be fixed by Boris's series
>> reworking the submit ioctl[1].
>>
>> Boris: are you planning on submitting that series soon - or is it worth
>> cherry picking the rework in patch 5 to fix this issue?
> 
> Don't know when I'll get back to it, so I'd recommend cherry-picking
> what you need.

Thanks, no problem - it was mostly when I looked at the code I had the
feeling that "surely this has already been fixed", then discovered your
series was never merged ;)

I'll hammer out a patch for this one issue.

Thanks,

Steve
