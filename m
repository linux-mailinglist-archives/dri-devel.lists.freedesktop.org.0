Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FA34D2E7C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 12:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A6210E3E7;
	Wed,  9 Mar 2022 11:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9470510E3E7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 11:55:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 5D8B61F44A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646826940;
 bh=dJmw4zOrIHkURAmLQiTZMGndrEkge+z8fLKmyH944ng=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lzcJwR+xt1Hi8zjGE4UgpY3rbII3w72kn/wdkoJY0oZKJ9pzvD/YNCuQY2JgOUcgu
 IIMJ4teyyYm+lIooNRL4ucJE4cCnUAK2tGNpc2vZqkp7yjbHxivzwLqJHF+wWk7bd7
 AbfK1dYuMW9v4Pj1MHR8nDciE0aJij8ookDYocuwVasuo8i42d6G+I6ORcCYE/rXBc
 HHpJ3VRi5ynK0kzALfafF87gYjdAAD1w4DzDqYd5MdOdL0Lv0Qg/lZXqz5TIh4xNRd
 F7qa8nuXGqfb6EFSdLlQt7VUaiqXMzPL7vK78nwEiPw/xoPmUxGl/7kaktl/W6ke/F
 P53OZjZwjW4zA==
Message-ID: <26ab770d-4b59-a25a-79ef-e43858e7b67b@collabora.com>
Date: Wed, 9 Mar 2022 14:55:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 5/5] drm/virtio: Add memory shrinker
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <20220308131725.60607-6-dmitry.osipenko@collabora.com>
 <CAF6AEGvVmV4fesd0MsSo-4WxSVqOFN-U+p5HOE2job6CeYbqTA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGvVmV4fesd0MsSo-4WxSVqOFN-U+p5HOE2job6CeYbqTA@mail.gmail.com>
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
Cc: Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/9/22 04:12, Rob Clark wrote:
>> +static unsigned long
>> +virtio_gpu_gem_shrinker_count_objects(struct shrinker *shrinker,
>> +                                     struct shrink_control *sc)
>> +{
>> +       struct drm_gem_shmem_object *shmem;
>> +       struct virtio_gpu_device *vgdev;
>> +       unsigned long count = 0;
>> +       bool empty = true;
>> +
>> +       vgdev = container_of(shrinker, struct virtio_gpu_device,
>> +                            vgshrinker.shrinker);
>> +
>> +       if (!mutex_trylock(&vgdev->mm_lock))
>> +               return 0;
> One bit of advice from previously dealing with shrinker and heavy
> memory pressure situations (turns out 4GB chromebooks can be pretty
> much under *constant* memory pressure):
> 
> You *really* want to make shrinker->count_objects lockless.. and
> minimize the lock contention on shrinker->scan_objects (ie.  The
> problem is you can end up with shrinking going on on all CPU cores in
> parallel, you want to not funnel that thru one lock as much as
> possible.
> 
> See in particular:
> 
> 25ed38b3ed26 ("drm/msm: Drop mm_lock in scan loop")
> cc8a4d5a1bd8 ("drm/msm: Avoid mutex in shrinker_count()")

Thank you, I'll take that into account for v2.
