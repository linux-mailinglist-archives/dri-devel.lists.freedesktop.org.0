Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E54D216A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14AF10E408;
	Tue,  8 Mar 2022 19:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E174010E408
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:28:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 8E2181F444B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646767685;
 bh=wTrQZzTeDzl3S/Woe+temKvCkXTTxdkP03ZFoe6Rj9E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JaIccFmi1jX1ewpbOHkkQGyiOhdvqKxkBql/3KQWmeEBQn/mP+wHpnZhb1wis3XJI
 XZhjoIwXc65vjwfJ/RWJzRoRjZQ17T4hYNBj1rk3qnMxIBzU2jmPIgD53sRpDbTvCA
 L5xqICzA0o8+u8NbxpCDnGKpDaGP08JoVK46goArxgFJElNE/jkMtCa15MfDt/YGzi
 LYURN3gjJ0/HMiCflPowekOpYyKzx0v55sCPVNEipd7jXFkRabu2pEmsAeOc8J+/+p
 EV4yRSp29+JTPdXCnN+2MrvPyFySxaO9NBklmjUqlJftdKQ6RDxPu8nNXlPWuZh1+k
 0ZqbjSNLJScNg==
Message-ID: <d2290971-ea22-8203-631e-b896c76a994b@collabora.com>
Date: Tue, 8 Mar 2022 22:28:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <CAF6AEGt=aVJ9nR+Wv+bJEFZrn-cNOSNXG1TaJr=Cx-FTgutwKA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGt=aVJ9nR+Wv+bJEFZrn-cNOSNXG1TaJr=Cx-FTgutwKA@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gert Wollny <gert.wollny@collabora.com>,
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

On 3/8/22 19:29, Rob Clark wrote:
> On Tue, Mar 8, 2022 at 5:17 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> Hello,
>>
>> This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
>> During OOM, the shrinker will release BOs that are marked as "not needed"
>> by userspace using the new madvise IOCTL. The userspace in this case is
>> the Mesa VirGL driver, it will mark the cached BOs as "not needed",
>> allowing kernel driver to release memory of the cached shmem BOs on lowmem
>> situations, preventing OOM kills.
> 
> Will host memory pressure already trigger shrinker in guest? 

The host memory pressure won't trigger shrinker in guest here. This
series will help only with the memory pressure within the guest using a
usual "virgl context".

Having a host shrinker in a case of "virgl contexts" should be a
difficult problem to solve.

> This is
> something I'm quite interested in for "virtgpu native contexts" (ie.
> native guest driver with new context type sitting on top of virtgpu),

In a case of "native contexts" it should be doable, at least I can't see
any obvious problems. The madvise invocations could be passed to the
host using a new virtio-gpu command by the guest's madvise IOCTL
handler, instead-of/in-addition-to handling madvise in the guest's
kernel, and that's it.

> since that isn't using host storage

s/host/guest ?
