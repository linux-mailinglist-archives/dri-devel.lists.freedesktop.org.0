Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47A69AC8E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4023210E008;
	Fri, 17 Feb 2023 13:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9B410E008
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:33:06 +0000 (UTC)
Received: from [192.168.2.109] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DAA8E66021A1;
 Fri, 17 Feb 2023 13:33:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676640784;
 bh=LHqK6LYCPE0VY2DnsGg0vo4yHI7Qo4pP8zL8Xtt3+Z4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Sohn8vDPso6QeihpOHXUtuqwopnnGqSK7Lph8hS/lCITVT5ahzoP84hvASuv0hDee
 hF/zC87L+l9RlH70UeJUkuhOs5nOw6Z5+xyAlFVemozc5RKHgKr9M+Sgc8erh/D3E3
 jkkcQ3BQCMvNvdlMoeObhAUBKslsVor/9i7/Dd/YCq46H9YvM6lOTmear90uDgQL+v
 bTKRlM18lN4AhvU6lPGMJXs5RMFAVI+qbrNlvJEWJYZhTSmjf3RVxEpEJU/HUO5NjK
 OPKSri9EB4Z+F0KjN6MtRzsGCbF+9aWIxP10icmZcuXV2IhIVhvQkq+Ux7tyk2dFkA
 AudZX1WskAVyg==
Message-ID: <c185946a-0a59-9f6e-9592-20b93f45514e@collabora.com>
Date: Fri, 17 Feb 2023 16:33:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 07/11] drm/shmem-helper: Switch to reservation lock
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
 <20230108210445.3948344-8-dmitry.osipenko@collabora.com>
 <ca7e1d45-8843-8ae1-de0b-3f917e84b41e@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ca7e1d45-8843-8ae1-de0b-3f917e84b41e@suse.de>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/23 15:52, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.01.23 um 22:04 schrieb Dmitry Osipenko:
>> Replace all drm-shmem locks with a GEM reservation lock. This makes locks
>> consistent with dma-buf locking convention where importers are
>> responsible
>> for holding reservation lock for all operations performed over dma-bufs,
>> preventing deadlock between dma-buf importers and exporters.
>>
>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> How much testing has this patch seen?
> 
> I'm asking because when I tried to fix the locking in this code, I had
> to review every importer to make sure that it aquired the lock. Has this
> problem been resolved?

The dma-buf locking rules was merged to v6.2 kernel.

I tested all the available importers that use drm-shmem. There were
deadlocks and lockdep warnings while I was working/testing the importer
paths in the past, feel confident that the code paths were tested well
enough. Note that Lima and Panfrost always use the importer paths in
case of display because display is a separate driver.

I checked that:

- desktop environment works
- 3d works
- video dec (v4l2) dmabuf sharing works
- shrinker works

I.e. tested it all with VirtIO-GPU, Panfrost and Lima drivers. For
VirtIO-GPU importer paths aren't relevant because it can only share bufs
with other virtio driver and in upstream we only have VirtIO-GPU driver
supporting dma-bufs.

-- 
Best regards,
Dmitry

