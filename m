Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556D4985B57
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8EF10E807;
	Wed, 25 Sep 2024 12:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N2B8o4WI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727B210E807
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WUw2kz//RryNutTRL7T5yEKVFZR7FjymovdVFaq/f0M=; b=N2B8o4WIVVWhSOX86wLH5XUsnO
 ufiVPtJlbkqsG0dMlez/ELVAZJkCt6Xel7hsjeTgBzFDPCXEwXE7vwKLH+7U5gC4bWWFFDOZO1+/a
 A399zQI+ihnerbyr5tLyIqa3wJ0RFPPReY7RIJ+YTaAtO1HUjt6T4vws44cmaldZhA/cKsCNKCdib
 OS+bh3AurtydLa3WidlnRtVATPikaoixIow8zJa17ITI6rrFeoYlrMiNuMFk6vligLcKkF9pFgOct
 nyi/2DbflZRTaPJFvBx67O/MGnhaN2ZOVvgdE7sRp8sd6uLMhQiVukHyMjxLPJng2uHS/35+BJpir
 09oB2zag==;
Received: from [191.38.219.183] (helo=[192.168.170.5])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1stR0s-000tvX-0l; Wed, 25 Sep 2024 14:20:58 +0200
Message-ID: <b7cb3f17-1b2c-4327-a240-14e1685a69e4@igalia.com>
Date: Wed, 25 Sep 2024 09:20:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] drm/v3d: Expose Super Pages capability
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240923141348.2422499-1-mcanal@igalia.com>
 <20240923141348.2422499-12-mcanal@igalia.com>
 <e90e4fd6c03d30e8b43ef8e492767977b1e99ad5.camel@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <e90e4fd6c03d30e8b43ef8e492767977b1e99ad5.camel@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Iago,

On 9/24/24 02:30, Iago Toral wrote:
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

I just applied to misc/kernel.git (drm-misc-next).

Thank you and Tvrtko for all the help during the reviewing process!

Best Regards,
- Maíra

> 
> El lun, 23-09-2024 a las 10:55 -0300, Maíra Canal escribió:
>> Add a new V3D parameter to expose the support of Super Pages to
>> userspace. The userspace might want to know this information to
>> apply optimizations that are specific to kernels with Super Pages
>> enabled.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.c | 3 +++
>>   include/uapi/drm/v3d_drm.h    | 1 +
>>   2 files changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
>> b/drivers/gpu/drm/v3d/v3d_drv.c
>> index 8be8c6dd9b35..fb35c5c3f1a7 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>> @@ -104,6 +104,9 @@ static int v3d_get_param_ioctl(struct drm_device
>> *dev, void *data,
>>   	case DRM_V3D_PARAM_MAX_PERF_COUNTERS:
>>   		args->value = v3d->perfmon_info.max_counters;
>>   		return 0;
>> +	case DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES:
>> +		args->value = !!v3d->gemfs;
>> +		return 0;
>>   	default:
>>   		DRM_DEBUG("Unknown parameter %d\n", args->param);
>>   		return -EINVAL;
>> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
>> index 87fc5bb0a61e..2376c73abca1 100644
>> --- a/include/uapi/drm/v3d_drm.h
>> +++ b/include/uapi/drm/v3d_drm.h
>> @@ -290,6 +290,7 @@ enum drm_v3d_param {
>>   	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
>>   	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
>>   	DRM_V3D_PARAM_MAX_PERF_COUNTERS,
>> +	DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES,
>>   };
>>   
>>   struct drm_v3d_get_param {
> 
