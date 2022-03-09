Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5DB4D2E78
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 12:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A23510E349;
	Wed,  9 Mar 2022 11:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD8610E349
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 11:55:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 8E7501F44A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646826925;
 bh=PynJJsoLYdl1Gvc0xzkLN+51ws0jXntVzWj+p9ce160=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dhtEPY66d4f949FzrfR1Gz129VcXzngI9xCwPitlNnWdd/t1ySgyteRFbpRcI03Hr
 kGYqsPdcvyWV9vc8TrTHTapgcflALoPO0AP4fvXBOyQDp5PriQZqU2VuSy/sPCvFT2
 3L4WmNNQsf01RrZAC/C3oafVO+EByoZMbfmY+bjxawYde9QrkHUsWiaflrxixu0EXt
 jz9uVUsdPTPE2WwXgn5Idz0s5x5UyeoFKZc3Z3hb4WJSs605WkaDmUKYQX7ssc9NFH
 9mbbab1IPlEMnzF1mnz4z8cm4vSuH7tTnI/I0wCU5X5Z8vtx1xkpmNwxO1/A45ECij
 ICu6WWaVn4+Yg==
Message-ID: <caa9a2ea-d1b4-fa96-0e90-37a89aa0c000@collabora.com>
Date: Wed, 9 Mar 2022 14:55:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <4ce1e172-799c-cba3-0a72-4a6fdf2c6d2f@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <4ce1e172-799c-cba3-0a72-4a6fdf2c6d2f@suse.de>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 3/9/22 11:59, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.03.22 um 14:17 schrieb Dmitry Osipenko:
>> Hello,
>>
>> This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
>> During OOM, the shrinker will release BOs that are marked as "not needed"
>> by userspace using the new madvise IOCTL. The userspace in this case is
>> the Mesa VirGL driver, it will mark the cached BOs as "not needed",
>> allowing kernel driver to release memory of the cached shmem BOs on
>> lowmem
>> situations, preventing OOM kills.
> 
> Virtio-gpu is build on top of GEM shmem helpers. I have a prototype
> patchset that adds a shrinker to these helpers. If you want to go
> further, you could implement something like that instead. Panfrost and
> lima also have their own shrinker and could certainly be converted to
> the gem-shmem shrinker.

I had a thought that it could be possible to unify shrinkers into a
common DRM framework. Could you please give me a link to yours prototype
patchset?
