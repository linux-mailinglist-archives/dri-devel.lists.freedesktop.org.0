Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3086365F8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 17:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0814210E5B0;
	Wed, 23 Nov 2022 16:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F2410E5B0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 16:40:17 +0000 (UTC)
Received: from [192.168.2.109] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 009BB6600367;
 Wed, 23 Nov 2022 16:40:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669221616;
 bh=9jAcNG5mmc8WdRcm1FU/6k9HjRgP8OF/p9T3eXcNN5g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y4/HSy/fWd8Zgc3i5mYx/xGvm7+frMwkYiTm2sHW37EP882UGsVPbqeHZ8blbQQY9
 sPiKyi5LJsSKrVbRvyu2iq4EfFsI//PPQNI6WQ2XEGiru4Uh1mHFdOStdEvNns0qai
 V0rXdL0fBs3gGPdPbKqZSOFiLxl+H2iJxnZAbuyEuEF+FzUg685TWWUqR99/v0SKKW
 +MRB89IfKmwxp0XcVLLiWD70lF10fZdq0GLMXchbnEgvtqFXWGYbSuTRZ0cbU+qu2u
 OgSjhAYlVVgO9/+EPZno8IcvUkRSALHakD89Cb0buTjFS9kP7TCDrBUC109IUvMgqB
 Fmw5sowFqxNKA==
Message-ID: <2d63940e-1cc2-a03e-a253-dac4d697e7d1@collabora.com>
Date: Wed, 23 Nov 2022 19:40:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v9 03/11] drm/gem: Add evict() callback to
 drm_gem_object_funcs
Content-Language: en-US
To: Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221123025723.695075-1-dmitry.osipenko@collabora.com>
 <20221123025723.695075-4-dmitry.osipenko@collabora.com>
 <f390d9ec-e8b2-a10d-bd2e-011ec879c615@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <f390d9ec-e8b2-a10d-bd2e-011ec879c615@arm.com>
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

On 11/23/22 18:58, Steven Price wrote:
> On 23/11/2022 02:57, Dmitry Osipenko wrote:
>> Add new common evict() callback to drm_gem_object_funcs and corresponding
>> drm_gem_object_evict() helper. This is a first step on a way to providing
>> common GEM-shrinker API for DRM drivers.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem.c | 15 +++++++++++++++
>>  include/drm/drm_gem.h     | 12 ++++++++++++
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 299bca1390aa..c0510b8080d2 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1458,3 +1458,18 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>>  	return freed;
>>  }
>>  EXPORT_SYMBOL(drm_gem_lru_scan);
>> +
>> +/**
>> + * drm_gem_object_evict - helper to evict backing pages for a GEM object
>> + * @obj: obj in question
>> + */
>> +bool
>> +drm_gem_object_evict(struct drm_gem_object *obj)
>> +{
>> +	dma_resv_assert_held(obj->resv);
>> +
>> +	if (obj->funcs->evict)
>> +		return obj->funcs->evict(obj);
>> +
>> +	return false;
>> +}
> 
> This function needs exporting for the module build to work correctly.

Indeed, I missed that drm-shmem can be built as a separate module.

-- 
Best regards,
Dmitry

