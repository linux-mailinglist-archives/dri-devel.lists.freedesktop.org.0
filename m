Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CA513BB2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 20:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E24A10E34B;
	Thu, 28 Apr 2022 18:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6525B10E34B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 18:38:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 26DAB1F45BA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651171094;
 bh=LUoHkp961qm9ko1OBtouQWFIA8PMdZVSkHc/jw1XS44=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Gfq++VVz0zfr6JFt1ax6Utc5gsxcHoJIm5n0+6KpdFYaHipbvdGcXdvSCeE4iToqp
 du8kN1/0uHwQg8uWiF4B+RQF5Sww9YSZq5/uKMtVA/iMrJpoVHRwu4GzEK3pbolvUJ
 jg1ZmnkE/osv2uVCh8aVrQt6C9IQJD2ZKuWW/JoS9vAPlelhwOMVOvLFQLl7P1FcXo
 5BjvLzIPrhmEhbIj7WYtdUGHWEGPE3rQG5GyqHDmwLWPDVIdQ4bc52/kZKjn1F1+7s
 0Yigqu3B//kV5MYZE6/sAzQ/uWp1VvY/pqlAFb2lGpLqAc3b5QYXQLKoaz7OW+Muev
 m55mWpLIa2xKQ==
Message-ID: <9cb2e7fb-1597-999e-59b8-586b5fd7f04d@collabora.com>
Date: Thu, 28 Apr 2022 21:38:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 15/17] drm/shmem-helper: Make drm_gem_shmem_get_pages()
 private
Content-Language: en-US
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Dmitry Osipenko <digetx@gmail.com>
References: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
 <20220424190424.540501-16-dmitry.osipenko@collabora.com>
 <YmqJsxHYB2DNBzX0@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <YmqJsxHYB2DNBzX0@phenom.ffwll.local>
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

28.04.2022 15:33, Daniel Vetter пишет:
> On Sun, Apr 24, 2022 at 10:04:22PM +0300, Dmitry Osipenko wrote:
>> VirtIO-GPU driver was the only user of drm_gem_shmem_get_pages()
>> and it now uses drm_gem_shmem_get_pages_sgt(). Make the get_pages()
>> private to drm_gem_shmem_helper.
>>
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +--
>>  include/drm/drm_gem_shmem_helper.h     | 1 -
>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index 25e9bc2803ee..7ec5f8002f68 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -490,7 +490,7 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
>>   * Returns:
>>   * 0 on success or a negative error code on failure.
>>   */
> 
> We also delete the kerneldoc for functions not exported (kerneldoc is
> geared towards driver writes). If there's anything critical the comment
> explains about the internals, you can keep that as a normal C style
> comment without the /** but generally there's no need for these anymore.

Noted for v6.

