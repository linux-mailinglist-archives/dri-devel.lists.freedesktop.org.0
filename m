Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6399B627316
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 23:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A42C10E110;
	Sun, 13 Nov 2022 22:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CD210E110
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Nov 2022 22:55:19 +0000 (UTC)
Received: from [192.168.2.248] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 437F36601FAA;
 Sun, 13 Nov 2022 22:55:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668380117;
 bh=F03dUGn7tUZsgV2kBeJ7WoSqe3zgZ1vmINxDLXObmMY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=iyW4Y2SB+TOshLi/YRYZ/rPdzXhchtZL3QJMHX9UGg2BGjYBt/nNVhEjt+JTlC2tU
 l9tJHSR42z4EC4ukScQRb/hK7DSyZVV6Cm/Zp0UmYeUQRLIsvwvQmQiizNT1ZVuA1p
 trwlmcbqA4Faj2KcAvh6NrQ46+s/X8uZXe30tjjYGIWu7pRfWHCvtgLQ9VIiAPd47e
 gaEOB4B0mi+4nvjmVow0KozTJ1ZHyyyDWkoPUUdjkoL9LMopjdk2/knI6O/iWlfJQc
 8KLD2q7rv8B9WdGLsuJHB5BFhNn0Px2yXwA25CyPJpwxGf4XXbdUIqJNa2RjSk4RVy
 e97+1mCpb3l2g==
Message-ID: <061ca923-866d-2d31-8084-f4133e05b171@collabora.com>
Date: Mon, 14 Nov 2022 01:55:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: dealock in drm_fb_helper_damage_work
To: Dmitry Vyukov <dvyukov@google.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, DRI <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <CACT4Y+bJiZgT1W4JY+X=aZjbg8+X2fw7j2pxH_Hke_yn7R0Qnw@mail.gmail.com>
 <CACT4Y+YFtMzmDyHH8Uf2Q69xBAP6gVg+hN2Gz-+cj=K79U8okg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CACT4Y+YFtMzmDyHH8Uf2Q69xBAP6gVg+hN2Gz-+cj=K79U8okg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/13/22 23:48, Dmitry Vyukov wrote:
>> Hi,
>>
>> I am getting the following deadlock on reservation_ww_class_mutex
>> while trying to boot next-20221111 kernel:
> The code is recently added by this commit:
> 
> commit 79e2cf2e7a193473dfb0da3b9b869682b43dc60f
> Author: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Date:   Mon Oct 17 20:22:11 2022 +0300
>     drm/gem: Take reservation lock for vmap/vunmap operations

Thanks for the report. I reproduced this problem using bochs driver,
will send the fix ASAP.

-- 
Best regards,
Dmitry

