Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10937F5381
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 23:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158CD10E6AD;
	Wed, 22 Nov 2023 22:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F82210E6A7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 22:41:10 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CF1CD6602F39;
 Wed, 22 Nov 2023 22:41:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700692869;
 bh=YLlCSf+NzrZNydyhBp3MPNZ8G11GHErGKOTZJ/5sNTo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=QBrdsNMTMonJCrJHGiT37mW1eIW+Qf/tKsEL71pMVOtdkrALk92oZ3AcNnUF0S6HG
 dJRMJzXNzT7cAV1Hrz4mTTqKNnRnQvgEfO83o5W9qj47FkWf3joxqxsoyiUyBPQZxp
 Am2KPFZ0OU+YcWhtXofm8EU9SBcUnM6HwCS6UNlGJBYX9lBFX/LqhuJm6C2NTlWtvc
 h5lctqxjtBd27m4tjywS09u+UaRPFQFdyzOnLTmnRC6DWVI95Z2nRzSnIlZSK1f3HI
 MBIseQ7VHz8idIqu9xpr4hDgBMV2+JvCgEJmI6vqux7NmuPn0vY5tU3V+DJ5LwHXGg
 bauxjH8z3J7UQ==
Message-ID: <88b34086-894e-9697-37ca-2492b15e3b83@collabora.com>
Date: Thu, 23 Nov 2023 01:41:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v18 24/26] drm/virtio: Attach shmem BOs dynamically
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-25-dmitry.osipenko@collabora.com>
 <20231113105745.7543e8dd@collabora.com>
 <fe7188d5-d70c-0f4a-7998-99f2efcffdb6@collabora.com>
In-Reply-To: <fe7188d5-d70c-0f4a-7998-99f2efcffdb6@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/23 01:37, Dmitry Osipenko wrote:
> On 11/13/23 12:57, Boris Brezillon wrote:
>> On Mon, 30 Oct 2023 02:02:03 +0300
>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>
>>> Prepare for addition of memory shrinker support by attaching shmem pages
>>> to host dynamically on first use. Previously the attachment vq command
>>> wasn't fenced and there was no vq kick made in the BO creation code path,
>>> hence the attachment already was happening dynamically, but implicitly.
>>> Making attachment explicitly dynamic will allow to simplify and reuse more
>>> code when shrinker will be added. The virtio_gpu_object_shmem_init() now
>>> works under the held reservation lock, which will be important to have for
>>> shrinker to avoid moving pages while they are in active use by the driver.
>> Ah, this commit might actually help getting rid of the workaround
>> introduced in "drm/shmem-helper: Add common memory shrinker".
> 
> Not really. The virtio_gpu_free_object() is unchanged, it's only
> allocation that is being deferred and it's only done for a one BO type
> (virtio-gpu has multiple BO types).

s/allocation/attachment/

Pages are still allocated by virtio_gpu_object_create().

-- 
Best regards,
Dmitry

