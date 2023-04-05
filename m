Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71C6D7152
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 02:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CED10E7FD;
	Wed,  5 Apr 2023 00:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1185D10E7FD;
 Wed,  5 Apr 2023 00:33:42 +0000 (UTC)
Received: from [192.168.2.153] (109-252-119-170.nat.spd-mgts.ru
 [109.252.119.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 28F00660315A;
 Wed,  5 Apr 2023 01:33:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680654820;
 bh=via3dJkBW0Q8Yv2lNNPhM1xz+EXuwPR73o7cexB8slY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aDnntxld9l5U1838pxs7NIC4zlfcPtaKCwF2NGov7MOFh4qL466qI5WvAOWi6K/p+
 ZkhfEgrvEKpMEAEWNeA7+GiBxa7JYxR6fyecM+semPnPuQACmYxaGCmugo9Vqkyj3n
 TQAGZC8fpSAaeF3FJbLOWfw3N1n5vgRXhihKtWuKAGqn5BtzqJ0qQUiTihANTbojgg
 DHjAQGEVYOV2cTUTTPSllrvfZEYWoAokSc+lIt5KXU7UGGB6hiyPdXEn5ssBoxrSVS
 RQ8UUiSIQrVm2QmeQgmDwrKAXz4J2Gt2o2A//CeZjkd23tpyvvZJfu3pHQ/4RTUZZw
 nnt2kzHwFxcGA==
Message-ID: <91788325-5050-9cf8-9246-5496d9db4df3@collabora.com>
Date: Wed, 5 Apr 2023 03:33:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 5/7] Revert "drm: Assert held reservation lock for
 dma-buf mmapping"
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230402164826.752842-1-dmitry.osipenko@collabora.com>
 <20230402164826.752842-6-dmitry.osipenko@collabora.com>
 <7854897f-67f8-e82c-3edf-e8ef923d2474@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <7854897f-67f8-e82c-3edf-e8ef923d2474@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/3/23 18:17, Christian König wrote:
> Am 02.04.23 um 18:48 schrieb Dmitry Osipenko:
>> Don't assert held dma-buf reservation lock on memory mapping of exported
>> buffer.
>>
>> We're going to change dma-buf mmap() locking policy such that exporters
>> will have to handle the lock. The previous locking policy caused deadlock
>> problem for DRM drivers in a case of self-imported dma-bufs, it's solved
>> by moving the lock down to exporters.
> 
> I only checked the TTM code path and think that at least that one should
> work fine.
> 
>> Fixes: 39ce25291871 ("drm: Assert held reservation lock for dma-buf
>> mmapping")
> 
> This here is not really a "fix" for the previous patch. We just found
> that we didn't like the behavior and so reverted the original patch.
> 
> A "Reverts..." comment in the commit message would be more appropriate I
> think.

Ack, will drop the fixes tag in v2. Thank you and Emil for the review.

-- 
Best regards,
Dmitry

