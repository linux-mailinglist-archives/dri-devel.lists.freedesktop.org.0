Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA884DB302
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 15:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FB510E5E0;
	Wed, 16 Mar 2022 14:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B92210E5E0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 14:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 7C6C51F446BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647440634;
 bh=/+1jMsTuGfyM9tAc0LJ0oAzRyZbFMVXpcUs37THZdNA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ay2xIE3SmlC7qBGaqVOyicXDU1zXPcsq9e/mJbym99HPurDWneWzgRyrOxaIQ4ok9
 GvbA+fV8OGVKgoGCwstBkv/ZAvMlFAaHJnS7PAM+lJlu+CfoncbuBXEVeRyKodsYkX
 xzONZVZdPiqR1UD25SzPMcIg8AqAixEGqy5Ch9jflZ7jTlfUIKwLEK2H9AXE3a6bLt
 mneuww9fK/bMgnFo7uiVUBCtgoQGYiKvK74TunbAe/qh3HtV4HnZOF/cNrw7gggyz8
 md/I9pY7vnLLqTHrz1CkaWRVNFjSvzyox7WQNuvUl9ORpYWVu6X72eiZAxq61z4qOR
 CsxomGU7C4xoQ==
Message-ID: <16a43784-27d4-6362-5e4d-465ddc5e5380@collabora.com>
Date: Wed, 16 Mar 2022 17:23:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 7/8] drm/virtio: Support memory shrinking
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-8-dmitry.osipenko@collabora.com>
 <CACvgo52-pd-g=ZnR=m0T7W2yQ4i7_Q6gWy22=vm-fX+eA-YwQg@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CACvgo52-pd-g=ZnR=m0T7W2yQ4i7_Q6gWy22=vm-fX+eA-YwQg@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/15/22 15:43, Emil Velikov wrote:
> Greetings everyone,
> 
> Food for thought: Would it make sense to have the madvise ioctl as
> generic DRM one?
> Looking around - i915, msm & panfrost already have one and the virtio
> implementation [below] seems as generic as it gets.
> 
> On Mon, 14 Mar 2022 at 22:44, Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
> 
>> +#define VIRTGPU_MADV_WILLNEED 0
>> +#define VIRTGPU_MADV_DONTNEED 1
>> +struct drm_virtgpu_madvise {
>> +       __u32 bo_handle;
>> +       __u32 retained; /* out, non-zero if BO can be used */
>> +       __u32 madv;
>> +       __u32 pad;
> 
> This seems to be based on panfrost/msm yet names (bo_handle vs
> handle), layout and documentation varies.
> Why is that - copy/paste is cheap :-P

Indeed, there is copy/pasting among drivers. But I'm doubtful about
making madvise a generic ioctl because some drivers already have own
ioctl for that and h/w capabilities vary, so some drivers may want to
have extra features later on and then this doesn't feel like a common
thing anymore.
