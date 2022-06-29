Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1571455FA51
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 10:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEC110E174;
	Wed, 29 Jun 2022 08:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111BF10E182;
 Wed, 29 Jun 2022 08:23:58 +0000 (UTC)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru
 [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C51C66018F6;
 Wed, 29 Jun 2022 09:23:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656491036;
 bh=TKplUYktuy+fI9Fnwv5CbrVDB+CILHnu464IQXTpgjg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hh50EXmRXalD8uakgN300BfHpmjducw9bC+QVgu+5qZJ+/06XJI6vmnwyVunKHvTu
 UurO0sBxI/nVuIlAr3VXYn58dM1imSvobu55OFj091KfdlQDYptmB3FkuxkWooYgI5
 NpSItA+GHgY6jPnWQbmqoBN/FD6L4QqvRvJdrRvwozQKplNFqn5bxByj5x7N8ZzztY
 1NGWfuHPh2QKNtJVxBm0HGaBnWhbCFAyCwSOa/+Zp73xpzBmDZHRMCEIF/ZeONMbYT
 XUq5kP9/+4sLtdAJWqQ7HViJKJJxcDwBrTJthLmqG4Pw4WwunvIZwT0lC3xjDWQAmJ
 8GjaWihLHjnhA==
Message-ID: <51d58fff-238e-33e9-20d0-0836b1197459@collabora.com>
Date: Wed, 29 Jun 2022 11:23:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 01/22] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-2-dmitry.osipenko@collabora.com>
 <d3fcb4ee-83ec-09b8-d1ef-0191512fda91@shipmail.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <d3fcb4ee-83ec-09b8-d1ef-0191512fda91@shipmail.org>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/22 23:12, Thomas Hellström (Intel) wrote:
> Hi,
> 
> On 5/27/22 01:50, Dmitry Osipenko wrote:
>> Use ww_acquire_fini() in the error code paths. Otherwise lockdep
>> thinks that lock is held when lock's memory is freed after the
>> drm_gem_lock_reservations() error. The WW needs to be annotated
>> as "freed"
> 
> s /WW/ww_acquire_context/ ?
> s /"freed"/"released"/ ?
> 
> 
>> , which fixes the noisy "WARNING: held lock freed!" splat
>> of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.
>>
>> Cc: stable@vger.kernel.org
> 
> Can you dig up the commit in error and add a Fixes: Tag?
> 
> Using that and "dim fixes" will also make the Cc: stable tag a bit more
> verbose.
> 
> With that fixed,
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I'll update this patch, thank you for taking a look.

-- 
Best regards,
Dmitry
