Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A194D9BD8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 14:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8895210E47C;
	Tue, 15 Mar 2022 13:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B6310E4B9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 13:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 777951F42E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647349851;
 bh=33AAkH9s29H6uygjWgaoSJbflOjcm0qgg2dEz6pYJB4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VJHjRw8IfW1HVBKHMW9GLkJCc7xHIhrvzaI+s1rr8QXFUxZmpuOMjzZbz9Ar/B4mY
 yM1moo7Iz5YiWmbnIF/lA3altQ9chKwiHviyDO6XuunEiI+oCBeCjFJ88xKwMgCvYy
 TxTAya+AdyNA2M1qrqFnktGLxR9ca/xEZu9qZ5LKWz56b6Rb0wT6qm8gqdx17BRfX8
 x5sTIWIvj0Um6TYNjAabDQSAYfn61lokAA43yFBGg34U0gN5HWydRJMEFo1Ly+0A3h
 HfL9iqdcDbl0i4S6dhtMGCvtVw4e88fL2VseP0XqK03pg/TsNHrL+wPeH5kZ11yVN6
 SWsGIWYsGN/og==
Message-ID: <fa7b0191-b9e0-de3a-22c1-8513195af426@collabora.com>
Date: Tue, 15 Mar 2022 16:10:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 0/8] Add memory shrinker to VirtIO-GPU DRM driver
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <CACvgo50Fxn6D1d2_20etnL1TWfNkzJFydyDgr6DwGKFoxzg0_A@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CACvgo50Fxn6D1d2_20etnL1TWfNkzJFydyDgr6DwGKFoxzg0_A@mail.gmail.com>
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

On 3/15/22 15:47, Emil Velikov wrote:
> On Mon, 14 Mar 2022 at 22:44, Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
> 
>> Dmitry Osipenko (8):
>>   drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
>>   drm/virtio: Check whether transferred 2D BO is shmem
>>   drm/virtio: Unlock GEM reservations in error code path
> 
> These three are legitimate fixes that we want regardless of the shrinker.
> 
> Please add the respective "Fixes" tag, so they find their way in the
> stable trees. With that, them 3 are:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Thank you, I already added stable tag to the first patch. The other
patches aren't critical for the stable kernels, IMO, but we can tag them
too for completeness. I'll do in v3.
