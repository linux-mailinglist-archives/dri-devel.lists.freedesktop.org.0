Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934E183CEEB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782C10E3C3;
	Thu, 25 Jan 2024 21:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3772F10E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706219543;
 bh=HmHb/1j56mYypkJHtCxMuyE8iJQuLLhZ2r3pRbNJ0Ek=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=DjKPBOn5DkLFgqwP0WrFz5zmWSBPLMUa00i2AzL5gujzFWsxBQJZtLk7yLL4Fk3mw
 qmf8pOZT2aIxEOOBFymm2cbk1Njwpow9/hYB9Dk8zf/mhLP307VzkWdqq4xBJF8wLf
 tlsvHel51nr4LS9KByd5zZvHCDSOwM61iCe7TAo8h0bWYUdSRNwZixl4i54JTwVIm6
 yFQaOuEc9iAfV7ZRTQ4jdqHSm1HsPVgPgqP/FIYD2UOvIMWRoFH4wpvvrVhztuII52
 DN7YkZbkTJfLwGjonrp80UCfEH/C+yzfA/rfDazDfJeZw/6PzT2FLOrO2Mlo4WEFVO
 a/Iznos2DQfjg==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C958D37813DA;
 Thu, 25 Jan 2024 21:52:21 +0000 (UTC)
Message-ID: <ddcae9fe-6155-4542-898c-bfb06e8721b8@collabora.com>
Date: Fri, 26 Jan 2024 00:52:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 09/30] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Content-Language: en-US
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-10-dmitry.osipenko@collabora.com>
 <ZbKZNCbZoV4ovWTH@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ZbKZNCbZoV4ovWTH@phenom.ffwll.local>
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

On 1/25/24 20:24, Daniel Vetter wrote:
> On Fri, Jan 05, 2024 at 09:46:03PM +0300, Dmitry Osipenko wrote:
>> Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
>> lock if pages_use_count is non-zero, leveraging from atomicity of the
>> refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
>>
>> Acked-by: Maxime Ripard <mripard@kernel.org>
>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index cacf0f8c42e2..1c032513abf1 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -226,6 +226,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>>  }
>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>>  
>> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>> +{
>> +	int ret;
> 
> Just random drive-by comment: a might_lock annotation here might be good,
> or people could hit some really interesting bugs that are rather hard to
> reproduce ...
> -Sima

Thanks for the suggestion!

-- 
Best regards,
Dmitry

