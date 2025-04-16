Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A5A8B1B5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA4010E853;
	Wed, 16 Apr 2025 07:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="K3Af9Mcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940A210E853
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 07:08:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744787320; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HHBvq0NGJ2eF770FU5GG/1dSU+Pp8UiR1V3orbxWCnR456v1wGZdqQPu08DMBYtgXHPZM7KqbIhyF6SpVGfl83XumFeEBW5SMgm+dhKehcMXXHq+KpRtJWmTEw3ZCm5XHCF2Zs3GFXToI8iGjMfOp5wmwwsi+PD5Ryry+v3jFKU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744787320;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=/yqJ8y8KREoexVbGgiSv3lKFcw87irrL9VHeHd+VyMs=; 
 b=KrFL5bLqjy/JjTDRHQ3oMlLx3eX4ydsyXWT4Puew+ooPC7O5/SkNV0t37NyRuLWBzycVU4+YRObTRGS2xRUDE064M1QP5qLMDDge0XcPYLZkZu5a3pLAlLnQHiXzw4jqYlPGJFiG6Ypz/lW/0SgkTnZKqGtls+ixvbEGroMYLQM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744787320; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=/yqJ8y8KREoexVbGgiSv3lKFcw87irrL9VHeHd+VyMs=;
 b=K3Af9McxCyi8UkTNdrSryMDyNSwYOwjXytmbQqbxoygNoh4Eru+zkoEkV0ZDR8fR
 6Q2NH2QUyLMxr+vI1E8sEmK4NMhO3Q9Mbd4WYZC/2c/u4kFFc4CqT6pgYxqmItsl6SV
 kWeLSh6hMa5H3n+pEVnQrYeYmppoAKcFg+DgSnQ0=
Received: by mx.zohomail.com with SMTPS id 1744787318494319.03897271462245;
 Wed, 16 Apr 2025 00:08:38 -0700 (PDT)
Message-ID: <24bc034d-45fd-4d1c-bed7-216a2592f633@collabora.com>
Date: Wed, 16 Apr 2025 10:08:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Support drm_panic with non-vmapped shmem BO
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 jfalempe@redhat.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250412132012.291837-1-ryasuoka@redhat.com>
 <82de8253-7be6-40ed-b4a7-c840b3b46362@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <82de8253-7be6-40ed-b4a7-c840b3b46362@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

On 4/16/25 10:05, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.04.25 um 15:20 schrieb Ryosuke Yasuoka:
>> Pass array of pages of the scanout buffer [1] to shmem BO, allowing
>> drm_panic to work even if the BO is not vmapped.
>>
>> [1] https://lore.kernel.org/all/20250407140138.162383-3-
>> jfalempe@redhat.com/
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>> ---
>>   drivers/gpu/drm/virtio/virtgpu_plane.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/
>> virtio/virtgpu_plane.c
>> index a6f5a78f436a..2ff57d559c86 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> @@ -500,11 +500,19 @@ static int virtio_drm_get_scanout_buffer(struct
>> drm_plane *plane,
>>         bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
>>   -    /* Only support mapped shmem bo */
>> -    if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo-
>> >base.vaddr)
>> +    if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
> 
> Please adopt drm_gem_is_imported() instead of testing import_attach
> directly. The helper is available in v6.15-rc1 and later.

Hi, I rebased this patch locally on top of your drm_gem_is_imported()
changes and will merge it all soon.

-- 
Best regards,
Dmitry
