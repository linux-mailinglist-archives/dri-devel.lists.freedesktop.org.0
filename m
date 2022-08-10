Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F2758F1EE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 19:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A0A10F85E;
	Wed, 10 Aug 2022 17:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E88711350F;
 Wed, 10 Aug 2022 17:50:00 +0000 (UTC)
Received: from [192.168.2.145] (unknown [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D62E36601B74;
 Wed, 10 Aug 2022 18:49:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660153798;
 bh=pDHN4Gq67YC5dkFkOigxG5qVuMpoiLudRbA2dlJSe60=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dx5zUXAvOHpPG48aUabRl4+njgRCDMJzHPNbYmdwo/RrQaYohgnMXvlpCz6ESzyKs
 ngzi4Hf9SaHlQm+ddXoAVN+akYwgvtFkSA20LqsgtGm2i+fN5LnbRUM12j66sGvfut
 405XDLhmATvxt75b00LbDt5bM7vhAV59hvardycmuItJ28RJJs57P9QBEwm4ARIJ4N
 Xr4LNfrsIBiE9revYn9VBAzA/V28mbhwQUOxsElunyWLFP9ZQpPw69GpUcbMWFAEk2
 z8VCIqgHR6yyvRNwNJ57VkSQ1xch+gMPcB/ET5a4BOPLluJFgFU8esaLMJAfvVlpuY
 Juvao4qkUCZIQ==
Message-ID: <562fbacf-3673-ff3c-23a1-124284b4456c@collabora.com>
Date: Wed, 10 Aug 2022 20:49:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Linaro-mm-sig] [PATCH v2 3/5] dma-buf: Move all dma-bufs to
 dynamic locking specification
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
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
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220725151839.31622-1-dmitry.osipenko@collabora.com>
 <20220725151839.31622-4-dmitry.osipenko@collabora.com>
 <6c8bded9-1809-608f-749a-5ee28b852d32@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <6c8bded9-1809-608f-749a-5ee28b852d32@gmail.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/22 14:30, Christian König wrote:
> Am 25.07.22 um 17:18 schrieb Dmitry Osipenko:
>> This patch moves the non-dynamic dma-buf users over to the dynamic
>> locking specification. The strict locking convention prevents deadlock
>> situation for dma-buf importers and exporters.
>>
>> Previously the "unlocked" versions of the dma-buf API functions weren't
>> taking the reservation lock and this patch makes them to take the lock.
>>
>> Intel and AMD GPU drivers already were mapping imported dma-bufs under
>> the held lock, hence the "locked" variant of the functions are added
>> for them and the drivers are updated to use the "locked" versions.
> 
> In general "Yes, please", but that won't be that easy.
> 
> You not only need to change amdgpu and i915, but all drivers
> implementing the map_dma_buf(), unmap_dma_buf() callbacks.
> 
> Auditing all that code is a huge bunch of work.
Hm, neither of drivers take the resv lock in map_dma_buf/unmap_dma_buf.
It's easy to audit them all and I did it. So either I'm missing
something or it doesn't take much time to check them all. Am I really
missing something?

https://elixir.bootlin.com/linux/latest/A/ident/map_dma_buf

-- 
Best regards,
Dmitry
