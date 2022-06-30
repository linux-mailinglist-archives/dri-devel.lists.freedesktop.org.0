Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B422D562416
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA65C12A249;
	Thu, 30 Jun 2022 20:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3543912A26F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:23:05 +0000 (UTC)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru
 [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D012C660196E;
 Thu, 30 Jun 2022 21:23:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656620583;
 bh=1v+6BIiQfnlEpsbZeQo8zPsdXAp9SuOZj8i80daLiwc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P69XYB0fXO5KxnstqDFC7Z6J4IyUeL+7tTDTninT2yyPlMsceNxziM91IXFo72ded
 xxoUMj7t5JIYcLXZYFokWqicvqhtYW+pNbg87S5FIpWUOLP0oLPx9AW8vwJJ4BpfAq
 62m9qRCesmuxwgc5wScbtvHUcM/GtCs0rO8BBHvDzyrfkYw+J/6+1ThmidAXVsQuAB
 fsSx/W+GuqL0BWbpAHk+P/M3XkmW+GM1a3xdiH8icCJ9TM6aJsFP2ha+3hEydRrDwc
 vkRRk+fjFf6XNN3V1MMKEgWMNvnMkpxqKocxE67yQ3K8HvGYhshske+7HURrsnbhRT
 KxAAnN1XE8MOA==
Message-ID: <8ab15669-889b-1119-9323-ec47689c7fb7@collabora.com>
Date: Thu, 30 Jun 2022 23:22:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 2/2] drm/gem: Don't map imported GEMs
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220630200405.1883897-1-dmitry.osipenko@collabora.com>
 <20220630200405.1883897-3-dmitry.osipenko@collabora.com>
 <75b677b6-c704-e270-c921-93c982020c38@shipmail.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <75b677b6-c704-e270-c921-93c982020c38@shipmail.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 6/30/22 23:15, Thomas Hellström (Intel) wrote:
> Hi, Dmitry,
> 
> On 6/30/22 22:04, Dmitry Osipenko wrote:
>> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
>> handle imported dma-bufs properly, which results in mapping of something
>> else than the imported dma-buf. On NVIDIA Tegra we get a hard lockup when
>> userspace writes to the memory mapping of a dma-buf that was imported
>> into
>> Tegra's DRM GEM.
>>
>> Majority of DRM drivers prohibit mapping of the imported GEM objects.
>> Mapping of imported GEMs require special care from userspace since it
>> should sync dma-buf because mapping coherency of the exporter device may
>> not match the DRM device. Let's prohibit the mapping for all DRM drivers
>> for consistency.
>>
>> Cc: stable@vger.kernel.org
>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> This might break drivers whose obj->funcs->mmap() callback already
> handles this case, and has userspace that does the right thing.

The drm-shmem helper should be the only that maps imported GEMs
properly, but drivers that use drm-shmem already prohibit to map
imported GEMs. Okay, I'll try to re-check once again to be sure.

> I think the disabling must be checked on a per-driver basis to avoid
> that; in particular drivers that already call dma_buf_mmap() should be
> able to continue doing this.
> 
> Also the Fixes: review comment remains,

This should've been broken forever, don't think that we have a fixes tag
here. I looked thought all my previous patches and added the Fixes
wherever was possible. If I really missed something, then please let me
know.

-- 
Best regards,
Dmitry
