Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920F577852
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 23:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC479528E;
	Sun, 17 Jul 2022 21:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24695294
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 21:34:51 +0000 (UTC)
Received: from [192.168.2.145] (unknown [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BCC44660162D;
 Sun, 17 Jul 2022 22:34:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658093690;
 bh=i4QymuUHYztFZ5J+hCuIJ6iBjAkj2MgX/8KDFk37Clo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Jy8SbpCfW7nUWeD0HfyB3wO0k/nexSOnw8Fq/5ZQ6nbhvPnEfqtlq8/s5B0TNy6Fn
 P7EzHcDQpljBwSHQar8S3Afmn2ISWVKljYhV1qFm2kfnpplKOb8PHtFgCQVup9XJ3M
 4p2XZs4U2oDxiufUg904xEuppGAoCvMWWhfEhkFTgamZXPqSST7nnKTQWaYAxqrjvg
 sf3HZAMaowd/jI/ofwq0M24Qz665/UDtcLsiYd2P7YH8Hn4ULGeHFmCP9/fZTMQ5os
 AahjKPF+gThw7ho9RN1V3HTyCwUjaDdbbKcLFUTB1xUgUyYfJkqshruz201FKlVEte
 LVgG77IEgFTMg==
Message-ID: <21fd2564-40f0-4460-2c32-04d394e09847@collabora.com>
Date: Mon, 18 Jul 2022 00:34:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220715111533.467012-1-christian.koenig@amd.com>
 <e71431ef-bcb9-012a-ff0d-4ef350cd232e@suse.de>
 <5bdedd05-3620-5082-1e6f-c3f6bbae9cc5@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <5bdedd05-3620-5082-1e6f-c3f6bbae9cc5@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/22 18:58, Christian König wrote:
> Am 15.07.22 um 17:36 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 15.07.22 um 13:15 schrieb Christian König:
>>> I've stumbled over this while reviewing patches for DMA-buf and it looks
>>> like we completely messed the locking up here.
>>>
>>> In general most TTM function should only be called while holding the
>>> appropriate BO resv lock. Without this we could break the internal
>>> buffer object state here.
>>
>> I remember that I tried to fix this before and you mentioned that it's
>> not allowed to hold this lock here. It would possibly deadlock with
>> exported buffers. Did this change with Dmitry's rework of the locking
>> semantics?
> 
> No, can you point me to that?
> 
> My assumption was that drm_gem_vmap()/vunmap() is always called with the
> lock held, but Dmitry's work is now suggesting otherwise.
> 
> We certainly need to hold the lock when we call ttm_bo_vmap()/vunmap()
> because it needs to access the bo->resource.

The today's vmapping code paths all should be unlocked for the exported
TTM dma-bufs. My locking patches will change that. To me the Christian's
fix looks good. If there are out-of-tree drivers that do the locking on
the importer side, then we don't really care about them in the upstream
and they will have to adapt.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
