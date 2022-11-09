Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E06232DF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 19:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70F210E618;
	Wed,  9 Nov 2022 18:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CD510E614
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 18:48:18 +0000 (UTC)
Received: from [192.168.2.122] (unknown [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1AF8466029C3;
 Wed,  9 Nov 2022 18:48:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668019696;
 bh=HqPD8JhaCO33vjM9HvhqQQe5npl+/oagnjrYCxOv+Gk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V4kTlhmprYtAsRaQqn2mut/x7XOwso0ST7pEO3IVukE80DAxz97xRbcIqaw32lfYm
 pKsxTgNMEqWa1/MmE73at60ZgBfPXBQxDF5ewdIYjByS7M/kjyEol+8DhvTPDnv9J+
 c19NbtnDMpLmJTeRHsiUD1mf2t4QbHaIg8DbDyQzzaWGWRAlHMkrwIxDbAY8UvzUmF
 QQXmfS73Qa7PqtfJxaKgMw3U1d39EseOGrMDjfgf+Ne2QPket1mX5qNlVgW7gBZDGq
 TqzmJxRHibw/HQLZFtdhemvBfZQHZNRF9mNe17lydZ5sK6QdDC5PKzKBxUxbclVWMq
 I0tk0zLRSkqog==
Message-ID: <f2d96471-5c72-1529-2e82-382260335aad@collabora.com>
Date: Wed, 9 Nov 2022 21:48:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v8 4/7] drm/shmem-helper: Add memory shrinker
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
 <20221105232719.302619-5-dmitry.osipenko@collabora.com>
 <077ad468-335e-c3cd-2f18-557d3ecc3bf4@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <077ad468-335e-c3cd-2f18-557d3ecc3bf4@suse.de>
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 11/9/22 13:28, Thomas Zimmermann wrote:
>> +int drm_gem_shmem_set_evictable(struct drm_gem_shmem_object *shmem)
>> +{
>> +    dma_resv_lock(shmem->base.resv, NULL);
>> +
>> +    if (shmem->madv < 0) {
>> +        dma_resv_unlock(shmem->base.resv);
>> +        return -ENOMEM;
> 
> ENOMEM is not right here. It's for failed memory allocation. ENODEV
> seems more appropriate.

Had the same thought about ENOMEM and at one point was considering
ENOENT, but in the end decided it's not much better than ENOMEM.

> But why do we need an error here anyway? Why not just fail transparently?

I added the error handling everywhere for consistency. Perhaps indeed
will be better to fail transparently for now since nobody cares about
such errors and likely won't in the future.

The rest of the comments are also good to me, will start preparing the
v9. Thank you for the review!

-- 
Best regards,
Dmitry

