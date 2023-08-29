Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B90E078BCDF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 04:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752C710E39A;
	Tue, 29 Aug 2023 02:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB02E10E394;
 Tue, 29 Aug 2023 02:36:30 +0000 (UTC)
Received: from [192.168.2.140] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E3B966071DC;
 Tue, 29 Aug 2023 03:36:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693276589;
 bh=fO2UTLZenz76bcv930LCK2ALVC/MUnGbZGTSyAhqLbs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EhAFW/Q/uNzOaehV2hG3RKB8wqITechgFU6vjtVMO9Cg2TJJXRGyACdowNlnhohLn
 nB7nAvfbT2nGVGEfn2w6dUuMxbriKC7sOLCY4xwLnlo/9B4zyN+3vHVtE877JjsjeV
 oyqrasJ87bX9u5Yh4gnosdTv6OucniZs8hpi5VawDhwgP7RHiqgLPzk7K4yGVyJyn8
 vbd5tAKRfM6MlOjECpiPyIgFpvqVVmaKNX9o625sNcgMkMzqRQl/FAiBr9vOt+CtnI
 8TXlYixt4KnjlCLz9X3IN+taidCPSppNg9JtCHxoCStnUtjrCKbVR/ocqobfPsFw57
 2CRfC8Lo8Zqyw==
Message-ID: <a0119c05-6222-cc3b-1328-16224898b8ee@collabora.com>
Date: Tue, 29 Aug 2023 05:36:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v15 00/23] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
References: <6d93-64ecbc00-3-3c8ca040@163557744>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <6d93-64ecbc00-3-3c8ca040@163557744>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Melissa Wen <mwen@igalia.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel@collabora.com, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/28/23 18:24, Helen Mae Koike Fornazier wrote:
> On Monday, August 28, 2023 11:37 -03, "Helen Mae Koike Fornazier" <helen.koike@collabora.com> wrote:
> 
>> On Sunday, August 27, 2023 14:54 -03, Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>
>>> This series:
>>>
>>>   1. Adds common drm-shmem memory shrinker
>>>   2. Enables shrinker for VirtIO-GPU driver
>>>   3. Switches Panfrost driver to the common shrinker
>>
>> Hi Dmitry, 
>>
>> Would you mind testing with drm-ci? We virt-io tests there and it would be
>> really great to get your feedback of it.
>>
>> https://cgit.freedesktop.org/drm/drm/log/?h=topic/drm-ci
> 
> sorry, I forgot that you also need this patchset:
>     https://lists.freedesktop.org/archives/dri-devel/2023-August/420063.html
> to enable virtio_gpu test job.
> 
> Thanks again.
> Helen
> 
>>
>> You need to merge your changes with the above tree.
>> To configure it, you just need to have a tree on gitlab.freedesktop.org,
>> go to the settings and change the CI/CD configuration file from .gitlab-ci.yml
>> to drivers/gpu/drm/ci/gitlab-ci.yml, and you can start a pipeline
>> on your branch.
>>
>> at the time of this writting, gitlab.freedesktop.org is under maintenance,
>> but it should be back soon.

Thanks, Helen. I'll give it a try for the next version

-- 
Best regards,
Dmitry

